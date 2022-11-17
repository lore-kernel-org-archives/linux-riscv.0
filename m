Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141C0C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 19:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jt52uulGhqaguLNxWu9imwMPyMiIZB4HFmHo8IKJfQ=; b=nN7JT1EAH9OpeT
	TPxK+XFfMllbArmzPHWhQ929J9vWoW7/MTlQ4DDRY7+X/QUq2iIsRsobQJ4VkmK+h679SbaD7RUH9
	ZTN2CaA1jRddmn5V+7R7B5IAVoc5XuMvJv47lCkrAo32NZlMWO43R/PThJmwK8BvF/QNQ5SPW1rSg
	npFV/73GDRoQFIZovGtBcB/dKrc7HGnEp33/0G0KgvnsONlSRwWdPkZQDiyj5FeOVNDOGeuSgxr/5
	+RI7hMfNRbQAIOUZ8e/kW4t3kOqC/Pf4sZkK3HsCrqmhwkehmAOFpa+JNKQfg8dz8OiONNERpIfP4
	Orx/dVQZ4u+zJQT+RC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovkVi-00Gymp-E9; Thu, 17 Nov 2022 19:25:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovkVg-00GymH-7Y
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 19:25:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 97396B821C2;
	Thu, 17 Nov 2022 19:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B2FC433C1;
	Thu, 17 Nov 2022 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668713112;
	bh=uhIeKvgVfo1hBvIQHkhhEHq38wFUDZbWEAfYIe3i9oU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HieVomyzsdbSRWx0U5g2pOBNo7nWzCg9lLGe83lZ0VPtF1/SWS60bHq1Ye6fEE5ly
	 cIlTuGW9Qz/yncze5gw0YK74M4EXNP7YwDxdoYQ9eRVry+qlROKV+JyWzpdBPJMW6H
	 pCIZAPHau6b+CfwjR56wgrZ60yxP6b+z+rKXwwb/7gYlyyg2kZezn1TbA5wWbX3mwQ
	 6gh4ACyG4a24aja63+UVqlFNI1nWxCv7qp40JkJojqt2jjJsObABHH5sSmyIHmJpzf
	 PgDiieO4PQJkLnbEkzyXIqpMq7dXWtQRBk+LODoYSuSOVcGioKZnWSXLkJ10tqQltt
	 I/55MgDoT5S9A==
From: Conor Dooley <conor@kernel.org>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vattipalli Praveen <praveen.kumar@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] riscv: dts: microchip: remove pcie node from the sev kit
Date: Thu, 17 Nov 2022 19:24:55 +0000
Message-Id: <166871307494.3905205.15646099439203275372.b4-ty@microchip.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221115152546.1425309-1-conor.dooley@microchip.com>
References: <20221115152546.1425309-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_112516_462349_C434E919 
X-CRM114-Status: GOOD (  10.65  )
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

On Tue, 15 Nov 2022 15:25:46 +0000, Conor Dooley wrote:
> The SEV kit reference design does not hook up the PCIe root port to the
> core complex including it is misleading.
> The entry is a re-use mistake - I was not aware of this when I moved
> the PCIe node out of mpfs.dtsi so that individual bistreams could
> connect it to different fics etc.
> 
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/2] riscv: dts: microchip: remove pcie node from the sev kit
      https://git.kernel.org/conor/c/1150f4cff831
[2/2] riscv: dts: microchip: remove unused pcie clocks
      https://git.kernel.org/conor/c/f4e700fd9466

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
