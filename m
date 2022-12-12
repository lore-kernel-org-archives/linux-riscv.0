Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1867CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 19:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3ythAnO3Gq1IKzwVlS6MsPpRNcIRPzBMHWbtIuLB9k=; b=rOFAW8zVVNisDV
	vs1cfkDapQYYZDk8liKhNT5ta8jtufYL2exfp3tLVU01VUc6k/X7XFijkVyU4G/IbxgqniT0ohjKM
	m3Ux8s/4swFXWs5fkrh2/1ySF3wqyf7mc9OwfQCBXk3mQTxlMNHRDIXNnokziYUjlvSs8UHJ08rH1
	qpIZb4sPLgWdh2MvU1HlZNBt88OnqO60kQXyXBHORtjGV7I62dKA19nh59H2rfKI1YwPV/EDij0BL
	Nz0JlCP4zsIf3k+/F2BVLqf1I5B2Z6eMxUr72Nv1OYtAwKmDBcsgzraIOEpSENpagmMjekN+K/niM
	5M9Kgd+U9dyK5VA/bcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4oIA-004F0I-EO; Mon, 12 Dec 2022 19:16:46 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4oI0-004EoF-LD
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 19:16:38 +0000
Received: by mail-qt1-x835.google.com with SMTP id i20so3274636qtw.9
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 11:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7FMUUUtCYecfXpbEXjiOLj576wn1MKIcly3I5EGbnCU=;
        b=l/2Fzg7K2w6LeoqTVQRvr6MNT6h2CWF7uWpi6AcpSeXPJLWs93b53h4/DaxEs3S7yg
         FmBJ/eQjHKTHyIyyljJe+i4llG7szE8ICe++PVGg48c7nvViW1blvdm1AR6l1CmHD6AX
         kFg6hl4Vs3u7X1Twn6fsy9hoN7ccZU342euVFVUW7uX/cmNpk616/caD/CinGqNjNJTs
         QTXe7MFJ/La+/mPWZPg9ETEbrRrOv6B0InpYW9oHi8Mnc2qFUGeBchwY4K2AfUssSRcy
         qozMFX4bvtu0bwAtdxAWkGgcgPw5BFdhXNT0jyS/Adf7ohyw+Ajj3xoMSPGHpP0wiv8S
         7Qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FMUUUtCYecfXpbEXjiOLj576wn1MKIcly3I5EGbnCU=;
        b=ZcvZV3baDmrBf695BFrTQSalDnl7gwnTuftW4BB9CTh1s3GLtDw1i9/fOyCnpWIuHP
         YtH4rstca9nAXo5AD3uOTpu7ImhBZJzCfK2Fsx6CGkXnoBcitVKGcTY3Gn+e51agyICz
         XSHSV1tZnhlvl9Ud6Aw2wK/MbYaZsDkKtTTCQSJ/s9lgR+u0OdN3iDLKzHqfgWZir/VI
         3qFTgZNB+kQwlKTy5rG9HiUOmBuSrr7Q6ltGfVMW4VHPWPE8tBfvahQsljC6+7boKL1i
         y9ToyVDKL5vX7Vpk9ZaSu3PUK1JuBeYL41bnxF6nHnqQ1yZJqvz/zkDJZ7bou5TbA+si
         SWMA==
X-Gm-Message-State: ANoB5pk3dcpz2fZC91C2bW3iZypaEeidVh77W+tXCdibg8+60GwQre3u
	P+CiwRM6D5YWhlNVGA/lUiBXzTUuWOWShUwXejkmmg==
X-Google-Smtp-Source: AA0mqf4WGpfWfLWnwQ8p9857/jw1O9njOLrhyCmKuR5bGk3QqXvLgKt7CBUEWjv6tK1F7/dZkHnouU9Un9Kr3J8bgV4=
X-Received: by 2002:ac8:4415:0:b0:3a6:a81b:c971 with SMTP id
 j21-20020ac84415000000b003a6a81bc971mr18259926qtn.437.1670872592731; Mon, 12
 Dec 2022 11:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-18-dmatlack@google.com>
In-Reply-To: <20221208193857.4090582-18-dmatlack@google.com>
From: Ben Gardon <bgardon@google.com>
Date: Mon, 12 Dec 2022 11:16:21 -0800
Message-ID: <CANgfPd_JKw+Vtzk30GE1R3_zphOD19w4XYZ6uXQsU0AmZrXo9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 17/37] KVM: Move struct kvm_gfn_range to kvm_types.h
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Krish Sadhukhan <krish.sadhukhan@oracle.com>, 
	Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_111636_779042_4B6A005C 
X-CRM114-Status: GOOD (  16.23  )
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

On Thu, Dec 8, 2022 at 11:39 AM David Matlack <dmatlack@google.com> wrote:
>
> Move struct kvm_gfn_range to kvm_types.h so that it's definition can be
> accessed in a future commit by arch/x86/include/asm/kvm/tdp_pgtable.h
> without needing to include the mega-header kvm_host.h.
>
> No functional change intended.
>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Ben Gardon <bgardon@google.com>

> ---
>  include/linux/kvm_host.h  | 7 -------
>  include/linux/kvm_types.h | 8 ++++++++
>  2 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 22ecb7ce4d31..469ff4202a0d 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -256,13 +256,6 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
>  #endif
>
>  #ifdef KVM_ARCH_WANT_MMU_NOTIFIER

I don't have any problem with always having this defined, but might be
worth noting that it's now defined on all archs, regardless of
KVM_ARCH_WANT_MMU_NOTIFIER.

> -struct kvm_gfn_range {
> -       struct kvm_memory_slot *slot;
> -       gfn_t start;
> -       gfn_t end;
> -       pte_t pte;
> -       bool may_block;
> -};
>  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
>  bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
>  bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
> diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
> index 59cf958d69df..001aad9ea987 100644
> --- a/include/linux/kvm_types.h
> +++ b/include/linux/kvm_types.h
> @@ -132,4 +132,12 @@ struct kvm_vcpu_stat_generic {
>
>  #define KVM_STATS_NAME_SIZE    48
>
> +struct kvm_gfn_range {
> +       struct kvm_memory_slot *slot;
> +       gfn_t start;
> +       gfn_t end;
> +       pte_t pte;
> +       bool may_block;
> +};
> +
>  #endif /* __KVM_TYPES_H__ */
> --
> 2.39.0.rc1.256.g54fd8350bd-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
