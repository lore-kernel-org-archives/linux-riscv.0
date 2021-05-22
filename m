Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E02C04FF3
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 03:06:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF29613D6
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 03:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF29613D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKff8qs+GmhD3TOPNmXoC7B1bQRLC3WZHsQSV5JYav8=; b=eTkjbejySRegZLY0nndUUahVC2
	c7nZsaf31A6kEeJKqYqbZTi70O/wYKeHukDAm+KtFLd3e0iw425py18Nge6tUPZq/vxBrq6Eih0XJ
	qJObUCQPnYWqpX++wPe6qQiLcu4Yn6KdoW0fZu0ZWnztrtMOO2CPbqOw/3bblNHp9KcTdiJXblX5Q
	yIdkZcKhVPy6hFOvT0auQqUjDtJF30nifoGN96UbhUItYlgeKHSStUYrtmzvlKLHPTH+AEc8+82yN
	SUoRGcDw8EKgkNegJUe+6KlwhKXOwRHfYrocfiJG6oC+mcq46FL3jZ79H9fgmDLvRzymWWAb9JfI4
	CgMO1wdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkHxr-001gce-Hj; Sat, 22 May 2021 03:06:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkHxp-001gcV-HX
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 03:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f0Zo8cm4stwzdU9UqoCMa2cZOAhsKZ2r8/0ZXW0PTgs=; b=Jmo2JmvckKBoXavcPik8h6Kzdj
 OUEQ/fWn5Id8jLb2I6Ia8ROCqWhds3z28aHVFg60mkhVk1rvueMWv5YLJYTm/PCS6JRd4m85Ay1tY
 yMZxfc7XGoRFWMjUAejZYRI2+XnKzoEsp23LwWymyrYWmhGZLQDbwSfiCDE1lrhVxMkZN4aRRcVQX
 IQnmYD6MMqPsunYo5/ro6CQAt2iF8fz8bnR55o4TXkTapgN+BR/bn3VgFW46dajBk8MeZnaJDqQlk
 PW/O/MBJVCiZERdGq9Nb2V9bUz2kNZvv+PrnvBahehxpQGVUKZM0sfh6PAXCLc5jIBjnFhKO8lNQu
 fA4+eDtg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkHxm-00HXmc-97
 for linux-riscv@lists.infradead.org; Sat, 22 May 2021 03:06:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id u133so12067047wmg.1
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 20:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f0Zo8cm4stwzdU9UqoCMa2cZOAhsKZ2r8/0ZXW0PTgs=;
 b=MeAtjn6tA7yUDONHuRGrU5sOT0MVy0eTdxIdMY54c49wRl5dvnmJzfewtEJJWXq8kE
 RMgkP1j4fvtLv4dZpzTjV6KAbrXG6cAYtXbUrnYVxYgH9jx88pxrupYAhvkbtUOkOE0T
 VuZuFJhUQRC8PuwsPYQi6OY26SKYPZAkl6FaYmdAiuPj1P7vs03QncPfOXMYgS1mYDxR
 FFvUQIKwdhU/JhxOb8cmaC4FXCDdKtYa5bQ318q+SLKCy92kA/Rp0/wI/l+KpxFxjLA3
 PsRKF63i22BQb6pgKgZyb/3eNuM2YTlm4woyd+hZcvAfj4eBsxqzakeY8s2XtXAoW1vM
 8vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f0Zo8cm4stwzdU9UqoCMa2cZOAhsKZ2r8/0ZXW0PTgs=;
 b=dEvt9b4NHrGS2KzzasQ55Sa811AwNdYmKMQTw/w7xSsOhrvR1f39gIHUTwuFH7ON1M
 09j5DPH5tO8b6fOwsQtEVtW6i6quW2tg+PK7OP2eZJrt1GzzMujNOfSyZa/z2d9OdXbf
 YhyCMWMpA5P4BJkrIU5iJH4je8mM8glgSqgUrCX8E2dSZoXSOvy+sC6mbkyL8Mo/2wC1
 2tky5mcbErr/Uw2XNkaG6qK7ttOK3CSi8IObkTi2PX9n8CgjabAu83SveNqk4XwPHdYz
 GdsyjFbkvLWwHq06nOWSmrqrYkH8NJe1AhdxkrG9vFDZYbunwoNN65eSvJAjeiSmWjjJ
 da8A==
X-Gm-Message-State: AOAM532RXI5ojaOBmKpRlO7kv/9ajRG1NU5w1/BLO/lfvHcmWiIC+0IM
 r3HjoKYCiHTqxUEaWLXkVtOjna0/fnVXrX6gsK8zjySgiMiT97YY
