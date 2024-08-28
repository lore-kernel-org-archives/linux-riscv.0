Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96831C5472D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 08:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfOZP4Dy8GZKok9ZJxRQ3hBvlgiQpZ6OKv+KEXwzYew=; b=GXIB5hR7ZbTSAl
	gHx8cSm5kIDvSJYPCojIiLVwGcWk8U0W52rXoAT0GdE4pC/dgcOEd8Brd8Y3UcNBlIoo9sy7hFEDq
	AX1sws36rjFErp+CqyneesDbYizHCR9JmiI+OoFVeCsrH83WHJJe0F0BdM/79by4YBYr4xZnT6rgt
	cadxg8G5lodcZ6zccgEKBvH2criR6QuVC+h9L9akE+g184MW0yMsM0fMjdT46DBHi/VZqI3oQw6wq
	1mCymApnkxzRlrqnYlgIANc2uX2z3Nvo/9KhBIwN2Hqcn8Pui+68HF0m3I8UZChaESfvxM0Qrvsgc
	8W2dxSb5LbgWbKi2I6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDbb-0000000ERJU-2XTD;
	Wed, 28 Aug 2024 08:00:39 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBZ1-0000000Dy3S-2beL
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:49:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2020b730049so49696375ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824190; x=1725428990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01svQ9ue7Mr4CWZ3Wn0HVoOhr4xAPnLaZCO9CnTXUgc=;
        b=vOxBBOfJylyjMW3fg3vFp7eEgN9QihYdGz0PWEzM4WKpgkbW7E1O0V2BJVar8sa7Mt
         z/HNJHvJ+kA/RvA76B2RnckrBwOj1oy+v31kGwzFooerw38SjDfTE1vOI4os9fFuLF5i
         KUYPJfulna66O/FwMycA8Np4NDbd8Z24sk2Y5aestiP9ZB2chOBsauBWXZK7mQ1GR2Jm
         KrMoi4uGooxojzlpIRoe3RARhD49Vke3PpMvHphbCM/9OS8cVm0wDbH8dp3L8AQjzdav
         0AQOA5Uke1zlVlz+oXeJHjRg9mqHXK1A8ZSuNRM7qeuBmIElPj52WzY1fWGXY8qXG3XQ
         cGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824190; x=1725428990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01svQ9ue7Mr4CWZ3Wn0HVoOhr4xAPnLaZCO9CnTXUgc=;
        b=Vl9TBXsFqV95LTlFBl6mTc1ZXAeABOWZK4V5/ypTcqQQy9zr9N0nhu0/ZDjCKVMqPU
         SHIbNQuD4UCLSvv0rArqc503uV/moKSIe3TaIqUwBpfnYr4lUEMu/dm/V8O128UR/6Cz
         jwB+sixLc9ItS/WWcVdmsKJ5Mw1VU6+OL7iytya5S1iOL7k3MDcCCh6YyBDq2+9isrpV
         j/CGza8EOUDk5sFQJC5fieTTDNws3EyrlPEGUTSeoDTjBkqSHw1xQO60CbFPqpRFzV7B
         0JCeSZ1QA6SW8LFXDZfBJWdeaMRk3e6z+qAfP+X+wWer4suSZrzoktnxgzh3RIsdoawl
         qwOw==
X-Forwarded-Encrypted: i=1; AJvYcCV44PO9hkWzcTI/LcI7Dw9BFLKXoctCPHQTdcDvVqTi8VVq/rISfRaP29VT9cn2jq8MQyLazJ9akhHY3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzffSGrNNDaQHAKXNFxsMlQWAD0mFdsLb1SUfQT3vDTp9wubmh
	nANbhzU/Oi3vw6YHaeW8jSxe6FeraF+FpWdHWu69/PBFSb3Lwr3KohFQFNVRpas=
