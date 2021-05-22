Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A716C2B9F2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 05:15:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D034610C8
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 05:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D034610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References:Cc:To:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMUjOtucx4wTV8xSezmGB7jguVWAI8G7WfVYsYtlcQw=; b=OrgHSKWWtxMVyCPUBtRM83Cb1R
	YXMjb4U+9UU+8lB/RSi+nGK2JBCDU0Nr82WDwCXt2uCpj9ozFzzMgy92c/pjtKL92CgmNMG+/SOBQ
	Gvve1mgD+lrWAmMqlgwBFKhdVPcxgcpxfm9OAK3wWQHnDv1fV0sPWzEigAAKqvjKepudhSdXHOId8
	CqInM7c3lDQPRH73xN2rtfU9ZMQpnihBVbpMGoWeqipQxkN1EG1y9RDsVQ92IUUF85Ig4s0jPULma
	TbGx9VSJB2TedpwjDkz7wjLikmrmX1N7XtcmthBDtRVIhC/yFF4nWFvvRNz2o5/if0JJwj5VzpbUF
	65Mn2ifg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkJyO-001qa4-7U; Sat, 22 May 2021 05:14:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkJy6-001qXV-Qr; Sat, 22 May 2021 05:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:In-Reply-To:MIME-Version
 :Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fE0DYmrm9SxpZYdTHC8iCMREL4dmAA5TTbNe80rzyKI=; b=zMcA8a2+iwPUnytzWjXxlov/Y+
 CuXcQx7OFu7Yp4JlWgXAqlKRHe5MpeaqlKodUSknuh7L61BcANG5HeOXqjPgmZeuktUAaSHRnEJ2G
 sUz+vATYp9jZp9uE8of7mPthWiMtS+f1EsDJeKL7zClZazDoOQXEYc7lO/w1DU2n3vk3QmrYafbQ1
 kuEmdu6oh2rEn4TruF3d4aCXg4j/99FeUmhGCTbNQ/X3RnqhDEIThBG1zHpNkHJAeM3u4d2YSHDda
 WDua4yvEBfsVk5o+sq0L+S1I5m0o0g5eNE8AuJhECvGEiktCfoHYzTIgjIyv0x3sKO44awnayEFSx
 fpUbjK4A==;
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkJy3-0000ft-Pq; Sat, 22 May 2021 05:14:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621660467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fE0DYmrm9SxpZYdTHC8iCMREL4dmAA5TTbNe80rzyKI=;
 b=dyswBoL09pf/e3t8Xn6tbAtVB2GFnAELtpQwp9alptrlr+Q8uaitdfYjXHS+9zTkR5aa/V
 /zqkwMAeNqRLKZMsc79az2riu5QknFBLNbdDQ4l6JWbPiMNqyelW4Gwm4Qz5gzx8lYAat3
 UexIb4asXmRFPcZxyyCCDXi/b2Y8R6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621660467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fE0DYmrm9SxpZYdTHC8iCMREL4dmAA5TTbNe80rzyKI=;
 b=oZpTW1j1zGwpEeSEuClOLupKR40dJykDS3YZ0DHQNmN43SqmUnOQucMJB4LXRABGIEfg7w
 +Kjygicj77dnJCDQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B63DAAFD;
 Sat, 22 May 2021 05:14:27 +0000 (UTC)
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, linux-efi@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Robinson <pbrobinson@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20210521193704.3042024-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drivers/firmware: consolidate EFI framebuffer setup
 for all arches
Message-ID: <e23a44ba-5e9d-d27b-b5e8-0cce3b158ed7@suse.de>
Date: Sat, 22 May 2021 07:14:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521193704.3042024-1-javierm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_221432_156639_4B1F9E46 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Type: multipart/mixed; boundary="===============7567466148420279855=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7567466148420279855==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JtNxE1TITTUjh336w2OlWq1BXvBZPIZL1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JtNxE1TITTUjh336w2OlWq1BXvBZPIZL1
Content-Type: multipart/mixed; boundary="IkKD6gurUFm5U0BsW26VqMVD5IckojXuq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, linux-efi@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Robinson <pbrobinson@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <e23a44ba-5e9d-d27b-b5e8-0cce3b158ed7@suse.de>
Subject: Re: [PATCH 2/2] drivers/firmware: consolidate EFI framebuffer setup
 for all arches
