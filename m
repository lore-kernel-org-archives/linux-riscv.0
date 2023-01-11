Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFE7C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 15:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmlaFrrQVRBb9jQsjDq8dQHr2kZuXhB/+VpyA1CXxfw=; b=ijh8dYTVtc6kgk
	PnxGf798TvbWx42WADYGSL18XbgnDGmOOeYdA98OgP8Es39iFBxnATyy3nZNAIK1PRnnkDfwY1scI
	Bf6MIcdZwOf9h4yLFoZaF4HoS4fuB03CCeukoq9tkXFIlJKRO/Mf4Y2AFnGXI7MhfQqSBAyy7Y6F6
	AKC25IZacprvs0LPN9Uqhcy9H5Ah0sHJX2b7jwIFXQUgUv3DxOgoKpnbDtUsqeMUNcXscgGJQHe4K
	3X8NGD2bTsPQJeBGQtdHrimRBKoM+3hEJnBCeXIvL9ZJ55olnIKLTqYnSrf5TgJ3jb37rqo2nMKIZ
	vvv6vw/FvH6M23960y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcqX-00Bxj3-5P; Wed, 11 Jan 2023 15:16:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcqV-00Bxi5-1j
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 15:16:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id ay40so11341514wmb.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 07:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLYu7JZjSPYrkdEiqoSzsvQDLn0Yg++PzX5NPFhTCzs=;
        b=j4a3u4KowAwwfCtsvcoygmrOCBVYHgpxzxdYmARtDFlcVlRspwIy0oy+5ha5EuhHPk
         tLAxJPQaBSeFarEg0AC7+DnToVKB2tbMLVxN7/2v631x0RUFrNmNJzUjpDEDZqwsUeTQ
         nora2c917vFrgKjocOYQrIdNP57PC+iyIlOGVqKSvHi2+qUUhZ+YtVeOfTiy2saQCHeI
         LqRpM1kWVfp+6vZK+RUTfToEy8P0uQCnL3nr06BnfCIcuTL2AMVVDmbqHCHel9gQ4wfp
         55IcNeKZuWhCvkx7917Fq3bKQRtWAJUEY97jNIkjWU0Q1QeE9L8QPtdaUTzHEP6U6zwR
         Z7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLYu7JZjSPYrkdEiqoSzsvQDLn0Yg++PzX5NPFhTCzs=;
        b=U+tjY2aaROOgnVJrCagol/Pkdo3LpDPOvNW9Qy/pp7Oo/Ws5IAJhsJaI7l2kkFHAbL
         q3imfmKQ9tZ7JG3AtFO6MAn0Cr4l8M/i7+hlwJMrlRm0Vis9FhoJyo1THRh5Ger4bviU
         DkaI+6Qk408WncNH6olZxC90+V68tr/UkLmQLk3CbFxKDeKwwsI9RtU37V4RebFcAThc
         siGLZJaDE4peYx8aXix1512+pxc8ip3OapyBK7emmccK6waButKgCfg08WjEiQqh/6tD
         dFdfo9pgHUQM7qIKay7fdUjtLM0zzhfk7FN9lgsOXpKm7hSCuQrQfzrNIhKY6cG7ugIT
         J3WA==
X-Gm-Message-State: AFqh2koQUW2HRWjCFWgiXNY/9yCLFWYzHx7zScBWLpiunc8FylXrmJM5
	9k5BHSzbXB21GZoswRNUfmmnLg==
X-Google-Smtp-Source: AMrXdXueO9blAywf8bae1s8lg89HjLTXZup/ewftUjJ+UV0MWzlH7m9mRfMrFMG6fudeOvGN0p8QAA==
X-Received: by 2002:a05:600c:348b:b0:3d1:f16b:30e6 with SMTP id a11-20020a05600c348b00b003d1f16b30e6mr53162260wmq.28.1673450211951;
        Wed, 11 Jan 2023 07:16:51 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003c6f8d30e40sm26370492wms.31.2023.01.11.07.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 07:16:51 -0800 (PST)
Date: Wed, 11 Jan 2023 16:16:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, conor@kernel.org, philipp.tomsich@vrull.eu,
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 5/5] RISC-V: add zbb support to string functions
Message-ID: <20230111151650.wq7ly3oht7edrstl@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-6-heiko@sntech.de>
 <20230111122452.ubgebzhkzova3hte@orel>
 <CAEg0e7h99EoYi1RM1GmxiRKTJkh1kgCc74ut=TN0vY+kWL9XcA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7h99EoYi1RM1GmxiRKTJkh1kgCc74ut=TN0vY+kWL9XcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_071655_109737_5CF7D0C4 
X-CRM114-Status: GOOD (  12.66  )
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

On Wed, Jan 11, 2023 at 03:27:28PM +0100, Christoph M=FCllner wrote:
> On Wed, Jan 11, 2023 at 1:24 PM Andrew Jones <ajones@ventanamicro.com> wr=
ote:
> >
> > On Mon, Jan 09, 2023 at 07:17:55PM +0100, Heiko Stuebner wrote:
...
> > > +     li      valid_bytes, SZREG
> > > +     sub     valid_bytes, valid_bytes, offset
> > > +     slli    offset_bits, offset, RISCV_LGPTR
> >
> > The shift immediate should be 3, even for rv32, since we want
> > bits-per-byte, not bytes-per-word. The spec example uses PTRLOG, which
> > does imply bytes-per-word to me as well, so that seems like a spec bug.
> =

> Correct, that's an issue in the Appendix.
>

Thanks for the confirmation. I've sent a PR,
https://github.com/riscv/riscv-bitmanip/pull/182

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
