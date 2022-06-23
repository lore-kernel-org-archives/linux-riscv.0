Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6F5C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 03:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cg+qRpiS8vzfq14xH3wwBN89iBBh8F0dYwoGSPMcksc=; b=3N5BzqifKEBoVv
	opPfV/UjwOh1Tuv8RuuZCZO/5bz5tOBmaKPw1hQkZvCpgIGAB75ZbUg1+8CtglAifHeeu+NK6mti4
	qKERfN8XDz/Si1R45lqREVJajPu0PxXpFaW8YffYzWNIm+k4xavk9HXfxsDwFY295hKPhnZK6/aH9
	DUEZXc62+TQU7K8hai0xZ11Hd67UmH0JWie4lM8HlCMxs2jERrRS25sfPn4vM+GgqoTOxlBTqCs1G
	Mwzv6OPN45piYGXV2lMx1br2TJUqhGSZJAVKu6uqoyXM0XJKQdRgUhl8SbYmDWqaZXIAfmn4pkjNv
	DRX+KK8BnYEjUD+t2tdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4DZJ-00DDEp-Qx; Thu, 23 Jun 2022 03:31:45 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4DZH-00DDDu-HN
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 03:31:45 +0000
Received: by mail-qk1-x72a.google.com with SMTP id g15so14050931qke.4
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jun 2022 20:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=feedback-id:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iETqc+0lijFZ14zCNnfCSiDsY3yxYpnuYnsCd/H37sM=;
        b=XKQr60hHEpIr7iE2oQMJHBd/HDGQCZhaSPpmeuw6TyKQkYL2MF+8jdtsqUCz7uL090
         Rc90KAFbCLt0JwHQ7vCIyEX0mj9/duP+7TF6SlIMyM86A8tJXhvp6mW5g1QMYcFMm06q
         OZhDv9iwxJwHYCl8D05Sv3M3yI+gUsqDtuKv/FhshrgMg3aaZz2lgZeLKguk6uF7IRXr
         cNriRKL9+D3vNavHkaKAfctj+1iVXUr8uNGq3KbwjLdVPWLWbnlMjLar4aOtzfnqqsG1
         IsuxOEdrqkfV7FuJV0wVV7InjeaCmRhOkIonyeI7vJokQaKzp0nLlHjjfWTw37p0n1hs
         m3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:feedback-id:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=iETqc+0lijFZ14zCNnfCSiDsY3yxYpnuYnsCd/H37sM=;
        b=V4pAKIL2y2PXVNLNC6KyEnaWz0xqShHKmZcgCZZLINBlNGZSazuBq+HRZ7yW8xuhiH
         MiE4KRzT+vSqsAvtZPQLZvh50x7RVmUceF7X7BOK8aS6f311eEPmDWLoqpmII1ne1OS5
         mwhOeKcpvcyHVtrzp5OOwjmAZAFkWxYbUVRFUGW8eCIAJImLMCKni9ilyareNEz5PGwz
         GOsyBDpCq6hYVSk0ifXz4iJYTEr6HX2ro8j86/JlD1s6+OevVsfoMIlNQhUidiKMIBXF
         A3GLMioIhTVFgJ4drTot7a4K5UYZ/9gpoW4/1B2iw2Yqk2qWI5l3BPdu+jRnx8uF0RoL
         eozA==
X-Gm-Message-State: AJIora/04xDXwuXoP4zdufgyjL06OOyuFL17JS02DH3QX9sim9CrwIqk
	gdTPyhDJAVMjrPgRvJgZQiA=
X-Google-Smtp-Source: AGRyM1tog79QF/BM4XYNYwOk5JDAVQGSrmJOA/BPSicl6+PpfP5C/VU3C9rh50h8yJ2wwtZJnXowiQ==
X-Received: by 2002:a05:620a:410:b0:6a6:abbe:2018 with SMTP id 16-20020a05620a041000b006a6abbe2018mr4736397qkp.645.1655955098873;
        Wed, 22 Jun 2022 20:31:38 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a444800b006a6f68c8a87sm19125307qkp.126.2022.06.22.20.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 20:31:38 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailauth.nyi.internal (Postfix) with ESMTP id 9792927C005A;
	Wed, 22 Jun 2022 23:31:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 22 Jun 2022 23:31:37 -0400
X-ME-Sender: <xms:mN6zYnQKaLySnOd9VxDXjDwnGZmLTZp5pcoBSLC14CVRiYD-4dkwPw>
    <xme:mN6zYozHljR1xtO0TqSrgYgIzlLhQmxyZxq-d-vd8Ei8eOXyjVJa_tZojuQ7z_4o6
    _v48XaZ7RZMfdGxPw>
X-ME-Received: <xmr:mN6zYs0W6y8qNOg5L2xB5Yu6taF9iYJdInFUKKN7W13mLFGdaxvUbx6732EQ7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefiedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvfevuffkfhggtggu
    jgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfh
    gvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeffkeevvdejhedutdet
    hfejiedttddthfetffdufeduleektddvgfduvdfhjeelueenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgpdhgohhoghhlvgdrtghomhdprhhishgtvhdrohhrghdpghhithhhuhgs
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:mN6zYnBPdK3t52BMAfRz2zUIZllzPyUBJ7JsU8Y-7lOZuHAn8dqQow>
    <xmx:mN6zYgg3aPGAOi1epe1R9Xa01Nw-9_ZY9KGDjke08_7ALt_XuFsALw>
    <xmx:mN6zYro6F5dpRtrEpiVoyiFeKvd60ifj5XAEsR_CwzN6Y-SSRVXdow>
    <xmx:md6zYvpvOSZfhora_uKsjFdbpAJiFHSus5asheFt3AsquhBWIzp1ug>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 23:31:36 -0400 (EDT)