References: <20210521193704.3042024-1-javierm@redhat.com>
In-Reply-To: <20210521193704.3042024-1-javierm@redhat.com>

--IkKD6gurUFm5U0BsW26VqMVD5IckojXuq
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.05.21 um 21:37 schrieb Javier Martinez Canillas:
> The register_gop_device() function registers an "efi-framebuffer" platf=
orm
> device to match against the efifb driver, to have an early framebuffer =
for
> EFI platforms.
>=20
> But the Generic System Framebuffers (sysfb) already has support for thi=
s.
>=20
> Instead of having duplicated logic for x86 and other architectures usin=
g
> EFI, consolidate the two in sysfb and remove it from the EFI init logic=
=2E
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
>   arch/arm/Kconfig                  |  1 +
>   arch/arm/include/asm/efi.h        |  5 +-
>   arch/arm64/Kconfig                |  1 +
>   arch/arm64/include/asm/efi.h      |  5 +-
>   arch/riscv/Kconfig                |  1 +
>   arch/riscv/include/asm/efi.h      |  5 +-
>   drivers/firmware/Kconfig          |  7 ++-
>   drivers/firmware/Makefile         |  2 +-
>   drivers/firmware/efi/efi-init.c   | 90 ------------------------------=
-
>   drivers/firmware/efi/sysfb_efi.c  | 77 +++++++++++++++++++++++++-
>   drivers/firmware/sysfb.c          | 40 +++++++++-----
>   drivers/firmware/sysfb_simplefb.c | 29 ++++++----
>   include/linux/sysfb.h             | 28 +++++-----
>   13 files changed, 145 insertions(+), 146 deletions(-)
>=20
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 24804f11302..30ba195ca72 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -127,6 +127,7 @@ config ARM
>   	select PERF_USE_VMALLOC
>   	select RTC_LIB
>   	select SET_FS
> +	select SYSFB

Don't select this as part of the architecture. Rather make an option for =

SYSFB that depends in the architectures that supports it.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--IkKD6gurUFm5U0BsW26VqMVD5IckojXuq--

--JtNxE1TITTUjh336w2OlWq1BXvBZPIZL1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCokzEFAwAAAAAACgkQlh/E3EQov+Am
OQ//Qi8H2p0Hk15vY3ajQsg465AoKPe35Vm5k/maVXwrOTqvV2TpRdL3IAy5IOhvaV9VPsbibLLk
JDP7fvy1loqvwPGA5iiSfANQIqTEtlFySY7OZx5QFXV+Sl9Cp5Y4fJ3pl+GY0IzcbvMeWsiEet8h
OdQfvHc/aH63OVs97BayrdUtikbKcp339FZ73Ewj4ORXWAiKw/NwumOR7nQEwKxYtNQbATH7XdDG
cK5RP4pFRsUZQsy0YLZfsV6gqzoX/QoLtfd5yDQ5e0O4g3m2TOAgCHX5eTsDXIUjocU0uOXwXGYi
A0gyh+soRIrMkMaUwVTeke5xsd2TEz+In3ZasbAOW+q6eLUjXpE3lnjCqusOeB9Aefe4RrwtVeAp
VLRIJnykqONYXLVAvpmBodPYuji7AYBgdtSstdZ7eggwjzu0cvgM+OBkPwNFOTUz/RO13lGi7gGW
DE3aTiZCHCFU5w4wy1NcI9uFTw75YWZY6n5biCmrMWzlX1MgXd5ICgniRXtQ3V04hlsZpB3bKDGK
OX4sJbFdQUVPra6zTfeYrcxVJGHBNf4rAP9ugQab7QDaFPS42gSiqPY4nccWAPs9PIadUcz7nd/y
4Wm2mwlhUg7RxjanrgrrD/yXjbD5Id0ms0y96dkO+BIlP9DSj56w1WAR+QVFqvYwu2GXlQJlbOwV
vVs=
=RRb+
-----END PGP SIGNATURE-----

--JtNxE1TITTUjh336w2OlWq1BXvBZPIZL1--


--===============7567466148420279855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7567466148420279855==--

