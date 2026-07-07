Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F0CC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 09:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uozlfI+BnXpPo1FC6GJlBS2uWk5PG2q4xeDO5KwZ5E4=; b=s4uD/32UzBvYO0rqdq3Mn2ieVf
	bT+3ezW2lszUi8akfuzGCAm0LCWPho7Bq+lC3Re2mp5Gi/P6FpCTe4xMgvnactyLYBTpMY4O6hDpb
	Rq/4iUUxf9rr6A6kUTwpaED0oQtDmoL+8isVc6Iv7KSEuqYU7zeLPVuJFcY4LY6VoSFBKDdITwS3O
	hd52RihiygmAa1WQLxkAbrG92x3dcOCtTvSX34VCBSHW6MB3Gnrh6fTOIHcdgITJIFA00jEjw8YG5
	evlAGw5SRrk82gKOMneO2soXtsbrHkJNNAnA+7C+IAeEd93pd8iYk351DIy17wdGgETAD4uBwPbli
	E+Y7v89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1mZ-0000000EZlG-0eOU;
	Tue, 07 Jul 2026 09:07:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1mW-0000000EZk1-1D6J
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 09:07:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so22840355e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783415274; x=1784020074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sI/lThfPPa6ZbQMicdFXAkGpuTpYP7bvsD6WMn+lQQs=;
        b=PBRxMFio0Ifu9m8I/OXfoUAW+iQYQlw0OHVnZOeGWZbj2Le63V68g5SIhur3QZZy6S
         gVmK8GUg0nugttKybSojCWBI/NojOLSSyIua3iuCr6WjUvl2/9rpj4+y4nJpk6G8jgMe
         m+vclxviFACd8Th5lrlkbEMEFg0dYsomK5acQdxDrVEINQza/UfHN+wS8jNkgl8+W5NW
         EHksYYtbwuYqCLCjETNCz98j3ZOVkL4nft+CZ+YhNI6vwJR8kXudwCZNmCZTqyCA635I
         J/fu7RxgcxgszNL8nC3DAlXlZ5a4wJ1cL0oKjzZiGv5oJ3Ay7H9wTifVHhXgjAo3D306
         hahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415274; x=1784020074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sI/lThfPPa6ZbQMicdFXAkGpuTpYP7bvsD6WMn+lQQs=;
        b=VJ0AI3KxGvPv7F/t9aKQVy3wYnxCuI2V/dKzr5x0GaaNxx3ojhf8CTFk44hB3BsIxo
         q2pE+vdiyTVtxNTyXhrcim2RS1kWeAlB7q3P+jJolRhA9LsJOubciZwCG8CXA8fNhFaP
         Sb8W0+PL0oNuTnXRaXRMvYZLQ8eodscQitVF1CFud0GdHa6/MfB//CTjfmzd2g04SqRT
         tSHPYkCj+g7q+Tveg5iJVGkydFvuOgW6rAHb4Ib/qiQFNPLC4GnaXfa/zla/leNKbeag
         LOyb1h6QQ+HLVcZ7kVHwslS8taGNG9aOQyvtaa+Ass2upPJFPVky/TdpPy8X4jk+9u/n
         zXxg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3Rm25z5JjQhqdvrbj+oMeqp6IvKYn7tA5R43I2XoaB23Jr58qau6V00GKeWgdZSo2SYT+MOBSdfxGfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzycDd4z+eFEAy5lX5I3wPG9KZ5NwZdvIdML7meAG6RRpd7Ih5i
	ciVKJAeQYkTrOMre78PjFNBlYuIN02mf7HGb/M/XoW1ZhsO8cWyBFQNCZZT2YpF+CFU4l/XbBgW
	46tUVm9Y=
X-Gm-Gg: AfdE7cndH5x9HuTI2E4GwHM/LvKDy8uqJdAQRXlthE5Vr2oX0fgexHTxrAtK1CKEuwy
	c0LnKVHAgu4wsSiRj8EXjmp36TSalWfX1NfMZ7N8rHtUniwh6FQaaU0y1eK3/YgyUp9QCMqkz6z
	bHq94DwH5XIawh9LJNM3+rz+Bt+Vm3GsbGCYEHzyAOdUyBOOCNEwhfD5ZFOQ4XmRdFok/zPDRWk
	z/wwrRv50OM1eQSCbu1Jv3vWLr4dhk0gwOMK1btUJwuxSFbHn3vfnGmMq2EZpbFzZgImZbTLR0f
	Z+267O7FFU8kTECFNmr7ozUH1P+RrIfbtSGwnpO5v3Jg6Vwb7RIssr3BhtUHnImqh3eTkw+2ht1
	tRVpmYqSito3MMHcuIAIMV8TiW8TvRmFXRR42xJegW8+1+S7MA32ermXgi1xUREV7rLnD3wgeR+
	ldFzJTX5EFxbAL953Js0Z6qs2IKo1cZytzube2M/PwuJZiqiST9NHtIYRcJoHRNsHVOgYZFbZ5a
	OXq
X-Received: by 2002:a05:600c:a011:b0:493:a8eb:5145 with SMTP id 5b1f17b1804b1-493df063da1mr47094795e9.4.1783415273961;
        Tue, 07 Jul 2026 02:07:53 -0700 (PDT)
Received: from localhost (p200300f65f47db0437b4d928ee3eb6f8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:37b4:d928:ee3e:b6f8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0fc1348sm41108005e9.14.2026.07.07.02.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:07:53 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:07:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iommu/riscv: Drop superflous zeros in pci_device_id
 array
Message-ID: <akzBoIyLjEKZk-5j@monoceros>
References: <20260522145943.774344-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20260522145943.774344-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_020756_344744_F9FFF1C2 
X-CRM114-Status: GOOD (  13.31  )
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
Content-Type: multipart/mixed; boundary="===============8673256900601295344=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8673256900601295344==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ey6zjmsvpt54p5f3"
Content-Disposition: inline


--ey6zjmsvpt54p5f3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] iommu/riscv: Drop superflous zeros in pci_device_id
 array
MIME-Version: 1.0

Hello,

On Fri, May 22, 2026 at 04:59:43PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The .driver_data member of the struct pci_device_id array were
> initialized by a list expressions to zero without making use of that
> value. In this case it's better to not specify a value at all and let
> the compiler fill in the zeros. Same for the list terminator that can
> better be completely empty.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

This patch was sent before v7.1-rc5 and missed the merge window leading
to v7.2-rc1. I wonder if it's still on someone's radar?

Best regards
Uwe

--ey6zjmsvpt54p5f3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpMweQACgkQj4D7WH0S
/k6rpAgAnTFyflMCkuo0PNYUPa4d10VpQnXa5capkEKkV/j9oJywGHlRsvrtBsWb
25TCYntEvTW5V/uH4ZmVVLRWgxMTghVqFxokevX/yKYlXE0u7Ud21v8/9oEOU79O
zAoRhsh3GQlz3TdWHwsrMqar1TJlSGc/ao7uI5oeMlzu/unWD5ki/j2JZJio+s5b
hqYRLYF8uCeYPjQVTkas5MyAgw9lVux54oILDGSjyOWMpXbXY1uRx6tDagP27KHK
lJulkKCBN3/v5axD66zYw4a14M1NzJPFsgdQeOt51nXbTpom2AQlJeX+dOMMrMzO
+2in5sBwtKDcJIPIoy/Y7H/yic2J1w==
=lib1
-----END PGP SIGNATURE-----

--ey6zjmsvpt54p5f3--


--===============8673256900601295344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8673256900601295344==--

