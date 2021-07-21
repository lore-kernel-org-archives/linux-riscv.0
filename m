Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF08AC07E9B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 10:08:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9347460FE7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 10:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9347460FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=300izhjd3zxMvmcpzi0xm5pSq2VFSVKzO7uMjw02Pmc=; b=wrvbs7zeXybCCXSOoenRqWofo2
	eJqvX7BbRnvsLcGJ8SAUT+YpUgrmn9sf8//+7YYOnILsF3pEFgcJ8os7+SQ1xmfeimhM1lwFJ021r
	LFpOhzF2ONpTCQtPpRThSTjSksY4xA7v4QRcW2YhmpfxfWzsxM8f4KeLGrXQhD2lQVw9mOWvXAwXi
	4WHde9V+e9khg9Jjj98NSER7hAlCH9dtCwdQfNEah2Dce6JHlXkC4CYhb/LFTQluFbQKEAjphu8wU
	hl4aS8tWBK2mRXhLPH7vCRdvK33OtGAicp2kB1rF2mzLOK3EZZEmyhKMY50mqJcWiIpd5Y/sjYReH
	UJnxMCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6993-00FB4l-Av; Wed, 21 Jul 2021 10:08:05 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m698o-00FB1q-Oq; Wed, 21 Jul 2021 10:07:52 +0000
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D37A01FE8C;
 Wed, 21 Jul 2021 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626862068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4NubWeG2ovcbxAMfkPElXnWJqbcxkLf6NbwbwLfM7M=;
 b=MdLMMhkI7ONP/nYRE2oIl3sEKkCvlXqrzpPbqfZHjA7OPVUS2yqkubWKHmfWBdumuApQXQ
 ShwF0quhdY4dj8l6GiGjbqOgB5aNRPDzP8eVoV6HTJBxwzd/abxH6cJJxE01qkdshGG3tV
 HAmJWgM41DecaWuRqYe6y48+7KG5QFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626862068;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4NubWeG2ovcbxAMfkPElXnWJqbcxkLf6NbwbwLfM7M=;
 b=4c+L9WxPOuGy6w2UomFTa+FhdQtOl3fULCm5CETfr2agEmjy6J9rRlrXIYISZAiUYUpyLI
 axtXvFy4cxgwRFCg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 604DE13BD3;
 Wed, 21 Jul 2021 10:07:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id z79vFvTx92C0RwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jul 2021 10:07:48 +0000
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
To: Javier Martinez Canillas <javierm@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
 linux-efi <linux-efi@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon
 <will@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Hans de Goede <hdegoede@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
 <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
 <YPbWrV/cIODdgu6A@phenom.ffwll.local>
 <37e05f02-b810-0cb1-cc4f-95711cd148d9@suse.de>
 <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1e85fae7-ef95-b2f7-3463-e90958e54684@suse.de>
Date: Wed, 21 Jul 2021 12:07:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_030751_015466_54189EB7 
X-CRM114-Status: GOOD (  18.01  )
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
Content-Type: multipart/mixed; boundary="===============0092415555855743829=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0092415555855743829==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Xa3sKiKw0lskQKjLKRseqrPiBVPqH4fjs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Xa3sKiKw0lskQKjLKRseqrPiBVPqH4fjs
Content-Type: multipart/mixed; boundary="yNbR0EJmqO1B5PtZC9iiBAmy6gYhoBNLY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
 linux-efi <linux-efi@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon
 <will@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Hans de Goede <hdegoede@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <1e85fae7-ef95-b2f7-3463-e90958e54684@suse.de>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
 <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
 <YPbWrV/cIODdgu6A@phenom.ffwll.local>
 <37e05f02-b810-0cb1-cc4f-95711cd148d9@suse.de>
 <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
In-Reply-To: <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>

--yNbR0EJmqO1B5PtZC9iiBAmy6gYhoBNLY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.07.21 um 07:09 schrieb Javier Martinez Canillas:
=2E..
>>
>> Can I simply put the patches in to drm-misc-next? There was some talk
>> about a topic branch?
>>
>=20
> ... which AFAIU means that there's no need for a topic branch, since th=
e
> patches will be present in linux-next. And the EFI folks can use that t=
o
> check if there are any integration issues or regressions caused by thes=
e.

Merged into drm-misc-next.

Best regards
Thomas

>  =20
>> Best regards
>> Thomas
>>
>=20
> Best regards,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--yNbR0EJmqO1B5PtZC9iiBAmy6gYhoBNLY--

--Xa3sKiKw0lskQKjLKRseqrPiBVPqH4fjs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD38fMFAwAAAAAACgkQlh/E3EQov+A+
gQ//cm3YmrkvVs/l/xoo2fbJXBc0h9CfisiQrI+6/Vgdc3c/PL9jM/5VoqsUajcScfXFmfpBDlZn
6zTFAYqUVTntYMnSrTwbuaY/Tmo0Y2Unrh66bIDzlKz4ZWjYPczolpW40ke/l6C5/dSgR2wu8zRv
FqynPxu8Y2TroBgDGHuUbUjFYNc5g80xUq7/Qvik+YOQG25iiNw3Y1QQg6y/JO8r0lbBStYchmNP
dSmvkmjovJ/C/98FbrXAMQZtkbe9ar4Oy3lqwA/GdNEnnbCTzc4VP9WVmuVUPbI2gXsdrAttjkSJ
7AMEbAgrrjY73g64k6TCwjZnCvBU8D9vxzjCjVLnlnxewAB4SHq5lq7Z4lucLKXs/c9xLv025Ico
ENgkUhfGrwYBiTVqmJ9edVlgVTvLPyNNpb+J+VcbhMSfWQSeegULqjnEEuqrVxIdxYhNpajp2XXV
pXdwJuGy19o1cZelMVYNZzdwPHjvyEPxIyBGcUxYMzwqEhZAjsk9/8Hw6t2RsiSRPaxVfWTUmATJ
CjHmdmCMSRdp2L9KElXaQpUaXtuDiVMYgVevlFcISs4qVq2TeDX1c/f8NRZp2DQ2pgpht5WY/+/T
WqysfHwiBKtbDY88yUtCQuna4XZm1t6HZvwsL5MGuNX8qwa1sKiAw6zezZZucfPJ/4QbdFGSihC3
T9U=
=OQli
-----END PGP SIGNATURE-----

--Xa3sKiKw0lskQKjLKRseqrPiBVPqH4fjs--


--===============0092415555855743829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0092415555855743829==--

