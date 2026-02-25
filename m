Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A95EF55425
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 00:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VprOXM2zX/RZ0rD/nIJnz0xIgr3dsaKev6Mkkm028EI=; b=MLv0q99BXSBSJP7QkDE79DtcjF
	YJOIFv/iiaG1bvmarUS7HzOvg3zoz8AuzwxCJQ71x9BgqodcPIb4yb9e146QDDFL/FX+hf0OGFXQM
	W4JImccha4KBj1Ise3cBKZL4s7r3w+c652okgbKuh2jH6qC8msiktlokG9f+xe4PBkUBN8GaXo4AQ
	ISNQL+y3Sjz/ON207i1Nv/WhjQHHBDOS+Fkbo6q4tGx9/HTlfm0ntrUhsHv/HGjlMup2DZ2q7Lveb
	pBszEqVyx/uFmMOE1j43JiqZIu6WlKBt6i7YlUaalRU9R5dImf24YnrRTn91qQ7CJc3R8VFskU+Bv
	LDjo12Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv2Q0-00000002xsD-0Bop;
	Wed, 25 Feb 2026 00:06:20 +0000
Received: from mail-dl1-x1244.google.com ([2607:f8b0:4864:20::1244])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv2Px-00000002xrL-1P5X
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 00:06:18 +0000
Received: by mail-dl1-x1244.google.com with SMTP id a92af1059eb24-1270adc5121so7236387c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 16:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1771977976; x=1772582776; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hwbo+qh3ZKjcL1ArZ2cEab76Y3DqcSCVeG8QenLMGQ=;
        b=VuWueEku/HegHhxUbcr3BcYj9CUxGp/xQkoRQ1X6igtV/t6RLNI4zadyefePrGqxpq
         vdTQz9/vZ9UdnH3Ysoud6cEbJbtZW381dkW9pzTD75RraqS1j1Xe1S2Anb7lcsu6zFcZ
         GQf9Xpn7JMxGMQswBEfJkTPkD0cex5MELrVytmR/G+SIyqVb15yy8tvK48yu5KxSjZVc
         lzDTAYP2gRi50qo/hTK9H/J3C1zDzyij12UBT6eiQfj6CDR0xcKX4l9ilOYI73vBcjNk
         r/2kigBXeA0VdFKkacLbCCGq9iZ2fMsrGV9GAkXdRabr+M7pDKdvr1meTSOfKGRA0GiZ
         vFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771977976; x=1772582776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hwbo+qh3ZKjcL1ArZ2cEab76Y3DqcSCVeG8QenLMGQ=;
        b=GAGgIJJ/VW8DjQtDgPyGX4JRHoFXRGvIh6fBu+7L9VvSGB4LAXJ+oYJiMY3Zku0gWc
         +hCRcxCOO6rByI4jI+0OPKrMcoeqDeg8dbgly4psQKzmOHJChUvUNb+TROyNNqd0+BPc
         kszCe4SKyfgS3CyjKxQpMd5JjSkyrC0na8DSvb+L4JIao8z1AmERX9lN7nYZfJMVkELA
         sBLCcgywczOldy0c+44OlwYkitAy/50ChA4od8arPrhZU2Yn6kzEiOz8EFANWdsfbIc8
         lZmLwk9qft+UWc9TmngWKAjuiJ9RWI558FMUxuebUL9Y72DizKT9avXvQI0qiPjmD3Gz
         vOjg==
X-Forwarded-Encrypted: i=1; AJvYcCUVBOmJHZEM4e/GGfjjPLCxVn7tGYfADs8fWAuE+JaLt9P/SxB4ZduLLbGkl0HnzvH4OsXKJc622n7Bcg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv1b4Xfbvh3lttu5Qkno+NT/aBA8ge2e6w2L53y5PWDfN8UeWP
	ihUAvUi/tpErrojqoQzC61IrQA0zuFInQRFAwbBL0eLXHN2CKOpwcl3xGsqd1NK2EeQ=
X-Gm-Gg: ATEYQzy+jHOSQzcJMKhmHXUj3ztjoXOQsgKiWfA56BZLIzDICpNo0Kl7Thbyvh5EF7S
	0/gDjYqnhO+VFrgWhhWMbAYiG8pJlcIC+nn3NdNjPUWJ7aO3OL2YHmTDS3qtCFXq9yvKyB0+eHW
	D48mt0ERGOsAUjiQwIm5RskzrHlbPNDIg6oIEIXUL207x5VDiNr5VhLLpiKETUCCyg4/gWTd1t4
	qFcXqmOC7t30+yo837qVVXZjzUp+ga7UZ3uUv++3rPjpdZu+Es+tQOwoI3jbA+PKlXBCnQcoG7u
	IB5siYNGvHOEOG+SlUs+80Z6CRV9fgyXWPB62hmsb19Drh8kjBwAzfsys7oZTeOZhon704M+5ND
	ZxXqcZdd7Sw6dFzWkMw+Ee/fRN4HtyY4eDFYY3YS9URYaVdPbqejlcixYGtLNP7gluqTdLW4VsZ
	QrF7XeTHiUJYZvcQnTAb0EvZWkL03+ubI0bND1v9RVQCE=
