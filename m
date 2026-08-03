Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11753C55174
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 02:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lquv9uFfDt6yJodu8cTSgEWQa9OIpe/DzBCY9KphNH0=; b=CgWfvZEyv2L1LCn+8fE1oG4tBU
	+pUzrqhb8DE/HhsBzt7KqXxUXqqfJsl4iviIDkSpwJezLha9ZXJknuGaqMIEc4x6sYqZ1BKAmPgQT
	Gob2and5I9fByQPrExMPkxCkjZZ3RaietQXJVFhAO1xOGLZET6FbYgond6ATsJSAYzcyi0PxhdVEL
	x7/FS316U5TkPS53Z+mO3b0v/lUtKcfpAEZNHI7Ab09dNSbKxd5fAipCIM4E/oXO097d+rsnB/XqA
	TOYpzR1YQc/pyxe2ElGMDDIyRxTW3lbr6Qz6rZJTo9WQkMnbyq3wEed9prrxWyXv9pIERNnyCR9Z5
	fryUyCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqiRp-0000000GCDv-3oUL;
	Mon, 03 Aug 2026 02:30:37 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqiRm-0000000GCBQ-1ENF
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 02:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785724196;
	bh=XreocC4a0nsXO2Wrw1QqhlxohulSMdKlZ7zx/VQQVog=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=m1CBmizWt/4PsM/lTkZDlkV50o+kOB+1IKhfgD0/B69rAGNWZZ0SEz2GyIrEfQOSh
	 RMlQQf32Yqrn8SNb+FwkZ2dwBLLJVYJkVRo7kK4b5yq6QIGg1ApmhSAnRFqb0rNLcY
	 aJShoPqkwpt/j5hpbRq5ouTJ0kj2wqUblLGVUAB8=
X-QQ-mid: esmtpgz13t1785724186td5e4bdfc
X-QQ-Originating-IP: Rhdr5C5Udr9yd4G4Y4lT5pqjZ0A4wVk50i9uCzyoX6M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 10:29:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1045208562662155205
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Sun, 02 Aug 2026 19:29:42 -0700
Message-Id: <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "bui duc phuc" <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
In-Reply-To: <20260731101539.36290-2-phucduc.bui@gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
	<20260731101539.36290-2-phucduc.bui@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MPAlP4yRn0xgfQMun6HwkIilx1fgJ3pW3bZhKHgzpHnuTUE+EzLinP03
	i9WM8801c3yu2jwmakniSR4WJpovXcgrAGQhoVxhaiPcHHZVFbwIaxRAlfvYm8lndvbYijD
	fpFfAplk6qziDfdVO3vYAbdEhFF8W7gY9qm7coOulUCu1osnCrx98c2eHPpD4B5fEUdQlGY
	RjfTnhEXG4MuBxtiYrovbgnOCi9t1tDLqQYtvUD9El4fXzZmB3StFSAp9bYen03wVBkofc3
	ypgPMBk36KiK0xz+f2fGKxq4W+HwcftG8RGn/HxrlJRf60nljAZvsCG4sw2P2QEf3apbGZx
	4zPZ8CrLuQblk6rctFvBIid2uCtACde4jHtDWGnIR+IWjR2AtYqBsZoN5ewqh4xWkOUVsXE
	SBPS+ccmDTw7UMBXuV1/672JIS3AEn31+U9LORU8VvsaZfQT8k7B1LJl62m84Pz1K74iOdI
	+8tfXGmvP70hHdw8l8QfOWcWf9Fze1/QoYZkOSFpIs4GKTpymw9tXDpH/6tt7MKFtN+mRRo
	0794dB2j3f8U4Hq/kGO+0Ixtee98uK1rkf1S+Jf9B15eKyV72rusBKiRVjBnd/sgP2yBuzA
	RSxhcVf8UoBGedu88tsUcaCs3ex3t/XUkRS9Md24kStmr/OCQ70+AoDWCGjF53lolb9bpyn
	j3mKAwb4RkYKwFvF/TfKEluSGTreAO++kxDwP4pGjdCOQR2XBgNzCgxLGBGqZUnJsBrHhL1
	FzK65Tvckt4gpsALT8LYvBj1I6Qs/tvfQ/to2NVpv3M3PvDOSrx0sas3Gs4uuVtFOb48pxT
	w+hDX226IxwkCTckevLFAX38L+ACJjMIseFoo/gTUIPnIy7ZORiTIJGUU68pfZBooN1jMlN
	N/xVI7AdmVVla5FmEK7JOZPWqLalmyPPPb23TK+bh5WdbCMhO13YX2936DfAVbX4qk+1JYv
	//Srs+VusR+CPdiu1r4a80oVQ7PxCJ8uyR4EQ9mQs0LWSIdD+G2kZYm4kNI02evwhrz5CAH
	m/BT2lq+6Fr1aKQU1wsmqEnDEsSbviDhUjFLAkGVUpi5pXciprh39QvVmanQuJPEedbVCjd
	w==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_193035_217714_9CA6502D 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2812455702337457867=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2812455702337457867==
Content-Type: multipart/signed;
 boundary=b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> The current caller does check the return value before using dp, so this
> isn't an active bug. Still, initialize *dp to NULL upfront as a defensive
> measure, consistent with how core helpers like _snd_pcm_new() handle
> their optional output parameters.

If devm_kmemdup() fails, spacemit_i2s_init_dai() returns -ENOMEM. The
sole caller checks the return value and returns immediately, so it never
accesses dai on that path. On success, dp is non-NULL and *dp is assigned
before the function returns.

Therefore, I do not see a path where initializing *dp to NULL has any
effect. Could you clarify what case this change is intended to handle?

                                            - Troy

--b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCam/9Fg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvFGcA/R3CHaTVtH2RGXHY16xO3fRcol8fUVuIUUe+TR1t
9JgJAP91jUDciFgUl5vhTEeiVakcOt9V0hoWOqKp3sSSP0aYCw==
=VXsS
-----END PGP SIGNATURE-----

--b221c2993898b54412cec0db06be210fff76d164353ddb68c3a0007334fe--


--===============2812455702337457867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2812455702337457867==--

