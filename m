Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D75C5474A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 05:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oE+bqKj03gciBOHFC9jW8X6oVWSmeGRujGWIdzC3UQ0=; b=i04y8oplMJLHVh
	21lLIsfIfzc9wED8uDx31TpoLdAas7TPWwvMaSKEAMyJdUO+yYSK0hx0HERMFsW6wyLbdDF4vrBkV
	OoJfEWTEVT2XyNjZWpX+P7Jhe7cyLm4fuZxNYqWDdWe3un+ILPfy9/k7O6m/wx0JxcxdW/2WeW5lY
	qauowal6e9l+j+jVjncPwnqSxkdu6NOj6oO53tMGRHf/awwG1BVUsIxpPd4P39qD71EuxEEH3UpOT
	DcuIkLTCCTtrUHOW2EuXtd3w/fF/nT9uYM+9Dq+QZOUVc+Ko0rYcUgmQNyn3UzIgrmUXIayqpvjmZ
	zIeKkALQvkgPKBLTfXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBYh-0000000Dxmh-45tm;
	Wed, 28 Aug 2024 05:49:31 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBYg-0000000DxlS-0amC
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:49:31 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-201fbd0d7c2so52360425ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824169; x=1725428969; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s842qMNTVJPdnaHjTgUH53HGzrqC8L35w1DIbWpmxjE=;
        b=di+mOgLTxniJ6s/PXutNlO4iDIs2uyEuHIDO5NoxWDrdlg0Mj4opFOs7HagBGCjB4C
         iYGDLSQriYr9dXNldLn6gaf6LD7xbF7KQx0QIPOxwuUWWB1QVsbNHT/g4wyY9nb/DsG0
         Vr6BfLbyFB4/0nI3wndqMVYSJSFzJEpPEB6BiBGFkaEK9wqMDAI7MKTz1Cw/88MYqjpc
         3rzwersvpCiaBLuCblsbP5lnnGDsUkAvIqRw4p26otlS7QRsh9fOEoGwczRXIZMmBrLc
         JzIJsze+NOFhwR+0Fpbi2rzbz9rVBIVT3lrhE/9XK55Bl9Z5SwTuOWpA+hW7dzPHtATl
         r4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824169; x=1725428969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s842qMNTVJPdnaHjTgUH53HGzrqC8L35w1DIbWpmxjE=;
        b=YgA3oZ3VCUWY9d0sy/3boMTBsv8ZuxbLVeb/5A3pWgdqnNwe80O64RXbkrcPbAfrUG
         UMhFGGesY59SGrQne73kUhoZCQOFfgczOgqa4A7Vd3QJkAWELCnn+Un1Snd0sW4bYyx+
         heMumLzKWzfxD10mc4mYzCKCqK3puEk6X7ylnywn7AWagvCGZj3JJNRc97BXx3eDX926
         iyEmph+ZFalOcVv4B4E8UBtqZow4Pnvg8MiBsCFjPYmc/Nbmh8Ufqy8u8Rh7MH0uGGml
         fUpojlhqhua626JkCLTV53oBqisekDMl8ZBgbBwxY/WKP6Md4ecdrVBEkf4ehREGtEds
         KYrA==
X-Forwarded-Encrypted: i=1; AJvYcCW7xu/ZcaZmAlrQ6WobP/kqK2kev2YiBInOT2vGlcArxuXkBOYdyZyX7caVcTA5oWDywhSu1iCp7P7FHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyid/9eF6SyKsgWe3vjz6Jd/CPWXi4/6aEKodrYGC90Esd0cBVg
	67g0Mu1TYD1R8Urh4huNU4vkQKzmyfis/fvqKvQY5kDo69yacVye28slY/BT9hw=
X-Google-Smtp-Source: AGHT+IE7iBIF/ncsUM+UTT7p6QlENkfnsLUglL71vzMDiTXQo3W/0gxhDidIM3IPRiHs8W/EU5lCPQ==
X-Received: by 2002:a17:902:ce83:b0:1fd:92a7:6ccc with SMTP id d9443c01a7336-204f9ba22b4mr11347335ad.30.1724824169192;
        Tue, 27 Aug 2024 22:49:29 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:28 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:07 -0700
Subject: [PATCH 01/16] mm: Add MAP_BELOW_HINT
MIME-Version: 1.0
Message-Id: <20240827-patches-below_hint_mmap-v1-1-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1656; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=tmMz4K99F0U2eFjTmXZPsRyQ5BJlKhVYtlPfqgJsjxI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XbFSzP1yPpXBlYea467kRPvaspyLaj1+ty58k+rfy
 b+vtHB1lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBGZFoa/UreElT5ecG2dxnH1
 4+SJG05OW30u9uBl4X2J5vXXMs59v8LIcOvZs96dRZxGwS//rJlxOfEru+W5B7X39RYcjRI4YV7
 3gA8A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_224930_220817_1E618450 
X-CRM114-Status: GOOD (  12.47  )
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

Some applications rely on placing data in free bits addresses allocated
by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
address returned by mmap to be less than the maximum address space,
unless the hint address is greater than this value.

To make this behavior explicit and more versatile across all
architectures, define a mmap flag that allows users to define an
arbitrary upper limit on addresses returned by mmap.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 include/uapi/asm-generic/mman-common.h       | 1 +
 tools/include/uapi/asm-generic/mman-common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index 6ce1f1ceb432..03ac13d9aa37 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -32,6 +32,7 @@
 
 #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
 					 * uninitialized */
+#define MAP_BELOW_HINT	  0x8000000	/* give out address that is below (inclusive) hint address */
 
 /*
  * Flags for mlock
diff --git a/tools/include/uapi/asm-generic/mman-common.h b/tools/include/uapi/asm-generic/mman-common.h
index 6ce1f1ceb432..03ac13d9aa37 100644
--- a/tools/include/uapi/asm-generic/mman-common.h
+++ b/tools/include/uapi/asm-generic/mman-common.h
@@ -32,6 +32,7 @@
 
 #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
 					 * uninitialized */
+#define MAP_BELOW_HINT	  0x8000000	/* give out address that is below (inclusive) hint address */
 
 /*
  * Flags for mlock

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
