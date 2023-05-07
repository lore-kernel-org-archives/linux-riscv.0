Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19841C77B7D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 22:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xC6ZDljo+IVYgRlYAONMbsFLf4/G2lWXWUpLLjT8SiM=; b=F9W2sBMQfO2VgZ
	IeTuznRfHvnnbLC6qVDC2xDHXoexGjlbpLf5gsG4ejGJHZzzAbskMdViW93LkYHuKSBjvWRR398yW
	z/+MaQm6f0SeojxBVrneguQpg9yiuFvbh1cNjj8FHwUksGznYoJSPgtWqLrjVrqRx0m3480ykwYZW
	P6lt+lziyif2NbgbYxiNHaBxtJdVpOOSiBjjXuAfabcjAP2F0mZ8PdH3as2h/YCLAL8ajsKqQfT4L
	+ovqBxQwhLrIDdzIp5vJT4tWwHgaRfgpatCsneRTnN0yhbRRDKXXi95YzozQbC0+XqrjWs5i49fdj
	svONAmexJtjNV2WYSfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvn39-00GmOi-1P;
	Sun, 07 May 2023 22:40:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvn35-00GmOI-1c
	for linux-riscv@bombadil.infradead.org;
	Sun, 07 May 2023 22:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FdS0N2SwQ3nm2SGeNxyGIUN+k3vly24wyHjE90gNTKc=; b=FqtzbM+//EQQNGCt1oxtLh9qQd
	BfOSAPyY4YKB4hCz0ZUjbibdQJtNUL0ZHeKrvb0AG3L4egnJjd9T1ZDtGnicxxI2zHnxnuURLDSEB
	1grqS+V29yCh55MyhfCpY1HEiWhF2rmx586Xd1MSwKvmnfwfZUEA4i5FQW7BI137Fl33mHCAoAhM8
	s8LRquS/41Xq5KG4XU+ZCuJhS5d9j9M7wzi2Wxqr9xSej/63aynOggZrdFoHxpfULeza48tBpI5Uu
	+X1oJFOxTXnygMXjRGJxM9WhaZQ2N/1azSDMSM32YJfy/OfKrag0d0m5q5azCGKsXfUC+Xjj0TNv9
	U6haduEA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvmSY-004bsH-06
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 22:02:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D7E761007;
	Sun,  7 May 2023 22:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32AEC433EF;
	Sun,  7 May 2023 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683496941;
	bh=BJlaWwcTZmYTjOELCU/kndId2NcMMsVmpbbLNpJal9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G6LyHD5mOb5RnU0RIMjrhBt1Kscv/GXcxFuyFZew4aDlpmQ9xBrLjtNTFgE9fhnz6
	 PaIDa2GpUkYob+ZnT9n/k/x2jFkCE5sttPksYn+Tvor4Ch4HrokQpafzpXDcF8q75x
	 j/lmmVwLi9X4FPuw5sYG8hUvDCxB0Ckqr8dQJLs7tfNwJLb8Xl62TJgxfxZaEFCObg
	 RX4nBfQlQGpkHqXVR0aiLehIGTJKIAe9KphukoZBqVsB+m+PfweZdesiL056SG41z1
	 7zNxoe2dOhZjJu17JSJaSp/QY8gmPKYEGKGD6gkM1tCT3LfQhYWomWkSABIHNYFIde
	 C7q1T9/Je18Cg==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Walker Chen <walker.chen@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: starfive: Add PMU controller node
Date: Sun,  7 May 2023 23:02:10 +0100
Message-Id: <20230507-postwar-discount-89cc89917fe2@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417034728.2670-1-walker.chen@starfivetech.com>
References: <20230417034728.2670-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=354; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=j5UAhVrZomsiM9bXTzDgVTozeZ71uctOxV2VIj5ocB8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkR8g/CZ3yKszifvO4Zh++pqxrps9ac6HM0ENls8He+7 N+iSRu6O0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRoMOMDB2rNzv2SYY6Rl3K VjP+9ZjnoHhUx8mJu0Qm90VOE1b468XI8NHl8Sq+fytn7Oq0Uzrzx3baaxa+hyuOSHVkZi02WFg xix8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_230226_368910_CD92B2F6 
X-CRM114-Status: UNSURE (   7.66  )
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

On Mon, 17 Apr 2023 11:47:28 +0800, Walker Chen wrote:
> Add the pmu controller node for the StarFive JH7110 SoC. The PMU needs
> to be used by other modules, e.g. VPU,ISP,etc.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: Add PMU controller node
      https://git.kernel.org/conor/c/6a887bcc4138

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
