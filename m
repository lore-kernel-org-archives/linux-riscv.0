Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10EDE77197
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 04:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8g5pWw8fq0tOtJLXug/L0pHSBqupYknifI7iurZeIs=; b=Jl9APv5kLNg48gXTY94XUj9ZlF
	ceOOd9peudyf9+59fh+zjuBW5+/61kg3JoR33/THbDONF19kvT/mRPVeCoybj8akQ7fHC8hta8GIZ
	05n3jHmWzf3TpMR5YQliPimzhtZlXc3BzBxVteeJqc9oJraWxT0Q8DsrYM2nu2ThNoiNCUIHBJtiD
	3KWCj3vOJuILKQWDsMsSffF1m/ygcFpEx9HmCtfywFLttl9SvWypJtFmmKyVhVcDDnTt3K75wTz90
	UOUpBFDPnI5f18IOIvQAB+9ZzLvu8vhTfONT5FF/PqaACv4qT5O7Wv0NNA6HUM8FcAJyXVLcNjx0c
	G0ZdtTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1aQ-00000003VG6-43LE;
	Tue, 07 Jan 2025 04:53:02 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1aN-00000003VFd-3UVX
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 04:53:01 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso25764641a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 20:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736225577; x=1736830377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=60IKh1YALIpE5luozTsZiDL++m1KjCGPj6msSEt8t+U=;
        b=U+wXFGdJ2tEWRtYmChukOuA16HP6UnCrg4Mf/zBroNitpYXm2k8xFCtbvLwDCaBk8P
         DXUqkpUBdVSUOvYOo3GBgO6YDbKVhqgkUia5xA8ZCf1KF1mVy0N/ohxHkL96wiJvPtos
         Hr7IVnArU79M3SswPX5rnclSoFX/ep8UPMKgESi4PxBkcQS/xdBbRMan02zUufJPsyD8
         ADGS5cnjTd0ApIHmefqPeLKRpjrO5P+Qln2pGTbZWsueNw4gyy3d8FPFhhOcFsXkKcOG
         AeTS4h/VaqkIse/4ccNgSYzXGH4pz/cMq2iGZdPluiONLlY9LGOjo98rRnN7snu5AkEX
         CTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736225577; x=1736830377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60IKh1YALIpE5luozTsZiDL++m1KjCGPj6msSEt8t+U=;
        b=NagpjLcJbskLqrrHVy3xEzXTqYG9q3GPFmwz8up+0L2qG/fNSqwX2nt2SQ8IjaR6k+
         iSczXVFtXeb4ALr/XXJgJn0NDATT1H1d07o8PIYXAFnPJ+tnEbxNe2G4M92ztRfAWniU
         wVaDZpxskPzzsMwdJ6PUANw+jpWQ1D+JCZisalbFM6Qa6hZ6rmr7BlSbbcV7366RvGxR
         gn2fbJTyXcZmxd4ABlz+zy9ylxb3vuoD+vqMzzL5F7GnLOJTi7352qA6iB2PxxomUtDn
         ohw21UG1duC18tvEfnhuBY6Xaa1tnK6o9BfVEWEf4cKv+yn9ruc0o03PlWNE5Jv4+WF4
         /y3A==
X-Forwarded-Encrypted: i=1; AJvYcCVT9x5uJJYJa8SLRFDmAr60wnFhN7KeS5X5ZC8HwXKR80VGfsLbe1bFV30Ho9SEHR9/i88aeVPDtj05+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz85URe7SPO3TfXkCGgrRg7EBup+Xzdo64vVJNfTlNpe7UQub2m
	BzKDAqOxB6URAA30+MmYbETmq0glZd8vNWt/4X4gY9SzR9JxgIfMUGVtKjZuHEg=
X-Gm-Gg: ASbGncs+yqrTaOs19/m5MeYeDdxJks/q2kz4aLhojoXPNWrVnkyKO4dRcMilZm1pwib
	JQGY+fWVZY9ZqQGPPb/qulvOy1eM0/hKaR0iCmTk4qhnQe3uagh3Zh8fMf1Xb3QPB2p1sRWSHm/
	XZHieTGydfLZm0Gem2qJ9T37qPgNb3xhn0MJIQ8mvfN8qZfCd559kBF+7a5yaY9fXkXTqCoVJP0
	7/S0fCGTbi1cPnrHCMBVq+GU6roj3VTgYzmUTxwqTd8W7+pjT4EGRfvhG3SPQ==
