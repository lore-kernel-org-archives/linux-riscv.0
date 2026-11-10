Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B758606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 19:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rVujDpGu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ttgd6XZz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kdZIvJqJXJPPWqGwlydk77gPoQQ0VDTqVRdzEZXXc6Y=; b=rVujDpGulmVhPhKnjpFc6lmvkZ
	XgAaAtGmVkqbFAck2gZxp3ApYPr5Ico6KZcj3gK0DrXSVj7fcDzBducSsbNbNZCKguP0IHE8roOHv
	oMzhIN7ThYCQWUWMkDxb4s0QqtoJ+veVcAO6D7bGtqu2yhfT+4fZwj9PeizbIbmUGD+DI0AhSl4TR
	NUi1sLexm/HA+9xgyiB/MgFmnrgPAyx5412Df9ieMnHqrVFzbT64YWZT6FKkE8J/xqfIK+YHU9Va1
	HMllOSUCfmflgIFsvo+lGotzyxWpxzYPl/LSCIIKJCxRHjyHjFzoQQ+Bcr2shiBzvZttTTJWCDYmz
	DWFDxHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrYQ-00000004ubc-3xIw;
	Tue, 10 Nov 2026 19:30:50 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrYO-00000004uZb-49hR
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 19:30:50 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-679334baa1fso3249459d50.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 11:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794339047; cv=none;
        d=google.com; s=arc-20260327;
        b=MSCbYMFqoe8oIQGHRQuEsIScU6az85v3Mr7wjiX5gnH4TRFNmqBaJ3bBpG1Td5OSOR
         AYKOE+4blzdDCNhxORij7OQhsjHm6UEACq19z4vtOmCADrlxOLGYdZgOrTsN+HKC4yO2
         vOSW3z4mK+eXlRJBztGpm6GcET++OQtFNIXMTyB9ZVNfehGiO7OLiLFb5fNFfkJmf7mr
         joAgRDUOSxy3DBLqSgJk0QjAt5Uzh+G455uUKfnvqPeJWHiLtWZvErx/d9UScdut6hJs
         z8fFKxGFsqTdAyGR1Zg/dFxTQTXY+NICTtRKYpL7Nerv5m+CTuvStPuk6jNXsPWiKJq+
         b1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        fh=Rh09wMhYJ58LemDI4t8O2yCdGF7X+XHElIj2ujj+ymk=;
        b=BecL4mGKnAzeBa4NDKN61ErfSuj6VBDIxdqNgTfID/apmN47EtGCwQW6I4KkTuqJ3d
         mUivC4/rU9HzchE1hYP7//ax1eJEmuWjq5vCmSEIf2fC4zAZMThV9wnGs7dohRU2soGV
         EmdgiFGkoDB3PO/fk/aGP1fczajXekK/jklzIHduJLrBrWT/tSJlulA5CSnCc1X5jBUz
         9TK1PJLI7bWT+6qr6e5YGqzbIId85UnaUYHZHHWejm6C5Hx3jwL3egGaVF2qoGeFYvPn
         KYcWChHWP8AaFvNWw3FOAYVe96MeYfUGBKfQCZnr2hYzPomm60i5FkLmNX5w4qX+YsxR
         J/HQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339047; x=1794943847; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        b=Ttgd6XZzGnzcYK5zvBP7/9VukRbIdGvf/zuNpQhelhlMj884+ZCYgMfiZBOR0QQWP+
         wAPnfRJ/o2JTFCh+/nSdAZeXj4cYx9nYig5E4NMCDcsQqqxWyo23lPv93kiwSsjbuQEw
         UsN6RFgiLwFZRayWxL6mI31OBsVbY0k76BYoXVsXIhtE9Mvch/3RMzYnySHky2ngf0RJ
         dyjC8UcKh4vSb0szrGR7pjBDcfrptBQVZ4xq/EN0VOWzfhSuRY6zpwj7QEi3FN6+3ont
         Znunfuy8dYR/ZanUTZIwLW7afk+soQ5ARyVeymsTZMvBMiwYavBlWUFBvwvTwaEUYC5M
         sKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339047; x=1794943847;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        b=ojc3wCxDJgrDAMJjUB16NIV9pl2LhcQe8v+j2BIc4JOAViGK3bDrUKY/oweP6lxD0L
         DSczDYZ1Fsbfbrt4riAwZ6M/yIhMdLyh3iaXw+Fx0hR8DHZ/VVfL0yG+HyHjIpkdjCI4
         yazUfFqK90rwhjsqaC9DxExvg5Km0TK8xuY8mu0CjevITvmBNUQr/VFYM7/C1+HhW6ft
         IWmiPc5baVx5DzZtnJwg5WAbFggKBV50qDQ/QVfrVNw2So+5u4x2yxyDJqM2YiMHmONk
         SHIMBQMvxmQ0FEwaUsxnSHjsOKW8qBfEu0DTHG+Q6kdP02aw8cB8pAMnpWd36GP7YOyY
         oMNA==
X-Forwarded-Encrypted: i=1; AL+hErHkpz7CdRrwRXfuXjzu2cMMGvlEqxNkIhc5VtOBEcW3r6MKlyxbKqIY9+j2olHIrW47i7QCHS08LCB9hA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+0wKlvcFdVXeQAyD8GKCur8EHzGVpfeUlY+CRf9ZlZkADNjv6M
	hqWhCArMezMOObiuyw1o4IVaXc6NpeRsVVyA8SzRrek1TCXW3DF8yjc58r+DC+yZ8cRDrU9f1Wb
	z1JkAjpKoOMhnmbSSxDHEiqRRkB6miHA=
X-Gm-Gg: AYBFou33SHfcqBWtssBlv9FZwnJql7KnVvU2Hs/KoB5sDM7M2O3v4f+VWu+NX9Hch00
	WTEZ9JsK/o2c3UeKnrrZ6ayRtAVdEkTMpcSnbQ4tCAWs2tI858M2Zu2ed5tbNrQmJlBK8y2L4xr
	6phUrfGHoQ1aik6Lz7s5Qu4Il8l0yFOYxPfBQ6lvuK80GHK11BNlAatJJAxSip2Hfin1waLVtIe
	xBWvUI4JQmpMDgtPNkpo4/ruQIY1v2yfMTJjv7hpACdMJ5y3DCpYmnX377rsKYoy9MRgAP3D8p0
	9Q60ajkEbicixWhImlfpjYE4yweSq/xwZtFkhL2MiUfLn1gDI/dw3BV9oyQQkER5q5OAbtKhKwK
	hV1s8jFCzaccO/jJ0J9iZskoyAUgZp8UQvbjr7w==
X-Received: by 2002:a05:690e:43c1:b0:67c:2804:fa9a with SMTP id
 956f58d0204a3-67c67fd7c9emr126041d50.36.1794339047361; Tue, 10 Nov 2026
 11:30:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:29:00 +0100
X-Gm-Features: AclHuK-V5XriYQc7jPlMOpsvH2O8V3xAiSzCm-87ylsSLg9H0W8yUGZ1h1oG_o8
Message-ID: <CABdCQ=N8afBsoZcTA7He3FOR9D2K-yieb9i4cAa=WksjoHm5aQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] riscv: dts: spacemit: Enable PowerVR GPU on
 OrangePi RV2
To: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_113049_038840_8D077355 
X-CRM114-Status: UNSURE (   6.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

A friendly ping on this RFC series. Any feedback or thoughts on this
approach would be greatly appreciated.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
