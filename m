Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F073606A326
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a1XEgfb4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=RU6148x8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsY0ZSZddFze6/cjFj8K9mrq5JmoIGBDC4vChN14xuE=; b=a1XEgfb4AcLqk6
	LwpF6jjbFDZDK6hg657HYdISxlNbI5fj1Hp2PAxgtCq6/HhNvWLYCrr0q1FJlZfolADkIYuC4wiMu
	cBSH/QrwlpvO/fcRAyD9Yr6pfVpFfofbkwSgnsbxIBbhPKrrQO/Prfd4UIXyWEiPvyVYhjYxfn2B0
	124XECVHPbz1YoKzU0/34DLtpMuJoX8oEU7uXXT2PTZ9r1Qxa27EtG/AoeDVTT6nBpVZSrLIdCklb
	NINmibSMEZICyyZFDz7CSyJE+PvohPAOHqsw/Y8/5aTyUf1Ihh/RE4pb3RpoINImIrtVJ6gPXhLLY
	SL2XmNRE/7qH13bwev7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUAu-0000000BhQ5-3GLe;
	Wed, 21 Oct 2026 11:08:04 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUAr-0000000BhOS-2zT6
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 11:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1792580859;
	bh=Lv7Omi5n8k/bxt6p6Ood58jQjPgelYC54rFdKIGqlDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RU6148x8F8xQtgBEgbPeOFO/r4kqbrnkMiqhES+lxGo7EhBo4HEHYbI5PwrGnoLbg
	 lqngIyqKCLwBZOQKovwE5liPCfPLgURH4u6qrwu0n1EDuy6vSMWb/Y6AWXO1Y2s4KY
	 jD65I13FboQh/3dhd6PLXPRkFNOf/btq1yfHaj8dzj+fBYtQwYvziKxp073/vNt5Is
	 EmGl1FhB0tU92jWSLuDq70HFbppfvzq2iB2ckGhrYacamUUbq0HE+0ZpUsjda5I1Zx
	 BudGOG3uFTjx0qHf2gU7y2xQytgNo2+oZHcotJiT8sQJG1WbeaV7/RDQ00LsRf03FO
	 ZvXrq/m3neQ7A==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 90006B2219EB;
	Wed, 21 Oct 2026 13:07:36 +0200 (CEST)
Message-ID: <b47b95f6-600b-4b0c-8aca-acd7c75d5d07@freeshell.de>
Date: Wed, 21 Oct 2026 04:07:34 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices
 bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>, Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com>
 <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
 <20261019141752.2077207-1-alan.tseng.cs@gmail.com>
 <20261021083425-GKA125937@kernel.org>
 <20261021110001.2905669-1-alan.tseng.cs@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261021110001.2905669-1-alan.tseng.cs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_040802_278242_F3DE2AC6 
X-CRM114-Status: GOOD (  14.51  )
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
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 03:59, Hung-Chun Tseng wrote:
> Hi Yixun,
> 
> Yixun Lan wrote:
>> but for bootph-pre-ram, isn't it about the DT nodes which needed before DDR
>> initialization in SPL stage, and should have nothing to do with BootROM?
> 
> Thanks for checking with the vendor. I agree, the schema defines it as
> "the phase that sets up SDRAM".
> 
> I also need to correct what I said earlier: the EEPROM is not only
> used to tell the boards apart. It also holds the board's DRAM
> configuration (number of chip selects, data rate and DDR type), which
> has to be read before DRAM can be trained [1].
> 
> So in v3 I'd like to keep the i2c2 and EEPROM tags, and also tag the
> EEPROM on the OrangePi RV2 and R2S, which I missed in v2.
> 
> E, does that address your concern?

Yes, as based on published documentation and confirmed by vendor, that
sounds good to me.

> 
> [1] board/spacemit/k1/spl.c in U-Boot, ddr_early_init() -> read_ddr_info()
> 
> Thanks,
> Hung-Chun

Thank you Hung-Chun and Yixun,

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
