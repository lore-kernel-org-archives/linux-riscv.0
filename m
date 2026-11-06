Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07115606A31B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 02:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sboWL+go;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYh/1yci
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1pbXiOe5Kxr/04Z4dSKgLHULQWLpxhwx8SDLYUcu5Ig=; b=sboWL+goCLjMJY1AkIc1lBiZEB
	vmuw2lz8uHFGoJ3JfX0PD4RbxjUvfvWS9ZCbxMEk+URdwPtisYIs6/QUr2HiaVawjhUAokdJKxGXC
	afHtC47GLaTSo1FE8kAGB7/KSgs3GKDePBDQhtsqpsGNOfpvwT8qBS83DwpSkz+nzQWiaZGLZAC0e
	D0sZuqt15HBloZjNgEs+/dupXCtKUqDbrBmCZXUferZRH98+OzHRtHPvaqH18MgWxNJcik+yQsahl
	FmpQ8S1VPhXYopaokBDflag0ENdjXetMLrNv8CyWrze6EISTPlflO8bPof8WSCjLU41fdtAsJGRia
	GJIEZWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9Vt-0000000B2sg-3OIx;
	Fri, 06 Nov 2026 02:17:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9Vr-0000000B2sK-2hv4
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 02:17:08 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5be4716d76fso27486e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 18:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793931424; cv=none;
        d=google.com; s=arc-20260327;
        b=gOH2uORx4WgaytluCEsly5NdR4nh4ixCSewLA9M60K0xs9JpEaIeYcPq7eI0AaBMwQ
         zPf/n/M9zFm60Q2kC3jLc9GHfDOMkPcZydYoa6TdXVWVic5NDZZQptuhOV6yWAIXY8gJ
         bZ9yRvKAs6YtQERpI2Gw4dX9WBJxf1aAloe6ugDJ8sLoTF92ACff74NKVYAhcxkC5YV6
         NuB+P6C705Y5fF6fpVO/A4q8W0WffqVTi2ISqDnmXC3T2ApmJ3NJOH7K82b97MtskF6S
         LOHV8V7E7/QahBION7NegKGshltyrhXum3Bf8vuzwwmuhj/Mo8g3o65M6AY6p0bJRehn
         xGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        fh=86yGcldMChM+ayp2dbQ9wJhZ3ZjFJ6tehFjJWkeW8Ac=;
        b=KdXJ1U1tV4VNVx6lqRdncKfJXxXfCLBHLEi/Qkh7rbp+GhdvvVmQGZgJllJugk5j4K
         3fYe4ldmTFXl9nlDlKHZuKUB0cj7XXt96zQQkCvJBookQaWiOP74iOgkNp1Bo2RLQvio
         d47qUo7uRDREj/5zWc0FjHNB0Yab8A4PIbu4RvvHRWYy3OzfaTNmU7Vmice1TslpGbPA
         nBc7GAsVZp4QE0u0aIH69XuLbO3vV8SGXbnAPcuyYqAs69nSC6uklwRB09WEcz8a3rx4
         DVTKpovlS/1mh7w/kpAjg8de5fflhvxGz1y9Nqw+JRM1KWj4Q+KtlocXEy4oujqNjQAR
         ZcCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793931424; x=1794536224; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        b=NYh/1yci22aRnS6sGG4vK33N95PmNhm0xa676VtzgEGuFrflVgsSpWOh7CrVXUZ4bf
         8jnFLO8631+ptk1Fv55h5F8XXFmO8HAiDjUjAc9iq+05uPYetxvleLtiDi4Z2Lqbgxpy
         tX0umCIR9cdgmvDMUwJl5RiPGi3Ono1V4ISC8Pqr3X+fBegnkN8M/mpcnhIWKC26nqP5
         LnpO0rssUHSfGWUx94HnD1krrdm4N03WCAgjg+l/wdCdXElrWgIqzfBJg1OhnZfmWosb
         PAHpNykH23KFQUtZDoKHauBow4AsMsqpkxNDk2DGOPklzHJAPNT5nGWF+wGK8Nd+XIt+
         zwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793931424; x=1794536224;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        b=WQY08URNzZtrv9sVzWUUx+YZM1YBebo2SkRVN8XNepF/N6SAZzYsL52Gd1lPrYPpFN
         Q19Hu7IC8VgblPyz+rJcxgLNkb/RJo1buPEVfTTokNfHNeu8l7qU2fyH2FMn+BLVNJxQ
         ADT9ykRCChgGbPX+3f5Ci9W5hH1bn44f9JG2jXEoZfq7TWhW5hMALFU/Dc5tVgwrJUTg
         pqMoo6JnaePrx6oozMKqTVufKrphNRW2zwjS3xy9wfiYQ0iR0sDXRxn/f+EXMngGiIma
         HLVDcnZTYkJmI9+PVQ7aIQD9BqLZjMhnKzZRsHPQ3T5WgwFp31Nqx/yYstq/ufmANvoi
         nJgw==
