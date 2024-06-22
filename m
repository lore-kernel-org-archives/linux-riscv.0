Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEB0C27C53
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3W3pZMwI/VMMaXowmOU3sgA98Xd2o8z3q7gb7a+1GPs=; b=towy9yUATFMZJF
	Sg7d80+EU0dsK1sB+6DC3cEQpbz8O2Jjo5p7UJLsWuVU3j/2IClFNJYAqtiq3JFNOSTN7VCg0Bzdc
	nyArynjTHe3vIRHpI0UvtKrww98x6ZtObKnL2CZ6CHBI4268l7iMtIQIJIpg5m9bmF0FH/Ut+cIt7
	Bc7mcMABRqjx6+/aDxDNyJVP8Plzs5E/yWMS+98EsOH+A5PqLABXBVPc1YlyivflMZW/HCup43Rdu
	R4opYuJY4vT4EucrM94cLKpqyVXZemFMGDgnrf5r3w+aJpyr30Zza/AGEgQeIHAJapCQquF9jM24e
	FAzJKr8FnTbNIpeTIk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKz96-0000000Bz50-3A8F;
	Sat, 22 Jun 2024 11:43:04 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKz91-0000000Bz31-1IYv
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 11:43:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so287731e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jun 2024 04:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codasip.com; s=google; t=1719056576; x=1719661376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E477aB1ECVE/ZvIxn1l+Qdf3yr4/bnJp1j4La8gD7OI=;
        b=o1taU3ni0fdk2frb8dQPyHNuYjZW1qZJCOigMssuYdLaPv2JZdI9NtGO5vA9xmVjxI
         Sg6cFWLVikIyP1F1wYHlvXdDFjh6CpZol5leiD9i15+y9FPzBVJCo1MySmwy46FsJ23U
         k1vcX6oC/9M7OqyiaseU+vRWsv42Fy/EO0UmS7egr8XuzMOHqJiwAkjEg2qReXC0LuR5
         eIq2OYe4sAN4sy7a4fof4QoeRXKHjd+Jmktd0c6JH59IGTjfqlTEHaeO0A8FbLJrDVNg
         tvDtPS4RzUgRtqr5BMZwXEl7N70cEAJiKFUEWscfjSrAZRPeAN/O5kscdwvgnCfd0lez
         xLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719056576; x=1719661376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E477aB1ECVE/ZvIxn1l+Qdf3yr4/bnJp1j4La8gD7OI=;
        b=blnF687tC08aFTvlTduyW1cHNxn3Ihd1achxL5t4u7x4x/q9cJoCl2zo1F3buDwQr+
         a+7YitKmepYPUmEnNzb+SmuAPOAiIgRhaQvz26qcQTMXSW1TzPW0rEzmBLRolcPRH6Vv
         Z/UlEh4kGN5MX2QXUR9IhYfBFVp/um75stdkgHKNJ+gbBGNuuq5CCP6ruTzXEETiCP50
         uw5bJbBefAVaaQsVrqu5n7rGC3yk7Yd5dnfokfEuHJR0yiYRdLS/SZsXHFM5pvidfcFl
         iWuPUwzyjA0Rz/JVNAHh84cIGwrWbdcKfcLjxkrR0lOvuCjxPPhX5I0rhkZJwb2TV/K5
         o5sw==
X-Forwarded-Encrypted: i=1; AJvYcCVbYWNHAh7GwFkKIGRiMWcmK+wnPOFm509z1+0FOhP0gJ+rxJ+0VyGkF/+B/RBmSC8tnzhUqL8VJGq8pTfV7NQGs6RuBH/igqMKGPkP7UN9
X-Gm-Message-State: AOJu0Yy2YJNP7Y491Be3xpztHONlVlUy+kTxp6t6HaI1hOcjs1Y5CxFP
	FbdIIiAqmE83iUpvhTLuNvCIWZRWyPJRYoV6nSbqYTtbWvlSBQncgK8mN8yjbwU=
