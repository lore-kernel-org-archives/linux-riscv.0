Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF90CD484F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zd4XFDDAeML8wf2jINLW9xho3cSb8tU/QgXZQACQWh4=; b=rBvKEkf+QoLSn7
	05XWsoG11ukc4lwjApgVVqAsXMcxs+ohk7eV+Py7tMvIrhMWGpsA7sTfcYfv9r89gkVRiQ0qNtrpR
	+JbKVHogZ4WLvz1Pz4n5j4MGL6nHHwB7MBc2rDtGoCZxGMG/mk1T9et7ZChZC/9eaO6mbYFMElofs
	YPWek/VLbX5gs0mdHNip4bRTs+KsLAhJ3066/okOvBLrY1omsncb/26ZBPU1NL1/YBWXgRVrqgPNY
	WRfOg+2jx2p3n2IKFPT/wFeX48qqNKF7cls1HpDoyXFx/ZMRCHorKsHT8iDq+eRDX2//UnPp1b70+
	ThmGKP30Ng/YmaMS6rvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrPd-00000004ssX-39MT;
	Wed, 04 Sep 2024 14:55:13 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrPa-00000004sqi-2Ctv
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 14:55:12 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-26ff21d82e4so487134fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725461708; x=1726066508; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=dstRds78gnREJK4VVPKVlaSbdMatvxDyYmAKmrCMF0c=;
        b=f8lhQdPIsJ/vB5yqIAwm18RutsQCsm9tzwa6vGbyqSXNfl2KN4LYUwKWXRE/gbAc6M
         gooNkmFbJnX4RZGR679tAeXEIOsv7NytilbddZzb/9MBY4qzJrOSEGfhIwIgSUZeIN26
         pVVyiCF/vHlv0XQqBbr+poM94GsQ6IqSP6s0xlue7XwVBSSb1MOlXw/0PfcqSzUBvCkm
         YIyk8/e3y9rQkaDz5jEyYESMr1lIphrG2iTZW6lzuufdidGTM80/+wNUijhjoBhEZhfE
         OUwZ7NYG/8WAno4MXsIl4z0nx+lLJD7WJPKN/1fmBpalIJlpLMoer7iu1QL/joYKGW7o
         bDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461708; x=1726066508;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dstRds78gnREJK4VVPKVlaSbdMatvxDyYmAKmrCMF0c=;
        b=sCCGAF/CJuajEqmLt5FqxXxvXeR1nS0J7j47vQle+sMybIXtuaa/VnG9Bmr25fYO51
         eT5C22Wb1gg6s/k4D5CmTImh0VmohJMYYZdtoU56ayFY10u63u8SbQ/YuSqNVhQoK7DO
         fuSX0YAWhBGvZ36ZZS6wBrZuj5gua+Q5Nc1B0Ev/2Cswq7H6/TuRTbLwyGG5HsJILq+S
         dK6dERnp5xRrO1objkVXFuP2K9GuO4WJj7EHY288c2Etup3jWSPyZ3bqZwDJ0fBR8Q3l
         RClX4SLJxORb67AXJlPSkh49nSLTksHqL9qSaQtRVJe66BIOg3kdv5Izn8gziNd0Jxl5
         3hrg==
X-Gm-Message-State: AOJu0YzscYEmFD3M0soA/XHu6S69rk7Z3J6V8QIg4xmlU+iu/qFcDtRy
	PGDq81ISrh4BuOiURDUunq1FHxdMpZA9lZClxPa7qkgK8MQnzGjlJx5HnUcXnpLl3QMlJwvqi+L
	6
X-Google-Smtp-Source: AGHT+IGD2blfQoOKaweAa2NTAA5sOGv6jpM37rNyUUpeLfZm2sdBK+Q0SJo4yyhixHCVFvGbe+J+Ng==
X-Received: by 2002:a05:6871:8c15:b0:277:db7f:cfb2 with SMTP id 586e51a60fabf-277db7fd4camr9902588fac.14.1725461708223;
        Wed, 04 Sep 2024 07:55:08 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778542183sm1700681b3a.89.2024.09.04.07.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:55:07 -0700 (PDT)
Subject: [PATCH] RISC-V: Schedule SBI-0.1 for removal
Date: Wed,  4 Sep 2024 07:54:05 -0700
Message-ID: <20240904145404.6291-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_075510_813693_0DBABADA 
X-CRM114-Status: GOOD (  15.25  )
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

We've said we're going to deprecate SBI-0.1 for a while now, but I
didn't find that written down anywhere.  So mark SBI-0.1 as deprecated
and print a timeline for that deprecation on systems that probe it.

This also hides the Kconfig behind EXPERT, in the hope that doing so
will poke users to notice the deprecation.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I don't know if there's some normal way to mark things as deprecated,
this is just the best I could come up with this morning.
---
 arch/riscv/Kconfig      | 2 +-
 arch/riscv/kernel/sbi.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..e70ff952d68e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -832,7 +832,7 @@ source "kernel/Kconfig.hz"
 
 config RISCV_SBI_V01
 	bool "SBI v0.1 support"
-	depends on RISCV_SBI
+	depends on RISCV_SBI && EXPERT
 	help
 	  This config allows kernel to use SBI v0.1 APIs. This will be
 	  deprecated in future once legacy M-mode software are no longer in use.
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 837bdab2601b..1209a4e53ed1 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -686,6 +686,7 @@ void __init sbi_init(void)
 			sbi_debug_console_available = true;
 		}
 	} else {
+		pr_warn("SBI-0.1 is deprecated and scheduled for removal after the 2025 LTS");
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
 		__sbi_rfence	= __sbi_rfence_v01;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
