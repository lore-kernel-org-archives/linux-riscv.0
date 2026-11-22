Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA9D606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RcreRZb8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E4UA08TX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rh5r46sPB8a36QPOG/8ebqJNQJPeHuO9wR0Ze5lAZ/o=; b=RcreRZb8LdqSbjV6175GW5g6vO
	QaQdGcvvs7/CnirKEIIVHDRkGcox1YTZ2dgGmBd3x15xO10KRLtpewWgWRP2GMLtWwt9jb2MbAs0T
	eAKTMWuTp8eGSMDHzlT3Mng4Dw0IpPhwcBIT32mD/zRJd2GK9bdwxMTtaTW0GlD9ii/fNecrGNovy
	uoAq3kZ9zCHQy9pBT/PEigmvONXtdfo6esve1BkhZ9VF3wmK+rRvEujbQwgIiH88Ulp8zZYIx4F04
	3k3PXr1cHfoCjLSWYQG7KS7QlWYiZcBEHIKqFihoL3s+dMh2Bgoex5ZCPb4TbUPNsYaP7hzA6VYyw
	JZlg0ELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9jY-00000001Hy8-2HlA;
	Sun, 22 Nov 2026 15:44:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9jV-00000001HxV-2RaH
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 15:44:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18660325e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795362239; x=1795967039; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=E4UA08TXMyUDE9PhvyaH0gY317GAngJ4eybp0x9UgPC60vuw5wgRsORP1CwC81AhvP
         jNN6gkfkuFn06+HPtC9addqvn7CrrpDDtR2pkmADbqrBKNYToejSyI8e5MGKQIoiOh94
         h8vZvOwl9cuIphsKcEO8V96k0vfufDOs2oM4KpR494RFyeSqgBQCzDqYnf6/qaOHuqoi
         8AGUhOagAWwBRQ0SjkqiMP3myyvUm34FdbQbwRi/KUhYNqIh00wPi8SLrumytqRYguby
         s9vn293Sft7X4vHwUdvHP2MsbST2CvlpE1QrxktZjclFEli4t2sGx+JX5F05cGEJzZpr
         VvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362239; x=1795967039;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=sPVCoSEFBeeC7ZmYQq098x17C8CS9ulCAzBXV64iy19Gyo0gDei/u1zQ4H8Hc9oC6b
         UpQI2+/3F3gzsDPGBr3fHKEDY5l4aNo+j5Pelud73LgU4UhULlcUr3E++OyczT42W4lc
         hfgGwZEKkPzUT/VtOXep98TAmM/fyn5HXzbVNZo1A1BwFpcWvJAZNoNmyI9UZLXu4VDj
         b8e/Fynsn6M3gYS3ZulhsIkBTy+hBcFmEZtelReN56pJd6Z0o2qsxZOv0Vq4z6P9//RK
         Gh6XnmCwrawCfo4lhaMamVCB/206mIKqmry2VePAv1N47zaDi2dngYueeos6eN445fM3
         h4gQ==
X-Forwarded-Encrypted: i=1; AL+hErEUWOlFzE53kBYQvKy5oGS2QfRUM9dXertN1QyYz9oaMrDO2M7QM0xlB90uKJEKhE7U/d1f2s9nauST/A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/laRKHKJAhlOHlXeF2TEHVW+aIAruXI9vnbZMmV+zyBFcfSq4s
	5dgdNpD7hpdI4thinbdR7GiyEAepL8iKDG/xHPTDrxq6iebVg4166sucFsHgeBz4eQY=
X-Gm-Gg: AZFdTZexPIN91aBu1reI//vdsL2Mg5wXh2UYV0e+gl/okjCifeQoomlMhBkdFcck2Q/
	Y3HlB2SrayS/CXIQzFyQKIO8euDawfStvsQpEbi3AUGju9wwfwW8T9JPNEoBjSekFECTu5xbzPQ
	GiQ5vQHAbxvZ+QkAcxp5iHihQdJGzow88nKI5G+0XyihEP/QyzJYNRRtHAHIltkKLFy/4iSsGj8
	g1QJFYSSkOj7Qt/F+beD8WdS/HrgDjsM0yMpsaF82vqTZPYSHy9yIgbKzrfTs1R38kPKOHS62/G
	FyYOH4xM9695Xi5hvqqXTXTAmVR6h/Hq9SWnxqp3fa6yKSEAYHezin95ugNGnqga3Hnke4GrNLr
	E2gqiKoxNoRdMSw5gIjm2HD3f5tTG4VRXEXK5GegA9WADY3NFJnGppXalBcSevSiE8g6mQKeW1n
	dJ9yBKI07TEjvOziWoVp3p0NRevJgdbmeW8aLrPDi597WGvIV2uoeBXWHYdoEhWOB9wSsX+MNyo
	xR8zpOLPZEC4+kT6nwTXsHBYvjMKRhi7eGCvPaV0Or4UyecTEJZofxHYRO7UmaxUV02C5hiwicY
	tiLAiqBTbECfK521IGhjQiUU9neR0omSKhKm8wXx78OkoaEncA==
X-Received: by 2002:a05:600c:4f84:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb88820f39mr179650485e9.30.1795362239768;
        Sun, 22 Nov 2026 07:43:59 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm124899915e9.1.2026.11.22.07.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:43:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118100523.11395-4-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-4-changhuang.liang@starfivetech.com>
Date: Sun, 22 Nov 2026 16:43:54 +0100
Message-Id: <179536223421.2728475.4581137443338131034.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Auzs4ujqrLqv73w/LdDQcDLJr4HOPar7zURfN6DCgsE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMvHv2TjpSZauWVl+5civr/YNXd327fkT28oZp9925r
 55bIreqvKOUhUGMi0FWTJGlhrta/J2k1pdZ03Vuw8xhZQIZwsDFKQATObCW4Z9CxquCpZGC21aL
 Nnb/ULh3MGJ1xL3LTCLMsf2bf3tLXzFnZJh+JWddZY5f3cmoAvMfRhNWZsfl89S8vsdicKVzk/h
 XXn4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_074401_641457_87589411 
X-CRM114-Status: GOOD (  10.69  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table and reset
> auxiliary device name. The reset auxiliary device is registered with
> jh71x0_reset_controller_register().
> 
> The clock table is made of struct jh71x0_crg_clk_data entries, where
> each parent is described by a struct jh71x0_parent_data: either the
> name of an external clock or the index of another clock of the CRG.
> This way the external clocks need no index of their own, and the number
> of clocks a CRG can provide is not limited by the width of a parent
> index. The existing JH71X0_GATE(), JH71X0__DIV(), ... macros can be
> used to fill the table.
> 
> The JH7100 and JH7110 drivers keep their own probe functions and the
> index based struct jh71x0_clk_data for now.

I trust you'll follow up on this.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
