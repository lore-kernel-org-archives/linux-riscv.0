Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024A8C5474F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HPIhQTiB55PjWz4gjE3bP8xB4UBkFhevFsWVug4aNU=; b=06haOBxXwTPdzV
	Uim1ESQu7aIU33/HWrquTAqKjnY4kFNA835buO7pj2idxzhX1qang5x/aL3qpzax5XvdSn9aLrd5b
	cFdWkeAWgVZI1bNpdhqkY0mmjuRuElUi2UMaFJ2LdgnhVyMsf8bL+FB3VsibTEFCF/GIHDdGW5S+e
	pjQ1hC71MjpRKIhyGqndGl6T9QVrFg0OS0Sho9ESv/eaYf67czWy7QPBnV3SP7fgnZo2kkHSaLZT0
	J2Wqo2zH922Rb2zYGWypdxmOVdhs8Cvkumu0uQqTz9mThLnk2ZZEk2ElWM5VgQQQ4a3oXxzErtf9E
	SHSUV0PLe5/OtejlPqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDbe-0000000ERKz-0jDc;
	Wed, 28 Aug 2024 08:00:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBZS-0000000DyUK-1YWy
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Aug 2024 05:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cPn63wqFJg/NhDtyE6TA0coeolvG0b692sVkrxs6h6w=; b=PiB+2bz8AKdOVWhOQLvvRt1C71
	hhEMGLE/UDPxaUj6mXZX9hqQt0sxZsqJHj5bAWzsC6BKvEQ4eahDho3taqc9e+Y1M3V8YzZDpA5kt
	IAnZIVaiOT16zXyn6Yr/Hth9GAWc9cjhcT2zyeb7vCbbyL/D5Kfp97jDT6yk1c+bq/ixRyJ3RVjxX
	MDyccMj4KP/0KvuLHSuGP9IfknQ41ck5evj7T7B/uPqELNX+8TtdihiEsH5nn/z+uwseN8qdd0jGO
	YoiLoLF4ZtfqZminCMQ134mnxVXVzwp5PK5Ol5fZErAxUFSEzk2i7NKSGKyxeh9Y93taZyxQnFjK0
	UmQVLENQ==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBZI-0000000B2zP-11pV
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:50:13 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso4552939a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824204; x=1725429004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPn63wqFJg/NhDtyE6TA0coeolvG0b692sVkrxs6h6w=;
        b=D9legY+Mczb9Hk08C7XK7ZfI2Fj1d/Z/4BDY6j/ISfgogPV+q3cwdKsuUHmvBjQgc4
         o2CWdfWl+/5bbDsrbNJXMoKG5jkZ4axNCXY+FIBpRp1BOfgyuDxhfzOe+tX0VPdYEJm0
         RS2Zs6jw3vByAxW617mtkto3BgM8NV74iG8AvZAH0NTZXcLjuUFKpb85umHGCbzRZCIG
         togtnLmfwxFeN+T6wi4XoJheXFDCKsCbAUDupHa8RdYYiTH+YJ7p7ccII3iACCFOIIEB
         89BJgc9LY9yzDHDjU8pKMW5bfGL0OPP2Puc3FJUWKlJ5u/JbTFN5sMK15llgHGEX2/bB
         x+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824204; x=1725429004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPn63wqFJg/NhDtyE6TA0coeolvG0b692sVkrxs6h6w=;
        b=nmPnWgu1UdzWHPGDOzjAwnNLL7MClwkIm2vldsAuUW6aIJo6YS4C9Q4S8ndTFJReXi
         +e5M0HL+7+cSgqi8ZMrFMWgiIzC6krSoZaKqG8lttF/0rzNulvm3w2rAJ2jpjJq4dKXr
         ENFoq0rW/t1hDgCnm8A8rlzal40XXHy2jIOwkCwX/xmStljazaJNwfQGXwrbYQKKwfk/
         kSmp41nifRs5lEf/wprjNVZAwky3Czusn4NLxOpi6oh3IxMams0IQUZTqLuKJWnp38MV
         ycY6/AGT9QAAy3/86gxsEDgmEjnh0I/7vBeoSjW7h5wy9MBevNCPknLaEoBdzx+tnF1Q
         ezaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuSwZmcVCtJO7iQuVO2rJ2cneuCj9MIu4lMuen1eSx1LjzBNt/D8jtonTMdABAm4Igqxv1g3aoRr8Cmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX0Ep50fUDhUhKkDjnDCR9QVxyzG4Nlc6T18lmUIrtkb0OVq//
	EVolejhiFadqb97yjfGB68SOEcRrWYr4JuMnp3Vxstsdkaa0soSC8Q9TX3vWaj0=
X-Google-Smtp-Source: AGHT+IExz2l4cJy30WX6CK7UJnnTV99XpNodRNjqDrqaX9iShx7VT4aEy+MVWDHksfv413xg6BHqWQ==
X-Received: by 2002:a05:6a20:c6c1:b0:1c3:b61c:57cb with SMTP id adf61e73a8af0-1cc8b63e7admr19641639637.53.1724824203730;
        Tue, 27 Aug 2024 22:50:03 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:17 -0700
Subject: [PATCH 11/16] mips: mm: Support MAP_BELOW_HINT
MIME-Version: 1.0
Message-Id: <20240827-patches-below_hint_mmap-v1-11-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=hr+5sO+DwZ7b30hixHrcXcBJzkXJVKP+oyQ8pDF00F0=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XQkfk1qWxrKnZbieZ1K/6LSwKGjL0hcztOaE2KQe3
 3vFh3FJRykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABMReMjwm1XqYMYTd7kZ029e
 Ywn89Unq1bGI6TwyXnVzFq65HWqvWsnIcHriXK9fRsZbv646duvxv8pFDmYGX/naxDT1E9+JfDu
 ykAsA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_065008_562444_AB2FC40A 
X-CRM114-Status: GOOD (  11.28  )
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

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/mips/mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 7e11d7b58761..1595fda284cd 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -79,6 +79,13 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 		info.low_limit = PAGE_SIZE;
 		info.high_limit = mm->mmap_base;
+		if (flags & MAP_BELOW_HINT)
+			/*
+			 * Subtract (STACK_TOP - mm->mmap_base) to get random
+			 * offset defined in mmap_base() in mm/util.c
+			 */
+			info.high_limit = MIN(info.high_limit,
+					      (addr + len) - (STACK_TOP - mm->mmap_base));
 		addr = vm_unmapped_area(&info);
 
 		if (!(addr & ~PAGE_MASK))
@@ -94,6 +101,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	return vm_unmapped_area(&info);
 }
 

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
