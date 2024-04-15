Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07813C04FF8
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HS0R/myIkUn2wRHDDvE/8/4lPB8mg7EWQGHcuvIim+o=; b=npg4Dbazt+je+oJ4fcqltrUMQM
	p7Kfjlaq26ZXV+G9ea8j7E+3pD0xewzPzRm6FgOvrs3Eq2Js7Fb+dbO0E+z5zh2SFX0Toyd/gYZpC
	u3I1B1aoXBgHIa9ffrYtTSryLY6s5wumoVKpg2pPjaEF+hOVeWk4r0KW4JVnZmD6QQVrbinMjgQUe
	YKj4FMshZF007LBAVnRecjAsOrOfqEvQEXHiw9J71aOZUf4v1WA18Le6o+qGiDb2HXUCt+PQc3EbX
	Ezb2+vCwAraWcLV8RRpFinr/wPe2OHFCN5XenYutZhVzoz7unK9bHV5OfxHDHW6hURzhEwl/l8y+X
	RkUoUhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNuo-00000008osY-2HFR;
	Mon, 15 Apr 2024 15:06:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNui-00000008opw-39jK
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 15:06:37 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C4DF8411DE
	for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713193588;
	bh=ACwuhXQnvEF/hV0r95JlwFy5n6kf1JPHYsrQCK8Kf6s=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=uBV7N/naV7RHdasrQ3oFNNc0qqhpyw9peah1xiNzX1nuDV7x/oMauDZ1F+pVwmuaF
	 ZPuAR9vlyv0DJMI40tjQgV3Q6yfZAjc7MDx9p4LqbMenZ6JQ+9eZXwD3Jo4d9w852r
	 yIdozMvZnVjMWn7SbriD3LZos8sHsjNeEUA9t0UIBWUrFRZbjuFRbgZBv3973hqdWW
	 rJZYwtGDlUKj5VFLexp2UQUtstfrey+sOtHA2MPAqO3h9R0QPFGrqdf4kyO9Uipoav
	 srDL5CzfI6nuxNBq1NubVBBzUA0A3BVHvwLx2FSdKLTtN5/J5f2Ksyrv4aUM/sOuNU
	 I45s3uPoLAZYg==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-43689e8045dso39734591cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 08:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713193588; x=1713798388;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACwuhXQnvEF/hV0r95JlwFy5n6kf1JPHYsrQCK8Kf6s=;
        b=eYM5jI1hmsvr8YVLKX1sRK4ExgAKGd9ufYV0pVlO+Ns+A7QaKqRC00oe6qc6MyZ7uh
         UEQfUPppbF4AKjH7uSvufAzhcZL94vuHRn4t9Fy1OyjBe8xAqu+rTv4pTTlSidelbbjw
         20BijMxP4n01ws5eYfxs1Z7BwWHs7PGDYxVlLddh5iG4k0Bv71vLX58E8oliB8Ro+ct7
         UhYL+ElO3P7pRfLY399yFM+pSkblAuWoOTGCaNQlRiJzq9lWsjTwf/gWgP9MOoikAq+3
         q6Pm/W0imcLalWpSjroTqZ7LMeBkOI/ZhiVjZ/GNWHNK56MKr4OCL4RyAEIEMW+NfOym
         tw1A==
X-Forwarded-Encrypted: i=1; AJvYcCVrihrBQ3P5jVtwLBZ7Y8FsLgv8lYkVu3cUy2L5qNKL/FFdu/4kivgDLOdaIE0PsB3pRC5BG/9yD5TkZXHeELU+i0AfC1K1DhqTlhO5w7fY
X-Gm-Message-State: AOJu0YwTZDEoaexNx0d+UVz/EFMtn1VvhECDC8I8++nXPlr8U7rS//IC
	LDZ5zqxStlNHzGpTmVDf3EhmGNDqXexOEvdizPqLS/UV42zHB+PAmhbp7+otsm9UYgDPSGvKCCO
	d1lxBwxxp85OCaAZv1+vjDWgFSdh0uAWmD7Yk7WqagRbP4mUQQEeBaqNHZsxt2fCrvt98TR0+ZX
	Qo6nf0r4Zph6nptaly/75b8tiHcRi8UZbIu3qncWGMUeNORWDfMpup5uQD
X-Received: by 2002:a05:622a:4b12:b0:436:b123:55ff with SMTP id et18-20020a05622a4b1200b00436b12355ffmr9754558qtb.49.1713193587811;
        Mon, 15 Apr 2024 08:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAxaLjMo3rAfRURiOBsbEy16nq0/dLKE9lc5CMmTWJgal5h8DTe6WD4CmrcXUb4G//Sa0GxBleowzaGmTznrk=
X-Received: by 2002:a05:622a:4b12:b0:436:b123:55ff with SMTP id
 et18-20020a05622a4b1200b00436b12355ffmr9754533qtb.49.1713193587537; Mon, 15
 Apr 2024 08:06:27 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Apr 2024 08:06:27 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240415125033.86909-1-hannah.peuckmann@canonical.com>
References: <20240415125033.86909-1-hannah.peuckmann@canonical.com>
Mime-Version: 1.0
Date: Mon, 15 Apr 2024 08:06:27 -0700
Message-ID: <CAJM55Z9CpGCJ07kJ=eoSCJBg=qpHurq8j_dBMjkTNVsb25VyJA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: visionfive 2: Remove
 non-existing hardware
To: Hannah Peuckmann <hannah.peuckmann@canonical.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Walker Chen <walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Xingyu Wu <xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_080633_342791_B60ABC78 
X-CRM114-Status: UNSURE (   7.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hannah Peuckmann wrote:
> This series fixes the device tree for the VisionFive 2 which has nodes for
> non-existing hardware which should have been left to overlays. It also results
> in error on boot when both both the TDM and I2S drivers tries to claim GPIO 44.
>

Thanks! This fixes the error mentioned in the commit messages for me.

For the series:

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
