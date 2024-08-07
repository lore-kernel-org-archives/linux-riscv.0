Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9630DC3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQ66cgzad8+6UOdPNqJtTKpMjRYenPyUjHRZW2gddQo=; b=y03FQGQ2iyIyAv
	xri3JTIaBV0rhQb4/9ZGK11ZTL7CpMkxHbtFN+OT7qzeqaAE+ft6IBwmVse6FwQ4mYODuG0c8sa0j
	LKE8Fp0RlWiZCBZmmcLRCBZDejM7myvNhggARQcsmrlOsO5eOgYkISfsQpgrc7oshMf2+HU6UynOV
	fiW2pP0Y5721xChYe890n4LstmQpFjGK/zSisgUVaChzqO2AUXD3E5OGsJnImLgRIV1u73GBZKSh1
	beAezOozVPJte/mLELguaE4h+RgpRZ91eJIyg2WHg9GwxmuHf8U7IBq365w+X9B3IsogUliWEuMfh
	lphomfCf5CovtsEGfzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbkR6-00000005osd-4711;
	Wed, 07 Aug 2024 17:26:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbkR4-00000005orh-1X0F
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 17:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A2099CE0E5F;
	Wed,  7 Aug 2024 17:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23311C4AF0F;
	Wed,  7 Aug 2024 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723051611;
	bh=Tnz9XK8+vxjn2lCOykMbu7fqnmKrX2LwPkHP6xxlzeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P12bbU/a2cf98ZoKxVFgTE8fXqxfApQZNXSzLMeZV20GGpsEOD3IRqor6zpOr22qB
	 BDGrTyXEeudj1IITzXEvO7kbwQDgjTI+Rez9oaT4U1lX+wgz2x4k04vRCuUHVPWXq/
	 Lco88MhQAE4XDhuQ7EG4fpvnKC22YHw1ZbMhs3fPTPNS+Z8vUpsT3e5j0pcOS3d4nJ
	 XBOYnTt0joDjt8iuesQabYy0kHruvPTDWdwVge3PNMVq8t4rC3g5ybTkAPVRcxgBgK
	 d4erbbvxiEjY9CkoOZlM7/ymIrqEiJbJO9chIffB45cwA7qJCQHlWrfGXK0SM4WWXJ
	 Ki2DTUtoBStHQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	William Qiu <william.qiu@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: invert Misc RISC-V SoC Support's pattern
Date: Wed,  7 Aug 2024 18:26:41 +0100
Message-ID: <20240807-overstate-diocese-e62698933f6b@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806-riding-spinach-8cae90d6e05f@spud>
References: <20240806-riding-spinach-8cae90d6e05f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=585; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=AxQjwlIcLsD4qYeMY4FeoDkbPU2GEXtOPNJVXagIvnE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmb1wXN2MJ1pqTW8tueZa4NS0wnenwOeVMVP3ONts2p7 X8dyjbv6ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBE9HMYGY5YbpPyXjXDtmz9 +UdHq1dNvb/I57DQk4ACD5PMKRrnp8UyMvRI+OrYqp45+LloyXHFpDvRUbtsuOQ0C1028zznvdr 3lxEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_102654_616423_70353E89 
X-CRM114-Status: UNSURE (   8.43  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 06 Aug 2024 18:36:21 +0100, Conor Dooley wrote:
> There are now more directories that someone else maintains than ones I
> do, so invert the pattern to cover included, rather than included
> directories. Ditto for the bindings directory - there's more files there
> that are the responsibility of others than mine (and I get CCed on all
> bindings anyway). Remove it from the entry.
> 
> 
> [...]

Applied to riscv-dt-fixes, thanks!

[1/1] MAINTAINERS: invert Misc RISC-V SoC Support's pattern
      https://git.kernel.org/conor/c/7d9d88890f04

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
