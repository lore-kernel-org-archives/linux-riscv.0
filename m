Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED51CC5DF94
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mzk8L6klwNVUOnPm5lLlBauwLoMh/MDXF3HyNR4OBU=; b=hTk2Ts4WJl2Zyl
	6/qkvzs1m/rvgb31XVQNc/80Ty+lGYbpaDvQVP4OPyOpddjqPftUnPpFq4MtSSk+YiesUCIEP2w3T
	Y/pXTcFKS/1ZuSRFGnzBdtVGkW0Gop8INrMeRauRyhR2x9nkcOYPpGL3fdYgvS+8UX6RcIuTkf6CK
	o+qY2DY2I/z0l1XsvnIUynljZbgVzvrQn2DUGVXwDOAl88kxNdBYk9spYR2TtFLfbzhIhk8M5iAYV
	PszWiYIYlh0Q+AgNbDzR9AnaNIogK631DJc9KbwurzE37IRb+eTjReXy4iXFdyN+IoCQfRJr+ZUhJ
	WOwIpzYYe/vSun4IKDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymn1-00000000Pzs-1bWj;
	Tue, 25 Aug 2026 08:45:51 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymmx-00000000PzC-2IXs
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 08:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=Y5OfRGX5nb3vPgvkisInJ84mcEX6LHgXS
	SdtcBu0E6s=; b=UJLQyy0c/aSzoDyUBvs8rCWvLWp87i51EdbbuFNUUBKMVgsLH
	ULLWeO7vGwcTfLhPQiN9STfKz2hNBdHeZvcYMfCuX/VA1ehYO3QPzAWLJWYIUqDC
	suqelmdwWv8u381pXK3WZnHrA4UHlBhmeteSTB7waVf2RzAXjcEm0svTfk=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCn1s05Vo1qWzEBAA--.296S2;
	Tue, 25 Aug 2026 16:45:45 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 07/12] dt-bindings: i2c: dw: Add compatible for
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
In-Reply-To: <20260824-aging-umbilical-8e68cfcea468@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-7-61ab7aebe9e5@ultrarisc.com>
 <20260824-oppressed-jogging-5b055ca274b1@spud>
 <20260824-aging-umbilical-8e68cfcea468@spud>
Date: Tue, 25 Aug 2026 16:45:31 +0800
Message-Id: <178764753153.744215.13628356455140662072.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787647531; l=854;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=WrJtVbLSM8GbkbAn64EbEX8lLAe/w4MbK7EWpFSxYw0=;
 b=h1QFd/geJ3eCnvfmWE8MCcEuTL/3WBAshWGKokJSW5v7Y342aTIZNXVyNJFCAnwmJzvTTSSz4
 VabtmlcOV21DQ+pv1nlrXSy7xqd4zrKSpl7e8nDQc1SjJu3Iax0A8mE
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwCn1s05Vo1qWzEBAA--.296S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF18Aw4Dtry5JFyxuF4rZrb_yoW3uFg_ur
	Z7Ar97AF1UZFy7Kws8AFsIy3sY9F4DWrZxGr45XF4UJ3s5Kry8Wwn2grySvw13JrW8try7
	Cr1Sva4DtrnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6kYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26rWY6Fy7MxkIecxEwVCm-w
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRjg43UUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWqJFPsACQAwsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_014548_340649_9333F051 
X-CRM114-Status: GOOD (  11.50  )
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

On 2026-08-24 18:14 +0100, Conor Dooley wrote:
> On Mon, Aug 24, 2026 at 06:07:29PM +0100, Conor Dooley wrote:
> > On Mon, Aug 24, 2026 at 01:54:20PM +0800, Jia Wang via B4 Relay wrote:
> > > From: Jia Wang <wangjia@ultrarisc.com>
> > > 
> > > Add the SoC-specific compatible string and use the generic one as fallback
> > > for the UltraRISC DP1000 I2C controller.
> > > 
> > > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
> 
> Same here, I was too hasty - please add some constraints like clocks
> being required etc.
>

Thanks for the review.

The existing schema already limits each DP1000 I2C controller to one
register range. In the next version, I will require two clocks and the
corresponding clock names.

Best regards,
Jia Wang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
