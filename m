Return-Path: <SRS0=wiyu=Z3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F849C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2019 23:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C81A24659
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2019 23:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A5IRM3dZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KksCuKmK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C81A24659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=At6HvOSlwFx69DNlcjSWSbtHuC15o2vy25oLL0IdSIs=; b=A5IRM3dZf93p/glaNixpMQoFr
	S3Dt6WPcYhdqLGLrxj7iZhighYMdR2VIlIXimXCPEUy9I/fos31CEJQgAXHdl+IA5Ob7UvErHhErq
	QKdgApiriiVVY9AXSnpV6TkNglOpAKV+bRbqPP80HNopCjmOmc7kNJt2mOnoJuWLVJnrnVgZdBD04
	qk1DFzEOj1eKFEygC0VaiOTtbhkktCK5p8oUcVGjSB+Y+/B4Zd6g1JELLI3oPeSu4Mf5jM+VdjxgC
	4OTJO573ebHSHqNt+dpDdmCDkyVgmm670pZONGJI8arKJ9d5+AQEQfRhJKXhJXoqyCffdiZIV7wB2
	NUlFrKtUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id0IA-000458-0Z; Thu, 05 Dec 2019 23:12:14 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id0I5-00044T-UD
 for linux-riscv@lists.infradead.org; Thu, 05 Dec 2019 23:12:12 +0000
Received: by mail-io1-xd42.google.com with SMTP id c16so5427117ioh.6
 for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2019 15:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=At6HvOSlwFx69DNlcjSWSbtHuC15o2vy25oLL0IdSIs=;
 b=KksCuKmKAwHIOMrAzcR1CAT2l9X2g9xfwOqVX/z/ngLmeKNjY+cKTfDcNyEvnTkQog
 poobitaHiDJuO4KjOSN9GLmXUPVUYrRXJWRQKPbBjcL4M3dkEkCG7CCWZbxBJRLOFWkl
 /tdlsHK4Gipfh4O2e0klJSDLDsBT+9ak0oTUnIoDOF8cdGHwIQMYLPbx23SH6Kw3spJ1
 Iz/IVvYyl3Rs+kF7MQcATLFdAnCsVOYPqBKEtkTnSwbiQPFRM//hOd5d6JqagAUPafDm
 Dp5JvnSLiuKPJ/1ZW8Y/le4ek/ikkhnOZvrsS3Grcm/IF9i/2pI3vYLovdcZgIEc93mE
 pfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=At6HvOSlwFx69DNlcjSWSbtHuC15o2vy25oLL0IdSIs=;
 b=gaU6FHMClJ+uB9H4pPlZ8rOTag84sfAR5sqTPOMDLnqJpjfpRdY83O/hsxRt6Cy06s
 dCD+zHyTszT9EPan6pg/tWHn507urSmsipTKOaUIphzqrK+Q4RyOk6U8bV6vqLSO532F
 O0KWT4LgWJ7e5WbFna6K6FMqj2Iaq20WWmL1atXu7wJR64VD9LGp2ydgbnvlDxJiTKNp
 D2sXP5TUIkkO867OoHEsdoGQNjsEnNjYzH/e1Af8FaE9TNA/0O/rjRZcnM8mVfvsAVQQ
 zNbfWVv8q4+Ao0WzZrCT7vPEeGn4cR4KTlTCRIijB3wTJQUjsldkV6Y4K3ZFRQ8vYsMu
 DJfg==
X-Gm-Message-State: APjAAAU2CMZP8OTWa2uOL10l542BcZxOFybv7GrvLyMuOnT8YID8WJqn
 Qy2mUI9pHGszuyiil+xWGilmMg==
X-Google-Smtp-Source: APXvYqxU9tuM56/pkySosrweH7NrZ+rnY/k0mRKp1T3IB8gtWL8a+1kzvXYs+QZ+an1cIN0xgNdUpg==
X-Received: by 2002:a5d:8cd6:: with SMTP id k22mr7983995iot.283.1575587525678; 
 Thu, 05 Dec 2019 15:12:05 -0800 (PST)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id s88sm3352711ilk.79.2019.12.05.15.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 15:12:05 -0800 (PST)
Date: Thu, 5 Dec 2019 15:12:03 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [GIT PULL] Second set of RISC-V updates for v5.5-rc1
In-Reply-To: <84c4ee600c0dd235a0fcc257115807af7207b5f6.camel@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1912051435130.239155@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1912040050430.56420@viisi.sifive.com>
 <CAAhSdy2id0FoLBxWwN7WHEk5Am770BizkK=sZO0-G54MtYa6DQ@mail.gmail.com>
 <9044bad02aa6553cdb2523294500b50fccf3fd2a.camel@wdc.com>
 <alpine.DEB.2.21.9999.1912041128400.186402@viisi.sifive.com>
 <81530734312456aab8b9625d7e9bb071c43db1c5.camel@wdc.com>
 <alpine.DEB.2.21.9999.1912041644170.206929@viisi.sifive.com>
 <84c4ee600c0dd235a0fcc257115807af7207b5f6.camel@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_151210_181789_E39A9F92 
