Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41669C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 22:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtMxDcc4Ve/7+QmNwLk97JHH4IyYyWwY3NvUXswnKiM=; b=cPXSpwcEa99u3y
	jpERAVQyvjCMLRsM04iIizptkGZDDhGjAaozg/vqAgENStYJRhsC96eVWiQi4IbBlWqDmSQ4IqzCl
	BrDIKAtpbt6fw5DDNKGGUvw7IOiRNSK+bYOex9v0ccx/IG5Vz0QBsfvc+LB/5xx+XPkvNLyNSbms8
	wQrU7jpazo2zHhHvd30x/xR3x8TQFgWAqtbKe1lRa4ak2zIEZQvz3Q0X+9I4JtkKDbgCLeJkc9cRL
	vnEZ3DQ3mivBIrzxcK2cwlkR2BXCT6LjaPp34h7ufilmTBGoIyfXtFwlgBP3ExoGZo5T7CVt+7zB1
	m8s1P3vhpfUfBOG6VhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4Ty-0000000GR7Z-44Nm;
	Fri, 14 Feb 2025 22:48:26 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4SO-0000000GQsG-3Zje
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 22:46:50 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso22759156d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 14:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739573208; x=1740178008; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QzS8d5DDLmgZezqT2Ij0pTgVW3KTLdNDnJ7HtnIABGs=;
        b=OWnCEsQVYZ66wbmOuGQsYAtq9eFagih1S06sVDRU4JFr1hEDSpFBWKKkUUHlwYVO0E
         sDwlVwQ8dHg4wxHzAPfekKUlKxC556tty5td2UMi5sDcQVHrRQhSORPitA8M3vC0Y4bM
         1DUU91Nbe/Zz3CNQx4Q3VLuS+2ws6Kbx9mXjsDA7DvMyUFAX2sV+Y5vP8OssGVgh4aU2
         qsQDoCNcdRWKaDa/pr/uK4pIZvx6GKAm3fr72zca+vryuKyR7v+hRbwaAOf2cVAKB1s3
         nHuDjfmwndrLjNcSMz9YnXw16Hz1vTs8O1fqzZFfDyLzDCLRTzzRmzEYRz+4c5faKUIf
         Q3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739573208; x=1740178008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzS8d5DDLmgZezqT2Ij0pTgVW3KTLdNDnJ7HtnIABGs=;
        b=TDBlgb3XQRifSeMToha8I0QIhpLn1wIsAHAsTw0/oEnrNCIXhddRAK9WOzo9Zl5usj
         zQ4UbSuyA0jsjXKYbBq360DJxlOmXZ2gTf+Fp+tUfvoTtZybbvZmiDIzMl5vpaMCDAok
         n6L3Ck7/XyfqfbIzFfgVjfJGvEXIK0aAreIH3aBKIqtTgewfEOPSgSx6eQ0QXo7XcRgx
         fp56juI0mCRFHIBdUPWaIWMY0cBSazbpMAYu0s6ehxivBXureRtW20iFliHizbAeHjqg
         NXc3jOLNszr4XF6uHpe5Pk1OY6IUyWuS7Chr5Xzy2oLYK3Ax/K0ukIhFQgFLKrM/6a9z
         0tMw==
X-Forwarded-Encrypted: i=1; AJvYcCXPh2O/RG354nQznTvqNY38zaK4Y1jffnZCNxUMel7I6T6h3qwWWU6txTjdU4+o9uK7Is9hQSr8jwIRcg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/MHltxb27JxWLJncrYdUbKiSTTOhwx5k5fUE0ESXrLR/vJ0HF
	zeDu7EmVTkXAUsiYIwsxOpL1wadKK4eCyqV+auREhaAUPmMNU9y9vzobdg==
X-Gm-Gg: ASbGncuIM8YUstdfPGxrScSJTt7SsHX27qie3mlp9w7YfUT91qSCMPjo+XouMMnUSRy
	dYxfBN/J55VAWd9VXTct28ZX5OkJYUDRo+JiG3HRdkcNT95E43SAR5L7eghbMVdPrEEKWUwHlDy
	RNpzKctdMv//ro8+Op2nLRqjA1tRZWy7uy/GP0HBzx2fIdLiodu+TWg6wkvo/ef2FC03Yx/DEkx
	M105svtuOCA5Qxg9qQbIk+4R+wRpT/l2auWjlQRIr4wiqXfJAh7TB08mhc5tKUAy3Q=
X-Google-Smtp-Source: AGHT+IHrfxO8rmBQBLUcjsYSsdpJHDyVL3wH/IflhNcUGb5EOUcTe+mYC/NamiViqeorO+aQjcRI5A==
X-Received: by 2002:a05:6214:300e:b0:6e6:6bd8:3a82 with SMTP id 6a1803df08f44-6e66cd10d91mr13805796d6.42.1739573207607;
        Fri, 14 Feb 2025 14:46:47 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d785c1fsm25862706d6.35.2025.02.14.14.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 14:46:46 -0800 (PST)
Date: Sat, 15 Feb 2025 06:46:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, dlan@gentoo.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
Message-ID: <s3fsc6cp2a7qx5qgo6akneh7l3a5aknzmtzpsq7lvdaleqaupa@6sqgfn4q7olq>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
 <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
 <t6z6rikut2him5m57b6xubbguw3llczp4i6d5frcpuhlqihf2d@booethzadxsq>
 <964a016b944b459a9a914abac539350769323259.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <964a016b944b459a9a914abac539350769323259.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_144648_892562_6B40FF43 
X-CRM114-Status: GOOD (  19.93  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 14, 2025 at 12:09:37PM +0100, Alexander Sverdlin wrote:
> Hi Inochi,
> =

> On Fri, 2025-02-14 at 17:40 +0800, Inochi Amaoto wrote:
> > > +examples:
> > > +=A0 - |
> > > +=A0=A0=A0 #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +=A0=A0=A0 rtc@5025000 {
> > > +=A0=A0=A0=A0=A0=A0=A0 compatible =3D "sophgo,cv1800-rtc";
> > > +=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x5025000 0x2000>;
> > > +=A0=A0=A0=A0=A0=A0=A0 interrupts =3D <17 IRQ_TYPE_LEVEL_HIGH>;
> > > +=A0=A0=A0=A0=A0=A0=A0 clocks =3D <&osc>;
> > > +=A0=A0=A0 };
> > > -- =

> > =

> > Just for curiosity, Do you leave a way to implement the
> > 8051 subsys, since its registers are in rtc. (You can
> > check the chapter "8051 subsystem" of the SG2002, which
> > can be found at https://github.com/sophgo/sophgo-doc).
> =

> well, I suppose, you know the answer, according to how this has been mode=
lled
> within this series, all the functionality could only be added on top of R=
TC
> driver. =


I don't think it is a good idea to add everything in the RTC driver.
I prefer to separate them to sub devices if possible, so we can
make full use of all the framework provided.

> Do you think it's time to re-design it as compatible =3D "syscon", "simpl=
e-mfd"
> with children nodes for RTC and reboot?
> =


Yes, but you should submit the 8051 and reboot device early, and
change your binding with the right compatible. It is not allowd to
change compatible after the binding is determined.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
