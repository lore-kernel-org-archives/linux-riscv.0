Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEEBC54EBC
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 22:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4wnoIuptJZBcJYtWPd/DtZu4I77MSjbX5jOlxbCZIU=; b=MYO4MsVJGmDfxh
	Vx171Owq8PiPYFNR3A2060Vm/XtOwmwwsmUeHu54Y11revp6rMfYv01qeCknXyUh2yl1/7WOmRuXN
	72XShO4tPQudkcKmCHBAsu6X9e9ETxomzdvQxtO8l6BjrMIXsUmXDC9lCGqByNmhpCrjhzfppQnFF
	y42+YozbajAZZQjsJb1TWw/NctX5auxwikxkBDVoJlbKHGu2Az92daJ44yz/ybg5L65l7F9c2FKl4
	EykCUnL/FWdZoj5qznQm32R14XDtbsYvBniUHXM+E117onZBRdaC+yvJgLmcXs8DomWGNyGuoicNa
	d/IP8PxTaA2eY8KGTpwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYIX-00FNIZ-0u; Thu, 05 Jan 2023 22:01:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDV7k-00Di4I-Pt; Thu, 05 Jan 2023 18:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j0EVCr8niOrDqjzMLygmK437Bl2kIDtpevcurJg/sh4=; b=V1/hSm5gsQoVdrwODOTj3im1Q6
	MTqYetu856BulbBQafFBvjAhQGBf+Y4raKAQWxubZJKDtP4rNDZW3q9KbG1xWKBnv6f6/Ql0LJsKh
	cX4H9uwaFh4f8TG2E7Jcsh3LUR4ZY6nMP7MXq/qZnmiYi47j+b1OvsQkSzWDcCv8WN4U1bmdaFRjL
	DdStqikgIze5EcvfygYtr+ZqlIcJ0BSxIfWp35TvZQVggj2mzQRK/QCMqC7p9Ovvr1pt22cBZ3tnh
	lGwK5xCgvnsmWqOYy4GIGvvafE2OyY2DwVrB68E9x6VsUfUnLl7bgltc7sxYUX2HJty6ebflBy1DH
	3iFZ9cGQ==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDT7T-001U2A-2c;
	Thu, 05 Jan 2023 16:29:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h16so36615296wrz.12;
        Thu, 05 Jan 2023 08:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0EVCr8niOrDqjzMLygmK437Bl2kIDtpevcurJg/sh4=;
        b=jDIVtUpClcQ+UxG9qVupCt0iQQGwHM+d6T7wEusmr+qK30mUCcYc9GUyuqoMxRGc6F
         yLsE6pp9oKTyZKpGEPno5HWa/Jp/mb4Kc0geXzmf2qw2NY8NBd1Jgf0FriM5Za1PQKZV
         1Hyyngu7+VstGQViUN36nBx25MrximOkklcdi8G+oTCIwZ5tMwFmvn7FmIPpIrrqe5ND
         a0Hw5QjJ2BBPZUTn0xztv694WU6bZ6DQTF6gBJKr+sAaDlG3r3jof4uouVUvKsnD8OcK
         nDlc91mOj0bGL3XTt6c2pFBHr8WyBJRHyB4jI5T2BeUBBlZDszPy4LltDjv3zPP19r3G
         Qxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0EVCr8niOrDqjzMLygmK437Bl2kIDtpevcurJg/sh4=;
        b=37z+bZt17MRWf13BcYUMqfCFW4svV/H1Oo6+FYWvzBxGK4MfVVOscu0Wtwr4SSU+ZJ
         h0gyIDbXI5mHYWz4e2DaEeqha9cqzRiX+WrECGKP2ioOs3hPUxFO/zDllUpRWWW7hLsn
         uHEdWMp1JPj3YOGBsQbB+/35WtcdnUZDhPENjRVz4rXhc2oyrOZeEQTfFDbTFI2SxdS6
         paj6WGxDBcWade9ECQ5NxwEO2JLsjWzB1IqaSlfUCpc3Py5vnIBAq3Ie7j0xf1Qxpk9n
         Y5biOJi4g7aQJH9CaY45y0ldfPBuUsJQC6hzDqsx/aTPgG4CQReCOD7oWIFm91mXg6VO
         DWdQ==
X-Gm-Message-State: AFqh2kpuRyJRQRvysRPGVC+I+7g1XNkAQNAnGbVKlwmovOSOfKQyUNQC
	ZF8iZo3IRBvjQHMKJ7lAX1g=
X-Google-Smtp-Source: AMrXdXtdx1ljPkWlugJYyqxedcQLP7LIr489mbO58wIq4UPlhosgyNRl41DeetoAC5tBRLPKPwtTzw==
X-Received: by 2002:a5d:6844:0:b0:2a2:5a2:cc10 with SMTP id o4-20020a5d6844000000b002a205a2cc10mr5139614wrw.36.1672936176128;
        Thu, 05 Jan 2023 08:29:36 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id z1-20020adfdf81000000b00268aae5fb5bsm36862776wrl.3.2023.01.05.08.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:29:35 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:  Re: [PATCH v2 2/3] crypto: sun8i-ce - Add TRNG clock to the D1 variant
Date: Thu, 05 Jan 2023 17:29:34 +0100
Message-ID: <3212177.44csPzL39Z@jernej-laptop>
In-Reply-To: <20221231220146.646-3-samuel@sholland.org>
References:  <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-3-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_162932_575488_28FE8374 
X-CRM114-Status: UNSURE (   9.61  )
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

Dne sobota, 31. december 2022 ob 23:01:44 CET je Samuel Holland napisal(a):
> At least the D1 variant requires a separate clock for the TRNG.
> Without this clock enabled, reading from /dev/hwrng reports:
> 
>    sun8i-ce 3040000.crypto: DMA timeout for TRNG (tm=96) on flow 3
> 
> Experimentation shows that the necessary clock is the SoC's internal
> RC oscillator. This makes sense, as noise from the oscillator can be
> used as a source of entropy.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
