Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51789C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qq/PoUZkPxaECID9z4R8/UDrphHN6nu2DRvsISsBcuw=; b=lqGZjBD83x2bbU3HZBzOKZIMBw
	gEQOljLGaVksiZ+i3tK0W44qIMeoOv6b2uRO0oJxprP72dXeB1UsA6TtMxW/eJx76YzgW0CbQk65y
	eEvKfzGzM7SqXBM932nECD7XlOkDNiA7JDvtffdT7dskilmzA8AipjbdkIOUesJ3Dg9G/DKPmOygp
	5YbIa2nU9DMHc1bU4ykisRfUJfutwvIbpY1HyHPQShzPCvMjj3I/1KUqCGjRAAFfmJePobXy8RVLG
	oTvPEYJwTArwDowbbEX+31nwkae5/kWAcrLQTPZ4m/7z4m3mQCAPNQADFVaZRQV8U+3yVijqzz+m5
	AFGESVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW2YJ-002iku-1I;
	Tue, 15 Aug 2023 22:30:15 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW2YG-002ij5-2T
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 22:30:14 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d62858b0914so12148287276.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692138610; x=1692743410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1sZ2KVcNcsekfiyOLDchFCWiNwVhcB+6K151wSFXsRU=;
        b=Sdk8hg1CZo0UZyPRUXVdkK75UBWBJbL5ssV4qfSNcJ0yLv5eoBjQS4ikTylrgvjRg5
         fAMh6d0O8KCRFHTNCYjLyKwda9Worh9IOHwLdjyjr43jpwYw1T/I0j2MIMowNRlDO5I8
         seJUbGeGRi1534R52LzEYYDDd5ijl0Ycakp7SKP7ACJxBKwO5q+1sd6EI3OyWGK24CgX
         jnL6doBdY30gIbx8RPMUELSJ79bpzsOBy12TJfrWjd52P0gtLnjQyB6B7osJCqozOqtW
         mlUSNNG5Lq0KPPvS7OkMRg41GasfSw3x8Ne19ql/oMstCF4KKqyTw1HO8U30XcK6asyE
         9NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692138610; x=1692743410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1sZ2KVcNcsekfiyOLDchFCWiNwVhcB+6K151wSFXsRU=;
        b=fG2N5ek62VoLNN/zLaRO4yBWdQySJ6EJw7IMcH6L4thUIqvf9RdNpku5HMxLbbMCq9
         4tBczj1YiTc5MVeXawpi0n7NZjPBOzqPFcoVaO2NA7qz/uU1FpfTDUAX2C1ecrfeQN2/
         GWBDnXwLj1MPMZ41GhYLkEyxGB0HXj1nEFJTeZjaDiIfEWg2X4NQbEaguZBN5VINkZXq
         XiH0Pwq5MP9o9qu+w3Xcg1CCQoFfrzoNZUN6oEUvaJZY10wftSXRj0hJBzuo6LjqyBGj
         M/QMnKaqBYi5MlnsnxzW7Wf15h5lHmfq/yFSxLGEVPlNHSDm/xuLaxvanc2Uz3RUO0DF
         3Wbg==
X-Gm-Message-State: AOJu0YykfP36ZK9/w6JyxA/Wv29J7SsCdL+5Fh/xSkTnkVh9AgIpfpsS
	g3u2r6EQOrVaWN8+RV47qMLnTstcjcc=
X-Google-Smtp-Source: AGHT+IG84S1z3EOk6278E7swEnxMzcYiiiMN3uMBAf/Zzr7Ij9WLl4fIHdZlEc+ZYkT7nZQXafm39o4AAu0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:24cc:0:b0:d10:a33d:36b6 with SMTP id
 k195-20020a2524cc000000b00d10a33d36b6mr55769ybk.0.1692138610358; Tue, 15 Aug
 2023 15:30:10 -0700 (PDT)
Date: Tue, 15 Aug 2023 15:30:08 -0700
In-Reply-To: <20230811045127.3308641-6-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com> <20230811045127.3308641-6-rananta@google.com>
Message-ID: <ZNv8cCzI9fMWkGWT@google.com>
Subject: Re: [PATCH v9 05/14] KVM: Allow range-based TLB invalidation from
 common code
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_153012_834235_8CD3C0D8 
X-CRM114-Status: GOOD (  11.77  )
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

On Fri, Aug 11, 2023, Raghavendra Rao Ananta wrote:
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index ec169f5c7dce2..00f7bda9202f2 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -278,16 +278,14 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
>  	return kvm_x86_ops.flush_remote_tlbs_range;
>  }
>  
> -void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
> -				 gfn_t nr_pages)
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
>  {
>  	int ret = -EOPNOTSUPP;
>  
>  	if (kvm_x86_ops.flush_remote_tlbs_range)
> -		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
> -								   nr_pages);
> -	if (ret)
> -		kvm_flush_remote_tlbs(kvm);
> +		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);
> +
> +	return ret;

Please write this as

	if (kvm_x86_ops.flush_remote_tlbs_range)
		return static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);

	return -EOPNOTSUPP;

or alternatively

	if (!kvm_x86_ops.flush_remote_tlbs_range)
		return -EOPNOTSUPP;

	return static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);

Hmm, I'll throw my official vote for the second version.

The local "ret" is unnecessary and is suprisingly dangerous.  I screwed up the
conflict resolution when cherry-picking my CONFIG_HYPERV change to see what the
conflict looked like and ended up with a double flush:

	int ret = -EOPNOTSUPP;

	if (kvm_x86_ops.flush_remote_tlbs_range)
		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);

	if (ret)
		kvm_flush_remote_tlbs(kvm);

	return ret;

Dropping "ret" makes it much harder to get trigger happy when resolving conflicts.

No need for a new version to fix the above, assuming Marc/Oliver is ok doing
fixup when applying.

Nit aside, looks good for x86, and I know of no conflicts, so take 'er away!

Acked-by: Sean Christopherson <seanjc@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
