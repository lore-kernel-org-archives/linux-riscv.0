Return-Path: <SRS0=lw90=JS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00F8C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Apr 2021 04:08:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A3846140A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Apr 2021 04:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A3846140A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bUIh6Sds/hSYU2sMQmMijpdGt0a2xrcZ0LeSxsBiu/U=; b=Y5iYBv5fbuJNWHUtUkCZTblT8
	zHe9ooD0ICsrawOy47yEDK3eYLC0LD7i2wXr+M+CjKlic8mJMfb6BgsmJQu+tq3uLsgqKbdL8NgA6
	IL8pI40rwUV/8xHMMB8Itih+CQbtJjo6/EV4qAxxg211Z3oMWtrTAnLjNIPK3HCggOm46J8imvC44
	GrgdLd5ylTs+XcWh1DYQoI5cLOB67oE5Wx4lJreTma3YBjQYQAMOQfUxQpg5Ruw/r5Rfc3UHBr/O3
	WFdLFzeTe7iQhga2B0cBH/eEJlV/FrP8TGpg7KODndkhGl8Zi6qTtN7XdD1aW45/lrMBvBNEW8/sl
	mHSW4I5ZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ4A3-00DbMi-SM; Wed, 21 Apr 2021 04:08:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ4A0-00DbMR-K2
 for linux-riscv@desiato.infradead.org; Wed, 21 Apr 2021 04:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WaZO4G68UBU3vGgoF4QvbcfZTEDhOHGYS1PfQvi2NPo=; b=EXuZAnVp+2EUKd9qOsF6VJeEOD
 zy0nJ40LWR/Qvk3Z6yMQKsEYyClwZVx42+X1efkpK/HFeKpt1MjBYlZHpZpHz1kBvnJy1XMPSJEvc
 taRVRb88LxHBdSPIeKQXSNIdgmIySS7NZ1VPl3oIaK+pvfJYmViOiaT8suiOcBlRxXQF1YDbJozsR
 wuG7Udq+X09n3kYTa2H0qQXVY4QYfw8iMWa1JEA/RkT0mTYLS8O0UXmfRSK5vEjmoHt8VLexiG3c1
 dS/9MgW1AfRXCVXp8Ok4fFpQMY2pcJlBojQPLINHWzh8QhlQ+C6ul/wh8p8VxnyNnJKDhN1M4QMx3
 sRstI3zg==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ49u-00CZxc-PY
 for linux-riscv@lists.infradead.org; Wed, 21 Apr 2021 04:08:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id c15so30878113wro.13
 for <linux-riscv@lists.infradead.org>; Tue, 20 Apr 2021 21:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WaZO4G68UBU3vGgoF4QvbcfZTEDhOHGYS1PfQvi2NPo=;
 b=hH2Ior+J2Jj3gNXUDRQb2B5cZpo1VHS6g+VxjUN7R8OhdUl9fhcQUHHeg/UwbHPYkt
 dvGPFGGvtpzm8il69fqV/k0anKDrs22fD/uFqXYj0ug4Y+1RH4uNXWw4BUEMLlpXILc2
 Jx6VXSLIDhRyISk0eDiw/aZmSEU/hILFVJSJGngSlOVAe7pLyUlzfdScUA7dR9xmikir
 52k0XdSlSqtToZK98+AX7uP+/v58m4aOzTRqPceiJ5HDk6BuqTrDTiuQiVVNQK1ZyS+j
 ok3BfOLol+LEdd2mebvVJo/83uUq7QtERwHcfiTs0dQVkxVyz7NtJ9AEF8iR0m2daEqw
 JRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WaZO4G68UBU3vGgoF4QvbcfZTEDhOHGYS1PfQvi2NPo=;
 b=lbbGdEDIifSlbw30U0waHcPrGaq04K/jwmqGXlVDbkf61FU+Z5/wfZLkeSr+H4jiRl
 O4Z7ZOkRn43pehM/ZW3u7xsN7el8OBNbjRIZXCSJrGjyn5PoqIgj+2sZIUax0cE4TX5z
 HpmB/+ooZHyLV2Vm9X/eKSeyNdjDBmXxXFAH5ei58GGhlrh7rTHMguvJLe1XGUxzTTAj
 wzMzOV+j0+/i9ktvg7QZe5OK0xpVBQIKbpNtDhNONH4LIfLhdN5SPhqrRkVv8AxlNi83
 LO4hi02UeHdrzkL3Q98lwbat8lkqNP5WeWN5IA9sCeu+/XxVYeEkFlXBHGc06rSpGJk5
 cXnA==
X-Gm-Message-State: AOAM531FFZvFSK9t5IUCqVHYg9IIRVJqEIWYg/y3h5dlk1kWhbJeehBU
 9Cg38GmQjbuh/lcegT3Z2VIwSZGjEqT6RJmWbdz9QA==
