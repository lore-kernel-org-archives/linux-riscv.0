Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04B5C77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 23:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALVZHCeJ99VAFVzt6+US3IHlOVT7EPzTrLZDz1ky5kM=; b=WJxN142ib6zc7E
	eurfZq1yJwSuNDjPFve5hXj+n57sOqUL85C7EFQQyMf6sO27UPrs1rNBk81D8FNdXMvH9DRg/JN02
	ys0l+5Q1sbeybWH6FmFRTWR+hlIV7V+4d/+so+RqV6H+DyH+nV5dNCcs9RqiZQ2eWY0baPyWPUGzG
	C5rlx6vgrGv779FqBIO32M4YcSHV2ychP+Lw3dukD75qf1/cwqVGNFhWT3GE/7yQP3nXPFtyXsTrN
	2794KPb2plrMmT+ToPvK6Zqw0p2Xt3zdkxxoJxqqF2vNZdlS0mAUbq+KtZrhV+xWRRtaUolQJpXr9
	5ch1BlVyfn+E509UQubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRQK-00EcQt-06;
	Sat, 06 May 2023 23:34:44 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRQG-00EcPl-1h;
	Sat, 06 May 2023 23:34:41 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so38197524a12.0;
        Sat, 06 May 2023 16:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683416076; x=1686008076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d9CMRNtxtAY+iVGmS9Nhh6aBEK5BkbQct2dEiCYBRLY=;
        b=REqdkMLCTy5UbebEqan+d2erjtQW+iSjh884sXj1Iqi4KYxB131TlOq+KW3UENuDWX
         THEXQaq1WHPMypuFmc4Ml820f1CQcnJiRhg6tIzULFl0U7XUdt/BtJkTqvBlwVHTKmZo
         RrSbBWgY5Z/a+YK/iUZyJUaxTyRDa7mKvcJHTFETzU4XSaLZ732eP3d9cicNn1c/FHPN
         C+JXs5T4yrUw/3HFnYtgw6Wf5giKRXIvUIVVXxDtuo2MW2/ES9apApq6gqqD8xswEo9j
         zbpg1K+6pf1+scu4m7KByOUFr/PIsJColgxbgMqpEgGBOkmBp8U6eoMr4U4Ufiv3pJG6
         9psA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683416076; x=1686008076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9CMRNtxtAY+iVGmS9Nhh6aBEK5BkbQct2dEiCYBRLY=;
        b=i1DFCSrrh6O4S+pI96WY9R7zTEcAgR0BH3cSB1GpewZ6aJIJBCYoeCflnW30zRyNdz
         tJvmCsZdNg07cmVYEv6VEOM4t2Bc2xivlwF2j7jqel29wfk872cxQMWBpWWuVTKbg2SS
         HY2JrlmkF/XEPwWR7EGzhqKkS1bpVX0RaHCLDp0dV5PNOZO8K89siopGZm1x2N1s99T8
         pHtY/FxjzIlMGpR0qh1CIj+ndMdqVKeBvMMsLu3AqhTeqTiHGcsQ5BGE75d2igZyvl0C
         2uek3IDunCO4s4g1oT6ckOoo/tBDWI2P8625Xd7/CAydd9cR6hde+KPF1XmaF+qOBaqC
         D1xQ==
X-Gm-Message-State: AC+VfDwrHk4FtQv+3LwglzpkvFmIvPDSxfMZ9zHbQuzRBlZ3V+Z79Dht
	nr0wZVfUdOtbukvJRLHf6NKuQ4v4Or6UafcGUBM=
X-Google-Smtp-Source: ACHHUZ5pLbXef8h/yugyYWaRiTv4z9p+9JV6clL+Ey23A/L6IzrVNYFXYzqgEhKueJGdu7i1soJsP6surAam4+MVHnM=
X-Received: by 2002:a17:906:6a03:b0:933:4d47:55b7 with SMTP id
 qw3-20020a1709066a0300b009334d4755b7mr4790270ejc.2.1683416076334; Sat, 06 May
 2023 16:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
 <20230506073018.1411583-4-bigunclemax@gmail.com> <20230506225848.3278d7ab@slackpad.lan>
In-Reply-To: <20230506225848.3278d7ab@slackpad.lan>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 7 May 2023 02:34:24 +0300
Message-ID: <CALHCpMg31VLy7=epEs4LTpUcWT+gLDJ-9bWGJMgYrTP1ozOX_w@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] spi: sun6i: add quirk for in-controller clock divider
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_163440_587735_ABDBB7E0 
X-CRM114-Status: UNSURE (   7.75  )
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

> Don't we need to set tfr->effective_speed_hz to the actually programmed
> clock rate here?

Yes, we should. Also we need to configure SPI sample mode by setting
SDM and SDC bits in the SPI_TCR register.

Please check a new version of this patch.
https://lore.kernel.org/linux-arm-kernel/20230506232616.1792109-5-bigunclemax@gmail.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
