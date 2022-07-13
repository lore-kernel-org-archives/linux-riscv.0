Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45CFC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 07:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbGZOmfbmPNHxCI7MTdN5YwyByXFgJDmNAvIJRYMIjU=; b=oBCX9mf04lYUXg
	16MPHUL7wAnfa1liv7bCxjpwc33iey892BVMU204Bp6qP8L3xkYRZZDlBmzV1xbPKv7RN35MiSObp
	21Vo0Gp1lJNR4aT63DQJk47RsI7sF0qzUSKyH8vpRxDYJPGsCSuJdYpoQYOFLXQeIUfAhN6PC+C0g
	dapIQZjYA2+3UHIzvEogoq7Fv2YWcfCn+CZdKxYqs07kDPaAytEE25jbTtnJBPegX4P4K17Z4bHOg
	AnFDN5tQvTgesAVVPWk/9w7Z08ZgnDGHVHSqa8swx7KYd0iO4l8Nat+xZ08gZpePCwoXcV+L815KF
	7qL0bqoPeKg1PJbt2c5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBWmi-001FV3-3W; Wed, 13 Jul 2022 07:27:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBWme-001FOD-Go
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 07:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657697263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dhZTYpLxnL2bZiylFvckcQJP6YV2ZgP2bcqRIrr9Yeg=;
	b=XskLZE+onCDJqPnvdz5ozpXtaAWU9iv5fzBs3RgR9KKSch49ozSuz6rFfU8EOP2uDA/14t
	uRfk3N4EKFxY8sFqAtHbJWAmbQBdP7YfkDsjxu3OE4MYzeU2rGDKI/3P3yym7K/y/CsbOu
	A+6dpxWq4aL5m/OTuUEBgKjuhifl0q4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-rEYcvDSBP82LFoO1cV3Utg-1; Wed, 13 Jul 2022 03:27:42 -0400
X-MC-Unique: rEYcvDSBP82LFoO1cV3Utg-1
Received: by mail-ej1-f69.google.com with SMTP id x2-20020a1709065ac200b006d9b316257fso3036843ejs.12
        for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 00:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dhZTYpLxnL2bZiylFvckcQJP6YV2ZgP2bcqRIrr9Yeg=;
        b=RogiUANM00ESy67s7LW9fiaTzRLVOasnToogh6JyeM7HPVPrLgSCDa+moFUlRn3sa9
         oUEjvhBTyrpWozeYxczxJrCfhDyBuX30sLy+I8d10aiREraOiHxJ6wFff0bpw6WvUwYL
         WRIv3Bo+s1MBl7iVaNLVdmGmOh4/TqafquTyITyxmzNKozE5N+W8XHrdl1Xl4XwL8/pl
         2bwx8jPiBToarAm0ty6+7oSEdFiEkY+FkdF53CWfLBhEM6oVVQGSoweJRNEoRK+7laJc
         nEwhpDHv4nH7JSUv5teg4frUup4bQGh5bVmVTPCULggJZJzvZef2G5mIkffVUAa2h9ox
         gKMw==
X-Gm-Message-State: AJIora+XmycSWJAOAXftcPM5vq2/qBL7n6wPVuKaBGAa84gXVMOpRIjZ
	hg6+tM8fWalDgcsP1vTsvcfwRi2WqxRC4So8wF7vGyqftzUlk2oDyhQXyQvYb4+PeSPG9tXTHPp
	YHYTomw9dS3P+0C5J6iRCmZ8z5Mgn
X-Received: by 2002:a17:906:604f:b0:718:e9e8:9d2a with SMTP id p15-20020a170906604f00b00718e9e89d2amr2007866ejj.315.1657697260863;
        Wed, 13 Jul 2022 00:27:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1viPdgz1OQQGbA5i2sFD4rjvppVT3kLlNuMm2yZyN2OpoiNndAz/uOwH0Gal0wbA7eTVo3Nmw==
X-Received: by 2002:a17:906:604f:b0:718:e9e8:9d2a with SMTP id p15-20020a170906604f00b00718e9e89d2amr2007854ejj.315.1657697260658;
        Wed, 13 Jul 2022 00:27:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id y25-20020a170906471900b0072b91a3d7e9sm736295ejq.28.2022.07.13.00.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 00:27:40 -0700 (PDT)
Message-ID: <5610de7f-5a28-288a-b6bc-9ad7a36e27be@redhat.com>
Date: Wed, 13 Jul 2022 09:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [GIT PULL] KVM/riscv fixes for 5.19, take #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>,
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy1CAtr=mAVFtduTcED_Sjp2=4duQwgL5syxZ-sYM6SoWQ@mail.gmail.com>
 <01ec025d-fbde-5e58-2221-a368d4e1bb3a@redhat.com>
 <CAAhSdy2gR3dtBHO0Q7+1xgMCytYkJgmuT6xiQ+WQiorQPMRUXA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy2gR3dtBHO0Q7+1xgMCytYkJgmuT6xiQ+WQiorQPMRUXA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_002744_668833_6C836792 
X-CRM114-Status: GOOD (  18.41  )
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

On 7/13/22 09:17, Anup Patel wrote:
> On Wed, Jul 13, 2022 at 11:30 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 7/13/22 07:47, Anup Patel wrote:
>>> Hi Paolo,
>>>
>>> We have two more fixes for 5.19 which were discovered recently:
>>> 1) Fix missing PAGE_PFN_MASK
>>> 2) Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()
>>
>> Pulled, thanks.
>>
>> For the latter, my suggestion is to remove KVM_REQ_SLEEP completely and
>> key the waiting on kvm_arch_vcpu_runnable using kvm_vcpu_halt or
>> kvm_vcpu_block.
> 
> We are using KVM_REQ_SLEEP for VCPU hotplug. The secondary
> VCPUs will block until woken-up by using an SBI call from other VCPU.
> This is different from blocking on WFI where VCPU will wake-up upon
> any interrupt.

Yes, I understand.  The idea is to have something like

	if (kvm_arch_vcpu_runnable())
		vcpu_enter_guest(vcpu);
	else
		kvm_vcpu_block(vcpu);

instead of using KVM_REQ_SLEEP to enter the blocking loop.  This works 
for both WFI and hotplug, the only difference between the two cases is 
the event that changes kvm_arch_vcpu_runnable() to true.

Paolo

> I agree with your suggestion, we should definitely use kvm_vcpu_block()
> here.
> 
>>
>> Also, I only had a quick look but it seems like vcpu->arch.pause is
>> never written?
> 
> Yes, the vcpu->arch.pause is redundant. I will remove it.
> 
>>
>> Paolo
>>
> 
> Thanks,
> Anup
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
