Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B1C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 21:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIjz1Bhxt96GelCfrYEyuiu1FEVo0peT7LLt5OdSoz0=; b=kgvZvcRbFwgI0P
	gQbid31uG8IYbnvR0UeK6PsOJXNnqdgD1Cj3f8enyCmpUcLTa89biB3fHuv1/vBKlwDD0O+SGdIdw
	P7cMaUdczpJAtxgjb6d4sNf4F4+0xvKJHhDEafLEkrbtrW6xGmH9ggagTtrxjNFNLIfAw4CKD4QF9
	FzJm6GA12PcfHcaCpkQ/+Jp3guaWGElkYFBWoRxGXkm9m7YgOPB8l08htWSXqX67ZDyOGpD4W3s8e
	ocgJDJIHVdvtVkbyFK7UjPU/XbZYICg4vlAkv1dSaucyTsrrRz/iqOOPU7ayZQStBMopG44AmABbT
	3iQzekGy05F8mJYfrxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ost0b-00HZlK-95; Wed, 09 Nov 2022 21:53:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ost0X-00HZfp-RB
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 21:53:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3782261D0E;
	Wed,  9 Nov 2022 21:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9C2C433D6;
	Wed,  9 Nov 2022 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668030797;
	bh=PrXPuXwUUBkDI5D0DaFW76OD0IFm6T2SflV4GZ2Q03U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bw/fcaXaU4Ze4jADGDsiUDfenIIltXPXDVKXyGOM7Zz0N8yWlx4aPIkSvQmG/mK7H
	 QzrnVa5QVsjjD+Hz6/uPDcxURaJQYgzOMzSflGncOrEeki4J1Xce5Ox+UAc2+8vWaB
	 7z2I+K4l0AqcgkIh8BmstJFpSd3pppYhUqrXNeW1aBVvhlGnEOSlIn3mMyLEsXsCZX
	 AF+s7M+HDhRj1za5yAyqAAJurGOrDg3oKUolUoHgfWjbWuSkxoVpW1tYmqUvsyaCVb
	 lsoKPzISZoWeMMOudV4353T6rrSNPc/WtWLI63dr376UEdIDRXxIMPVDst5gQ42XNJ
	 O4FzmSBRONjWg==
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org
Subject: Re: (subset) [PATCH v11 0/4] Microchip soft ip corePWM driver
Date: Wed,  9 Nov 2022 21:52:52 +0000
Message-Id: <166803072013.1609016.4163434263140050032.b4-ty@microchip.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221007113512.91501-1-conor.dooley@microchip.com>
References: <20221007113512.91501-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_135317_947649_8C6A30B2 
X-CRM114-Status: GOOD (  10.62  )
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

On Fri, 7 Oct 2022 12:35:09 +0100, Conor Dooley wrote:
> Hey Uwe, all,
> 
> ~6.0-rc1 has rolled around so here is the promised v8v9~.
> v11 is based on 6.0 stuff still & there will be a change to the dts
> patch in v6.1, but I did a test merge and there was nothing to resolve.
> I'll take the dts change myself just to be on the safe side.
> 
> [...]

Applied to dt-for-next, thanks!

[1/4] dt-bindings: pwm: fix microchip corePWM's pwm-cells
      https://git.kernel.org/conor/c/a62d196e8988
[2/4] riscv: dts: fix the icicle's #pwm-cells
      https://git.kernel.org/conor/c/ac2bcd194cc5

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
