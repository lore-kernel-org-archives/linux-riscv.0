Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B395CCD3427
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 02:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GfkJWBg0RI2MD4Dhqq5VT5EG6TN+yo0T8NIe7zJDbHI=; b=46xNq1KqydDqk2
	5k/aQWG2u/rGg4DFTLT0av5RBgzbRHUVFHTqDBMdWIp93LCbgsbNHF3ivGFlN+6hp06JEqV++D/bs
	ybzIpVESenHQJ6OKbaNFZ/0A1XuIPVoMwFB9P1ufgX8OckBEDKhoxeFm0ckdodKdgX1B+UNSuLfXi
	FxwrW8f6a09WfPuKig6btmO1KWXMfWVIwb0A0Lt4J4ofOM6OO4gtKsWcoDHNCVRPV9bXKyCdQJtrs
	7dnSBNzxt/J3a/OxCpOHpEWN8WFBjAuwKs6ZfBsdr+nK8PaSLDLXCchVXTDHqLP720Z7oViMfgvV/
	zcVFY0Ule13PFHX2OBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGrm-0000000C5wq-0ZDN;
	Mon, 11 May 2026 02:59:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGrj-0000000C5wQ-3hk0
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 02:59:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB43F433F1;
	Mon, 11 May 2026 02:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26187C2BCF6;
	Mon, 11 May 2026 02:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778468370;
	bh=S1Ifud5t8JJxvGqDWbof938U6z4/llAjMGWNNOe7Mk0=;
	h=From:Subject:Date:To:Cc:From;
	b=a72yNHC0RMbMfa9tfdun9XhHo0CSf32T+ixVP1sUIsP8YsSJaKiP8JZvdOjwWJHXS
	 wnVNhADF28Bt6j+k5MwUB/Jwx86SuklQ3WYqnEBAisM8SNhkQOu67EqMW3ZnZZO97y
	 JUJJwaqvkjM2RFr6hixyyHKFXFBt5tEf86SE1tfJF5pZIjHKSDfmVmKUqTGJIwF9PB
	 07axAdSA7q68362G4JR8UrvYtqSozSK05oQ6/1Cfv2fzWUuMPuMJjtPuaAXBOluHND
	 CPSIJ6sde2/+aLCQ9INvSAhj5VpSY4DHvpbx054xKj1dydPwt98sEBbK651DmjmqBC
	 w+1Oq6N9AgnMw==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/4] riscv: spacemit: k3: some clock fixes related to
 PCIe
Date: Mon, 11 May 2026 02:59:08 +0000
Message-Id: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPxFAWoC/3WMQQqDMBAAvyJ77pY1lqT01H+IB42rLkoiSQktk
 r839d7jDMwcEDkIR3hUBwROEsW7AupSgV16NzPKWBgUKU23hpA07lbQbitO8kYu9m4GMpoMlGg
 PXPQ5bLvCi8SXD5/zn+qf/btKNRI2ahqtMZZUPzxXDo63qw8zdDnnLzntmfmtAAAA
X-Change-ID: 20260430-06-pci-clk-fix-e60487b07607
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=dlan@kernel.org;
 h=from:subject:message-id; bh=S1Ifud5t8JJxvGqDWbof938U6z4/llAjMGWNNOe7Mk0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqAUYAAYyLqXlMo9g1SdoSkiNQPGLsDFL0abRGK
 6EwI+oR/7SJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagFGABsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2uzA/9FKbGiPxW6pHlT5ew4GfYiukIp5mf3Rbn3m5HeJcknRhRYrIncs8Ur
 bgtTM+d6RM/A7pBBrqxfhXkuNgHGoT9bq3vUvCBmUBK7d/6t1WUxcPncLMTff/2IkffThwsfK6J
 l+Ckha8hitUJC0tThHTRWduH/d61wVn7xN9Qqq5NMqmWX+WF2+oNaA3BsyBvTCQ5DbSh6r/MjRC
 yqI5CdLPuTaQSuf+Fas2bhdUOs4qf1s0bMkCQPQHAzV/XfIjpn3f2ZqRAYn7CXNuyAj9mE3zcgX
 9onAB82Rs3KyL8viDoc6u14ng1+uXH2b6tUnB+dHs/yf3wDbaL2auMdWaDtWeqNCYL7jH13E+DE
 j11V6MBxtj/Oj9wDtWyALXkMPn7YMxqTtgpMT8idklLw74zyKcFo/OMyq/+dod1AwWF5/scGIzc
 nxvMIkRGNjGxHn6c7MkCZwTbUJSqX9nlgvmDNrUKy5zw6qUFtx46myfRU/yQ6tPHAYfuqnYdyXP
 cUsN+fzM2rwfDbj/L7wAyEJQDlGhR5uUizGpidwEoXGxS9Ufq1FJDbCofqq18UsiqhZ1/VorZV0
 +g0BcIRdzC8SjgMfWAwG0Kt3YPDRt8N/oF6lb/qOkCddqIp0wpW9Cms6L+5fq64TuyC6zDQYX06
 E7ofAxZER3pcd3c9S1uYfu+JUotDxk=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_195931_965204_02C85E3C 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Here are some fixes for previous patch set in order to make PCIe work,
Add PCIe DBI clock which was missing, Fix the parent clock, And correct
the PCIe Clock CTRL register offset.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v2:
- Drop Fixes tag in patch 1, 2, which is not necessary
- Re-arrange the order of patches, move 1, 2 as last two which is not
  strictly bug fix
- Link to v1: https://lore.kernel.org/r/20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org

---
Yixun Lan (4):
      clk: spacemit: k3: Switch to pll2_d6 as parent for PCIe clock
      clk: spacemit: k3: Fix PCIe clock register offset
      dt-bindings: soc: spacemit: k3: Add PCIe DBI clock IDs
      clk: spacemit: k3: Add PCIe DBI clock

 drivers/clk/spacemit/ccu-k3.c                  | 30 +++++++++++++++++---------
 include/dt-bindings/clock/spacemit,k3-clocks.h |  5 +++++
 include/soc/spacemit/k3-syscon.h               |  4 ++--
 3 files changed, 27 insertions(+), 12 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260430-06-pci-clk-fix-e60487b07607

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
