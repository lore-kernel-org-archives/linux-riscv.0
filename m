Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CDFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 19:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jBAVLH+Z/qqAhuNO8h9pAB2VbYGKVD+PKBEJZLsc/4=; b=DF6D+MBfYzJhb2
	vD+dI8Oh9EULcFtODDnD/TbjWI8RrGLxgDVsV2Vs6mMRs2cqdgf1zLoglDGB2AnHYyz3F+6a6u3qQ
	aorFNcq+fD6AHqXrbkbRMtQpz1PuHhkTR7E4Si1a6kWsH6Iqa6B7509mw0urAZajeX8ogd2q+0cIR
	ggucLEUdTqMwVzVSQ1Cms2rB9Zjj9MbiGEPxsV0ep6iRMtaxg391YoFA8sX1Nt5qk3rTvqPMWwUd7
	baJ6AQB5Tu5QSexa9z63t1vuUjw+Fut9n3n7REL/8ednr5Xmhy90oXqv6wMiRr7Qnr3BX9rgp8wZ4
	HtFmOGGN7Ob6QV6UuskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrmG1-0026DG-Pn; Mon, 29 Nov 2021 19:24:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrmAx-0023o3-J5; Mon, 29 Nov 2021 19:18:57 +0000
Received: by mail-ed1-x52a.google.com with SMTP id v1so76326877edx.2;
 Mon, 29 Nov 2021 11:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b6e11+CJLAryPIw/7DDSWmANxwHaOEFVgPmI0eD1ehw=;
 b=Yv9EDK6h14i2Dbj+iAIYK0HlvK2JERVyMLo4AC4eEaaM5uGAacc8HtxG8w/Y/N1eKa
 zoqVyYrJgoymLJ79VszdPFvZOcROHF7XsZML04k5ATYUCAQQQYdmRFM1zliBw5sA+fUR
 rGCOh7Dkwc25orqYcXeHYn5++zj+NoIkUF+txgA7cbkgTIdSaLJPMhb1GiDwryyn0Wfc
 MU5Gbh+ysqRcMgmq6XO0rBfKo/INnGwUPA9nBrqjSM7nJ1s+plFGQd3Vr5vlky9IMZdn
 wkdyjWJAJzkiJ+6yukZdQ5xwMk5wTjTGyWuy1lXhP9nJ6WRZVyGbloAAqLRFAE+sHa2m
 tnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b6e11+CJLAryPIw/7DDSWmANxwHaOEFVgPmI0eD1ehw=;
 b=IqCA2EBBxULU66F0wf1UCY8sERUq54OugE9fjzZew1HN2DiI44wDFm3foy/1YAzQbB
 nmYktdm9x6JLB1n2CIh9pde0b/tEw9tLyExK1lRcT+vvM74EmHVh6DgrJB4V8pnK1kui
 g6EGfxQxv2SYnc3dUu3GvDVFDorDQ9WSTvQRbsoBG3iDN1vfx7TLJxb0V3ksGpPrqKZ6
 iN6GjTcbajlRpIbeg6eMSfJgEIfV1ZV9WqfeQfLjjoCn2QvdDnz0f0wKpQTROhsqxGPU
 kPjuDlP0bKYhxArZiN0uuMDQ/ZAT21y06fE/bZSYSPrjqhdTvf88r2hiyTJC+eZ6a7HN
 nQOA==
X-Gm-Message-State: AOAM530JfH0Afc8ClB2RrWDSDT8GKI09C1D707zuFoRjiKF22QHgy1mn
 tcuDpTFrojqGxw3rvwFRbss=
X-Google-Smtp-Source: ABdhPJx2YJ0juUfs4Yk6vuSEcojrZsOKQtVYCvzwUVoRUJT0twH/9lzRN0MjKMCkmooXwTOepr8KsQ==
X-Received: by 2002:a17:906:c9d2:: with SMTP id
 hk18mr4315253ejb.523.1638213533689; 
 Mon, 29 Nov 2021 11:18:53 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id ch28sm9615535edb.72.2021.11.29.11.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 11:18:53 -0800 (PST)
Message-ID: <880a5727-69d1-72a1-b129-b053781625ad@redhat.com>
Date: Mon, 29 Nov 2021 20:18:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
 <YaUiEquKYi5eqWC0@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YaUiEquKYi5eqWC0@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_111855_714011_EF92A5D0 
X-CRM114-Status: GOOD (  12.62  )
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

On 11/29/21 19:55, Sean Christopherson wrote:
>> Still it does seem to be a race that happens when IS_RUNNING=true but
>> vcpu->mode == OUTSIDE_GUEST_MODE.  This patch makes the race easier to
>> trigger because it moves IS_RUNNING=false later.
> 
> Oh!  Any chance the bug only repros with preemption enabled?  That would explain
> why I don't see problems, I'm pretty sure I've only run AVIC with a PREEMPT=n.

Me too.

> svm_vcpu_{un}blocking() are called with preemption enabled, and avic_set_running()
> passes in vcpu->cpu.  If the vCPU is preempted and scheduled in on a different CPU,
> avic_vcpu_load() will overwrite the vCPU's entry with the wrong CPU info.

That would make a lot of sense.  avic_vcpu_load() can handle 
svm->avic_is_running = false, but avic_set_running still needs its body 
wrapped by preempt_disable/preempt_enable.

Fedora's kernel is CONFIG_PREEMPT_VOLUNTARY, but I know Maxim uses his 
own build so it would not surprise me if he used CONFIG_PREEMPT=y.

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
