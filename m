Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE73C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 12:24:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F01C60FE8
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 12:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F01C60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=paXEF+LufQWCKLaLaZLHDR1zaLVkZID4TV4FkFzGMGg=; b=AtUw0p0CWA7iVHfp/uhqUijU2
	G3DfbnACg5k3VAJamEQ8jtRHDau2WpL74DB37dGmLBjS439rndG0HnSGfIhFKWceLuLt9wcNYWbgJ
	bmsSJmInsEs6EWGvkkAm09zfFoo446N/68rze6SyjNyk2gpt11TPtSCGp8H6/7I6/h3XM4s6VY52A
	dZVwVTYjeYj23BOa/HHLHuez0TevIsOwkOKlxFNdr91HMzX3smt4upgHLcrkenV4h+uT3FWy7Baam
	GRMQprTVG6rudR8rnfGXGxeUseZdpTR1zAGIGAy2BHrLbZQ2rFjQg9wZ2F/dyLwF6MewjUDc4qhuV
	8La7kAj2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljLF4-003taH-KZ; Wed, 19 May 2021 12:24:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljLF1-003tYI-VW; Wed, 19 May 2021 12:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+DshfRX8lD+m6GSXKaHgsCIw1taojrsfKqZ8C+DV3Y8=; b=Y7R+xudktBxmDsLXPs0oePjbOf
 F4iiqsGq4pM6A9jl601m8ySzd9RTE6aAuC9OFbwIgDXnQ3hvtrrOM9t3uYemLfyLoRXFllIZ/nKWb
 y+x5arTCewAWJSkwosG6GTr46uYdQFFkrROgXt10DMGwVlE89Mtbn3wUvXk3KEvSxXrB2Iqpp2xXy
 P46sVgcY8DHhuhid0QI4ek5guKjMu+QhgO8uE1qZzNsdnFJtyfiVVMpFSlMnqJhTL0dOfMAPEYl41
 VrVZExTs/2g/v/j2C3/wsY7+Am16wkkMmAk8OT4rXKxIbSqHoS8NbJsUrnfD0+Hh5uLkgE4vAvW6G
 nGQoyE0A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljLEz-00FRvs-4S; Wed, 19 May 2021 12:23:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0886860FE8;
 Wed, 19 May 2021 12:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621427036;
 bh=qf5m2Nia+4DoUNrww0bmk5cQtJEm5cWAINMR8yRdz/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YfCZvauDRbYUmSAlgtaMrkiKYI1UYEyinYzXVIPR7xRh1CtNh0+9OVD9OrNltg37F
 ahwtG1OzCfm+TPgAP2KCQ/seEJB4ce2EP9qVSocsEdEVaEDy5NMlr35rgUFUsut7E7
 UvuvRtU/TJAcTlN9lW3pCF7Im0grQPZmNY7SFmII=
Date: Wed, 19 May 2021 14:23:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-doc@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <YKUDWgZVj82/KiKw@kroah.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
 <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_052357_264779_DA2BF444 
X-CRM114-Status: GOOD (  30.54  )
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

On Wed, May 19, 2021 at 01:18:44PM +0200, Paolo Bonzini wrote:
> On 19/05/21 12:47, Greg Kroah-Hartman wrote:
> > > It is not a dumping ground for stuff that arch maintainers can not seem
> > > to agree on, and it is not a place where you can just randomly play
> > > around with user/kernel apis with no consequences.
> > > 
> > > So no, sorry, not going to take this code at all.
> > 
> > And to be a bit more clear about this, having other subsystem
> > maintainers drop their unwanted code on this subsystem,_without_  even
> > asking me first is just not very nice. All of a sudden I am now > responsible for this stuff, without me even being asked about it.
> > Should I start throwing random drivers into the kvm subsystem for them
> > to maintain because I don't want to?:)
> 
> (I did see the smiley), I'm on board with throwing random drivers in
> arch/riscv. :)
> 
> The situation here didn't seem very far from what process/2.Process.rst says
> about staging:
> 
> - "a way to keep track of drivers that aren't up to standards", though in
> this case the issue is not coding standards or quality---the code is very
> good---and which people "may want to use"

Exactly, this is different.  And it's not self-contained, which is
another requirement for staging code that we have learned to enforce
over the years (makes it easier to rip out if no one is willing to
maintain it.)

> - the code could be removed if there's no progress on either changing the
> RISC-V acceptance policy or ratifying the spec

I really do not understand the issue here, why can this just not be
merged normally?

Is the code somehow not ok?  Is it relying on hardware in ways that
breaks other users?  Does it cause problems for different users?  Is it
a user api that you don't like or think is the "proper" one?

All staging drivers need a TODO list that shows what needs to be done in
order to get it out of staging.  All I can tell so far is that the riscv
maintainers do not want to take this for "unknown reasons" so let's dump
it over here for now where we don't have to see it.

And that's not good for developers or users, so perhaps the riscv rules
are not very good?

> Of course there should have been a TODO file explaining the situation. But
> if you think this is not the right place, I totally understand; if my
> opinion had any weight in this, I would just place it in arch/riscv/kvm.
> 
> The RISC-V acceptance policy as is just doesn't work, and the fact that
> people are trying to work around it is proving it.  There are many ways to
> improve it:

What is this magical acceptance policy that is preventing working code
from being merged?  And why is it suddenly the rest of the kernel
developer's problems because of this?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
