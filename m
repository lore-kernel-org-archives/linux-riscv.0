Return-Path: <SRS0=01Py=JY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A99C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 05:44:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1894B61159
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 05:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1894B61159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ivmpUH+AK1ejf3Ha1QIl4WvY4L1iIvPdppxI89QNHiU=; b=cqkwT/E0OaGhqcwQFseafvOrM
	OVzvkmxuSB4RqLpQvk0m3n1yDxEpi708CaM8WyoZgtbiX9wyHwqg0+9I/vdYS+fvSpE1rt59v2J4M
	67LFkv03lJwaZ19ZJW0RAWvZul9Oeq1zmHjgdap2nquSu1yPJHyqUi6vcfpUPXB67m0nHRzS5xMv5
	hZN5do3GAlw2zNsS5gte+vHLcJY/mHjQ1HrrHhOF1xQfHxLzPfWksUeNxF8WOeofyNNJ/Jg8d1Uvi
	wk18yPfkBoncpCGk8jJ80HRpoeyDV+sSBTcRvQXr/Bc41gczBYteRP9Tp8FOHr9pvojeUE247vJXx
	sewizA/Cg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbGVb-000mfY-Er; Tue, 27 Apr 2021 05:43:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGVQ-000mdD-DB
 for linux-riscv@desiato.infradead.org; Tue, 27 Apr 2021 05:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SBoQA4Uv7DLmSIXEW0MEX4XHroR9+cpW7ygxQxARLAo=; b=3D8aiOkQ5FRjdqUyo9tzwQQIHM
 uJoUbAUpRUK8OvbwUT0c9msgR2sJ+tD91kVbXLb+QJM7gbTqvOz5uJHfr30QJLcLBRLrIrj8LEZwE
 pvboT/M4lvxmMgpwIOOk4Aybb7y0CXvBRSw86bwz/ufpK1Se8hNU0Uuo8CJd7ZVUbe4Aghh5suj0a
 c1B6eMYV094Q7OdSHJIXDh+LYTxcMI53hiCMdaCn3PDQHpdLYcfaaIO77m6dgcRUAViCReoQMIYu+
 I55eJyKCYjl2/a+MCFcoorgN5fp3+SmMdNMM7x/GRUIRATX4lyBFRjnTu7lspU+aM2m5qI9qtwkGZ
 jkX3dOMw==;
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGVK-00GSQJ-GU
 for linux-riscv@lists.infradead.org; Tue, 27 Apr 2021 05:43:30 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso49558988otv.6
 for <linux-riscv@lists.infradead.org>; Mon, 26 Apr 2021 22:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=SBoQA4Uv7DLmSIXEW0MEX4XHroR9+cpW7ygxQxARLAo=;
 b=kHaLqDb9tPK/cTtDQL0jqdvZRKyp6ozWs6a07TXO50e4DzhJRW54tzEwyPqkOd+Idu
 Xvl17n/e7iD87kfE0YkYBAdQLD9mL5bOeEh5hkOL3zP+TpdiDzWhOD887gBXvphNHgRc
 zzt/V0DygwckYPy3lCMyBQOeeuJcoWVX2mb9IrgiC/AZDMAZ7Vq4r8dkJKLuK9F3iYr3
 Tn9H5Cs3VmpFCzOXzTTYLxmWedMHZ8xc6BXzyy1FvNTr3qFh9SCzxyNamEvwADo1s6yF
 m1y3o5G1g2oX+iwea+tzpr+bLoNX2MPGWXtjaSDEFs8iuygZGozipJ7ADWhxAF3H/jHV
 FLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=SBoQA4Uv7DLmSIXEW0MEX4XHroR9+cpW7ygxQxARLAo=;
 b=NNexQDOxRwoFpQt40CRKdptp4ggB2PCBzQpmA3N4SVdD4bAX7DZj+qAMhB0CGwj3z3
 LjbBBfDm5FJNDaD2avDr12YSYo8LJFw+KBWOcPseqaQEn8mX+heHb+uIkGPa8fD36oOz
 YEFG/hAVQTOswSm49VjBu6FrzKY48i9tG8ysZLSBkVg0QsBa5A5Lp45iQ+Gd+E1HeGSi
 73HkauFx2x7KRNb+MLwCo6lfBq0JgOTrgH+qKJ/X0yKMzcPfpa5et9Q2G+7DVTMpZuFJ
 zLMQBufzypeGUy70nYouMC/tua+TYXKse6lVyBoJx9kMnpX2UCeGHaWWvT/MnZRNcvL5
 oPrA==
X-Gm-Message-State: AOAM532JJNEjLMFnnDmBRV+IINjK4DnqC6ImHnO2gW8F2+7KDgggFa5L
 JaINtOR2ud4JS0dFBNDHaKd3tw==
