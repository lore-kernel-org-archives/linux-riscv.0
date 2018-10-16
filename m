Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E60FC04EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 11:13:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FE5F2083C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 11:13:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZCWSdqtW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLDfKh1+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FE5F2083C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PFfUWOH1b+egUCWyag0vLsYHp4K4SYZWSbHP1juqiUY=; b=ZCWSdqtW5h6CJMSb5UNVtWkrZ
	QU2ZoYRP0gYzz9smkrF710Q3pnkywekHQU86sEbfMDcBq0nmmvFH/0xWsBD04wRqkXMi5/0gGS6Y1
	7r3EUfIlIYzfiXCnqPFyoDdSOgSvnLvu1xz53FfniwLvByiq2StpEJRFOWn6/5rBaf6n2ivfjyD4z
	QW097zok/kHaUuFCC+4S9eIj3NeqbxPRx9cBJyZLi8gfdASS8hNo86CpxfbohZoyvhku98paIs/mW
	jmZR8SXN8kcXqgw8lpZgt/wlRGJ6CAwTwuTo2UM8h/klT9hWiwRDj21DtW++BTwISCtb3n6CnToLv
	tSr+eYfkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCNID-0004e3-DP; Tue, 16 Oct 2018 11:13:41 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCNIB-0004c4-19
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 11:13:40 +0000
Received: by mail-wm1-x344.google.com with SMTP id 143-v6so21855832wmf.1
 for <linux-riscv@lists.infradead.org>; Tue, 16 Oct 2018 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4je4xhXUCeLf8WgsbR+Mno33Kmekkz3UdqSRFHJ3HPs=;
 b=kLDfKh1+m47caMGRW8CaYkQSRo8Oaky3+rOBBamCWNj4QStSP90ObSv6FYVHl5a5zA
 X0IsJPV5UPd79C4e1HGdqtupUkS5FBhjuKRDjzx0gtU8nEBROtsLwjkUEzzijB5oKnVZ
 BdKyOd7hUka9GrRL2gQZPVQY7rkI2ooLS+5yllGXPNCMEczrwuXdYqRicIAB2u7FUwEk
 2F4ge9OwPqaNrKfFmWFkEtRUBQAG5t/Sl1GnEiJe9mdvAvAqDD5a2Ik1g/ugX7nMLjTw
 0ikYfvtlMPWoQZbcMdG/5zREisQQZDOEhlG4SXt9hWLCuXBTGq+tCTft2Qn/+janivIc
 3wVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4je4xhXUCeLf8WgsbR+Mno33Kmekkz3UdqSRFHJ3HPs=;
 b=pkq6qmyqBTOPuqsW6WmX/N2b5/V8/CLSiRzW61mA2UG+rWSe0v+XS77eWah+njB5bA
 0Tgc1n2NGG36LFSbIc+KHa3YTUoprhFAOC58qsesGHqGPEnKg6lL643JMWzkszKWH8aH
 ld510KaOPbQyBZImmo5q0wxrQT5StG5Z2+ZDCZjftVfpFTWxdS/XNB5n9026VOAVdRoI
 IxNqIlxXETLFzPAQ1lzlpHonTVtwBWR4PRKBUlyUSEK7O5+iDNycS1vrOyMTtXgZYdim
 tw+eVqSlRfI+coUZafurNYmfhj7S6i6eUdiaDljpDpXNyfmYqLSf1yJRMSZd+uvWbZxz
 OVcg==
X-Gm-Message-State: ABuFfogrtXRxZG6Rw1Oude/Zuvuaf2XHwpAHmKB1h8KmtO7tinBqtsI1
 cm7ZGjNinVcW9bxoq5nWP8Q=
X-Google-Smtp-Source: ACcGV6145tiwAzlh1H+MH5aPV3aWH+hPaWsbcomVP0tlsCTyYuQhmmvNu+WC69PzMzpHmjb/5whPNQ==
X-Received: by 2002:a1c:ee15:: with SMTP id
 m21-v6mr16157442wmh.124.1539688407082; 
 Tue, 16 Oct 2018 04:13:27 -0700 (PDT)
Received: from localhost (pD9E5106D.dip0.t-ipconnect.de. [217.229.16.109])
 by smtp.gmail.com with ESMTPSA id 143-v6sm12746627wmv.6.2018.10.16.04.13.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Oct 2018 04:13:26 -0700 (PDT)