X-Received: by 2002:a05:7022:396:b0:127:c88:d597 with SMTP id a92af1059eb24-1276acec1a2mr5538246c88.10.1771977975966;
        Tue, 24 Feb 2026 16:06:15 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2edd7sm12707115c88.8.2026.02.24.16.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 16:06:15 -0800 (PST)
Date: Tue, 24 Feb 2026 16:06:13 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Jesse Huang <jesse.huang@sifive.com>,
	valentin.haudiquet@canonical.com, heinrich.schuchardt@canonical.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/5] mm: arch/shstk: Common shadow stack mapping helper
 and VM_NOHUGEPAGE
Message-ID: <aZ489QDHxEZfLydn@debug.ba.rivosinc.com>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260224175800.2500729-1-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_160617_369413_6014FF37 
X-CRM114-Status: GOOD (  17.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

+ Kito, Jesse, Valentin and Heinrich.

I had to rebuild toolchain by bumping up prctl (prctl conflict in 7.0 merge led
to landing pad prctls bumping by 1)

Jesse/Kito,

So you might want to do that as well before sending out next iteration of libc
changes.

Rest inline.

On Tue, Feb 24, 2026 at 05:57:52PM +0000, Catalin Marinas wrote:
>Hi,
>
>arm64, riscv and x86 all implement shadow stack support and use a
>similar pattern for mapping the user shadow stack (originally cloned
>from x86). Extract this common pattern into a shared helper -
>vm_mmap_shadow_stack().
>
>Patch 1 introduces vm_mmap_shadow_stack() in mm/util.c, which wraps
>do_mmap() with the flags required for a VM_SHADOW_STACK mapping. The
>helper uses PROT_READ|PROT_WRITE prot bits instead of the earlier x86
>approach of PROT_READ with an explicit VM_WRITE vm_flag. Functionally
>there is no difference. I looked up the history of this flag on the
>lists but it wasn't conclusive. My guess is that the original aim was to
>mark the vma not writable but that would confuse the kernel, so it ended
>up with the VM_WRITE flag instead.
>
>Patches 2-4 update arm64, riscv and x86 respectively to use the new
>helper, removing the duplicated mmap logic.
>
>Patch 5 forces VM_NOHUGEPAGE when allocating the shadow stack via the
>new helper, mirroring what commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK
>to VM_NOHUGEPAGE") did for normal stacks. It will save some memory,
>especially when the ulimit -s is high.
>
>Boot-tested on x86, fully tested on arm64. I do not have a compiler
>version that supports the -march=rv64ima_zicfiss_zicfilp option for
>riscv, so any help with testing is welcome.

Catalin,

FWIW, I applied your patches on v7.0-rc1 and risc-v cfi kselftest passes

# ./cfitests
TAP version 13
# Starting risc-v tests
# Landing pad and shadow stack are enabled for binary
# cfi_ptrace_test, ptrace test succeeded
# Executing RISC-V shadow stack self tests
1..5
# Exercising shadow stack fork test
# Parent pid 130 and child pid 132
# dummy calls for sspush and sspopchk in context of parent
# Spewing out shadow stack ptr: 7fff914b7fb8
   This is to ensure shadow stack is indeed enabled and working
# Waiting on child to finish
# dummy calls for sspush and sspopchk in context of child
# Spewing out shadow stack ptr: 7fff914b7fb8
   This is to ensure shadow stack is indeed enabled and working
ok 1 shstk fork test
# Exercising shadow stack map test
ok 2 map shadow stack syscall
# Exercising shadow stack gup tests
ok 3 shadow stack gup tests
# Exercising shadow stack signal test
ok 4 shadow stack signal tests
# Exercising shadow stack protection test (WPT)
ok 5 memory protections of shadow stack memory
# Totals: pass:5 fail:0 xfail:0 xpass:0 skip:0 error:0
#

So you can tag tested by for risc-v.

>
>Thanks.
>
>Catalin Marinas (5):
>  mm: Introduce vm_mmap_shadow_stack() as a helper for VM_SHADOW_STACK
>    mappings
>  arm64: gcs: Use the new common vm_mmap_shadow_stack() helper
>  riscv: shstk: Use the new common vm_mmap_shadow_stack() helper
>  x86: shstk: Use the new common vm_mmap_shadow_stack() helper
>  mm: Do not map the shadow stack as THP
>
> arch/arm64/mm/gcs.c         | 14 +-------------
> arch/riscv/kernel/usercfi.c | 12 +-----------
> arch/x86/kernel/shstk.c     | 12 ++----------
> include/linux/mm.h          |  4 ++++
> mm/util.c                   | 29 +++++++++++++++++++++++++++++
> 5 files changed, 37 insertions(+), 34 deletions(-)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