X-Google-Smtp-Source: ABdhPJypufT92hg2OijZZWiwsPkAyDaYLoNr27GhAzYR36ckLjbs6l3QrJwSLhlZzu5A1koVAAw03hubzpBeHO78l10=
X-Received: by 2002:a1c:4e0b:: with SMTP id g11mr11079031wmh.3.1621652762054; 
 Fri, 21 May 2021 20:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
In-Reply-To: <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 22 May 2021 08:35:49 +0530
Message-ID: <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
Subject: Re: arch/riscv/staging
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Anup Patel <Anup.Patel@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_200606_403918_C7929D4F 
X-CRM114-Status: GOOD (  36.85  )
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

+GregKH

On Fri, May 21, 2021 at 10:53 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Hi Damien,
>
> Thanks for the thoughtful and considered E-mail.  I know you addressed
> this to Palmer, but maybe you'd be willing to discuss this a little bit
> with me?
>
> On Fri, 21 May 2021, Damien Le Moal wrote:
>
> > For the hypervisor extension and KVM support, the specifications are now very
> > stable and while changes due to the advanced interrupt controller specs work,
> > among other, are still possible, the changes will likely be small and should not
> > cause much headache in the kernel.
>
> This is the part that I don't quite understand.  If everyone -- including
> the architecture folks working on the ISA extension at riscv.org -- agrees
> that the H extension isn't going to change significantly, why don't they
> freeze the extension?  Could it be that the RVI folks are worried that
> they may need to make significant changes, and that's why they haven't
> frozen it yet?

I have been involved in the H-extension spec development for the past
few years working with RISC-V ISA architects (Andrew and John.) I am also
involved in the RISC-V AIA specification as chair. I confirm that all required
provisions are already there in the RISC-V H-extension to support an
external interrupt controller with virtualization acceleration (such as
RISC-V AIA).

In fact, Paolo (with his years of experience in KVM virtualization) also
confirmed that current H-extension have all required features.

Clearly, significant changes are very very unlikely.

>
> > Given that there is already HW (and QEMU) supporting H extension, we
> > really need to move forward with merging riscv KVM support.
>
> This is maybe a side question, but: has someone actually put the H
> extension into silicon?  My understanding so far is that it's only been
> implemented into an experimental FPGA soft-core so far.
>
> > That will reduce the risk of seeing forks pop out here and there and
> > greatly facilitate Paolo and Anup work.
>
> When you write about forks, are you worried about architecture forks,
> forks of Anup's patchset, or some other kind of fork here?
>
> I ask because in the past, it sounds like there's been some concern from
> WDC that someone else will come along and submit an alternative RISC-V KVM
> patch set that we'd somehow prefer over Anup's.  That's pretty
> unlikely; I think everyone involved -- certainly including Palmer and I --
> know that you guys have done the foundational work here, and you guys
> would certainly have clear precedence here, unless there turned out to be
> something wrong with the WDC patchset that you all wouldn't be willing to
> fix.  But maybe I'm misunderstanding your concern?

This is certainly your misunderstanding. Like Paolo mentioned in other
thread, the current KVM RISC-V is in good shape and as-per expectations
of the KVM core maintainer.

>
> > For this, I propose that we create arch/riscv/staging as a temporary location
> > for on-going work for supporting ISA extensions that are being drafted but not
> > yet frozen. That will allow the community to share a common code base for the
> > support code, and also allow more eyes to look at the extension themselves.
> > This way we can both facilitate and accelerate riscv ecosystem development while
> > also speeding up the specification work by providing constant feedback.
>
> If the goal is to create a common code base for testing and discussing
> draft extensions, we'd be happy to maintain another branch or another
> k.org tree to hold these.

Having a staging branch or separate tree does not work for KVM RISC-V
because we have lot's of user-space tools (QEMU, KVMTOOL, etc) which
expect the KVM UAPI header to be available in the upstream kernel. These
user-space tools will not accept patches until the KVM UAPI header is available
in the upstream kernel. Same thing was mentioned by Paolo in other thread.

>
> But in terms of the suggestion to create arch/riscv/staging, I think
> that's just going to create the same problems that the RISC-V patch
> acceptance guidelines were intended to solve.  To put it differently, from
> my point of view, it's a feature, not a bug, that we don't send code for
> discussion drafts of ISA changes upstream to Linus.   But maybe I'm
> misunderstanding what you're looking for ?

For KVM RISC-V, the arch/riscv/staging directory is a perfect solution
because:
1) The KVM RISC-V UAPI is header is indeed based on the latest
ratified RISC-V privilege spec v1.11 hence the KVM RISC-V UAPI
header complies with current RISC-V patch acceptance policy.
2) All usage of RISC-V H-extension is contained within the KVM RISC-V
sources only. Rest of the Linux RISC-V kernel does not use H-extension
at all.

The current RISC-V patch acceptance policy should make an exception
for draft extensions where the UAPI headers are based on ratified
RISC-V specs and sources for such draft extension should be placed
in arch/riscv/staging directory.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
