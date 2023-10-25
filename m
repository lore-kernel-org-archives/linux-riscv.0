Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B03C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vX1w6P4DTQdp9GxvYceDUY01cH45H6mKj6q7dCDYlrs=; b=j89ea4pCBvLGW2PNxZD78GYMka
	qNyVSeLFRVsV3BWCeI84bGXq8RfSvD8hkCHUHiKf7PEO1QSoPXpeEa/AbP19J/4YFmY2WwMCQGVD/
	nXd40+V3vxuteodCa0QnwDjDc6E+2D8Uvy47SBZeDTFELqwvL8ARKNgqFGw8VXntAFUrrJ6lgqgca
	9zP+t6s4y9Nd+rtcAg6wxrSXw29+dCgiNpRGz4tAfIMkJaZvoNL5ZMBbYFvIRS5nwnvDmBIHG1v1L
	r7SxoKhSk5dWPS1vBOmPXqBq6nTKb2hVwGqhU4328zAPBS8GUpLvOzeQFy0xssGwgvAI302SvoN/G
	cl46yMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvjDY-00Cw8L-2G;
	Wed, 25 Oct 2023 19:07:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvjDV-00Cw7r-00
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 19:06:59 +0000
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E9CF93FADB
	for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 19:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698260812;
	bh=BdwZ3eVaAqHpyQJjNHLInPz7RJuDJsJpeXFXoSIUzNI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=uNbXH771OZOhHT1ubpoCjLZZCftiQMexpC2ngLuyD8gtJnVMccwgE/KBZ8AoDUXkg
	 R5stl4haaUS+ZAxvwUHr5gRSuaC0hm+VU1QvAm1RmAl6vNzxpJT+EpYz2Glg4xPVNk
	 dK/2PkjlcLKhp10dpUv2Bv8rKyLvFSDEv0YwZBHh+B7JIBVCtIQF6SsQvLnekll57r
	 VCCglNaW12C+tiPzTRm1rzo9vUTTqlNyBqVBJnSQG/JHso39K/z6/5GgXgyZ7D/S2Q
	 Reu9pumVIxaIoXIG5Tdp2RKtPoD6yQwVuZ2jERPyUMd6wAZ6VtVds4LfYen7obeNB0
	 Aq33lpjxurKvw==
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-66cf1e35fe8so1081886d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 12:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260811; x=1698865611;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdwZ3eVaAqHpyQJjNHLInPz7RJuDJsJpeXFXoSIUzNI=;
        b=D2KARixFe4MsAwYG81OBA32RpdfW47BSR0NOPn+gINlzR78hekUmFTZvV2HZIKTDN7
         kMTm1FulMw1X0lX9WVULOELoJqRZLvEV8ZZB7S/MlBF0R80RcRFo88u+ycNNctJ0DNqw
         ZSkKDnLpl3XLuemRyTmK6SCA40AhSlKAEEp04936SGFXPm8iiRhuxgJ+0hU83BV47TrL
         aj6tG/m/FOoJeATU/mPMssJsTc/jLUn0wxXbkCPytZAuNxc1pUGfhWeFd1AN+hjLp/Tf
         a4koRmefAYmXUjje8oXyB0kmlWQE9wbij1RoiB4JRwnKSKNz5oplnmZDNnJrGGIR+kcF
         MmHA==
X-Gm-Message-State: AOJu0Yy6mS0E00+T7XzX2P6mrcEjC2RO5bzy20sy8iHRfwerEYtIHNik
	jDU+ReZP9DkLcBIFNhwCNkwynXdc9tOjFU6mp0bAlEEd69VLJvD7e1KaiZRDG/VdlGGIPIPBvXG
	BPtU1wzpcWe/N9k3/bOnUZJFyOeWHOKN27OwiSTp9TV3txI9vSpeuUnMOukhEZg==
X-Received: by 2002:a05:6214:ccd:b0:66d:33d2:4ffd with SMTP id 13-20020a0562140ccd00b0066d33d24ffdmr17139786qvx.59.1698260811370;
        Wed, 25 Oct 2023 12:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLO2gfkUwl69w4gSQFYMDMCqyB9EPF4PqKeayY3C56ZJH5AQz9536l4Lwjl6PXc74ecKD4x2ISGpNHCPe8LNQ=
X-Received: by 2002:a05:6214:ccd:b0:66d:33d2:4ffd with SMTP id
 13-20020a0562140ccd00b0066d33d24ffdmr17139769qvx.59.1698260811144; Wed, 25
 Oct 2023 12:06:51 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 12:06:50 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAJM55Z_pdoGxRXbmBgJ5GbVWyeM1N6+LHihbNdT26Oo_qA5VYA@mail.gmail.com>
References: <CAJM55Z_pdoGxRXbmBgJ5GbVWyeM1N6+LHihbNdT26Oo_qA5VYA@mail.gmail.com>
Mime-Version: 1.0
Date: Wed, 25 Oct 2023 12:06:50 -0700
Message-ID: <CAJM55Z9gy4RFXqu8n5jtW4k2gwDtpJDkevdLht9rMyL=464AMg@mail.gmail.com>
Subject: Re: [PATCH 0/4] soc: sifive: ccache: Add StarFive JH7100 support
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_120657_697716_32EE1075 
X-CRM114-Status: UNSURE (   7.69  )
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

Emil Renner Berthing wrote:
> This series adds support for the StarFive JH7100 SoC to the SiFive cache
> controller driver. The JH7100 was a "development version" of the JH7110
> used on the BeagleV Starlight and VisionFive V1 boards.  It has
> non-coherent peripheral DMAs but was designed before the standard RISC-V
> Zicbom extension, so it neeeds support in this driver for non-standard
> cache management.

Ugh, sorry about the broken threading and From vs. Signed-off-by's.
Will fix in v2.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
