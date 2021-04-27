Return-Path: <SRS0=01Py=JY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE6DC433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 07:05:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C59E61076
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 07:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C59E61076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TVOed1CyWjcJH2ytmVA9LC0CeLjPWDeSPj2KShcdzYo=; b=A3zvRxrlKkLzZnaZLnf3mfTgu
	vzH9JpjlvdD970AvNnu+247GgZf+cBHEfh+lgboshN1oMbf4LGx9Mcj1jUal/zJV2IHh7wMHfP9Bx
	BtyOZf/tA8D1wEOqzpWkvuUJZOcQq9Tdaq8cX4WZW5axGjoD7VFHu7XsF5vqc2EhFVRr0i170zxHF
	FBgFwqEpE+e0MBpqo2PpsNDmuuuLxMQZHUpI/4HvRA+aR5TzBLF2BVPy37e2Ya4F/w6ksrznWeRj/
	Bg2HMNerznl6+TkpsWiCLyCcNPbP94pdW96g/iZvan0KwZyhHMeIN4MfIPiwpj0TO2jkSMh9mDcGd
	7Rr0iEj4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbHm7-000v1k-Pj; Tue, 27 Apr 2021 07:04:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHm2-000v0Y-NC
 for linux-riscv@desiato.infradead.org; Tue, 27 Apr 2021 07:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=vq5D1dmgYRhw7JEWpexSDaLKtPIBt7nneiJL3FVKCro=; b=RxbB8fDwUZYoxQ8R300BVrTJ3m
 08Ev3oXhoD/RSpEiuIauCfaK7G5vqk+dJS52o0676PRrumTeS3/wij/KNOWIRxhjWBC6SmKkvAugo
 eU0b3W6E0vlNRJEfz2ZcZcaLcD8DlgrD4+5yMI+THDmyGvkp/fg25ygPA4d/LwQnE6hsTAcGMrVKH
 WvvuKXVvSmow0Yw2ZlOrnccxiqv7xk1WW97zvuCisvAPuEbRNmLOnBdXeiDsyshXYdijWI1Ijuevl
 U17msCasAD9STRBOLIUbqA7le0FKRaJT1uQoB3XxwCufYmpKxAq67J0WHQFEWxpBt5SREe73Lyvg7
 7mA5cy/g==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHlz-00GUVF-KA
 for linux-riscv@lists.infradead.org; Tue, 27 Apr 2021 07:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619507082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vq5D1dmgYRhw7JEWpexSDaLKtPIBt7nneiJL3FVKCro=;
 b=G7mGpJyErM3nOXcTvmWSvZt/HqRfyEPGQ5v+NzDw9QIOKYEg4HmPD4LJYeAmahSAdKMLy4
 guXRJbEYPToG2+QDU+XNI50ihci7gU2/Hu4LPRrJvwFdknHqXKChJYGzG18N1e8FJjz1+Z
 bOy1od3u1kGKaHrZWOf6yoIWDO0YyPU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561--JtdIyA2PvqHbnLY_YxUmw-1; Tue, 27 Apr 2021 03:04:38 -0400
X-MC-Unique: -JtdIyA2PvqHbnLY_YxUmw-1
Received: by mail-ej1-f71.google.com with SMTP id
 p25-20020a1709061419b0290378364a6464so10906309ejc.15
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 00:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vq5D1dmgYRhw7JEWpexSDaLKtPIBt7nneiJL3FVKCro=;
 b=TZnvO25CxLuVWSAq5KgThWcjZwI8qSO2jrVGrLDc9Vu/tXwvdego5uUepw7aem4W+b
 mX42xw0wbB6o/WTrB8W9B+k5saAPhBk0R8SiqZYo/hHX3VdNrWmRZQpJElUyDKigodH7
 zj/aDAUxcFeMq87dzq0ikHXCkROn1SXYjklwSssVLGrpRQ2YQD9OwT9K8iENW0NniYdR
 QeUBsKDt7KdrHFj4acbVZv3SLdZjZEqvZw51gZ/RqHiv0rKJBy0CXbKpElanGxN4Mcxh
 8gUqwXZHROdYML94xnyXPrEKcbeJggBgczpcOPEsFM45FxORlTnm/hXt+iwFv1k+Z1LE
 hgMg==
X-Gm-Message-State: AOAM531Z94GMwNCF59NIIz+3fcZsJFXPt2riNf40WyTArDRNGUxil4+F
 8m9uFew+TqMiYUX1DMPHwLb259VxGEsDJ8/InTs1bYM88jKM+Rbdav6fc5ke2Gx5KI3R156p8Gm
 dNFlwiTMOv2hlq6LPUNYVfSEloLEB
X-Received: by 2002:a50:ed0c:: with SMTP id j12mr2629972eds.12.1619507077539; 
 Tue, 27 Apr 2021 00:04:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyryIh5RBqbNIbHqf6VF9OAO773lSYnlUYuCt72W2NNb20FWbp7rRgDi3/azf8lhBiftuhROw==
X-Received: by 2002:a50:ed0c:: with SMTP id j12mr2629947eds.12.1619507077279; 
 Tue, 27 Apr 2021 00:04:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id p22sm1660354edr.4.2021.04.27.00.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 00:04:36 -0700 (PDT)
Subject: Re: [PATCH v16 00/17] KVM RISC-V Support
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel
 <Anup.Patel@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Graf <graf@amazon.com>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv
 <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
