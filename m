Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBB7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQGhBIzeobUQ7/20wcXhToLp+TREA+C1Eqq17KyJhGA=; b=Op0vwwNf5G/7G7
	ZgAPaS6P3DeevUA+ngIfgIz/h0x3r6/rjGSnMaXsgQVe2x2JB0w2HIwvbZytSXmj8Zb44TeHPrn6R
	x9J8vJ3QsOzLOH5zlkpkgs17ZYSZVAWz2gusjk8VQUTeOlgkQrtfzhtWOmzsJjObfr+h49fi8UZeF
	LbK6R1rZNnNHUPLTqQuRbDyTbpPpdViGTQukensRgopgXCOikLjNyt+kSdI63hZhPwZ5XFjaJiGw0
	o+33YiQfZytA3Shkxu6xyn8Lz7A4H+M8novusAsz9MJk/V4sbwqiHFdAkUNc6RlwobDwDHEKjhOZt
	vDBe1MZ/oiAY0fAlNF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noi0b-0061wQ-Ua; Wed, 11 May 2022 08:47:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noi0Y-0061vH-Hv
 for linux-riscv@bombadil.infradead.org; Wed, 11 May 2022 08:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
 :Subject:To:From:Sender:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=renU6boUc8bjl7+T0+5P6aUpTemVDlmCU6gWIarVu9c=; b=S/gumwcjWfK3E8OK2c0d7AMorB
 XFCibQyDv4JMf8wW9NUGiGApt/Si1YMuzHd0TrvHgseLq+C/izPxxJmet+K39cefZX4/g7AMBLhgl
 WcZ5/lyJaGTmG9LhJRb2+Zk9xKt+EnYkihuUiWuJzfRg5SNZSQJcIpteYaTVIznwWI7bkVMnOACAP
 sSt5viDmbTZST0n/IAdekBsCR8/6tlP5vJ0yfrbUfhKop4rowL8AkTDnaBpijvOQg/CvBYFaugnuv
 OWRaOeyXzNJZJFe+1GQTy2keEzRtNW5Wm003ychblZ5//cDI8MdW3J5f+lsjBkwbkn2pJv90bWKoa
 xtmehLnw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohlE-00D6mt-9L
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so1444141pjq.2
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=renU6boUc8bjl7+T0+5P6aUpTemVDlmCU6gWIarVu9c=;
 b=VuzX83IZhRm4Pe99Gm3V7OoCvEp0z84v8JRxEiPiBz2aAGi9cn16IY9IcrHbA00wF2
 RPK4sUNQyFimpqbf1avolryq3OyRAeepmiwY0IuVNUcYQHlVlvXbIq5XN9dINsywodV0
 WkX9Co6NTbSDi03nyGX74NJOnZQQgR0bb4vrfP7Lr2DnUvwdUmxwPgGB4BMwKVVQTb9i
 FixbVPkUYrMIoSQD850nMr5GUM36+NdL6BxV0VT7BLJswWN1a6zwFLKOq1eeQ7/Ua7Kz
 VZf+HuXS+X7k5pRNuNtX3osHiAY4X69bsMo1JDtDloJxdVnEg1E0ayGVyl//Z1TZzw0s
 YOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=renU6boUc8bjl7+T0+5P6aUpTemVDlmCU6gWIarVu9c=;
 b=ZWcLEW7OXPcgRhS/lLsSbJnUk1+jPS+vQht7C5wuyaiYMFZkQhNUcw1Gz0A/vDaLHT
 zOXKiP66KqOVH9eUDHmzVz7wdu/ECwpdq9ggFpaBeuq4YV0T6+lY3qs6/sRZBZMHDaj7
 KeOjin2r2hyHVUKcTamdfujn1U8WlFci5vtCpZT7chGji+7c1H2Pex0RA7m/VgRA+5eU
 xpVc0fXPVA7dqSF+v6iNOXXfVx2KvzBHks+5dKoBt9aUH3q801MBmDiMvxgb8LMqm74M
 DVaonrEIhw7Bf9YfBCY/CrBA3iPyRRbo02ZPVfBf1OrLpoPzAgtuhTtMerFeGLTeJ+4j
 vNTg==
X-Gm-Message-State: AOAM530yw2qhrQuGrdxTgJtWOoN5BfSI5if7wzWn1qzf3eF0iTFqNovo
 cVyRw3rjNsAr7RIsgdgdAnrmnA==
X-Google-Smtp-Source: ABdhPJzTt/eBd9wV+KzZVC98MS1893vrJwmEN4p2oHY/UTvF/oBUGO0yuU1T278iz6ZleFC0OUckmA==
X-Received: by 2002:a17:902:e851:b0:15e:d129:fb20 with SMTP id
 t17-20020a170902e85100b0015ed129fb20mr23797543plg.140.1652257914323; 
 Wed, 11 May 2022 01:31:54 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:53 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 15/16] riscv: Add V extension to KVM ISA allow list
Date: Wed, 11 May 2022 08:31:25 +0000
Message-Id: <b8c1bf264d50c075620258dc27a05aadc42628ba.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_093156_707211_1A057E37 
X-CRM114-Status: GOOD (  10.94  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Vincent Chen <vincent.chen@sifive.com>

Add V extension to KVM_RISCV_ISA_ALLOWED list to enable VCPU
to support V extension.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kvm/vcpu.c          | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0734e42f74f2..02ad7cf64d1c 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -33,6 +33,7 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_m		('m' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
+#define RISCV_ISA_EXT_v		('v' - 'a')
 
 /*
  * Increse this to higher value as kernel support more ISA extensions.
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7461f964d20a..c0a3be86d613 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -39,7 +39,8 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
 };
 
 #define KVM_RISCV_ISA_DISABLE_ALLOWED	(riscv_isa_extension_mask(d) | \
-					riscv_isa_extension_mask(f))
+					riscv_isa_extension_mask(f)  | \
+					riscv_isa_extension_mask(v))
 
 #define KVM_RISCV_ISA_DISABLE_NOT_ALLOWED	(riscv_isa_extension_mask(a) | \
 						riscv_isa_extension_mask(c) | \
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
