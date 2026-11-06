Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4CB606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 19:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MH5aJwhm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2yX1gwu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kAOpkZoozX45bePdbUYkLurXBOABQ5Xk392VlNUp4Fc=; b=MH5aJwhmCzvYRkmUOHMH+Wu11H
	ZM22qjvzu200jypqoh5QO2mZlosVYk8aGEaGLxNBiWF0zwLwNZMM8CCYKyGPWD7RIrQZVBda+S+yW
	k0KvEDYZVUbvhC/ME6GCmoWjd+LpFyNbv+f5AtQYVuWsWdjaKNXCeZ6yrT3Ng7PW4tHhsMGtoDaKJ
	rdhUXo+3Aa//PXalJHyAu6Ts/cw6CXNT9sWL+6h/wvZFw6YxXGdY1+S3uSaqGDfHotZSOGjI58DLF
	/J8VZojmhAk24jv7f217pa8Y7pgIKbDfVN3uO/bxK2dQdgQjkuWfmJPbXwkSx1Az1Y/J4jEXruy0m
	zo92/6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPvI-0000000DYNv-2Ubt;
	Fri, 06 Nov 2026 19:48:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPvF-0000000DYNa-4BWm
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 19:48:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-49376eb635fso404577f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 11:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994504; x=1794599304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/21Es773AUDvFmxDpw0bwxLoX1T07xfM8g2Md/BJQ4=;
        b=K2yX1gwup1FCKWgvGvbjI9Tv8PmvJMUq0o68jxTQiQwnX64rk70xEPkfQTD4lcD50b
         xC6jqUNN4cV341drjrt6Jd9qfgXmjbM95IWZfifvB7FvKszt3/N32Wjgkv8pNGie3M8/
         T2XiCNO6/YM2BgEaYibTvrcG/SDRzokw/4L4CDrxMvW/uGXxKra3lcy/wvFvI2e4WLuX
         3LKEByNh+h/LxqtmwMz1erBNzQLDwz6oK9sFzNH38HmKAodDiOD6musv93KKQuV0YWHZ
         9dxerns6rd7ZczaD3udLhsswZbx7g0ocn1a7ukVvB8l99QfA6KZ+ZxA7PalcN/9OPZHp
         UObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994504; x=1794599304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/21Es773AUDvFmxDpw0bwxLoX1T07xfM8g2Md/BJQ4=;
        b=U/DmN8GSSDvzIlpmwJB1rwvLEr35BEjkBT12vCuniORMmEAM0zUICvKRE6qVCVEaE/
         8JTQDV2nGyW40WF77LPKwK8Go9KCjQ79TyGWplU5sB/LJHrqZ8eDyVpDBku0/C/exLkh
         dFgTxI9SNe6SOKFhJGrxFZ4mHtQK4/mkY3Skanet8NZjbsAI/4uFnRXSG1cBcI2m4PEB
         z3OIEaYqdULo046WwcNtbtyuNtzeONQ5Zztan87S1/aFIURFFzc58KTG8FXI1UlKmrEe
         k9K5yKTtm48a11Q/4S+dQZUy5PCAKxq0tzGZOwLR4qp4aBDhjd2k36phhq4Gm8Ik3UqC
         1DyA==
X-Forwarded-Encrypted: i=1; AL+hErGBMz9uRZOxLeVh/sM+TriQVhHHC4KkH7awRQBNmyzuIWO706eKJhSc8S/n4gjCE5mjqKAIWfkBSn1P5Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z8zB88HE00/ZCIkpeFY8c/NhOVv3nYK6ajTQz2K/mAAlHAfTkJU
	/h9/Bxqv5YzFaeJumVJ9uJoZLeprH1RCTtppaiqQinRQVJBW3qbiuNjPaCfgrfCA
X-Gm-Gg: AYBFou2Y0hXQWJBpgxx8bd8LpK1i7Clp2O40WSnHBSaBu4N3QEEtTkWpVltoD/SYi8u
	Scs0NjHSdvi7rp6TXO4Kf57YTOz3XJ0kmcvd72PJCfFg0WU6BQXdnep8EYTyHXYvjbKgrlFbRyq
	P5Dw6uG3qdpig2nGRqAa83p19eXSHTkJJLGm2t7WViVT7P6F3O9UULF+Q4wCxZZL5jHP6XaIQvc
	w30uLobalTM+KdWxxEmRudO/3dzM8v8bLE68EUdrmA35zOuPCqXkrCAGNW1W93mcIrfUOS2vq9/
	N6rua6OQGmk+Joh4R/RxzndMr8hBmRDpoF9enRYAYZ5DcT52Kn6yVq+0bLeDGcWeeLfj9q5IfAo
	NbMUEjRu8FcxuskJWSPxzqeYQ0EXLq4M6Z89AWA/vYKUaFMnl8W4gmdZVmQr5Zkr5evlllCtwOY
	+7r/rI6Lmc2+d9wOZiKKduNzJ8rCXQOBXjA78Nmt/Fd1rEJ4h5XJGWCqCpeds0SoT5LIrqcrpDn
	o3v0nxeRjbAUWSYFJUa7a4xrarArGxz5A6JQAZBmMGzngACd8UPbI7iVcBg4WoEl81QL6pKfmUs
	gt5D8lWe02uxNV7OgxaLMnJLWv/Bbm0=
X-Received: by 2002:a05:6000:1acd:b0:490:9fe2:6a39 with SMTP id ffacd0b85a97d-49275fe4e8fmr6979074f8f.20.1793994503735;
        Fri, 06 Nov 2026 11:48:23 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm4928130f8f.28.2026.11.06.11.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:48:23 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Heiko Stuebner <heiko@sntech.de>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v7 00/19] drm: starfive: jh7110: Enable display subsystem
Date: Fri,  6 Nov 2026 19:48:22 +0000
Message-ID: <20261106194822.4153919-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_114826_045130_4840ED9E 
X-CRM114-Status: UNSURE (   5.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on a VisionFive 2 v1.3B with this series and the v7 PHY series
on next-20261105. All 24 modes the sink advertises set with modetest,
from 1920x1080@60 down to 640x480, including the mixed sync polarity
modes 1680x1050@59.88, 1280x800@59.91 and 720x400@70.08, with nothing
in dmesg.

One thing outside this series: the modetest pattern showed small black
bars until I wrote 200 MB of other data, which pushed the pattern out of
the CPU cache into memory, after which it was clean. The U74 has no
Svpbmt, so the dumb buffer mapping stays cached here. My v5 run had the
SiFive uncached-alias errata patches applied and did not show it.

Tested-by: Owen O'Hehir <oo.hehir@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
