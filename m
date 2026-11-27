Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70127606A324
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 09:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eqD4JRIb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WPT2N0XF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=txGrnKcCuy43MsByRPVQp0N8cu3p81sBUkJ1lqs2iDc=; b=eqD4JRIbtoVTaq5o+I9D/iGrlL
	hzSrl4C7hmMhfl8ocJKG/3PrKh7WXRv1YhSiE/1Ur3DZLE0EC0cqAkLePI7iCSnPRNINRz896TNDO
	tW6YpAteHGM+g7pdDDd3m0Sj0WCGUbtrMWcWEfmTg/Me3a9A8WO2tw81HGrO/dyWkOVi4TwTUC2Mi
	bPpt6ohrxajgJvkj4iSIdmBteBKNyWL4JAmGCNjrJj0BbPMqe7SCVBP2tyLUCIZpMhfmbC9/7mhrs
	l0+L6j0I0Wfa9925Th6GqqbhyQ4gnqaJCLLLtV/0q8nX3fLyIDOCW5lvuUIuPVWW15O1vtI8nR4dy
	MTUD9Lcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsKb-0000000FS4Y-3IUO;
	Fri, 27 Nov 2026 09:33:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsKY-0000000FS2o-48od
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 09:33:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-497614c95f0so4480587f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795772001; x=1796376801; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6uudOphVfwIHGV1M9Y+fTURzZzdu6IHd2WuYguba9o=;
        b=WPT2N0XFr/075FyJAQDbDnzvsgqMGE4nmpwl0DQc6WQe/QKaBwK2A3bygt5bLfPOuU
         xsB25hDHTTC2ittvD82RKjZCUOzhtAqwMRzkOThNIbmfPdU4vu7wzrJqABKc563On7pz
         R4zFpLCRpp/hXzgbAUUgD5nCJimuMO0I8R3iRGYJGsvDrKVRQqoUlVxa4gEUuHLmJMvR
         MCYq+j9kQbJ0KbpcdgPGFoEVFlTlNad5KUrVpqvT3XQ2ElHTISVsqa29Jknwx+PHwoLh
         KIaEuGJcQ564dimT5pToKQx0TvE6RkqjKITG4a/w+g0Hkrkth3QN6md0qSPXz+xo1/tA
         nY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772001; x=1796376801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6uudOphVfwIHGV1M9Y+fTURzZzdu6IHd2WuYguba9o=;
        b=dMtUxDmvse1//s6v3bVBssj4vFGlpdCuFZZ4mwiPwulWvazcjuMMqftS9nYApD5bsL
         w9Gus2PA2I9LNhs/kAVp2ookgdB+8z6xvTBXnnwIMmsAqLJNavWeOiNIKtDJ/oTY+aJy
         XUWOTYeK99bnwm35mccdC2cL831GGHNLJXoNzItZe542UbodxJORFzpjXD8Wdgf0dx2f
         5VNXVGCLHDZVaCxqEZinG8AekMJrrMX0DLXKzz/tK5YYVSDy0icg3PyM2n1/Qs4yasIL
         tFy0Mw0cYi81rUw8VgBBjGy7sZlCNmF9KO13cI+yf3gvN4/McRBE10M2AtMZQFCrLtq5
         UBoQ==
X-Forwarded-Encrypted: i=1; AL+hErHJdUp5a7TQgVfPr7iwtyrHBWvNc41h1SDACRuY6SykfSDXPwvCjLUDW+LeUCpt4dlbq3F0Fmmnlh4wlQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/2uYMCK54lcAXOXOq3CYUM0/iJw6aq/XHKw4hcZz+L50Vs9Ssx
	rJDRJ3l2JF2/Yg9OKHLu1g4o0kup5aaC9MJW15Nq0f+LBYacIhzYWOxuznZpDR3Sei8=
X-Gm-Gg: AZFdTZe5r7o0jko5q7E3CFJQ8Fmv5xmCrEvcj55jcqfBFirs/lIxDXHa10qR1pSf5gI
	bNcH9uF9cYAvWIlI5INHbT3VN/J1hpGwipQmJHzvMC8SI7xCdt2omjRYRuFAD5sa5mVxDbT8mOT
	sDPzEvikTr/YaqOjwn92NOyoFKhE/xet79zHFZXBRYJEnTNAmZRrbrnwwtNMiQtfnyKflCbF4FF
	HLhwfUf301kNmscf9MKc13t7u1KmokxEcgvAkuous8jLVXqBNkHJHUq0wJh3ZYznlo4zOiK/yWP
	aQiGV3TgtXN8IQC+tcV+Xk7x9BXtsulhIRwI748ta5aUoMPKTMVNc9ijxogSMK5XOFSlnp8coON
	a6Kl0qItJG3aylE9d4SiB7vr0EvQguesK1ttrudjAhZLMpT7kPo1KljGMaKiaqowiDeowr4vwNO
	f6eqib7zBbdBBL7otLzZDhz3y4DCvyFmmsMXYZPT9DpY3o2XyuhJKh+m6AYoVodfbOMQ2zByNWz
	DtId2DsJnsNPnEVOP5J9yHWL89vitO7U+HPo11leqLccYzt97Ae3CwYnS4q7Rt4I6nuXSsB8/+E
	zl8elx1qpp2EoWoLHYhoSMbGLJwaj6oI4CFG9fw=
X-Received: by 2002:a05:6000:2903:b0:4b7:70aa:4553 with SMTP id ffacd0b85a97d-4b770aa4574mr22944028f8f.38.1795772000643;
        Fri, 27 Nov 2026 01:33:20 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm46450336f8f.44.2026.11.27.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:33:20 -0800 (PST)
Message-ID: <41962155-e78d-46b2-a58d-45282fdf1cca@linaro.org>
Date: Fri, 27 Nov 2026 11:33:09 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/16] spi: spi-mem: Express the dummy phase using
 cycles when relevant
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>,
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>,
 Yu-Chun Lin <eleanor.lin@realtek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alvin Zhou <alvinzhou@mxic.com.tw>, Cheng Ming Lin
 <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_013323_063554_5CBF0D6D 
X-CRM114-Status: UNSURE (   7.32  )
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/25/26 7:51 PM, Miquel Raynal wrote:
> This is only build tested for the moment and sent as an RFC because this
> topic has raised a lot of questions, there may be things I have

There's no ambiguity that this is the right direction, change bytes with
cycles. As a matter of fact I tried this in the past as well, posted
something and then couldn't allocate time for a new revision. You may try
to search the set, if you haven't already, and check what the feedback was
at the time.

Cheers.
ta

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
