Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6356CC369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 22:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4nZ6nckw3b8dtQjUNY+av5tT7mgU8StbrA1cs+HjX8=; b=KAktX4K5g9klva
	I8BxGuRO+GN36Vf+aydBqZbQQlOO8e7uGbQXymC3Wyoq5B1KDL6kA+c5LkELHwrI5315Zkuc75vSj
	QqJlQeLwAr4XL56r0tr8HpmZW+KS8ZKxJPMyC82sF9YrfwfbZ7K5emr4I5y2w8FhAPQdfnWL/9Jdg
	0igZq0l5mYml7AfJ0AYSnNQvCfqaHmQ4VcrcqEd7xTQycQMognECj9qmR78+BdS63SB/I/03HSa9A
	YBOyBWCLQi9uqFulMMGztwv051o3V/Acyq5hhFfshpKsy37r7zq4l8C4pYpmmLUNliClT4jmEYMeB
	e0EMsUB/dmR2XMyD307w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAG4h-0000000EAXO-1feI;
	Wed, 30 Apr 2025 22:38:43 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAG4d-0000000EAWt-07nN
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 22:38:40 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c9376c4bddso38911085a.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 15:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746052718; x=1746657518; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vQMd4+KE05AiC2tiYMqBEsrGqf6EspjdNnY21/A2l/0=;
        b=QHTDptYM3TACoq5DkzgYGTd14KNUK/Hsg+B03E7Inaa07mSfUxwobDbalxHuL6qNfl
         c3dhOrStjkAJynMO7Ndx0DGUDai8n46+pfJDk6qVHtPZwD+PmQ65P+zx36Rx9zvrcxsK
         47ZfiFIfLw5WlCpVMa5TPv/w2QHy2vdW25Hv78AYVRrOr6UuhP4+rgm2HJikbZiuV4T2
         shB6J7cdS9hrmGVMdkg1Qj1e/0Dh8JvZK+l5SW492mCOIvLparivqVfgA4yHRb084oS0
         15+4HQLfzwfJWrTaZ+5PASqopLBMwN9885Xdp9fgEbji8/xuj5/sl27XgdxWvGxX0kSO
         vdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746052718; x=1746657518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQMd4+KE05AiC2tiYMqBEsrGqf6EspjdNnY21/A2l/0=;
        b=hH9zG6B8I9pJ9cKru61WfvWzFh2QZH6Fa7WxVKtuX9SjA3XMDBQkFPmMtbvJ0vSIh4
         Hf0fA3KqLT7mhdE30EvmDAnLFUEtqLKq/lWpDWuBEtVyd//LENRigSTECOiSXSXQTiRw
         0LJGz1+Tk0WptSPfngxW+KRmTRNPcR+J6x1NycIMOVpXeylyzg+hWPGESSfM55WmEXuR
         sKcF1GPgp0ThGRFgesp1qdi5xgUT18W8rTF+vM2KZ2PcbwIX0l5j2xvYXFByxGDZdqF3
         Y67zo5obVtf7xVE9wTFI76tsdhiF5ya38FUQXjwPw7tuC4FYamTpgNQFMB+T1kmiws0j
         6meg==
X-Forwarded-Encrypted: i=1; AJvYcCVO33Ih16YXTpob826vXKEEunABs+zyIz6aK61ggx8bmZ4mPMx+kKEfvDBFX451HOaqrLgFMdptGNS/DQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE9wBqoUp+Sa/Hh/Iw0u+7x/Zo8at+ChwedhBhJYAE5LbI9Pbk
	eLkNCnPyN5PFToeliZu0qaf301y6BqzNNT2Ny/Euj5tBvd9jZiR3
X-Gm-Gg: ASbGncsSbHf3u8Qd//vRDM+V02nrSiY8tkWspQ+DfXWuEjBZW6G2I/vxXE/zd9wZEIq
	7S7IvFLZYNUHuAnS97r+kQp3pva8nLSKrtBSW+zAKKKU4aGQdsi24ou4WvbWoJCqcliAz9lsjbv
	1UgbO5n8oUjyqoY7Sxt9A6eIKdJSCj5O8Z9kO/nmNfZKkQjOKBB9rWTmek7pBD1WPo617FgHSg7
	xmACVmzBm9HOOpfDl3U8MuuFhgieRJdys0RdZHLaMMopEjkoYnv0/ys8isezp9sPST9ruNJjENm
	goUFwSJay4k3GuTH
X-Google-Smtp-Source: AGHT+IEPKtkVF8ujzFEgXSiPNo+Q85srLA3blCN17p2R6lHtYzaH97Dg/qRUupCq5aMr7gFzbI+8rg==
X-Received: by 2002:a05:620a:248c:b0:7c5:9c13:2858 with SMTP id af79cd13be357-7cacee78829mr17841585a.0.1746052717703;
        Wed, 30 Apr 2025 15:38:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cacdee0d90sm15158085a.87.2025.04.30.15.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:38:37 -0700 (PDT)
Date: Thu, 1 May 2025 06:38:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <miemx3dszewxyu33ymwbrdmyjxa7emay4z3wst6fgbsk6kdpn5@aa434epgrszf>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <9ea234373b18a91c6a2f7a41c441002de1e92e98.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ea234373b18a91c6a2f7a41c441002de1e92e98.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_153839_091105_6D157660 
X-CRM114-Status: GOOD (  19.12  )
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

On Wed, Apr 30, 2025 at 05:39:52PM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> =

> On Wed, 2025-04-30 at 10:09 +0800, Inochi Amaoto wrote:
> > Add of device id definition for newly added precise compatible.
> > =

> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> > =A0drivers/clk/sophgo/clk-cv1800.c | 3 +++
> > =A01 file changed, 3 insertions(+)
> > =

> > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-c=
v1800.c
> > index e0c4dc347579..e10221df6385 100644
> > --- a/drivers/clk/sophgo/clk-cv1800.c
> > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_devi=
ce *pdev)
> > =A0
> > =A0static const struct of_device_id cv1800_clk_ids[] =3D {
> > =A0	{ .compatible =3D "sophgo,cv1800-clk", .data =3D &cv1800_desc },
> > +	{ .compatible =3D "sophgo,cv1800b-clk", .data =3D &cv1800_desc },
> > =A0	{ .compatible =3D "sophgo,cv1810-clk", .data =3D &cv1810_desc },
> > +	{ .compatible =3D "sophgo,cv1812h-clk", .data =3D &cv1800_desc },
>                                                            ^
> Should it have been "cv1810_desc" instead?
> =


Yeah, this is a mistake. I will fix it.

> > =A0	{ .compatible =3D "sophgo,sg2000-clk", .data =3D &sg2000_desc },
> > +	{ .compatible =3D "sophgo,sg2002-clk", .data =3D &sg2000_desc },
> > =A0	{ }
> > =A0};
> > =A0MODULE_DEVICE_TABLE(of, cv1800_clk_ids);
> =

> -- =

> Alexander Sverdlin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
