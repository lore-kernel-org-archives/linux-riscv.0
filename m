Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C154C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJebBnBe8ED9Q5tsp/o3WBaDGg5zuJXju3KFXSbTBKU=; b=2FJnCtlTmUftrh
	Ty4mSCZ+cippVpSndcocTsJUOIlQhWABgZojUBzCICL+AzPmcw6qlJWwuZRpH1eGEgr+J6NcYlN1z
	pDuJE8pAUVEHPrMHdoGIjf2T+KPUeMt6Tw95XSfeIwDeDBeXAKnSgbbQ9wfkXVCKW2a/g0BlLWMa4
	5sjyVKUXwpW4KWUrumelvTxR1dinlUKdj7CLAXv4AoZroO8LURllsC/g7F5w2LTYKec2cWytONkYu
	UKSgNpPhLMSgrUxboMQ5XHXYk0gHjdxHHD6U8rb2ucJiZQ90BJIwr6N7UVmcA9sYni6nWd+038hya
	W42ajdot70Gp4NaOVF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKdN-002uN9-2k;
	Fri, 28 Jul 2023 10:23:45 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKdK-002uDD-2H
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 10:23:44 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CFAF04241D
	for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1690539812;
	bh=WLnDrc+rYkHy9bAgh+dxRp9NnmR58Fh4SPqrY0WiOj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=TtgsBGmA16xHeo9XfaQeOD/FV3QUginoMdKF1kHlHQMJnimGQs6dcnO3WLjHikb4n
	 CNtB/obdmHX4O/4gGWqQG9C99/xhCQ0aC1L0+23jiZwchlmpKAWUIuGopsIHQAUJ8P
	 HEYtH1FfiHwAy3xmVYenZHks4tXKNoVlSok8rad+/V91Hkc7Ency2Gw0fKC3r2EFRE
	 3mc5jBngjzpo18GDIc8SnH40P4eOflstplAjh9TcOSpFyUhODFjGug0WUlJpNJoRMU
	 64aF+xhpVyYTtoQBEqXejAt+VL270MTEWCkVCQzlnjb+JEXY2YCnbgWsROC5/mJAwk
	 MwxHUmGiqX8Xg==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-76c8b188b83so36795285a.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 03:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690539809; x=1691144609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLnDrc+rYkHy9bAgh+dxRp9NnmR58Fh4SPqrY0WiOj0=;
        b=clT0yjMAqv9TzLSbDx7uKfxVkseKZB0XhSt/OCSkVe7twpySWquxFBDkgcWZvjPgL6
         7PVylYqkz16iPrsB6I0RZoca4kdi+9YHKQ6MvhL8SBdW3b955LNWOergHzG5sgABBWBH
         BoshI9Enmz/zoDLZynaUKS48Kj5Osk3cBrNBhDzn8xaO/iT3Cxls2BuKcPS5Rc8IPhla
         yy1wX3dB/n3LpVskNjsd9kBJTXF0niflvesS9wJ28GufQLILdrg6RuOvZQYoDQA2tKNv
         yaKWJd8n6EPw2UQvts8KpQXbSEX/0gVODt9Vt4HcfL9fr1C+r7+ftgBSKyhyqvISDHz+
         Rgbw==
X-Gm-Message-State: ABy/qLYkUYe6JWeyJXXL9Z3Bey/oO/O3iHNQLowiAE/a7r5C9DlGDYN8
	w6bFItkdZrAsuU1Ix+UomoUZcWF893u487fXUZIsBnJ1zYNn4HW+afTVlsjKhCM5ME1EvjQEvR3
	kBkBLVolrXXPovNUK/r00KjgGTuZAbPYAISUtYNJlN3gYxewhpjcYIk65x3VeRFMXaNaVVz7f
X-Received: by 2002:a05:620a:44c2:b0:765:ab83:ef05 with SMTP id y2-20020a05620a44c200b00765ab83ef05mr2598610qkp.56.1690539809444;
        Fri, 28 Jul 2023 03:23:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFcKhdNQ8Hs4J35XbEQ2hbzW3cikJQYq0MD/JjdXIJIhnGCVG8T2MePWTq8hZguyBvatYVfCrK3lq92FYw3mSs=
X-Received: by 2002:a05:620a:44c2:b0:765:ab83:ef05 with SMTP id
 y2-20020a05620a44c200b00765ab83ef05mr2598590qkp.56.1690539809213; Fri, 28 Jul
 2023 03:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230617161529.2092-1-jszhang@kernel.org> <c9a44f534071a6d67f1e21bafdb713793c559124.camel@linuxfromscratch.org>
 <20230725-unheard-dingy-42f0fafe7216@wendy> <ZL/jMYL3akl78ZZN@xhacker>
 <3e0994dab495920ac590dc28d6b9d9765abe0c7e.camel@linuxfromscratch.org>
 <ZME1J4mpVf5yth32@xhacker> <866eab3e30a18c50742a75d62aee223fdc7e3cee.camel@linuxfromscratch.org>
 <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
 <ZMKXQpreSr47MFj6@xhacker> <290101d386866f639a7c482527d7a78c5108d49b.camel@linuxfromscratch.org>
 <ZMNojqwLxcG8FcHN@x1> <af41edfe515373530d3d1ffc43c581131e6f6038.camel@linuxfromscratch.org>
 <0f528aa0d4e6f2491835c9a78bb38dd162b75810.camel@linuxfromscratch.org>
In-Reply-To: <0f528aa0d4e6f2491835c9a78bb38dd162b75810.camel@linuxfromscratch.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 28 Jul 2023 12:23:12 +0200
Message-ID: <CAJM55Z9SeT_-5vDWVUAOKeNGZ0TmBPQMjdaZuyVcnbNJuxNCBQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
To: Xi Ruoyao <xry111@linuxfromscratch.org>
Cc: Drew Fustini <dfustini@baylibre.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_032343_086216_A6C2FB10 
X-CRM114-Status: GOOD (  20.43  )
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

On Fri, 28 Jul 2023 at 12:07, Xi Ruoyao <xry111@linuxfromscratch.org> wrote:
>
> On Fri, 2023-07-28 at 15:40 +0800, Xi Ruoyao wrote:
> > On Fri, 2023-07-28 at 00:04 -0700, Drew Fustini wrote:
> > > It seems like your kernel config is the problem. I used it and I saw
> > > the same result of a panic in riscv_intc_irq:
> > > https://gist.github.com/pdp7/1a26ebe20017a3b90c4e9c005f8178e1
> > >
> > > This is the config I have been using successfully:
> > > https://gist.github.com/pdp7/ecb34ba1e93fc6cfc4dce66d71e14f82
> > >
> > > Could you try that config?
> > >
> > > Linux 6.5-rc3 boots okay when built with it:
> > > https://gist.github.com/pdp7/580b072f9a5bf9be87cf88b5f81e50e3
> >
> > Yes, your configuration works.
> >
> > I'll try to figure out which specific configuration item is problematic
> > in my origin one...
>
> Ah, I found it... If I deselect CONFIG_FRAME_POINTER it will crash.
>
> And I see RISC-V selects ARCH_WANT_FRAME_POINTERS, so it seems frame
> pointer is mandated.  But then why I'm able to deselect
> CONFIG_FRAME_POINTER?

You've probably run into this issue:
https://lore.kernel.org/linux-riscv/20230716001506.3506041-1-guoren@kernel.org/

Try applying those two patches.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
