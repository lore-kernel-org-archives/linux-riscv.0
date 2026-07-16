Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CA1C4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTn1le/BFHRCVgH+OWVybxMXB1RpVfC8/ZUhz2f/Zzg=; b=nCZ12gp5gWr71H
	OcpthI2vp/OyKdAMjoW7qQeUfColGssxvgCV40YpzPzn2lMTzSvKA0ZNY2lCLC+Z8NNxqBVdgKni4
	IxpuhiVjggGQk34fTHLPufYbOvlh+7wD4GcEmJbneOkvzLAZJxmsr+NKjbdwF8VI+S+ZPxOFAi+0B
	it9UQvxHgsseL0HPzdCWIaBg2efRZ9vYvYUJufXPhZ5//4xL1VsbTNcW2a6OLIz7deKyn7t6JCs97
	13iZYmior0sRsfFJibjNyr92LnbBPWM0b6/GnMQ9MpgQCFDtejR1NGv1eVSH4MkoetNpk9XYLaFYS
	bxyq6iukSDSv8fKc477w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLCk-0000000HG5b-2VT9;
	Thu, 16 Jul 2026 12:28:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLCj-0000000HG3v-0djw
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:28:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40B276001A;
	Thu, 16 Jul 2026 12:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DB61F00AC4;
	Thu, 16 Jul 2026 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784204920;
	bh=n3MeYOo8+Rr19Z4v7W3hyO2QLqc+eSJagB6reml0gzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q6kzhnaa5UWnFB96fNrm7zS1X5V1xJrU86Kp2kxNfgDx8XVOfG1vqvLg62bAY+gRC
	 hB8uzWiALrG/3m/2Z9jFgY5GovomS/vmDDBU2wf4Lnx9EsYRLAYhptoNv5sGgzXzVk
	 tDph2ZJyR+h2HVp9XlUCS73+md2Dw/Tds2ccu0qV7s7lOZ8ywDVwr0PvjSTkr7XGlD
	 Ycm8UXMXadXNBxSfEp99GAxDyHNFCiYu6m/napdXEoSDwK5wWWy4yNYdBg3ZruYUDE
	 +9jLmV79hQ+V+/6iehrX/8S/gs7mM5RqmWo+tUtfGEFc5DNdMZHo1oNFXeqk96blwT
	 V7EIVN3sjRQXw==
Date: Thu, 16 Jul 2026 13:28:33 +0100
From: Lee Jones <lee@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: mfd: syscon: add ESWIN EIC7700
 compatible
Message-ID: <20260716122833.GE1260374@google.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
 <20260706081055.1126275-5-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706081055.1126275-5-pinkesh.vaghela@einfochips.com>
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

On Mon, 06 Jul 2026, Pinkesh Vaghela wrote:

> Document ESWIN EIC7700 SoC compatible for syscon registers.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Still doesn't apply.  What tree did you rebase on?

Whatever you rebase on needs to have the following commit:

   1d02f2a79ebe ("dt-bindings: mfd: syscon: Drop custom select for older dtschema")

-- 
Lee Jones

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
