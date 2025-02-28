Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA2DC19F32
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 00:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLDr3HqZXyYU2XMRkz+SnFZ3F53WNmuSQk+C8ZCWMuk=; b=cLyIYrJa/VouGC
	a+LAlrgfLgY9rz6O/yOP9KQZI2XyG1+ynoHaE8MUjnM87zzNkeJUInXjEo9dGGwb/fmRa1eEkvPY3
	yVfzEIZ/Sjnm68k9sBznYuWAKPtw/7EtdK8ovN4NojsGR1dllER9dx8SWq8ixgm9DYmiwc+CPbtsa
	cMUzUR81Q2SR2t9D1C8Sw7G3Q8FMf736aMpmS1fbllnLgbM4Zko2iaFUntROYiI20pYb5q+uzaAiG
	9voDh9gJq0Bvz4tEB/91sduZiAz8gut/mR6kPZU2N7GxbVew01RN9y2N0kZNMRlqN8bwgHiQYHDpw
	ioVujr1mIk/NgpJX0feQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoVb-00000009JNr-3bGf;
	Fri, 28 Feb 2025 00:45:43 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoUt-00000009JIY-1Rs0
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 00:45:00 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6e44fda56e3so15085546d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 16:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740703498; x=1741308298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLTJSgWRvjc6CoalvvtWWj0Jwj6OQsGx1YUrViRKarI=;
        b=htekwkn+Qm0ssZ0dFEsxVPLK6HOcU68HoOVqBcAZ7x08w/JbwqCDjyC5GPiJkbpele
         0DDq/loOap12gnRO9bfroNFyCnvi+KQfFvlhikNtO5/WKck0M2HcW8GJGNvRLCjIrIBp
         WD/43NfFneFmkuvrvW1TkF618Opo3VZHioWgRQo++WCpnQjf+NEcTnXtnzNAE2sZ5KKK
         h5Rnyhp2a5igtY/j+a0bvaxa2LFCYYBoUaKevndgaGrShfZYYoFdcw5IwjKe3RLvz0SJ
         0C8zTSRffkXIb6uE4a0jhyDCs/62V9ZHeE0MAqjeId2hmRh/jWkQa0bEGSpoF1LK2ZxQ
         243Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740703498; x=1741308298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLTJSgWRvjc6CoalvvtWWj0Jwj6OQsGx1YUrViRKarI=;
        b=NJS8wCKR6OKLAbJQ2HQzj/rAAS3YLTvbx/Y1pPEWRY/fAouxNWX2cHDUD9MjpVZ3A5
         krAijicJQLITXq/oR8Q1F5uxOcrQCk5bS8DRNuleqwRQteMN4bKK9NAuWdnkP2HCDyAX
         nyy88wQZwWfObp/i/F7BZ9A9SQnmetWAXgEyc07Qn4w+rOgB9zv6XGfev9NESPPvzxeT
         nZqP+ybkofb7IdNZ9qtlqIhIKruvp6XfjfflGkFSn95er5TKQZwOYmAe544x6U+zOuNM
         2wdSLwq2q1BbjQZKxU2sE3JRimDgz3EQtQUMTuD60B88eENbfvb0PvrhkNcoUSCK3eOA
         YPQw==
X-Forwarded-Encrypted: i=1; AJvYcCXqVK1OmJyHN2QgZ9XNv7PBJGanEMrFHi1NcOAmdCCIObHOBAkj8VB9pHxrlHdEIxAdscueiZ7097pv0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ6QZyJ74eKO8YciYJ0Kkz0NR5F2jNT/ImReX1VWabfSfPOS9n
	nUoz7f+UUhxWuYx4ihJKHIsf7rnB+Yyz4G7da1MDa6UxcN6Lzf95
X-Gm-Gg: ASbGncuF0umT5k2JULdkxOhvPUX407vxDwsu6YOM9Cjx72o8nV6VPHes1XYzsHY/bhI
	VNiiuDnbsk8Qrp2AtOXspN/lNi5A/5zG0Z+0cFsesLGoHJuqkH4zzWtwNDqfS/uxWResVHgkw4/
	SvwSb3bEliyvd+KsMjYvG9u1Gr1Teh5VfZaG3Gu39WfrxJdUzu4HmFKoUPxyISKgKDjkK1zclpM
	3TRtu5un10H8SRBf++pnD7kuYG2QC7Ep93v4UvWdDyTM5LLG+GfTR9/BATAZVryjViJWM4Dw8++
	fQ==
X-Google-Smtp-Source: AGHT+IExRXiQaZ4T0Z6y1z1z0/2ROPkgKVD3wTCSJ4mh6iYNzRlAMui0YNy9pihJ29SSMbnFSyJyCA==
X-Received: by 2002:a05:6214:f2d:b0:6e4:5b6a:9d48 with SMTP id 6a1803df08f44-6e8958a275emr85405086d6.7.1740703498090;
        Thu, 27 Feb 2025 16:44:58 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e897651074sm16039276d6.29.2025.02.27.16.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 16:44:57 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for SG2042
Date: Fri, 28 Feb 2025 08:44:32 +0800
Message-ID: <174070346793.192886.6076012325463673162.b4-ty@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_164459_383353_CBCC33A5 
X-CRM114-Status: GOOD (  10.45  )
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

On Tue, 11 Feb 2025 13:17:48 +0800, Inochi Amaoto wrote:
> SG2042 has a simple pinctrl device for all configurable pins.
> It supports setting pull up/down, drive strength and input schmitt
> trigger.
> 
> Add support for SG2042 and SG2044 pinctrl device.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20241024064356.865055-1-inochiama@gmail.com/
> 1. Fix the binding documentation error.
> 2. Refactor the cv18xx code so SG2042 can uses the same code.
> 3. Add SG2044 pinctrl support as it has the same layout.
> 
> [...]

Applied to for-next, thanks!

[8/8] riscv: dts: sophgo: sg2042: add pinctrl support
      https://github.com/sophgo/linux/commit/5277657d53834cfbdbb9444088c1448b29bdfe98

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