Date: Tue, 16 Oct 2018 13:13:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Wesley Terpstra <wesley@sifive.com>
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
Message-ID: <20181016111324.GD8852@ulmo>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo>
 <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
 <CAMgXwTieXNa13_xGp2mkw99+VJm-R1xrxMHSmRLZV-hG5oSdzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMgXwTieXNa13_xGp2mkw99+VJm-R1xrxMHSmRLZV-hG5oSdzA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_041339_074663_4F7699FA 
X-CRM114-Status: GOOD (  18.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1031875157555973572=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016111324.EM9syEbRh9LhSYxB0wLFhdN1HkxKBYykaP8kYkX7Luw@z>


--===============1031875157555973572==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Content-Disposition: inline


--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 15, 2018 at 04:19:20PM -0700, Wesley Terpstra wrote:
> On Mon, Oct 15, 2018 at 3:57 PM Atish Patra <atish.patra@wdc.com> wrote:
> > >> +SiFive PWM controller
> > >> +
> > >> +Unlike most other PWM controllers, the SiFive PWM controller curren=
tly only
> > >> +supports one period for all channels in the PWM. This is set global=
ly in DTS.
> > >> +The period also has significant restrictions on the values it can a=
chieve,
> > >> +which the driver rounds to the nearest achievable frequency.
> > >
> > > What restrictions are these? If "nearest achievable" is too far off t=
he
> > > target period it might be preferable to error out.
> > >
> >
> > @Wes: Any comments?
>=20
> When I last looked at this driver and hardware, I briefly considered
> throwing up my hands and pretending that this PWM device had no period
> control at all, only duty-cycle. There are several examples of PWM
> controllers in linux already that behave that way.

Can you point those out? So far we've always opted to refuse changing
the period of PWM channels that share a period if it didn't match the
current period.

> Most of the uses of this PWM are only going to care about the
> duty-cycle, not the period. So failing when the period is unachievable
> seems worse to me than just completely eliminating access to period
> control.

I'm not sure we've ever tried to completely take period out of the
picture. You could probably do it if you use only the atomic API because
then you just leave the period untouched. And if you have a post-clock
change you just need to make sure to record the new period and update
the duty cycle so that the ratio remains the same.

I think that could work, but I think it'd be best to be explicit about
it, rather than just handwaving it.

Thierry

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvFx9IACgkQ3SOs138+
s6EG5Q//VozF9Lk+dGPqd7hls3pRBj6SyqljD13wEXsC+zLveuBBDKtOFvJ53yYj
A5PxNzKHGdfFcEm+WWNthJezglWFUBwoeiJVmOkuhHSTAwSXr+bhKjPRzPyRssNe
Av0PZyxQ9yB9XsmZSZrixTtGT6XpAW3MB/9ha3G/PkL6lEM7mI1rCoA1riiZsnpq
gX5v1d8+lizsAJMYIDduyAbyB3+zvpRwtrQSEuM+p5pwpQBZhZiEI18fXOazDGmF
p0FCHWwRTXXlVN2gOk84+Q8/mXRFA35NqbhTJ6yrqavZLd2k7nhwVr69N1bw2DQC
PzdzYM/JD4CowrfzpAnNG6ysqvkzh44zQB0uHhF8dDNQC+JqAYReUNH8/JjbHqd/
cuI21LU5l0mBgMyza9Eal+WwXXMe/tppz9CcHddMEke3RUXDo+MRHDNtphid/sOf
TznJLIAbOiOGsoUfyoHycbEh0xmMiNoqnayt7sUvdzoKSxi+HIwsvVbsPMvlqapM
qGq0t3q/gK19MiEG5yUEhNf3WzhJCGMdJKcnlAzX8chKA2nrmIGvBIr29TUnPo8X
cMmOUncqNkQ3oj9ypACk+9ACXNAAQoupww+fLQZ/0V6lm4BM7JjLRCpsxPqKjYhK
nbW9AskHYjXg5kVVMj7/GwwdXNXV9Q/iWCxax2JxY8bsuXuxnMk=
=DuQI
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--


--===============1031875157555973572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1031875157555973572==--

