Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A538C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 18:58:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFDF061106
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 18:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFDF061106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OAjDKDwxMk9f5onA3dbmMAzCX7CVhnZHtkT6WDOlyu4=; b=AieidpsYn4aJlv4zNqpP6ODLT
	uhXPt7fWkoHiOuAAG/XoBGvpGMnUUfGekz0JZKTyCcdmaYAhYDYTtkQtR8lbjaX92IPOXsdCALhvr
	vgjlzjieBvSUJhjare9zMc8pHxxVZR0EvZdpUBalrCPij6dDqkWHXQN5P9C2QorxVefT5lyw94ggh
	pulTUseHgwB8V17c3H/RXdtJb1eQkrT4yYv+XyRbKb1kp7qf7VQ3MXrPQ2kfap/Oh2HcTd/SzNakc
	NIvPeLw3NTZBUBqtb3hsc5xKTykPyOu8uGcaeooMV9zqHP40cP2tuCYv1Vc1Hqpiru1MatpE1jPbE
	WsMZv7+6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUwKr-001OCS-Rh; Fri, 09 Apr 2021 18:58:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUwKq-001OCJ-8N
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 18:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=qzPGYRIIgbwAx3GIWXZYzwGgFSrgnjtXWJk804zYlrk=; b=MXgP9WoB6YlOQTW6eoY0vOGONT
 VEnly11DDfroNvdWeD98P04JJ6mkcFbm5bNz+p0Uy1syn90Yr0iLVvsKiqwUAACwDrVCHEQ/yKaUf
 V4I2f98UDmhHEhuygZsjYzOfLeFlEF9FqvYPXFfmq6VnWg/5fVZHQyJYzK2Dd2wa8AbfA+i/Idrw/
 SClJP3oLCDEmSAB/nUsUXW2HF9AZjA1KVXUPcm0tath3c5DuNw+GXCQ5zbHw5fUrG7JiCHzg/pvWB
 9tkrxfQwF8skhekXJsYm/9eUiZeW+EQfMMg5v+s8qJ/uPrDmAH6ekHKdVeF7I1UOYz6Ry/Tp1ONTt
 /6tLo8TQ==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUwKj-004kFB-Pb
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 18:58:23 +0000
Received: by mail-pf1-x435.google.com with SMTP id q5so4822344pfh.10
 for <linux-riscv@lists.infradead.org>; Fri, 09 Apr 2021 11:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qzPGYRIIgbwAx3GIWXZYzwGgFSrgnjtXWJk804zYlrk=;
 b=R2zitmc2UyEV/XFPNt4ZmSNyBT88XlV5CyfSwFCKbaDvAMOKHhQmYhcmW8lpJ3DVT3
 O3xwUFblk6wGJdP9AvbLAreJHXUBPiiKV+GpPPrDC6J5pe4D6+0XFpUbR9FRuvbpeoVf
 d31nPgAzjXydWPbI/6YEgHQM9JSocQV3RK90CXUdO7ypRQeaboZBYagiFSBo+EYusG3N
 0d82tK0bvRp31CvuDfLoVqCnkBvB9RlogDGlgnKphfFkXREFMGqR5bWYQs3ysQywimdD
 yEVesZi3bfW44keuWvg4KLYJMfp2mEXxmGRAPK23mlTtNVbLKe/VjJpIQbFGD20E9McU
 ezlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qzPGYRIIgbwAx3GIWXZYzwGgFSrgnjtXWJk804zYlrk=;
 b=bSV28RKqie5E6XZwrfS2XhjAejNQpVchy7DjI6Ho7T7leh3XC5NQG+u1+DBw+CF0rC
 grjdw3Y1KT2ByS08yM0WijupSku4VgXJX2CKc4lZui87PtTjvhUcxcFoo+V6HYeXugJ7
 lzdTi0GsSq8ovEJYvqGZT5YVBjrZgNpSMo1NPRkILizU8QK/YIbqqjzlyyjdA6sWNAG8
 LoXA1ZkfiPibfExEn8chrYp95B6tXdwlM4VaEKsyswtAEdDR8XIyPuzkLeOk42rNqJ2Z
 abCcXZk/+mP3OCW+UYizUPhGr6UKmv72kgp4Vq7wJsSA/VeYcYgN54iXamR+gQ+n9U3A
 R64A==
X-Gm-Message-State: AOAM531Ync0RGEa4/T6FrGGFYT9YNZLHFsZidJiuQLHINrOiGJMGVQ4s
 2fW/ueej3MNcLvXekpjqzBmQEA==
X-Google-Smtp-Source: ABdhPJwKIOtldl7rBGs1NBZjyVCx0kPKACsREmjytSOckbEVS1OO/AnMx6b5G8xwh41jOKZDd2aUbA==
X-Received: by 2002:a63:6744:: with SMTP id b65mr14411777pgc.314.1617994700058; 
 Fri, 09 Apr 2021 11:58:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l18sm3602095pgh.70.2021.04.09.11.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 11:58:19 -0700 (PDT)
