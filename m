Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8A4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 11:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dH+SdL5v3/ye/3Z5ijJGotcodLLRc+QyxfSsA4xp3bc=; b=NSwhV8VA+X4mZ2bMjSic7sXt35
	wEJX7jPqoXqJQcBcrI+LQDf2RLu1Sm+silUOFso6iM0wsq6/Q4udm5lMwmRtoG0MdfCb60jcwtw0D
	GzlRhil/KlUV/uaA9wwnNzpWEQUBw+EtCsonzee9nnTChpqsDuIe4s84Xw4UW2uO+j+CCsjR6N3KP
	i8UcFrzi3dfsb8RYemdzv1evquji+apqyf7Fl8wp2GWnvTUQqeZj/D8qAqsQVl31UN6BiC8AX+eph
	Gbm0Dzf5Hcyt6ucjrU0Up/zoL8f4T34+GJMSJqVRFQLn5qRHkdwVdTzKqlKBCA+CzbZR2NLMVKHuJ
	qnh+/zMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiDUE-0047JY-4s; Tue, 11 Oct 2022 11:31:50 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiDUA-0047I4-LY
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 11:31:48 +0000
Received: by mail-pj1-x1044.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so12891138pjl.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtfQm0rpWEJ8JNRHmir9FxLzjQM58jwshw/gVkcfTCw=;
        b=er4GID/oczZ/nGNzV4letNmbAcjBSH/JFc7bRemIzPf4UzR1AO+rVj9H1HB8DIb/dN
         BKDAWPmNnecF5zPDelJWXgOw4A2toj+nSe87qY88SeqRIhg1jYyJYHdXbmsX0VBSKfF0
         IEJd518nucez2URZq/iCStr8f8kt9YUhVldAxDgJN5r76xnMAsCr9DZ984axOiEDvmDr
         gFYd4wcW9eAd4q59rawYQiDeTbggUXYkiQ0F1GDqytpNSKitg1mGn6V5kp8CpYMUZ5DG
         sq6xRJG9uCttgyVI2qOLEfc9PuDahqIZ+xL+/+sAVwWwAAvPrmLZPFaTDYp35IoN6Ynx
         nb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtfQm0rpWEJ8JNRHmir9FxLzjQM58jwshw/gVkcfTCw=;
        b=Su9NXPauEmzBrgT7L70mtSQO6IC2CjqLn92YZSZm9i+DH9BEJhJu6FQ9hOtmX653kv
         vDwwW+lLPkl+Aqkltvc8TYmt6Mtzd5A6Q6876zsur+KRgt/GvxBpAf931tZP3SHwnipx
         W6pSlg0FHGj8TTIxGzAO3uMetGxp9yfIv530gXl/XR2iMPW5VWiPBt4849qTA/wKm08d
         rs9m74DjBUhdU7txHzwS8MWNH8cDORsu7XnNGICCVImJO7dz6z8VWtzZthsXTfRIaNKC
         pKSyF+oM1NflXocvN3njgk/MOccDGg6Zd+d1KJ52hCro97Ls62UtKBfh6E1dE9FGwmlN
         CMbQ==
X-Gm-Message-State: ACrzQf3e+2nA1WwD190TIHcnshrm4xshequ8EMwhT4ef+pWq4CkG1UD+
	Leq5KBmU2xbwMXJRm/FoySI=
X-Google-Smtp-Source: AMsMyM7J9+mahtVki8HueNCqMcU+OQwVoktH+sxD04KZFqB7F2fiAsEPFnPxMC2tj37s221dJBWtkQ==
X-Received: by 2002:a17:902:b907:b0:178:2898:8084 with SMTP id bf7-20020a170902b90700b0017828988084mr23718462plb.140.1665487902851;
        Tue, 11 Oct 2022 04:31:42 -0700 (PDT)
Received: from [127.0.0.1] ([103.149.248.83])
        by smtp.gmail.com with ESMTPSA id d7-20020a62f807000000b0053e8fe8a705sm9004910pfh.17.2022.10.11.04.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 04:31:42 -0700 (PDT)
From: Coelacanthus <coelacanthushex@gmail.com>
X-Google-Original-From: Coelacanthus <CoelacanthusHex@gmail.com>
Message-ID: <bcf7fa29-da90-99ce-de96-0556fc8cbf93@gmail.com>
Date: Tue, 11 Oct 2022 19:31:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Eva Kotova <nyandarknessgirl@gmail.com>
Cc: c141028@gmail.com, dramforever@live.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, xc-tan@outlook.com
References: <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
 <a69ee775-e565-3d72-eb5f-8378616694d3@gmail.com>
 <b0ad936d-4d1b-e319-fa22-4a96c048a855@canonical.com>
