Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B47DC4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 18:25:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A6B610A8
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 18:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4A6B610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXrFRCRp5O8GJykz7BUfWfVlD/wIdMQ0GOHT+wwwqmg=; b=gHiWDKmrA0Htft8t/Z9xn3WbwB
	B3whjs1aOqBODHdp+vdaIg9rWJwuieZd4rIII7rypwMR+RBePD65dgKAZ4Iggmw9Y9tonvwpd1pPo
	Iv8TLx2LkPN4BQk4fF/LgqDB1kHCal1Vb9JKoJOxBO6ixHDqeD2vMeLatyYzFCrKF85YRYcwdWTEs
	3rYpTVd2tHljcQSFIqonTvSr12VvWA7BeszzmoEC01HlPusplok/6R2BGWVxV+gKaas03GCdbjjP8
	7i4OjNGWjbWc9A+7wKQVDw95VTnIlnV0Ytx3KgKxL92UCgMucMyqjKpMK93g+fVGKOaneFY+MAkcI
	oDm/dgiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk9q0-000i9L-R5; Fri, 21 May 2021 18:25:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk9px-000i8L-LM; Fri, 21 May 2021 18:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=A1KexQJIl+NcWtzXQYTnarD5JIhLsBmwYOKEN7vsfIw=; b=RxenEt7k5I5xBj63CvbsozgNLh
 7snGVGeHDFb2M/FXGJQSgyByncubGyqS/lfm57WNwV4BnKicKASLD26jRcnDeT19trjyDjLacTpjs
 aW3ef0rqlMbop3hjS9Uaov+gFxl0KVEEtsR2WbbOT7fXZbYNWXbbJc2ecnTppFdyiQOCW0jTayi9+
 0mCiJTag56eVOzQzU6M7Xl7+qTGKQyuuWXU7sJ7ujsmfVYc/nlwkvBujpRtX4KpXn8Hn8Ae3YOY4i
 uhFnVutjbCeTDQZR+t8mX1hjYom9letL0tim8qDKkI7/jCxPoFEL5TDb86z8V8Shlsx/U071cAT2O
 AI7LAPMA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk9pu-00HLv4-TJ; Fri, 21 May 2021 18:25:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3049613E2;
 Fri, 21 May 2021 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621621526;
 bh=9AcZJfeo0xf1euRFblZG0MfqbBmLwbiLEIEackPiTqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0LBTP5aGzuiN5qYxA5cNt6W4SscUFYtUHumwamPn5Ztt1ht4YhL0u1ltJnjB1YUcx
 Omlw2tyXOaYoH+f7UwfsC2EQ2dUPcDcVkYUFJ3KfXUxzFp9WptKLX3fXamJ5dkGMuK
 +5FhSMdxVEDIsBv/267cHa1UzuZg2WeNhKH75vKI=
Date: Fri, 21 May 2021 20:25:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: pbonzini@redhat.com, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 corbet@lwn.net, graf@amazon.com, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <YKf7E4YfLrcfgCoi@kroah.com>
References: <YKfyR5jUu3HMvYg5@kroah.com>
 <mhng-122345f7-47d9-4509-8ae6-ce1da912fc00@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-122345f7-47d9-4509-8ae6-ce1da912fc00@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_112526_987083_468CA233 
X-CRM114-Status: GOOD (  30.37  )
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

On Fri, May 21, 2021 at 11:08:15AM -0700, Palmer Dabbelt wrote:
> On Fri, 21 May 2021 10:47:51 PDT (-0700), Greg KH wrote:
> > On Fri, May 21, 2021 at 07:21:12PM +0200, Paolo Bonzini wrote:
> > > On 21/05/21 19:13, Palmer Dabbelt wrote:
> > > > >
> > > >
> > > > I don't view this code as being in a state where it can be
> > > > maintained, at least to the standards we generally set within the
> > > > kernel.  The ISA extension in question is still subject to change, it
> > > > says so right at the top of the H extension <https://github.com/riscv/riscv-isa-manual/blob/master/src/hypervisor.tex#L4>
> > > >
> > > >   {\bf Warning! This draft specification may change before being
> > > > accepted as standard by the RISC-V Foundation.}
> > > 
> > > To give a complete picture, the last three relevant changes have been in
> > > August 2019, November 2019 and May 2020.  It seems pretty frozen to me.
> > > 
> > > In any case, I think it's clear from the experience with Android that
> > > the acceptance policy cannot succeed.  The only thing that such a policy
> > > guarantees, is that vendors will use more out-of-tree code.  Keeping a
> > > fully-developed feature out-of-tree for years is not how Linux is run.
> > > 
> > > > I'm not sure where exactly the line for real hardware is, but for
> > > > something like this it would at least involve some chip that is
> > > > widely availiable and needs the H extension to be useful
> > > 
> > > Anup said that "quite a few people have already implemented RISC-V
> > > H-extension in hardware as well and KVM RISC-V works on real HW as well".
> > > Those people would benefit from having KVM in the Linus tree.
> > 
> > Great, but is this really true?  If so, what hardware has this?  I have
> > a new RISC-V device right here next to me, what would I need to do to
> > see if this is supported in it or not?
> 
> You can probe the misa register, it should have the H bit set if it supports
> the H extension.

To let everyone know, based on our private chat we had off-list, no, the
device I have does not support this extension, so unless someone can
point me at real hardware, I don't think this code needs to be
considered for merging anywhere just yet.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
