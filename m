Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ED8C5474A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 05:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2RxAC7uECQJ4SWGWzOA4mLYlL5kjwyxvjaZWPHRkCM=; b=JJZ4pEfvPfcm4z
	LtV5YFj21+xmVW920V44NTtTelilSwZEhkRmYWTF3IVnxtFGLrDK1empoBLivwabaAlqDU+SLqrFK
	o6ED5Dr2rATNOHbICC1lMSngfHQWowXD9V4AvH+oJ3pweYHRvDtUPXf6sZQRr5EVRKEt3vEnjbwxZ
	/i3Aquey/ACK9LGyxYBnkO/T4E1pNaWqvnrGxBkc4XfH/IooahjHlfLa9bmfMRGrufriZy6EhKymY
	aqzOgscknNQCXrz7iHYNgt5JKGYLgo3yDbiC39he1Zjn/uUzMd6No3chwc3Ua4Tx6Y5NT8nbpngEV
	Zj7G3sfBmK2TCnjNKcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBZP-0000000DySQ-1JqT;
	Wed, 28 Aug 2024 05:50:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBZ7-0000000DyB3-3sfQ
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:50:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20202df1c2fso1730645ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824197; x=1725428997; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNQglkp2lEnIf2YsbVUEYoAS4AW64pe58tBCUjsMipk=;
        b=AVzAU8Qok140+NMGbtEpVonb/54rsHUVOLRFC2OcQzxrkWQT95IBnsskApXJCZYshX
         iq0AB6I7aIAxS2qLjxcmsbt5izxOVut1euTeavBk1hrMWNYkNlKWsxffeJ613EJxZ1h5
         zhnq2Mjt3yRso0pIzWwL3JY+lU/5ju72s8m1jpf1nEmD6p6goypZp0SIPp0BLSZ/Ub4b
         5YPwQLAeU1aEPjlU4fQXfNaT6dZSLLHa4A5w0kB1H5K4UAs6/LnRm1g8LQ90BwhNK1RN
         JcAhEVxnS5BulREKOpcJ0qEClUnuLz7sHTjzasWK4FSY/8K3hpCFuuojgMEFvm2+WxuG
         Rp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824197; x=1725428997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNQglkp2lEnIf2YsbVUEYoAS4AW64pe58tBCUjsMipk=;
        b=RLSUf3hdbc72xDGx5ngJRYH9qTBCL98NSYAFUXVBdozdM/fAfp6yGAORFi4tCpxrpF
         ZJBUaxMIRPiQ/ilX/1LYFIGvvuZT0hDpVq/Nv6rWiMxT4fsC7J/NNjmZAvpM3iDNN1Rt
         7XZkYDOGksB2ayIjx8o6sJ7NkHUJ+gdzmHMmrALMdk8KJ41STqP+/yVChFBPecreLUL+
         vMUP0wrwr7WeWq+A9HadzTEFtqjPB/b+OY4tUUQyAbPyT5S38wiGwIrLpre9ZhAD/oFK
         dHt0zshXblMVuS7qXtTgqvsZFdNf7EOMyNE016fvG3SnotpaXCEuefYISn5s3LZ/dSoB
         WFgg==
X-Forwarded-Encrypted: i=1; AJvYcCUXu7ltFQ5CZY9gq6tXLzsXbKfg3ixKj3k/ylbzjwUmeCktrIKbwWnkieZoStEpWwOeaVoilGRPADo37g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCN4gzzkPKHGrxRcaYNqNS4/y+QZtujr1NVthYlSmp23CRMmUC
	jmkmkhE3aR4j54JaTs0D3/nH3xtM0BfuRaWkLiQxuVLtEHzyV9g6fkN0XxHLL8O7XpFphE3H0yU
	R
X-Google-Smtp-Source: AGHT+IFNvFc3w8ZqIqMUtm2tpVZkKTF+VkfsFh2Ia3nc64cPU9VogTthyuHsPbt4BWtQWf7nibqVyQ==
X-Received: by 2002:a17:903:35d0:b0:1fc:41c0:7a82 with SMTP id d9443c01a7336-204f9912733mr19643175ad.0.1724824196945;
        Tue, 27 Aug 2024 22:49:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:15 -0700
Subject: [PATCH 09/16] loongarch: mm: Support MAP_BELOW_HINT
MIME-Version: 1.0
Message-Id: <20240827-patches-below_hint_mmap-v1-9-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=mXZWgvc5d3nCYQqiz9PUCvFecQkJ9kp2ZooPsTsZSyA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XfFl5t2npeO1W6ydtL9v1qitmfF53Tr5I+FmGy5eX
 hv8Y0JgRykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABeJZGTYs2fGyX1L7U5s/pDP
 9zI7cOPnH9u8t8ZNYFCaqKg8I9+uk+F/YeihTo3z92Iv3r2a7r74pUGE/VYuj+S6OkvJ82tdPk5
 nAgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_224958_208605_59D4DF7B 
X-CRM114-Status: GOOD (  11.66  )
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
 arch/loongarch/mm/mmap.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
index 889030985135..66a5badf849b 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -70,6 +70,13 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 		info.low_limit = PAGE_SIZE;
 		info.high_limit = mm->mmap_base;
+		if (flags & MAP_BELOW_HINT)
+			/*
+			 * Subtract (STACK_TOP - mm->mmap_base) to get random
+			 * offset defined in mmap_base() in mm/util.c
+			 */
+			info.high_limit = MIN(mm->mmap_base,
+					      (addr + len) - (STACK_TOP - mm->mmap_base))
 		addr = vm_unmapped_area(&info);
 
 		if (!(addr & ~PAGE_MASK))
@@ -84,7 +91,11 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	}
 
 	info.low_limit = mm->mmap_base;
+
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
+
 	return vm_unmapped_area(&info);
 }
 

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
