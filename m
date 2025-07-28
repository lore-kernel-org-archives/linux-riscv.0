Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FCDC83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 21:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kw4ulI4t+xUyGIu9UtMLJMXdV5T6qV4WQxcnggzmOOE=; b=a61gUcans5xYVdFiltZQRpqdEV
	X3i90jgbaTNdcwa23Rwg1M8//0RIDabxTn3YTiIqLg+xS0zSu0aPcK8esKeysP/9SO5GoPg3E+cl0
	XsCn8bcNMBLcNNcR+DPSeAdUTLhKLywSeHoylLkfTvW9F7hhI5IuZnw2ZyeH1doERjNRdpO6d6jzm
	of8XVG0iWsTaCfqdnQ7A+yJggzP+qnWW4/aBqlPc+2aJPdrpuuRNKFXWFXetQcuv+W57Iv8rqdqgl
	JboJ7hYGmpj+g2Yvv5z5b2iNXg2vHOcvAVnPcpL6+RZMy/UbdzywdFkzwJYEru5HfygxQOuDKGlC2
	UCrtMt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugVGC-0000000FRzl-1yNp;
	Mon, 28 Jul 2025 21:19:52 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugVGA-0000000FRzK-04KR
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 21:19:51 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-748e81d37a7so3265896b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 14:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753737589; x=1754342389; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fk12aZ1hILTEk1VujnCvLZyceUntOHKQSLYJRpJHq1U=;
        b=kLi36KKmb6hRzov9yNSHUmThWzQSKF8LFYM3amGoCLmykOv7dO0QZyImwlH29hXkVs
         IbDHUL9RohAXsADpMORctd7KoEeQiiBB2W0F7sCzFyaSraGDQ0yI/bIDsdPGoFYhQPWo
         d3htgoEmO0vkzLZ8kohJbSc5O27sBLQNLHzT1FNorYtaTUXK450DN+tffew+CQ6FPd+N
         h4QpFI2qUdX5ImQPSGIVBca9EnfFheslpY09B9ZGTIMleNiOWRxR0C5sdojUbsuaUYuT
         cfDGmeSKqOlbyMfl81pd3QOJrf6qvBf8NX0E3YR+GoVr719sfHzb5wKUgRg76LDbqKS6
         OlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753737589; x=1754342389;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fk12aZ1hILTEk1VujnCvLZyceUntOHKQSLYJRpJHq1U=;
        b=C2D1kOHz94V23UHj5jQX1Cb2OzbYAAcn8C5+tfrdvx1WPHpM+kJWfsTFfsebx+631A
         c7jhGKb78SI4tXicI9tTdT/iQrTWOhcMinRbGz4YQosPGxHlM1Q9dlMzjqLrC+JmEU57
         cZ/1R+J3Oln5gaLSdwDnw6mhXJttzQ+8DPUnU24irRIVzWIX04miMqxItB0dLzSEQf9k
         57k3qQ5zuFugYUtBATj9JQy7MjFujCCqMMJ8In51kfLJxYVfNitbmT0CfdOpo2ccffWU
         COIhehwLXkGhCFap8J/ol+3+VTDahLkJwCV3HmJFZ2gHZjruE+HcvFRP7nc11oz9apES
         +Fzg==
X-Forwarded-Encrypted: i=1; AJvYcCWPBylm2E7SggyfQQNK0FCR+heBnOzMYFoLk6eytk5uBSPorXRlZmSsQyuFHuWgf2zxhXTZkcULNsPo9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAXcWP3NTYbnS0eyxb2ieTf5G44oypbjGVq9aFED7G9LIRZ1PQ
	09QQfsKCBioIff2VDUOdJYEcuX038lFeIsyiwEAmmzEIe30kALmWo9Coqp2CBpFSH3Y=
X-Gm-Gg: ASbGncuY8QawPCvV7u2yP963RexY103lrFO69ptniicwJkxx5vtZN9S/vJqnMXz4F6s
	nr6WdcwPQ2wgo/9NJQEwUmQF7NbW7H6LlCaDe/xumaQOJxaZWmXIsbPEt93/2HzhRpMDFkPHTHX
	7bgo2vRncLaZCzXRBV8HE5rNLtWy+BXy7ZKO5lswoW+hGGIHwY2eq7b58D8HN8VRGX/FrokRqQl
	sisszTCk5mdqEc6cstdtkaJ1LdVbfCxmAGt1KMFJSj5NsdsEVPFW8IbAIJGfBC2WTgJXhbNAZ0L
	XnWbY1czupUt7zvFo1QoGiDoE15B6FvHlunXf2ZYc+G++cwNjaPUe/TqoqUrq3dF2bW/6pMZPlC
	GgnCYg3b4Cq055GavD/lzwXiGSqMOLVw7
X-Google-Smtp-Source: AGHT+IEnErxkfYjX+YJp8zR8qc4hw1otEJKlPu8QNYCPVpJ95RsieRy81jtW+UwHk4fD0hbvpRX7Lg==
X-Received: by 2002:a05:6a00:c89:b0:748:fcfa:8bd5 with SMTP id d2e1a72fcca58-7633636aefemr19113589b3a.3.1753737588883;
        Mon, 28 Jul 2025 14:19:48 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408cf7759sm6272300b3a.31.2025.07.28.14.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 14:19:48 -0700 (PDT)
Date: Mon, 28 Jul 2025 14:19:45 -0700
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
Message-ID: <aIfpcUmNtLFPd2cO@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>
 <aIO8uSqiplnyyNOd@debug.ba.rivosinc.com>
 <a19c1338f2fa4cb19a4f8b7552ff54ded20b403a.camel@intel.com>
 <aIfOTC6CfyCsaEpv@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIfOTC6CfyCsaEpv@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_141950_295722_92537787 