X-CRM114-Status: GOOD (  31.20  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "anup@brainfault.org" <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
 "hch@lst.de" <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 5 Dec 2019, Alistair Francis wrote:

> On Wed, 2019-12-04 at 18:54 -0800, Paul Walmsley wrote:
> > On Wed, 4 Dec 2019, Alistair Francis wrote:
> > 
> > > It is too much to expect every distro to maintain a defconfig for 
> > > RISC-V.
> > 
> > The major Linux distributions maintain their own kernel configuration 
> > files, completely ignoring kernel defconfigs.  This has been so for a 
> > long time.
> 
> That might be true for the traditional "desktop" distros, but embedded
> distros (the main target for RISC-V at the moment) don't generally do
> this.

Maybe in this discussion we can agree to use the common distinction 
between distributions and distribution build frameworks, where users of 
the latter need to be more technically sophisticated - as opposed to 
downloading a disk image.

> > > Which is why we currently use the defconfig as a base and apply 
> > > extra features that distro want on top.
> > 
> > As you know, since you've worked on some of the distribution builder 
> > frameworks (not distributions) like OE and Buildroot, those build 
> > systems have sophisticated kernel configuration patching and override 
> > systems that can disable the debug options if the maintainers think 
> > it's a good idea to do that.
> 
> Yes they do. As I said, we start with the defconfig and then apply
> config changes on top. Every diversion is a maintainence burden so
> where possible we don't make any changed. All of the QEMU machines
> currently don't have config changes (and hopefully never will) as it's
> a pain to maintain.

I'm open to your concerns here.  Can you help me understand why adding a 
few lines to the kernel configuration fragments to disable the debug 
options creates maintenance pain?  Isn't it just a matter of adding a few 
lines to disable the debug options, and -- since you clearly don't want 
them enabled for any platform -- just leaving them in there?

> > > > distros and benchmarkers will create their own Kconfigs for their
> > > > needs.
> > > 
> > > Like I said, that isn't true. After this patch is applied (and it 
> > > makes it to a release) all OE users will now have a slower RISC-V 
> > > kernel.
> > 
> > OE doesn't have any RISC-V support upstream, so pure OE users won't
> > notice 
> 
> That is just not true. 

After getting your response, I reviewed the OE-core tree that I have here, 
which is based on following the OE-core "getting started" instructions. 
The result is a tree with no RISC-V machine support.  Looking again at 
those instructions, I see that they check out the last release, rather 
than the current top of the tree; and the current top of tree does have a 
QEMU RISC-V machine.  So this statement of yours is correct, and I was in 
error about the current top-of-tree OE-core support.

> You talk later about misinformation but this is a blatent lie.

This isn't acceptable.  We've met each other in person, and I've 
considered you an enjoyable and trustworthy person to discuss technical 
issues with.  This is the first time that you've ever publicly accused me 
of misrepresenting an issue with intent to deceive.  There's a big 
difference between stating that someone is quoting misinformation and 
accusing someone of bad intentions.  I expect an apology from you.

> > > Slowing down all users to help kernel developers debug seems like 
> > > the wrong direction. Kernel developers should know enough to be able 
> > > to turn on the required configs, why does this need to be the 
> > > default?
> > 
> > It's clear you strongly disagree with the decision to do this.  It's 
> > certainly your right to do so.  But it's not good to spread 
> > misinformation about how changing the defconfigs "slow[s] down all 
> > users," or
> 
> What misinformation?

You've already acknowledged in your response that the major Linux 
distributions don't use defconfigs.  So it's clear that your statement is 
false, and rather than admitting that you're wrong, you're doubling down.

> > exaggerating the difficulty for downstream software environments to 
> > back this change out if they wish.
> 
> If you think it is that easy can you please submit the patches?

For my part, I'd be happy if the current RISC-V OE and Buildroot users who 
don't change the kernel configs run with the defconfig debug options 
enabled right now.   So, I don't plan to send patches for them.

> I understand it's easy to make decisions that simplfy your flow, but
> this has real negative consequences in terms of performance for users
> or complexity for maintainers. It would be nice if you take other users
> /developers into account before merging changes.

As stated earlier, I'm open to reconsidering if it indeed is onerous, and 
not just a matter of patching a few lines of kernel configuration 
fragments in OE and Buildroot once.


- Paul

