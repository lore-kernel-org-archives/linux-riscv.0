Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74A3ECAAD8
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 00:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+7dOpigBiRC9Jt0mMi1wqJo1/n5avUmPdPAw20l0F4=; b=tiP5AFT2OoE2d+
	yF2AJU8tiMtUIOYIfZKof0PM6F1/4yOkdvqC4/VIvaFtIvjaMDU+DbchVU+Ha9GWi1qmc23wtrWDf
	T9U2m2pjPj16eqRCLUAxFb+VFM3ioQHr/4jmyaO48c7Xucn7NFoEKCdKnYkwQjtvsZ1PlITMLX0a2
	ASw+WYVINmu4t8tBChSyb6ashPl36PBBW1jXoB7eWok7xRMzxSm4z3WffzlGTT1LJLdEHyHaOT4IA
	qTVOamaYcUQ8V8EGKbKlwXgsj98XeqBg+Ml+BnggnatfVbRC9CY/GTYptKXQ27g5/g/DTm0SwqIIK
	uuwoHE1cA2GFkkeu9Ucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZLcA-000quF-Ro; Sat, 17 Sep 2022 00:23:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZLc3-000qpM-RG
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 00:23:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4A8EAB829CF
	for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 00:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844C3C43143
	for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 00:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663374191;
	bh=Dyw1lFGZHONQZqc8amHI7KArtP8/1CLGQfkF3mgKPkw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gBACnD4TpRwaXlGjM0b7bpNocA7b/fnELrH1ycfs2JS6wVPf94JMRngxdSO7oSktO
	 gvdMyaTvAOG6IF19ZgSwM57wKlxV3iuA4cCuBzqhi6A9L/durjjPqsZlu5rh9wGN6W
	 5ZfVsg9/4YMbxG7v+CZDZ4h3Kxau1e/77AD/0NEJvIghh2Bu0kemP8Cd1H+NaoZIqO
	 fZlvFG23UGR7M5zWk5s4IgmKIqMY45BkYMyOi1+0NAOkgE11JdeYRzg3J1p5ejm6pw
	 bpqjiiIl+QuQRX8xSwYlwQzn94p0c1hBYeh7MA9X9YXnHaNsUDjisDCsmmRLFyn71q
	 mjOLJ7HzkTdSw==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-127dca21a7dso54332560fac.12
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 17:23:11 -0700 (PDT)
X-Gm-Message-State: ACgBeo29D4zJ5fVp9eWz6vIQvj+nUNOFk2Z2iLfeTGtfbpyCByrkeNLa
	V//z6asFfWcSn3JUelvbpoIZn4Mmpzc99tnrUi8=
X-Google-Smtp-Source: AA6agR5SbmLuffkt++6oz0mp/yltUQs89bKD53MhXquKyTqEiawdOAKpgBcqQSTpIFS2dKNTCH3ICOzzEreC6jDf0m0=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr9702457oao.112.1663374190443; Fri, 16
 Sep 2022 17:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <20220913094252.3555240-6-andy.chiu@sifive.com> <CAJF2gTRntKCD-Ou0cDtyCQhvSKq7iOqyo7+pxk7NO88UVi3nOg@mail.gmail.com>
 <CABgGipUwUv8e2yKmPYdHgNk1w8UuE=zmb_d_eZS1Qq2+41FtOg@mail.gmail.com>
In-Reply-To: <CABgGipUwUv8e2yKmPYdHgNk1w8UuE=zmb_d_eZS1Qq2+41FtOg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 17 Sep 2022 08:22:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRCkNHdE+JoLV=T7_D0eTaxDdjzoJ5fCJnUB_-ED+CrfA@mail.gmail.com>
Message-ID: <CAJF2gTRCkNHdE+JoLV=T7_D0eTaxDdjzoJ5fCJnUB_-ED+CrfA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch function
To: Andy Chiu <andy.chiu@sifive.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, kernel@esmil.dk, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_172316_243939_575C6468 
X-CRM114-Status: GOOD (  27.48  )
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

On Sat, Sep 17, 2022 at 7:54 AM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> Hi Guo,
>
> Sorry for sending it again, I forgot to send in plain-text on the last mail.
>
> On Wed, Sep 14, 2022 at 3:06 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > Is this patch related to this series?
> >
>
> This is related to dynamic code patching but not the mechanism of
> "function tracer" itself. You are right, I should submit another patch
> for that.
>
> > On Tue, Sep 13, 2022 at 5:44 PM Andy Chiu <andy.chiu@sifive.com> wrote:
> > >
> > > runtime code patching must be done at a naturally aligned address, or we
> > > may execute on a partial instruction.
> > If it's true, we can't use static branches at all. Have you
> > encountered a problem?
> >
> > If you are right, arm64 ... csky all need the patch.
> >
> In fact we have run into problems that traced back to static jump
> functions during the test. We switched tracer randomly for every 1~5
> seconds on a dual-core QEMU setup and found the kernel stucking at a
> static branch where it jumps to itself. The reason is that the static
> branch was 2-byte but not 4-byte aligned. Then, the kernel would patch
> the instruction, either J or NOP, with 2 half-word stores, if the
> machine does not have efficient unaligned accesses. Thus, there exists
> moments where a half of the NOP mixes with the other half of the J
> when transitioning the branch. In our particular case, on a
> little-endian machine, the upper half of the NOP was mixed with the
> lower part of the J when enabling the branch, resulting in a jump that
> jumped to itself. On the other way, it would result in a HINT
> instruction when disabling the branch, but it might not be observable.
How about limiting the static branch to 16-bit instruction? (nop16 - br16)

>
> ARM64 does not have this problem since all instructions must be 4-byte aligned.
But, csky does (16+32). Thx.
>
> Regards,
> Andy



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
