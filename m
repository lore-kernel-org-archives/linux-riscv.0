Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC2DC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 12:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QT1Xv8LjfCwCr3hBvdehzzgxj76vg+r/zMiuKm62euU=; b=EC4j7wcwlQf+a3Qg09cxw3A/Ht
	zJ+7vkYTGrNXEQNNVxOXtFcZzpW5MVP0IeS46+PrMNJpWt0Zmg0Muel2ZfzYQuPVniSkpV7QQ8Nue
	PnbBRV9gN2R0c+/7mfH8g4ayeAZkzZ04adABf8/lLjdJ7ocZZkeriQHoTrs/UjzTmiTNkq2/57iIQ
	SrbB3jxTJIghXlVUGMKZAuug2OznSDrZ3a+ow3a3N6nVykJiIsUJHgZyMaILF/oOnPgOzj4NJq2hm
	9qqDrjY+ZKwN5ndlyMt2m49kTSlpIAfOXLEGL1e1uiBHJshrbucqhybFS16pnSifkzwwUGkvMHvKe
	Zg/y+5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIp1-00000004AJK-3FDr;
	Wed, 29 May 2024 12:54:27 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIow-00000004AGr-3ReG
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 12:54:25 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-6819735bfc4so1944401a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 05:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716987260; x=1717592060; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1KVQFhVFh80Fdd96OAcePaAYKBvjrIO3JB8q5MbeFQU=;
        b=ZKcVBqy6gICwaWxs1+tsmuTDAMA623oSBccffhtDgM3FWltguaedUD212m330zpRr4
         d2uS3I/HqoX0mTHw2A+BCaljU/ybzMbonldzHhAuUtRuU3rlM2JKi+xFzKSCKBVVLfai
         +I/rpKKA336n0ldx6BvKlGxOKIqZVvNi5/hwhgixUl47ZTMv08i8fO3nqX1/z0HZhVqq
         1o0Tn3h3/r2VHIeQCpnSYK49Z50QWTF4vj0HO5/bTCCIRdpsUhXaptwFKKdEBmAQfLPG
         GR84f2xQntbT/aO8qzamwe3JmDNxxRhSPDyHYZgZWu2MM55dBY1BC59hcndfXsYt/0a7
         Nvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716987260; x=1717592060;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1KVQFhVFh80Fdd96OAcePaAYKBvjrIO3JB8q5MbeFQU=;
        b=E/8ybA49HewNedK6jG1W9T38keZr3es1HJaG58zhnn4j5tBQiLfvsqBivZ/SCvnGMO
         JmZBmgS45rLimZE3hapxLlQ8a2OuagcpL6CeanqaulL2WhJNL/CxcaTeaIhOz2Ai87uL
         pD29SfN9/InLXDLuO7K2IkQLIY7ggnpoRDzzzrIrsaTWc38MqR+DZDGfE9PbU/XFl8Cb
         +HIJ/e/QuWzkGtCNpPBs9zAFjG0fhe5zHz2LVObUrhmWcSTQTBBOomAXMYJeCoCGuZ/O
         xKCu/qPjmcf6gHmW2HVU+HqXnxIeFCe9d1fl5ByorN8s1Q8vJ1nhVyjn99PpDWmc5kEE
         aRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKQsTRdrldQlhfZNzWsnpWf/+XJbt/d9X3fTOdf8dxtstBm1w0awqGXZTMbQstOVGKJeVcrww1leigs6o3vlu7MzpmwZs7sjUJBkdCOK4x
X-Gm-Message-State: AOJu0YyN3My6Rxk24GR3Jq3rR5lYJpB0h9NuqKhshgMVvUo3DDlME0+W
	tV+Nf+Qp6TfpCrib1pJF+W7G7vLvXYgE1tofi4KsPdU/tT8JjSf7je8rWcQisTf2j4/ajn0d/HP
	Y3A==
X-Google-Smtp-Source: AGHT+IHBbZP8iE9LJoz88cSwyGPtf4IYoLcqAZBm04Syis1dHtNGwvMpLLvLxNB1S+GJVlzsrbdgQQ4xG0k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:1421:0:b0:680:1ce8:ba9a with SMTP id
 41be03b00d2f7-681aea7d0ecmr40830a12.11.1716987260030; Wed, 29 May 2024
 05:54:20 -0700 (PDT)
Date: Wed, 29 May 2024 05:54:18 -0700
In-Reply-To: <2a221116a03f57dca8274b6bc2da7541b21d86bb.camel@intel.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com> <20240522014013.1672962-4-seanjc@google.com>
 <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com> <ZlYte16cvQpPGHkx@google.com>
 <2a221116a03f57dca8274b6bc2da7541b21d86bb.camel@intel.com>
Message-ID: <ZlclevRvntUMYG6O@google.com>
Subject: Re: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"maz@kernel.org" <maz@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_055422_901368_697C8B5E 
X-CRM114-Status: GOOD (  11.07  )
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

On Wed, May 29, 2024, Kai Huang wrote:
> I am not familiar with SVM, but it seems the relevant parts are:
> 
> 	control->pause_filter_count;
> 	vmcb_mark_dirty(svm->vmcb, VMCB_INTERCEPTS);
> 
> And it seems they are directly related to programming the hardware, i.e.,
> they got automatically loaded to hardware during VMRUN.

"control" is the control area of the VMCB, i.e. the above pause_filter_count is
equivalent to a VMCS field.

> They need to be updated in the SVM specific code when @ple_window_dirty is
> true in the relevant code path.
> 
> Anyway, even it is feasible and worth to do, we should do in a separate
> patchset.

Ya.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
