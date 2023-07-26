Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADD3C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 16:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czWhINDf2iZp1SlriaeLb+uOItFJvCRiANwdMFzttWE=; b=OB/SCfjkcnWBFb
	QhMq1GP+xULoLWEBGJmhnrNc0UqoP3i+XrkZ1HqmqxsS22kpGkSdOm2njG3OQhX15yBo7w7GVvKAI
	cqq3AuTOxDmdrGj8LQAkgZM/tYHQVI2KZEsM3QcACdttm6vz+PNNySefZtJZkKcGHkPZA2aQlAqhQ
	gMsZutVu74YUQH1boTOM2EFx5nnkWcnxL4TTCHpcQnQahRYPzgRRaH10xsigkip0cney4Fhvx+s83
	nLhzhj3OxFg1WFAOBt7D4jloxjRPcPGJUwG7voK+Fkvpy3TlQ0pKf4+Jq5DFxg80StXy4c13FFMc5
	BD8R3FLHxTHYp7sxJpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhAg-00AyzI-1f;
	Wed, 26 Jul 2023 16:15:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhAd-00Ayyq-2v
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 16:15:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C1E761BA0;
	Wed, 26 Jul 2023 16:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF90C433C7;
	Wed, 26 Jul 2023 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690388126;
	bh=PjS7Z4XLVUrWS49n3z6ZKWBMg/vyivtQsAyTNpykwlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wo96XIOd233Ym49/rnGPn2nsiHMtnSSckxg00swNYkF464YXnWNH52Brk7gzR8a2M
	 xXYR3hdZxh8VbM0jSRCQjsXFZmtcw+4hgL72Y3zEcbbMxgBMllibtqfNqzpiAzjHlA
	 vTPOFJ9Y+ldpElGeT8RSwp832W4E4yr8DJe+lCJMTCDdKbkmBs8vDVSw0a/GCj0BH7
	 Q8cRyCNo/OQ6fif/Ol0Zf6DO4ZTmUUKsPFxSn6tYK7KrkzUgxM+XwIHpz2FmGsxZh0
	 Xekl4ta5ukqIc6eolJU16KRL4ZHrpXgaF2eMwyM987uzBi6lo/GJcVFy/DDT9GxZ44
	 fRPDa0SOMtISg==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [dt-for-next v1 0/2] Add USB PHY and USB dts node for JH7110
Date: Wed, 26 Jul 2023 17:15:19 +0100
Message-Id: <20230726-disjoin-valiant-9eb92de6a240@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230726100609.72550-1-minda.chen@starfivetech.com>
References: <20230726100609.72550-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=602; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=FYw9ShWdfK+KWcg2OyowqX9vfHSugqdrc2UoYjB9w7k=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkH3aa+ZnugatKl2Dlz1baaCT+emRxSLNz6vEX67+rYD +olxo8PdJSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAigj0M/8ym5bMzm27T/1yg mr9t5/Ura1bZ6fQ3Cj21rtLJ7lz8tZrhn0q9Uv9FlQtzPALCGPSuxTJ/LOgMiv2Y33Dv4a/jq3a J8wIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_091528_013641_0AC6CB36 
X-CRM114-Status: UNSURE (   7.94  )
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

On Wed, 26 Jul 2023 03:06:07 -0700, Minda Chen wrote:
> Add USB and USB/PCIe PHY dts node for StarFive JH7110. The PHY
> driver is in linux-phy-next tree.
> 
> Minda Chen (2):
>   riscv: dts: starfive: Add USB and PCIe PHY nodes for JH7110
>   riscv: dts: starfive: Add USB dts node for JH7110
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/2] riscv: dts: starfive: Add USB and PCIe PHY nodes for JH7110
      https://git.kernel.org/conor/c/c2a10081c033
[2/2] riscv: dts: starfive: Add USB dts node for JH7110
      https://git.kernel.org/conor/c/e126aa3abc4e

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
