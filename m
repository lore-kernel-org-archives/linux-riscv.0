Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B32C4707F
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 01:21:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDECE60E09
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 01:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDECE60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVZRq8JInej0Hl1KgGF/gE+NHiWQW5PHAfn62nu+7U8=; b=Si8iVWy9aGTqDI
	tLb7//nNW4g2cZ9XquqJrIrIqjYGUUY9sRO6k38ChRniEDDGvI9jn5uzyzrkfcV02VWHIzzTMUwlt
	AY9+kc1JeNi0pEuCcehRkjtzHn+2P1frlAYJlIHBxPcuNqeFIT4utUf2Mm+WpKSyxTCKavSOzKX5i
	MPpX+Rjy9L2XUSrkWBhQ7JVEkmPc98LCRUObiYKP/j1NcGVz2emAQ2iIjvASL7xQb7WuIWPV5RSU7
	1CVedv8wvrCDz+Wd2FLbuwwaYfn/a0TB2nVOBBmFaZnv+xfDYgTr1r1z/qKNDUskh7+jxh49t9LLM
	MtTkpf7+XUKYEOoOoBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmRBY-00Au5S-NU; Fri, 28 May 2021 01:21:12 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmQxY-00AoXU-NI
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 01:06:46 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 66-20020a9d02c80000b02903615edf7c1aso1985851otl.13
 for <linux-riscv@lists.infradead.org>; Thu, 27 May 2021 18:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=My9UV3KfRsIE2OYFFO9odGDLSxkwqhPaNcyCAkYgfPE=;
 b=Fbmz3YEwm9/YekpOb8CGYnreH5dCyyiNaZ/iM2wR1Ho6nXwjyImhIoAH6eSQV3/Nv6
 pqJvhIRu1Ph193fjKZTovWrSZAuZuElN58L18zFzCW8ZRtdYiQzJQ4GCa669wLWm7UcP
 ZmJwftJjJxiCmAWmfj4a6Ki+YdB4G5/8PmdeBaCA74g1jrfcEXcoeBs96nwcn1KG8bYR
 Un1LlLmy5ATmE/jlbP9RUYqVeIf2hMtEPVFzpMWvLhckiSJ4rtJ1tFYHVrE2AQxYzJzw
 ayBm5LWwRPcFSkkI2KegLMAvrkZErFQ570MOjpUGtSwsfPLKTVZFlUgzK2NScnkv7g2s
 FsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=My9UV3KfRsIE2OYFFO9odGDLSxkwqhPaNcyCAkYgfPE=;
 b=IzSmKmTjxcazwhVP2vcBePOYTNLbnWZWKWALkumvxq4Fv0tCW4YZvUzcG2hXV9A6l/
 BLc2Sr4XbMi7ssU6ziWEpORBc7LDerZrChsPkyaAxG+byqDIhV3WqhpwUOOqwXBYGc2D
 e5TPPCimjxWItb/s2O0oKAcPCT3QTWIgkrkld9XZlxIzbAVzNFjEZ8JkOYOApoP9AeY9
 BtQDX/Kd68GCWwUM6MCgipTlswyYCw8dJJNUsIDo638PCGuGofAm/MkuTF9zNCHw/jjh
 Zai5R6VbDsQXY2wV6PZvUNhhwvRXQTORy/PW8UVanQPnnl81vpCUnjhjmwZB7wwNFbzL
 BoxA==
X-Gm-Message-State: AOAM530tvQ6eP0R27H/hOEgMRUIQRTCRjowWq9mhLg9BSG3PjAZR8GIe
 br8TktLG0N1mbyNF7obkSaft/mRMkQNYww==
X-Google-Smtp-Source: ABdhPJwej90vv4Qb06LfmedmXuraDFLq3vr6y5MVnZ107yQC65MlSPvSFq2tuXiq5EBnFujq7tG66A==
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr4984654oth.229.1622164003041; 
 Thu, 27 May 2021 18:06:43 -0700 (PDT)
Received: from localhost ([2601:8c4:0:1be::1e4])
 by smtp.gmail.com with ESMTPSA id y7sm824818oto.60.2021.05.27.18.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 18:06:41 -0700 (PDT)
Date: Thu, 27 May 2021 18:06:40 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Anup Patel <anup@brainfault.org>
cc: Damien Le Moal <Damien.LeMoal@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Anup Patel <Anup.Patel@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: arch/riscv/staging
In-Reply-To: <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
Message-ID: <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_180644_875860_C979DF97 
X-CRM114-Status: GOOD (  41.15  )
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

