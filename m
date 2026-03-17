Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190D5FB5E8B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 01:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vt+InJGyQpFdbdP09fL6IE77eyDYZcGT8uvkY11E7Y=; b=Cy/Flxjna09EWu
	+0280Bhw9Jn0QmScoBiIdtQbQcsGbBQAEAcvSc5lKtoSIgPozEkl2/9UPu7lJjvukDijVo7mErfpE
	8ZEaf4FJimOvG5kz+36GkW8VxMhLhzCE1eqtq1oBQRMw829uZFURoFVTEk2MvbfE/O7oetlkS4coz
	rzL6zVl3A4RkbhQ4kfxplcf87OoFJXa6nvGE9VRcd7zTBJuv0qUt/8PzUOYj5taPMj6iCuCGlDROI
	DAj7S/4nuakETbRRkyQ2JSdu0vD/TPu0cB+Uz7V58wDPywbevda1LkbXmhYY/AQbTdzqeZRhS5wmD
	imhnXLuUOwezWfbkzFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JGn-00000005BEe-2sFy;
	Tue, 17 Mar 2026 01:30:53 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JGj-00000005BDs-2Vsw
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 01:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=C3kzEWGbF8zcXaAqRnTvZ6Jw1TmEMdzDk
	NOhUQx91ww=; b=RFVLL7JhItiW/2XEKn2IfItmk7e2OBfZf69X8y1tmwGrN6MVt
	DbCvOyADzKgt7safJFfBPP0naop/o2uHYZEP5DzhE5XFWV24AZdKrnXmDHuMpYXx
	QGGFw1VBhnrGAKvsfJOcHDNYNNnB0ZIav6wblb19VQkvV2FoSRriClqf8U=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHJSWjrrhpST8BAA--.1098S2;
	Tue, 17 Mar 2026 09:30:12 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: update bindings of
 ultrarisc dp1000 uart
From: Jia Wang <wangjia@ultrarisc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, Yao Zi <me@ziyao.cc>
In-Reply-To: <20260316-uptight-dachshund-of-grandeur-fbee0f@quoll>
References: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
 <20260316-ultrarisc-serial-v2-1-6ab3e7fa891c@ultrarisc.com>
 <20260316-uptight-dachshund-of-grandeur-fbee0f@quoll>
Date: Tue, 17 Mar 2026 09:29:22 +0800
Message-Id: <177371096243.4115496.3239364895397658958@leopard>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773710962; l=1633;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=A5V0Dm39IqP9u7IUpF64s3zqCD6K8ODnufmhpO55WNw=;
 b=GVn+NAcMKDbQYbXOWhH5FLM4KTY/rP8XH5F52H5FosX0SzBB86XEkfRLmx8caJ5n0MVqgWSsM
 ycXqyY/R620B54gmsMoNT6R9XWe4e2bLOjV8ln7WW5eg3FacXn6buik
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDHJSWjrrhpST8BAA--.1098S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF48trW5GFyUCF4UKF45KFg_yoW8Xw13pF
	WUCFWvyFyfXFyag3s2q3W7AF1kZF48JrW7WF4jqr17tFs8G3ZaqrsxKr15Xa4Dur18WFW8
	CF4Yg3W5ta10v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAJEWm3nYkALgAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_183050_314582_51DE7C35 
X-CRM114-Status: GOOD (  19.24  )
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

On 2026-03-16 09:11 +0100, Krzysztof Kozlowski wrote:
> On Mon, Mar 16, 2026 at 02:33:22PM +0800, Jia Wang wrote:
> > Add DP1000 UART compatible information
> 
> We see this from the diff. Why this is not compatible with
> snps,dw-apb-uart? What are the differences. You have entire commit msg
> to explain the hardware.
>
The UART controller in DP1000 is based on the Synopsys
DesignWare APB UART IP, but the hardware does not support
automatic FIFO size detection used by the generic driver.

I will update the commit message to clarify this. 
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > Reviewed-by: Yao Zi <me@ziyao.cc>
> > ---
> >  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > index 6efe43089a74..0040ed28e35b 100644
> > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > @@ -78,6 +78,8 @@ properties:
> >                - starfive,jh7100-uart
> >                - starfive,jh7110-uart
> >            - const: snps,dw-apb-uart
> > +      - items:
> 
> Drop, not needed.
> 
> > +          - const: ultrarisc,dp1000-uart
> >        - const: snps,dw-apb-uart
> 
> So just enum with the snps one.
Understood. I will drop the items block and add
"ultrarisc,dp1000-uart" directly to the enum list in v3.

Best regards,
Jia
> 
> Best regards,
> Krzysztof
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
