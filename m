Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279F1C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 02:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JQ7OQKv7ZRNYHAi0xuzcwbOBleFrIk+4aJFBHIq98A=; b=uEpTJCAu9bL/4Q
	VVtVJH8Yl2fBdD1gxjbIqMOGAs0c8Og3M84q1EE+lJVTPkFKrbbv500AiX3kHCFt8hegoOJ4hAyKm
	eCfsrsK4f4UgYs5QJDr7/lSK4GjwHeeZdiNrO9t0GT647rdF5ihptnFODqxyciiV/I7/IQrjHZQ4G
	dslUU0RJ77askDQQO2tKsmuFItcpPCyAP/P17AGi7QgT0Je29eV8QeSApT/0IAQsyH91gySM8euvg
	bulk8jUSDI7PcmULmCsX2fAgzS7BwhnRh7PgmmFf1iUVH6mn0O1fJ/NmNTjlhr01oIkIafuW53S2x
	ddw8vaQvUdZpsoUn2kbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZhH-0000000EYb4-12bI;
	Mon, 25 Mar 2024 02:04:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZh9-0000000EYRW-0Xnt
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 02:04:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1def142ae7bso32573015ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2024 19:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711332235; x=1711937035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UalUTF2iqRjxJm5BRWPYfnuu8z/bakUMFe6q3qjPta8=;
        b=LaiN6oML3d29njf0d4jAc1udqp50SP6oCsqo135J130irmWoxguTNviDRMWz6Lnktf
         g+xewF4EfWfrdh+jEq3KYPakfc/BvFWXXmd/eUuEGnfHiDE0jyuDrCyKfXgyE/Vg3xvp
         nEptZ6vf4g1hBTYBCe614YoPS9fC6fycSFK6FHP3hsFh6JKY3PxXTopuzpRC3JxIJXGc
         6sUrKwazlOnPkYFi7oT182QrbLyC8OCFXpuG0+xp7sTW9B0pGLAANdyRgjweHwQib+8L
         lcVaND6QtZTVVBnvRhsxaZ1gXZj/H8G+NkzkHiVMnSfW8AH+JpNhPk1gbd/qD4eDGy8V
         PlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711332235; x=1711937035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UalUTF2iqRjxJm5BRWPYfnuu8z/bakUMFe6q3qjPta8=;
        b=LTFxYiVqos4wecsPAEG7KCdCVaFY4LEVsk54qS6IyO4C+TJEU2fQaajPxqL8Ys2Jrf
         PYU3Mg6y75wzdY3F120/RpxhLtdcMxDvnqYmOtkA0Os9uHewGWVYLuO4d+yZ7SzV9WKf
         U6XPeYz3reNMZ/46UVPd3n/U+BYOjGi2v5IkZDZWvykLAOG7+vVrPukra1hxCuTGM/2J
         5M24YWMOSKMIjwbRk4rnPbCzkIQDmCbucru0h+4YdN9aNk1eZp1OsXO7UryMHlpXgJGs
         5aw/hz5XBUCyP3z6Z2XybDw2E8hxFNeYAb3WUvksgIibPIeu9KDOe8siWkou/NT+l59s
         zxIA==
X-Forwarded-Encrypted: i=1; AJvYcCV9YjgzKklRpoFX3jbTPQCZ51YlMM/FFsacyE1eON3bDGTU64m7tpnf4JqTLvbq7Gy4Yf9nponWVELXqGapXT7c05VeKHmGo0EZUGIcFDP/
X-Gm-Message-State: AOJu0YzWbdr+u1zNt8gSRpPCDF8QH/cQ1DgSb233l4TEAWO90y2K+kku
	0aNnGzjZa4WlpDz5sVkSk1kT/7Id42/RXNZTO/FUKWF0bLF03aGv
X-Google-Smtp-Source: AGHT+IFke4+IkGE9FkicVvdk3GsuRfMPNbkgBJVDWwxCLpUbSSpb694v2kg3JJXAMyLX+BgGZPyyHQ==
X-Received: by 2002:a17:903:1d2:b0:1e0:c74c:dfcc with SMTP id e18-20020a17090301d200b001e0c74cdfccmr354616plh.57.1711332234623;
        Sun, 24 Mar 2024 19:03:54 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:6249:183c::26a:10])
        by smtp.gmail.com with ESMTPSA id m6-20020a170902db0600b001e0b287c1d2sm1985284plx.215.2024.03.24.19.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 19:03:54 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: cyy@cyyself.name
Cc: aou@eecs.berkeley.edu,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	dlemoal@kernel.org,
	guoren@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linus.walleij@linaro.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mturquette@baylibre.com,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	sboyd@kernel.org
Subject: Re: [PATCH v6 10/11] riscv: dts: add initial canmv-k230 and k230-evb dts
Date: Mon, 25 Mar 2024 10:03:33 +0800
Message-Id: <20240325020334.4033-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
References: <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_190415_798075_6B8EB2FD 
X-CRM114-Status: UNSURE (   5.52  )
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

Hi Yangyu,

> - Support for "zicbom" is tested by hand

C908 also supports zicbop and zicboz. You may add them as well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
