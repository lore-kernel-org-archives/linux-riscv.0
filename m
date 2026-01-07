Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DC4C47BEB
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 00:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pcKx0wUw7rEOMSf4M371efggr532LWOTqh50GF81U70=; b=JYFtXF/o3YJI+i
	ke92d/5wTlFkrSapAPwnqDANS793IHKIbIydbVQ7y0OfGwABhDGLl6s953cW53oN1cCFU7Mxn02H7
	R7nPfH+52r5rh9qktVTD3oyFIxrKvA4P6afqOF3EFX0MiDSAeKw2SLgMyGIO69MiwEXjE2gcFpCnL
	uWCI8JAmI4ZpSZya1DHQTdPKJUDM3sKMroMXbRrDT0DpkUNPHUaCrv+N61UwE0FtIkvs6OEBRAl4Q
	juvrGep6SqPQoVc/RYfh6+7Y021aNmV75evFQTQopfslL51uwXWKlKYwIDyt0KychNoXx0DIBE0vg
	sGmD9xzS5aOi91HjD0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdH46-0000000DxXG-3Yfr;
	Wed, 07 Jan 2026 00:06:18 +0000
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdH44-0000000DxWq-0lJa
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 00:06:17 +0000
Received: by mail-oo1-xc44.google.com with SMTP id 006d021491bc7-6598413b604so905788eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 16:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767744374; x=1768349174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgq7GZjchn1EcjfHQ/Ha9eC2PJUmykLGV5Ks1aM6jX8=;
        b=lptokCRO2raniJHgRpTbtpcTN5DUUqRlz78vVjmMytZcLOAD8PDAiVmChLCNAkqXbm
         bDNjxyCqLnBRJUz8vgCsjWRYafqJmRY1B2/oj/L4dk2gaMcUXux2PqElZd0ycI+6Hszv
         UUf5RC5R756LsLmODu9Lzf6A5V6LyCteGpqhEP8TXFwph+nJy0FILCersVHjHHZz2roE
         eITnRFI4ttFbkQ6cC47zfOcUqYPfwYBhLaws1NwQWclncS8Q7GhEs5dzuvrI4dHusanz
         nSryZYhfpYP5v5EPYAqf+qHxwIPcMQCaN9UT8XYNYaghG+fJT+CB8M74AY56XEWETRgj
         S+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767744374; x=1768349174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgq7GZjchn1EcjfHQ/Ha9eC2PJUmykLGV5Ks1aM6jX8=;
        b=asier+y0Q8dxZkgWb/DWPEw6lFv9B4GNJGpQ2WDc7dgthouoVzVK9UTwKvUjvDwS5b
         qOHL0KcCNkMHFwhO9cP0XoPvxZUYAGG+3tmWRKyKnYwk/X0ZshqTZdzxOKWVHwfmXOnX
         GxLkCEg8InB/dmzRTonr5k2trfjV92w9bepKWqxlfifHEqBAvdTKjkclyemXERUySNVr
         Xrkrq9hSNf1bQizwAUMWRU8KFlLPTkJJeZZywOlWLruCNmx/daVj/JDCMBr0UYi2dxl5
         yjcVu91IV9iwZrsnmI97FhohZQ6YSrY30+XK6iFSNXPTrs42dldkd398vMOGjHbE/jRM
         R0Ew==
X-Gm-Message-State: AOJu0Yzvx+fF2JmLIu/8Mwo8E6h1LhcarJVbjts1SQEW5Yp6hX8DUznx
	maQgpX4GyNzaq19tiR3EZ9s1MZZaGYjHeENCoEbMu69/x09itwuWvsbtm0fDV5caZf8=
X-Gm-Gg: AY/fxX5QcoxMGdCVZLxI20o3cv6tzZb4K+wIvMvwKUgJ2Vu+yPAkAoNTCy48xrwhFX9
	cFQqB35F4Y7ADtqL332o/gkOdI9DoXKeKnS4bzLY5xzbS+eARpw5Jb66HlATHFHLeQCx6uAECMr
	qL302Vj107U1sVvdfTyKV7OqdrD8/RQMt6XGGTpHKiKAxNGEGnrDpCmOl5i6AT6BOBQAuPnOS2/
	Q4fHcAq1VzIQfvikrjsc8szoMHxImr8VSy156vZYBWK+poLkVSWemy0YhroqrX/BSxpU2d/rn8S
	w0/xmKvdUFstxWaKov3R405uJa1k67tL+yDwlZmiWz48ZYop27aW1ZY/RgBIP/JxCEzGwm7FpAN
	xj0CS77k+OSzQpTq1eGdRrwbAOF0lBGEWDogk8El7CMLCqgOQoTNcLYGn+IO7JhP5NgpLm2OMA/
	sxmzD94kOnqnELRtDpouZmJlt9Ipqu
