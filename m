Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5B6EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 03:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FknkTNfXyqFy7hh6mivy6YtSw5eGso+dfeGQeHcb5SM=; b=ASOtg6MZQCN/AQ
	RjKRts/nfginIYV3+LHbsDAQ+NdofOl/pVtMPS0iyJCEO7MwZN411+FVsoXeFxrpN5gFrTS9Jwt/g
	8C7JFQXUQ8iSou2X9uSQWJjhqRkBGNm4zHMaL5s+LC+luPCQLSpT6UtQKMKkOCRRZFt9cB/JIlwRN
	edll4wbfKqB3OThlYaOdmSpmfCUzB4EisI/kSHmWajDyuU02mg7lMtlWj/Vo6sIBsIuXaG5wm1qQg
	JY75IsKaVGGSzvAew93h2ez0gPsClNXvqSnqTg2aEkCE022mb9TQtl02EnVRq5NJCQKuw+/p5f77n
	NsAEamX3mpEfindRGcbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHFjd-000Fda-16;
	Thu, 06 Jul 2023 03:32:49 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHFja-000FcK-2B
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 03:32:47 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-38e04d1b2b4so313733b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 20:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688614365; x=1691206365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxTwOa0EQc8HVnTEnAPW/0MSWwIJGSBSzfzkOm95n/4=;
        b=pTo/jZz2asIn2mN4BMuhUQhZx+/Nzya/YDfH9W10BGp968x0CAKUF2McN3MzJQaaK2
         WQSgkciJvDPeQgSBn6eBr4j2c7s6HbHNk3Jt/5jpL1fP3Z9JkpvAhQkL/o+71nJBXyTm
         8p68DcuMsOQECRnEWQtBsn+WvtS8vAl4QnHdsTGCXhNx5gxSquRv3ir46aXdi+wvEG61
         YKZhUN/zhJc6+mRDN5ywdGVwxQ/y2+Kmj6hyt4BJ/Qid4NNR+IbgFL8KrOfXo8T8opAk
         dlS5UkMeN4qkegIs7q2ENd/BFmKYBjBE8jQRKjAa8wmF4LHmzz2fA2Q9II37Itb3bOJu
         DPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688614365; x=1691206365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxTwOa0EQc8HVnTEnAPW/0MSWwIJGSBSzfzkOm95n/4=;
        b=lwwDwXSt2pp7AwZ4QoZEF5bwPRF7ACr3seW97mcJRVkBVWYwgCOtJ/9F/pKX7kI5Ff
         RCEZIhuGVENafatjizUz2SSK07OPGoZQKeVeviFQpMH14zMXk47GY229+bxrCKJ1+SHg
         rx0YyucYwppWk6Zm8o28Hik4B4Ve13Sqz2CQO6tEBMBdOYcMEYWXiAj3mWht7qpGJ+D+
         SSq33ZS0TnH6iLlF5vfQpWpljoTxPb0qtgMmpfc4RcMXVxXSbwC2CdbEuv53EfbWFetc
         2HEizdRB7YfUPo2NzOeqOgiYzP0JMRluHR4bW6CG6wj1Bz+0RZrbxLAejSBDDMkhDSnd
         5M5Q==
X-Gm-Message-State: ABy/qLYFoR1Qrl+zL4z1vvdk2Pm13u7IAmUSIpimrzPNQvFKzHZvv2G3
	QHHh4NozILR3eo2i5J9eKnV/1A==
X-Google-Smtp-Source: APBJJlHP9M1ZsGfe2ZMFJKx1Re86VXljfxshm/0iSUnfVW+jY4f6zbrqlQcsob+xxdVkFNGI9KOTpA==
X-Received: by 2002:a54:488e:0:b0:39e:d59a:8275 with SMTP id r14-20020a54488e000000b0039ed59a8275mr502807oic.25.1688614365284;
        Wed, 05 Jul 2023 20:32:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id fk13-20020a056a003a8d00b006589cf6d88bsm239785pfb.145.2023.07.05.20.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 20:32:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Jul 2023 20:30:19 -0700
Subject: [PATCH 3/3] RISC-V: Include documentation for hwprobe vendor
 extensions
MIME-Version: 1.0
Message-Id: <20230705-thead_vendor_extensions-v1-3-ad6915349c4d@rivosinc.com>
References: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
In-Reply-To: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, charlie@rivosinc.com, evan@rivosinc.com, 
 heiko@sntech.de, linux-doc@vger.kernel.org
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_203246_726973_D13842ED 
X-CRM114-Status: UNSURE (   9.78  )
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

Document available vendor extensions.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 19165ebd82ba..167fd3e25632 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -97,3 +97,20 @@ The following keys are defined:
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
+
+RISC-V Hardware Probing Interface Vendor Extensions
+---------------------------------------------------
+
+All vendor extensions live at and beyond
+:c:macro:`RISCV_HWPROBE_VENDOR_EXTENSION_SPACE`. Each vendor can specify vendor
+extensions at any value above or equal to
+:c:macro:`RISCV_HWPROBE_VENDOR_EXTENSION_SPACE` without worrying about
+conflicting with values from other vendors. Only extensions from the vendor of
+the cpus passed into riscv_hwprobe will be matched.
+
+T-HEAD
+~~~~~~
+
+* :c:macro:`THEAD_ISA_EXT0`: Contains all of the EXT0 extensions
+
+  * :c:macro:`THEAD_ISA_EXT0_V0_7_1`: Vector extension V0.7.1 is supported

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