Hi Anup,

On Sat, 22 May 2021, Anup Patel wrote:

> On Fri, May 21, 2021 at 10:53 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> > On Fri, 21 May 2021, Damien Le Moal wrote:
> >
> > > For the hypervisor extension and KVM support, the specifications are now very
> > > stable and while changes due to the advanced interrupt controller specs work,
> > > among other, are still possible, the changes will likely be small and should not
> > > cause much headache in the kernel.
> >
> > This is the part that I don't quite understand.  If everyone -- including
> > the architecture folks working on the ISA extension at riscv.org -- agrees
> > that the H extension isn't going to change significantly, why don't they
> > freeze the extension?  Could it be that the RVI folks are worried that
> > they may need to make significant changes, and that's why they haven't
> > frozen it yet?
> 
> I have been involved in the H-extension spec development for the past
> few years working with RISC-V ISA architects (Andrew and John.) I am also
> involved in the RISC-V AIA specification as chair. 

Sounds like you've got great connections with the right people at RISC-V 
International as far as virtualization is concerned.

> I confirm that all required provisions are already there in the RISC-V 
> H-extension to support an external interrupt controller with 
> virtualization acceleration (such as RISC-V AIA).
> 
> In fact, Paolo (with his years of experience in KVM virtualization) also
> confirmed that current H-extension have all required features.
> 
> Clearly, significant changes are very very unlikely.

Earlier this year, there was a post where someone asked on the RISC-V 
International lists whether the ISA architects were ready to freeze the H 
extension:

    https://lists.riscv.org/g/tech-privileged/topic/80346318#465

Many of the same points were made that you and Damien and Paolo have 
brought up on the Linux kernel mailing lists.  Two engineers working on 
the RISC-V ISA responded, representing two different companies.  They 
wrote in the thread above that it's "far from certain" that no changes 
will need to be need to be made, and that "it's a good (and necessary 
compromise)" to "[wait] a little longer to see [the AIA specification] at 
least stabilize".  So it sounds like there's still a diversity of opinions 
here.

Since it sounds like you've got a lot of influence with the RVI folks 
working on virtualization, seems like you'd be an ideal person to try to 
convince them that you're right and that they should freeze the hypervisor 
ISA extension right now?  Then we could just merge your patch set and we 
could all skip the next round of Linux kernel E-mails about this topic.

> > > That will reduce the risk of seeing forks pop out here and there and
> > > greatly facilitate Paolo and Anup work.
> >
> > When you write about forks, are you worried about architecture forks,
> > forks of Anup's patchset, or some other kind of fork here?
> >
> > I ask because in the past, it sounds like there's been some concern 
> > from WDC that someone else will come along and submit an alternative 
> > RISC-V KVM patch set that we'd somehow prefer over Anup's.  That's 
> > pretty unlikely; I think everyone involved -- certainly including 
> > Palmer and I -- know that you guys have done the foundational work 
> > here, and you guys would certainly have clear precedence here, unless 
> > there turned out to be something wrong with the WDC patchset that you 
> > all wouldn't be willing to fix.  But maybe I'm misunderstanding your 
> > concern?
> 
> This is certainly your misunderstanding. 

OK, well, maybe you and Damien can get together and spell out what you all 
are concerned about regarding forks.  Then we can see if there's anything 
that should be done to address it.  

Right now the only fork risk that I can see is related to the architecture 
itself.

> > But in terms of the suggestion to create arch/riscv/staging, I think
> > that's just going to create the same problems that the RISC-V patch
> > acceptance guidelines were intended to solve.  To put it differently, from
> > my point of view, it's a feature, not a bug, that we don't send code for
> > discussion drafts of ISA changes upstream to Linus.   But maybe I'm
> > misunderstanding what you're looking for ?
> 
> For KVM RISC-V, the arch/riscv/staging directory is a perfect solution
> because:
> 1) The KVM RISC-V UAPI is header is indeed based on the latest
> ratified RISC-V privilege spec v1.11 hence the KVM RISC-V UAPI
> header complies with current RISC-V patch acceptance policy.
> 2) All usage of RISC-V H-extension is contained within the KVM RISC-V
> sources only. Rest of the Linux RISC-V kernel does not use H-extension
> at all.
> 
> The current RISC-V patch acceptance policy should make an exception
> for draft extensions where the UAPI headers are based on ratified
> RISC-V specs and sources for such draft extension should be placed
> in arch/riscv/staging directory.

Others have already covered why arch/riscv/staging is a bad idea, so no 
point in rehashing that here.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
