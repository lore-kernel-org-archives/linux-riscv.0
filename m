Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8DAD1AD5B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 13:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PRqCJvxEj0JWrs2adZgnEs6he0Gw5aw708/W50c4ml8=; b=jWAifmlW3LpR/E
	uiAxxJ1BFE0vwHFR63jHWuuGFnxtuohHhmhhaxQnrQJ2tJzOQvIWK7Y9u6SrNYLCvI3fwjmtthbWk
	KYHeI83L6ea0nAH29PWnozvQOI3H+VMPkTElMkBX8UMnnhuoULvcWn8+rQYgMzImPRWbSkB0eUlFL
	xxB5osHiRYmHQ+C9xTSZANuU3Dyec8f6EtNUDUUTpKyB+hz07d2t0gAn/70Ro1OzXj7WYf9Dwjg1d
	y9B7EWxSSn4KhG2mSUWWfLAoOmEXFxoSrF+wxaIDq1z2I5Mev8oq12kswx8mIghdK1Cef7JSuJjkX
	fGk8xpHGjws89Mp4uCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t14Jc-0000000BxjN-3jt8;
	Wed, 16 Oct 2024 13:43:52 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t14JZ-0000000Bxiz-26eT
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 13:43:51 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ea6a4f287bso2757817a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729086228; x=1729691028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPSkU20Itc6yAh+bZBbT2R0RT9oB/wml9mSdgooTOww=;
        b=uVh74eF+R12IvRn2bUHGAgDEvv30WUsGW4JH5FCXtYlq6WdT73y9RuQ91S0qrVFR/8
         TsNreN8+pnsmPVZ7aXmuWvM30aMk2vA6bc5k2Fa7UnbRZG6smOw7dAfmWVwjSAs4xP3f
         gNJUB8oUG56rf4XB4RFYJvRt6IB+PX6y3jMP8K6lu353nJae9qD6dKw2XAWAnu/UJFDP
         rKvyUKS4O3uYQifDsgm12wKgMcfOQ7DoEwAo//hZeK/XEkskeIEz18Sj8M72GuO5qopI
         kvVyt73NdXxeZ5gLR8oPDxtZadqKeYOAKYknUOQC3dqM02uR2QBVmr3jwSK8XnOOtkP2
         ORaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729086228; x=1729691028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPSkU20Itc6yAh+bZBbT2R0RT9oB/wml9mSdgooTOww=;
        b=o2516RdJExaEZKdwVHTH4f37FGd076jl+ezTHGkiTP512/f6GS8Mrq5fB4y+PBZ9N4
         KSQom/A7Jrt7Aopc7X9jsZgGUGwOQzYH/elWF4HMLeTXhDrwQZoTx4GV68BjdOUqIJW6
         wdUXdqnMe0VLqG12+nPau+cSARJ5YugKn3ls4sZRlTkxm/IcJgmaeNJ8aeIUby6+GnCw
         YX5tThqa4QXiHDUvfWluzXFJ68j+iQYAsq1QESwoRgBq97PvTaN12qGsmCFo4pXdplzI
         as4kKSHlB8hlFq4KIH/NBTQ7EG8LqzVa6f8/n5n5+NyAR7F0HLe4KLqjV0TrnHlK73pC
         0zkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuymHUJLdJZAVPYcZtEw+U3CKNG0Pd000Em1LsTe1jegwUzF887pXVctEACqjtRhAFo4e4zf1OLBC9YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv2yECRUxze9l5n98b03CVi3TFkbVAmEoJ2zpKL3Af6t8K+6jI
	iQfvb6LfWB4iOOpHzFdbpd3TK0ee5RyZwlNa3oDHzaDbVVCb+7lWpQmlNn3lIpc=
X-Google-Smtp-Source: AGHT+IE1Q+vPA30KNlMFxGEt9h2r7Mf4JtaF8VKYh5yzDNUyMZMQT+8Yyx33/wO8c5gt6uUjOIGAxw==
X-Received: by 2002:a05:6a20:d49b:b0:1d7:cc6:53d0 with SMTP id adf61e73a8af0-1d8c9576f83mr22762980637.5.1729086227779;
        Wed, 16 Oct 2024 06:43:47 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.27])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20d17f84e9bsm28977495ad.19.2024.10.16.06.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:43:47 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: drew@pdp7.com,
	guoren@kernel.org,
	wefu@redhat.com,
	linus.walleij@linaro.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] pinctrl: th1520: Dereference pointer only after NULL check
Date: Wed, 16 Oct 2024 07:42:21 -0600
Message-ID: <20241016134223.4079-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_064349_564288_91600309 
X-CRM114-Status: GOOD (  10.61  )
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

The pointer `func` is dereferenced before NULL check.
Move the dereference after the NULL check.

This issue was reported by Coverity Scan.
Report:
CID 1600802: (#1 of 1): Dereference before null check
(REVERSE_INULL)
check_after_deref: Null-checking func suggests that it
may be null, but it has already been dereferenced on all
paths leading to the check.

Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/pinctrl/pinctrl-th1520.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 7474d8da32f9..07f8b51fb294 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -803,11 +803,13 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
 	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
-	enum th1520_muxtype muxtype = (uintptr_t)func->data;
+	enum th1520_muxtype muxtype;
 
 	if (!func)
 		return -EINVAL;
 
+	muxtype = (uintptr_t)func->data;
+
 	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
 				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
 				 muxtype);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
