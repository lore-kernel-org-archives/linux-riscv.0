Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01104C5474E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 05:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUCErEUQsbA7aFD+Ej3lbiupNt2NWMEEh6dEpMCsFJU=; b=g4el4zWbvQKxpo
	B4duXlzXnsQljMk1v+0MAuoo4NUXu4gqfl3Rqsq0v9irz/HiUbIwBZ2kXX2storzEDm8GA1aA539w
	EoeomD6uDUg8RWFqabW2txhJ5X5cNo9V/WCfVeqwHhXTf/gGidjbDgHX4WOtQjnP4k65L0Tam+L+/
	+7eOCXBKQ4b3xp8b1aPk6XDWCBmKKr6VZs8u34lclVtSIu794MFUhNUONkPvqezDnz/YiuPdYrOKi
	616Rqs9qCYlx9B0a7VsTYO2s1yekNh6BvpR4SlAdLDpO8cOoZqG8QEo0dFpribtqQM9ijMbAgvv9S
	Hkk7CaHSvUPdhfM5zz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBZQ-0000000DyTi-47V2;
	Wed, 28 Aug 2024 05:50:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBZB-0000000DyER-1fgO
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:50:07 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2020e83eca1so60935365ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824200; x=1725429000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfZJveM1parb4u035pYGD3zTISJbrOiZGzu54vNwlmI=;
        b=siCOFG+JH2cnMlxvDuTLRFVTCDsDWyEYnP0oYbeg7vsWu71LETXvGClEMxTnFYp2o6
         SK8x2ca1z/SPQluGufjuWqNNOydbAeLzplYPK+rqbbHZCdyPA/zXV9exNjilBTKkuclf
         sAOT+XMPsGooszhpXeIKMU/uBSK3dRRCMGVVyRJZhFBdZTV/UFDjXizWG+TW5SharDUn
         R1kXPC6zt3uhn+Dgq/iUEuI5C+D7Ygg65xBIqkpZMhwu+fZo/FFwUdnBQReCntTiGErj
         cu4LlNsMUi0OzlYoERoJdG+fwW4T061Scutk/T39qQ7Ssdvuxpf170BoEtjB/JoNctrL
         FoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824200; x=1725429000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfZJveM1parb4u035pYGD3zTISJbrOiZGzu54vNwlmI=;
        b=iw62zhBrC/T2khnXvhaPm1A3bbS9TYZUv4InMbkdCLi/HQEKQHh7hyaeC8j/AYvSQY
         eQ0piH47mAvKprCJ2VwGLhZXMbo2qd+1jYM9q+/g1hh2FFYIZdQPwX9+eeim9+ca24jl
         3nr/KkU5amTp6Fd30jXKqx1UEEIunouUvAx9jXJz1Vw/Fkmu6tFHnFbpkGdNpWOGHe6m
         K03XCuD75Vi1t3jk3G08B0FYRVT66zY20XQy6V4Lee/kuCceshRQYykAow3GymEjmpzw
         wLOripxcG7Td3sSQzHxkxSyUtBbJlCYXiVMfQ0bMblTw4T8D+FQIf5VBisjctTObw+DZ
         ojVg==
X-Forwarded-Encrypted: i=1; AJvYcCVVM9bbd1pn+OiP871GGK0i8hPZoFW5M+ZJzhqUYrRAdO40gex8sTh95AkeFdLHg1VrAjP3ogdBBDPtEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmKktKd//iOi7t3xBiglDcGX3+HW/WHHYqh50yAgm1VHV4Gw07
	hmFvOhWfEAxbPmV6Mj4s3Kq6l0Mwj+qvnMwoem7ny1n73UQKLT+mLCbi5TLugJo=
X-Google-Smtp-Source: AGHT+IF596NtgPi2otbs5poJBgAoGUDj9IXzCrdKWZMEp8cIFyXQZx8MxZQO71jW2zsopg6SUNTImQ==
X-Received: by 2002:a17:903:2352:b0:201:f065:2b2c with SMTP id d9443c01a7336-2039e4fbbe2mr155506935ad.55.1724824200296;
        Tue, 27 Aug 2024 22:50:00 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:16 -0700
Subject: [PATCH 10/16] arm: mm: Support MAP_BELOW_HINT
MIME-Version: 1.0
Message-Id: <20240827-patches-below_hint_mmap-v1-10-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=1syBnrvTSOlOGGJG9VxttpQivuBkydj5+eNQ5N/relM=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XfH7+5/NObdD1TC7as2nnrut80uYIpiTE6QKMsStV
 jRo9UV3lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJH3iowMbzKLnvWynRbmDQrg
 3uNwlaGFp7De9nT0tCfZV9Zxzb2swMjwZeP9u8Jhqpz79ln+TNZVkXSd3DxD3/DEm3BhhnWsrp8
 4AQ==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_225001_712995_BDA5E078 
X-CRM114-Status: GOOD (  11.86  )
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
 arch/arm/mm/mmap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index d65d0e6ed10a..fa0c79447b78 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -71,6 +71,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
@@ -122,6 +124,12 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.length = len;
 	info.low_limit = FIRST_USER_ADDRESS;
 	info.high_limit = mm->mmap_base;
+	if (flags & MAP_BELOW_HINT)
+		/*
+		 * Subtract (STACK_TOP - mm->mmap_base) to get random
+		 * offset defined in mmap_base() in mm/util.c
+		 */
+		info.high_limit = MIN(info.high_limit, (addr + len) - (STACK_TOP - mm->mmap_base));
 	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -137,6 +145,8 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 		info.flags = 0;
 		info.low_limit = mm->mmap_base;
 		info.high_limit = TASK_SIZE;
+		if (flags & MAP_BELOW_HINT)
+			info.high_limit = MIN(info.high_limit, addr + len);
 		addr = vm_unmapped_area(&info);
 	}
 

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
