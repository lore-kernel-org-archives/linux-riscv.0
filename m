Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54659C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2x02tkB6CJtD5i9Ezfo+8Hm2iQ3thJmMQoGcK77rcFI=; b=L0nUX2bPTbqmNq
	bbf2diHO/jdbe24R9MFA4/nqRoetSwjYlDMYIeqZpwkppBxcqI/qNabVuWMEIt5mGkiki4zNJ4bIQ
	vXSToq4bZPNjEnaHNVe4fkOmT3YwRzwLcDf752C6RDoWlp3P3ElGWIznKK8UyXhP28APRq1Qopnh5
	lXKKEUPMTZrWQ/3qlMIGSn6MpQSnFFn1xHhiPVqUlWQVbuskTAM12641oXx7nDmqK8oGfpALbfGBv
	Ler7m+us0Jn1K6Vw792EPE8d4zEroRFskzt4xs0s7Nz8u2SlHKa9M8zxFIdRGYni8WOFGa9hEfXnJ
	Yd/oIcXvvEGypwJGfeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU649-00000006D3X-37yx;
	Tue, 24 Jun 2025 16:00:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4A5-00000005oD4-199G
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:58:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4545001f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750773488; x=1751378288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfdwBnmwXKVxo4fI9YpCbPX/DuxoUKCmsus+7StatJk=;
        b=GtiFbqWTo5dMXM8j3OshWfJz0Z/LSBOG3pO7+reNvOR0QOk1xCeKhmFL9CyJyH5NmE
         +Z3Oj74CHMwH4mg33x9MN/ouvQX+oWCYC38Jo+2OPpB7CXB6L9LfWK5ZsdyqreKS04vj
         M4OulzVO62jXBeQcVs8yzH6hjAoH8GdOKPA2DDFSC1t0kTj0sc6flUKazjAPGaeOa2cy
         t26s7vLs/ivAcH1aClyHhCQP0aLg7965uHsjxOZfGiBR0HRyDA60IhCaKI5F3C7IbwnP
         oIrWiDcvUSa2Sp2S52sEn0Kz0Wkdxbe6beESyQAGBTIqyjpDZwk8+I+a6vS2eN7z8pbr
         KTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773488; x=1751378288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfdwBnmwXKVxo4fI9YpCbPX/DuxoUKCmsus+7StatJk=;
        b=f28D25AeE5ynhA/eWacNaV1eUmx+JJGdQJtdl0sFfBg2mICfMxYJkJvCfnAQi6mDSb
         sugzrIFZzGQ6g2iYMZQ6h9cpQBfwGZlrIN7CHLP3nbvfSrQLWAqCgJsFOlLmdl5TrjKr
         Q82bKy9NLq/uHjJVAX+EoBf3aZEPcgDodi2r+DPKFW62dlwYb1B0g6ZsRydNoobTEuoO
         GjDoGSqepVxx8dmm0IoXzMQqIqMYE3btunWiTDVQuUK5+xir/YNqoW2obKOIkHg44eV7
         zKsHW8MwC2sSp5E5DuSuH/66q+NWY2KJg/APuj8ZTKksjiXg05XGatLZd2BY1ITPD3hq
         4jJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/iw5ZqpNHVfSso04QEVhGHMypgrwealD7vhN+ytO/LdxdfDe3YlS+fv1/4fmiiKRE1r9Kz9rqq0uNUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwqBl3dkGlTwTWof3/8rOhnKQ1HrErSO9lnF9dY33/J5SosyXu
	6mRf8sUBqdMgp1+Z2mFMkRYUjb08uoGweNFdAWekGyhvFkoSqMTpIBsfcrJS6l+art0=
X-Gm-Gg: ASbGncv7QlBaDolr7WjflB5EgnkwuFKA3IftYw4ggX8Ko+yFmwNjcAmGLb4Hr4p0hSG
	iuuh9U0VLiiCcez2y7iG0PF3sx1dOyhwN47s9NG9nPDjsQ4clkdUL+4RjwEqIgTpeoQnppaqp6f
	7srzCtxPh7V6F+Nk+mMKrDfiSTII5rQtB/r1POVtDBTLgfKKJyblgTPBi2Xtq4DcH6qx4pw9cTC
	1YCdG0LmHNS57owGxBqI4K1ox11PM5ge4PnbPbyn/xKcVmEe7BFnDx9wJ9Au8Yw+lHP8wteFRhg
	6amNDif6tmx8Ff4lyKi7NrlvmMamnFFefJlSc27heYGO11MMnvHAneWZMSoMCQ==
X-Google-Smtp-Source: AGHT+IE2FNywqz+cFb7euMKYbolnteHJlkDlULxTNl06mbXFoTDBF9qk9BsatavRg5P2dnisXCo5bg==
X-Received: by 2002:a05:6000:4109:b0:3a4:f892:de7f with SMTP id ffacd0b85a97d-3a6d13071e8mr12590091f8f.36.1750773487721;
        Tue, 24 Jun 2025 06:58:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e811724bsm1966761f8f.100.2025.06.24.06.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:58:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v6 0/8] Add TH1520 GPU support with power sequencing
Date: Tue, 24 Jun 2025 15:58:03 +0200
Message-ID: <175077347940.80530.12388970181360361507.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
References: <CGME20250623114429eucas1p1e74e09e74c5873b2f7f01228073be72a@eucas1p1.samsung.com> <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065809_310195_B4B64990 
X-CRM114-Status: GOOD (  13.26  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 23 Jun 2025 13:42:38 +0200, Michal Wilczynski wrote:
> This patch series introduces support for the Imagination IMG BXM-4-64
> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
> managing the GPU's complex power-up and power-down sequence, which
> involves multiple clocks and resets.
> 
> The TH1520 GPU requires a specific sequence to be followed for its
> clocks and resets to ensure correct operation. Initial discussions and
> an earlier version of this series explored managing this via the generic
> power domain (genpd) framework. However, following further discussions
> with kernel maintainers [1], the approach has been reworked to utilize
> the dedicated power sequencing (pwrseq) framework.
> 
> [...]

Applied, thanks!

[1/8] power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver
      https://git.kernel.org/brgl/linux/c/d4c2d9b5b7ceed14a3a835fd969bb0699b9608d3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
