Return-Path: <SRS0=4Q7i=IW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9B9C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 15:03:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B0C61A0E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 15:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B0C61A0E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i7I6+V7MJvDbDwjtiwhTWwsexzKfW/HvOI/V2WDL/SA=; b=CMOk7mQgdgeYlEJtksTX4tnbfm
	ZyhcyvzkTxwVxlizhOgNHYeLrnC2w9upnwgBb5qCC9/JwpRVqFTecl1de5BKT91/N0AUdp3s43CH5
	7Q0jTUdzpmrurRfRUL8XQDTHJ6NWPnRIBwCieOnqaMUX8gR5AydbYgulxrEH0ucim99XzN03XexBB
	Wq6Jnv1yR+KhIBH8gxr3A8ULiFaBo9KZSR4wdtVbJDipY1/6XGu3Q5j+ORP+ZWdL8V/uOJzkcj6E4
	d7o5DR5GZ/DTqUlFnSraw1yh20S/02YxkcQnW1xyl/ajQ72VCY/02VyBM9b3o0Rs9wnkER8Y8IsPN
	+KyU+aCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP52f-00HFY7-OE; Wed, 24 Mar 2021 15:03:29 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP52b-00HFXm-R5
 for linux-riscv@lists.infradead.org; Wed, 24 Mar 2021 15:03:27 +0000
Received: by mail-pg1-x52c.google.com with SMTP id l1so14798588pgb.5
 for <linux-riscv@lists.infradead.org>; Wed, 24 Mar 2021 08:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FItyqxViIAmB8amy4A5vlzdR20mnIAmC2uA+KNkY1Gg=;
 b=Jq0HmIdidI3kiESpgQ+BC0vj3o2mde7P42Kiw+pHEnQOKhGpfCRFTJoME2bvKapawN
 WP3pLEgKYrF2sAzB+mmJAvjsOcdvNMbmGjx4Ocrubfo7asrx5cIXJ1m44gnw6MYYZHgK
 0vPgZFKLr1mCyHexFNM0oCV2bvsUhTT+mT/NMt3q5LtQENk6Hm94IGJAFp7BLPtqtSKB
 1dGEmDy8q2ksos80WZ2TTqJ+5mZr8kzVPJpPj/qqa615R5yJzuxPxd1NwgYsyc12UK1J
 LMI1FbMgNxiKkj/uloEBxOXsYX4tWQuP+aOM4rAIvmWEz9JYOW+bQIIz0RAOegSdVi8t
 SaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FItyqxViIAmB8amy4A5vlzdR20mnIAmC2uA+KNkY1Gg=;
 b=eXQxO4efv2e4ur34aiHUDS5QWgbf/BzGwJxHpjbiTxXu/AWft0Q2dciU81fSTikQVB
 EQETHki6iRmhmGMTivYNH0e4lrMvVgaXxJT5zSgNe1yqrRBvFw3zW8o++jEfAWYnBvME
 PbjiJiw66Jpp9C6Ryk4BEH3fedhIJvFQTiDO2xVCyIrWxhvCSbTpbczknDBOKypdsuH/
 1gt6gzygPjWPaPHCaOq1pD5uNgRDHoPics9BGaIoIC5w+PrVRjSl1xSCpF/8BT7UTAQ5
 z0RxiiuqMQ9+x7+dUUE2IpwwtkAJyAHCrkTiiFzuwghKNeoPWTnpMYaDiiOWwZQnRbDd
 kxiQ==
X-Gm-Message-State: AOAM533MbblKSRG94uFpTzt9KrPzcjYqQPS1h1q4OVjo+HrecL2OAh5L
 0vyK6eM+RxiyF7qXDNkDrDA=
X-Google-Smtp-Source: ABdhPJwFpEAvfqb+Zf7dyN0fn8XR4KvnxGeNssHrQoAba19JdnU4KnnFx00vSGIC4VzlJ00m72fkzw==
X-Received: by 2002:a62:683:0:b029:1ec:c88c:8ea2 with SMTP id
 125-20020a6206830000b02901ecc88c8ea2mr3309240pfg.27.1616598203601; 
 Wed, 24 Mar 2021 08:03:23 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id f2sm2916749pfq.129.2021.03.24.08.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:03:23 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] riscv: Do not invoke early_init_dt_verify() twice
Date: Wed, 24 Mar 2021 23:03:12 +0800
Message-Id: <20210324150312.20535-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_150326_000083_344544CB 
X-CRM114-Status: UNSURE (   8.73  )
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

In the setup_arch() of riscv, function early_init_dt_verify() has
been done by parse_dtb(). So no need to call it again. Just directly
invoke unflatten_device_tree().

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 arch/riscv/kernel/setup.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f8f15332caa2..2a3d487e1710 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -255,10 +255,7 @@ void __init setup_arch(char **cmdline_p)
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
 #else
-	if (early_init_dt_verify(__va(dtb_early_pa)))
-		unflatten_device_tree();
-	else
-		pr_err("No DTB found in kernel mappings\n");
+	unflatten_device_tree();
 #endif
 	misc_mem_init();
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