X-Google-Smtp-Source: AGHT+IHSZ8ayR4uLRulHxCdWN5OkqWhFpeJ+VWyWM+iaDruaLmDqzCj9Q0mReoHFMJLAW/RgQ0jG4w==
X-Received: by 2002:ac2:4e09:0:b0:52c:df6d:e52e with SMTP id 2adb3069b0e04-52ce0643d82mr233017e87.16.1719056575968;
        Sat, 22 Jun 2024 04:42:55 -0700 (PDT)
Received: from nb152.home ([2a00:23c6:2008:8201:ed43:a615:7f98:da0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d3afsm65786175e9.5.2024.06.22.04.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:42:55 -0700 (PDT)
From: Stuart Menefy <stuart.menefy@codasip.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Stuart Menefy <stuart.menefy@codasip.com>,
	David McKay <david.mckay@codasip.com>,
	Palmer Dabbelt <palmerdabbelt@google.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Fix linear mapping checks for non-contiguous memory regions
Date: Sat, 22 Jun 2024 12:42:16 +0100
Message-ID: <20240622114217.2158495-1-stuart.menefy@codasip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_044259_382479_9B35BB99 
X-CRM114-Status: GOOD (  24.76  )
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

The RISC-V kernel already has checks to ensure that memory which would
lie outside of the linear mapping is not used. However those checks
use memory_limit, which is used to implement the mem= kernel command
line option (to limit the total amount of memory, not its address
range). When memory is made up of two or more non-contiguous memory
banks this check is incorrect.

Two changes are made here:
 - add a call in setup_bootmem() to memblock_cap_memory_range() which
   will cause any memory which falls outside the linear mapping to be
   removed from the memory regions.
 - remove the check in create_linear_mapping_page_table() which was
   intended to remove memory which is outside the liner mapping based
   on memory_limit, as it is no longer needed. Note a check for
   mapping more memory than memory_limit (to implement mem=) is
   unnecessary because of the existing call to
   memblock_enforce_memory_limit().

This issue was seen when booting on a SV39 platform with two memory
banks:
  0x00,80000000 1GiB
  0x20,00000000 32GiB
This memory range is 158GiB from top to bottom, but the linear mapping
is limited to 128GiB, so the lower block of RAM will be mapped at
PAGE_OFFSET, and the upper block straddles the top of the linear
mapping.

This causes the following Oops:
[    0.000000] Linux version 6.10.0-rc2-gd3b8dd5b51dd-dirty (stuart.menefy@codasip.com) (riscv64-codasip-linux-gcc (GCC) 13.2.0, GNU ld (GNU Binutils) 2.41.0.20231213) #20 SMP Sat Jun 22 11:34:22 BST 2024
[    0.000000] memblock_add: [0x0000000080000000-0x00000000bfffffff] early_init_dt_add_memory_arch+0x4a/0x52
[    0.000000] memblock_add: [0x0000002000000000-0x00000027ffffffff] early_init_dt_add_memory_arch+0x4a/0x52
...
[    0.000000] memblock_alloc_try_nid: 23724 bytes align=0x8 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 early_init_dt_alloc_memory_arch+0x1e/0x48
[    0.000000] memblock_reserve: [0x00000027ffff5350-0x00000027ffffaffb] memblock_alloc_range_nid+0xb8/0x132
[    0.000000] Unable to handle kernel paging request at virtual address fffffffe7fff5350
[    0.000000] Oops [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.10.0-rc2-gd3b8dd5b51dd-dirty #20
[    0.000000] Hardware name: codasip,a70x (DT)
[    0.000000] epc : __memset+0x8c/0x104
[    0.000000]  ra : memblock_alloc_try_nid+0x74/0x84
[    0.000000] epc : ffffffff805e88c8 ra : ffffffff806148f6 sp : ffffffff80e03d50
[    0.000000]  gp : ffffffff80ec4158 tp : ffffffff80e0bec0 t0 : fffffffe7fff52f8
[    0.000000]  t1 : 00000027ffffb000 t2 : 5f6b636f6c626d65 s0 : ffffffff80e03d90
[    0.000000]  s1 : 0000000000005cac a0 : fffffffe7fff5350 a1 : 0000000000000000
[    0.000000]  a2 : 0000000000005cac a3 : fffffffe7fffaff8 a4 : 000000000000002c
[    0.000000]  a5 : ffffffff805e88c8 a6 : 0000000000005cac a7 : 0000000000000030
[    0.000000]  s2 : fffffffe7fff5350 s3 : ffffffffffffffff s4 : 0000000000000000
[    0.000000]  s5 : ffffffff8062347e s6 : 0000000000000000 s7 : 0000000000000001
[    0.000000]  s8 : 0000000000002000 s9 : 00000000800226d0 s10: 0000000000000000
[    0.000000]  s11: 0000000000000000 t3 : ffffffff8080a928 t4 : ffffffff8080a928
[    0.000000]  t5 : ffffffff8080a928 t6 : ffffffff8080a940
[    0.000000] status: 0000000200000100 badaddr: fffffffe7fff5350 cause: 000000000000000f
[    0.000000] [<ffffffff805e88c8>] __memset+0x8c/0x104
[    0.000000] [<ffffffff8062349c>] early_init_dt_alloc_memory_arch+0x1e/0x48
[    0.000000] [<ffffffff8043e892>] __unflatten_device_tree+0x52/0x114
[    0.000000] [<ffffffff8062441e>] unflatten_device_tree+0x9e/0xb8
[    0.000000] [<ffffffff806046fe>] setup_arch+0xd4/0x5bc
[    0.000000] [<ffffffff806007aa>] start_kernel+0x76/0x81a
[    0.000000] Code: b823 02b2 bc23 02b2 b023 04b2 b423 04b2 b823 04b2 (bc23) 04b2 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

The problem is that memblock (unaware that some physical memory cannot
be used) has allocated memory from the top of memory but which is
outside the linear mapping region.

Signed-off-by: Stuart Menefy <stuart.menefy@codasip.com>
Fixes: c99127c45248 ("riscv: Make sure the linear mapping does not use the kernel mapping")
Reviewed-by: David McKay <david.mckay@codasip.com>

---
 arch/riscv/mm/init.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e3405e4b99af..7e25606f858a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -233,8 +233,6 @@ static void __init setup_bootmem(void)
 	 */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
-	phys_ram_end = memblock_end_of_DRAM();
-
 	/*
 	 * Make sure we align the start of the memory on a PMD boundary so that
 	 * at worst, we map the linear mapping with PMD mappings.
@@ -249,6 +247,16 @@ static void __init setup_bootmem(void)
 	if (IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_MMU))
 		kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
 
+	/*
+	 * The size of the linear page mapping may restrict the amount of
+	 * usable RAM.
+	 */
+	if (IS_ENABLED(CONFIG_64BIT)) {
+		max_mapped_addr = __pa(PAGE_OFFSET) + KERN_VIRT_SIZE;
+		memblock_cap_memory_range(phys_ram_base,
+					  max_mapped_addr - phys_ram_base);
+	}
+
 	/*
 	 * Reserve physical address space that would be mapped to virtual
 	 * addresses greater than (void *)(-PAGE_SIZE) because:
@@ -265,6 +273,7 @@ static void __init setup_bootmem(void)
 		memblock_reserve(max_mapped_addr, (phys_addr_t)-max_mapped_addr);
 	}
 
+	phys_ram_end = memblock_end_of_DRAM();
 	min_low_pfn = PFN_UP(phys_ram_base);
 	max_low_pfn = max_pfn = PFN_DOWN(phys_ram_end);
 	high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
@@ -1289,8 +1298,6 @@ static void __init create_linear_mapping_page_table(void)
 		if (start <= __pa(PAGE_OFFSET) &&
 		    __pa(PAGE_OFFSET) < end)
 			start = __pa(PAGE_OFFSET);
-		if (end >= __pa(PAGE_OFFSET) + memory_limit)
-			end = __pa(PAGE_OFFSET) + memory_limit;
 
 		create_linear_mapping_range(start, end, 0);
 	}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
