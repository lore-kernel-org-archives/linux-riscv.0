Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191E7C6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 20:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GD45pgEUcTzyHyMIcmZn/ozFYLcEoVJBqg2cqZ1OuCk=; b=WszWvHRSE/HEw/
	sNaICJbpWgn7QE638UQL1E9PEDA4vZF0pw1g9L242Fe7Q89ScY3A5z0kw7fYNKfuRbxuZx76zU62H
	r0piRMgWp2Hqc64aZsGwiNKmToOkhkSMSHhJ2y3Kwsc6qcDkwQXZ4wQ5WdI8oWOCvjLDkZOCIteMD
	Sc/njqoxyqs9kvtq+2mQoptLAjUPBnnWSnzZPiGlXpvGwpqU0WU8l0/CnJ8w7htAfnHcH0XMJQWSr
	P68MksM6VgJsHP0StwAahon/Ch0ebzlornJlRaU33GDDt4yqwkT/Pl6lacEL3GUCJh9B05MN8XEYr
	xk3g6O91YVxSdOuStx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prPjU-002Ccs-08;
	Tue, 25 Apr 2023 20:57:52 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prPjR-002Cc5-0n
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 20:57:51 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 91DCE44284
	for <linux-riscv@lists.infradead.org>; Tue, 25 Apr 2023 20:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1682456263;
	bh=vgRVIXe+P2Wjfmla/rXAZJKk1sI+D1ImKYegwRHDTks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=lF5Sautdzi4aTmZZEhABZ735HAgqL37lbgXolZA8GPq0kjci769oTPQjT5IOK8kqJ
	 rwBqA9hN8WpsRyD/X20FwvrLjG6kZdWG/fRKMy1/uQwfP9qK+pz/xq4Fx0zPJKt4hG
	 0KA/5Yj1hsFdYEFmRrfBEFe5MeWzYQSjnx3CyyvK/EQ2c5FGauQEFVHTRM2mhjfd53
	 M6BNujQ8VUOKBkLudPk2sOJZJT1yw2Q79NgYDbsxAgLuS/G91BVSDGcMF3JtBMD0kg
	 dUVll7Oe0hOfQj2sHmOfax0xBwSEFPXUn6/wVcusQh3SDqkiVG98hkcGPv4eEgDClv
	 B4DpxU3PocUrQ==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-74deaece753so1002751085a.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Apr 2023 13:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682456260; x=1685048260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgRVIXe+P2Wjfmla/rXAZJKk1sI+D1ImKYegwRHDTks=;
        b=d2UsL8M3ss7sPUGo1xWymd6CtlSMz4onL9P5Bt2tMn0Qb1vt5frEc8w3uvjvSCp0AR
         v9FzFwmeL+sfD4Rnl5RmGC700HUvSeeicINtdvMRimiEDBGL/LQade2xEjtJUtNxDKjH
         OExvZJRZ69kzA8ZDcNfNsu+xENL1Io50Jy0kjgAuWgOdgpCeh96HqzdqlQen0oMCpfgB
         bB6eBHAwGXcpcc8LROL8l3sFTueR91NVt91F2vESGld/swTNair4/mdrv1dqOvzdRJGS
         XPo1cdz+/k/eTznwflkriY0Wu1FYXSKA0gVDaIkumfU8UxfITJ32pPfMcUnEvaUG6PWK
         A8OQ==
X-Gm-Message-State: AAQBX9eFp1XpH2uE6TDi2w8aKxTEmC7wF1renxAfHadVc9wdgiQj1bpk
	lLlWt8LT0pMqKZRF3InRdiE8vPfG60Tkhkm0CFPwf4U4Zhs3LHVMUR8qchNZsLwlTRG+QjkUwmU
	UUhlyNWvTIDAQBWcO6uRbY0glIEsIB7etjcwx6mW9CaFRneyPVOMf/9csrYzHUAXyZ3J0xw==
X-Received: by 2002:ac8:5d8d:0:b0:3ef:46b0:80e8 with SMTP id d13-20020ac85d8d000000b003ef46b080e8mr30845701qtx.19.1682456260309;
        Tue, 25 Apr 2023 13:57:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350YgJcj8NBwRby79492evbEUfuqxK9Zf4fKQdwy3HHL1ByJh+2fexc3h8J5/zzoJIvi71pUHyKLn9qmewz+xjS8=
X-Received: by 2002:ac8:5d8d:0:b0:3ef:46b0:80e8 with SMTP id
 d13-20020ac85d8d000000b003ef46b080e8mr30845680qtx.19.1682456260117; Tue, 25
 Apr 2023 13:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-5-walker.chen@starfivetech.com> <20230421-dropper-upstage-200ae7e47092@spud>
 <607f3604-056c-6f3a-b154-0f298b870811@starfivetech.com> <20230424-roundness-everybody-659599d44963@spud>
In-Reply-To: <20230424-roundness-everybody-659599d44963@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 25 Apr 2023 22:57:23 +0200
Message-ID: <CAJM55Z9a9N8Zm2cuh8gzZNcYBENO5WE6GmRXOsaYbOcv0srz-Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: add tdm node and sound card
To: Conor Dooley <conor@kernel.org>
Cc: Walker Chen <walker.chen@starfivetech.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_135749_445952_48D8CF7C 
X-CRM114-Status: GOOD (  26.35  )
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

On Mon, 24 Apr 2023 at 18:27, Conor Dooley <conor@kernel.org> wrote:
> On Mon, Apr 24, 2023 at 11:21:11AM +0800, Walker Chen wrote:
> >
> >
> > On 2023/4/22 0:50, Conor Dooley wrote:
> > > Hey Walker,
> > >
> > > On Thu, Apr 20, 2023 at 10:41:18AM +0800, Walker Chen wrote:
> > >> Add the tdm controller node and sound card for the StarFive JH7110 SoC.
> > >
> > > Is this one of these waveshare things + a visionfive 2?
> > > https://www.waveshare.com/wm8960-audio-hat.htm
> >
> > Hey Conor,
> > I'm glad to receive your comments.
> >
> > Now we are using this board + VisionFive2 :
> > https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/
> >
> > >
> > > I'm a bit lost as to why this needs a whole new board, should it not
> > > just be an overlay that you can apply to the existing dts?
> > >
> > > Taking this to an extreme, should I expect to see a new devicetree for
> > > everything RPi hat that you decide to use with a VisionFive 2?
> >
> > For your response, I did some thinking. Because wm8960 codec is not integrated
> >  on the VisionFive2 board, perhaps using overlay is a better way.
>
> Aye. I think so too. From my PoV, if this particular seeed audio board
> is something you're bundling with VisionFive 2 boards on your storefront
> etc, then I'm fine with taking it as an in-tree overlay.
> If it is just a "random" RPi hat (that happens to be exactly what you
> need for testing the audio drivers), then I don't know where to draw a
> line for what is & what is not acceptable for inclusion.
>
> In both cases, it's Emil's call.

I'm not aware of any shop bundling the VF2 with an audio board. I
agree: please don't add device trees for combinations of VF2s and
hats. That should be an overlay.

/Emil

> > > Also, it'd be nice to provide a Link: to where someone can find more
> > > info on this combination of items. Google for "wm8960 visionfive 2"
> > > gives me nothing, nor does "starfive audio card" etc.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
