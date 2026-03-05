Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A0DEFCE53
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 01:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iEgJHzIGdJWGHDew0pxtEX3MMryKOhRKQD0jJEOrhbE=; b=Yhm+eVV7etuGNv
	wcKCEm5KNKxAmIjr+aiN6TahrKxXtxxoI5vESUaiiNkifUjXL3HVNQAH1Jy2PrQs6rrwf3yhY+EJt
	y8YXdYQXHCuoRt8O9ZPaQEf5qDs6xzzdeqnWAlPfuMrvr9MYlR11jzSJk4kcYQoNmx0IO/+FmHHrr
	bnVeMW0jMWRD6KzTTRM+/3nO4Eh2cPtmIjjCJqSh2YO7Nwe3gYy424hFeaIz6G5m5HD2G7rEh/EN6
	CoKeWR4MmLMZDbEr7psblXyD1YzunYFGHuxGh2XPRc2TTjK/j2PY36bo3hJe/i//VGuiCt+R134/i
	PhDB1MUCxu52EE+2A7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxx5Z-00000000ixe-3gLH;
	Thu, 05 Mar 2026 01:01:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxx5V-00000000iwr-1na5;
	Thu, 05 Mar 2026 01:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA0316133A;
	Thu,  5 Mar 2026 01:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6E1C4CEF7;
	Thu,  5 Mar 2026 01:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772672471;
	bh=UMf7X17drXT/2m3cWxTRejsoT3RPHLdFCh83qDuKhBk=;
	h=From:Subject:Date:To:Cc:From;
	b=UvYRAxs+5RBEHlU+mO/Rd//PPziY/Xp6IgtnSnxz5RD7A6WYTXbt1ertF0Dv+h7H/
	 u72OAbDxv6m/cXSyF3qEa1VUcpAAU0cR/8p9kvz/s51DCKC0p9/F/MmdgvnNws8Vfa
	 myAFM+BphtYhlPllOkDACsX7hzJwaZFLbksMcdt/alJxrjCBbOnCx0g8DYKR4YURdr
	 iJydZMQlykUT4hpLWQfOhh0pCoQwYbCMHrghAtKMCbAnj/zKiGD/NxhEwVaIK48G1c
	 4ZOXcy3RkofLu0fxFdv35nodEBSHOH66k5/8PoXwf5w4cw/jwK3rdPDcqzBybTYvmM
	 WJ0+43FsH8xSQ==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v4 0/2] phy: spacemit: Add USB2 PHY support for K3 SoC
Date: Thu, 05 Mar 2026 01:00:50 +0000
Message-Id: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMLVqGkC/13MQQ6CMBCF4auQWTumMxQUV97DsLAwQIMB0mojI
 b27FXcu/5e8bwMvzoqHS7aBk2C9nacU+pBBM9ynXtC2qYEVl4pYIxGOOb68YVyGFRtd5spUlTL
 UQTotTjr73sFbnXqw/jm7dfcDfdcfxcT/VCBUqPPidC4q1qpor6O4SR7H2fVQxxg/GC/Vwq0AA
 AA=
X-Change-ID: 20260124-11-k3-usb2-phy-c4630b990b1f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; i=dlan@kernel.org;
 h=from:subject:message-id; bh=UMf7X17drXT/2m3cWxTRejsoT3RPHLdFCh83qDuKhBk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpqNXKdJlZsM5D/2qcw85wKs1DVGjsO17huAdmw
 T0AbvuC5Z6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaajVyhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0V/A/+IK4XZuOOeywg4wwMq7NgDKjI1PO6lVmwLNATfV5cC6jS8o28OxsWy
 n8Y3ZD9Pj587yWj/whTswr+5zBu4jEZHksWZKZ++UkV+CWamqawtiz/hnoWXUinN5kX8KFbgQhr
 AifrUMoH6rH6U321etwiwtwX1M+qJ41mnUGav6Hasz8tOztNEbxk4nm0iJlv3Q4NBFY5w0uxHvh
 Rn0sqpVMhxjxykqvbzcFLZqIOv/GYh8XW8UV3457LuSbCvHN+Gk3TS1me+Z3Aq/4NyG5uav6pOo
 nn15TsHjKhokRbyyAV0PRI1PHgWQkgmbLNX8T/lzr2zSVZ6M2eFTzhz8GLj8ah+CLTvi+yB99mJ
 bxb7IlSsGFhYzFey8nN8duqKpYhjMxqdx0CFXBoywWP4f02kpPlW6W4Fm15mA/j3ThvycqBowlX
 2SKfw4of2mIS9tb03Y7M+3jxFDXtXv1D4Y7Tn9eZhvpuWVyxemtKARWY9RqIEoRAHnt4X+TaTx3
 cRCtg5QeMW+Bq6LZHs6iRcNihQOiLPbZVvzv4+PvnY+uAIpdYvQvTdv/qtOW5KiOua5l2KDmQ9r
 Hul04mDlzP+IG7LS3UsFtZftwLfht4gGuDFuIbt/+Af9cBSULv1nM1EuIKjz36GIEEfWyUCpKC0
 IzJ+FY4iOZWUdpm3TGvQonQb64gywc=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

The series trys to add USB2 PHY support for SpacemiT K3 SoC, while 
patch [1/2] implement a disconnect function which is needed during
next connection.

No DTS part has been inclueded in this series, instead I plan to
submit them later while adding USB host support.

I've collected all patches and pushed a complete review branch here[1],
for people who interested to test easily, which include DTS and necessary
changes, other patches may still need to improve, but sufficient for
verifying the functionality.

Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [1]

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Yixun Lan <dlan@kernel.org>

Changes in v4:
- rebase to v7.0-rc1
- fix preceding open parenthesis
- drop patch 1 which already merged
- publish a test branch
- Link to v3: https://lore.kernel.org/r/20260216152653.25244-1-dlan@kernel.org

Change in v3:
 - split from v2 as bug fix
 - fix alignment to open parenthesis
 - http://lore.kernel.org/r/20260216090112.n5jjpui3luqsybb5@skbuf
 - Link to v2: https://lore.kernel.org/r/20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org

Changes in v2:
- collect ACK
- add Fixes tag
- implement separate phy_ops
- Link to v1: https://lore.kernel.org/r/20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org

---
Yixun Lan (2):
      dt-bindings: phy: spacemit: k3: add USB2 PHY support
      phy: k1-usb: k3: add USB2 PHY support

 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  6 ++--
 drivers/phy/spacemit/phy-k1-usb2.c                 | 34 ++++++++++++++++++----
 2 files changed, 33 insertions(+), 7 deletions(-)
---
base-commit: d2625d793eefe7dff154361ec66fed7886781d73
change-id: 20260124-11-k3-usb2-phy-c4630b990b1f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