X-Forwarded-Encrypted: i=1; AKwUvBx/jjTwm+8eEkq/ivQgQAPqlWWfcqawf2/VnSG6ddmPnfupiQKFsVCKgxGDOH2HM3IS/ufmxzyJJRUJaA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9uvbWDFEhIT0x3fZUtG7Q4rTqg0FOz3fdDBpelf/JAI+iUPj3r
	lePyY9FD5H6OkNinSglJ1SgrzzhnQbCJ1nnQov7Sb8N9BKrghSYqCfYCGwM3vlGULrr7a837J1X
	H1Wikgk6affO/T35DW5+hwltK9Kfr5KY=
X-Gm-Gg: AYBFou3Axj0ZrVvK/p0gBdq5duJZP75GopxyJuqIt0H4iWj8TsECJE1NsLQoSiLUwo/
	c/nRtP++vzOQyrnjfxFsuEERIZTWImSyaX4vF+Nsr6xtq2ZxxiNua8mWNqWY1RihGA32IzDVHtJ
	5015WfZKWtxOYpPCwCnIrS4MPNlEQi9KoB4xt8Ixiu1eMdVEou1xl3aIWkHcPnzXi+2F33IF59E
	Zn5Awtx9OssKNlSdaduDRCKvimgK1+mns1MBe/xjHbJK+LPIWxUO86+0P/LDWPx0+SrZkO6fJP5
	XS2KFfqhjzLI4XqSMkg2nW1jAos5LQpxNf/VoXhyIx+xyZGYzBc5phl/+jjvQ1QDHatKZxt2kc7
	y7TiMmLxWUcd2NPGLoeTdy1CgU9jlsCRAOQc4jZ7QXu3HiLSciEt9WGQvHpEv974R7VdLz9bLYc
	t4BhSmPngPUXu3c/vGdg==
X-Received: by 2002:a05:6512:2524:b0:5bf:d9b4:2481 with SMTP id
 2adb3069b0e04-5c003c16440mr312893e87.6.1793931424363; Thu, 05 Nov 2026
 18:17:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com> <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 6 Nov 2026 10:16:53 +0800
X-Gm-Features: AclHuK-dqaISPAtfDlMGbnSeryvn5bwnJRHt-qebg7Qbj88Q7XOH_5ONWOiQpyg
Message-ID: <CAKspUhKv_6BLHVH_5oBsM8UhvCGHEsukRDmMozZEebHZtoJmcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: dts: sophgo: make sg2002-milkv-duo256m-eth
 overlay generic
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_181707_712798_83AA2355 
X-CRM114-Status: UNSURE (   6.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on a Milk-V Duo 256M with the USB & Ethernet IO board, on top of
v7.4-rc1. The composed sg2002-milkv-duo256m-eth.dtb is byte-identical
before and after this patch. Booting it, eth0 links at 100Mbps/Full and
pings the PC over a direct link, 5/5.

Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
