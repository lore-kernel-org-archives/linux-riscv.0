Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B897C77B7D
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 23:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqiXKW5EynTFE4lDCxLGz8UWHs2CG628gxl/TjbOXd8=; b=I2etfoQo9edzBj
	bP1/irKwvRFJ1d/aVw2/98cuSwnL+BDAseS9DneXhVDCLZLHqPJV3e1r8EuwK5wGQPToYGfiEGH69
	1aOstsotDA90dj7Rk0RYBnC55pW5CyMlZJWIl0dph/B61/R9mdFVxt8KU4VQLVCoKtU705mhxb9VG
	Mbz5+ijNeQrGN1CNFsPYsODy+caDd7MKagI0iocsnmyYGx7JhvVC+tD58cE8SRfHB87L39MChNydl
	McVPpov/vd8xV9GsDNStlCXc9c/TcdPvx7oDkw5BitZIQB1YDD0IqQwN4gSV4BwiKI41WmUby+Hf+
	aLnLSwDpWJWq3u/mPSvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyLJM-000TtC-0B;
	Sun, 14 May 2023 23:39:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyLJI-000TrC-0k
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 23:39:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24C2961181;
	Sun, 14 May 2023 23:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE78C433D2;
	Sun, 14 May 2023 23:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684107562;
	bh=UaKQd7JGnnIhaE2P6Uv9otEEJS3MWlvbWfKVnt8tm50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ym9b1hIewy3LcWK8uerVc+T0edQyUjw6sbk43zg29D8HcMvmRUGaX6jFJhnyPWVDp
	 jBmv8+ZsWr58Ou0R5Sj+STSutBJui2B0qRLXZ+7Mpg0RIUbCffx68SgZAtsQh8yBn1
	 Ovr832HqjVXTwej0377wJyozx3dY2WQDcrnlfYtJ0asjidOkBpOoFE+rTQug81fmvc
	 ElOkNZV+3IhyMNxvW3Edgvmzz/6yYDm5f857izJJGc4dyGJ1obDe4Ecd3Oc6sv4ifi
	 ZZMHsj9R2DhG1FMeXbgUxBPyAM0RF3J6TLvVqz1IolAb57gIqjDvwYKzpXrOCzlwqD
	 RYczemM5WLzFw==
Date: Mon, 15 May 2023 07:28:10 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 03/10] dt-bindings: serial: add documentation for
 Bouffalolab UART Driver
Message-ID: <ZGFuikzSsP81/d23@xhacker>
References: <20230514165651.2199-1-jszhang@kernel.org>
 <20230514165651.2199-4-jszhang@kernel.org>
 <20230514-bust-slam-10c7b9cbe455@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230514-bust-slam-10c7b9cbe455@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_163928_313014_211D9EEF 
X-CRM114-Status: GOOD (  11.75  )
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

On Sun, May 14, 2023 at 07:17:27PM +0100, Conor Dooley wrote:
> On Mon, May 15, 2023 at 12:56:44AM +0800, Jisheng Zhang wrote:
> 
> > +$id: http://devicetree.org/schemas/serial/bouffalolab,uart.yaml#
> 
> $id: relative path/filename doesn't match actual path or filename
>         expected: http://devicetree.org/schemas/serial/bouffalolab,bl808-uart.yaml#
> 
> Please test the bindings before submission - even dtbs_check catches
> that one!

Aha, I knew the reason. I did run dt_binding_check and dtbs_check,
but then I read one of comments in v2 which suggests the renaming,
that's to say the dtbs_check is done before the renmaing. Sorry for
confusion


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
