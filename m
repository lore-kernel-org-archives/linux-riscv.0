Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC90CA0FF0
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81xeEicfhj073jOjncp4ZL6mgc+dOoi9coQ4VJaFjIA=; b=GLPioqNsHo4vvP
	qUfl5Rtncw1xke0FFGQNcuhbuMcR7MJDxqb084uklqdtqZvNxPX1LAp+kWgmvMRDO/p+p9EkJ4Z0Q
	4XC+hq73pB7hGj3I+pUsz/uMkidZ0gQ51hKxzCLUgEJOIF2c3m+WBKpWHTonjI1HCL57YNxT2Qg4f
	LiExQD9mEAl+ye+JiUvJm4Fu8eAxa3eTwALH1KPpkSgy17kvMefai7TZ/9UPmYigAes0sZQv5DzKJ
	i3sUPQRd5N9nstFpO+L5oOQbTlOyJU50T3/i+CMSdNt5OUfeG7fsHPH5Jyv/LHHddkKzT+BHiR8Gb
	Y7pgZUnNc2nekaBkxWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyGF-0000000BM1d-0dsH;
	Mon, 01 Sep 2025 06:43:27 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxuf-0000000BJWu-3G7f
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 06:21:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24abf0215e8so6304795ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 31 Aug 2025 23:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756707669; x=1757312469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM0VzPvZOoadSqld8QAB06APoe2QVLiP88e6xJF3DNg=;
        b=Sv87/9UqWprUzJlqNWyehz3pUqR1+7F3sqweMjkfz0uZbQhXxrbpZf9J0zWftva4UU
         u7V3eJB9MwlR9SvG77ULYgO7eE3+nk2nan5sVGr64BGXIgfy3GNpr52m4gNRyw8GqweF
         /Uegel4mNgGswlNZkr2niNsnMY+tAF27lPlclR4icSwDSAW8MLUGsRIOzwT+aHZqjF7h
         2wS29ajM0+gFcEbCUJx47vcPq++ruK+TqpIKjq1oP+MV7uQuMWCF7dbzYwPf+cY1Rb1O
         a/3envy6KJJb7a0vXt+70gwcctv/zaY48h8MAdquWNh0DFxhz1ujmRJDRLXJq2FIUAct
         5Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756707669; x=1757312469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QM0VzPvZOoadSqld8QAB06APoe2QVLiP88e6xJF3DNg=;
        b=MRQBpj7TUvYK1JXKxLfMMQCvE5t7/X2KvCBcyNlJknAEOIVmRl5Xh6pvNrhJ1BQ06Q
         yTgTcijAIGhPU3EPUxK/WhmuQIi84n+XSkjQQi/D9clr0TaWh1duxKVPmD9L1lsYYZql
         0Jqlx6jJJvqYhGvaG0dZ6iWrIavLWjZsEFmhajEiV1RGXi0fGyTpmkWnaENh5pRNvoYn
         l1iUxv/fXG5TyvLD5F+LDCO5sh/OMGs5XMXyf4/jtq44eorNUos/1awyhebVrQGdR/BM
         BgUQh/8e6wtOldhbFJGfIqQd+xHXcEjeOZYet1/Tsn7Q3oFfe+nmDxhblSL6ZhToq0v+
         Sg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWx1R4sxwRc1GvCS8dVPgMSZwjYrl7ltI31u1JsfdGFWwXYtUrVR/1lA4mYL8ZZpdQ+xPhr8h558LnnSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpDlxXV84pSjfONbX0qWLOzpMJhmSBJ9gP6gAzvl8+GWkiOgOp
	iv5t9VVK172ekBl2gh9+pFennrr6w+Bp8Gh7+5uPZx+1UIB/f+SMRcl3r/nmOy69
X-Gm-Gg: ASbGncssmBcea9TngPGa7wMtRXIqFKnjzyyZo2WeY4D8LB6O6mfIBCwicQxgAQ8Jd8j
	5nflnxe1HtPyNaz8xuFki/dTdO/5U58vSzmPbbXuSoprx0kPp+j2J1vo4i3ktR9wbWcvyQTD7CJ
	7abP2iGTBUDopjl1zxJRJveCZ/FjkQCAIY/B5p29Qjh3OwdJoblTrl1JkQChgADLXaRBG1vJxPG
	etaEReeFwqGvh6d4QdxzBqjnq47ZjyUCW7hhhueNRV+KrRRzNismr10vz7mNPQ4fLmPqZGDFzjY
	gJ0CbKhyTF+rvM7+/q0VG4RTnwlcwLYVNYlgOoK2Sjpct3GAqATj83jc14Gd6dAX/yeMPaYWNX8
	PJki8zTua4cArkdmoOB3IQBuTTwcGHyX+
X-Google-Smtp-Source: AGHT+IE9RouoLA3mI1WTQ5bC8+3a6e/YddQasaUm/tDoSV5izF+qFjCdAOy/vlAmLw+ht6FR6TIR+g==
X-Received: by 2002:a17:903:2347:b0:24a:8d5e:932 with SMTP id d9443c01a7336-24a8d5e0c28mr78375115ad.23.1756707668708;
        Sun, 31 Aug 2025 23:21:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24903727488sm93506135ad.43.2025.08.31.23.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:21:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 0/4] Add SPI NOR DTS node for SG2042 SoC and boards using it
Date: Mon,  1 Sep 2025 14:20:57 +0800
Message-ID: <175670760972.211032.6732897578408758943.b4-ty@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_232109_814289_5E5C063A 
X-CRM114-Status: UNSURE (   6.96  )
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

On Wed, 13 Aug 2025 16:33:16 +0800, Zixian Zeng wrote:
> [PATCH 1/4] and [PATCH 2/4] are copied from patch set [1]
> [PATCH v4 4/4] without content changes.
> 
> Link: https://lore.kernel.org/linux-riscv/20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com/ [1]
> 
> 

Applied to dt/riscv, thanks!

[1/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
      https://github.com/sophgo/linux/commit/268b9620d86ef002b5e94355e80c44bbbdc736f0
[2/4] riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
      https://github.com/sophgo/linux/commit/6baf562e0474b2885405cc8e383a59269807338d
[3/4] riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V1
      https://github.com/sophgo/linux/commit/2ea345ad682e2ab89c4360bdf90fd170612b3be9
[4/4] riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2
      https://github.com/sophgo/linux/commit/0bf26eecdd2a6d243a3a19d3ea0df10437ed33c7

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
