Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD607C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9T2lqXzR4SSUmy5piY1WsruXT3c6rqUVBTWatrywTIA=; b=WgWt6AP9MtoX7Q
	oT27NPbgXuk4kAlgUi08M26uL4lqggN3CZowf/pYfRAiZeBoJ+hPV7rILeSdqXlE/Q23FqQsbrwFy
	Q2s9tVFd9+dHqzsC1qJFq0ojMjv9uKPfcxebJ/ROKnWlB3q3IYD2Ah5cMwi7BUjIj4P+CmEsNqpcl
	qEHWkbSYcJ3VQuU7AbHH7z4EjcvBzLG5tDkjnHbGyFWKpVHTtGi+0xwVVdoZCZHqVf194geR5ZS6m
	THJDKRSfWP8M/z8oW3GFrZnmBXMaKbr1SRBS+ult8diCoJU8LND7nlHudH7I4vOlCKqz+YPslzpA2
	jfxrMOZD54iRLO+fINGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyrbx-00B8Ms-15;
	Fri, 03 Nov 2023 10:41:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyrbu-00B8LU-1k
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 10:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699008062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Lp6Jz+POVOM2ymATN0+4roKlcGz/gu2UjTswWR4Ytbw=;
	b=cRg4+PCqqSlOE2s/8+SbHCWChJ/PgzTXRoLzGH2VKsxlFbC6nK51LMuzcKpx7+fFQ85SE9
	ZqdCL60k0CdCxvgpyvUtNst78QeZG6G9eFzeg/QI6b37gEj2F0Veh//aj0hpgG1tnhl+/z
	GKWyOQ93PVAwx6y1OyziDH2saneefoY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-950egfpEOoCHX_FJMQk3FA-1; Fri, 03 Nov 2023 06:41:01 -0400
X-MC-Unique: 950egfpEOoCHX_FJMQk3FA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9c15543088aso220446466b.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Nov 2023 03:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699008060; x=1699612860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp6Jz+POVOM2ymATN0+4roKlcGz/gu2UjTswWR4Ytbw=;
        b=F3vKI4/jv6BkZFRdkLCbPmow4yQtj/ClA6TD9hyg2UYAuAtXFLLMunCcFpe0HwMjql
         OCbG/dnSiqWo1GeZINbDAeZPkmd9y1EtfsZPpZfq9VRoYLTb+5h3nL8BC+vw/9DynC4q
         U5v55X54IBTOVvELPrAd6nmAwIbXcT2Vx4xpz13vGC/ymbzhepr5w9xqeBvkuDhyrJ3J
         o6mTKplf2f6aaOzCFmERfzMZYOCBkb/XKdJgKzFnDmYvK9OHvDJkh4mCq8CsrM7Mzq9r
         8QZ4wpYfwTuOgKxd9FKRjeGoryXyOMLhasiLzPm/+m54AFm1fFJUwtjuw+c0cNEOwJwQ
         uRwA==
X-Gm-Message-State: AOJu0YwKBIVTyzeg/AJixDGF4I2eaBt5gjACak6UHAbNQMyuYbZHS9qs
	TH+QeFxbU6A/VxXa4ItnuBugAP8SPq0o4+0ndNKGDxIVTqn1SW834ZO8/VUGBKOkcBhf+vfn5dc
	GgAm+4fq9KylTg8Aes0BBiG5Fn8S6
X-Received: by 2002:a17:906:7950:b0:9bf:c00f:654a with SMTP id l16-20020a170906795000b009bfc00f654amr2302790ejo.24.1699008059825;
        Fri, 03 Nov 2023 03:40:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYL84kQ58i2cP4K6S7xeuKGH18ZQ7RIKhzKbyX3E6c1jOpr4P+mCWZM0GIPaXqH2aak15cSg==
X-Received: by 2002:a17:906:7950:b0:9bf:c00f:654a with SMTP id l16-20020a170906795000b009bfc00f654amr2302775ejo.24.1699008059454;
        Fri, 03 Nov 2023 03:40:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id g4-20020a170906394400b009a5f1d15644sm754493eje.119.2023.11.03.03.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 03:40:58 -0700 (PDT)
Message-ID: <e39a8f6e-c98d-4873-aa3f-2e566dead5c5@redhat.com>
Date: Fri, 3 Nov 2023 11:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 15/35] fs: Export anon_inode_getfile_secure() for use
 by KVM
To: Christian Brauner <brauner@kernel.org>,
 Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-16-seanjc@google.com>
 <20231102-freihalten-vorsah-fdd68051b005@brauner>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231102-freihalten-vorsah-fdd68051b005@brauner>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_034106_666345_886A57FB 
X-CRM114-Status: GOOD (  17.14  )
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

On 11/2/23 17:24, Christian Brauner wrote:
> On Fri, Oct 27, 2023 at 11:21:57AM -0700, Sean Christopherson wrote:
>> Export anon_inode_getfile_secure() so that it can be used by KVM to create
>> and manage file-based guest memory without need a fullblow filesystem.
>> The "standard" anon_inode_getfd() doesn't work for KVM's use case as KVM
>> needs a unique inode for each file, e.g. to be able to independently
>> manage the size and lifecycle of a given file.
>>
>> Note, KVM doesn't need a "secure" version, just unique inodes, i.e. ignore
>> the name.
>>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
> 
> Before we enshrine this misleading name let's rename this to:
> 
> create_anon_inode_getfile()
> 
> I don't claim it's a great name but it's better than *_secure() which is
> very confusing. So just:
> 
> struct file *create_anon_inode_getfile(const char *name,
>                                         const struct file_operations *fops,
>                                         void *priv, int flags)

I slightly prefer anon_inode_create_getfile(); grepping include/linux 
for '\<create_' vs '_create_' shows that this is much more common.

Neither userfaultfd (which uses anon_inode_getfd_secure()) nor io_uring 
strictly speaking need separate inodes; they do want the call to 
inode_init_security_anon().  But I agree that the new name is better and 
I will adjust the comments so that it is clear why you'd use this 
function instead of anon_inode_get{file,fd}().

> May also just remove that context_inode argument from the exported
> function. The only other caller is io_uring. And neither it nor this
> patchset need the context_inode thing afaict.

True, OTOH we might as well rename anon_inode_getfd_secure() to 
anon_inode_create_getfd(), and that one does need context_inode.

I'll Cc you on v14 and will carry the patch in my tree.

Paolo

> Merge conflict risk is
> extremely low so carrying that as part of this patchset is fine and
> shouldn't cause huge issues for you.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
