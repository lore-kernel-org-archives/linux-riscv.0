Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4943DC5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 07:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jBNCwuHzuwZpNceRlOO/TNCCuHpdzCpzB3Wls+iD7W0=; b=ibVVOQY6HWhXPa
	WuRIAjMIBx1eGkv5/nKGJVmBht+Qr6DZFdYNcBVg8kiZVdh2H4eh70QPAOKqhEffoSofnd2t/ylqc
	AznVWJ/lxZ+b/9KzdcUqF/C24c1ekx+AfHzXEiW5tvozvidiDfsiLraTY27GRYoz4a9q76TjrogZo
	qcZ5sr+0Kg1QIq9+fPH2d+btqkJTYSYlwV6XVzwVsg8whKM4VQ2aPdLCsArU9gtJjZccdnD8cdCi3
	N2eaV0K4LN2Yx9/kOxuuU7dritECMoZA0XcQ+3p0QsR6qBk+GYvdflUHoGIHePAKESHOAkhXK1/2a
	8s02EoT8JGvx7RuHZ+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPX3-0000000HYyR-2FAf;
	Thu, 13 Aug 2026 07:07:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPX1-0000000HYxH-0062
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 07:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786604834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JiBEcYiE+KLh8+0hM55F9Ni/cU6OIiWXkgr39dKJ+1Q=;
	b=bhJWiv5b2OiYz/8uSuB5CaJt7aWevi44YRNKeewIWse+IlQOtp6RZoGEYAhSOrg4wBzY1B
	pncU7C1gukfYJFNJbzF/5Za47zSUhzDjgi6uXRLupNiZSrsz+Jhx3yLGgAV/mSdC9CVVL1
	zsSOFOPLNn5GidbbJ4Ul2PNoPr0uWNc=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-9LWnPRYkNwm3w4so9PzSXA-1; Thu, 13 Aug 2026 03:07:07 -0400
X-MC-Unique: 9LWnPRYkNwm3w4so9PzSXA-1
X-Mimecast-MFC-AGG-ID: 9LWnPRYkNwm3w4so9PzSXA_1786604827
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cd01a14e81so8483335ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Aug 2026 00:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604826; x=1787209626;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JiBEcYiE+KLh8+0hM55F9Ni/cU6OIiWXkgr39dKJ+1Q=;
        b=GdxQNyyu3zDIEwpcgZYSMv37KUzfOpWsFqAJ3M5SGA37FVwjjlxOFX8bWBOd7qDub8
         /oUM/ycHkxOZX+A0/YzgflXXuINXrCfTLMbvGnMBNfVLtRqvMFSsmltRwVPhBfeMn5RV
         lLBd6okK6W/Cvlbl6HYNVAW1GAbUO63TBiVMoGHpdFCa7fCME6o0/Gice4DhGW6mayn4
         BifWR4EbYbQoXe5tOXRYwgjozuQqxFbtLGnu7d1flfVTqitAnxJ1HTh4NGC/8DIXkGV2
         VbIL5Y2Me18OSmOi5SfoggN2BdXvOgRTi6CLYngHcEj76wFVU3NI26tKUUnwD6c0knoj
         ei8A==
X-Forwarded-Encrypted: i=1; AHgh+RqNGKf+ms25hh6Xdve0mi+ESexjESUQYZIEpMRPKvAbsM6zBrOC2NSdSc1xXIDy6NhgLrh9nFMX+pz3jw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl3lbNRriMvT/LgKZOMaYTz2FliMpyl5X3vvGo0TC+Z3ayO2gm
	TPB0h1kkr/DP07fv7X2RDeAVYsORZhNkmT9HU/wCBKq0JxKui1NY7eIScQ3oB41fDST35bZ5U/4
	AdAkTdxo0/Dbq5BJNWBOm85ELtPppiMu348oQvoG0vIEq5HGXstpDgnIpEFK7RT/mf5C7Zg==
X-Gm-Gg: AR+sD11ujoXHHA6bQ/lZfPXS+BImbwrgk0UWfF4rutOhta4wEYD9W/XC3jiJpMPToF+
	vvrJgDlthxx/mbz8LN4gJ+jk5KQHTrU7M+vQwTJ7LBfMmQVovm/1CHBzGJGbqE/xlD6CnIhZUh4
	tDl09vviGzR0k1cxHYiM5dnl0Kk1rbw8ZStDA/Hk0rtDqNNaP50SQNBamFibpzUvVYgcW4ZmqXt
	+kylTaIj9VD90l2hXwThP/x++NcF6djaXPMdD8CKArA10cmxekqQRRNNBf/xbJyg2N/hLkG7SfO
	g8ncj84nAwfNrdtaopn7SxZ03x30EBgltr9ivtZntQYF6US5z+C8XM1Ki1cCa3qoDXVjaqmcO/p
	Y0ebIMjKkJw8cE4uG