X-Google-Smtp-Source: ABdhPJy1qAwhycXgUCLM7eQQ0TAd+o7Pc7JTlOn+Av52SdM9p6+E9B1lX0Eh9/lh6HEocIJMfofebUvw4PhdiBPt1NU=
X-Received: by 2002:adf:ce12:: with SMTP id p18mr24500366wrn.144.1618978092690; 
 Tue, 20 Apr 2021 21:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <a49a7142-104e-fdaa-4a6a-619505695229@redhat.com>
 <mhng-d64da1be-bacd-4885-aaf2-fea3c763418c@palmerdabbelt-glaptop>
In-Reply-To: <mhng-d64da1be-bacd-4885-aaf2-fea3c763418c@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 21 Apr 2021 09:38:01 +0530
Message-ID: <CAAhSdy1EYhgA52m48DcyevM5j5EsuXPbVq5Z0KHB+SaXorNTeg@mail.gmail.com>
Subject: Re: [PATCH v16 00/17] KVM RISC-V Support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anup Patel <Anup.Patel@wdc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Graf <graf@amazon.com>, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_210814_903238_ED349855 
X-CRM114-Status: GOOD (  61.07  )
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

Hi Palmer,

On Sat, Apr 10, 2021 at 12:28 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 31 Mar 2021 02:21:58 PDT (-0700), pbonzini@redhat.com wrote:
> > On 30/03/21 07:48, Anup Patel wrote:
> >>
> >> It seems Andrew does not want to freeze H-extension until we have virtualization
> >> aware interrupt controller (such as RISC-V AIA specification) and IOMMU. Lot
> >> of us feel that these things can be done independently because RISC-V
> >> H-extension already has provisions for external interrupt controller with
> >> virtualization support.
>
> Sorry to hear that.  It's really gotten to a point where I'm just
> embarrassed with how the RISC-V foundation is being run -- not sure if
> these other ones bled into Linux land, but this is the third ISA
> extension that's blown up over the last few weeks.  We had a lot of
> discussion about this on the binutils/GCC side of things and I've
> managed to convince myself that coupling the software stack to the
> specification process isn't viable -- we made that decision under the
> assumption that specifications would actually progress through the
> process, but in practice that's just not happening.
>
> My goal with the RISC-V stuff has always been getting us to a place
> where we have real shipping products running a software stack that is as
> close as possible to the upstream codebases.  I see that as the only way
> to get the software stack to a point where it can be sustainably
> maintained.  The "only frozen extensions" policy was meant to help this
> by steering vendors towards a common base we could support, but in
> practice it's just not working out.  The specification process is just
> so unreliable that in practice everything that gets built ends up
> relying on some non-standard behavior: whether it's a draft extension,
> some vendor-specific extension, or just some implementation quirks.
> There's always going to be some degree of that going on, but over the
> last year or so we've just stopped progressing.
>
> My worry with accepting the draft extensions is that we have no
> guarantee of compatibility between various drafts, which makes
> supporting multiple versions much more difficult.  I've always really
> only been worried about supporting what gets implemented in a chip I can
> actually run code on, as I can at least guarantee that doesn't change.
> In practice that really has nothing to do with the specification freeze:
> even ratified specifications change in ways that break compatibility so
> we need to support multiple versions anyway.  That's why we've got
> things like the K210 support (which doesn't quite follow the ratified
> specs) and are going to take the errata stuff.  I hadn't been all that
> worried about the H support because there was a plan to get is to
> hardware, but with the change I'm not really sure how that's going to
> happen.
>
> > Yes, frankly that's pretty ridiculous as it's perfectly possible to
> > emulate the interrupt controller in software (and an IOMMU is not needed
> > at all if you are okay with emulated or paravirtualized devices---which
> > is almost always the case except for partitioning hypervisors).
>
> There's certainly some risk to freezing the H extension before we have
> all flavors of systems up and running.  I spent a lot of time arguing
> that case years ago before we started telling people that the H
> extension just needed implementation, but that's not the decision we
> made.  I don't really do RISC-V foundation stuff any more so I don't
> know why this changed, but it's just too late.  It would be wonderful to
> have an implementation of everything we need to build out one of these
> complex systems, but I just just don't see how the current plan gets
> there: that's a huge amount of work and I don't see why anyone would
> commit to that when they can't count on it being supported when it's
> released.
>
> There are clearly some systems that can be built with this as it stands.
> They're not going to satisfy every use case, but at least we'll get
> people to start seriously using the spec.  That's the only way I can see
> to move forward with this.  It's pretty clear that sitting around and
> waiting doesn't work, we've tried that.
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

Can you send the patch for the updated policy which we can review ??

Will it be possible to get KVM RISC-V merged for Linux-5.13 ?

Regards,
Anup

>
> I know it might seem odd to complain about how slowly things are going
> and then throw up another roadblock, but I really do think this is a
> very important thing to get right.  I'm just not sure how we're going to
> get anywhere with RISC-V without someone providing stability, so I want
> to make sure that whatever we do here can be done reliably.  If we don't
> I'm worried the vendors are just going to go off and do their own
> software stacks, which will make getting everyone back on the same page
> very difficult.
>
> > Either way, the best way to do it would be like this:
> >
> > 1) you apply patch 1 in a topic branch
> >
> > 2) you merge the topic branch in the risc-v tree
> >
> > 3) Anup merges the topic branch too and sends me a pull request.
> >
> > Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