References: <mhng-d64da1be-bacd-4885-aaf2-fea3c763418c@palmerdabbelt-glaptop>
 <5b988c4e-25e9-f2b9-b08d-35bc37a245e4@sifive.com>
 <CAAhSdy2g13XkeiG4-=0pHVw9Oq5zAeseM2LgxHf6daXD+qnc1Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d6e2b882-ae97-1984-fc03-2ac595ee56b4@redhat.com>
Date: Tue, 27 Apr 2021 09:04:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2g13XkeiG4-=0pHVw9Oq5zAeseM2LgxHf6daXD+qnc1Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_000443_777304_A7ACB1B9 
X-CRM114-Status: GOOD (  34.70  )
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

On 27/04/21 08:01, Anup Patel wrote:
> Hi Paolo,
> 
> Looks like it will take more time for KVM RISC-V to be merged under arch/riscv.
> 
> Let's go ahead with your suggestion of having KVM RISC-V under drivers/staging
> so that development is not blocked.
> 
> I will send-out v18 series which will add KVM RISC-V under the staging
> directory.
> 
> Should we target Linux-5.14 ?

Yes, 5.14 is reasonable.  You'll have to adjust the MMU notifiers for 
the new API introduced in 5.13.

Paolo

> Regards,
> Anup
> 
> On Tue, Apr 27, 2021 at 11:13 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>>
>> On Fri, 9 Apr 2021, Palmer Dabbelt wrote:
>>
>>> On Wed, 31 Mar 2021 02:21:58 PDT (-0700), pbonzini@redhat.com wrote:
>>>
>>>> Palmer, are you okay with merging RISC-V KVM?  Or should we place it in
>>>> drivers/staging/riscv/kvm?
>>>
>>> I'm certainly ready to drop my objections to merging the code based on
>>> it targeting a draft extension, but at a bare minimum I want to get a
>>> new policy in place that everyone can agree to for merging code.  I've
>>> tried to draft up a new policy a handful of times this week, but I'm not
>>> really quite sure how to go about this: ultimately trying to build
>>> stable interfaces around an unstable ISA is just a losing battle.  I've
>>> got a bunch of stuff going on right now, but I'll try to find some time
>>> to actually sit down and finish one.
>>>
>>> I know it might seem odd to complain about how slowly things are going
>>> and then throw up another roadblock, but I really do think this is a
>>> very important thing to get right.  I'm just not sure how we're going to
>>> get anywhere with RISC-V without someone providing stability, so I want
>>> to make sure that whatever we do here can be done reliably.  If we don't
>>> I'm worried the vendors are just going to go off and do their own
>>> software stacks, which will make getting everyone back on the same page
>>> very difficult.
>>
>> I sympathize with Paolo, Anup, and others also.  Especially Anup, who has
>> been updating and carrying the hypervisor patches for a long time now.
>> And also Greentime, who has been carrying the V extension patches.  The
>> RISC-V hypervisor specification, like several other RISC-V draft
>> specifications, is taking longer to transition to the officially "frozen"
>> stage than almost anyone in the RISC-V community would like.
>>
>> Since we share this frustration, the next questions are:
>>
>> - What are the root causes of the problem?
>>
>> - What's the right forum to address the root causes?
>>
>> To me, the root causes of the problems described in this thread aren't
>> with the arch/riscv kernel maintenance guidelines, but rather with the
>> RISC-V specification process itself.  And the right forum to address
>> issues with the RISC-V specification process is with RISC-V International
>> itself: the mailing lists, the participants, and the board of directors.
>> Part of the challenge -- not simply with RISC-V, but with the Linux kernel
>> or any other community -- is to ensure that incentives (and disincentives)
>> are aligned with the appropriately responsible parts of the community.
>> And when it comes to specification development, the right focus to align
>> those incentives and disincentives is on RISC-V International.
>>
>> The arch/riscv patch acceptance guidelines are simply intended to ensure
>> that the definition of what is and isn't RISC-V remains clear and
>> unambiguous.  Even though the guidelines can result in short-term pain,
>> the intention is to promote long-term stability and sustainable
>> maintainability - particularly since the specifications get baked into
>> hardware.  We've observed that attempting to chase draft specifications
>> can cause significant churn: for example, the history of the RISC-V vector
>> specification illustrates how a draft extension can undergo major,
>> unexpected revisions throughout its journey towards ratification.  One of
>> our responsibilities as kernel developers is to minimize that churn - not
>> simply for our own sanity, or for the usability of RISC-V, but to ensure
>> that we remain members in good standing of the broader kernel community.
>> Those of us who were around for the ARM32 and ARM SoC kernel accelerando
>> absorbed strong lessons in maintainability, and I doubt anyone here is
>> interested in re-learning those the hard way.
>>
>> RVI states that the association is open to community participation.  The
>> organizations that have joined RVI, I believe, have a strong stake in the
>> health of the RISC-V ecosystem, just as the folks have here in this
>> discussion.  If the goal really is to get quality specifications out the
>> door faster, then let's focus the energy towards building consensus
>> towards improving the process at RISC-V International.  If that's
>> possible, the benefits won't only accrue to Linux developers, but to the
>> entire RISC-V hardware and software development community at large.  If
>> nothing else, it will be an interesting test of whether RISC-V
>> International can take action to address these concerns and balance them
>> with those of other stakeholders in the process.
>>
>>
>> - Paul
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