Date: Wed, 22 Jun 2022 20:31:23 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lustig <dlustig@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 5/5] riscv: atomic: Optimize LRSC-pairs atomic ops
 with .aqrl annotation
Message-ID: <YrPei6q4rIAx6Ymf@boqun-archlinux>
References: <CAJF2gTQoSQq_S4UvAiXgMviT040Ls8+VkDszQSke1a0zbXZ82A@mail.gmail.com>
 <mhng-7a274375-0d99-41c8-98a3-853d110f62e9@palmer-ri-x1c9>
 <CAJF2gTTXO42_TsZudaQuB9Re0teu__EZ11JZ96nktMqsQkMYNA@mail.gmail.com>
 <20220614110258.GA32157@anparri>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220614110258.GA32157@anparri>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_203143_680664_D09556B8 
X-CRM114-Status: GOOD (  35.73  )
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

Hi,

On Tue, Jun 14, 2022 at 01:03:47PM +0200, Andrea Parri wrote:
[...]
> > 5ce6c1f3535f ("riscv/atomic: Strengthen implementations with fences")
> > is about fixup wrong spinlock/unlock implementation and not relate to
> > this patch.
>
> No.  The commit in question is evidence of the fact that the changes
> you are presenting here (as an optimization) were buggy/incorrect at
> the time in which that commit was worked out.
> 
> 
> > Actually, sc.w.aqrl is very strong and the same with:
> > fence rw, rw
> > sc.w
> > fence rw,rw
> > 
> > So "which do not give full-ordering with .aqrl" is not writen in
> > RISC-V ISA and we could use sc.w/d.aqrl with LKMM.
> > 
> > >
> > > >> describes the issue more specifically, that's when we added these
> > > >> fences.  There have certainly been complains that these fences are too
> > > >> heavyweight for the HW to go fast, but IIUC it's the best option we have
> > > > Yeah, it would reduce the performance on D1 and our next-generation
> > > > processor has optimized fence performance a lot.
> > >
> > > Definately a bummer that the fences make the HW go slow, but I don't
> > > really see any other way to go about this.  If you think these mappings
> > > are valid for LKMM and RVWMO then we should figure this out, but trying
> > > to drop fences to make HW go faster in ways that violate the memory
> > > model is going to lead to insanity.
> > Actually, this patch is okay with the ISA spec, and Dan also thought
> > it was valid.
> > 
> > ref: https://lore.kernel.org/lkml/41e01514-74ca-84f2-f5cc-2645c444fd8e@nvidia.com/raw
> 
> "Thoughts" on this regard have _changed_.  Please compare that quote
> with, e.g.
> 
>   https://lore.kernel.org/linux-riscv/ddd5ca34-805b-60c4-bf2a-d6a9d95d89e7@nvidia.com/
> 
> So here's a suggestion:
> 
> Reviewers of your patches have asked:  How come that code we used to
> consider as buggy is now considered "an optimization" (correct)?
> 
> Denying the evidence or going around it is not making their job (and
> this upstreaming) easier, so why don't you address it?  Take time to
> review previous works and discussions in this area, understand them,
> and integrate such knowledge in future submissions.
> 

I agree with Andrea.

And I actually took a look into this, and I think I find some
explanation. There are two versions of RISV memory model here:

Model 2017: released at Dec 1, 2017 as a draft

	https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/hKywNHBkAXM/m/QzUtxEWLBQAJ

Model 2018: released at May 2, 2018

	https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/xW03vmfmPuA/m/bMPk3UCWAgAJ

Noted that previous conversation about commit 5ce6c1f3535f happened at
March 2018. So the timeline is roughly:

	Model 2017 -> commit 5ce6c1f3535f -> Model 2018

And in the email thread of Model 2018, the commit related to model
changes also got mentioned:

	https://github.com/riscv/riscv-isa-manual/commit/b875fe417948635ed68b9644ffdf718cb343a81a

in that commit, we can see the changes related to sc.aqrl are:

	 to have occurred between the LR and a successful SC.  The LR/SC
	 sequence can be given acquire semantics by setting the {\em aq} bit on
	-the SC instruction.  The LR/SC sequence can be given release semantics
	-by setting the {\em rl} bit on the LR instruction.  Setting both {\em
	-  aq} and {\em rl} bits on the LR instruction, and setting the {\em
	-  aq} bit on the SC instruction makes the LR/SC sequence sequentially
	-consistent with respect to other sequentially consistent atomic
	-operations.
	+the LR instruction.  The LR/SC sequence can be given release semantics
	+by setting the {\em rl} bit on the SC instruction.  Setting the {\em
	+  aq} bit on the LR instruction, and setting both the {\em aq} and the {\em
	+  rl} bit on the SC instruction makes the LR/SC sequence sequentially
	+consistent, meaning that it cannot be reordered with earlier or
	+later memory operations from the same hart.

note that Model 2018 explicitly says that "ld.aq+sc.aqrl" is ordered
against "earlier or later memory operations from the same hart", and
this statement was not in Model 2017.

So my understanding of the story is that at some point between March and
May 2018, RISV memory model folks decided to add this rule, which does
look more consistent with other parts of the model and is useful.

And this is why (and when) "ld.aq+sc.aqrl" can be used as a fully-ordered
barrier ;-)

Now if my understanding is correct, to move forward, it's better that 1)
this patch gets resend with the above information (better rewording a
bit), and 2) gets an Acked-by from Dan to confirm this is a correct
history ;-)

Regards,
Boqun

>   Andrea
> 
> 
[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
