Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A19EE77180
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 20:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4xTnGhgJCO0nzf7kVLjeUZvD7K7Q8atFOYh3h4WvUk=; b=sVk4vMngumYREp
	+UcqtZ6zhfc47AKZB76CwyKe3PMLUZlpLnCW3U98Qe64N8s8ICdAKckWnWRegiSgGQIXpXqMwWSvu
	0nkiNEQNpXeFh1utESOJv0+40GSRg7BqjgaqOyAO2YjOwoENZtV/hOXfuCubyKJHuAymfMhnl/Rkp
	o1linNB8GG8HbRYbAFdEsro7kDSNuy85hUhoV9j4wV/QOPwGMhhZSPDx9QQMKnWnEaZXCQlzeofn+
	VwkmITOWFkrIfS3PT50OOBbiJhWYLgPwjQ4qiehOmiEdapqGuYehJhbkWy9JViteIEvDqFR88J+oE
	b1DD0LPv1katc/sCRtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHSk-0000000BDq8-1WCk;
	Mon, 16 Dec 2024 20:13:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHSh-0000000BDon-3pvl
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 20:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4559B5C55C4;
	Mon, 16 Dec 2024 20:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27692C4CED0;
	Mon, 16 Dec 2024 20:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734379983;
	bh=9z+6ELH5uuiyTM6MH1n+deEOoHgAw/exY116v8SrYUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fa6UDZZC/YeDt+DgUzi6sliC6aqkhfUhgE2vBDBu91o/Cn5MGLo84GatGuMHRXgzv
	 9CYg/aafuoYk+YHz8QSNqWPX/7BVXGpx6AreEwnCPLVDUqIGBR1KJpx2/HG66Od0kZ
	 JTd0ppQSmxykHQEsi+pOh+DQTaFdE5ibrUmVFTrxr6Y7QsCjgYEFU2HwT1a1nESrRB
	 Wpp3tryt70Hvyq7AwBKtCLDNUGpiJWwgtRaU3o+iLACr/WqkiUjadFPtfd00s5GwAn
	 euVejRkOzySahmGKrKU0pB7xQyXgEE2vX5Orvpq4tepvXePLyXxTkCjGGcCbjFa2xF
	 mGzSPoROi+Krg==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	E Shattow <e@freeshell.de>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: Use named definition for mmc1 card detect
Date: Mon, 16 Dec 2024 20:12:46 +0000
Message-ID: <20241216-elixir-cupped-f7a83bce4e12@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210040652.164030-1-e@freeshell.de>
References: <20241210040652.164030-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=339; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=TXGlr3eOJJ2HgKkEMMrHmxaZTXUHl2/ECdNZ18GXMqc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkJnfs1l507Hrbwq2//keb0gNjNK5RuFTz9byjwfe6fm YxXt6xo6ChlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEKrkY/lmHr3i7OC2mqU1q Ocebs97sfAfci+/488VvTsn3lpyX8pyRYWegxO1lDxJORSrN2tDazrnrwTKXlsc6ebnpx5lDTt1 6zgkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_121303_992635_BE7B3C41 
X-CRM114-Status: UNSURE (   4.37  )
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

On Mon, 09 Dec 2024 20:06:46 -0800, E Shattow wrote:
> Use named definition for mmc1 card detect GPIO instead of numeric literal.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: jh7110-common: Use named definition for mmc1 card detect
      https://git.kernel.org/conor/c/c96f15d79172

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