X-Received: by 2002:a17:903:234a:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2d37e8a4f49mr38123845ad.20.1786604826429;
        Thu, 13 Aug 2026 00:07:06 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2d37e8a4f49mr38123275ad.20.1786604825987;
        Thu, 13 Aug 2026 00:07:05 -0700 (PDT)
Received: from [127.0.0.1] ([115.110.157.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c48e438sm4877315ad.60.2026.08.13.00.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:07:05 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Thu, 13 Aug 2026 12:36:29 +0530
Subject: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
MIME-Version: 1.0
Message-Id: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nj3dyCzJzEvMxK3bS0JIPkZEujZGNDYyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQC+l4AzbAAAAA==
X-Change-ID: 20260813-mpilaniy-ffb0cc92c313
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>, 
 Philipp Rudo <prudo@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6ZXgPH_8aLW895b6QZz7xiIpbZvkI_Ak98Vk29aNKvM_1786604827
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_000715_125417_136D1466 
X-CRM114-Status: GOOD (  13.22  )
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

Several kexec_file_load() image probe functions return -EINVAL when
they do not recognize the image format.  A probe function that rejects
an image should return -ENOEXEC to indicate that the image is not a
recognized executable format.  -EINVAL implies a problem with the
syscall parameters, not with image recognition.

kexec_image_probe_default() iterates through registered loaders and
returns the last probe's error code to the caller.  That error
propagates as the kexec_file_load() return value to userspace.
Returning -EINVAL from a probe when no loader matches is semantically
incorrect and misleads userspace about the nature of the failure.

Return -ENOEXEC from all probe functions and their helpers when the
image format is not recognized.

Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
---
branch: next-20260812
base commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
---
 arch/arm64/kernel/kexec_image.c   | 4 ++--
 arch/loongarch/kernel/kexec_efi.c | 4 ++--
 arch/riscv/kernel/kexec_image.c   | 4 ++--
 kernel/kexec_elf.c                | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index b70f4df15a1a..101259874d44 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -25,10 +25,10 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 		(const struct arm64_image_header *)(kernel_buf);
 
 	if (!h || (kernel_len < sizeof(*h)))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	if (memcmp(&h->magic, ARM64_IMAGE_MAGIC, sizeof(h->magic)))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	return 0;
 }
diff --git a/arch/loongarch/kernel/kexec_efi.c b/arch/loongarch/kernel/kexec_efi.c
index 5ee78ebb1546..28a1d0420ba3 100644
--- a/arch/loongarch/kernel/kexec_efi.c
+++ b/arch/loongarch/kernel/kexec_efi.c
@@ -24,12 +24,12 @@ static int efi_kexec_probe(const char *kernel_buf, unsigned long kernel_len)
 
 	if (!h || (kernel_len < sizeof(*h))) {
 		kexec_dprintk("No LoongArch image header.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	if (!loongarch_header_check_dos_sig(h)) {
 		kexec_dprintk("No LoongArch PE image header.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	return 0;
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 51dc89259f16..963a25f5b55b 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -20,7 +20,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 	const struct riscv_image_header *h = (const struct riscv_image_header *)kernel_buf;
 
 	if (!h || kernel_len < sizeof(*h))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	/* According to Documentation/arch/riscv/boot-image-header.rst,
 	 * use "magic2" field to check when version >= 0.2.
@@ -28,7 +28,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 
 	if (h->version >= RISCV_HEADER_VERSION &&
 	    memcmp(&h->magic2, RISCV_IMAGE_MAGIC2, sizeof(h->magic2)))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	return 0;
 }
diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index 3a5c25b2adc9..89a444a00693 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -172,7 +172,7 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
 
 	default:
 		pr_debug("Unknown ELF class.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	return elf_is_ehdr_sane(ehdr, len) ? 0 : -ENOEXEC;
@@ -236,7 +236,7 @@ static int elf_read_phdr(const char *buf, size_t len,
 
 	default:
 		pr_debug("Unknown ELF class.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;

---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260813-mpilaniy-ffb0cc92c313

Best regards,
--  
Mukesh Pilaniya <mpilaniy@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
