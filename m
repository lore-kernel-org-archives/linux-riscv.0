Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5EDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 15:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBTwqz0DB6j3Ar071DkLImiojiyn3CVb2p1RvPnjGHU=; b=0JnQYCf5PlWREO
	r1UMdQlKiJBVhy2qCeUMPukmdxjFvz9DfrCN3Vlbu5qRl/oA8YtnfVAzclxPGGhhhgZG/wcePPidN
	P7Ynuoh9xutYWIVbmrntPQ5FWCfqGy9PhiwZkMrrbUuaP3v7JrtVRVqYMpaR2ibWKhUEAW620BpqG
	nCS5X3xXEnQ25jlzLbHuohFyP1I+z3j7d19uuo/6KV05fIAufBQAWfPrCUjmFwwZ8aEQsIUisA/N8
	+lG1fD/LjZ20sClGfrAK9aKnzXm3jHf5/an+Cqtcm7pn5qUnbONUCbp1g/1FAd2G+xZncBFxp4sP1
	E+XyW/FmLu56tNvX+JcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpBB2-00H24k-Lo; Mon, 22 Nov 2021 15:24:16 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpBAz-00H245-QP
 for linux-riscv@lists.infradead.org; Mon, 22 Nov 2021 15:24:15 +0000
Received: by mail-wr1-f50.google.com with SMTP id d27so33439631wrb.6
 for <linux-riscv@lists.infradead.org>; Mon, 22 Nov 2021 07:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=sE1J3Zn/BMegzeESPsHQGU+VXQmDmWKb4PcYWIO/eEQ=;
 b=Vlo9LB14s6/QaEc+5bUeDEXQEOEGD4EfOHb6KsiFFLAelIgYiuzLprweQ3uCN+5d1V
 6J9UEfSzgnopAbjqkHTr3esEvH1aMDQJcSVqVDVX5l7JrOfzw7PtFp2c27wLrbrQeZ+Q
 gMgY5h8fZOnNcE2QWMHoi0YeR2jKvg5AjQMBoRfH9RLJ90YOMNNySv7HZ91E3xf4nIS7
 66g68YcvqS7NloozhpdsE9sR2DJA4EVu47TloAAZ2JNPFpEs1qx8AK+6ILopt6wZIF2K
 gLg71xXN7D0ocJUy0XropnqiKwcrePrSGIonTJO1Azgt7FI9rj58XpIcvqG6PwxNlowj
 51JA==
X-Gm-Message-State: AOAM5338MPy2hTTBraVV2YEgECgL6VHs/wdnlb4S+crXwB81QePS8p47
 lAkxafOiVZI+fxX5luBVps24L5qpfgjiHg==
X-Google-Smtp-Source: ABdhPJxWXMAvV0wpgebYC0yFLsrGNbjIZVOd8ATF1QcQ3I+zfPta1eiYXxnE6NiTIVNw8kV2UI/Ikg==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr38129238wry.422.1637594651296; 
 Mon, 22 Nov 2021 07:24:11 -0800 (PST)
Received: from joaomariovmubuntu ([2001:8a0:fa2d:4500:215:5dff:fe40:101])
 by smtp.gmail.com with ESMTPSA id w4sm9222695wrs.88.2021.11.22.07.24.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Nov 2021 07:24:11 -0800 (PST)
Date: Mon, 22 Nov 2021 15:24:08 +0000
From: =?iso-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] RISC-V: Added HiFive Unmatched PMU events
Message-ID: <20211122152408.GB10739@joaomariovmubuntu>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-5-joao.mario@tecnico.ulisboa.pt>
 <20211117142539.30fac060@redslave.neermore.group>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211117142539.30fac060@redslave.neermore.group>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_072413_877689_519C9586 
X-CRM114-Status: GOOD (  11.30  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 17, 2021 at 02:25:39PM +0300, Nikita Shubin wrote:
> On Tue, 16 Nov 2021 15:48:12 +0000
> Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt> wrote:
> =

> Hello Mario!
> =

Hello Nikita!
> > +  {
> > +    "EventName": "UTLB_MISS",
> > +    "EventCode": "0x0002002",
> > +    "BriefDescription": "UTLB miss"
> > +  }
> =

> I don't see such thing in FU740 v1p3 manual - am i missing something ?
You are absolutelly right, there is no reference to the L2 cache
(Unified Cache) TLB misses event in the FU740 v1p3 manual. But
considering that the FU740 is composed of 1 S7 and 4 U74 cores, I used the =
U74 core complex
manual
[https://www.starfivetech.com/uploads/u74_core_complex_manual_21G1.pdf]
as the source for events. Did you test the utlb_miss event, and does it
work in your board?

Best,
Jo=E3o M=E1rio
> =

> Yours,
> Nikita Shubin
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
