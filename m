Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E59E606A32C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m+YMhVbP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iWtNWVvb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RTh1iKtSSoluE1J52EEjCuDY7+53HT7wMe2wQ1A/Nyo=; b=m+YMhVbPyKbshHQilbduY+ubDT
	S8ysm0Fpq+dBBQKsh6ubV9F8CVWJpr6HLc3fl5zdEHD8vBLDEquFgJnjg+6BwQFOk2+svUcpgh/D8
	6aVgENHFGWPrqb5ELVEsPCiX8OwsbrvX7vV0GuqY853g3qBb0GR0BSJPZZGSmMIh8YxFeeZcRDDvi
	X0xJgos6GNH/3PJXIYKC2GYjsUfqWMoD98aAx5qHumZuLNLJJiD2+ZPuTj2PWWOYsYe9fTEPDmY6d
	J0sgMpM7/26Q44wwL3gU2zqG3F7jihXQyA34CUb6dmOmDh00HEoHqAsbn5xgd8bNcD9lg5bQSUvEn
	pFy06BvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFx3-00000005Cva-1wGX;
	Tue, 17 Nov 2026 09:58:09 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFx0-00000005CvC-23LI
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:58:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3267418f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794909484; x=1795514284; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2CJIOxKFOzG9PNlm3VKd7UunHsl3InV7lQTe7NYJwxk=;
        b=iWtNWVvb+UkKUJ+m2AIuEhcyayn87YA3/CLvPN6afZ7LDjMggdA1k3YBmp9Th1gKXF
         0hwUv+6Lp1lptcU0+nLUcWCk4a0STEdhdQm869cPUI1eddBbw3lpiS63GjjclGKoVybt
         e/pSC/avU0EpkSTgBRhg73mw1P4PehqQ+4xrttQR/yTh0UNMmLcvmQW+FBOSrrmGyi3Q
         FLF/L1nFFvfSLiNJQBRb98nlP4seYD5gGGCqNvqkMLjfERx6BqJcgiuYaguYuz8TUwA1
         RDaKxHE4korJM//4xi7rl8Y3ECSlquztjNjiDaIGGFvXjJ4jwkXZQQyoYEf4lmgEmb0N
         LpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794909484; x=1795514284;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CJIOxKFOzG9PNlm3VKd7UunHsl3InV7lQTe7NYJwxk=;
        b=Z/iiBN5TDclA5S9Cg336mZJWCYvnP0CFnrjmsjA/ohmDZGLtRikZDCGHTzyKXl7Yo0
         LDPciwG+9EVlq5ZdaqFvDDZkbUwHylmdi88AF25IXvIAsV/D3XqjdbC1BGjTVZOH58EZ
         cMjdQckt9Mf7IDgsxRv42MhXLDW1QcDGG5yid9Z1N2PWJtv3KlQXPlLVCOsefzAisxIA
         D027GX1JHERSH5b+6z1U3ilUGZBlWIp3feS0K9wdZmNLadl7b2MOiaYTqNk9uYtLAQ2o
         aDrfSYkeX9hlUkcSSQ2/T92nAyLzNFlkxaLfvUQKyb6ZbJq2n4rWdfl41F54x6XrD75Q
         CT3w==
X-Forwarded-Encrypted: i=1; AL+hErHSg7MixqbN4RflMnUnuB2euy2WK0nJHo5ap9yTXtQjshWwtEv9np2R6i8d3mp5bMoZphqN9P5Rl2zDnQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8tvNGITjMrgUSOEyAxP7cwit5lcFb+9bW1SVMoHUh/dD7fnepT
	fWdG1b02X/m/IJ1Ngc0VkrB2osmo3MHA/UWsy2BFX8MW6iHOHjRVgqCLk3EItSRN/fE=