X-Google-Smtp-Source: AGHT+IFEjwUM/ElshIB7y6tneVtatsCyua8fDLSA2/rXWwDoWBaTV3bT3kKjnxkFupcj6i3KTQazzg==
X-Received: by 2002:a17:903:41c6:b0:1fa:449:1dd6 with SMTP id d9443c01a7336-2039e510e6emr137316635ad.48.1724824190164;
        Tue, 27 Aug 2024 22:49:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:13 -0700
Subject: [PATCH 07/16] powerpc: mm: Support MAP_BELOW_HINT
MIME-Version: 1.0
Message-Id: <20240827-patches-below_hint_mmap-v1-7-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=efrv8gA6WD0kUzxMoz7FX/k/QnHAbRwwUgR0y2hEUd8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XfETrh9IO7T/uFjUxMhNQooG1iuWi1pdtJg6YcLD7
 VUZ209HdpSyMIhxMMiKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjARbV+GvyIzjrH36plzvXDr
 3H/Wo2jj7SdL50ufO/vC42XF9noOjvuMDF8DvSaxHlpya2VRHMuNXyrdOxW6nj44wHJxyn8TwWv
 XdrEDAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_224951_784242_856E6447 
X-CRM114-Status: GOOD (  12.67  )
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

Add support for MAP_BELOW_HINT to arch_get_mmap_base() and
arch_get_mmap_end().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/powerpc/include/asm/task_size_64.h | 36 +++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include/asm/task_size_64.h
index 239b363841aa..a37a5a81365d 100644
--- a/arch/powerpc/include/asm/task_size_64.h
+++ b/arch/powerpc/include/asm/task_size_64.h
@@ -72,12 +72,36 @@
 #define STACK_TOP_MAX TASK_SIZE_USER64
 #define STACK_TOP (is_32bit_task() ? STACK_TOP_USER32 : STACK_TOP_USER64)
 
-#define arch_get_mmap_base(addr, len, base, flags) \
-	(((addr) > DEFAULT_MAP_WINDOW) ? (base) + TASK_SIZE - DEFAULT_MAP_WINDOW : (base))
+#define arch_get_mmap_base(addr, len, base, flags)					\
+({											\
+	unsigned long mmap_base;							\
+	typeof(flags) _flags = (flags);							\
+	typeof(addr) _addr = (addr);							\
+	typeof(base) _base = (base);							\
+	typeof(len) _len = (len);							\
+	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);				\
+	if (_flags & MAP_BELOW_HINT && _addr != 0 && ((_addr + _len) > BIT(VA_BITS - 1)))\
+		mmap_base = (_addr + _len) - rnd_gap;					\
+	else										\
+		mmap_end = ((_addr > DEFAULT_MAP_WINDOW) ?				\
+				_base + TASK_SIZE - DEFAULT_MAP_WINDOW :		\
+				_base);							\
+	mmap_end;									\
+})
 
-#define arch_get_mmap_end(addr, len, flags) \
-	(((addr) > DEFAULT_MAP_WINDOW) || \
-	 (((flags) & MAP_FIXED) && ((addr) + (len) > DEFAULT_MAP_WINDOW)) ? TASK_SIZE : \
-									    DEFAULT_MAP_WINDOW)
+#define arch_get_mmap_end(addr, len, flags)							\
+({												\
+	unsigned long mmap_end;									\
+	typeof(flags) _flags = (flags);								\
+	typeof(addr) _addr = (addr);								\
+	typeof(len) _len = (len);								\
+	if (_flags & MAP_BELOW_HINT && _addr != 0 && ((_addr + _len) > BIT(VA_BITS - 1)))	\
+		mmap_end = (_addr + _len);							\
+	else											\
+		mmap_end = (((_addr) > DEFAULT_MAP_WINDOW) ||					\
+				(((_flags) & MAP_FIXED) && ((_addr) + (_len) > DEFAULT_MAP_WINDOW))\
+				? TASK_SIZE : DEFAULT_MAP_WINDOW)				\
+	mmap_end;										\
+})
 
 #endif /* _ASM_POWERPC_TASK_SIZE_64_H */

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
