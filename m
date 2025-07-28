Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B41C83F26
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4y70YWqz2dJ8MHAXIwFHB4AuC3fIPFroMwoqAdlWog=; b=FZhYN6FyQHjbxbRB0/CODqZWGJ
	EkuqXv4RMgak8+8NkcSY8BbFJtO/xjnv1MYz3HdVTYIolk7SIcI0/dffBGQDjrZp/jF/exgNHxgIe
	0iIyYYqj/QnT0rxklMV4RhckuQc5z7pa95OYrmjGE+j0M0DSulYM4kkifwvR5sJN/BB+7MJLL+ZFl
	dDqH8fPdUIiu0V5XYg313FeNXHUQQo55Nj/SIAP06a8sxXlVAsm1v1ltT/oH30Ao1nzodjEQuWGkV
	AfGJNVgOraB79Z5j8djKeLfzGqS5c/3VTtQXAi/+43sWOJBgRYTI9aIkg+rFbdkgTjr8lplV+SQIr
	HiGaGVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTj7-0000000FIix-0uKJ;
	Mon, 28 Jul 2025 19:41:37 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTS5-0000000FH3H-0791
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 19:24:02 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so4041308a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753730640; x=1754335440; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I3EpnuB7zTUqYSeFqP3vThQ9a5pqY5H3+hi7C80bQ0U=;
        b=z82tvxpY0FSQTxxLrkRRLy1B/YVI5zqDOv9KZx+7Jhpqp1fytgmz2aouRhpRyQeCNn
         Car6zGr9AfEZYfncoRM6ubprrBGpAhCdLVU0LM8+E90iAR3S2sJX4HDeleEyWI0ltZWA
         CAgXyiDmydusNY5TgYkLjucu8sRmtYG2eqOW20o7qbMYOWkZODiLI6U1nH6KPn/iUD1L
         c4VCUk3OPLp52xkDRq1NPyF+nXD3BXsZCbiTXfM1kJ9drgkTyOgV6jbEBA1dY10H4CPT
         wZ7G+XcMxrfSI7GhQi4IXpDnQqX8jWyHY2JXP7MemCR7tTDisd1TB83MVx0RW9EFLkvP
         X+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753730640; x=1754335440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3EpnuB7zTUqYSeFqP3vThQ9a5pqY5H3+hi7C80bQ0U=;
        b=EE7mEs7Jy3dkllqjwbizwJnM2NW4JQn4jG+NiTnyW2usNiFnv/fg2S109V5XEr7AAu
         HXQ8BYx9KDjFUs63bOCDqoBHt1HHRO7bSD1YcaIPUYgWNGjeF8fvnH1iqmB9akvrF6M9
         AAem7j/Gg49GNoatBI7CSW4w4rHnefb61wsrEf+Yg6CvG5hfaqaN+vOkbuKnUMo/bi00
         6CfVjwymihO5FoG+xdLkvIPOVtIQ/Mj4oKObIVFP7pVA4jH/te499o4HMbUlQvIavLrb
         sSCa9gnfq4L7YI6DP95kL21a8q+yIZ8qcHA+9mPSFFetXAbN8MREgxtn7h0W/1JZxbrn
         RMlA==
X-Forwarded-Encrypted: i=1; AJvYcCWLsRCnsaZhet7+UgVYGa5q2oLyQr904hgwTvrNsPAHPVvtpBSymFPrMK13BrwH8FDX/7XPgsQDwaGlJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuTtEEJfz0FplQxhyj0XDwNy/mzgTt+Lg3oIajj/3d+0lDm60s
	oErgNd2O/pYgQ+GZcc/aczNcL+t/SOXijx/D2DfTIHX4XoMF+8L9Vle4XC3iHnuCYQM=
X-Gm-Gg: ASbGncuei7ZCwByPpNAATn/KHFgdSzwRrqJaqr39r9xDTxDTyVaWcBezLyspupSSN1a
	Q1Uql71MDtoPsxM+VeZ1RoaL6buLEUxbfi3F9F695RurJNuK3TR7VV4qxu2U2mnT94RL51bjxvS
	2sqcLels5VUacrp+ZS8a5EZrQQSVMbOmgYuLwsOHVlgL66Y2k1qdz5rFhqCdtJOnyS2qEO0kFRY
	vYRrdQHHZbJdnKHz9pOxXyd3YHPgoQzzW+vqKrHaZaKRMJpFOiGoq3ZvapDRiekDn1vkIXlGnqB
	wjqhsUK0FMgj0/HoglooTAGalTf/RHGkhfwDp5GGNdnWe9yKhFB1IGAYCXOMEKqDTXO8GKa9Mr9
	ZqKLrDaivBuCsRcpue0IGBMFFAekyPyuA
X-Google-Smtp-Source: AGHT+IEBPPMIaQlSu5uKVWCdzZHJc0FhuYbrfheptoNcuXeIv+/Kd5lGGATtoszSal7LwhGI4xAJ2w==
X-Received: by 2002:a05:6a21:6d96:b0:220:9e54:d5cc with SMTP id adf61e73a8af0-23d70190c47mr24772860637.31.1753730639759;
        Mon, 28 Jul 2025 12:23:59 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f67a8basm4451072a12.40.2025.07.28.12.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 12:23:59 -0700 (PDT)