X-CRM114-Status: GOOD (  26.05  )
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

On Mon, Jul 28, 2025 at 12:23:56PM -0700, Deepak Gupta wrote:
>On Fri, Jul 25, 2025 at 06:05:22PM +0000, Edgecombe, Rick P wrote:
>>On Fri, 2025-07-25 at 10:19 -0700, Deepak Gupta wrote:
>>>> This doesn't update the direct map alias I think. Do you want to prote=
ct it?
>>>
>>>Yes any alternate address mapping which is writeable is a problem and di=
lutes
>>>the mechanism. How do I go about updating direct map ? (I pretty new to =
linux
>>>kernel and have limited understanding on which kernel api's to use here =
to
>>>unmap
>>>direct map)
>>
>>Here is some info on how it works:
>>
>>set_memory_foo() variants should (I didn't check riscv implementation, bu=
t on
>>x86) update the target addresses passed in *and* the direct map alias. An=
d flush
>>the TLB.
>>
>>vmalloc_node_range() will just set the permission on the vmalloc alias an=
d not
>>touch the direct map alias.
>>
>>vfree() works by trying to batch the flushing for unmap operations to avo=
id
>>flushing the TLB too much. When memory is unmapped in userspace, it will =
only
>>flush on the CPU's with that MM (process address space). But for kernel m=
emory
>>the mappings are shared between all CPUs. So, like on a big server or som=
ething,
>>it requires way more work and distance IPIs, etc. So vmalloc will try to =
be
>>efficient and keep zapped mappings unflushed until it has enough to clean=
 them
>>up in bulk. In the meantime it won't reuse that vmalloc address space.
>>
>>But this means there can also be other vmalloc aliases still in the TLB f=
or any
>>page that gets allocated from the page allocator. If you want to be fully=
 sure
>>there are no writable aliases, you need to call vm_unmap_aliases() each t=
ime you
>>change kernel permissions, which will do the vmalloc TLB flush immediatel=
y. Many
>>set_memory() implementations call this automatically, but it looks like n=
ot
>>riscv.
>>
>>
>>So doing something like vmalloc(), set_memory_shadow_stack() on alloc and
>>set_memory_rw(), vfree() on free is doing the expensive flush (depends on=
 the
>>device how expensive) in a previously fast path. Ignoring the direct map =
alias
>>is faster. A middle ground would be to do the allocation/conversion and f=
reeing
>>of a bunch of stacks at once, and recycle them.
>>
>>
>>You could make it tidy first and then optimize it later, or make it faste=
r first
>>and maximally secure later. Or try to do it all at once. But there have l=
ong
>>been discussions on batching type kernel memory permission solutions. So =
it
>>would could be a whole project itself.
>
>Thanks Rick. Another approach I am thinking could be making vmalloc
>intrinsically aware of certain range to be security sensitive. Meaning dur=
ing
>vmalloc initialization itself, it could reserve a range which is ensured t=
o be
>not direct mapped. Whenever `PAGE_SHADOWSTACK` is requested, it always com=
es
>from this range (which is guaranteed to be never direct mapped).
>
>I do not expect hardware assisted shadow stack to be more than 4K in size
>(should support should 512 call-depth). A system with 30,000 active threads
>(taking a swag number here), will need 30,000 * 2 (one for guard) =3D 6000=
0 pages.
>That's like ~245 MB address range. We can be conservative and have 1GB ran=
ge in
>vmalloc larger range reserved for shadow stack. vmalloc ensures that this
>range's direct mappping always have read-only encoding in ptes. Sure this =
number
>(shadow stack range in larget vmalloc range) could be configured so that u=
ser
>can do their own trade off.
>
>Does this approach look okay?

Never mind, maintaining free/allocated list by vmalloc would be problematic
In that case this has to be something like a consumer of vmalloc, reserve a
range and do free/alloc out of that. And then it starts looking like a cache
of shadow stacks without direct mapping (as you suggested)


>
>>
>>>
>>>>
>>>> >
>>>> > =A0 out:
>>>> > @@ -59,7 +72,7 @@ void *scs_alloc(int node)
>>>> > =A0=A0	if (!s)
>>>> > =A0=A0		return NULL;
>>>> >
>>>> > -	*__scs_magic(s) =3D SCS_END_MAGIC;
>>>> > +	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>>>> >
>>>> > =A0=A0	/*
>>>> > =A0=A0	 * Poison the allocation to catch unintentional accesses to
>>>> > @@ -87,6 +100,16 @@ void scs_free(void *s)
>>>> > =A0=A0			return;
>>>> >
>>>> > =A0=A0	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL=
);
>>>> > +	/*
>>>> > +	 * Hardware protected shadow stack is not writeable by regular
>>>> > stores
>>>> > +	 * Thus adding this back to free list will raise faults by
>>>> > vmalloc
>>>> > +	 * It needs to be writeable again. It's good sanity as well
>>>> > because
>>>> > +	 * then it can't be inadvertently accesses and if done, it will
>>>> > fault.
>>>> > +	 */
>>>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>>> > +	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
>>>>
>>>> Above you don't update the direct map permissions. So I don't think yo=
u need
>>>> this. vmalloc should flush the permissioned mapping before re-using it=
 with
>>>> the
>>>> lazy cleanup scheme.
>>>
>>>If I didn't do this, I was getting a page fault on this vmalloc address.=
 It
>>>directly
>>>uses first 8 bytes to add it into some list and that was the location of
>>>fault.
>>
>>Ah right! Because it is using the vfree atomic variant.
>>
>>You could create your own WQ in SCS and call vfree() in non-atomic contex=
t. If
>>you want to avoid thr set_memory_rw() on free, in the ignoring the direct=
 map
>>case.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
