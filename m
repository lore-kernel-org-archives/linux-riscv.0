Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25F9C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 19:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJPaYVowxi6s46sHPDdiz0r/t3nej2doo5uURgDEZnU=; b=upVSxoX4o7mWiZ
	TRt1Upl+/rGTdvEE+Qrb5RNoAsVx20bsMz8djkyPryeN5lCdWWrYISMIoUesvX8SIpTIsBo5dXJXg
	y1L8dCYBO6Qu9jITH5iEwfYIQ8RR1bU0i0Wn92H/wT+mRt58WItT+sG3S5cdiBhYKrBL+UzvcIcdB
	AGlSbiGzlDAHVCwIB/y6DcmTCuUBWkSowht5DC4B/ntLN35iCeYvxIhjdMEXY1IuISTbdl17+wumN
	lWIiwoL61aChu5ZSi2fChNjNGL9BdmCDVg92n+yYlPwXjDMfi3Xp+ugg9cWUP7RdGPVziRpseaonR
	eDIT3+stHOTLu7Po7Lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Wvv-00HWoK-Q5; Thu, 07 Jul 2022 19:13:03 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Wvt-00HWnA-7q
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 19:13:02 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B6250784;
	Thu,  7 Jul 2022 19:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B6250784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1657221177; bh=qL7VYc78jVx9LMUHDXqpy7ynrmJbVJjFrUcf+/qpMfw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nrAEjPsYMAonbvJuC5YoW3yDogJZcXDdnd8l3mRPhFnO+1P55b8PQFEydP6TlfPKW
	 P9c62CfudiR5PQ0WARL0qnFasbGpO3qRfpNhDsuUEetRSA6MS4WRKizlsJXL8XRbp1
	 7nHGX5+wy9QA0A/SvcUg6HsfSRFg2Eft0xz28d0IhNlw5jZiXmvzaJ+szEmbATd2Bz
	 N1NTtsTqZSpbvdpDqZdXQypCLfOUUea3tD4qA877k0354N7yRxc0ncIrOtPTF5LITW
	 cE1r/DSQvMdfkvWdEEP7MkwATZQgPnRdhMhN4OpinbLGZEUQupaRX69j+jRbjjWr4U
	 NVSpHy4P0hJrg==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, "H. Peter
 Anvin" <hpa@zytor.com>, Alex Shi <alexs@kernel.org>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Dipen Patel
 <dipenp@nvidia.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Federico
 Vaga <federico.vaga@vaga.pv.it>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Ingo Molnar <mingo@redhat.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Yanteng Si <siyanteng@loongson.cn>,
 devicetree@vger.kernel.org, keyrings@vger.kernel.org, kvm@vger.kernel.org,
 linux-cachefs@redhat.com, linux-input@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-tegra@vger.kernel.org, rust-for-linux@vger.kernel.org,
 x86@kernel.org
Subject: Re: [PATCH v2 00/20] Update Documentation/ cross-references
In-Reply-To: <cover.1656234456.git.mchehab@kernel.org>
References: <cover.1656234456.git.mchehab@kernel.org>
Date: Thu, 07 Jul 2022 13:12:57 -0600
Message-ID: <87a69kbuti.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_121301_327388_FB83D2EF 
X-CRM114-Status: UNSURE (   8.33  )
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

Mauro Carvalho Chehab <mchehab@kernel.org> writes:

> Fix most broken documentation file cross references on next-20220624.
>
> After this series, only 3 references will be broken:

OK, I've applied everything except parts 4, 9, and 20.

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
