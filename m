Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F207CC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpp6RvF8xImlCn0V66R2vKVl2I0+2F2ewjtgibZk3UQ=; b=hI6Ooe7Hv6JDi0
	9o+h4ItwVKpZdKV6p6T40L56ZoYw/jk/cpwDa699kHC3K8Fy71c2FixE8R+T0u/E1MK03dgoc/Ipx
	tRDUCsq3dk8S363iyelgOyl969F0RSPU990NHAeQqOU+6Dh0yAD4rBZp3mfw04Ji9RyMqKIb0qCGY
	W4iT6MmU251a1x19SIpg2gss8nejxP8DEIzL6d6cg903mVZfLEgqz+4bvKrXVtsFB2RDxa1ctmt6h
	iuodKCpUgtAbdgvJm4/1nDBDGmykNASzRj3Kk+yHOUCQk9qEGJCIGh7lZGtlzO81JNIKfwiYlGFoU
	EA4IBy+jY+uObjVlhTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHJY-0000000HCmG-3gV9;
	Thu, 15 Oct 2026 08:59:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHJV-0000000HClV-2SgP
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 08:59:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso21278365ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054789; x=1792659589; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTn0EhBpANmjKhHsvyvAy8HwjaDH/CrCTffTLDLZppg=;
        b=sWwBSiyuLplIhP+ZcHFd8ebpQGdysMPOouFuEy5pCo3jUzf69wYHJJ9Su1lZD7ZmQj
         k4eAj646BWjP/s0/j2XFqUSRQ4BoKjxXWT+kNDl+kWsKr9gudMfkrKAAQaQ/H6J/R11g
         Rr2ifOJ639z9b2HGTDx7U/AvKY0lZO4S3OZkpUtQGkWEZ3pSkNDVVaQ6zN8FpJluS8r7
         vUNhGZIz6N7S7JyTtORf4p+I7VGFMVMYvUJ+kI81HOk1lrmoIItDAeuL1tZiXXyDBFvu
         1xmJ9DOLJvys8/BeZ/GxuTekqwUv5s+QG3L3wREJG3NgO7gFmRpcoHZymSGAOckQkhBz
         zJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054789; x=1792659589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OTn0EhBpANmjKhHsvyvAy8HwjaDH/CrCTffTLDLZppg=;
        b=yaQnu//4OPU8LgSaTr/77ZiIBEJiOgsvZ0l5LsQIN97EbBi1sE/fEIerBTqGn9+pTO
         DX0fFplW6lVfH6XGw/ux23x6F8bq20ZVB9UgR98TsYS4PXZjvq+O/WxRPBEq9/29xTM8
         K/pMvCp5YZxo1xvl2Kwhj+G9pui9/LsBSruBS02QmfyqaoE31UAMhFS9SlV3rhzetW5C
         82K7em1397WW9HQZgt3nxV0JeCrLBgnq6kEnKU2b3BckDd/LlNY9fM4BTQ+DPNZinUAf
         iWwwtKm/fxVTXl5nSPhWfw4JonMK28oDXV7rRMNLXWhXBc/knF21sYX9RcnQt3hHB50/
         XV8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw8/n+ctBvkmvtTtoE7nxy0JMQFfoAWCmznd605We8crWo8LJF2ZCRVfWzYRXnaZHJ9yiyzeg/jgeqQcg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKYQ7itGxwHAuGqGs+jK/WdwlKwCrcLOE0IFP5Eii9uh00gFiml
	q5s4eI4+iCjmXdyy2A0NcrDTQgo+3IW0+peo58A+QcMVX5gbIARpg8a8
X-Gm-Gg: AYBFou02t5q6Co98cU//pX3jLh1WaY1yJDJ6gQ7dUabx0kmUGMl3Kt/xKmzhGhnSRP5
	0/gZfdlRZwzjFDYHWTyllyh9b7Mkvq0bTliTnpvBAsQ42GIybecHKYQh69hhdftel6yvSqywX76
	LjEB6Y0riCKeGnzRxSH+Ew2w0tZRgnMVTK+bVoZWUyNBbXbVqqu0fLPvEJmjTcyy10OASHNIqo0
	IIbjhNnaalGZysbCAfooVlLRqwSuqbT9zufiPnDvN4dJ1NmufRypsZ6pI8l72dgR1AWUXmWVuvN
	TZUgRTQctfImPLlQ5ZJ7TsAFjhZBI280Nul1FsTIvTRrr7w8KKj4eUnuvlQ0R8OJuQrL/JNO155
	SEHN2caBO+UMDNt1ZJXLIn92Ykhr5rC61ANOvuGTAMz9o7+gZHzaiuNL+htRDYGmfIFiTCXDS7G
	ttt89t6MMZ8mPG4KfaJTvayNb6AghHh49Fiz0od1DyMN16ZAM+qLNrr69NZDNp9mK6SV05
X-Received: by 2002:a17:903:38c4:b0:2e9:40ef:e44a with SMTP id d9443c01a7336-2e940efea29mr41054965ad.3.1792054788685;
        Thu, 15 Oct 2026 01:59:48 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95cf92dfesm5476715ad.11.2026.10.15.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:48 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:59:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atCVyX1tV0VXe72k@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <atByyAg-c8v_IiAj@monoceros>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atByyAg-c8v_IiAj@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_015950_624706_2544684D 
X-CRM114-Status: GOOD (  14.08  )
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

On Thu, Oct 15, 2026 at 08:32:19AM +0200, Uwe Kleine-K=F6nig wrote:
> hello,
> =

> On Wed, Oct 14, 2026 at 03:45:14PM +0800, Inochi Amaoto wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/platform_device.h>
> =

> <linux/platform_device.h> already provides of_device_id and
> <linux/mod_devicetable.h> pulls in a looot of dependencies this driver
> doesn't need. So please drop the latter.
> =

> > +static const struct of_device_id sophgo_efuses_of_match[] =3D {
> > +	{ .compatible =3D "sophgo,sg2044-efuse", },
> =

> s/,//
> =

> > +	{}
> =

> s/{}/{ }/
> =

> > +};
> > +
> =

> Drop this empty line
> =

> > +MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
> > +
> > +static struct platform_driver sophgo_efuses_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "sophgo_efuse",
> > +		.of_match_table =3D sophgo_efuses_of_match,
> > +	},
> > +	.probe =3D sophgo_efuses_probe,
> > +};
> > +
> =

> and this one, too.
> =

> > +module_platform_driver(sophgo_efuses_driver);
> > +
> =

> Best regards
> Uwe


Thanks, I will strip them.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
