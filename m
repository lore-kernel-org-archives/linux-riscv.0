Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331F8C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qA5nhCiLkbWbiTwzZ3BDeGCRqnRKB8cORzxfsIKtP2w=; b=dhWk4JauZlfwXv
	lYtpuAn4hfZaewKJc8/CAzcNULI9TkuwTCDPRYarOnY9zr0DEMFEIFcy1i/UB/W9PyRGkQWCzR2u4
	L2JQtiWY0W4DIeKcMqYUw+d6W5d9ymFKtHETfXUD8fpZk4/St2hN/UnukGm7eUJZTEl8olg/Ulg3p
	XD0D62aGCyFEADBDJRqLX7C/w1JYmqYRotWsavICEG8UlXzyjjdmKKPVR5ham8f71gjfKS/2V7rav
	DH0qB7jMv0e49rNxyLlqeuTm83+EB5/d1H6bgu+sRKcOqCDCXFX6ZnlCQHaODs1vohCoBC8jqPIz4
	Y4FL5pd74ayoSqoAtF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrqE-005iL8-1C;
	Tue, 31 Oct 2023 16:43:46 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrqB-005iJQ-1r
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 16:43:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6bd96cfb99cso5185236b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 09:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698770620; x=1699375420; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KUWzNpZFu6ZH+LPCMipXBlnOZ2iMu0xo6DdlSVTTSCM=;
        b=rOVVdfTC9dzKfUXR/5F33NahGavPWVNlhX7+GLuMdo33niHSX0hrXvdAoWe4vtZQDW
         2YomWcvTxn+DZ3lTCJFPbnoB78xbg++bSbCtsoxn02TKc0vAahU82eoHV6gxmtkEYIIB
         e29Q4vWBgxNofP3A0HTrVLmKa5eG9GB9OJVYEV77osBDfMtkYgiSo1f5lTDOZFn4a8Bn
         CWazNLB5vIAW3C/LkO9LwCuZPw9LbiYDxtIyYlJyIAnYtMh74tzE5DApndn5vsXps3gc
         4eF2cKremh3SDcL8wnkbG03iuUmq3GYNz4cywPqnqYbT76oaKfbk3zeNiZT28gfqRreN
         hCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698770620; x=1699375420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUWzNpZFu6ZH+LPCMipXBlnOZ2iMu0xo6DdlSVTTSCM=;
        b=N83TLxiJMkmEHmtSrUyG81F6K08OrxCjSqcGaLe6dKC+ZNjnyhCuJn+PMVCsxwsEjJ
         VOio8F219H60VxqFwmuQbGFiXvTJlaoAAB4Z5duhS5vIGTFf4JXTfD7Vr7jm/nCKMdVp
         K1pDZyvWmSSJVbJMqUnqscEuzqh3CGJrpcgp7B0ea7EciXsDSTUWMH/K45CBURl08TlN
         OrtbyKgShtzV8foPvhEoWt/SWbvbNKhB8omPoF+2u5Rr+c4Jp/IkjybPIcIoOiamag1l
         vtfq6bYjCGk1Wx+9vE+gGIkY1moMwH0Dbezv0T50T/VCzstrwnXuQ9dImTO6mKwuEyG3
         w/Qw==
X-Gm-Message-State: AOJu0Yyc0roSL7lCbClKQj8YCrW1txknALdvJB2ckKqD+qjEiAAhPp0G
	F6/S7xuq8CBghAifAWMidNAckQ==
X-Google-Smtp-Source: AGHT+IEij7+ydhlYjhr1xlKLUtNUJw25BFH2l+RQ8zeBA7dBnKRXxZXchV1bLlBIgwVsc3GuzIJ3dQ==
X-Received: by 2002:a05:6a20:a10b:b0:15d:7e2a:cc77 with SMTP id q11-20020a056a20a10b00b0015d7e2acc77mr12395968pzk.48.1698770620059;
        Tue, 31 Oct 2023 09:43:40 -0700 (PDT)
Received: from google.com (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with ESMTPSA id fb17-20020a056a002d9100b006b1e8f17b85sm1451493pfb.201.2023.10.31.09.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 09:43:39 -0700 (PDT)
Date: Tue, 31 Oct 2023 09:43:32 -0700
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Anish Moorthy <amoorthy@google.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v13 13/35] KVM: Introduce per-page memory attributes
Message-ID: <ZUEutAmPcVLHXlQc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-14-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-14-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_094343_609721_C78DB393 
X-CRM114-Status: GOOD (  11.65  )
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

On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 89c1a991a3b8..df573229651b 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -808,6 +809,9 @@ struct kvm {
>  
>  #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
>  	struct notifier_block pm_notifier;
> +#endif
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	struct xarray mem_attr_array;

Please document how access to mem_attr_array is synchronized. If I'm
reading the code correctly I think it's...

  /* Protected by slots_locks (for writes) and RCU (for reads) */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
