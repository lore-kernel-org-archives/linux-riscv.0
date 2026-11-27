Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA71606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZL/TW4Q4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BVsHDsN5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9fwRM7n/K/hz9QvKs9bmgh1a4sOvFZ5NkaamzzCvkMI=; b=ZL/TW4Q4SE8dTNHhSsilNeBdK7
	sZP2Pe5Id+VW/tc+xFGbHzFjFsbAWqSgrTt66BV+DtuFIGtbqB6kWkhqEf6qFgxgD3d+x6dWNkHyM
	cUvEsWXRYK+pRKYdKSK38w3RuWGx1eTtsuzs0YhLuW4hnIh24rqSFjmY57kwqhHiwK5WVrtjTO7KE
	2hqXHDYGpnLmTk99W8ENqPjuidU7wQdIbi0zXqEZ3tl1JwCwpnxCLwEwb9B9ZqxTaZKlmGSjhL+1B
	YvT10plxOm4S+R/GjpvRJTRoGKpEyfQycdBJisL+G2GgMI/ZZ8Ir8+kRi9Y9VNVzLEZIYhauyKQ/H
	zPoZnPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxi1-0000000GjNG-2qKW;
	Fri, 27 Nov 2026 15:17:57 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxhs-0000000GjM9-3BDT
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 15:17:53 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so8594202a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 07:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795792667; x=1796397467; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZLbQvYUrjzEDTt2mCUe1XfDKZ160von+CQ6nnPe3W3A=;
        b=BVsHDsN5FyWgM9tqmg7Ny8y5Aw2RF9b+igAhbpZYgSl7zFEiiLMPWRO8PI04Jn2nRj
         w1USxihIiNwMzUwpD3Lx4KUjsuu+2CpP++hvcYpUK31jd0i2mp0iql2e1B4ygzJN1XWg
         eogTh5zJphqBkZqyQHK5mTKrnhEuD3LMo4shEUAi30E3aZ6ICTO9emBZC6RHDn+VrkqQ
         rXIJ2zOza4yrjrkt9vCvdX0IyseCLvF4SYK/GHJVNDe0Jbuv+nqeBqiDszW9vJGz7vrg
         m0E/OB4mI3RlCeQsQ+IVSRFuZ6Na4Jz2IFzRErmIyT7s/PdG2Wp+O98QAMESXfonrvC7
         AUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792667; x=1796397467;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLbQvYUrjzEDTt2mCUe1XfDKZ160von+CQ6nnPe3W3A=;
        b=XirQQBhNJaznh1f3OdK/DM4Jd2NRjCksWaFbEXHAKVkZnJauPsq8kfnhoUhR9ihWnH
         l52oFkDBb0FjBE9oKNOEE7qF97+o2JCepGl2H/sVncI9PTETHwh5rfnK9K6Pzm294vll
         1RtYWhkhYxhMFz1qfy2fUBft9wF42OEGtas+6rA9WoaBqzYrRM3yEj1dYBS+i8bF6KU4
         KdSBydiME870xv4p6rlHLyn4HJzojT6yIadkA03RhWxt2wThwGNwUpmd/vwtnz/Kb/ml
         1shBJA77K/vqR5qrmqVilVvidhFKKCA4updb/jwuxzErr+3dZXZfJc7eY+V1ztT9yjIs
         v7uA==
X-Forwarded-Encrypted: i=1; AL+hErE/n1LeS5WAy6msOXT+D0xXEsG615I5GHlVBCjUdNExF0pi18pbLq2LPBHUPee+YUkJymH3EY91OOlYSQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/cBBx5rrVRmKYk+NOH6gJxEASA4LYfAlH7phRw5vcDrpldHLNB
	7Wwc6/srEyGCCgJkA/33IaM2i34WyeoHRyPfZ4qOQpuoiRLryP3OK0bDbuQpuIHn4Sc=
X-Gm-Gg: AZFdTZdISOkHmgEHEuME4h/m9drmL1QPqcVrS7tFtbgY0Urt1TPOp7PIrke0YFmmxr7
	50MGW1eWnxWhqm9erT0ry2ypu7K77UUUcNdTmy3R1cKn4Amm9FgeG7Un8YnH/ATMLttzAn//QhQ
	ifilEl3mkOJT+FHLf6LSmeAjOdRzaUJMV5LyQqmziin1xiEf+lGdd6aMqodxw814oNcREGhzh+H
	OC8p0hx6thgQSKli/qfcupj4fTEeuY8kAdiOOsRa4PVQVuX+C6CHHcmJAHSBtgx8HomGN2GUXcU
	9JoZdiBDuvXjXcGFEdlaAaJ7bS2qSJi1ObBnJhjpt/q+M+gU9Ktlypmg9FkJTL9tSvuB/OV1xBg
	ljiKIOiyAejZgqQBDDOMV6hzcRszMcd+ZQ2SEQHIJaERVZIKQVQSmV69r5T9LVudawl6JPptizE
	iGXqfZ7/xTCIlUxUIaGRM1s0QuG5SspbMQ76g4s8ogQdzhBHXjBF6Y2ezrqzTCpJKtetQubBj5+
	iMuiJMAhDs/R4uUxQWL5CJJnHW4VHw+fWtqrLVsb+yCiW2jcxQqzPPDn94pq+XXl3v/MsLKCQLK
	Wo78rcweNxR+YdMiemLgxMPwIC/fPvA4IXRgXNZqq79OffXm
X-Received: by 2002:a17:906:1911:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c513acd297fmr1475999466b.47.1795792666943;
        Fri, 27 Nov 2026 07:17:46 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm868490666b.57.2026.11.27.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:17:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
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
In-Reply-To: <20261123112053.20400-2-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
 <20261123112053.20400-2-changhuang.liang@starfivetech.com>
Date: Fri, 27 Nov 2026 16:17:40 +0100
Message-Id: <179579266081.2809466.15729395589845750540.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=443; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KwT62dMsS+rp93AZIY4GYCZTTc4JdLTdUPR1lLaOY8Y=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmc8yXD9nyo/DD900IziTDfXyfsLwu37F9nXxx7YY/2A
 VUHu7X7O0pZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRVjlGhr1bD0n4ZtZ9XRD1
 esH1TWtt5gitnBJw6NZEf/MKE2/rOZcYGf6+WDtb/Rz7gfqPZrfEcs3jP72QE/RYveZa6D7/e2b
 X+3gA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_071748_859076_14E978C8 
X-CRM114-Status: UNSURE (   7.09  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> auxiliary_device_init() returns an error before device_initialize() is
> called, so the release callback never runs on this path and the rdev
> allocated in jh7110_reset_controller_register() is leaked.
> 
> Free rdev when auxiliary_device_init() fails.
> 
> Fixes: d1aae0663023 ("clk: starfive: Avoid casting iomem pointers")

sashiko is right about this tag, this needs fixing
I'll do it while applying the change

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
