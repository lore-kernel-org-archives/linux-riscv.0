Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B79CD13D2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQhZTKxJAqhJWJipJ9aywwkjrzHl4Zx05YpbD1SKkI4=; b=dpt/2dlcnPHk4t
	tvPYPTwOEzyKogDr74+Kv1TwfLe+eTnAM27bcfdd/kKoyFbOEnnV8xgxGfd+USBgZT9sIbYO5Jrek
	KxhhLYGAe8hDNCW77RpxaonNaPkdGRWWDHOjkAdJn1HLO0VjtiZlNzw27gs1Bf+n6gaOD9JHXiBBj
	rFjaoiu2XB7ooMd/KG48eEH9kzdN72oinVZTCSTR9+fD/JH6vxjfAC4mnCfex3lWujRqm5tKE3/AJ
	Ujw+8Vme5E2gTgnqW07abh4aBryDZlXzpFpyXkUCrltNj+l4e6pJzuriQ9/BABXJR7+KjWV8CNpNh
	ME0VnNrjDw32vIVj0rag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiFzR-00FjIK-0d;
	Mon, 18 Sep 2023 15:16:45 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiFzN-00FjGW-14
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 15:16:42 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-41214998fc2so27335291cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695050199; x=1695654999; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ucvab0+WYvq4UufE5S4SV2ca9jdWUsP9GGHLs6BCgo=;
        b=CE2ilZ2CdTbLkucy4FZOZwvja7km59zILbpwqONkIZO2IVPL3RnyaI+AQd+cV5Cp+/
         OfMaY+HCyuXoYbeJJkt+RuHfYf5bm0XAzB9LqJM3oOnagW3M11VbU6ov1phLOXce14Oi
         FJSqkwcJX8A2aPEx0ykgu++DelVLATagx4R/blDHWY5nW08NCkwQQcmEtS6qLzV7l118
         Oknuzl3YcclOqJa2J5B+ABp4flq89hOA6Eu3gT9IRcZ4KjXQAG1Hoe970SjDccFL6s1m
         X6nJg+owJIQDqCsS4R0pxDjpZd2Kkf21fATaldUdbF7mISaS3JknVfl8u3XEepHB5S2M
         h0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050199; x=1695654999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ucvab0+WYvq4UufE5S4SV2ca9jdWUsP9GGHLs6BCgo=;
        b=ZiuBZYgSYYDavGXLjqw0QzXzD3LEau0d6JD7w2Kgrycg6l7L9f6WXH4WaOHYtx6lPR
         Wi0sLtx1SKRQI+MbYwQiGpc6kBSREiOCbmzdMIfW+au8IkxO8gOreD+P1VDSINFlsIkt
         N8GJys+xy0NZX4WC52BpreAkWRrEZqwTTYwDob8p0snZyZe2xSmKVENM6R45WEc8YasJ
         tAtssE2jk8J/VCgzeje/aziVhXBjqry+h+WwEhnDaKEB1QwCF6UKjdE9AdgT9vxjEDTw
         BLL7eYiEvBDEBbcUCBhmFfMGAHIDKKQ9gQ6EtzAkwg5CV//rIdFfKVPL9yniR1pii4zz
         SMvw==
X-Gm-Message-State: AOJu0YzQs9XuRwxF7zGuYht2rET9OKJ3n0sRbXm0QMIhs0lHPrRSxLKS
	Q46tHCguDzeRgSrpUqQeB/g+Gg==
X-Google-Smtp-Source: AGHT+IE1nILLKPaFxe5im/MfVjUE0HuRytyibnYnzCmrjBnu/bqUhqldLHu9krEWO371lIWoHdHJrg==
X-Received: by 2002:ac8:5ac9:0:b0:403:ef0a:ac69 with SMTP id d9-20020ac85ac9000000b00403ef0aac69mr11892621qtd.62.1695050199490;
        Mon, 18 Sep 2023 08:16:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id z22-20020ac87116000000b004108f6788a6sm3081779qto.41.2023.09.18.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 08:16:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qiFzJ-0005Nh-7L;
	Mon, 18 Sep 2023 12:16:37 -0300
Date: Mon, 18 Sep 2023 12:16:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, kvm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Anish Ghulati <aghulati@google.com>,
	Venkatesh Srinivas <venkateshs@chromium.org>,
	Andrew Thornton <andrewth@google.com>
Subject: Re: [PATCH 01/26] vfio: Wrap KVM helpers with CONFIG_KVM instead of
 CONFIG_HAVE_KVM
Message-ID: <20230918151637.GF13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-2-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916003118.2540661-2-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_081641_578356_C497A39D 
X-CRM114-Status: GOOD (  13.33  )
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

On Fri, Sep 15, 2023 at 05:30:53PM -0700, Sean Christopherson wrote:
> Wrap the helpers for getting references to KVM instances with a check on
> CONFIG_KVM being enabled, not on CONFIG_HAVE_KVM being defined.  PPC does
> NOT select HAVE_KVM, despite obviously supporting KVM, and guarding code
> to get references to KVM based on whether or not the architecture supports
> KVM is nonsensical.
> 
> Drop the guard around linux/kvm_host.h entirely, conditionally including a
> generic headers is completely unnecessary.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio.h      | 2 +-
>  drivers/vfio/vfio_main.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