Content-Language: en-US
In-Reply-To: <b0ad936d-4d1b-e319-fa22-4a96c048a855@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_043146_738498_894ACCC5 
X-CRM114-Status: GOOD (  15.88  )
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
Content-Type: multipart/mixed; boundary="===============4644588672329742282=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4644588672329742282==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------T7zAMzZ0Xx3EJGFAdn34B3XS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------T7zAMzZ0Xx3EJGFAdn34B3XS
Content-Type: multipart/mixed; boundary="------------ddWAbsiaEvC3NbremNeIcX1A";
 protected-headers="v1"
From: Coelacanthus <CoelacanthusHex@gmail.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Eva Kotova <nyandarknessgirl@gmail.com>
Cc: c141028@gmail.com, dramforever@live.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, xc-tan@outlook.com
Message-ID: <bcf7fa29-da90-99ce-de96-0556fc8cbf93@gmail.com>
Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
References: <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
 <a69ee775-e565-3d72-eb5f-8378616694d3@gmail.com>
 <b0ad936d-4d1b-e319-fa22-4a96c048a855@canonical.com>
In-Reply-To: <b0ad936d-4d1b-e319-fa22-4a96c048a855@canonical.com>

--------------ddWAbsiaEvC3NbremNeIcX1A
Content-Type: multipart/mixed; boundary="------------EUUAYR5xTxdPnMeNdv168srW"

--------------EUUAYR5xTxdPnMeNdv168srW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


On 2022/10/11 19:23, Heinrich Schuchardt wrote:

>=20
> On 10/6/22 21:17, Eva Kotova wrote:
>> On Tue, 31 May 2022 00:56:52 PDT (-0700), coelacanthus@outlook.com wro=
te:
>> =C2=A0> As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3,=
 write
>> =C2=A0> but not read is "Reserved for future use.". For now, they are =
not=20
>> valid.
>> =C2=A0> In the current code, -wx is marked as invalid, but -w- is not =
marked
>> =C2=A0> as invalid.
>>
>> This patch breaks OpenJDK/Java on RISC-V, as it tries to create a=20
>> w-only protective page:
>>
>> #
>> # There is insufficient memory for the Java Runtime Environment to=20
>> continue.
>> # Native memory allocation (mmap) failed to map 4096 bytes for failed =

>> to allocate memory for PaX check.
>> # An error report file with more information is saved as:
>> # /root/hs_err_pid107.log
>>
>> I bisected to this commit since on Linux 5.19+ java no longer works.
>> Perhaps some fallback should be implemented, to prevent userspace=20
>> breakage. It is currently documented, that at least on i386 PROT_WRITE=
=20
>> mappings imply PROT_READ (See man mmap(2) NOTES), this would be a good=
=20
>> place to start.
>=20
> Which test case demonstrates the issue?
>=20
> Best regards
>=20
> Heinrich
>=20

In check_pax function[1], jdk use mmap with PROT_WRITE.

    void* p =3D ::mmap(NULL, size, PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,=
 -1,0);


[1]: https://github.com/openjdk/jdk/blob/f694f8a7671002559e7d23fdb65d5e9c=
768f9c03/src/hotspot/os/linux/os_linux.cpp#L4306

Best regards,
Celeste
--------------EUUAYR5xTxdPnMeNdv168srW
Content-Type: application/pgp-keys; name="OpenPGP_0x15F4180E73787863.asc"
Content-Disposition: attachment; filename="OpenPGP_0x15F4180E73787863.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
8XU/OY0bDLAPsYeABCr/DQ=3D=3D
=3DOILn
-----END PGP PUBLIC KEY BLOCK-----

--------------EUUAYR5xTxdPnMeNdv168srW--

--------------ddWAbsiaEvC3NbremNeIcX1A--

--------------T7zAMzZ0Xx3EJGFAdn34B3XS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQWueXrpnXi8KYNNJjjXInkWGeuNQUCY0VUFgAKCRDjXInkWGeu
Nf+XAP4lB+f6ccKSlIFqHdu7ZzcB6/A85/tndOvT19hw4hy8LQD/fUnKh1SmB16T
xJ+bDyslOUwZDx8/SxOIUmv551xaKQ0=
=9wWC
-----END PGP SIGNATURE-----

--------------T7zAMzZ0Xx3EJGFAdn34B3XS--


--===============4644588672329742282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4644588672329742282==--

