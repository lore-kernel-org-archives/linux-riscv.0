Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6BEC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2L6YT0w1CrVJoBJ3cA6hX9ZCgUgqejekGvfmrwPdQfA=; b=xntrwVYe0OOHHu6ai0iP9EZwiv
	GVkyPF0zxGtbnubTJ+4W7420SMuRkiHkmE8CEUzMyo3T5QYMW2PjCX2eaoaVhk0DkrdXZIO1F+aMW
	QBYN7n4E8MNyytQe97vMI42G1CIgfmhqzgn8oK64+OQa1PTnLSZtGt6/HvFx6jUET3LHnZ/U5gdVU
	D4AgVbS60XSkJ3LWvIEkhoiJfeGxF6xRb1xN7xBCwvWz0LCgQAnc6m4wNtfZ4zJNvRCcNu0rYIB6k
	lWHT8c2/VzCmoUKPFrU0MMvFedbKh28ZlWXuz6URiDMcrRs6cSg9e+8O+aAS15pB3BLlGz0A8ZG+/
	hSG5VtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAUW5-004Ozm-AU; Wed, 28 Dec 2022 11:22:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAUVl-004OpI-Ug; Wed, 28 Dec 2022 11:22:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D2C46136E;
	Wed, 28 Dec 2022 11:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C988C433EF;
	Wed, 28 Dec 2022 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672226533;
	bh=g/ko60RCUy62mgwJX+BHqh4+FybNochgcGqfnbFgn1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bkySoNrEPygYgl5QF2mbRvdQP90/TfV81MHuS96aaZXlQcngUJ3MnPH6eA7QDx4Th
	 9qys9DmCGwyeY+hU2x+2CaIsq4ffMaWs2Andkc5MUnCRyhe2gJL1UT52VEPs78jq5D
	 4F1Tuo0nQj1sMGDBh/MID5iNoErPu3cmtJOLrAi9mragNuaOC3UExlhvrMtXFgnRzt
	 wrjQrwIdzHmXG2C/xHTzuK1MlUOE4h7gPaZmWOD7ADqmpxfpX3FjjQu/1lKSa6NQ2/
	 OpnrZhXA+oWI8B3m33i+IQsklsKqkL22FNLezHwLuMeZmbP3lDV+wqKLg9C8uYzdJ+
	 KTTyjywJXPOvw==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1pAUVf-00FXTE-4f;
	Wed, 28 Dec 2022 11:22:11 +0000
MIME-Version: 1.0
Date: Wed, 28 Dec 2022 11:22:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, James
 Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton
 <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>, David
 Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, Cornelia Huck
 <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas
 <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Kai Huang
 <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [PATCH v2 00/50] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <20221227130249.1650197-1-pbonzini@redhat.com>
References: <20221227130249.1650197-1-pbonzini@redhat.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9acea262dec3511e9cf63081506f0bd7@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, seanjc@google.com, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, mjrosato@linux.ibm.com, farman@linux.ibm.com, vkuznets@redhat.com, dwmw2@infradead.org, paul@xen.org, james.morse@arm.com, alexandru.elisei@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, atishp@atishpatra.org, david@redhat.com, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, yuan.yao@intel.com, cohuck@redhat.com, isaku.yamahata@intel.com, philmd@linaro.org, farosas@linux.ibm.com, mpe@ellerman.id.au, kai.huang@intel.com, chao.gao@intel.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_032218_431667_31EE43A2 
X-CRM114-Status: GOOD (  10.21  )
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

On 2022-12-27 13:02, Paolo Bonzini wrote:
> Queued, thanks.  I will leave this in kvm/queue after testing 
> everything
> else and moving it to kvm/next; this way, we can wait for test results
> on other architectures.

Can you please make this a topic branch, and if possible based
on a released -rc? It would make it a lot easier for everyone.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
