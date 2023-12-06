Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7F1C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lyW/ZlVwZvVTFsVcK29TniKW5cl6o5DjNYiPh8RiI9g=; b=pegRChfJQLV0ndXpj3YppL7eGo
	4j/wipAlZndf3YSVZlfMACg/362QpLe/MFIx8IQlXPoOU5u0/vZtQ4XyEUPukXnpZwoUEtJG4qcGz
	skWlC8F/v9ZSjzbyCHrbqCqn2AkJ9SJzHDScEqAIKKiQaSg6xkycdHKxC5/PxwRVHgY3l52wUxN/I
	k7OuT7QD97iPmeYM92pREMDzbWJr1XUx88YJNBXXGgesjL7RSYGNPcLLLDa3lmLgMObRtfIe/jdvS
	U+qY+RKJGpGJNPTyBtcxXUwyWo68Au1iCJjSUXN4ZDNtONV5iN/AMwm9L4c+YM9LdouvBKZgkNFpD
	Jph9KgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoxd-009hmQ-33;
	Wed, 06 Dec 2023 10:16:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoxb-009hkr-0G
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 10:16:56 +0000
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D493F44450
	for <linux-riscv@lists.infradead.org>; Wed,  6 Dec 2023 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701857810;
	bh=fPFWRVi4UC1wxgK1BZ+tE5lPscptXMAGgYLtmt3rvb8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ZvjCMm4z8+aPeQXgHOC11023LNeA1RCWyeYYAttuFZQX87c0VL/ML0DNgHYuUurZc
	 qH1TiRCdc8s2I15J0XovpyB5k0XIK986QzpAbbmjojQPwEMlbXn97u/7kkRsyntUrD
	 WM5XCxlkL9Mnace97k4u9T86ypP1LiGleuQky+8ySnahjpStNT98sjlq7O/PydmmQ3
	 iFoQw3zjvaT2vqf5tRygXO4ARuDv3h1y36rwqKub0oxcDZpGeIsb0jC6dsQUO/0jAu
	 xHeAMa95WlmySUAxqL8zZNg7Goz2Qt/cjfJRk3GYp5RKIllprP2CJMmc/Py/mmUuwN
	 Hs6I48IyqekBA==
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2c9b97a391bso65184691fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 02:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701857794; x=1702462594;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPFWRVi4UC1wxgK1BZ+tE5lPscptXMAGgYLtmt3rvb8=;
        b=NwLy7I7G48NHQ+7IDlr555arxOcXPC76RZkGmmNcxqRS6tTZtBE+FXOq3ojOfcXzzK
         Ky3feTxat6jisNuxDtnf++0o3dmrmCO4JUjsA9WJPJi4+gWQgMlfk2bOxHE3YPqcLbDc
         Yczng4eu8ELRYfMqYUL/TPO5oAMq41yDSXiIjZ+oDua6cdRmRbjRvAAupTq2gcAkE/tc
         G/Knc4ZFwAwni5uyUOznXnJUCLjK9WWbWbVs9DbiAbXCR2FncmI6cfJfStjvI6sEhpWq
         ByswSyU9IS/0FWprs6HDyw7Iq25UmvWD1d9FaGGOVY9UPnTjL3luAD2VPOKAxcoUPHVz
         6Pnw==
X-Gm-Message-State: AOJu0YxACXNqPHN5CnvOY3kmnFW/UX0NXG4dHRHPnBL2q0+g9+oEC8pA
	16N1ykq3NbD/8kn7PQApIuSyVfgCkAAsjwUbbzwO0Ac64s29tg2JNpb8gVh/HHHYwnFy35lwb3N
	rjvpmxiaYWj7f/ExQ8okyLaA8nwh6Ag7wd0P3h0biEamvOJxwER+IZHYXic5BxQ==
X-Received: by 2002:a2e:740e:0:b0:2c9:f925:df0e with SMTP id p14-20020a2e740e000000b002c9f925df0emr211951ljc.34.1701857794552;
        Wed, 06 Dec 2023 02:16:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq781bpnuacD5QiFiBCg1mUOnOOSBbtHNvzHUW70ZtF1hR2gyBittWXfHSvEnQsp0nEdWGwPsBBWgtAAGiL6c=
X-Received: by 2002:a2e:740e:0:b0:2c9:f925:df0e with SMTP id
 p14-20020a2e740e000000b002c9f925df0emr211946ljc.34.1701857794264; Wed, 06 Dec
 2023 02:16:34 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Dec 2023 04:16:33 -0600
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <IA1PR20MB49531468A92E2A7670F1EE0BBB84A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <CAJM55Z9WO+0Yb-at6CAR6=UP9j60iQz=s7MK-3qiT=w-8N6+Zw@mail.gmail.com>
 <IA1PR20MB49531468A92E2A7670F1EE0BBB84A@IA1PR20MB4953.namprd20.prod.outlook.com>
Mime-Version: 1.0
Date: Wed, 6 Dec 2023 04:16:33 -0600
Message-ID: <CAJM55Z-hCzuw+eQ-ABXoBYX7oSScXTKHwUzEe_2k6eSyy5HqKQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: sophgo: add clock support for Sophgo CV1800 SoCs
To: Inochi Amaoto <inochiama@outlook.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, qiujingbao.dlmu@gmail.com, dlan@gentoo.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_021655_246954_4F700A3F 
X-CRM114-Status: GOOD (  15.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Inochi Amaoto wrote:
> >Inochi Amaoto wrote:
> >> Add clock controller support for the Sophgo CV1800B and CV1812H.
> >>
> >> This patch follow this patch series:
> >> https://lore.kernel.org/all/IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com/
> >>
> >> Changed from v1:
> >> 1. fix license issues.
> >>
> >> Inochi Amaoto (4):
> >>   dt-bindings: clock: sophgo: Add clock controller of CV1800 series SoC
> >>   clk: sophgo: Add CV1800 series clock controller driver
> >>   riscv: dts: sophgo: add clock generator for Sophgo CV1800 series SoC
> >>   riscv: dts: sophgo: add uart clock for Sophgo CV1800 series SoC
> >
> >Hi Inochi,
> >
> >This series seems to be missing patch 1 and 2. If you did send them, but just
> >omitted linux-riscv from those patches, please don't do that. Having the whole
> >series makes it a lot easier to review without having to hunt down all the
> >missing parts on lore.kernel.org.
> >
> >scripts/get_maintainer.pl does support muliple patches as input
> >
> >/Emil
> >
>
> Hi Emil,
>
> The get_maintainer.pl does not give me linux-riscv mail list for the first
> and second patch. I have added this to the second one, but the patch is
> held by the mail list since is too big. Anyway, I will add this mail list
> manually if you need. Sorry for this inconvenience.

No worries. Yeah, that's what I meant by get_maintainer.pl supporting multiple
patches.  You can do something like

  git format-patch <starting point>..
  ./scripts/get_maintainer.pl *.patch

..to get a list of recipients for the whole series.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
