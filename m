Return-Path: <SRS0=gYOx=TW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6489CC18E7C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 04:52:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3B42075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 04:52:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FuOpbbo7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EHT9JbHp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3B42075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gj4yzmunZ0RhyEqVJQXRDLD7d7uZZNfJkgkFbFSIzSE=; b=FuOpbbo7R0Tb8p
	ehPpX0fFzbcmgOtG0yUOnGi5xA3++TjZTW5n+Zk33rkOB2auBWFlW8VlckmpOwoNtZeJHe7FGYu1i
	U5qNbTAID5lZTb2pcbbQVqBWzTxQm0lUXW2lqGTVdHmO/aMbLiS2UHwEySoVehjJ9Abgrrm0FGkPq
	/1cWPGEPyfVZT0B3QrpLzL6TjcSZb6jQcNn+4R3oBp+ANY1FLGcA59yym8+Sb2yI46YJR4dPX4YHM
	4g7o58ybpGu6aph/WmSQdWuOPpuKG8BluocoS0BZLVPIycc+V8llKuESkim/aJdai36woV8y6szvB
	buKsvxheuFpoxBoqY81A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTJER-0007pM-CL; Wed, 22 May 2019 04:52:03 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTJEP-0007p0-70
 for linux-riscv@lists.infradead.org; Wed, 22 May 2019 04:52:02 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id o5so623335vsq.4
 for <linux-riscv@lists.infradead.org>; Tue, 21 May 2019 21:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zM2tRxvUf7NSwKdxRr5bB44PMs0jXxiNemDXs7iz74s=;
 b=EHT9JbHp1/Wa9RK9jVA4OK5kq2Umqvo7DXotXmfDEtVX21PiUHOUZ7autAocu1Z3DI
 6ZRzqyXAzb53gUg4yp/9LcfDmApaECzDSf9bA/g+e11hacYU5wNPzj15Auf5iJplAEtJ
 wZeJSYFMKDpxZEjRnn6nJNQ1Slzdsq0eQQ8ufZoihNbert9VvIhORIZzgty3g3W+bE25
 T3DmsGv84wTy2AsU5rwySyDsgDziJjHHyl+mkLCG9iem3r/ql3ytMZslrTQPrdotdQ7p
 RY9dGGRkvsixSFKzdHePNcTAiXJOMlQXS6jGUd0Y6QcTaO76OQ0naSFaKcI1KonGInxP
 csKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zM2tRxvUf7NSwKdxRr5bB44PMs0jXxiNemDXs7iz74s=;
 b=LsQXo35gAdTXQbG2lFzR2d0jyX5gCTdbLaQ/n1MDhyrMeU62NbnfJmImG/CC/F4hRn
 d0Eid5HfBrBSTqq6YmqE/LS/qOxXlz8m1niO2DdMLJPF1QtP40Ny5FSEndTaYHGBVwlH
 reQFqbE12s5yszhv7zUduWHPpO1C9UnLna08FYGbFhsnT4ex5lH82g46gszrarMDPuAM
 WkG8k34s8SZrYjkYfU5n4fRFIUMLKm3yjbt8wqOQc9Kzjka+/36orUv7ybn1a5gUbdPe
 YNYeuKYUcuejceF9bIR01mV5ZkLrHBVTc8BzWcaa4zU8/7+qsSwycPZXtRNbXabDa1cj
 XZJA==
X-Gm-Message-State: APjAAAWiA6HpQofBiDVnFFxkl1so7LN76QAhiE2CIA5MXGOFGbsZDPlZ
 zNpFhfG/j2ebYUS1p5XARDqg5SfxQB2bu7wHd4AM9A==
X-Google-Smtp-Source: APXvYqzzpsKJ4iLQ7BqaYnxLEeUZsLQq9FfHMG3CB4djAfIFwCnnOLRgOAk2mwGbLwgnxYcQMlY4DKeohWMasNEvt+c=
X-Received: by 2002:a05:6102:247:: with SMTP id
 a7mr16894374vsq.229.1558500719859; 
 Tue, 21 May 2019 21:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
 <1558445574-16471-2-git-send-email-sagar.kadam@sifive.com>
 <20190521135625.GN22024@lunn.ch>
In-Reply-To: <20190521135625.GN22024@lunn.ch>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Wed, 22 May 2019 10:21:47 +0530
Message-ID: <CAARK3HmAYjnBH6Aa_R_uKQPs5JAdBAEt1=dvPz1mLmGaKKpP9w@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_215201_315368_3B268042 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 peter@korsgaard.com, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Tue, May 21, 2019 at 7:26 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> >  Required properties:
> > -- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> > +- compatible      : "opencores,i2c-ocores",
> > +                 "aeroflexgaisler,i2cmst",
> > +                    "sifive,fu540-c000-i2c","sifive,i2c0".
> > +                 For Opencore based I2C IP block reimplemented in
>
> It looks like there are some tabs vs space issues here.

Ohh. It was not catched in checkpatch.pl. I will update it.

Thanks,
Sagar Kadam


>    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
