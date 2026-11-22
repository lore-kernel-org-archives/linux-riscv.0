Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9964E606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eN+1JboD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mORWcICL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=swQei2tmi7blrXXu1sScBDx22kSLMGVQoa7hKX4Ufxo=; b=eN+1JboDkk65HoDe9SK8quT8G7
	VcDcr2HeLP/KpEfRmATQO527VfnnqXXz7o6Y24AJGAUoWFdO1w01Ea8/z3ILxOpIvdBLnAakKccs4
	5yBb+JrkAGBgHJgZDLdWFIzI/b/Y6q3i05RkVdZUJOs44XUwbLGv/GgA5RSQq5qjeq//27htdrQjj
	9CFqu/rYBdWQgRDn1dwCqmdX2qOikYVubB4IU36fxwg0mO++EgBPI0DvsOq6GHB589Ii2B7W72hpa
	89dftpSYaCmWzwB+WgJUtlx7UUx+YMEyupk4FtLNGV+mlGv5Ognd9q9ARA9kprMQ6A7xfsE4ixvTG
	DD/vomaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAGs-00000001L52-1vzq;
	Sun, 22 Nov 2026 16:18:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAGo-00000001L4K-2JzH
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 16:18:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso31058765e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 08:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795364304; x=1795969104; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
        b=mORWcICLLnFGT8PQ4pzwkcStiW4XU6FzKxwigWijSvXyqaWl+aKITJ1FpbJF0W6HXc
         jAWS8JB30MoKr1X/Zi0RPy8JjtV36eCfJ01LiC0yeSS4E7khIU4xfkpQRAJUL3GCdlz2
         gAOS9v1T/doayupfjpFTKcCKk6B0BC8ortrmGsUVg3SvSSYiKTRZiTMGt1fCvxjtDXya
         utCHA/9llQoUEAsaOoY6DDYxZbkxLy5nyWz1EDGtImiiaACXrmz0mYCzqaj5lWUMjyS3
         +TboO4ArOvnTwVXWLG2o21YNEhl/BUxUyTtm1NUgM5bRB1cmb/N2JGz/G7aaYoDeHoQS
         ISvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364304; x=1795969104;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
        b=ObfC86ubm4SwLMLKfD+7fk2um6VQ3dSXM6MZ1vufKi9wHW9IpP8GFwiNGo18+QXWZ/
         CbTYHh2rxpoHEQqnbp1gsc2yQ0/Fi1pbe0Qksozc49zW9jxSU1LLV0Et7EeO6yodbFNx
         b0KAwOqUdnvKrS84u3Y62WAGiLTcY6p8eshS5lcg18st35t+jjzXxs1Ans0zxcpNuXps
         qztenQVSyk7wqt83kBNlDrb/9gKeVbPOihMVIyBt6BWGjaZRvtkQ7tP8niq7wpOiDvP1
         3yCKiqw3S4/p1XhoKjfPr/YLrwwAuvKijSrWXOEsxz1Yk12o+3uFqDsvm8eFYzd8QLoV
         PXAw==
X-Forwarded-Encrypted: i=1; AL+hErGlvit76gZidEl8oISEFMP62QlnQALRt6+3ErKddu+8UwN6XlV/Ab34dR4u++5bRGOJjy4MWq7MNs0r8A==@lists.infradead.org
X-Gm-Message-State: APuU4Z+c/r5a2jqEeFjND+1B/T+/RpwDhXJiJNsjwv7mWwYhw0xYs5Qb
	2UaHBQUgglmOGh44GVrHhFnbEYnCsDMa7naNFpakJnTcg0lPYA/u9L4THMgqwRWeQtM=
X-Gm-Gg: AZFdTZetxrXwSLTbKBS5ln3KrSBatRiLbU7xsTDEnLUutUt/jnU/1t2gQtmlc5Xdhxg
	7DXzCeB44fbKPl4Yb4eeaMEKtOkaO705vB9H2YkYDC8WaVvetFM1burBTDKfSUUvh5TviynnbDX
	mTi17PtwXntUHXBgUW6WOXl9oeSwaObQQzVPIwRyopyiCYvejMYvZhYcgH1byLfMAY6YgM5kAkx
	0zf+nnj/EclBrhdwH5kitUYGc/o5O+JV9wVFs4Ap/dMHRfB0opgYkUXBtdDwnyWb17RvV53lY1e
	yIr12Z6bRl0GvHv7d+g6oIxPdZuLhAWbNCXbT5McGAxYGLVOQ8EFC/ub/8cmGKmzDC/6k8oKIlB
	d4QIUk64tKitGkVr/sj69dXzQUGmwMycor6SuGsoXQu/u+cKChQSd1Mg/VwP74JCQN/Mwm0obSw
	a3tX3Fr/9eHqR71hIcJZraBRB1fud/xTyUx2D7usTOg5BpUDL2futgVoZSfA4Z5reOfXe0ETm3d
	L8ZEpcF5IXwZ3ZMi0yCEYtS80dmJqqHebHtTOfKR3fjePrRDctixrSkJbwjeUBT/6sjCoU9RUFw
	Nj15minD7ogpBuJQsUXZGnupePbwD3QrKV0MqaIiqwWZsVdy
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr46862925e9.2.1795364304705;
        Sun, 22 Nov 2026 08:18:24 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm226037545e9.4.2026.11.22.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:18:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sarah Emery <sarah.emery@canonical.com>, 
 Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Cody Kang <codykang.hk@gmail.com>
Cc: Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
Subject: Re: (subset) [PATCH v3 00/17] drm/spacemit: add SpacemiT K3
 display support
Message-Id: <179536429642.2728475.2044119204203952258.b4-ty@b4>
Date: Sun, 22 Nov 2026 17:18:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=207; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=v3hfU9UHf+Kw6j8mPInDkRCmcdQcn/tFYuhWer9PVLA=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMouffLtac7bcg5TPvFslVKz/IiM43L2d2W3La8FzzF
 i6bCx9Xd5SyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAim44zMmxxe2hesHqmrEzE
 C5a4iu+CTLL9sfqpvwrzRPpPFr2X/8XwPyhe6sxK569/On8WiM9u/vRjfl5c4ZyfsjXJvPYlub7
 z2QA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_081826_632138_8BCC62E1 
X-CRM114-Status: UNSURE (   3.85  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-spacemit), thanks!

[06/17] clk: spacemit: k3: parent eDP/DP pixel clock to the PHY PLL
        https://git.kernel.org/clk/linux/c/dd010f2b662d

Best regards,
--
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
