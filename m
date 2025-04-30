Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FB4C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 06:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwGAJnU85PPCOFCb7zXlJSExzNNYaa8uoIWmmkXwgVE=; b=q5B4Z9xcdHHTj0
	AdX97icrnWhtJBZviBk3UWBBWojcuHLmKiw8cMadeLSaYNuSyc3uCOXNWGIET6i6L0eq2iKpGakqL
	LoFXKu+wbwvCAkoWfot+I/jlllMtXXx8DGJY8XOOic76DlM2Haa+HWmjOFMmV6Odxq6HiS6khGKyO
	kdqyuE+4T0/wtg0wym0T8/yECe0yV5OYkXJ3k+v+ffAFmgndtz0dtYvnkiXepU0bwX4zJIIjxmlZ8
	Nrj+MBtHlNnW6srYwN0MtL2dxZYeDgc2/zl6WxuDcyvzzUU2/W7TNoHUx1X9oNVRTEmyxvApczkpr
	GBdLIcdnFxjGuUGYb93w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1M0-0000000BvHo-0AmB;
	Wed, 30 Apr 2025 06:55:36 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1L7-0000000BvBf-3AtG
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 06:54:43 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6e8f6970326so78207306d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 23:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996080; x=1746600880; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IHPC6ouTLZh9rZq6+aZMT/nynJpeCvxeKEaQao7uCfI=;
        b=a8fuaPVIEOIfPApzY0gJdn6II0UuUypBXrgZKrwedfBOsyjjlWvpXhLe+o+lomXBiE
         mbWvWp63JbvPv3Xgn0pbiB5IYF+3Mv76Lu26SgzOBH2pWy2s9EWPE4L5Q27RoT2ndNhk
         MHmbJ/+sJpPu/slxUkHPuMzCSfxq9ibV+XlrsFWZxE65cmfFZf/DsfHyJF/7qwwkaBW/
         C+tXyjm+zMEYyFFgFREmsiQnuf8PQh5IdqxTsEJ5i0hvWPqAKWaIy5WMJuu+QbCwHZtk
         9HJJHWRNQkDB2cPknyZFYyTEF9DVvPzAWRCU5ts1OgZkbkR9WJ/F5mx2/2bZHDPrf3nO
         Oi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996080; x=1746600880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHPC6ouTLZh9rZq6+aZMT/nynJpeCvxeKEaQao7uCfI=;
        b=aWk4LTv+ollHdpxnBaX/dZYLPDczRVLu2b08IKqBOD+JNV+rl6Yuv39fGiOi92nKh2
         xIh19B6x/OlBf3WYs7CsZfdVfcRXvK56OQzRnFbFjyiJJ8DbCg2BuhDW/ZyhZREMp+IQ
         itIrwOQJ1UnkGjt9JyJvmvxiIFOWPRPf3+tiDdPYVLzcNccdTJZVTwBsEqFS6Y6wlKFE
         oi/dX03lQ8clmrH5VC4dvdVUKnQqYSvBI0D+wIrvqnUlHB9JpgoM7qpjtjg1yVwgAdeN
         zCXpbCjdYAY3z+P4A3Pu+ddH99bBLWyRB3+R7FyzG00M7RNffWq/mboOhTepCf77p+3J
         OGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcwHOQ8ftesXV83K3Fa9vu7O2rCtGTvtjQfTwXKVa7sk5zI307q63sS2X79W/DQZ5et6jGqKXpaorxog==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfXHQWMiebjcJzrJLNogIeIk/mwqelg0DZFHh+ygdMPxVSQSoM
	i/62D3miPdsPQxlJWtv2WRdtbCkJkBv0r5X4WFpoapJCSgFKrUfB
X-Gm-Gg: ASbGncveGh724+jq+aOJUhycfbA+NyxpkrYSlgMzatVTN5Sv6CTpya+IfsL3b3xmk7r
	/QGZvyVxPdxjxWVojldGXdt4R3AzF6AuE4Z+O0Mb7m6aa4xeH4TFj8qBdV3ztxuTQB2ptYKDas6
	9+TiN2ZTT+rRyX6KWQWTYqUBP08Rpc6yow5BRlcm6IQclWYJf1raP7DFMIe+uXuzlXcdLV2ZtYa
	Nyj0k0V3wFuaHwl84yLxkIXi3QjiM7o9gd7YG2ogboHlBrD/80oB0tqt/QWxZMVBn+ZZG+r0uqj
	NwGfLG++yrNEoX94
X-Google-Smtp-Source: AGHT+IFizVCYxmFryP83K8Efv63dHaODZi9WbULtELwp3gzA1WDs1vRsKFV4wOSDStjITe1CP6hCgw==
X-Received: by 2002:a05:6214:1d0b:b0:6e8:fe16:4d45 with SMTP id 6a1803df08f44-6f4fcfcb78fmr31461436d6.41.1745996080261;
        Tue, 29 Apr 2025 23:54:40 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe8358dcsm5091866d6.86.2025.04.29.23.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:54:39 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:54:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Ze Huang <huangze@whut.edu.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yu Yuan <yu.yuan@sjtu.edu.cn>, 
	Ze Huang <huange@whut.edu.cn>
Subject: Re: [PATCH] riscv: dts: sophgo: fix DMA data-width configuration for
 CV18xx
Message-ID: <uo7nea7hxw7qrzw7yhtoulusejbynw6qlotwozpboxtm6vyotv@rdkuc4d776so>
References: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_235441_793609_84FDCB41 
X-CRM114-Status: GOOD (  11.58  )
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

On Mon, Apr 28, 2025 at 05:24:36PM +0800, Ze Huang wrote:
> The "snps,data-width" property[1] defines the AXI data width of the DMA
> controller as:
> =

>     width =3D 8 =D7 (2^n) bits
> =

> (0 =3D 8 bits, 1 =3D 16 bits, 2 =3D 32 bits, ..., 6 =3D 512 bits)
> where "n" is the value of "snps,data-width".
> =

> For the CV18xx DMA controller, the correct AXI data width is 32 bits,
> corresponding to "snps,data-width =3D 2".
> =

> Test results on Milkv Duo S can be found here [2].
> =

> Link: https://github.com/torvalds/linux/blob/master/Documentation/devicet=
ree/bindings/dma/snps%2Cdw-axi-dmac.yaml#L74 [1]
> Link: https://gist.github.com/Sutter099/4fa99bb2d89e5af975983124704b3861 =
[2]
> =

> Co-developed-by: Yu Yuan <yu.yuan@sjtu.edu.cn>
> Signed-off-by: Yu Yuan <yu.yuan@sjtu.edu.cn>
> Signed-off-by: Ze Huang <huange@whut.edu.cn>
> ---
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>

I think there is a wrong sob here, also, please add a fixes tag if
you fix something. I will take care of this when merging.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
