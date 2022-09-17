Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE337ECAAD3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+DVgRqiO0F/3qgO43GWYCWHk53/aag9WyzERijcTDc=; b=QqTZ45oduB6na8
	ev4wEIXuMJX01BI5hdjYgpnz05591Xa5dbe4RzJlGO50fURsY9xpfNNuAzhWU3vDtPjT5a8XttUrF
	5d2vMRDEWcDjyKDjZLtsL650ka76gyoppvGYL+0UdsSjiwXoqwMOOonV3FD/Mhh03AbC9WAHBNrNW
	CZ4F+6egEDEnPPeJ54uUmhA3CgkSAV4Uy5qOg4cHVFGAfgpSNy5fDrB2UNsSb8d29z1+gHdxsxFee
	d3qhaUTKOIwJvCgmbJQBeq0QkMqk7bQrmPZV8Po4gZhXB5UKCsBrVQA23N0bd0M5y8Ich6mgngGPs
	XgKVhLEetZIHIuFPfhjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZVLR-005G6L-KD; Sat, 17 Sep 2022 10:46:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZVLP-005G3b-7p
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 10:46:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C429361004
	for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 10:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346C3C433D6
	for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 10:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663411598;
	bh=Mk9u72C3NZotIzny4010l2UK4Jk0C0zgSamSFp0eYLE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ovU/AECAhGCtUPHtyXf+cmG7XLMCzz1w34ApEph+MfD/hCEi/3BpaeuHZSav5gXKa
	 Slbh4uIjXsKGXmzv3MkxIiIo0FrrwtS0ADB5NRjWQZvx7E3W3awO/8rOLELKY/SqBx
	 mm0tzLYgY6QEGOl2WazmhbHW4LS/n55UyaaA4dZEzbJX7MgyEoQWTWddE6AbKaAd9E
	 fZy5d1aNSYIxNN/JAhYM9sBXDqNNIc1uLW7Jd/kCWHBqDTvwFgb3y6ZrKJN65FpDVG
	 e0Y9cBKdGop2XTUsJlQHXCAlpvdLeR0wJcm4zSypfgDre145IERsJxRkTKPlZkvs7e
	 Zy0JWdRhAW1Sg==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-12803ac8113so55560092fac.8
        for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 03:46:38 -0700 (PDT)
X-Gm-Message-State: ACgBeo1J8DyR277XcLlkBH1uwrDNIhrSedEqm6QIsh4drL39gobBu9pS
	50/9jhlZCcd2wnm0U+ehlzMIhsl8yS9zmT1xfEs=
X-Google-Smtp-Source: AA6agR6AXCrq3aWOoC8Bi8am/l0Ye9haGWBI6uFBZEnP+yhZkWRjM0dJRVT8vekDCLKDIhxkiAeAFyP9pJsD5YP+nOU=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr10574980oao.112.1663411597397; Sat, 17
 Sep 2022 03:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220916103817.9490-1-guoren@kernel.org> <20220916103817.9490-2-guoren@kernel.org>
 <CABgGipWdm+-pOrj-ROR8fsVO7JEr4m64z7+zNW1_NszW74e5SA@mail.gmail.com>
In-Reply-To: <CABgGipWdm+-pOrj-ROR8fsVO7JEr4m64z7+zNW1_NszW74e5SA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 17 Sep 2022 18:46:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT-TOdoGuFdbR8Xwmfur-LNOCUq_sThr9ZpJeMKxudH1A@mail.gmail.com>
Message-ID: <CAJF2gTT-TOdoGuFdbR8Xwmfur-LNOCUq_sThr9ZpJeMKxudH1A@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: ftrace: Fixup panic by disabling preemption
To: Andy Chiu <andy.chiu@sifive.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, rostedt@goodmis.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, jrtc27@jrtc27.com, 
	mingo@redhat.com, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_034643_342503_B7959DDF 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Thanks! I would add your Signed-off-by: Andy Chiu
<andy.chiu@sifive.com> as the first author, next.

On Sat, Sep 17, 2022 at 9:32 AM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> Yes, by disabling preemption and ensuring all sub-functions called by
> the busy waiting loop of stop_machine, which happens to be true on
> non-preemptive kernels, solve the problem from the original
> implementation.
>
> Andy Chiu <andy.chiu@sifive.com>



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
