Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE04C021B5
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 00:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=que9bF0QGj3WibKSZuChfxZ9vcranh59oGHccVuBvKM=; b=aftF1DUedpNlVb
	rxmd7+H7DExW2vjCZAEsqo2vKlyjFDH3+fX5S11B43ICLAQmWc5yW/dsmkKLzSP18TLp/84ylPk5L
	6Ek2P5eTYhm9tfvdSmYdNLMmnmRKL4SeHTxEISd5HqwxA7UzTtMTf4I3Ijg/xAiWs6mYXi9x/+yyw
	NypNu5H7yV/5wEgMuJrG3Dw4sTSRjtT9o4QUjGEsEpH16CvqYYZe2w4z9Y1Q8aESch/YanYGArg3F
	MAXGalritT8Mdr86pSuSVGTgx80IC/W4BtJdy6en87N1LRdRwY8B+VTtUPjU3v0o+dhDMVJ+HlLH5
	ixJ03VwNUesDPz6Jw8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tldTT-00000007E8g-1nWd;
	Sat, 22 Feb 2025 00:34:31 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tldTR-00000007E7k-2XSe
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 00:34:30 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7c09d7bb33bso216359285a.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 16:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740184468; x=1740789268; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wStl+6IKZhys/kjLjbrppMxAjOWicsS14gQYbb4jIcI=;
        b=nSmF+QS/pTnAS8mkcCXrCEWfygMriJdZwo+GE2ebEeUUz/oySatPpPNM1naKLvldw8
         SgO06700hYXySbsqkDnupoIRdZzbHRxHw6Fxg7WoZGNi0Cax31ROagELB5RSIcojiVUq
         Z3+UtgU+OTcbR/rHxscjxT2eOCFCL1+Fnk18ABRe7Nyy33nKmKtbGr5gM4PevmX2Odx2
         XJEBP+qIraYbNfJjaWtIDTDekOjecFa/3CYO0VR9p5LX/li8qhmuoG85tBmp14JFrrKF
         iK3DC6CMOf+ZC3KXfbdctt40BjPa41p/LMYdIM9lVWDsVIoHE7e+cYX4lq5lY2vgpB43
         ZpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740184468; x=1740789268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wStl+6IKZhys/kjLjbrppMxAjOWicsS14gQYbb4jIcI=;
        b=GkFevhZjWn7sDmJ3m8GXmfe4GYOTr9AwDagEilbAN47P/FJNlLnQBTPKvDiSYjIsA4
         iBXWc+YrAYe8GTnfGpiGiaCk8unGEPdvJNZjE0mdqKwNeaUI9nKyqTz6dd/sdYVZDoF9
         2EK2V48s1gEU1/07Zr9Gnp5OtMnaSYdIiWYqU+83kHgioIY2rBjkc8+XEo8uw+A39haF
         +EAMhLDXJsv96hG6SLH0qV+yoX1Ynzb1sI2L7DRg8yC7p348EJIGz4NXsDFp5ODKtbM8
         oik+h6cCWslECzAeiqZcGXGRB/AP065yGsoveWK/KC5hIPk8wesfla9SunrxElJkhDaz
         ow7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGL0cYytsK4ZBd/pZwIqpMBqCPbcSILxWIifXweA7qQZAxyjwPiZJYAE75K2ZEyb12/3RvoUj6urGWYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNGmQirOY+/5TUpQ60suuUR530b3WgH2l3ADdOvgoWtT+TXpCy
	3BfmJEx5h20CZFvUuSQAfCv4DaAHn3gfJI7xZETlhlZ+2MZB4Hdk
X-Gm-Gg: ASbGncu18Wv6HSyVStj7dJy/ximJ3LlnWbLhIrZH1jl7YdBPTXJlifQ4l8eMS09+c75
	RGlsy4hGN8oqDed1UA9LmxvQHMs+fvsj87SdAofOod9Ojff6NU04UQmPcC+/fqAT61oNoDQPTpC
	pZG1+JF0NZ2YyOPPpXvVGud3Hlw0IImdYU6uPs2zyHuEr+SESokH5aOqMGffQBhWCUKzPP591pe
	bZWp/PYam7Y7o2bs3GmCVx5009GgzkCF5HSkhHed6AVzg7V7SDwEs3aozHxcfKasigbf+0Rtcvh
	Vw==
X-Google-Smtp-Source: AGHT+IFHrDz0qc8zD5XdcpfmhF3hdDGMdxF6JouYGWlJZR7lIXsOACUUisCSrhGBpwJguI83XxPhyw==
X-Received: by 2002:a05:620a:1910:b0:7c0:ad3e:84a7 with SMTP id af79cd13be357-7c0cef1255amr657209885a.26.1740184467296;
        Fri, 21 Feb 2025 16:34:27 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c09619fbfesm721817485a.18.2025.02.21.16.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 16:34:26 -0800 (PST)
Date: Sat, 22 Feb 2025 08:34:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Niklas Cassel <cassel@kernel.org>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Message-ID: <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221-cavalier-cramp-6235d4348013@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_163429_640988_F5F6299F 
X-CRM114-Status: GOOD (  19.22  )
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

On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > The pcie controller on the SG2044 is designware based with
> > custom app registers.
> > 
> > Add binding document for SG2044 PCIe host controller.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > new file mode 100644
> > index 000000000000..040dabe905e0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +description: |+
> > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > +  PCIe IP and thus inherits all the common properties defined in
> > +  snps,dw-pcie.yaml.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: sophgo,sg2044-pcie
> > +
> > +  reg:
> > +    items:
> > +      - description: Data Bus Interface (DBI) registers
> > +      - description: iATU registers
> > +      - description: Config registers
> > +      - description: Sophgo designed configuration registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dbi
> > +      - const: atu
> > +      - const: config
> > +      - const: app
> > +
> > +  clocks:
> > +    items:
> > +      - description: core clk
> > +
> > +  clock-names:
> > +    items:
> > +      - const: core
> > +
> > +  dma-coherent: true
> 
> Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> used to indicate systems/devices that are not.
> 
> Cheers,
> Conor.
> 

The PCIe is dma coherent, but the SoC itself is marked as
dma-noncoherent. So I add dma-coherent to the binding. I
wonder whether dma-coherent is necessary even in this case?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
