Return-Path: <SRS0=gYOx=TW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB1FC072A4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 04:59:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41EE3217D7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 04:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lF9oQ2M2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="itsCJKdw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41EE3217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffLxAPz9myxZVnM2YQGLJS2pe5A2jMzbEfdbFEUeutk=; b=lF9oQ2M28Tdkuc
	IOm+9bIhYRSCwsgINFzACNRAoIM6P7LbVNXMs2RTQ4b5cPCRCaB6yW3F5nyNz0u9VEqe2nALzhBZz
	l5HVKdU/HIGmT/7w/4XCRrScgSKMP5MOvWMHNe5Se1Z9aAp02h7z47Ya5ICRuJKe3csZGj4ez4uGs
	WcGViWgNNY17ErFkIg4iDJ5LVECVoK++yQNOObL+O8w01uqWeFSVih7VVzXrrr9NnVkQTCm25lMwN
	IQ1TtaVAsfHrF16CH53ec8fADvkDn7NBTPEQwb6ppgRoLR38arH+gXO3JqZiMVe62E5JK7m5KPW9I
	s9Pkp6lGpd9Rx2PD6pvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTJLN-0000o7-SR; Wed, 22 May 2019 04:59:13 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTJLK-0000nB-4P
 for linux-riscv@lists.infradead.org; Wed, 22 May 2019 04:59:11 +0000
Received: by mail-ua1-x944.google.com with SMTP id r7so426805ual.2
 for <linux-riscv@lists.infradead.org>; Tue, 21 May 2019 21:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pfnQkeXApE9YhAL04oZ9pUNXjKBFEtVB3H8ZellBg+s=;
 b=itsCJKdwgb46ITQkTRPoR292kcfck5T1rUAFHDfske/5D5WuP7F7P3FokSkTHFunNf
 7YQ3BXR/Xmoj2jTOP1hfkdJt1lDEmYafTUxvNuFTUleUmyq5ofyPgY6K17FZitXLDLBW
 kj+iGHmuoeu+c5e9mdy7m0/Q22dVjzeQz6NzlsNr3bF2uX9x2lqdQJugNy9c/inxvahE
 s9deVGS5LGzqxTmCVeVTiUYlsDogXeDmD+B0siLITPFo6hjidNKTbr/yuKGPBpmo54LS
 E5sF5haPxlVlTjHw49x9ASoRzcJXsV2qcr4unFMySxZUMuUTc6FwsM1+q3P1NiMcd6AM
 6oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pfnQkeXApE9YhAL04oZ9pUNXjKBFEtVB3H8ZellBg+s=;
 b=ZTqMUaG/XQNQ+gilLDRZCWR5f91o/Sh7brH1gPWdDb8s8wo/XZOXLXlpN/8xr9g8dc
 66Gkpgcnz7VF5pjMJdbdL52SumJxitUFCebCAKc1cXDBXGql1DS+fBW45uRikcNUSdWl
 LTUODGS0pSezsnyCzy0jf9fhSNq5ePcZPaWmcj9w9C09fjNvRVWI5ztU3nTHGpY5gAkj
 rlqPflDozsFQDbhccrSTwUlVKo1Sz0Dx9nVcKbJY2W6O7IxcLzQnIFIhK4INxwi6yOAY
 9URgPoEUaDFytNFEFxy5HNu8er8C5bLqZ4YfYgHI1g7Ic0NVbK379nQxZIIamdJGb47H
 SKKw==
X-Gm-Message-State: APjAAAV1j/QH1tpdZjFEm4cx9a83zgbF6cvgFtNUXveFyh6ZUklkEl0t
 iuf+TVy7ZKcEobqCI9Qwr5AMA/mvx6jNNIWhLFwyVZWIYmF8yQ==
X-Google-Smtp-Source: APXvYqxVjzH04GMwRGsl2rdzhYHjRj2cXzo6oi7TYlti/cF3kn9df3BQ4J7NHUBk2S9snvBN4LcYAu8LQxGMcT/lIYg=
X-Received: by 2002:ab0:3119:: with SMTP id e25mr3548887ual.96.1558501148962; 
 Tue, 21 May 2019 21:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
 <1558445574-16471-4-git-send-email-sagar.kadam@sifive.com>
 <20190521135439.GM22024@lunn.ch>
In-Reply-To: <20190521135439.GM22024@lunn.ch>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Wed, 22 May 2019 10:28:58 +0530
Message-ID: <CAARK3HnTkpkH9rP4oW456V6KYsCah7-gAXdjm5+3cLwJaPs6tg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_215910_186076_FE40DD8A 
X-CRM114-Status: GOOD (  11.81  )
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

On Tue, May 21, 2019 at 7:24 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> >  static void ocores_process_polling(struct ocores_i2c *i2c)
> >  {
> > +     const struct of_device_id *match;
> > +
> > +     match = of_match_node(ocores_i2c_match, i2c->adap.dev.of_node);
> > +
> >       while (1) {
> >               irqreturn_t ret;
> >               int err;
>
> Please keep with the idea of i2c->flags, which is set during probe.
> Just because it was removed because it was no longer needed does not
> stop you from putting it back again if it is needed.
>
I had modified the implementation, so as to keep it compatible with
the new implementation of polling mode.
As per your suggestion, I will keep the older method (the v5 version
which you Reviewed earlier : https://lkml.org/lkml/2019/5/20/1261)
 and submit a v7 for this.

>        Andrew

Thanks & Regards,
Sagar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