X-Gm-Gg: AZFdTZdKik4Fs+ZhwtGlbu0ehGc1g4AMSqmX1i4RHEoSeZ/5N+O8/JiZIzopYnAHaXg
	/JHBxZR6UvOmsh64x40sYywlstAGZRS/82G0VMPB9P2yWDq3yinj2z4RFO6sLdaJ/jvEoqbc7zO
	LDO8bVQYpMSLaln7DYFeYY1ao8vgEg31HQcLoPNI7gUe7yXJfmdlEadPINTNalI6KrKARP0kjCK
	hkM29i8aimDQLEm+Vv02dtsg7UFkeScqKVJTAGCRFbv/uUtcYnA8+K9Tj5CV0JOBsCo3ZuJhbvr
	kHAXR3s9vBV4jsFOQzf71pYlvli473toPIyKDa+mfQY/PhnNmFDpOWoB8L3UK03TKHm43Zwk5G2
	/PAqs7xqjCg6O1AgzSQvKk6CHd1YJDU7tSe1iVb/gJbE7w4gU4PPY5MByew0TqJs36oHS6bufKl
	NUcUavaRPgpZVy/mzuEkYWda8XcmyBaAalDE9uqT9afN7hmd+c/y3wcxWDGpCc2MLnD4hKUDlqr
	2pb0G2gR5giFedRp7pEJnon480NGMe7cYX1m/psB6JBHA2jQr74DEku+I8LHqD9/jA4yQ+LqYPx
	pikXn5r5omdSd24VDyh/l/WJZDqH/ef7FSIIztnfwvtDEkpFaWXNSw6FKjIUvw5d/FNuzw==
X-Received: by 2002:a05:6000:4911:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-49c71784fe5mr27875992f8f.32.1794909484352;
        Tue, 17 Nov 2026 01:58:04 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a33c344a58sm4540848f8f.34.2026.11.17.01.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:58:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/5] Add StarFive JHB100 syscon modules
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
References: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
Date: Tue, 17 Nov 2026 10:58:02 +0100
Message-Id: <179490948276.13037.508529632883431639.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=A60UEjvsGJwLzqqdQ3rQrk6QSaP2ECtLpK66B0J29GY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/VLU8E5Zp1f2ZNK+vg/vIfFbPR3sinreb/npj0eJx1
 139qviZjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzkkxHDXxHZRufsaT+tZf2+
 Be3sz/ZoYHgdJipjuqHoTlP3Z13dLEaGHfJfWzfulbz7PPLrpfZFN7IWfGW5Ye9es+dGaHbPb78
 TnAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_015806_560186_293DA8D6 
X-CRM114-Status: GOOD (  10.25  )
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

On 2026-10-10 03:58 -0700, Changhuang Liang wrote:
> StarFive JHB100 has many syscon modules, as listed below:
> - pcieep0_ecsr_syscon	(PCIe endpoint 0 externel syscon)
> - pcieep1_ecsr_syscon
> - host0_syscon		(Host0 syscon)
> - host1_syscon
> - husb0_syscon		(Host USB 0 syscon)
> - husb1_syscon
> - husbd0_syscon		(Host USB device 0 syscon)
> - husbd1_syscon
> - husbcmn_syscon	(Host USB common syscon)
> - gpu0_syscon		(GPU0 syscon)
> - gpu1_syscon
> - b2h_syscon		(BMC to Host syscon)
> - h2b_syscon		(Host to BMC syscon)
> - vout_syscon		(Video output syscon)
> - pcierp_ecsr_syscon	(PCIe root port externel syscon)
> - pcierp_syscon		(PCIe root port syscon)
> - usb_syscon
> - npu_syscon
> - per0_syscon		(Peripheral 0 syscon)
> - per1_syscon
> - per2_syscon
> - per3_syscon
> - sys0_syscon		(System 0 syscon)
> - sys1_syscon
> - sys2_syscon
> - strap_syscon
> - sfc0_filter_syscon	(SFC0 filter syscon)
> - sfc1_filter_syscon
> - sfc2_filter_syscon
> 
> Some syscon modules contain PLL, reset.
> This series adds related drivers for PLL and reset.
> 
> This series depends on the series:
> [1]: https://lore.kernel.org/all/20261008123338.11081-1-changhuang.liang@starfivetech.com/

There is still work going this dependency, on things you depend on.
Please re-post when things settle, taking into account feedback on this dependency.

If you can use b4 pre-requisite to mark your dependencies, it makes our life simpler as
it help automation pick it up. Thanks

https://b4.docs.kernel.org/en/latest/contributor/prep.html#working-with-series-dependencies

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
