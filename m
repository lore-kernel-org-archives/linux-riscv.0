Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2225DC636CC
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 02:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJiudBAhigUQGUlmn5l0vZn2NAtjvAAOi6cc93GeeTM=; b=qgvsSNiAgZQR3n9Jh2njmOJmA9
	7OMOeHlq6vApN1CUMs1wWWK0VTpf9ya95F8jptea6qVvheKfXjOyDlR48oW8jSg0R/jVJMHL1r8U5
	1C7qsPr6MM6SPNzlvRuQMiC7DOoZNr8E0OQ6aisYZW4RXYqlmK4BYJVSEtFRW5UobMkaPTgmUZJB5
	It3AaJb2bf/XluE8W3WBmZcOB9z2FlxoW+l0ro9s/TQda80vQcuuTiEt8xFhNMXkCBv09PyghBElt
	BvQiQnp7TWUsq+uBYinGXb596ECm2Y+0hNTCarnqzY50GgtXExM2IQcW1KkzDWoISG2eF8b6sQy4E
	R7C5HBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPwGw-00HSqi-9f; Thu, 09 Feb 2023 02:02:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPwGs-00HSpm-9X
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 02:02:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id k13so1380196plg.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Feb 2023 18:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u2fxHLSSkjd2gBaPqrUy06GUa2igJ/NteR1ux0m4AxU=;
        b=KSZcawBfCEusNKjw99nBJeFxw3WPMe/KyOvtBZHVw5YW/DTxS6OLbUYvCS9G+NJm70
         mwgK2m1MawIVypnUZSDUL5ooqvX52HCw/iNnfQQ2NrYDFp17s5cefLMKgElAeaTRx+sp
         34ow9t+FxCzDAY45HPR2ZmcrMkvlLb3U+kBbCB7BCJ4R4thiesJpD8m4jOFb7eVEpwco
         OuhFsoBFDczXU7GgZXfthXym73ci9xTGv2qmpQEA7iP6eRQyH0YwAawADGmtTkZcuNFR
         N3Bc1NihCdIx6KGnCjfglcwV8++p5wDsF6ZgZrQWqf5g+enspmMwQi8qeh/a5sq6eYVu
         KuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2fxHLSSkjd2gBaPqrUy06GUa2igJ/NteR1ux0m4AxU=;
        b=LY4roIr4L9+bazgJW/EO5wC7jA5L25GgrU4w9sNVRtjy0SJ1GSM/f5NDWBILbXEXTN
         d9YFtRRb9YI7dADQZ5wNAsG+3MKjfXiFX4h2lvcFhUSNslAdS+hDpkZZdeVdGr7bMeyp
         H4MvaKEsuI697G44I5xwVWUsidIoPOPXSD4m9fMSKpriF0jhmmGi23RSsyDfULVQZpSR
         Orsqno+iSo7ngJv8ek7wlBc3hpeWntZAE++JVWLJml5hb7AGl5+IyzczjRrbKjkAizNl
         nrcoqd+xkiJ8FOMpBoW70y3zIU3tVnoOjQNg29aVp52vLUyr2FGpRhg3YSX+9BgOenKp
         X5uQ==
X-Gm-Message-State: AO0yUKVrwQMraf2QQSyVlgktIQmZMovbSppdHY1EqRu3hCUeIslFP5UV
	2T2+Wo8xw5L/ws5FS70Csu0=
X-Google-Smtp-Source: AK7set9boXIbPx56DkwTV7WOExTM1A9N8lAUSIGwpgu/SuCa/+u3NsWnrbYVHr/7FAqfK6RznLu3/g==
X-Received: by 2002:a17:902:b48a:b0:198:adc4:22a2 with SMTP id y10-20020a170902b48a00b00198adc422a2mr3075077plr.29.1675908161514;
        Wed, 08 Feb 2023 18:02:41 -0800 (PST)
Received: from debian.me (subs02-180-214-232-72.three.co.id. [180.214.232.72])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902654200b0019919b7e5b1sm126062pln.168.2023.02.08.18.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 18:02:40 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id D50B81056B3; Thu,  9 Feb 2023 09:02:37 +0700 (WIB)
Date: Thu, 9 Feb 2023 09:02:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sunil V L <sunilvl@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 24/24] Documentation/kernel-parameters.txt: Add RISC-V
 for ACPI parameter
Message-ID: <Y+RUPcCgH48XdbBB@debian.me>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-25-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-25-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_180246_372585_C2D31CEF 
X-CRM114-Status: UNSURE (   9.02  )
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
Content-Type: multipart/mixed; boundary="===============1908092221026835529=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1908092221026835529==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cG9EA2l6QrebhrXH"
Content-Disposition: inline


--cG9EA2l6QrebhrXH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:25PM +0530, Sunil V L wrote:
>  			For ARM64, ONLY "acpi=3Doff", "acpi=3Don" or "acpi=3Dforce"
>  			are available
> +			For RISC-V, ONLY "acpi=3Doff", "acpi=3Don" or "acpi=3Dforce"
> +			are available
> =20

Something repetitive here. What about "For ARM64 and RISC-V, the
available options are only "acpi=3Doff", "acpi=3Don", and "acpi=3Dforce""?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--cG9EA2l6QrebhrXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY+RUOQAKCRD2uYlJVVFO
o+9EAQC8GivmfHn93hRgfCI68JrrUjUfdRGd1PEo48XaFxXfpwEA4gk7qbFhwMKz
RYZmDaevf6DABr9JSuIpV2NrsUIsTwI=
=LwV8
-----END PGP SIGNATURE-----

--cG9EA2l6QrebhrXH--


--===============1908092221026835529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1908092221026835529==--

