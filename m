Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BE0C5472D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8Ab5+T0IdQC91lu7WZL2emXcGkKK31Ecque4JLgOSA=; b=kAdQs3lsKE4WuW
	a23ujooBQmNakqpPDegHIsetoTHtLaQc43MolFWOgEZwPnOzyG1zTcQKjxCXfYieFFdgQ1yjFXrdw
	LB2Sp00WgnOz+pmfhLbUQ6MbJEKVYSQZPQY18xRtQ+E7g59LVr7/h0voFijPCo4ErHrhHPsQbmsJY
	2c+BSuB+f5gkDjj8XQlLCPnI4jEnu8N/XIiPaZ4MallLXiQqbeNJYlunDgTPL7u5hQsaMG7Gl9hxd
	CvRkZxFQmHiggtN2knrfA8PfGYfJPoTL1IDHaSttLqCXz790P9eqASKrHXCEyVgeEean9avI/RYRH
	pr0yqtf2wa4bF8zD05ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDq8-0000000EUkD-0v4e;
	Wed, 28 Aug 2024 08:15:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBZa-0000000Dyc1-17e2
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Aug 2024 05:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=N47VMRtMS+23qmQV6QvpGjMmEbWavAKSyy/PH2d+fuI=; b=eThnSJ93ECeIUu5+sJhE6kZEP8
	VXGchm5lYXQznWXPMN738wkb1TcHqYlXmnw2tr58jjztrVWZ0aWge/d1IRZXotKR7bN708qhOyeNy
	R+lCuR+HUhz/7Fmoyqahx1txCZjcSTd87OUgk1I44BxUKQx0n2qxgOmaHoWrnqerEDVEJHuKsTy6n
	qyuyBIgfD7Wu4WxW170bfSICSpcJxRRAZAPXw0TwGTOE0Gx3pSSXzUBNnXEyYBRAvFcsMKv8aHTZM
	VcbYJpd00Th/JD8S945YFudAaSsXjQQyDmZtC0jy+jm+juLLQtPUiAr/3tQk39gFHfslN9Rl6Z+xg
	QIKOgwgg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBZW-0000000B31E-0l6H
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:50:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fec34f94abso65418785ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824217; x=1725429017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N47VMRtMS+23qmQV6QvpGjMmEbWavAKSyy/PH2d+fuI=;
        b=YLEcwMkUeWw7qu7brCrixwZHWTgYYCBZT/7ku5CKFyO/iJdFakL/LhI09KFXo6OOT4
         kT6VECzNk0ObgyomLxvqbphqQ1/ylux5zz315R9kt0HwqKBu9lr2Dwezz/ASPKNBQLP1
         4oB3Wk/SfAUQTYBzdM4l7iB2TFrcPzgNPyGQSj871hmUp8SyzDiYrxJdQld0vuSoosaa
         qQ+WVdmdMqidTpoCc/u29kBbKu+OyM9z7/iVP/Uo7fUoyuPy0hc1GHLYRadmABnBPYn/
         mp28CrHeqoZyggJiawGoAOCntFDebKuLVcQDwIqYYreeJPoN2+ceGR1kGPIFvIBEi7Ts
         IMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824217; x=1725429017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N47VMRtMS+23qmQV6QvpGjMmEbWavAKSyy/PH2d+fuI=;
        b=WSKJWnbRW3hGrV7QR1HRPIM9awKY8wySG8F+k/hfXCrLKXcXoYsX4IPqiL2Aca4XfS
         OerSESVkIozUQOLCOSwATl/TL4JJu3mwCg8enLz6BV2lYQa8ggsiLWmm/y3dJzBx2T9Y
         5Z1GmJEvCXScfJ18BO4i+BNF1kNQF1G9QZxrcnKbASMeHeB4SydPtgmRy1T1ci/Me3GH
         78uKTdTiOf/k5Y5NQKCM01X0OulZqKxu6DDBT6YAcrVLsOFxnE7dzw9rq3a95LAVyQQJ
         bmUyVn3oEFt0OaJ7cxnHI82PS/99jINFjZAe89U64q1Rpo1xD/9OuyU/k3Vn35shoZVU
         eF8A==
X-Forwarded-Encrypted: i=1; AJvYcCVKKBQq9JgbXnc7RdZhhanM05dGD4UrSY8Rly1r/Yp9EggGQJb83fH0zVw+FCKHej9GAQgi1SqzSf7ClQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7ILPCLau+563WkHWBiU1sMPse686Ze8OVL6Vdgh9f/T2QpeLg
	llLi7CNgtNSFFXQJHcd0qpsw2kBYM7KvcgeOD9GQlGgQ3FywE+7Ks8CpkSvZnr4=
X-Google-Smtp-Source: AGHT+IE/8VPZ5WR+s//SHKXEyZvEaL/le/g9NWegqdCzDXKzmKgVVr+pZGJ3+/nFrNKyDvBxKE7OYQ==
X-Received: by 2002:a17:902:da87:b0:202:18de:b419 with SMTP id d9443c01a7336-2039e544ea3mr139583445ad.63.1724824217429;
        Tue, 27 Aug 2024 22:50:17 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:21 -0700
Subject: [PATCH 15/16] sparc: mm: Support MAP_BELOW_HINT
MIME-Version: 1.0
Message-Id: <20240827-patches-below_hint_mmap-v1-15-46ff2eb9022d@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=wabvkTSjqwqq+1cwlxkGF9sQYYmBw7yR2/kPTnsB9SA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XYlrm85cSrl9L9mw2HGFibquxLlDQQX5BVPY7r2Kn
 Fj9yFu3o5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgInUNTIynHcLq9918a3O8avu
 Dw03fBV2dVbdxHna5i+P48xVwp561Qz/s5amcHn+vlr756VDtfCFS81padcPXfr2ZkdR7ZMDnv/
 PsgMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_065022_717681_C853BD5D 
X-CRM114-Status: GOOD (  11.27  )
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
 arch/sparc/kernel/sys_sparc_64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index d9c3b34ca744..b9ce9988551a 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -129,6 +129,8 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = min(task_size, VA_EXCLUDE_START);
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	info.align_mask = do_color_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -137,6 +139,8 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 		VM_BUG_ON(addr != -ENOMEM);
 		info.low_limit = VA_EXCLUDE_END;
 		info.high_limit = task_size;
+		if (flags & MAP_BELOW_HINT)
+			info.high_limit = MIN(info.high_limit, addr + len);
 		addr = vm_unmapped_area(&info);
 	}
 
@@ -192,6 +196,8 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = mm->mmap_base;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	info.align_mask = do_color_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -207,6 +213,8 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 		info.flags = 0;
 		info.low_limit = TASK_UNMAPPED_BASE;
 		info.high_limit = STACK_TOP32;
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
