Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC4BE75457
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pS7NtUHjacsJSaFY6+6aJ+3WHR7Eratj8XLvHZabC0=; b=RgPD1/pcM965Xa
	AK3xwmPxNB9z0w9fKTq49RBoVN4wwK3B04uGHLCzRp4QKTX8S3RkKDdRAeqPJq8u3jIl6zJz2BBgJ
	tpL5gzrpYiShQQ7RgHmDSuoT5TdEiD8MhHU04uXgUO9hVt9Rm2ISZkt/46qu+e7wqFo8FZhAxll1z
	WGW15WF1rrmKoWE0dGFvrsjk7EXSneiAFqgPRqCGzvwBt/JYSGs8pPUbdeoRZSk9EkpJ1DohMIwne
	a/igzUgetyJhtovj5E0vybjXJ7+atWg8n8Id3u6Se/Jf04YRSEWX6tdTxvWdP/hAQvUqqerp9oNkw
	uFn45yh/b6h3c7CfuyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qneow-00Ee8S-27;
	Tue, 03 Oct 2023 12:48:14 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qneou-00Ee4o-09
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 12:48:13 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-65afd8af8bbso5788026d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696337281; x=1696942081; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YZe9z/CDJkweGhxZy3F+7e7AP42NZQg1sBDsRc6xWLw=;
        b=pEU7SalpNzlvqyxSKCIXmxGHMwOI4/ThyAG9CHM05WMZBNPBBrluSJqaFylMIdTnHS
         8E/Utwdh9ojN7trFdmePbfiYxNMxhGb/g3BWbnekA+/vDPDft7fKN23dUSEUr6ZkNerG
         4qAF1FLHJoeCB+bbeYZMHhwM8m3iOlWndyubBZwhcLoOX9j+Gao2x3GX7Pqqr2Ojnuwj
         IUUk4WEG4rWUxC9BVZXS1NOBLPg7rMiAmLZQ9c7tbl76slLZbxDlpgHyxkCwjK8hkK++
         /2GHePaXYXh+sp16X4yj9zNy+Bdo7Mg5EmiP7LVp01PAeYe0jjKjQVJhcXtMawepbPvl
         RweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696337281; x=1696942081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZe9z/CDJkweGhxZy3F+7e7AP42NZQg1sBDsRc6xWLw=;
        b=NgwhiK5QBc4tht62Tlzt+uVpi3+HEkdPr6PfsnE+LgOAFCLGiLsk5lN3Y4Di8zYQJG
         RU3g+Dls5oYNF36oF3ge4VbFSNkh4JRNPqxOdbuEdbSSJqF4+V2erSI+EA8pFXXnpj2b
         8EYDvzrQBvo0gW227C6u6xIR1fHGaD8KiqMOsnTbSAegSmL/PatFTbBEzKIDKOR47b4i
         832TVPXYMb5MOtkRhWUzqApeMG+k2a/3gTIS2jEhkfQ9j7UVB8qB4eCS+taOh+EylBuD
         B+yILg7DkXmzGQvPVdujO4/q3Vcf8pi2GATtawJhNBLGRM8QD5nV5sS6o0DKMWbtcIEh
         3Gcw==
X-Gm-Message-State: AOJu0YxQ8idzOoLpBLBIyHgLbq9MRKORiKBiZAmXR0zCTCmQXbKVyUvJ
	5lgYFLr6rkJQi26d/BU4ZyCkfpftYGazXau72PZeMA==
X-Google-Smtp-Source: AGHT+IGdg5KfMiaxwpI9vdrZwCI62gGbA1qcJqHvAfDGqDxEQ2JSHryTMBO/72MMo9L0zK8WyPrlSIxRkNMNwCJdjzY=
X-Received: by 2002:a0c:e493:0:b0:656:347b:ea75 with SMTP id
 n19-20020a0ce493000000b00656347bea75mr13564335qvl.24.1696337280208; Tue, 03
 Oct 2023 05:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
In-Reply-To: <20230914015531.1419405-12-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 3 Oct 2023 13:47:23 +0100
Message-ID: <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
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
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_054812_087658_343A67A6 
X-CRM114-Status: GOOD (  17.77  )
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

Hi,

> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index d2d913acf0df..f8642ff2eb9d 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1227,6 +1227,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
>  #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
>  #define KVM_CAP_USER_MEMORY2 230
> +#define KVM_CAP_MEMORY_ATTRIBUTES 231
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -2293,4 +2294,17 @@ struct kvm_s390_zpci_op {
>  /* flags for kvm_s390_zpci_op->u.reg_aen.flags */
>  #define KVM_S390_ZPCIOP_REGAEN_HOST    (1 << 0)
>
> +/* Available with KVM_CAP_MEMORY_ATTRIBUTES */
> +#define KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES    _IOR(KVMIO,  0xd2, __u64)
> +#define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd3, struct kvm_memory_attributes)
> +
> +struct kvm_memory_attributes {
> +       __u64 address;
> +       __u64 size;
> +       __u64 attributes;
> +       __u64 flags;
> +};
> +
> +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> +

In pKVM, we don't want to allow setting (or clearing) of
PRIVATE/SHARED attributes from userspace. However, we'd like to use
the attributes xarray to track the sharing state of guest pages at the
host kernel.

Moreover, we'd rather the default guest page state be PRIVATE, and
only specify which pages are shared. All pKVM guest pages start off as
private, and the majority will remain so.

I'm not sure if this is the best way to do this: One idea would be to
move the definition of KVM_MEMORY_ATTRIBUTE_PRIVATE to
arch/*/include/asm/kvm_host.h, which is where
kvm_arch_supported_attributes() lives as well. This would allow
different architectures to specify their own attributes (i.e., instead
we'd have a KVM_MEMORY_ATTRIBUTE_SHARED for pKVM). This wouldn't help
in terms of preventing userspace from clearing attributes (i.e.,
setting a 0 attribute) though.

The other thing, which we need for pKVM anyway, is to make
kvm_vm_set_mem_attributes() global, so that it can be called from
outside of kvm_main.c (already have a local patch for this that
declares it in kvm_host.h), and not gate this function by
KVM_GENERIC_MEMORY_ATTRIBUTES. This would let pKVM select only
KVM_PRIVATE_MEM (as opposed to KVM_GENERIC_PRIVATE_MEM, which selects
KVM_GENERIC_MEMORY_ATTRIBUTES), preventing userspace from setting
these attributes, while allowing pKVM to call
kvm_vm_set_mem_attributes().

What do you think?

Thanks,
/fuad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
