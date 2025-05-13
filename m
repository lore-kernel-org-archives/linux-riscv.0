Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C127CC3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 04:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGGeX/8jpeRhzLW498/wJKlypv/8RcwTKNCIGBmk444=; b=NZoB5yEcCkvM9h
	zjhxf17O8mu9IZCssdDcdyu7TaHapJ89ho78r7pe27hvytz4XP9sjDx1KLGv+F9nx5h0FZ0yOaKh/
	vo8raF6sH8zkJreJlYUMSKhI/Xg3NXiU5/CT7wmBSSRbEirOPhz3mDhOKhzrJwsnK7yoBM+UCXnBm
	cH1pGKYVDTRxhRS0ccEgi/a8DVf/MOqhAgABLeB3l9ee94eiCKRRO5s7q2BQ7BlLWXjgsaS/2CFt1
	TESGs49fC+Qjp7YUF+ZlI+4/EcgxODSTNbOURwgwduGnsq0MAw+JQPQneQ8rj0zs/ksYGOi/TFbFF
	Axpv425hwKlKu1QDGylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEh6r-0000000BIgd-0w4V;
	Tue, 13 May 2025 04:19:17 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEh6n-0000000BIez-48Nm
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 04:19:15 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c54b651310so776576685a.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 21:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747109953; x=1747714753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFbsTQE9tHKiV3IKABKjWIYDMs9C+L7n7mu7OXh8b2s=;
        b=BlWA6f28p3BUdR2E9QVXvB0QFypqXu83UF5JDsVmHzTdFUcBdwTYxBusMKwTUQqxVp
         UN8/xuqL/4ByqGD/P/Aw5ipze9wLIvamAy0vpw+HuENjUyFbHWZDZG9Z+hovt/b2baEy
         wjp7Ku74WLPBdkxhn9nL9MXoa5XYFS5tVclSndWIsH+H50Bb71Bffibg9I+nsiVHgqRM
         w28/vhLhp4+QcPvv7l6cQ4E/UDDzZWhwg03ZhZy2kANEVOd2pR3BHq+ZR9y6w5AJV5ea
         QPLd0PMXE4QkJWFoTPKWxcDRcrBfl/AMCbAG8Ihc64N/c0rHHJhg9fyuNVIipqc2a2CR
         Sw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109953; x=1747714753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFbsTQE9tHKiV3IKABKjWIYDMs9C+L7n7mu7OXh8b2s=;
        b=baOq7oxUh4aQR42AAgl/3qq8I/u6spEshlp1Ar0tRdQFpwzIK3ibjAFhCDUk//QOmy
         IGE3SH2VQEZcVFtLBeAxvog+ZOTEFukSMVMJNB4JJlfqd1Y2m10y4O5W92Woy1dqPJ7c
         qxcoYSqDQHy08P9Bbiu+L5qHrbkkKFDL5/W2SCOCdHMYDZmawp3l92g10kB6Ey/BH0kN
         z3mCaEgNtIXKCM2uJCberDONtpbOTiY5f7dNHdbETcMUTzcHgvyCpZRxWPOlOfRPVI46
         Sq+yrwje+044gbzeRigolXzFb2iwQzxvTVptC/2ddhjpHWLpEzZsvHZ1BrNVYUiOEjGy
         d4Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWvMDWb0Rc6MjRV5CQL+WQ18/FNdMaVtDvZmWqlN0E7i7ZcNDrn5oomwbmFxfzFpKGf2kIR1oaWGAwZ8w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2QOTlQHFtZeGMOpgnxdTxacv21OEm8Wu1iR6U7vCA6MWTa/WS
	ByMlEJMJ5lgk+ZvIPRuusAEK9GsvfBf3N7uLnZyW1DHkC1TL6o9RLo5/jQ==
X-Gm-Gg: ASbGncvCFbZVgSSNIZCiSrJJXZOSEyfjoeFnhuJscnhehwK6WTgKSWUUoGNa8qrYXLf
	N9T3SHs/D6HmN7eW1J+lJmyagVrmXcbrFeXP5zdmHnQ2CNkAxUNRVQp0WXqEUazrpaY7NLIwZBe
	JaPTFQMGxu98R34bO5bzFayX4NUAlvcbmPVqVyvoTyj/lnJ7CGnFSFZUW5nWOmY6ZnCqYupsDIy
	lJmdV5+098+pk302KcCxuED8KJJI/YQvRP+TmBW+BnrMNaTGl/eepC0BsNAQUdpOfzZNV8grZIr
	f/EthqVhp/GAjUyjKJ7e+l6xcx4rAkVSxNl3uQ==
X-Google-Smtp-Source: AGHT+IGS3DH141eF3XFbywTS59BbLhX/9gyOryljRpt7OKQZ/4+tNhx00bLdZ/bOFxGP5J/MjBr5Cg==
X-Received: by 2002:a05:620a:1b88:b0:7c5:ad99:9e38 with SMTP id af79cd13be357-7cd01143dd6mr2694467085a.43.1747109952721;
        Mon, 12 May 2025 21:19:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fe620csm645540485a.97.2025.05.12.21.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:19:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Tue, 13 May 2025 12:18:23 +0800
Message-ID: <174710989166.597941.2836952647121868068.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_211914_021969_5D5D7100 
X-CRM114-Status: UNSURE (   9.17  )
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

On Sun, 04 May 2025 18:45:49 +0800, Inochi Amaoto wrote:
> The part 2 of dts rework replaces precise compatible for existed clock device
> with old wildcard one.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20250430020932.307198-1-inochiama@gmail.com/
> 1. patch 1: reused sophgo,sg2000-clk for sg2002.
> 2. patch 1: mention sg2002 refer to a real device, not a wildcard one in
>             commit message.
> 3. patch 2: fix wrong data for sophgo,cv1812h-clk.
> 4. patch 2: remove compatible sophgo,sg2002-clk.
> 5. patch 3: adapt the change of patch 1,2.
> 
> [...]

Applied to for-next, thanks!

[3/3] riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX
      https://github.com/sophgo/linux/commit/6493272ec02706dcb2a32a1c7b14e47432ce6d6a

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
