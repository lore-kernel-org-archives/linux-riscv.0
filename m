Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7D8CA0FFC
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9+MTxhkZ5ugl1c/+5Kl7rfB6rRb6kFl8Xgak6YgXlUI=; b=j+FItPzpRtBumY
	eJsjrF/Sc1Od6auiHIq9CfmIr/xt6+KRkgPAsSZARG1vUl5nN/jwb/nzxsjbAbOu86W42Z2pg1hmy
	i8p4KjMeQETtEQEmd8zV3hRZk3vT9Eo9YLdDIpVIOiTje+uY6wMLlBMFz0wS2GcR6JaQJvb8QJ0Bk
	8etQRcuC+xfA6ov/tFITeEZartvu8lS99VtAaH2Vru63C/iaP+CE93/AaWU6RlPcjqbuIkfKsKQlF
	+LKMGab7GPR2S7O/eXZdfw0IGd1pCVixiPzCnQInzIDaX9+mk1ggg9yzGZjl88JjWZxto6DDC3JY+
	0mqgr6kEXLq7lXygQc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urApz-0000000ETah-2etv;
	Wed, 27 Aug 2025 07:44:55 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAlW-0000000ESiU-0zjr
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 07:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756280366;
	bh=QThF+75mvK0D3/F6dA4IaBzJtaqxmaQQfMku8hdTcLU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=X9e82ra+UZk6wyaSHOZebatzg1SIdqjXQcgpp4iY2odibpR+NO7rmxUL6ahpQ0a3+
	 Fk6AnfCgMTyTBZuhOlqX23igcQyFjAxhyilKnf7dJ1HmNpLOhktX+cSHHkmQCtG3/s
	 lbMONpTsCeszuT4U7W6lRDLpHu34xoOoHcrgC10Q=
X-QQ-mid: zesmtpgz3t1756280359t6c5d6c34
X-QQ-Originating-IP: B+Ve4HLvlUCXEtyPvRob/G/ByVcmx1LXXi0796ksh6A=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:39:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9113250506104618191
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/6] i2c: spacemit: fix and introduce pio
Date: Wed, 27 Aug 2025 15:39:07 +0800
Message-Id: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABy2rmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0MT3WxD3UyjZN3EkvzczGTdNMNES4PkFGMTYzMTJaCegqLUtMwKsHn
 RsbW1ADEyFLVfAAAA
X-Change-ID: 20250814-k1-i2c-atomic-f1a90cd34364
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756280357; l=1053;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=N1l9BD5aYzgsunuAJ2sdFXf5Toyl9HnAD50ZzdGOxBs=;
 b=DQOw1nUJeivhvEv6BmN8IqO13q0xCkaMKMz4pAupEt8dG9dXLnWPpoLx+iK588WpW+gP8M6Re
 ouclWmnIF69BNA4zp6EBDYpp1OlUQ4L+3dVEvcMUG4kw1r6TRxU11GK
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NlrfLQhmr2s5GmGI1P9u1XcpGzMBnCyEsWY8IvJNvGWafmBtIE3X+N6M
	JKI2k5ZVP7Mb9CHFjx8fhKgZFvWUWsCsAW7YfLAa9SKRwS/YqLpY4jyIFzkdyFTuuM5grsB
	SunVAoQtHzMYPZUDdQXy/dz3V0N3J5i6LeIVg9Rbn0X0LllEcYWiNJShbVRjyyjquRotIlU
	TqROa3n0MAPFW768X4mTTxtMJSONkoIdZDzJLt+VKZb4a2qhdWaQOA+FfS8DAR7cClw/kyM
	JF335d0N0avPcJZqV/GaYMHfBCXXyFEW5G2U2PO6Cz9BBI3asZAuWz0YjydopYUpEOQ4/Dz
	uQCF41/6LFvkgOvG7+cATD1qI8CDx96GfQjI/fkWgmvNE8fzh9x69zhkQKG6kME9ywlh0wl
	nSwVyEG3x49A7EmmhRzs8Ineci1BtaaeHwfswME0nJBDM25TtFH0jpoPXPI9igg/9HTyA11
	kG9sK0XF2vIm+YYaiBbjaxYZcIr0x4Juaw1PXMNOxO0oSSZIGGQ0dGK4j3ZYEw0KcRLl+6w
	etCnzz5HfAa1G17epYvUn7soI+CkGuaLPiD8MDvZ96g5bMq9XMYjHdO+TeYBEnhd6Nc9t2H
	wWSgDWhR6nB+J/nP2cw7KhaYFywYzd9Em3en23BOPsDRzNVMorPS5AD+mfHgoEBGYiC+Ocf
	xShyfRXPtAWAb209g9z+E4r8O0TdPLKqDZF6ICFRStCJwbPOA3RDh5Hf3zuCrA8CNg0uja9
	Y2ykyqor3CZjF+IyOWrDc/jMz0USgQ3f7zxT2M+yerSPX/HN2d2p4tyudZVWqRoKynfuWO7
	dK9vq0w3mJ0NRycWLtgjtMFzCkHxKZrPZlndxkWRq5P2FGT8X7i7FymHwV3Gpeirbf2W3rr
	7dEBdljI60F0nK8PiPOV+fPKf4H/7guXR8cRUmm6WuRgrNGAo2eeaehlQpPT0dOA1EKY/cX
	Wazdm2+Hysd891uPyUGg0P6eEUzU7wcxU1TZGGFdwcdBko/5ffYXdRUe8Iv4HNDQu0T++51
	C6eQzTEcBTTr6FMjitYfYZsdi6us2cB2uvf2EVL8r/XnPmhQD74sYIWmMb2Euz5GlSgvzuj
	hwIUBNeiOivESBLjz16xJ973XKlXjBxqphEHmQWNKdm
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_004019_160089_43E48BBC 
X-CRM114-Status: UNSURE (   5.76  )
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

Previously, there were a few latent issues in the I2C driver.

These did not manifest under interrupt mode, but they were
still present and could be triggered when running in PIO mode.

This series addresses those issues and adds support for PIO
mode transfers.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (6):
      i2c: spacemit: ensure bus release check runs when wait_bus_idle() fails
      i2c: spacemit: remove stop function to avoid bus error
      i2c: spacemit: disable SDA glitch fix to avoid restart delay
      i2c: spacemit: check SDA instead of SCL after bus reset
      i2c: spacemit: ensure SDA is released after bus reset
      i2c: spacemit: introduce pio for k1

 drivers/i2c/busses/i2c-k1.c | 202 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 163 insertions(+), 39 deletions(-)
---
base-commit: 5d05b05c7086628473f01e860c63110d1b42cd29
change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
