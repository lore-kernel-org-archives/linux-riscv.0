Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94459606A32F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z9yzoMxJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QYVSy7KJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=F9AZFOeBmkljNX/K3Y0tcIWhdk95kJssXfTAjuLFEm8=; b=z9yzoMxJ1Q8sqv3FYmECKfdXcY
	6dNYLs3VOBN22nHYjrU+qMXxGZSXoqogEK2DhMLFQpDpc3gTXFeNunFCWBO5SgF7kbgSi5dxxBlb8
	N/rN7dmO8VmhrD/oCd51eaPvj6lFpWQJk3VuGNvtusNROOpbDyRf9LnWeiSUbuhsL6+6Sy9cyi2y5
	SOsZMRkor+cutqBWzCEoNTCDihqtB4G05dckDanCAehZjaDIiSzv9gz9FbWQ6SZLzwmN08oBXRC0E
	+3Msg7XkFiKlOfwmOTEVsh/AmsKuO4siLATdvt8TTZuHiILBkUF/HXAdeiucB/EkEVS3XQZvCj7rg
	WYSVP1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIC-00000009tIr-1srN;
	Wed, 18 Nov 2026 18:22:00 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkI5-00000009t9c-3FGn
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:21:54 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso7654605e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026111; x=1795630911; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIsEMXco2ZhYz3ZqDjy8jJcFD62W77oBBUIsxaXAIKQ=;
        b=QYVSy7KJzF5D91OJeB2pysp4u6bDJ5eWimRsYzQcnYPjvR3P6C9GIOHQIwHtsZS2G8
         t21t7bMwplDvBmkSz0kTIGEq+aiFZTfQFJubRZwZXx6rjRRmeIuTtJ5rv84fLYmwq3WH
         rRSfXdicsv4bwOGtEaLkBmpbjbN6rsdVfdZ1j9hFcrDNcEWwVyXjo4gQRTi1+RdwdtkU
         ElKV/O3ZjDf8o5XqyZfzeiSTYmLYAPpnA8TQ22izXLPjZIBO8lPaSDO2XYQfZ5yrQZhV
         qQl4FacR9sW1JzmCHVM5X5G2g3khpmAIkaa/52kejxX4xxQcDTlhkIhMnlksJzr8uPTR
         OIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026111; x=1795630911;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIsEMXco2ZhYz3ZqDjy8jJcFD62W77oBBUIsxaXAIKQ=;
        b=pOnM//PGwIzUgx+RBDJ0UIVuhbq3lAC3lvtNXUWqEEKgXflvOJzaHA5tAiKpM3IAdN
         CX3W81g5g1QLW1Rl2l6uLg2EmO+kmDdY2Az6rdhwtatFCb0/IWETN8VYOg7qg1ZGn+7A
         IKulZasP2QwU/Y1r/bjzY6yxOQtTbdQamXxLJseYwJIPjGoPwPWVj4B7RZFEL1CHUVYw
         EZT1xl6VuoK9vnf9cIusnV5y1BZ8unP2d52/h0HOYHYxTv7GES3UyLoUK6NhdDs5D+lo
         5uYCE2HHzSTw2F5f0HO8Dx8gB9qXeJ+dpWITjCoQR+YookOrg+lQi1o8NekFRVrBTHxw
         KiYg==
X-Forwarded-Encrypted: i=1; AL+hErGFbaeZtTOgkSf5EJkM0HleSYBQnslW3rs1aee223ExHjrlpBkDKimd6wM7pazCGbnwgwS/eSPxzVLxpA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9phGMcgRu0UJN1I8D7pYlAtd5UBjOFTDzaNEkwM7pTyL22KY9M
	BHA2/3Yux6byOP9+Jc4EESQyfAF4o3BpaCgtMS1rp7S7ITunLtgE6SVH7E0Y5G9HmHpR022law=
	=
X-Received: from wmbju10.prod.google.com ([2002:a05:600c:56ca:b0:4a3:5dec:ff72])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b6d:b0:4a7:6425:c274
 with SMTP id 5b1f17b1804b1-4bb7d6d1d71mr71002175e9.2.1795026110241; Wed, 18
 Nov 2026 10:21:50 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:09 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=ardb@kernel.org;
 h=from:subject; bh=tNN7kvvvqrlVm6V6P5FGp3YhgkjQslREMs9fj1wtyFY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm2n9dqmF22tvpj8prrwkcChNKiwqKunG9i7vLGkGk
 5VvOHM7SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEScZBj+mf9ey6hv/kNuk4P6
 Ua3fjPfW6spdF5s465ttrbKUheWZyQx/JTOspZ0caqaxyXeG69ewGNybOWHKr0bNpV0dTc9kUzb zAQA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-24-ardb+git@google.com>
Subject: [PATCH v4 03/19] riscv: Make _text point to the start of the kernel image
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102153_835835_0F64AAD0 
X-CRM114-Status: GOOD (  15.23  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

On RISC-V, _text currently refers to the start of the .text output
section, which is placed after the image header (.head.text), and is
therefore equal to _stext. On other architectures such as arm64, _text
refers to the start of the image, and is used as such by generic code,
e.g., to describe the kernel mapping in /proc/kcore and in the ELF
headers of the vmcore, and by the EFI stub.

Now that arch/riscv no longer uses _text to refer to the start of the
kernel code, move it to the start of the image so that it is equal to
_start, and the distinction between _text and _stext is the same as on
other architectures.

This also means that the image header is no longer omitted from the
/proc/kcore and vmcore kernel text mappings. Other users of _text, such
as kallsyms and ftrace, only use it as a reference point to calculate
relative offsets, and are not affected by this change.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..9849a3e4d102 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -28,11 +28,11 @@ SECTIONS
 	/* Beginning of code and text segment */
 	. = LOAD_OFFSET;
 	_start = .;
+	_text = .;
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
 
 	.text : {
-		_text = .;
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