X-Google-Smtp-Source: AGHT+IExtBcC1TdRfmrYbsdlfJ/xTSCHU6F9T+AcyPoKwaobnGSIRxLtGmMNUARkLtwmvOeIpjrxLQ==
X-Received: by 2002:a17:906:f59d:b0:aa6:9372:cac7 with SMTP id a640c23a62f3a-aac334c1628mr5915566066b.31.1736225577578;
        Mon, 06 Jan 2025 20:52:57 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015b53sm2324711666b.163.2025.01.06.20.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 20:52:56 -0800 (PST)
Date: Tue, 7 Jan 2025 05:52:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Nylon Chen <nylon7717@gmail.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	thierry.reding@gmail.com, vincent.chen@sifive.com, zong.li@sifive.com
Subject: Re: [PATCH v9 3/3] pwm: sifive: Fix the error in the idempotent test
 within the pwm_apply_state_debug function
Message-ID: <c5zjujxi7wsuabdpttojkrwnvkwna56gz3gnapxskg7tdzmo2f@frvbwzguizdt>
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-4-nylon.chen@sifive.com>
 <jvwgsszvs4jtcytcphsdjulzgqfqzdp4sisu236ddwsqgmvriw@ngi4ljgh5b74>
 <CAHh=Yk92=hp+kaTJWL13_jwJ5gzAAi8gbRF=Ns9=yq2trRUQEg@mail.gmail.com>
 <xf6ympnaljfjztptb5w5qdpuluckptozdz5a7gtuycsev32ngr@x2ovibqv6evr>
 <CAGKtFavQAZOof5QSTFCEaRJEPETm5aBqzkV4g24n3ioiBAOgDA@mail.gmail.com>
 <p6rqpx3yrn2ib4ulmby7tbnpbg4bjyt4dt6snrmhuyw6hx6izl@lywssban54et>
 <CAHh=Yk-iFGULUQc-U-PNjx-st7d5KER3J+t54SNERVaNr++qoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHh=Yk-iFGULUQc-U-PNjx-st7d5KER3J+t54SNERVaNr++qoQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_205300_142494_6606330D 
X-CRM114-Status: GOOD (  11.15  )
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
Content-Type: multipart/mixed; boundary="===============4182849326592596907=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4182849326592596907==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3m47uht7xkb3ljzb"
Content-Disposition: inline


--3m47uht7xkb3ljzb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 3/3] pwm: sifive: Fix the error in the idempotent test
 within the pwm_apply_state_debug function
MIME-Version: 1.0

Hello Nylon,

On Mon, Jan 06, 2025 at 05:00:32PM +0800, Nylon Chen wrote:
> Hi Uwe, I have made the following adjustments based on your
> requirements. Does this align with what you had in mind?
> - period
> seq 5000 1 15000 | while read p; do echo $p >
> /sys/class/pwm/pwmchip0/pwm0/period echo "Testing period: $p" done
>=20
> - duty cycle
> for duty in $(seq 0 1 10000); do echo $duty >
> /sys/class/pwm/pwmchip0/pwm0/duty_cycle echo "Testing duty cycle:
> $duty" done

That + doing the same test backwards (i.e. using seq 15000 -1 5000 for
the period test and seq 10000 -1 0 for duty_cycle) should catch most
rounding bugs.

Best regards
Uwe

--3m47uht7xkb3ljzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmd8syMACgkQj4D7WH0S
/k4USQgAu73hQyBwf5XFDneH+1QmqAmiN2wEaeF4n94f4vD0QtTqb1SQ+kIDIV2y
h331G9V73C2jt7PVtH2a+pF367sblfDWrYufCtuTXj4akJGtPEcme1PuxmMdwip5
+OtHKLGC2Zb7N9r5VQkwok4Ijci6vUF3unjz+sQipFReZcygL+XeJ3Wd+DWMu//t
IfbmsYkXK826rUqBBoHVJigEZsQugsR69+EHYnXu4sT2W2gkIr+SXbZOFQx1lo2r
TVtmwJtKF7qflQS5STsyZyp1xKoAk33XPB83D3h4yz1IDIbzhKJbqqjadvgdvouK
myVcdVQFatxC2GuFs+5M73nHcQkhGg==
=OoYH
-----END PGP SIGNATURE-----

--3m47uht7xkb3ljzb--


--===============4182849326592596907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4182849326592596907==--

