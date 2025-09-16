Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C6CCAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+4aK8BStR8uKfShmvCr98hWeAXMpwm8dSBA9N6RmG0=; b=TLkiERPy6Bm/UP
	RSpy9RXdWH0DHUhNOIdCr9FeV4vSWghEljqMGZkJxivItGjTnPqo6zWsJcrxxWO1gJIVmbYUWY3cy
	Waj8fGrWlVURkmhN9EL+ThefnvUIeBs9j9Oj9AW13muSeHk0AwODrjgojDw1mIz8lqoc1TcxGhS/b
	KYhTuhp4riSKdGw9vPQEtFPksY5VVPZxwubv/2vxBRD/DsuKp4xqYnLW/QWnI7NfJXYGet3oE8EeJ
	zr36qTcP1T/MaCik4bHKNcFDXecW0Q7TGn3X1iXR7vZksWpFacky7zhFbzzCBCPdIKFPYiCGAeDSl
	bPh/nwq9JOmDKh9T3tkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVoi-00000007x8T-26Co;
	Tue, 16 Sep 2025 13:33:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVoh-00000007x8M-1oH7
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 13:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8BFE600AE;
	Tue, 16 Sep 2025 13:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61173C4CEEB;
	Tue, 16 Sep 2025 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758029634;
	bh=js/Dhw9q7ZrGUdTOX9dqiXEtYoFHhuhzGJRzbX3urvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBM8UdOE9kEKABZbSGUJ7s5W3dqN3pkSSO9EJ7+o81jI7c+EeWOZFiIx8C9Yfv1CG
	 SJfyphuo8oAM3EjvHCkAkt4h7AvSIYICOHffGPPuIaGdApicsYD0a2VN6sCQEK6L9E
	 A4sUGJiGBkl2Azt3ch3axjjVKhwdEm7RWSAZ+Rfrq9t80GuxM2l+yWB6oaeXTLWaFw
	 uWEBgAPgfmdph50u+JqEAlgjPhfj0wO12xHhbtbH1DFAuCG0IBJqaKrT0DkdfAPyTT
	 UgL5YixNwz5izOF/z0ZKtxgtxfwvNqKCNVtgBKlWqgeC1U/acIY9vWwhKWbNoaOqUn
	 UrPxcqcCd0CSA==
Date: Tue, 16 Sep 2025 08:33:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Joel Stanley <joel@jms.id.au>, Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joel Stanley <jms@tenstorrent.com>, linux-riscv@lists.infradead.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Michael Neuling <mikey@neuling.org>,
	Michael Ellerman <mpe@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: Add Tenstorrent AI ULC
Message-ID: <175802963274.3650143.11466278944413670465.robh@kernel.org>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-1-ddb0d6860fe5@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250913-tt-bh-dts-v1-1-ddb0d6860fe5@tenstorrent.com>
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


On Sat, 13 Sep 2025 14:31:00 -0700, Drew Fustini wrote:
> From: Drew Fustini <dfustini@tenstorrent.com>
> 
> Document vendor prefix for Tenstorrent in DT bindings.
> 
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
