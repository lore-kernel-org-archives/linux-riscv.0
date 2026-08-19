Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A3FC5DF81
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVumDcGXt0x8libX0QhXwYabUJugocBDniJXRM6n8IE=; b=HjOO+BaicvGGWU
	m7f5U/bj34PP5GrocpRg7SpOQupVP2iWPs+AtVF62VgTNoHhXotYD27fn07FQoYDhtaiM8Oe1LKl8
	zabc6RLjge9zkFVFHsKj/fkLNnKqO39t0b2tEwyuKhyn2RI80j0Z20lTBfrF1hdkdzBjySZyfuwpb
	Bjj5Jb3HJnC+rVXbqlj+bydqV3MflKhu+HotN0SIcMJ8fdEDfLMG+VPo7/lFxEvHi4q1a8ZZ/uW4y
	Hl622pMljgyMaMNqOUax3yaCc1IV/GqSwI96MNnIFouyITgzxOIX5W6OKWf5UfymeJG/rpMoq67FT
	NYFcKqLPxWjmeMiXdpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkOH-0000000AIxS-1hna;
	Wed, 19 Aug 2026 17:47:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkOB-0000000AIuV-30ka
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 17:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787161666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmoIUhHXRYirfmXtPkyGTipOfc1IGodR0GKUD6MrhOE=;
	b=dffeOz5tPSO3hAaK50Lhk8HtHFIaX/dJgz6llXtexSz97Ntz35lnjve2P+EJ+xT1odmi7S
	ajxhl8c4QJfyvVRrULFU/KsWb9ifnLm2xqUoHcT4XKCeO8j3OzwBS/aAd3NftkUZebaECR
	OR1yZ1pf2Fk+JHpFXGvPGPDafmVGSAk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-nKn6MSyHMnuDpzM20MmoLQ-1; Wed, 19 Aug 2026 13:47:45 -0400
X-MC-Unique: nKn6MSyHMnuDpzM20MmoLQ-1
X-Mimecast-MFC-AGG-ID: nKn6MSyHMnuDpzM20MmoLQ_1787161664
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1628131a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 10:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161664; x=1787766464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmoIUhHXRYirfmXtPkyGTipOfc1IGodR0GKUD6MrhOE=;
        b=flv+pJ3hrKi0EOIjg1kttPXv7iQ3FqBnEgPNHrKhZmft9ZIB6o3lPLGa5KJbIOfbaD
         NQlMjpcv8btfbw/hlQyfDit0+T+iUVAD1zrR8xa30hjNJxKra3s+Itom8WA6WaASlIOg
         D3N5Who9+S6bO0GJYmVVeDRk/ue2wDg42qXJGMgpaIUducCoeDLU+UTpdRdFJIA7od4j
         +iOioQAjG017NamHXXM1VOknAXeZ5NQtjLRzfrQ04b/0dTcLnAHMeVrHGtu4ZK6Sg/d7
         bk/KDwnsWZ+WiJE6K5mc4E//VyzXCvZ8bhCCY/FMcTKtdVKFhMraKUWM8A5DC6lqIAF+
         7ZLA==
X-Forwarded-Encrypted: i=1; AHgh+Rqu3ZN/0SDRmGWXWNclXzbzycUFQEZaub3zrxB9yWmrWVkkJct92UulQaViIWofkm3BLEV9MT6BSzMoUQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kBquy6MMBG6rOrpTnDfn6WgMaFoDkKP828KmAiYdmbWb0h4Udw
	XGpeZEpM+GOdPyfrtURAOQIJGjkTWpsPzhRXHER8UHAvZhI3jPLZi3/s8Jm7U6AEelOuhwxmL29
	14aAZ7KBEKwMQKaNgr+S+lS6Y8rwzsYmyu2Bj67mw5B4tVuOqyPDPInZLAdcy5iC1lUG5jg==
X-Gm-Gg: AR+sD10AHQtgbQ4Q+XVuXSHfCRVforJXKIHKuubQymjPh8WDpab82gNfDkkEGi/j56K
	dyhJSn+kADGudTtqxF47Rt262zZZTiXLVGM2VEe2ruRVYCxN6QGDKlj2J8SGL9MN25gq52rWitq
	8TDNYF2BPPNlbCC3dRfsl8gF5gVUwoTyq4lzGg1ShDApw85iqBbh4A9W6HUNOTH9+dc6pEsurug
	dTZabjYv2mOjsqvVhj8N9/8CMrGckIdn5VVAUC5piufZHO/pI2biDM9Bw9ghAOcQyTlk4blVxAn
	AbqNUpBV+FyRrLCE+N5XmC3PaA5lNI0Rl9wdudKEP8e/PC+hGR5FwvBry4EaY7EJcagUmjerHZ4
	Fg6Cn61TC+fWF+ryyib1aMXak+yMov6zU
X-Received: by 2002:a17:90a:d604:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3958127a5aamr12212212a91.13.1787161664056;
        Wed, 19 Aug 2026 10:47:44 -0700 (PDT)
X-Received: by 2002:a17:90a:d604:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-3958127a5aamr12212103a91.13.1787161663548;
        Wed, 19 Aug 2026 10:47:43 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm3319861a91.4.2026.08.19.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:47:43 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Wed, 19 Aug 2026 23:17:22 +0530
Subject: [PATCH v2 1/2] kexec: return -ENOEXEC from image probe functions
 on mismatch
MIME-Version: 1.0
Message-Id: <20260819-mpilaniy-v2-1-95e929ede0e5@redhat.com>
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
In-Reply-To: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
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
X-Mimecast-MFC-PROC-ID: J0EirqFVYUWDsw0W8qT0R9-Ln5RWC1Alb9DhcBhDhuw_1787161664
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_104747_825583_006DEAEC 
X-CRM114-Status: GOOD (  13.96  )
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
Reviewed-by: Philipp Rudo <prudo@redhat.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
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

-- 
Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
