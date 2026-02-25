Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4618FD45FB
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 23:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EX5rCglo7eDosC3tUXrgf7+R2lgGnXvj75OPiHDbObw=; b=ebEyS4jej9Uqci
	hadlt274hWDX0gXWmP3DmYUBb2l5irMNkfpoTXLUIi2GuxTtPADpUvAgB/LQg2zx0uRYZeQvduh6S
	CfsguB0VlhrE5/bUMfuV2BaVtxs4x1OLvSUw/YsJGIIrM4ReP190YDj4wYHkA3WroYjpVSB5PunRf
	YVeSRw5tHA7SplBQekf07OTiQ/5FfILsvDWLO715S01GrT1EJmDtZxHp5JbqxZ61zBq8jOiGilHVp
	UwdwRLeRQCQLz0tT7ORMmQSpNfCBCpB7hnSrNNO9Bcv1npPG4VOQP4sLgKZyndKQ/0vLanKtxihMD
	eq5E8PfJLDL5+iroiLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOhC-000000055tE-3s2n;
	Wed, 25 Feb 2026 23:53:34 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOhA-000000055su-1hTz
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 23:53:33 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-56a88bfd470so115064e0c.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 15:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772063611; x=1772668411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vrInnbX0KCc1ynABnNky7B7FYswXUG4HFiI8RLfvys=;
        b=Qd0IinFhfJMPv2nGZvMC7pLPP0P/Lg+R/UAY4rKRcWH3LJoOQecpioJ5jZli0RJvf3
         UYqjaw0K33hlWUkjHfVNRrf22HsP60eSie1QFpu9dZ4OIGRNShjdHO4rVg+GLlLv9Kq1
         6AljE59vhEqX/IQuAHYLHTPlZIcinQpH3m6I0muGNQCLeSfezaD1oPX1i2mJOiWgU4CY
         aMgXtOvaaoRu075wnLIOqi2H2sEWa0cTXcx+DjIKixGaBH/xGWRqxqtev8VYbFnbwUW5
         DMOmP+9WA30GFGQtTNAB8IozbJHAH+J7oJJjp50tKS2mAYnsIivLOFLjvwvf4flEF5XW
         l17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772063611; x=1772668411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+vrInnbX0KCc1ynABnNky7B7FYswXUG4HFiI8RLfvys=;
        b=Ak569FSibzXCr3VGGVkvt46bu6rPyH3X5loCbEYRxQI9EvyHrttyrWGYL1bBZCyKwZ
         qx1nLJrLmsUUY5vZPjpW5cmAjBsMfL2isDxuFDL36tcAMq9ra5cstoLbAgrj8+cm/FOy
         77VxlBl929FOZQfOwwZ9DJeo96JB2iJ7nV7z5kCmu0hXLh2d0UbhE9wZmX77cLDP9Nkw
         AcMdpQf18aVZ6MNma/P85zlrrYjCNe3CI3jvQW+qF2LZZXTTBOo45rBDgW2YToslz87A
         t3eKzvyB6dTBiHUUEQ+Dxuhc91WaWJ9zj5vufQYQvShqtA1TragWgXMCeYCDSkgFnHEr
         BhPA==
X-Forwarded-Encrypted: i=1; AJvYcCWnEOt5HP//7NTu5TvqNYcH7nKJEStXXvjzh/LhV3fV7hWZSj6f6/htZen5O8XQTddouPt+6vpgykMb3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi0ZbrlC4oX3yg15vOfLBE8whtwswmqqO3yxDcYoktje7CqHaj
	Zb0sGDqr1ewQhirA6H9lVOW/2hn/Os+r1kqev8T/66OpPML9fxaYmGnLoWInZq1l
X-Gm-Gg: ATEYQzyfwhxM2LCDbWvzNI/f3GRzOJwFbNnKS4v9dHfOporaf20/tOnUI46dWQSpbrA
	jo8QKcRt4iRs/JWzICyB4u+TvPGl4l9IlhmlIYTwnbor+Kp8qwP7+2POZroEHVPuNieqZuVTtZx
	Hd6Y9Ye32kYsDw1X13tw5Lh4NGwbK/te3B/trOm8XKfzW7rQzCPmfRrlDjiWpUXufkCQlF5Dnbn
	aCghdbmwhZe7vP/jRrjYTAfJoRpkmqqQMx0mOXyvEwyRi3JmANIyc/PwJRUc0wnvvhc6/zorSyr
	fneT50uhNrjq8XEsDQmj998MPdStrCYqmwRu7hIEi0r/045WMibANK2MUZ0iW+xENmfSkmiQ+61
	vFGln2nYH2SMuLQC1KIW4VCpFRMkVlSwcY7/KeZO54MtV215zkdXOoH0RMfS1i28x7eqe3KmMSQ
	xbRJ5SihpDvw==
X-Received: by 2002:a05:6a00:2d1d:b0:824:3ef6:a815 with SMTP id d2e1a72fcca58-82739767b3emr516796b3a.8.1772058091345;
        Wed, 25 Feb 2026 14:21:31 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d544ffsm290363b3a.12.2026.02.25.14.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:21:31 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huangze@whut.edu.cn>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/3] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Thu, 26 Feb 2026 06:21:07 +0800
Message-ID: <177205806122.119215.17895713731232514155.b4-ty@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225104042.1138901-1-inochiama@gmail.com>
References: <20260225104042.1138901-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_155332_469817_08BF84D3 
X-CRM114-Status: UNSURE (   9.29  )
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

On Wed, 25 Feb 2026 18:40:38 +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> [...]

Applied to dt/riscv, thanks!

[3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
      https://github.com/sophgo/linux/commit/7b159ed9c81cf7e0d0b75666e6548ceface2e1b5

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
