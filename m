Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C41EC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 13:58:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03D026100C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 13:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03D026100C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iddXpuhAV/sIrS6Qu4DZGD86XcirfeIN/XhZjqQTduE=; b=Kos1g7rus1SGw67a2WJ2bNUqU
	hKN+DVx16iZsL9hK/hBR42PwL53LLLzZPQRuHw+Xc9+gxPl9oSgckNRSUrFoBtberWOgTeQnYkUen
	QtMG8PG9FuA+5YVIEQ2hnzM6D/omvqVMgAp/y2PdM/wievA+aguP4G1z+7kxU9ffwxqa221zqltgS
	Nu+gJW3GKEifB6A1myIBWUGlCn8UXzIx1HB+A1C7qjNNIFFWrFHcdUrkf4gZP3OxiZ0h1FQkRw/04
	qksKLsteU/4Lxrc4Q4HRXDBXHWoRF/cNFYT8V+johGtyhfFSJUkNH2tivhjiVIAVIJqjqsbae8Pjx
	Npj0omm8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljMiD-004CTl-AK; Wed, 19 May 2021 13:58:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljMiB-004CTN-27; Wed, 19 May 2021 13:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WSPEM2CUZzlI2+eWWDFsMiI9pAMz7JWex+E8GZ7XwdQ=; b=fErnb7F2+gvh6S32igG6MbW15r
 35gP8PJGpe8sFgITz/XM/R7vhAKA9LsSAcYTaWKr9AiCYnuRP0A9Uo+2URPwQ1r35K0Pofyt0zO9D
 ETcq5eW1ESOkZ7kpiwSKqeoIS75DiHaf4TCcMG4W7FznBNxc2mDSe/gqrpmm+OGiunvWPxRtVb5fT
 cPGLs5aWk7+m2vWkdxKQ//yKpzyBcN/3rg4m7YTTSb5UfVM20ELPwPMxV6dlUD1iWvtZtFGY2H/7f
 9KHyUXAdPOZzQmcK5+dhu+yPjnbGCj52Ln/NDEBJDuzUGyq7NP++6adAPnH9Hoah8VysX6U089Ja5
 ZhS5iVgw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljMi7-00FWHn-PH; Wed, 19 May 2021 13:58:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D15586100C;
 Wed, 19 May 2021 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621432687;
 bh=1VkCYNL0c12Ug0LXnzJjOzCC3hjW/+2zr3MkeEO+0n4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SMDZeq2XvmrcXuBcr7sl4S4JEZSUBlQkZcFB2xQViTrjZjhCIDg0/Ffa2IMKrgmaW
 m/b3eNYlCd3m8nvzOaEY5fyWv1IXGkJSq9tyd0ckJ/pn2qTlscaa8jermQrDLwn5Me
 3fsUl7684B5GSf9aWhkkog0Ibsh8fcFX3y4B1BgE=
Date: Wed, 19 May 2021 15:58:05 +0200
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
Message-ID: <YKUZbb6OK+UYAq+t@kroah.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
 <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
 <YKUDWgZVj82/KiKw@kroah.com>
 <daa30135-8757-8d33-a92e-8db4207168ff@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <daa30135-8757-8d33-a92e-8db4207168ff@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_065807_919385_6496BF67 
X-CRM114-Status: GOOD (  41.70  )
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

On Wed, May 19, 2021 at 03:29:24PM +0200, Paolo Bonzini wrote:
> On 19/05/21 14:23, Greg Kroah-Hartman wrote:
> > > - the code could be removed if there's no progress on either changing the
> > > RISC-V acceptance policy or ratifying the spec
> > 
> > I really do not understand the issue here, why can this just not be
> > merged normally?
> 
> Because the RISC-V people only want to merge code for "frozen" or "ratified"
> processor extensions, and the RISC-V foundation is dragging their feet in
> ratifying the hypervisor extension.
> 
> It's totally a self-inflicted pain on part of the RISC-V maintainers; see
> Documentation/riscv/patch-acceptance.rst:
> 
>   We'll only accept patches for new modules or extensions if the
>   specifications for those modules or extensions are listed as being
>   "Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
>   course, maintain their own Linux kernel trees that contain code for
>   any draft extensions that they wish.)
> 
> (Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/riscv/patch-acceptance.rst)

Lovely, and how is that going to work for code that lives outside of the
riscv "arch" layer?  Like all drivers?

And what exactly is "not ratified" that these patches take advantage of?
If there is hardware out there with these features, well, Linux needs to
run on it, so we need to support that.  No external committee rules
should be relevant here.

Now if this is for hardware that is not "real", then that's a different
story.  In that case, who cares, no one can use it, so why not take it?

So what exactly is this trying to "protect" Linux from?

> > All staging drivers need a TODO list that shows what needs to be done in
> > order to get it out of staging.  All I can tell so far is that the riscv
> > maintainers do not want to take this for "unknown reasons" so let's dump
> > it over here for now where we don't have to see it.
> > 
> > And that's not good for developers or users, so perhaps the riscv rules
> > are not very good?
> 
> I agree wholeheartedly.
> 
> I have heard contrasting opinions on conflict of interest where the
> employers of the maintainers benefit from slowing down the integration of
> code in Linus's tree.  I find these allegations believable, but even if that
> weren't the case, the policy is (to put it kindly) showing its limits.

Slowing down code merges is horrible, again, if there's hardware out
there, and someone sends code to support it, and wants to maintain it,
then we should not be rejecting it.

Otherwise we are not doing our job as an operating system kernel, our
role is to make hardware work.  We don't get to just ignore code because
we don't like the hardware (oh if only we could!), if a user wants to
use it, our role is to handle that.

> > > Of course there should have been a TODO file explaining the situation. But
> > > if you think this is not the right place, I totally understand; if my
> > > opinion had any weight in this, I would just place it in arch/riscv/kvm.
> > > 
> > > The RISC-V acceptance policy as is just doesn't work, and the fact that
> > > people are trying to work around it is proving it.  There are many ways to
> > > improve it:
> > 
> > What is this magical acceptance policy that is preventing working code
> > from being merged?  And why is it suddenly the rest of the kernel
> > developer's problems because of this?
> 
> It is my problem because I am trying to help Anup merging some perfectly
> good KVM code; when a new KVM port comes up, I coordinate merging the first
> arch/*/kvm bits with the arch/ maintainers and from that point on that
> directory becomes "mine" (or my submaintainers').

Agreed, but the riscv maintainers should not be forcing this "problem"
onto all of us, like it seems is starting to happen :(

Ok, so, Paul, Palmer, and Albert, what do we do here?  Why can't we take
working code like this into the kernel if someone is willing to support
and maintain it over time?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
