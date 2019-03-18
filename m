Return-Path: <SRS0=/XvO=RV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604FBC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2019 09:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FEB9204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2019 09:51:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QYrzMlHV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAUo0nfH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FEB9204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r7wXw15hj2BHm107wRT/QJ6yXjCvrhdSkQpquGqvzzI=; b=QYrzMlHVhsw1qgEPh+h1OUvnl
	x0wM6VWC9JQUOsP2wFP+iflWin211HlsY7i5i1UhC3eQDdsNaf9EzhoeIVTsj+n1o0be0SIEtG2Ho
	Wr+xsfsua9XXFTpAK6zzikHXp3MOV83BWHjur2gUYmSswIf5cyC1rUcAotoiSVKnTp42ZDrVkA7kf
	3SgRL/blMkMwjp2+n+ZsNZoakza+B1K8E/ZZjETKYLPzgKkqPoReCJ9CVw3O+2UrBI1qdecAyTXST
	yKflBz/BUjuo9lQg93e9M3fOH/+xhINBWSUV4867tYovPnHm5RO5a7PWGQrtH13WC/VWxjHmMYGac
	Kezwo7W1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5ovO-0008Im-6V; Mon, 18 Mar 2019 09:51:18 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5ovL-0008IC-T0
 for linux-riscv@lists.infradead.org; Mon, 18 Mar 2019 09:51:17 +0000
Received: by mail-wm1-x344.google.com with SMTP id 4so12226538wmf.5
 for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2019 02:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jn9DbH2H05TIFixZN45OK52MBjhjC+Xl13SJV9EtboY=;
 b=oAUo0nfHX+N4/6+NvVwzquYLJKEcb31ZB+ckJO3P2YvZYAssYlbdooN+/OJtIYRvCL
 ygEB5Z61nXn/70hUdBpYvfjOlJ/rpD5P+d/d8VGMKzQCQzcvpUxHhAO5PCGSU7BrK0C2
 ROSD87WZ1THksPyqZ2CaoC6sPiibmzmMoDe80XoCaRNeb+F8/ysVUHDlJOrG9dLCBznG
 dEOtvvUU3dHpzmSwc660+o/6OTYguzI2ftGo3qrbJdia32lJsm8oW0ntlJxMfZNBVy8e
 +uO8SVXFlRrCQh2UC8F4b44qYaIwBOLOvHTTZt6/P7rUtVADiFMbdft8nfa5HRJBZtKS
 92Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jn9DbH2H05TIFixZN45OK52MBjhjC+Xl13SJV9EtboY=;
 b=Q8ueTyjE0cSAlka5CpRpWIX/3F8OxOwY9F8q3TGYlz7REm2BPyqyHivyoc5o02u9iF
 Pk4LvnBnBJTTLWfkabBHk9n0bN2Nnjonq1nC7n/BE+imfVczLFjhsqQWHY/ClX19UejO
 UizgGbTZ2mRgDLVhrcROUGyuiLX04rpLXH1fOPSQXAQWXw0Z1v5sUlXgkCbHyg+BsYXx
 54yc1/n+QgiHR1uGFmOlpM24p4N2ksH46Yl/ESNrG456SZkuLXOu1PfcmlXZKAVFh1Qx
 eUA7l9l7M7nJmuogL+UcRKF7gikf9B6tgJN44STBvs+Ops5ZaclbJkLJaO9m6gTN226r
 5OxQ==
X-Gm-Message-State: APjAAAXwJ4mjgCwphXAk5XGBigb4KZncwAUSayr3N751JcTSSS+W/9YT
 R0Z+c6mMHqIx2YtYmT7SVnI=
X-Google-Smtp-Source: APXvYqxPvohcsuUKTFfOBbe5UQllEd/5lqU8yoROkuXap4g34hmtQwz25yxBbcWcyQGselDm45zTSw==
X-Received: by 2002:a1c:b783:: with SMTP id h125mr9855694wmf.119.1552902673216; 
 Mon, 18 Mar 2019 02:51:13 -0700 (PDT)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
 by smtp.gmail.com with ESMTPSA id b134sm7746307wmd.26.2019.03.18.02.51.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Mar 2019 02:51:12 -0700 (PDT)
