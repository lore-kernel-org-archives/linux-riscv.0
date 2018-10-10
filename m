Return-Path: <SRS0=k7QB=MW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499DFC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:51:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 198912086D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dWJaewxK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPxZ54e2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 198912086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HfcMP7cggvQkjQGAnDk5W0XorNH8lBdqaN76obHHW08=; b=dWJaewxKmB4ZHIB5+c2VZkGYQ
	9GFD+xWNfxmzwWi7DgDSrosIhWvleKTPZLyaqA4MPMJwkv9CS4ILu2rN3e0L/iVvSARncBWK4P1NX
	pN/w+orJqoDY/8sib/H38hfQhvnEFLk+gJe97mSGsc1NnJuNcvQBy/rPtPefEbQOAM53lWXYr4ZNa
	tbheiggGjET9F//O/YdDeZQhQa1tMyVj6A2vm3IGRZArPliI5NE2qstY+Xhviq5MH6lvnMLXYbF2Q
	vUHc86jJUA3qLxNDq4CKUHV+gJ+LASt/yWJxAdqItFws4LzNtIYyVu46O9UKc3PxCdTXRdiY0p7Pa
	PFuswmW5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAEtY-0000XT-Sy; Wed, 10 Oct 2018 13:51:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAEtW-0000Vr-MU
 for linux-riscv@lists.infradead.org; Wed, 10 Oct 2018 13:51:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d2-v6so5845381wro.7
 for <linux-riscv@lists.infradead.org>; Wed, 10 Oct 2018 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j5FyxAyXKseeKZutFLAjQ5ObTg6PqV8DUYvdcx+/S9c=;
 b=kPxZ54e2GgOG63ZPRubSizgx+e8IBqYmnmH8uaKu6blD4si1IOpLUyJXwuWb6xq90O
 3Z2C/Nupiwc4vZqSLoTuSdYC3bSV1WpyT4Zn0vmJURslyQNFYEaaOqw+kJj/q+eCqk0Q
 0t3bwXYrAjD0QFnYHWf/zq1jBdbnkiCrHZONcoBqmxRPnCLjC5I/nj1oNnyhsMkDcMHR
 2E7xH+2gEt5gA71tR+lhIDMS9OuGcHbU5MwUQMDtNRk4S31lpK7IXo/q6tcBfFug7Ad0
 XtzP96fky6AsiUuvjvRr+CltTRrPSauYtFJcW63T+ZpmFP0vkHKNqZwrfbrNqOAlTAgk
 +Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j5FyxAyXKseeKZutFLAjQ5ObTg6PqV8DUYvdcx+/S9c=;
 b=gmEyHQKrNcWgSl3H4Toh++czaNpyzHohVQv3rI+GWoLgqhW8OQTvwBfcMuq3g5Q0aJ
 HBuGNIlHdbcNq1LTT9uE4i3wSQK8MmWAGapkAGPKKf2G9UQaf1alRNOOq4F4U3qD/6ET
 /BeEDdMPq4pyFSd7mK1czqBUjmG+k/j0rfmFTL1WWGAPH9G3JdwavTzgXzptSrKzKz7B
 0HFUO/caPZExZD5cWpNskoyEwpU4dzopMtiiKDwIOjRdxLSF5L7m0zCoGpdtPFwKbUsw
 Ga/18cBxxnMqAYtYwlo5Hsr4l72Bv+LjjZWacmbUTnu6Fvf10Ikpg+aPByrVaUjtr8BJ
 Sw/Q==
X-Gm-Message-State: ABuFfojjV+ys9VeiKQfsomw4Ru59xi7GfMXj4DxPp4FpYK1pns95VFqI
 7LFNgRvT3R5FwzhQKYUrQ6w=
X-Google-Smtp-Source: ACcGV61kebs88MK6K7akNu62uoOLl8dP1sR1h4Q0AqHRJoLnzdHrmF+qt5Rkmj4b/NMxIg9D0a2/HQ==
X-Received: by 2002:adf:f941:: with SMTP id
 q1-v6mr5139709wrr.151.1539179470760; 
 Wed, 10 Oct 2018 06:51:10 -0700 (PDT)
Received: from localhost (p2E5BEEEA.dip0.t-ipconnect.de. [46.91.238.234])
 by smtp.gmail.com with ESMTPSA id c64-v6sm12826142wma.44.2018.10.10.06.51.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Oct 2018 06:51:10 -0700 (PDT)
Date: Wed, 10 Oct 2018 15:51:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
Message-ID: <20181010135109.GE21134@ulmo>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
In-Reply-To: <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181010_065122_738229_6823DCE7 
X-CRM114-Status: UNSURE (   8.41  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4258501399244315376=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181010135109.cZrO53L3S6GtgXR2G12TDpp3YNexnV4LJEJkkArCjoo@z>


--===============4258501399244315376==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n+lFg1Zro7sl44OB"
Content-Disposition: inline


--n+lFg1Zro7sl44OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
[...]
> +- interrupts: one interrupt per PWM channel (currently unused in the driver)

This should probably say what the interrupt is used for. And once you
have that, remove the comment about it being unused in the driver. DT
is OS agnostic, so "driver" is very unspecific and your claim may
actually be false.

Thierry

--n+lFg1Zro7sl44OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlu+A80ACgkQ3SOs138+
s6Em+A//YNUERpXON1hDSTruvUjUYuyLVi7AhJJCbc+1AadlHjGwaLrId2I1Tjy0
3QoZUDLbpHx9hzzH9wYy7XoCQQsL6HVxEhImolxeeUli89A9SBW0zpPWXayYWdtA
k+fsVgAPYEiEjuqtvfxjCc6MLpIosC+WJa8GB0WpxB5vFC5BzvDwB7xDOr10hETO
Pw2dKKjmWjG3WYV2jk7Vx7W/qJDOoK16D3VyXgkxwg1YfKRGsZAiAGIC6IREFiFj
EFGxaGXDfn3tpoP2qUrnCBFAfwUAZ35GT7c+yjpiQKhRnUhv9y3M4dm1xEJT5FG4
oGhWb8ZAN/dejJf3QuIX53uD09qdqJ2/hfvO5YPYDa7S/5qIYJt9DXl9h/aMNjB9
HkGMFRRwmh/LaZYE06clCIayuYOwDpLtmbXhn8E9+QtxIR1PRXBTK7V8bsR0unvN
pREDxvjSRvDxTSH7sNxADnEouktJlhKCfl1iZ/rMw+9TavqkgIxD60+CvIlp2gnd
cYvEUDkqvLEAHenkICplYiIO7EgVPF36GLdy4UoS+Lp8zIHKfQa6ReCZTPiJGux4
pGx6NOojw9tGhf9F+SR8QLIVbEHKzNbdvXafV2QMmKlOpLnoOMmgSapXdETznHM4
sJKEO82dlN0kQ7uv/wV4wO6RGmXzHNdkSvngHsRrob6+yfPWRdg=
=osbe
-----END PGP SIGNATURE-----

--n+lFg1Zro7sl44OB--


--===============4258501399244315376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4258501399244315376==--

