Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADDBCA0EFF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lK3SD8DkQ+ZiXnaRwpIZE638bLinDMuKcdb3hebfr0=; b=b800fq2qBZ3Bb1
	yozY3gZPtHPxwn9Rp6VZhIjvZBXrPRp7GSLA88GeQoyhbEOzAZwsCsq+s483vnGzZhQNaSDFIW3zm
	BYee3cOdmnDX9PpZqXablSKaTuHx/B+8CdfB0JWzyscgRcWRnlDD2R4Ne32ufc9YVI7ai0O48zFtE
	K/j45zVVawz8nnforDgPeU9R85wWAB/6xvNbMZ3s2C3QQuHsmoLXk/YuwIT7ToTjddD5Hw/Vi0nVu
	35yxEaWvgwKikhkuvJVXimJ0M8Nx9wT5ndhzler+KFa18Io9i0Szd3i89teKj/5hOPkaPNvo4+i+E
	4xKHeHBk2nYfBmzQPWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAq0-0000000ETav-0zyn;
	Wed, 27 Aug 2025 07:44:56 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAlX-0000000ESj0-1tIb
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 07:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756280368;
	bh=Hyx3ymaEGNzBK4ghZhgbXN2uPhad45k6Uk8y3I6pyjI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=wpRyVp7pbXZQrxlVCxcAVxo82mwG8M7btdd1oXaPJYMK2A1Uuc75cKJ43pYN0k/5g
	 DDt7iKr5HRMeO2WH/AyLIgcB+4QIDd8ZGwgkw+sGmRZJLGETD3OnOu8orKb7YEe4hp
	 ztYtY9i9lMTgOL93M327aogdkDwFMn0+nT2eo2+o=
X-QQ-mid: esmtpgz16t1756280361t7ea55d28
X-QQ-Originating-IP: tcnkU3el7is/5fUg3mVsc3eUfHeY/KFA8ijvRn1EyI8=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:39:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4976485597783889117
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 27 Aug 2025 15:39:08 +0800
Subject: [PATCH 1/6] i2c: spacemit: ensure bus release check runs when
 wait_bus_idle() fails
MIME-Version: 1.0
Message-Id: <20250827-k1-i2c-atomic-v1-1-e59bea02d680@linux.spacemit.com>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
In-Reply-To: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756280357; l=1318;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=O2naaLl5Cs0DMQ9yfCsYpaouL4CksC9CM4vilFzvkyE=;
 b=dhv6YDTotdlXwSY6VBfyfnMkAC83C/xlrMYrEQsEuUbvIoxzhr5l8Fn508+HCtvTsr6U0lyAR
 rYanvaW44ksAsj7RgVne5XldNicQPyGUDPBPd4GGUi0afj4gedXtwyJ
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NhTe9p7tQP4gmwaIF09oB5LgKGXsdFKTYDLGDqFK/Ut/fbgJshsLzspC
	t7LpguV0Q/zHpaBBuwe1IuhKVWYkF/uekP60nDVA/54cms3H8AytN7QYzN5bJZArpDKKJUl
	zowVTef9kpZwS4QwgXipRgiagYFhkV/NhhQAMAEW/qb/gZBbaW4KagzeJ/NBfeKT5o7/4QZ
	G9WZwSwUo2DsJQk3XnBPus70nP52S/p+O+uPPt/voNxTbNMikyJtyAepSCy6odZQd3nk0sL
	ZwZ9n2Papp26Qz9iMIvriF3xxr+uwIGZ6o+3tAEdc5mnFVVFdC7I+ZmH2tbYWDPbT2dp25b
	RTtbH3fXB22t8cSvg3zpcO7EsGdVlVPrxVwdbRcPxBkKSXm2PGMnWmV/WpwRv0KD0OhpdlS
	3TkWr5AVBM5gCH/0MRO5WgOh9Dx3NlTwLpERSaGwDCcV1RdqBAZ9jE14uWkBcSog5XubD1c
	sWtHfIDu7sf6JTZyB+G5sWgMsIG0La6BrnOWx4PfFxUyySwh1VLovcg0Bp0XppQlH/GLy9h
	Te82ohaj0PN0q9tw0pnx7leZe29Fa8n4O3NLyuljBhlz1mqYMolLOZ+tqDnlAbZgIcBxGTm
	eBhDQES4KU5Hof4dQX7RIzs6c/ZjWr5qBax/ozYdJCSTl5xbypIzbJqRTIS3V1ixGufxYAX
	WB5ibrcM9HzeHcFok4+IP/gc8QE+V03q5LhhxHlF5B6E2uDU+PDhPWlnZMrdW97ai5sSzne
	keRxGqlAEZO8+Zf+wZS0P3AtIXrUs1baHx9Ap40cR1+9iH2tW2UIUhYzsZF8SAwmdgp0a2D
	n6yzqPy2MBbyKcqofhel+InEqqlBVL0/+mM6atzVYjYEWwYuwVOBNvm5BwwH8F65WsnE9YA
	kFMDBRA2CUCuX9a2KR6m/2lIhbnrDIMeGx6T2XVhHvxY0MWAwYkwDOOwcxz6x62XN4+8K2R
	TPpxNkMpUcxyfNP9oxoP8b0+KbEQ3TH4nAG7ClrlSre1Lx7sPrrTilPm5mWAH57iWivooGZ
	Kq/hPjWallDZBvT9srFF2m93D48agyA8JFkyMnDJ9T7Yex4hPtTUEM8TD733sjQjyQT9onI
	hz/yKCleadlfk6d/vT7oMO8gZ19bB173GT1LwGKzgRq
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_004020_393075_705D51D6 
X-CRM114-Status: GOOD (  10.62  )
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

spacemit_i2c_wait_bus_idle() only returns 0 on success or a negative
error code on failure.

Since 'ret' can never be positive, the final 'else' branch was
unreachable, and spacemit_i2c_check_bus_release() was never called.

This commit guarantees we attempt to release the bus whenever waiting for
an idle bus fails.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index b68a21fff0b56b59fe2032ccb7ca6953423aad32..ee08811f4087c8e709d25dd314854ed643cc5a47 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -476,12 +476,13 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 	spacemit_i2c_enable(i2c);
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
-	if (!ret)
+	if (!ret) {
 		ret = spacemit_i2c_xfer_msg(i2c);
-	else if (ret < 0)
-		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
-	else
+		if (ret < 0)
+			dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
+	} else {
 		spacemit_i2c_check_bus_release(i2c);
+	}
 
 	spacemit_i2c_disable(i2c);
 

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