Date: Mon, 18 Mar 2019 10:51:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v9 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190318095111.GA17565@ulmo>
References: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
 <1552378289-27245-3-git-send-email-yash.shah@sifive.com>
 <20190312091739.fhv2hb2ll2eamdsn@pengutronix.de>
 <20190312121218.GM31026@ulmo>
 <20190312131712.rxiarnthcfrsgdqn@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20190312131712.rxiarnthcfrsgdqn@pengutronix.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_025115_941303_2338D9A4 
X-CRM114-Status: GOOD (  24.22  )
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
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5914153026180448895=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5914153026180448895==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2019 at 02:17:12PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Mar 12, 2019 at 01:12:18PM +0100, Thierry Reding wrote:
> > On Tue, Mar 12, 2019 at 10:17:39AM +0100, Uwe Kleine-K=C3=B6nig wrote:
[...]
> > > There are a few other things that could be improved, but I think they
> > > could be addressed later. For some of these I don't even know what to
> > > suggest, for some Thierry might not agree it is worth fixing:
> > >=20
> > >  - rounding
> > >    how to round? When should a request declined, when is rounding ok?
> > >    There is still "if (state->period !=3D pwm->approx_period) return =
-EBUSY"
> > >    in this driver. This is better than before, but if state-period =
=3D=3D
> > >    pwm->approx_period + 1 the result (if accepted) might be the same =
as
> > >    without the +1 and so returning -EBUSY for one case and accepting =
the
> > >    other is strange.
> >=20
> > Perhaps a good idea would be to reject a configuration only after we've
> > determined that it is incompatible? If we're really going to end up with
> > the same configuration within a given margin of period or duty cycle and
> > we can't do much about it, there's little point in rejecting such
> > configurations.
>=20
> It seems we agree here. Is this important enough to delay taking this
> driver further? Currently the driver rejects too broad so if it annoys
> someone this can still be fixed later and there is only little harm
> (assuming correct error handling in the consumers).

I don't think it has to be a blocker. As you said, we'd be giving users
more flexibility, not restricting them, so it should be fine to do later
on.

> > >  - don't call PWM API functions designed for consumers (here: pwm_get=
_state)
> >=20
> > Agreed. The driver can just access pwm_device.state directly.
>=20
> I wouldn't do this either. IMHO the driver should only look into its
> hardware registers instead of using framework interna (or consumer API
> calls).

The current hardware state is already the software representation of
what the hardware has programmed. I think it's fair for drivers to make
use of that in order to avoid having to read back from hardware.
Especially if reading back from hardware might require switching on the
module to access registers.

Thierry

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyPagwACgkQ3SOs138+
s6H2nxAArlQ9omVBBACn60oV5Ix/6fZlOeffFJBYaCFea3XjU38SSI1hS3QM75JQ
B55cEC2AKQy4vQykZmTBPGWhit09tKv2MXwLMwKRxEXktC/wxNc1MTh7h9MeiH9M
LJ5iL7wwGjyHlzTTVA5r+lgU2Avg8LdXeex7hgo5rYrDEPu9sDglU7eO7YUKhHX1
QsTeKgLoFE1Ne38PbMBKA3nA9llcm6rdrhLLzss6Q9+wQQSYuPYToSH/pHWqo3BL
86JqYuja7EQf26BJMiA5aOdyq56IdMtD286XDV0+VGEiih9WQZbKuhUKMIHSLH9C
YgN3oPonjvVI6xq1aEHvp1n6sma2vbFKX+nvOeOGmCizRAY/gx/UzC3M44y9JQWO
o0jKCgtnJr+kYn8GFDqgQBNwhwN9GtQ7Bjv+lXqPIdnCUjxgtzLW1VxsXccz5w9+
o1SmJOAmBIfV/bnwhZpMiSoSCl3pnm+ohjBh3Qom2nIJxgmkV5xesPB06phijNZS
ZEzh2hUcpvAr5+tH+WxRysRp7Ee6w0KVzsyrAsezgxth5f78Pw9XRJyPnQy415Pz
4IlmHDoinYvDcOn0ZL6odF8rirlBqZ7lmOK2av0LRix0XVV02Y8FTZ2LPepHOZSV
wXcHzBhpezIG65ICYL6SFBDfiIDLzWuaDr9WIRJn0RYu1LxpdGs=
=X4jv
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--


--===============5914153026180448895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5914153026180448895==--

