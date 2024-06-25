Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFC2C30653
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72rArpNILmPkUEeerv8i3A8Nve4tdmH4nDRFa6e8pbM=; b=KeQU5uiAbsZN2y
	eV9Ls69PDyZLVIiky74b1fhGHJwwdL/fSEBR70/4L5ERIXbDqFK386Pr8fdmnM78kDrLg8m4V4ctJ
	boUhImMuloKLWVcZ46O+8okiGo0Zd9bYlb7XcWBGWlt4z1c4x8lma8CtpuAMmlBE1sLtpS4CXDwRs
	+9NQxY+YRd384FSTHS/tCpWLM8EFNS3YqezT7Q/3e1NfLHkS38OYk/0CUo3HKRROhf/TDA95u+7of
	1O1YQR4bdoLKm58v8k73wbIOuL3eyHKaxT6O28Ex7oTokW5GRrC+aA8wFAvLGwPtJMA8uXNHK30XP
	p9x17NiZoUqO/td5ewHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQS-00000004VJF-0FMH;
	Tue, 25 Jun 2024 21:10:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQE-00000004V8i-26zE
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:09:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fa07e4f44eso31658855ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719349790; x=1719954590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfPM04Pyb/lGY9Q7saAL52HDlLyxzOizf7aq1c4K5eE=;
        b=c+mA4me4o5o0cjBcEem5AssuZcD13UgspKIIS4ZEZl3vHPZIz+wLD0xc1HdOSX6Hrv
         O1sWA31vSycUREZHNaB8d82UMnKKOi+eeJ4IlxbKQgkiyx+nQJxuHnRkI8qIkI9eZHZ+
         gZSnnkn+Y84lFysM1FS68sctI0aruBQ4khw7/XDmtOLPXUwnTrKpX36E5gLjb7QmIY2r
         fgXPck1sOxUNlTnbF7PmdY6vws94tCjKG4bUR9hf2EgeyV0PqaG825CTc4Uc8iX79yYe
         olBJKxATodGF9URFR68cZgZr9xiyumr/SA1z5zB+gHcgM+E3JZCKprGeQ7pOLniwLkt6
         f9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719349790; x=1719954590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfPM04Pyb/lGY9Q7saAL52HDlLyxzOizf7aq1c4K5eE=;
        b=VkQ3cT4v4Xotj0GSx3PYmYFS+dYeRzg4VmfhzLU10eaaDoMo/sXrwnqDJvyXAejHCp
         v5s9RSRw+Aqr10XDpPM50kOMcwBsm2rUYJAjn/BxBcxGTZBxLkwf1uuaBUNKItJ3KQF+
         zUOx3E6vEMvci4ep0MZu0DDatNBH77OTNgzYwIAdU/oFIDOnsWroMreOVVvcfQcaeuIv
         fqbbu5P9pAsqsMHm8eVTuNo3uPERXrHpuLY4CH86EQLLLiGSsf8oXNqycXQFbrdZZvt5
         +PDsBsPqPn14iHuwgDUjhcLfMUI/SdRC1ED2cFdFfqCJjHr7OUR8BIOVWLcDDPMBgr3Y
         Q8qw==
X-Forwarded-Encrypted: i=1; AJvYcCUyxKnjinjC4NNaHoa+/ythqtEy5WcKvQi0AzXinFEZXoBmIDdmeOQb/u+O333ehKdwbUGt4LphsRY6XsCt3/r9zNzszlsiuv0iXIChoF7x
X-Gm-Message-State: AOJu0Yw6hCTMNaihOrjJlX1sy5PCRIqEOJdRruWBG5qyr9tatONDuv5e
	JAKjyXeFK+9+NFyfP7IAAGQVdIIMx6UvnfYT8xJvxGFkrdB8d4N/Ln0ADU3pGA4=
X-Google-Smtp-Source: AGHT+IGeWKqd97hO0c2XIDZhD2hlaWhB/xhaoVBtqBOKtiSu9iE5NhFqVkg/azBhVzCaS3o6lABNTw==
X-Received: by 2002:a17:902:e5d2:b0:1f9:c8cc:9df4 with SMTP id d9443c01a7336-1fa23ef7f7emr98497255ad.45.1719349789879;
        Tue, 25 Jun 2024 14:09:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm85873455ad.110.2024.06.25.14.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:09:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 08/10] riscv: hwprobe: Export the Supm ISA extension
Date: Tue, 25 Jun 2024 14:09:19 -0700
Message-ID: <20240625210933.1620802-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240625210933.1620802-1-samuel.holland@sifive.com>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_140950_656992_023CAC59 
X-CRM114-Status: GOOD (  13.07  )
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

Supm is a virtual ISA extension defined in the RISC-V Pointer Masking
specification, which indicates that pointer masking is available in
U-mode. It can be provided by either Smnpm or Ssnpm, depending on which
mode the kernel runs in. Userspace should not care about this
distinction, so export Supm instead of either underlying extension.

Hide the extension if the kernel was compiled without support for
pointer masking.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc015b452ebf..75fbefa0af26 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -207,6 +207,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZVE64D`: The Vector sub-extension Zve64d is
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
+       defined in version 1.0.0-rc2 of the RISC-V Pointer Masking manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 7b95fadbea2a..abb7725fd71b 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -65,6 +65,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 39)
 #define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
 #define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
+#define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 42)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 83fcc939df67..b4f4b6d93c00 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -142,6 +142,9 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(ZFHMIN);
 			EXT_KEY(ZFA);
 		}
+
+		if (IS_ENABLED(CONFIG_RISCV_ISA_POINTER_MASKING))
+			EXT_KEY(SUPM);
 #undef EXT_KEY
 	}
 
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
