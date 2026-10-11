Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7EACA9ECF
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 23:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+jGZGnQ/hsf737SQEFJ9n4hE8QiPgrMyRy4pVIZyD8=; b=XlFY9892J5Us3mXt04Rtnv13/g
	3nyWOLxRa9q3BcQ2dAxTWgYmfZUt0E82qjEGKagL4HoXSKo3xurT0v4N7mN+5AH/Gudpf/PC2CEej
	vQy6X9s/Jfl641XQruQSuxwtdUiSXAQ2I1q636EmuEHFZ40G5Vza1124spCCLwthZRH8lnSFCGgrB
	CkXGSxTI2lCSo5Gz1nsdeATqqxXlMvBT2GSj530X/bhKob7z6V/8e/4jUsDvbEn6Vio58z2PcTqqf
	BDG56UMECRliVocFkb0oZ9DAmekci+SvHc4eG3kNJx5dcVNI9M3NkDfB+oUASVAEpZQHKhO4TZynF
	yyqC/F7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG2jR-00000009UIk-1bG1;
	Sun, 11 Oct 2026 23:13:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG2jP-00000009UHY-1DUy
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 23:13:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso9224965e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Oct 2026 16:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760405; x=1792365205; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
        b=DllvX5mQbzZRpmej46XrJncCttoPGi3+CFBU9CrSYeddC6Vv4uD2wdPu4e9WJFd4nV
         CSF7qlZoaAJ0poqrfoQ6WkawVs7tjW9e1I4xpmSvMHC4Bfgvj6oZ2xHYAuqQvbFKACgR
         kfHXz+e59DBooe2FfzNi9wkGEf68luSvVF8CmPv7fT5jB930sC9J6fOxHkfLrqVXO2+Q
         gq+nPr/nOPwpR1WUUatDjplsHz0YpD6DPClU2qImj8EDR/IuofY/XbHdjGmRgW7MfUaV
         SZ+2iMA8xViU4n36jFUAx3XJKJx0/YEuxu/tBVTGLMHKdyAwSWeK0IIlDIbsixGhc2Kl
         HVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760405; x=1792365205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
        b=yLovRS+mVrfY+hoJZQX32cqkHF5ZlNXbYlmaV41XDu0oCU9cCMTSFRdSQVmxvCkqEe
         4YSsfDCtW13lSPCjR3rj7Ww4mRzYmTjA6/UcNMTWsPVPTuR7dJYx7GH48wMaoI0LVVnw
         Li/AF215f9s3cuYsRkjozkx2gnEbStwuJtXQPSkyUI+965dlCLgG2cMJZ52q7XOAX6+l
         mnNb3uMk8W0bpJhe0qnr8zPlb926ZCMDeJmcH8DWad2a/FKfiGuAhOS2Da8E5EZ+C7Qs
         l/n2XTRd3v3jzTNJCg7lcVUe/+gTWa0NbClXUF8HXrUAOg/50CLblO8iS4ANi/nqQM7K
         0OYw==
X-Forwarded-Encrypted: i=1; AKwUvBx+7cskpNnFyWp0LkgkjyPqdXpBzo2750DT3UsMmjAwGxOHpw12x5klxt8wjRSFMAqTuujbDrN8jO33Ig==@lists.infradead.org
X-Gm-Message-State: AFq9FYIoxVdGsULwsE/8mo0UAZcKxG5eXQzDe1iBvi7R3sLAPDllaQFC
	glNN3GfgbX9/f6NNr5erS9atdWw12Sl4Hi2UFbiiXBft5Q3KZU4hTHR6XemEEF7YIzw=
X-Gm-Gg: AYBFou0givkw8ZImHZArPFnyFbIfOhcMilsfGeYOb3SrNUeiXhScl+H/4mGChlGBU/d
	pLgWJtzvt6kzw0Nhsz+TIk+K3AphhyxrzQ9hFGksJlmu5gmLpgXruvhunDdHqNqspiAqaoY6czT
	UQ2wOyyFFBiOAe4UKN+B6W/gbmfSjjaw90mqCOHjRyeW38vzVJoBM73ofi49tVtVgwXOEjfMF8F
	IJhQegsizjp/tZhrL2paZ9TN8uqnezBl2Gs8gXECQj8d92i+FDytFt6hi4Sey4KLpPdIz2Tmxef
	MNwkznT7MYikWxkZdTBLnWcLUhNQK15qGgKdCMtvL6dxKxdHUtSs8HQUCORnW5D8SNQ61+h/4Dk
	YGU54dgAnAcku8QxzIfh02tk7umSb3HE+yspoUO2ErgRNwQa3/As9Ru3DwdzwBOsY9bMiUKohK4
	UeC1/rgEQxrq0l9PbvbjwMEeZL6R268O9Nqlsl9GZaaD6Kq+jojNhODJIPvp0VqWEk4wBPg554O
	F8=
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr165188775e9.20.1791760404876;
        Sun, 11 Oct 2026 16:13:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bea1021sm222382515e9.10.2026.10.11.16.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:13:24 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:13:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
Message-ID: <aswXwdgpWTVoItYy@monoceros>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
In-Reply-To: <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_161327_371394_3206A16D 
X-CRM114-Status: UNSURE (   9.21  )
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
Content-Type: multipart/mixed; boundary="===============6304952655451624342=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6304952655451624342==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qngddyqnkwhditii"
Content-Disposition: inline


--qngddyqnkwhditii
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 10:48:34PM +0700, Nguyen Minh Tien wrote:
> +#include <linux/mod_devicetable.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the inclusion of <linux/mod_devicetable.h> which does more harm
than good.

If you really want an include for of_device_id, use
<linux/device-id/of.h>

Best regards
Uwe

--qngddyqnkwhditii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMGBAACgkQj4D7WH0S
/k5tCggArhjqsIMxWZn1mdwNpWwWCgDbuq6GCyhWvxK6/4SoEqOcbECNykQJkcqM
gvBI7Zcz8K+t3TTUvkpf5ten3RucpB85MIpw2zPZyT7UNFTU4XpVJ9KXFNT6G57g
GknahtuMpdBREceO6pO3vd/yn8VMXV8clPTPXpgNywW5t6z3QOzEz0IcrZMJb8V6
cSCkPm8gLqPQcJsxc5Jwdjzt/xaeUIEVlS9TgyVY6BrcotwmfGeJsCPubGsR35Dv
rCHn8rkKSLOaUBG2rAWF26nch4TvC8JDsPDVi5/HJBfJhBqHK5hOi/Nri4WSmi8T
kVp10DCvNgThgd+VEI82L4IL+a9Oig==
=gnsw
-----END PGP SIGNATURE-----

--qngddyqnkwhditii--


--===============6304952655451624342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6304952655451624342==--