Date: Mon, 28 Jul 2025 12:23:56 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "nathan@kernel.org" <nathan@kernel.org>,
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	"jeffreyalaw@gmail.com" <jeffreyalaw@gmail.com>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"mhocko@suse.com" <mhocko@suse.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>,
	"david@redhat.com" <david@redhat.com>,
	"masahiroy@kernel.org" <masahiroy@kernel.org>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"nicolas.schier@linux.dev" <nicolas.schier@linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andrew@sifive.com" <andrew@sifive.com>,
	"monk.chiang@sifive.com" <monk.chiang@sifive.com>,
	"justinstitt@google.com" <justinstitt@google.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"morbo@google.com" <morbo@google.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"ved@rivosinc.com" <ved@rivosinc.com>,
	"heinrich.schuchardt@canonical.com" <heinrich.schuchardt@canonical.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"surenb@google.com" <surenb@google.com>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIfOTC6CfyCsaEpv@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>
 <aIO8uSqiplnyyNOd@debug.ba.rivosinc.com>
 <a19c1338f2fa4cb19a4f8b7552ff54ded20b403a.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a19c1338f2fa4cb19a4f8b7552ff54ded20b403a.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_122401_305904_8A86B23B 
X-CRM114-Status: GOOD (  33.43  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 25, 2025 at 06:05:22PM +0000, Edgecombe, Rick P wrote:
>On Fri, 2025-07-25 at 10:19 -0700, Deepak Gupta wrote:
>> > This doesn't update the direct map alias I think. Do you want to prote=
ct it?
>>
>> Yes any alternate address mapping which is writeable is a problem and di=
lutes
>> the mechanism. How do I go about updating direct map ? (I pretty new to =
linux
>> kernel and have limited understanding on which kernel api's to use here =
to
>> unmap
>> direct map)
>
>Here is some info on how it works:
>
>set_memory_foo() variants should (I didn't check riscv implementation, but=
 on
>x86) update the target addresses passed in *and* the direct map alias. And=
 flush
>the TLB.
>
>vmalloc_node_range() will just set the permission on the vmalloc alias and=
 not
>touch the direct map alias.
>
>vfree() works by trying to batch the flushing for unmap operations to avoid
>flushing the TLB too much. When memory is unmapped in userspace, it will o=
nly
>flush on the CPU's with that MM (process address space). But for kernel me=
mory
>the mappings are shared between all CPUs. So, like on a big server or some=
thing,
>it requires way more work and distance IPIs, etc. So vmalloc will try to be
>efficient and keep zapped mappings unflushed until it has enough to clean =
them
>up in bulk. In the meantime it won't reuse that vmalloc address space.
>
>But this means there can also be other vmalloc aliases still in the TLB fo=
r any
>page that gets allocated from the page allocator. If you want to be fully =
sure
>there are no writable aliases, you need to call vm_unmap_aliases() each ti=
me you
>change kernel permissions, which will do the vmalloc TLB flush immediately=
. Many
>set_memory() implementations call this automatically, but it looks like not
>riscv.
>
>
>So doing something like vmalloc(), set_memory_shadow_stack() on alloc and
>set_memory_rw(), vfree() on free is doing the expensive flush (depends on =
the
>device how expensive) in a previously fast path. Ignoring the direct map a=
lias
>is faster. A middle ground would be to do the allocation/conversion and fr=
eeing
>of a bunch of stacks at once, and recycle them.
>
>
>You could make it tidy first and then optimize it later, or make it faster=
 first
>and maximally secure later. Or try to do it all at once. But there have lo=
ng
>been discussions on batching type kernel memory permission solutions. So it
>would could be a whole project itself.

Thanks Rick. Another approach I am thinking could be making vmalloc
intrinsically aware of certain range to be security sensitive. Meaning duri=
ng
vmalloc initialization itself, it could reserve a range which is ensured to=
 be
not direct mapped. Whenever `PAGE_SHADOWSTACK` is requested, it always comes
from this range (which is guaranteed to be never direct mapped).

I do not expect hardware assisted shadow stack to be more than 4K in size
(should support should 512 call-depth). A system with 30,000 active threads
(taking a swag number here), will need 30,000 * 2 (one for guard) =3D 60000=
 pages.
That's like ~245 MB address range. We can be conservative and have 1GB rang=
e in
vmalloc larger range reserved for shadow stack. vmalloc ensures that this
range's direct mappping always have read-only encoding in ptes. Sure this n=
umber
(shadow stack range in larget vmalloc range) could be configured so that us=
er
can do their own trade off.

Does this approach look okay?

>
>>
>> >
>> > >
>> > > =A0 out:
>> > > @@ -59,7 +72,7 @@ void *scs_alloc(int node)
>> > > =A0=A0	if (!s)
>> > > =A0=A0		return NULL;
>> > >
>> > > -	*__scs_magic(s) =3D SCS_END_MAGIC;
>> > > +	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>> > >
>> > > =A0=A0	/*
>> > > =A0=A0	 * Poison the allocation to catch unintentional accesses to
>> > > @@ -87,6 +100,16 @@ void scs_free(void *s)
>> > > =A0=A0			return;
>> > >
>> > > =A0=A0	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL=
);
>> > > +	/*
>> > > +	 * Hardware protected shadow stack is not writeable by regular
>> > > stores
>> > > +	 * Thus adding this back to free list will raise faults by
>> > > vmalloc
>> > > +	 * It needs to be writeable again. It's good sanity as well
>> > > because
>> > > +	 * then it can't be inadvertently accesses and if done, it will
>> > > fault.
>> > > +	 */
>> > > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > > +	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
>> >
>> > Above you don't update the direct map permissions. So I don't think yo=
u need
>> > this. vmalloc should flush the permissioned mapping before re-using it=
 with
>> > the
>> > lazy cleanup scheme.
>>
>> If I didn't do this, I was getting a page fault on this vmalloc address.=
 It
>> directly
>> uses first 8 bytes to add it into some list and that was the location of
>> fault.
>
>Ah right! Because it is using the vfree atomic variant.
>
>You could create your own WQ in SCS and call vfree() in non-atomic context=
. If
>you want to avoid thr set_memory_rw() on free, in the ignoring the direct =
map
>case.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
