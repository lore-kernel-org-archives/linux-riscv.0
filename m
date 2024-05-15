Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC99C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 18:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjRASExNSlSBLM1Sjb8/7cxEJrH7Np+eiNWVB3ehblg=; b=CKauA+0jiQPz7O
	8KN3uO8YfGhg/s/oqsAunyQo9ryCy9zhrCTQOeVHoYhThfnSVrZPCc4FjwAbH1dui8stngZZgQiKR
	gOBPnzc2qQp6q14hz2osl8GW/CDEIAPAELiUiVeQLZZ/iCswn644KWgReqB8U+UPpB/BR4W9BkEP5
	FLJxwYe1D93dyR5lFMeLsebFZ52HfKHUhqKjEJvQkJorirBlf3JNxgI7ZWxUb3UvhrE2i1GJuWsNb
	jvL7si2UgUy4Td0wTgyDvAjyWjZdVecTPVgpK6wk3RDMVLAQnfnjXCKj632/LDOzML0HMWdiP12FP
	QuTrDnLCxvohFRKVDvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7JFm-00000002XEb-44Yu;
	Wed, 15 May 2024 18:21:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7JFj-00000002XDk-2xB9
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 18:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 01912CE1394;
	Wed, 15 May 2024 18:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87CBC116B1;
	Wed, 15 May 2024 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715797281;
	bh=iHD0UyuivF0i6K1yPM2fcXtvuDCZkUObbv4SHRUgfxM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=H/Tanh7zlVXO/XkPU5wjs/TcpDqzgSFP5zgAknY2/lMMXC1wJulIoJAfPCp3Y9dFd
	 WawIgKFkdMU9xeYwb8KumloKYo/NJ4riorfx6iU4BERfGi6YBnLGTgZDuYA6/+vnB0
	 tYjwtu0MQSPCE/QU4sCPKZtFV9A5wrj7AlFEXvMOO7RhnqO/upXdEdrnfvgxbAG2zs
	 gWBHVuh8EprYAO15PLmq4dIxmO8rfq7r4EtYuGo06k8ywEX0pUd2Ven5bxGN20minr
	 e8w1wkFvhByaQTOzH+I/mYdz2s0NlgqcQYHq1mj+uZPeP0xc5RKrRndHdtBqX6ufDW
	 KBocOPT/K/OEg==
Date: Wed, 15 May 2024 19:21:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: fix Andes errata build issues
User-Agent: K-9 Mail for Android
In-Reply-To: <ZkT1K/c9hWsfOwWf@ghost>
References: <20240515-comic-sketch-3b40e6676f55@spud> <ZkTnlEnoFFrQdXi2@ghost> <20240515-slander-stranger-683758537aee@spud> <ZkTuc4fxXcS/g7hC@ghost> <20240515-bootie-patriarch-769c0ebff4b1@spud> <ZkT1K/c9hWsfOwWf@ghost>
Message-ID: <39FEF902-2495-42A2-B279-C9FC95828F00@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_112124_321527_3D4F048D 
X-CRM114-Status: GOOD (  37.52  )
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



On 15 May 2024 18:47:23 IST, Charlie Jenkins <charlie@rivosinc.com> wrote:
>On Wed, May 15, 2024 at 06:30:36PM +0100, Conor Dooley wrote:
>> On Wed, May 15, 2024 at 10:18:43AM -0700, Charlie Jenkins wrote:
>> > On Wed, May 15, 2024 at 05:56:30PM +0100, Conor Dooley wrote:
>> > > On Wed, May 15, 2024 at 09:49:24AM -0700, Charlie Jenkins wrote:
>> > > > On Wed, May 15, 2024 at 05:09:34PM +0100, Conor Dooley wrote:
>> > > > > From: Conor Dooley <conor.dooley@microchip.com>
>> > > > > 
>> > > > > Commit e47c37c24024 ("riscv: Introduce vendor variants of extension
>> > > > > helpers") added includes for the new vendor_extensions.h header in
>> > > > > the T-Head and SiFive errata handling code but didn't do so for Andes,
>> > > > > resulting in allmodconfig build issues when commit 589e2fc85850
>> > > > > ("riscv: Convert xandespmu to use the vendor extension framework")
>> > > > > added a user of a macro defined there.
>> > > > > 
>> > > > > Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor extension framework")
>> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> > > 
>> > > > 
>> > > > I was going to fix this in my next version but was waiting for the
>> > > > reviews on the thead stuff. I wasn't anticipating these patches to be
>> > > > able to jump the queue :)
>> > > 
>> > > Yah, the reason for that is I asked him to take the non-vector parts of
>> > > the series as 6.10 material so that we'd have less stuff movin' around
>> > > in cpufeatures.c so that Clement's Zc* + validation changes wouldn't run
>> > > into a bunch of conflicts etc. Same reason that I pushed for getting
>> > > Andy's vector subset stuff merged today, but that mighta been before you
>> > > hopped in.
>> > > 
>> > > Cheers,
>> > > Conor.
>> > 
>> > Yes I was a couple minutes late to the meeting, whoops.
>> 
>> 
>> It's prob at like 0600 for you, so w/e.
>> 
>> > The subset of
>> > patches that was pulled into for-next is odd to me because there is some
>> > of the thead enablement code as part of the vendor extension enablement
>> > so that there was a user for it. Since the subset on Palmer's for-next
>> > does not have the rest of the thead code there is only a
>> > half-implementation of the thead code, it allows the kernel to probe for
>> > xtheadvector but it doesn't probe anywhere.
>> 
>> I dunno, I think that reporting that the extension is there constitutes a
>> user, it's not gonna be dead code. There's plenty of extensions for
>> which all we do is detect them and nothing more.
>> 
>> > In my opinion, a better solution would be for me to get rid of the thead
>> > code entirely from those patches. So that there is still a user, I can
>> > replace the thead code with the andes versions.
>> 
>> The Andes stuff is in the subset he applied though, so...
>> > 
>> > Since Palmer already pulled in those changes maybe it's too late. There
>> > is not a critical problem here, but it seems like it's bad practice to
>> > introduce code without a user.
>> 
>> ...there is actually a "real" user in xandespmu. I did miss that
>
>I meant there is no user of the xtheadvector addition.
>
>> "riscv: Extend cpufeature.c to detect vendor extensions" actually
>> contained the xtheadvector detection though, rather than just the
>> infrastructure. I think it is probably harmless to have it, but
>> shouldn't be too hard to quickly drop the thead bits either I suppose
>> if you're worried about it.
>
>And the adding vlenb to the DT patches is unrelated to the subset of the
>series that was pulled into Palmer's for-next so spinning that off into
>a different series would be more logical. This is kind of a pointless
>rabbit hole I am getting into, but when we start splitting up series
>the code contained in the patches start to diverge from the cover
>letters that end up in the merge commits.

 The vlenb stuff is also one of the things that I want, it's useful for the validation stuff that Clement is adding.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
