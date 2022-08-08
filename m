Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BDEC00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 20:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHJZ8B8BL9dZjqDqttkZykUbnqBqgOp/WofGxcEvDA4=; b=dYOUgpwOwHFcPD
	EwSEqeAkwlVhKNJbSjusTjwcw0wDInI8Gh27zXKfW5NasxjSnoYDGfNvjWEOxdR/hucBSunKZiCJ4
	UUI3c4u+RSx89u5Pw3DVM6rpHtU3yJHAUttIWDPwLIGBL1nL5bygsin2P0qgreEoQ5jBtytfistLz
	vQjyOZ2Ddrf7esPttkakM5kzkhC31ThK0Q+FAmAskto8TwJEeJQR0hHA62pfXsnObK+YgyuIv6kDi
	/+G4cr8Ob/rWDAF0uiXlrsErDvHgh5r5fVhujFlv57JxlEcBEcocvXBjaCKbN0DcXSJjjNd+ZolZH
	UqUyh/LM1LExbaZ/epPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9jc-00G1Bd-If; Mon, 08 Aug 2022 20:52:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9jZ-00G19T-TZ
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 20:52:23 +0000
Received: by mail-pl1-x632.google.com with SMTP id o3so9602993ple.5
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 13:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PkyBSz3T4VZ+UVrbb0002V2Jh5VFrfHzkQWQK3bBi98=;
        b=SILcWFWVHHgpWvJSf7G2sjJ/uOHykjeS3lM8OQzEdAnMVnHw/k+iA/UTQCXrf5oI8F
         wA2jWlVUENWyoLHeb0X+lqFcizBuyWNOeZC8gpSi876lt3woKppEzI4wTQ73k39s8R//
         ssjJw6enf+XRzncSfKUs7TQNy3+diaI7mWaUJPXK3y2BFC0BvOML0TMaKbpZl3j4e7DA
         L2Fqb9Y7rcsC1I4z7/m4uD11sKAKbulxI3THkWYTTupz+zZ9XQyR7aVXNsdsj9rlj0i0
         gIILaFnZ9H4yCfPYtoduTNy9gGzu2SHIwIC1NyiodLfbIHFqQKY+iqRQJj9j0doGuTEv
         aiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PkyBSz3T4VZ+UVrbb0002V2Jh5VFrfHzkQWQK3bBi98=;
        b=wEiIJAK2OaAZBRnMZBSjmqhpmFw4FesmQ8wheTn1jNwRJhnDyioyLhYxN0zcgFCru3
         CVD7MawjWrzCKsvdgcZjZ9Lx9KqlEaArkeF9N9POxnCMuk8eeg9MsBKqYQFH+f9r5MiA
         nnqckWLOGa0RHYrOdWgkblUzFUWlEtiYhytTPAtDLS+s4PPXerVJjXjyK+ErHT3WAeDd
         c0nTjIhG4HM/eYjSjT3GzJ1F/WAmE0yGCzqc0+Lnd+0raTD9s181wKDoCXk4myTCzAql
         erVuqBew1wmsJFyy7C7iS22Jv7Dv7uP1Eoy8D1XXFApN5r+a1uLD8XODIPfhuSAkhrWu
         7Xyw==
X-Gm-Message-State: ACgBeo29SGpoQq0amcHiWS/gWIskirgbaCGQzy0gjF0OSiIF9tJkNHA/
	q11NxaKc8xUXUHBR3qTKo78XpYaXjW2JvODwjZs=
X-Google-Smtp-Source: AA6agR5MjRLAKi7c/TFhwToDrUvo09Hs9RIH7SFUs3KSroLMuckziLkQpYxHy3k46WCy4lgAb/juHf1mFM+b7soOk2o=
X-Received: by 2002:a17:90b:100e:b0:1f3:a4a:2620 with SMTP id
 gm14-20020a17090b100e00b001f30a4a2620mr22276027pjb.120.1659991938797; Mon, 08
 Aug 2022 13:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie> <20220805155405.1504081-2-mail@conchuod.ie>
 <0f453024-1d1e-105d-855b-234c3c8fedbb@irq.a4lg.com> <fe4bc495-14a3-205d-480d-083c2a81fd13@microchip.com>
In-Reply-To: <fe4bc495-14a3-205d-480d-083c2a81fd13@microchip.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Aug 2022 06:51:52 +1000
Message-ID: <CAKmqyKMURX0ZVgWBOWtWD0fLXTfLDRfdhDtsqLEEPKL=h=afPw@mail.gmail.com>
Subject: Re: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>, Conor Dooley <mail@conchuod.ie>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_135221_975041_386EE964 
X-CRM114-Status: GOOD (  26.97  )
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

On Tue, Aug 9, 2022 at 2:14 AM <Conor.Dooley@microchip.com> wrote:
>
> On 08/08/2022 16:03, Tsukasa OI wrote:
> > I agree with Alistair.  **I** removed 'S' and 'U' from the ISA string
> > and it should be working in the latest development branch (I tested).
>
> Yeah, I saw what you as I looked at the commit log while trying to
> understand why there were invalid strings appearing when the code
> looked like it was impossible. Certainly I found it very very odd.
> I didn't just revive a 2 year old patch without taking a look at
> the code.
>
>
> > Besides, this function alone generates the ISA string for DTB and
> > there's no way such ISA strings with invalid 'S' and 'U' can be
> > generated.  It's definitely a behavior of QEMU 7.0 or before.
>
> Hmm, it would seem that you're right - I have retested on a fresh
> clone. I did checkout v7.1.0-rc1 before running the first build that
> I saw the invalid string on as I'd been on some hacked up & fossilised
> version prior to that. Perhaps some build artifacts were not correctly
> removed, consider me quite confused! I do recall the configure script
> saying something about my build directory when I kicked it off, so
> it is likely down to that.
>
> Unfortunately my bash history is out of order so I will not be able to
> replicate the conditions, having many terminals open does have it's
> downsides.
>
> > Please. Please make sure that you are testing the right version of QEMU.
>
> Heh. Please, please give me some allowance for reasonably believing I
> was in fact on the latest qemu/master after checking it out and building!

No worries! Glad we cleared that up

>
> I guess this patch can then be safely ignored :)
> Glad to have cleared this up as I was rather confused by what I saw.

Great! Do you mind resending the series then with this patch dropped?
It just makes it easier for me to track and manage

Alistair

> Thanks Tsukasa/Alistair.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
