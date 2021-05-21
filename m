Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E416C4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 17:50:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEADF613CB
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 17:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEADF613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6c+cyesPFaTrOIxQ5MbUO7RgHmIyv6zb1AjeZ6LDQM=; b=Oia8STMTaPwQphMyw5cPvO6iNw
	WgCoo7NCIJ/6dbv4s2FDDles4YOaShOjNGvRst5Ywy2FUtoPuaL8D7RYttuL+2hu19ekz2DLlBGOj
	Aknm59h0UeLGsPIWhbgqVGdUoE7u1KMGdBZz7alNym+o/3IWJPHi9wPZjnfh3en1RtPTjaQShVU4i
	8RUJrgDL1ZFcI/UAVD2uvPqJea5Q49LKmiKRxucdmF14AxpqdXkNmg2CqSrI/UCOFVCz0X+shUBWS
	b3LcNy92XbyqUaOL/1ioUKj1tSS7O2EZTSTRAKm21OXrKGmUFvPK3o8WOWWcZAMaH7MoF6Bj95xS8
	VdFiJWhQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk9HW-000bY2-1S; Fri, 21 May 2021 17:49:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk9Fe-000anU-7V; Fri, 21 May 2021 17:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zeO15+6GAcuD7C6oautXKgZf1a/SrLIvHdVZPr/OU7c=; b=gcxRK1Q89iczd21+O9ESNJh00i
 gTp06uQ4PxazkeGey9dih7Mx+HrGoh8RUJU8wPY6fzgkQUw0QiVjYtqyI49V/o4XNeRuavUYzphRG
 OkwGSxAovVjM3cFCifq4j/hlm6MxzpBpv0/Aylq9BH2SIKndtaU6BmYcvK3fQDPJjxfZ+m+0ZlqNy
 RERMh2WTjf5VrjD9D2qv+r8+aaCQgD0SFLhvm3EXc7853JdSkyVkGtLtW5jeQE1XerAqQ7lbPVG4Q
 YHuqR/mYftgJj6v0rmdRuPcvDnQFMfknbJQJvs8eFtQUgPVfUDXaEps2ZFjYMlUNe7vcn9GY6RZyu
 AAMhpnlQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk9Fb-00HKLQ-82; Fri, 21 May 2021 17:47:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FA836135C;
 Fri, 21 May 2021 17:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621619273;
 bh=xOq3jj2UbZa7lDCzy39FJlunDF10xKfCJ5FyeAWwORQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBD6lbrTjL2LnMejfzX5ud65busPKGi/lpJ5soBktqKEEpW0q6Q6RPLPSTn5hfIHM
 +M+fDBS/u7VpUhjC6axyc2792Z/IHzPsQ6ZlEk30RF72T56Ut8cvZkW3OYoikfOVsI
 An7+UKMeTx7OhM7Vig7bmYyLVyhSJqX/6Jz6i2BU=
Date: Fri, 21 May 2021 19:47:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, anup@brainfault.org,
 Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 corbet@lwn.net, graf@amazon.com, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <YKfyR5jUu3HMvYg5@kroah.com>
References: <mhng-37377fcb-af8f-455c-be08-db1cd5d4b092@palmerdabbelt-glaptop>
 <ff55329c-709d-c1a5-a807-1942f515bba7@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff55329c-709d-c1a5-a807-1942f515bba7@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_104755_328016_ADB82585 
X-CRM114-Status: GOOD (  24.53  )
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

On Fri, May 21, 2021 at 07:21:12PM +0200, Paolo Bonzini wrote:
> On 21/05/21 19:13, Palmer Dabbelt wrote:
> > > 
> > 
> > I don't view this code as being in a state where it can be
> > maintained, at least to the standards we generally set within the
> > kernel.  The ISA extension in question is still subject to change, it
> > says so right at the top of the H extension <https://github.com/riscv/riscv-isa-manual/blob/master/src/hypervisor.tex#L4>
> > 
> >   {\bf Warning! This draft specification may change before being
> > accepted as standard by the RISC-V Foundation.}
> 
> To give a complete picture, the last three relevant changes have been in
> August 2019, November 2019 and May 2020.  It seems pretty frozen to me.
> 
> In any case, I think it's clear from the experience with Android that
> the acceptance policy cannot succeed.  The only thing that such a policy
> guarantees, is that vendors will use more out-of-tree code.  Keeping a
> fully-developed feature out-of-tree for years is not how Linux is run.
> 
> > I'm not sure where exactly the line for real hardware is, but for
> > something like this it would at least involve some chip that is
> > widely availiable and needs the H extension to be useful
> 
> Anup said that "quite a few people have already implemented RISC-V
> H-extension in hardware as well and KVM RISC-V works on real HW as well".
> Those people would benefit from having KVM in the Linus tree.

Great, but is this really true?  If so, what hardware has this?  I have
a new RISC-V device right here next to me, what would I need to do to
see if this is supported in it or not?

If this isn't in any hardware that anyone outside of
internal-to-company-prototypes, then let's wait until it really is in a
device that people can test this code on.

What's the rush to get this merged now if no one can use it?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