X-Google-Smtp-Source: ABdhPJya10WMSePhh0RjJp+JfqVWDnjJc4mpDe4nyTacE//ULLCUor9Qa2qpxCv7Y/GWwHemTSmQeA==
X-Received: by 2002:a9d:7b42:: with SMTP id f2mr4567984oto.267.1619502203160; 
 Mon, 26 Apr 2021 22:43:23 -0700 (PDT)
Received: from localhost ([2601:8c4:0:1be::1e4])
 by smtp.gmail.com with ESMTPSA id g3sm1097006otq.50.2021.04.26.22.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 22:43:19 -0700 (PDT)
Date: Mon, 26 Apr 2021 22:43:18 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
cc: pbonzini@redhat.com, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>, 
 aou@eecs.berkeley.edu, graf@amazon.com, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 00/17] KVM RISC-V Support
In-Reply-To: <mhng-d64da1be-bacd-4885-aaf2-fea3c763418c@palmerdabbelt-glaptop>
Message-ID: <5b988c4e-25e9-f2b9-b08d-35bc37a245e4@sifive.com>
References: <mhng-d64da1be-bacd-4885-aaf2-fea3c763418c@palmerdabbelt-glaptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_224326_582428_918C7C1A 
X-CRM114-Status: GOOD (  30.39  )
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

On Fri, 9 Apr 2021, Palmer Dabbelt wrote:

> On Wed, 31 Mar 2021 02:21:58 PDT (-0700), pbonzini@redhat.com wrote:
> 
> > Palmer, are you okay with merging RISC-V KVM?  Or should we place it in
> > drivers/staging/riscv/kvm?
> 
> I'm certainly ready to drop my objections to merging the code based on 
> it targeting a draft extension, but at a bare minimum I want to get a 
> new policy in place that everyone can agree to for merging code.  I've 
> tried to draft up a new policy a handful of times this week, but I'm not 
> really quite sure how to go about this: ultimately trying to build 
> stable interfaces around an unstable ISA is just a losing battle.  I've 
> got a bunch of stuff going on right now, but I'll try to find some time 
> to actually sit down and finish one.
> 
> I know it might seem odd to complain about how slowly things are going 
> and then throw up another roadblock, but I really do think this is a 
> very important thing to get right.  I'm just not sure how we're going to 
> get anywhere with RISC-V without someone providing stability, so I want 
> to make sure that whatever we do here can be done reliably.  If we don't 
> I'm worried the vendors are just going to go off and do their own 
> software stacks, which will make getting everyone back on the same page 
> very difficult.

I sympathize with Paolo, Anup, and others also.  Especially Anup, who has 
been updating and carrying the hypervisor patches for a long time now.  
And also Greentime, who has been carrying the V extension patches.  The 
RISC-V hypervisor specification, like several other RISC-V draft 
specifications, is taking longer to transition to the officially "frozen" 
stage than almost anyone in the RISC-V community would like.

Since we share this frustration, the next questions are: 

- What are the root causes of the problem?  

- What's the right forum to address the root causes?

To me, the root causes of the problems described in this thread aren't 
with the arch/riscv kernel maintenance guidelines, but rather with the 
RISC-V specification process itself.  And the right forum to address 
issues with the RISC-V specification process is with RISC-V International 
itself: the mailing lists, the participants, and the board of directors.  
Part of the challenge -- not simply with RISC-V, but with the Linux kernel 
or any other community -- is to ensure that incentives (and disincentives) 
are aligned with the appropriately responsible parts of the community.  
And when it comes to specification development, the right focus to align 
those incentives and disincentives is on RISC-V International.

The arch/riscv patch acceptance guidelines are simply intended to ensure 
that the definition of what is and isn't RISC-V remains clear and 
unambiguous.  Even though the guidelines can result in short-term pain, 
the intention is to promote long-term stability and sustainable 
maintainability - particularly since the specifications get baked into 
hardware.  We've observed that attempting to chase draft specifications 
can cause significant churn: for example, the history of the RISC-V vector 
specification illustrates how a draft extension can undergo major, 
unexpected revisions throughout its journey towards ratification.  One of 
our responsibilities as kernel developers is to minimize that churn - not 
simply for our own sanity, or for the usability of RISC-V, but to ensure 
that we remain members in good standing of the broader kernel community.  
Those of us who were around for the ARM32 and ARM SoC kernel accelerando 
absorbed strong lessons in maintainability, and I doubt anyone here is 
interested in re-learning those the hard way.

RVI states that the association is open to community participation.  The 
organizations that have joined RVI, I believe, have a strong stake in the 
health of the RISC-V ecosystem, just as the folks have here in this 
discussion.  If the goal really is to get quality specifications out the 
door faster, then let's focus the energy towards building consensus 
towards improving the process at RISC-V International.  If that's 
possible, the benefits won't only accrue to Linux developers, but to the 
entire RISC-V hardware and software development community at large.  If 
nothing else, it will be an interesting test of whether RISC-V 
International can take action to address these concerns and balance them 
with those of other stakeholders in the process.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