X-Google-Smtp-Source: AGHT+IHZk6/5mjRHyYCN1+0jYjV5yZCr12a2Qvfp3DAWPnZ9X8yCdldjy8vhbzKeSmmfI2HWux74cA==
X-Received: by 2002:a05:6820:7511:b0:659:9a49:904d with SMTP id 006d021491bc7-65f54eda43bmr210960eaf.24.1767744374064;
        Tue, 06 Jan 2026 16:06:14 -0800 (PST)
Received: from localhost.localdomain ([50.24.139.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffbe3a6d8esm609612fac.15.2026.01.06.16.06.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Jan 2026 16:06:12 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	pjw@kernel.org
Cc: Andy Chiu <andybnac@gmail.com>,
	Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vincent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v1] Documentation: riscv: update Vector discovery for userspace
Date: Tue,  6 Jan 2026 18:06:09 -0600
Message-Id: <20260107000609.63892-1-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_160616_233092_3B96B386 
X-CRM114-Status: GOOD (  19.79  )
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

Make it explicit that users may use both HWCAP and
PR_RISCV_V_GET_CONTROL for checking the availability of Vector
extensions. This addresses the ABI usage concern[1] arised from the user
space community in supporting Vector sub-exts and multiversioning.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=220795

Suggested-by: Zihong Yao <zihong.plct@isrc.iscas.ac.cn>
Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
 Documentation/arch/riscv/vector.rst | 49 +++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
index 3987f5f76a9d..1fde56ffe85b 100644
--- a/Documentation/arch/riscv/vector.rst
+++ b/Documentation/arch/riscv/vector.rst
@@ -13,13 +13,14 @@ order to support the use of the RISC-V Vector Extension.
 Two new prctl() calls are added to allow programs to manage the enablement
 status for the use of Vector in userspace. The intended usage guideline for
 these interfaces is to give init systems a way to modify the availability of V
-for processes running under its domain. Calling these interfaces is not
-recommended in libraries routines because libraries should not override policies
-configured from the parent process. Also, users must note that these interfaces
-are not portable to non-Linux, nor non-RISC-V environments, so it is discourage
-to use in a portable code. To get the availability of V in an ELF program,
-please read :c:macro:`COMPAT_HWCAP_ISA_V` bit of :c:macro:`ELF_HWCAP` in the
-auxiliary vector.
+for processes running under its domain. Changing Vector policy by calling
+:c:macro:`PR_RISCV_V_SET_CONTROL` is not recommended in library routines
+because libraries should not override policies configured by the parent process.
+Also, users must note that these interfaces are not portable to non-Linux,
+nor non-RISC-V environments, so their use is discouraged in portable code.
+To get the availability of V in an ELF program, user code may read the result of
+:c:macro:`PR_RISCV_V_GET_CONTROL`, or the :c:macro:`COMPAT_HWCAP_ISA_V` bit
+of :c:macro:`ELF_HWCAP` in the auxiliary vector.
 
 * prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
 
@@ -91,9 +92,9 @@ auxiliary vector.
     Gets the same Vector enablement status for the calling thread. Setting for
     next execve() call and the inheritance bit are all OR-ed together.
 
-    Note that ELF programs are able to get the availability of V for itself by
-    reading :c:macro:`COMPAT_HWCAP_ISA_V` bit of :c:macro:`ELF_HWCAP` in the
-    auxiliary vector.
+    Note that ELF programs are able to get the availability of the standard V
+    extension for itself by reading :c:macro:`COMPAT_HWCAP_ISA_V` bit of
+    :c:macro:`ELF_HWCAP` in the auxiliary vector.
 
     Return value:
         * a nonnegative value on success;
@@ -138,3 +139,31 @@ As indicated by version 1.0 of the V extension [1], vector registers are
 clobbered by system calls.
 
 1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
+
+4.  Vector Extensions Discovery
+-------------------------------
+
+Existing kernel supports running Vector code in the user space on hardware
+that only implements zve32x subextension, or 0.7 version of the spec when
+compiled with c:macro:`RISCV_ISA_V && RISCV_ISA_XTHEADVECTOR`. When the kernel
+recognizes and supports an extension on a hardware implementation, the
+kernel indicates its existence on /proc/cpuinfo, and the corresponding bits
+obtained from riscv_hwprobe(2) is also set.
+
+The existence of an extension does not necessary guarantee its availibility to
+any given process. Traditionally, :c:macro:`ELF_HWCAP` is used for such
+availibility check. This remains useful for checking the availabilty for standard
+Vector extension, by referencing the :c:macro:`COMPAT_HWCAP_ISA_V` bit.
+
+However, though the kernel provides compatibility for flexible hardware
+configurations, the kernel does not report the availability of subextension, nor
+pre-standarized Vector in :c:macro:`ELF_HWCAP` to prevent exagerating the
+limited bit space.
+
+c:macro:`HWCAP` is designed to serve as a quick check to see if the standard
+Vector is both *pressence* and *available* to the process. For any non-standard
+Vector extensions, the ABI guaranteed way to identify their existence is by
+going through the hwprobe(2) interface. Then, the
+:c:macro:`prctl(PR_RISCV_V_GET_CONTROL)` serves as the availibility
+check to see if executing any Vector instructions is allowed by the runtime
+environment.
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
