Return-Path: <SRS0=mVFr=UJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51F7C4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2019 21:47:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C7920859
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2019 21:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MwVpGojL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcBndJBr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6C7920859
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nv22Mr0y32HEuYDHnNj4EyXF7eAvQSY/c1oxSIQAYc4=; b=MwVpGojLq4pwKz
	f46nRWuMBcZ1s8809DkGCRe55uDx871GNeW4TDzeLO/zC+21lmCXwk3RFc97hl2RFYjwFW6d6W2QI
	4sNhcrDlgCnWOwtoN6G4WVY57Vuqgm4NS9BYs5F0UR5MbU7IFdZ9PBjzm9tKMc5YBz9N9VIF3vGsL
	yvzB3XscPxYIYykmAsp0aCP0EgsgxYVOXXv7TU44qDxFNEjByqbQJtD2OfHnSR26Htkr5IJBZa/eO
	QMoXPAwEC79SrwDovDYW6fkwMqPRHuCgSV5m5Och/3zIfdyU0eSs2RrnpD1upUhz+HuxN2D7gR/6F
	7Yc5mGfmQ1PISq0Hl2yA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haS8I-0006rM-Ii; Mon, 10 Jun 2019 21:47:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haS8G-0006qv-13
 for linux-riscv@lists.infradead.org; Mon, 10 Jun 2019 21:47:13 +0000
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D8D32146E
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2019 21:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560203231;
 bh=A8TOGTJuwEvDUH/d1MVUsnWqz/0g/2fFNSmp+Wiv8QI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IcBndJBr6x/GrCfOf5zp8rcKfj/TR41OBRQ/gcrB4SrrMIDF1Ny94rr/y28vbhhpg
 Ey53NcaAnDuOIxsLaVnk5T4AaD3S6tpj0uSt1RrTIPZKX9oAZdoe1tCZB7GIVfDZPQ
 Jd/WGPKVhIWpLau+kcCay2XV9gLLZhXsQHT3Lvco=
Received: by mail-qt1-f169.google.com with SMTP id h21so12116999qtn.13
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2019 14:47:11 -0700 (PDT)
X-Gm-Message-State: APjAAAXdhIvoz7+FtaEY/TfGy/ELiobW1KvKC1XXYDTl02HoHUrviksB
 nKuNdQ+vKuqVyiG/u/9gJ9JF6+hiQeTQa06nxg==
X-Google-Smtp-Source: APXvYqw9ixaCWUtaCgRr6x7b/pNyEcY2V2n0Ntzbi7l3rhY966w4TpEXuCtCcBErZwa27WAPk/RTAG7YzipmNve+aho=
X-Received: by 2002:aed:3b33:: with SMTP id p48mr54298406qte.143.1560203230912; 
 Mon, 10 Jun 2019 14:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190602080126.31075-1-paul.walmsley@sifive.com>
 <20190602080126.31075-4-paul.walmsley@sifive.com>
In-Reply-To: <20190602080126.31075-4-paul.walmsley@sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 15:46:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJd6s6ta==AoxmNXdpzWL1RytSwR2P4MOfAFSEJavbt+w@mail.gmail.com>
Message-ID: <CAL_JsqJd6s6ta==AoxmNXdpzWL1RytSwR2P4MOfAFSEJavbt+w@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: riscv: convert cpu binding to json-schema
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_144712_090437_858D80A9 
X-CRM114-Status: GOOD (  13.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jun 2, 2019 at 2:01 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> At Rob's request, we're starting to migrate our DT binding
> documentation to json-schema YAML format.  Start by converting our cpu
> binding documentation.  While doing so, document more properties and
> nodes.  This includes adding binding documentation support for the E51
> and U54 CPU cores ("harts") that are present on this SoC.  These cores
> are described in:
>
>     https://static.dev.sifive.com/FU540-C000-v1.0.pdf
>
> This cpus.yaml file is intended to be a starting point and to
> evolve over time.  It passes dt-doc-validate as of the yaml-bindings
> commit 4c79d42e9216.
>
> This patch was originally based on the ARM json-schema binding
> documentation as added by commit 672951cbd1b7 ("dt-bindings: arm: Convert
> cpu binding to json-schema").
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 168 ++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/cpus.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
