Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C4AC5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 10:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fFfXdTKaDu1000pC0VOPH4Xhb2r1lVNJ/lewhJV2ZeE=; b=eGKHDNtK8Tjarq
	kDl2kDQJVSCRdMTflUYuwZMrYyVoAmZHX7yliv3FMK8euR+NXwPRDXX9+/XV2FM2KmICJan7cGzJ+
	CzG95LVwBMrxOaqCHf/B70QrSgtFY3kv2HifnaHbPWoO983/QnHxQcB/MY73tRkh4xFCdCvWwwV6z
	sYGwQzStnvrVGvwJH5IT88p2kFWAdO471egavYKxORYNXGZEuwiyCnkGyOJJ+ilDdasWvpyTHtuev
	uRG+Gt9pN+t/Aa+WXJTVnfz3pDPftfgCHyHoAYQWZEVZOJPNV7X1uWuZ4Qs0qjN86dsgSXlIZEzF5
	KBxBK98BxK8cLpwXx64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5bY-00000008d8f-3zEG;
	Mon, 04 Mar 2024 10:31:34 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Oo-00000008ZFx-328y
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 Mar 2024 10:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wDCIItz+0nHA+M7cX6cAlyye8JMgE2GXsEktMuU7ymU=; b=jmqqdN21+FtrHOO/FJAqXRaCMK
	jtPPppgKixCfwvZooipNdGyE10Ue16mUCSk9WQk/NY+iQF6iQJyL8DelZcHruzKoqbGxTnw/LSQ+7
	oeCVxT+oaon5uy8KkYtaRtpdsmoFHnUZtN9Cky9QX7uiIG32FVhSQ7nZNi4KQLlv9HMlqYB1GtKuf
	suenL1AuyZxjH228xG18NbIxGMFBSKKqzTVkM8nM+X4WmX4OTVeiFKBmYeTJXfjMabKESiE8V6Dj3
	9koq6g4jlyC2WirtfBnwornlhJ6WuUM5WOXuRZvt51z6BKMb0TNG4bVskgWmCrsh9R4/6FDw3kP5e
	8X+SK+rA==;
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Og-00000004nmO-2xMP
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 10:18:21 +0000
X-QQ-mid: bizesmtp62t1709547436tgx9g8d8
X-QQ-Originating-IP: 5APuCEWtsWVVSMzxS98Vxt66O3rkkYqE//ZKcb3vJ+g=
Received: from localhost ( [112.22.30.30])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Mar 2024 18:17:15 +0800 (CST)
X-QQ-SSF: 01400000000000505000000A0000000
X-QQ-FEAT: K2/klV1qoGlTWfl/w1BagxXdSiRmYm4VevULtmbJrZ7m+uuFIYP55sr8PKkvE
	LFZQXXHCr2EtSCCK5SmQK1O3CRe7068aVPwYQHDZCMfx7QBCLRqh9MtFSaXOyEVk4S+IfnL
	2/c6rzZrUKUayJFC/T2TuxVOdQKJPK4MvcEOso17dcNqbz53yLtACjYbYOWZKrry9iwT4rK
	XzDZJLmzJEfCUTJb7aJM8LZ5wN7nvXIEDScRqEYoc9zVus6PtEhY12m8BHXaIfrp3UvkIuq
	UmrF6GqiRFa+hiBGw0LgRdJa9CPzsujyNW9C5ZPnUspyt0oTr42TjiB9UjisUspC6pYOJY+
	VID4BefrRwRQu91VAot+KD4yuNquhwGHqQx/zo6dV5tqUydf5QcwodVxY4LKfdFhmVkUqnD
	1lKiJBNLonDN+eqHPG21JpBfAZ4tTl0e
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 11784876487773860519
From: Dawei Li <dawei.li@shingroup.cn>
To: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawei Li <dawei.li@shingroup.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] firmware: microchip: Fix over-requested allocation size
Date: Mon,  4 Mar 2024 18:16:53 +0800
Message-Id: <20240304101653.126570-1-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101815_353338_16D5CB81 
X-CRM114-Status: UNSURE (   9.32  )
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

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/microchip/mpfs-auto-update.c:387:72-78:
   ERROR: application of sizeof to pointer
   drivers/firmware/microchip/mpfs-auto-update.c:170:72-78:
   ERROR: application of sizeof to pointer

response_msg is a pointer to u32, so the size of element it points to is
supposed to be a multiple of sizeof(u32), rather than sizeof(u32 *).

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403040516.CYxoWTXw-lkp@intel.com/
Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
---

V1 -> V2:
sizeof(u32)->sizeof(*response_msg) 

V1:
https://lore.kernel.org/lkml/20240304092532.125751-1-dawei.li@shingroup.cn/

 drivers/firmware/microchip/mpfs-auto-update.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 682e417be5a3..fbeeaee4ac85 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -384,7 +384,8 @@ static int mpfs_auto_update_available(struct mpfs_auto_update_priv *priv)
 	u32 *response_msg;
 	int ret;
 
-	response_msg = devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(response_msg),
+	response_msg = devm_kzalloc(priv->dev,
+				    AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg),
 				    GFP_KERNEL);
 	if (!response_msg)
 		return -ENOMEM;
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
