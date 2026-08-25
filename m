Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083EBC61DB4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 10:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGCYjuEEvR+3xs/uAe9PM5Zm5bC8Wcw/eJgMC9NszDs=; b=x+CoZ95OjD+Nx9
	NEAQcm9eVakzW4F29C1fTu2NylepoTCjSnMyfBFVM5qOJkEry6eR7Ly/WmFmT/mK86UflGeKf5Hbz
	2Cs2YifwmTiA74U4wC7IPzS2DUF2ErwshEHAV75FHz16kJS8a7MC/JWT5WO3h+5ZU1Nii/ucqQKiU
	qgISS4xzzj2DzDkHC1fqjq+iCXxZ1fIKFy60M7lUoFQpodsrdOHY+4qkC6jw0HzPgCwBEZxFEaymv
	1rd+86CAJkhPCwyFeXiMIOBm8PIQdNS45Iot/CK/to0K8UrcbJ6oCW42RTKBKW1cEqgr5nrXcDjXh
	TDMw0J0l8VVW16mDG1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo9T-00000000a7y-022s;
	Tue, 25 Aug 2026 10:13:07 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo9O-00000000a4D-0CWW
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 10:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=B6Ik//fdJsRM3YoXkW+CTFTfgmywDovmt
	WiSCiahu00=; b=TXn0V4i9HS7MYYNysCyvSp+F4BJOzFOwJYlbjciEmSxFeIBbm
	qqnMw6M6ei/ZU5vRU9RqEetUmHRq590cpvKNW0a96CU3Kr7rQKxFqbIPkpPy78y7
	xux4QDYLTPP9Had1QWV4OUg9yai8KUDZYd7JZKcBMuEJBkXYL2i8LrdkvU=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCXxs2jao1qpzMBAA--.329S2;
	Tue, 25 Aug 2026 18:12:52 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 08/12] dt-bindings: net: snps,dwmac: Add compatible for
 UltraRISC DP1000 SoC
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org, 
 netdev@vger.kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260824-blimp-spirited-01365897db24@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-8-61ab7aebe9e5@ultrarisc.com>
 <20260824-bride-food-052b313e4b76@spud>
 <20260824-blimp-spirited-01365897db24@spud>
Date: Tue, 25 Aug 2026 18:12:37 +0800
Message-Id: <178765275795.744215.4911904858473260204.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787652758; l=2269;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=5dYjzzWbAa+d1SZc/KWtoViQS1sWxVQw8dgEHXnwgvQ=;
 b=BmgfJ4TSHWZivJhgL5UzOY3W7O3nZB2tcpMTcDQMruGKyZz5R7tjA1mWLIcqeXFtnstKZ9/Yb
 pofdSWFIrXgBEIaX7n4Pqd1ZfUWYV9FifkwuftQ7j+dkeJTVucEGiKo
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwCXxs2jao1qpzMBAA--.329S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4xGrWxJw1kZry3JF4rGrg_yoW8uFyfpF
	95AFZFkF13Jr13Jw1kt3WxGF1jvr40yrW8Xrs5tr1UKF90gFsYqrZFgw15W3Z5Zr4rJFyj
	vrWUur13X3WjvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBEb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWrXVW3AwCY02Avz4vE-s
	yl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0pKiifUUUUUU
	=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWqJFPsACQA0sm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_031302_657785_EB07F6B3 
X-CRM114-Status: GOOD (  25.36  )
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

On 2026-08-24 18:13 +0100, Conor Dooley wrote:
> On Mon, Aug 24, 2026 at 06:09:48PM +0100, Conor Dooley wrote:
> > On Mon, Aug 24, 2026 at 01:54:21PM +0800, Jia Wang via B4 Relay wrote:
> > > From: Jia Wang <wangjia@ultrarisc.com>
> > > 
> > > Add the SoC-specific compatible string for the UltraRISC DP1000 GMAC
> > > controller to the DesignWare MAC binding.
> > > 
> > > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > 
> > The dts may not be right, but I am also a bit concerned here.
> > 
> > This binding permits 100s of combinations of properties, of which only
> > a very limited set can be correct for your device. Just adding the
> > compatible permits all of this variation.
> > 
> > Please add some restrictions.
> 
> In fact, it's particularly bad here because you don't even restrict
> which fallback compatibles are used, so there's no guidance on what
> version of the IP is even in use!
> 

I have rechecked the DTS against the hardware. The controller uses a
DesignWare GMAC IP from the 5.20 series, with "snps,dwmac-5.20" as its
version-specific fallback.

In the next version, I will restrict the fallback compatibles and add
DP1000-specific constraints for its hardware resources.

> > 
> > pw-bot: changes-requested
> > 
> > Thanks,
> > Conor.
> >

Best regards,
Jia Wang
 
> > > ---
> > >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > index 2449311c6d28..2ed4564ae99d 100644
> > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > @@ -119,6 +119,7 @@ properties:
> > >          - starfive,jh7110-dwmac
> > >          - tesla,fsd-ethqos
> > >          - thead,th1520-gmac
> > > +        - ultrarisc,dp1000-gmac
> > >  
> > >    reg:
> > >      minItems: 1
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
