Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F901C00528
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqTcB94M54nbCkhK3c16gADJqXstuyYsump7aNUgk8Q=; b=eCgZ6jRhnLciCb
	quQT0Px7pCDfuourXZLKKx9kvRKBnCWYS47vtAb2ocrVHhhgc7PaFtTISLTeSQOh69oeVitM12+Ql
	ftxN6ca8sttosTVkkepqutxZcXwNn33IlftwFd0I7gSO7PO4r5DXaJjNuWsciFWP/3vG/5UYh8a/M
	73lHoIxt7P9rdiZfWdKH0MjMkkFiSGzFLCWLLDvqMOPXyaBsKDpRpVAlcarKY5VhFadh/+MensSrq
	xyEKojpY5370I2Lriy7ZuQYGF5ktv8Pcf9uq+yGJJy5+uBQG18e1dr+k7/Z32834z+hyrosaVyQ20
	VGNczFkx54ordzFzv2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOyPx-00D3S1-3C;
	Thu, 27 Jul 2023 10:40:26 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOyPs-00D3LZ-0y
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 10:40:23 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-63d2b7d77bfso5754966d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690454415; x=1691059215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sndfUp5VQwyYdDkfd9c4UQTPXsXPqaVmv/x1Ijy8DrI=;
        b=BRo0MX+z2r1SS6yWvALim/6/nbcuIraz/dvlfYWOZ9asJfVrKNdNm2FzRqaxLf+dSr
         gd8iH6tStNBkd23/w31KCfLL9pbPEeNVyPTR03aUqTDZY6wZTMoqJSnBUDPOFUCLZI8l
         DGkcMHGLOMeyEEgRm2q9vaf0Y5Q5Azvv1tkZ/xFOCXwAaoOvebuUDqbcoCdnlpWZyTyX
         q38zkUOHeP0Tt+nEWAcZ8JszB60VlCahpErQX1nO7BawFSz3QtUcVh1o5Am/iWB313H6
         H0uJV9FuYrV0GCIZde+45ERDs3S4qD78OMMR7S/b1svm4zQQyj/BCkUn3DI2PJoOlxx+
         Zjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690454415; x=1691059215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sndfUp5VQwyYdDkfd9c4UQTPXsXPqaVmv/x1Ijy8DrI=;
        b=YGWEStW9611kOa+oapbI+i5Csm/pQzBuyIm8lD3FC7rce3xaM8/9G9Pb2njkJT2B1X
         cGgS9+mOE+PnDAYCrHN5NAcUZe7p7bOjQPLte+gVwqenIFDQFWZl8aVWL+Iq/F+EIGmf
         kvtN24BQ57iuuku0zkfpCWyDD2vdPwtQRPPP7BD4SSA7R1foc9dsgYcFp9Z+fIt+7eFh
         yfkp5aKaCZKjdQyE0YBwGxeK3piSYPtGdxhAmBRUgpVG/FW9uTXIOZjfclJmtOpnGNu9
         s12v6CtcJJZIrqVei1s+EOvBDyQQ8LhFWv2BASPu9jSp2IxM20rLp6PUDdiLXch6Tz9E
         5IvA==
X-Gm-Message-State: ABy/qLbefvD7N8YkToWZyzUGjf8BpG0WMRan7fpn7jB9feswHgOsvh1o
	AI6rJnMKNRaVB5ViAG3tTvB4ZQy3fIh0a5wzox8k2g==
X-Google-Smtp-Source: APBJJlE+0dXFxcWiQX8kiDXJfKau+LxjypHc8uOGBYfuDsHhoPcJDBpq4NHTu2yqyvhkPVt07nS69cNqQCueoayyUeg=
X-Received: by 2002:a05:6214:12b:b0:63d:218:c83f with SMTP id
 w11-20020a056214012b00b0063d0218c83fmr4306083qvs.36.1690454414736; Thu, 27
 Jul 2023 03:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 27 Jul 2023 11:39:38 +0100
Message-ID: <CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg@mail.gmail.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_034020_342079_E447FDE5 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Hi Sean,

<snip>
...

> @@ -5134,6 +5167,16 @@ static long kvm_vm_ioctl(struct file *filp,
>         case KVM_GET_STATS_FD:
>                 r = kvm_vm_ioctl_get_stats_fd(kvm);
>                 break;
> +       case KVM_CREATE_GUEST_MEMFD: {
> +               struct kvm_create_guest_memfd guest_memfd;
> +
> +               r = -EFAULT;
> +               if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
> +                       goto out;
> +
> +               r = kvm_gmem_create(kvm, &guest_memfd);
> +               break;
> +       }

I'm thinking line of sight here, by having this as a vm ioctl (rather
than a system iocl), would it complicate making it possible in the
future to share/donate memory between VMs?

Cheers,
/fuad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
