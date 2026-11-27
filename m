Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32856606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S/l5vCyV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=udXPH5Co
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/qcfidq5ZEtAYRNFfWeGn8AxguyU/kJ5v8Q12K3rrvU=; b=S/l5vCyVgXa03DGHV9nnzCr9HW
	ZhT3RfzxNLrQRr5gFvtt7obXAAvXhGzy/Qk5ZBcB+3Iq6hIb/5c3NeZiHed9bXb0DY5A/dR4mMMKq
	9LES/Mk8kyG7yP6f6ZiFhabjmhOxUad9opArig1Dw62kfn8z/MIGpUW76Ho21EWUQ5JODE1Anly/k
	436/cKaectTwvjcLfSAaGvZCcXM+X1lt8y0Oukw4PoXQg+cwbdzw+siRpKflSISB5q0ASecD0O4Kg
	NedCSXOA+gPG2H5kFJtONiVHkn0by6n5llcdwE1KuaC23MhZhKXsnPl9BjRgLLrUKWvkg1gaHFSo4
	he54T0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWp1D-0000000Ezh4-09aK;
	Fri, 27 Nov 2026 06:01:11 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWp16-0000000EzgG-0UpK
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759205;
	bh=W5orpNQRwzUsBFtBd4lKgk0noKXsQvGISmKxvFmwlXQ=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=udXPH5CoHvXAfxhAFIvhAGd1cAWKjuWGDFGZ8Bj/GnFrorSn1XB+O9oECrCJTtKrk
	 dO0MQo0gyq5RxnnilQYu7cID6Ujhmb9NaTciIBBpJjkJEeGNOEKpz7kl4bYAebtrkn
	 lYHjMzRgx/xWuUZ6HIok6eQzdVQr/4mnszW6X11o=
X-QQ-mid: zesmtpgz6t1795759198t02bcd124
X-QQ-Originating-IP: CyiqXhML3xAjxSMuZRfc6KNxWUfRG9AMsUIeo1bcios=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 13:59:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5876352062716450279
EX-QQ-RecipientCnt: 25
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 27 Nov 2026 05:59:54 +0000
Message-Id: <DN5RI93NOUY6.2TXJX73EU84KJ@linux.spacemit.com>
Cc: "Alessio Belle" <alessio.belle@imgtec.com>, "Luigi Santivetti"
 <luigi.santivetti@imgtec.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Baihui Liang"
 <liangbaihui@linux.spacemit.com>, <imagination@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device
 node
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>,
 =?utf-8?q?Fr=C3=A9d=C3=A9ric_Mah=C3=A9?= <frederic.mahe@cirad.fr>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
 <20261122184434.545341-1-frederic.mahe@cirad.fr>
 <CABdCQ=PnfXRd2=b6_yEN94RCRvPnWx-WFfHZDC+jhHv_UFZ1ZQ@mail.gmail.com>
In-Reply-To: <CABdCQ=PnfXRd2=b6_yEN94RCRvPnWx-WFfHZDC+jhHv_UFZ1ZQ@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mdw6+lqugK2CvZJHCS1LrDPF+Hj9qgBYBDw/eWVDA3sRaPVNAzBOCiym
	Yiey3YYUnX/+MQfYoOO9hZHqKcD0OCc+5PF5yGdx+hFQdS8dsZzECJRZSgm6+IzWDVWipUt
	GYtP7GAVRKYkRfmrKmI7BmohM/+lrWI31C0OiENSUIgv0xlJIaUT9Ad3zJdGTAjdA84zVnX
	AR8A+fUn2GYXkmsASkqYRiLPv0zKHY70X7KY2KsCWE004YuQcPvZtnvG8OIcFwEbP4PHVJe
	BjUS5vyFHfO2DGdevuj1Lr43ndVT1bmFSAwMUfXJHD4kquG6XeDDmrGaPg5TXZpm7muWEM9
	i2xinTQfNF/JZfW8AlYK6jUlbDEy9+gmg8ug9Of02RuqffqPFjS0ftjwmtJk6p2B4l6GQ1V
	NMNZDZx3j2ubfzstl7gI29g7OIz3RkNMgZ1EHSu8Mo/Kfu9QKe+RMutHgLu4YFKAFoep5Ro
	3K6TQgglINUVhiZvg8QpQY7Y8/Vc1I7nr5fAzQrHHaM+I3eLzzVUudoXTtZiJTQ1FRhrydi
	2z6bxRpo7WprihcQta8hwu3R9GBLb0mBHNXYI4IhD0CjhoAJZinOu8OfGof/YAkkxgtSn9x
	s/cZWZwIYvlEpoVSRVyeGm+U72Dk7Kb7TXGHEyzJxLAA2gz+czKJIe2SCxn16jmOEumqte8
	TkosUE2o4WnXGN1vTglvdUZgatGc6KvqsX4D+NrNbbjTEJ5ZZDnvrytIVB1g0qY9rO0ukeC
	hDDyRqwMKNA4sN1EukMGsJuL2smOUvQZM+rARFquFx3n7+vKXlnnDmQASijg9Arwk0X/9+F
	IS1jGg55tDuGZP7HtoMyRM4OKqWDeEiTgPloPo/L82VFt7n/XVvN8e/hw/3EliQJVUt/YQq
	Hr8ANf7CwpiAbgEH14V7eCt6V0W+w+9NnW15sO8lpj/dUHgadJUrbgcfy1RykCwA8D9qe3w
	WK6vvJrEjztaClHofTqDPk0/03PdXyDVAMMjPNn61R+uAZlcUDwlnuZqe/mwkT1E6c2fALt
	7/pzvGwt2ksHOfCJL5lQknHdTeJOsTJfV13ofq8BcRB2tXTlJxXKEGFz+mZcecM/Ne1SR7l
	w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_220104_632905_1571431C 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8306904162924179285=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8306904162924179285==
Content-Type: multipart/signed;
 boundary=d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 6:41 PM GMT, Iker Pedrosa wrote:
> Hi Fr=C3=A9d=C3=A9ric,
>
> Thanks for testing this on the BPI-F3!
>
>> Two notes:
>>
>> - On v7.4-rc1 the driver refuses the GPU ("Unknown GPU! Set
>>   'exp_hw_support' to bypass this check"); with
>>   powervr.exp_hw_support=3D1 it works as above. Is a driver patch
>>   adding the K1 GPU pending somewhere?
>
> You're right. I forgot to mention in the cover letter that I was loading
> the module with:
> sudo modprobe powervr exp_hw_support=3D1
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkcWiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9jPwEAkEDYQ/DUZqdM
7fO73JXCHzzyxH2RSvNzzjPHVh6TJCAA/jY1bbDX9rE04bGONDjWVzwEHNrfpRKP
pCll1aV1PnkD
=NZI6
-----END PGP SIGNATURE-----

--d1ae752c97959d5b8d8cd87d8f8f5410d469b0ecca2088ec5a8e5567b25f--


--===============8306904162924179285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8306904162924179285==--