Date: Fri, 09 Apr 2021 11:58:19 -0700 (PDT)
X-Google-Original-Date: Fri, 09 Apr 2021 11:58:17 PDT (-0700)
Subject: Re: [PATCH v16 00/17] KVM RISC-V Support
In-Reply-To: <a49a7142-104e-fdaa-4a6a-619505695229@redhat.com>
CC: anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 graf@amazon.com, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: pbonzini@redhat.com
Message-ID: <mhng-d64da1be-bacd-4885-aaf2-fea3c763418c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_115821_928940_B47153A2 
X-CRM114-Status: GOOD (  43.64  )
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

On Wed, 31 Mar 2021 02:21:58 PDT (-0700), pbonzini@redhat.com wrote:
> On 30/03/21 07:48, Anup Patel wrote:
>>
>> It seems Andrew does not want to freeze H-extension until we have virtualization
>> aware interrupt controller (such as RISC-V AIA specification) and IOMMU. Lot
>> of us feel that these things can be done independently because RISC-V
>> H-extension already has provisions for external interrupt controller with
>> virtualization support.

Sorry to hear that.  It's really gotten to a point where I'm just 
embarrassed with how the RISC-V foundation is being run -- not sure if 
these other ones bled into Linux land, but this is the third ISA 
extension that's blown up over the last few weeks.  We had a lot of 
discussion about this on the binutils/GCC side of things and I've 
managed to convince myself that coupling the software stack to the 
specification process isn't viable -- we made that decision under the 
assumption that specifications would actually progress through the 
process, but in practice that's just not happening.

My goal with the RISC-V stuff has always been getting us to a place 
where we have real shipping products running a software stack that is as 
close as possible to the upstream codebases.  I see that as the only way 
to get the software stack to a point where it can be sustainably 
maintained.  The "only frozen extensions" policy was meant to help this 
by steering vendors towards a common base we could support, but in 
practice it's just not working out.  The specification process is just 
so unreliable that in practice everything that gets built ends up 
relying on some non-standard behavior: whether it's a draft extension, 
some vendor-specific extension, or just some implementation quirks.  
There's always going to be some degree of that going on, but over the 
last year or so we've just stopped progressing.

My worry with accepting the draft extensions is that we have no 
guarantee of compatibility between various drafts, which makes 
supporting multiple versions much more difficult.  I've always really 
only been worried about supporting what gets implemented in a chip I can 
actually run code on, as I can at least guarantee that doesn't change.  
In practice that really has nothing to do with the specification freeze: 
even ratified specifications change in ways that break compatibility so 
we need to support multiple versions anyway.  That's why we've got 
things like the K210 support (which doesn't quite follow the ratified 
specs) and are going to take the errata stuff.  I hadn't been all that 
worried about the H support because there was a plan to get is to 
hardware, but with the change I'm not really sure how that's going to 
happen.

> Yes, frankly that's pretty ridiculous as it's perfectly possible to
> emulate the interrupt controller in software (and an IOMMU is not needed
> at all if you are okay with emulated or paravirtualized devices---which
> is almost always the case except for partitioning hypervisors).

There's certainly some risk to freezing the H extension before we have 
all flavors of systems up and running.  I spent a lot of time arguing 
that case years ago before we started telling people that the H 
extension just needed implementation, but that's not the decision we 
made.  I don't really do RISC-V foundation stuff any more so I don't 
know why this changed, but it's just too late.  It would be wonderful to 
have an implementation of everything we need to build out one of these 
complex systems, but I just just don't see how the current plan gets 
there: that's a huge amount of work and I don't see why anyone would 
commit to that when they can't count on it being supported when it's 
released.

There are clearly some systems that can be built with this as it stands.  
They're not going to satisfy every use case, but at least we'll get 
people to start seriously using the spec.  That's the only way I can see 
to move forward with this.  It's pretty clear that sitting around and 
waiting doesn't work, we've tried that.

> Palmer, are you okay with merging RISC-V KVM?  Or should we place it in
> drivers/staging/riscv/kvm?

I'm certainly ready to drop my objections to merging the code based on 
it targeting a draft extension, but at a bare minimum I want to get a 
new policy in place that everyone can agree to for merging code.  I've 
tried to draft up a new policy a handful of times this week, but I'm not 
really quite sure how to go about this: ultimately trying to build 
stable interfaces around an unstable ISA is just a losing battle.  I've 
got a bunch of stuff going on right now, but I'll try to find some time 
to actually sit down and finish one.

I know it might seem odd to complain about how slowly things are going 
and then throw up another roadblock, but I really do think this is a 
very important thing to get right.  I'm just not sure how we're going to 
get anywhere with RISC-V without someone providing stability, so I want 
to make sure that whatever we do here can be done reliably.  If we don't 
I'm worried the vendors are just going to go off and do their own 
software stacks, which will make getting everyone back on the same page 
very difficult.

> Either way, the best way to do it would be like this:
>
> 1) you apply patch 1 in a topic branch
>
> 2) you merge the topic branch in the risc-v tree
>
> 3) Anup merges the topic branch too and sends me a pull request.
>
> Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
