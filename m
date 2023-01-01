Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D616DC4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jan 2023 15:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3AUo3nLhDc4pkg6014kmnQzS25o16Mz4/lvnjfqqUI=; b=fbeifu0z5Z2zJx
	RelsCMsR+HhQHH6Pbnn+NTeW0bgPDLMxBwTJgGd0xr05mRIElqpsjjZkIK5YLlBSzgsSMuQNpFc43
	OtmerS6jyAO5mk8fOWjTjlyCPEyYqeQ5IF0VZg1uj7FdLzilYxKJpVycffy0MfDDLGu+o6xT6DDLd
	hhDeuxd1IjKaRigFArPAXQn1pVd8Fn0k6uM2RQbxyjZuLIZxm0YjbqDE858Lqr/C16EYebxLyXMoH
	4vFDafCVmX0DFAPz6rDsEenb0cwduC5QxbpcfDsM7+L7gl3sJx9BUM6dtFx/s6wt3kb5ND3fPVn3v
	/WvfzsXtQ8lWxpiAgk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC0Q4-002FYI-Gl; Sun, 01 Jan 2023 15:38:40 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC0Pm-002FN5-BG
	for linux-riscv@lists.infradead.org; Sun, 01 Jan 2023 15:38:24 +0000
Received: by mail-lf1-x12e.google.com with SMTP id g13so38373644lfv.7
        for <linux-riscv@lists.infradead.org>; Sun, 01 Jan 2023 07:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMqST9j0lwVvsQWx+mDeXRBW/SiOgmTTyqqP9lmSk7U=;
        b=pZKhZBLEhFFc5vgM1fgiFoU6ezRw+eK+rVcRo1QzaDwWKL0ioYBGCjCrMt8+vlyS7V
         s3LC31QI5TmbjvVoQQuaC8UEbnmE9H0KIbpnbdPelNBE9H+rGq/xEgdy3RlRy5ZqqL5S
         ZBHbf3Z3YRHgdG5OAGpKzPLzyb626IMKw7+Nr4inE768c0ZW5NZeeFlZf1JFy9dpHiU8
         5kDk/VMDEIv8li+qbE7g7IarPexmyuyyJn9m85XLjKUvCeKeZVb3F4DCIwqecQuztjtu
         Ij6E4TrzcPu0H8Dd1D8W3CtTcwIlDKuR9pFsCm9Mp8DZez8u126uB72Pbw5Ecf40RgUO
         Am9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMqST9j0lwVvsQWx+mDeXRBW/SiOgmTTyqqP9lmSk7U=;
        b=EcDij2jtVFGiNtMdIKy5hQlvPMFgql04XivQPCXElGm0LJdW1m4mG916ImQWvUKuLZ
         AJMF0Xd5l/JF+CxRdMGLp8avIjDuyjizy6mb1IuqH8eXLzJasWsryEGE4toxQsLMD/cx
         tmWc/EWtFzu7iVqF+HLFmyEaLGTNYcwu6L4zcf1iUl4TzbORl8FclFlJ+KJlvpOreoQi
         U9E3UFW8KQPeHldR0Oinl6a5GplW4q9PKFlOgqfGOcGdZ47wTSUcaYslaz2dZ2QE+soS
         werCnOYrwHvAeR/fkTDKs9DroUNB+MFI0dfOEroL94eBJ1TNQ6v0++4VeufkuF2fZgKD
         UNEg==
X-Gm-Message-State: AFqh2kowe7YSTS/SA576fmFoAn6btn1UsDMk2bBiJWEDFgL/4RR7jyUc
	MP3k8l2dcg/Olm4Iqmgu2wvtKA==
X-Google-Smtp-Source: AMrXdXtfraPY0eklfVNzCRIbs0fWP2xLJx2ap9oHeP94jddPD1H7IFXA6HRBMFlJkTZFcSOwM/R0+w==
X-Received: by 2002:a05:6512:2102:b0:4ca:f9bd:3390 with SMTP id q2-20020a056512210200b004caf9bd3390mr7955515lfr.31.1672587500363;
        Sun, 01 Jan 2023 07:38:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j13-20020ac2454d000000b004c7d0ed9619sm4220436lfm.123.2023.01.01.07.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 07:38:19 -0800 (PST)
Message-ID: <1a0c8664-73d1-a963-2215-b3967e1475d3@linaro.org>
Date: Sun, 1 Jan 2023 16:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: Add D1 CAN bus gates and
 resets
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>
References: <20221231231429.18357-1-samuel@sholland.org>
 <20221231231429.18357-6-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231231429.18357-6-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_073822_593002_12260469 
X-CRM114-Status: UNSURE (   8.73  )
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

On 01/01/2023 00:14, Samuel Holland wrote:
> The D1 CCU contains gates and resets for two CAN buses. While the CAN
> bus controllers are only documented for the T113 SoC, the CCU is the
> same across all SoC variants.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
