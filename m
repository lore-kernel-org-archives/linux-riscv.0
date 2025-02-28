Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0C4C19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 08:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOKHgUNqPEr6SZLmacnATCCOmnI1Xkc9te11NCXgE2Y=; b=Oy+XlCwEusz6bp
	hX7zRlRmx7khSoCic7xtBRp2KMFkyAQ4pJH5nwzaW045SgEXPeF+PNM5edoLCyxrBVu4xHX7rZqyV
	Mq/kYTx4r9/Lz8HhSo6atF9DbS4mPqalSnf5JFfknAtdJosOqE/URGD4QGMQRJ0t/yNKmQTXooEs1
	AziHRgDf0j6/8ZQcEp6I3BUthzJk1NvIHmdYIuOdIIMp2jdfxPI1+2AMMARMIWLsEKDemea0Seoub
	6zy8PDzwSYrYEGBf7hp2tiJZDtxZLWd1Kw3NUJ8BMhm7622N24H9otl1wfn5zY5xZb5g6EtmShOfg
	773TNEcMptEvn1y6rdeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnw1B-0000000AEoB-1Hu7;
	Fri, 28 Feb 2025 08:46:49 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnw18-0000000AEnJ-3p2C
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 08:46:48 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-471f9d11176so19626011cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Feb 2025 00:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740732406; x=1741337206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LLmHR/SpSqY6N3h+Iw3NISXuCevyPVad+x0gw7x/vBw=;
        b=hZr0Bdz/8T4Im2BIxAlffk8hPgzV1dtAjpNiltMDwktFQFjvRGJWd1LnMKiC34DoWU
         GlfGIt8HRefrsbjjsKqTtyYr5+igbtHSt8LGgDVHq3E5GAFnqTh8l+ltYEqe/6A+E5zk
         M4JpSd+j5rgn+Z9FE+7DZJRPJXkeHN1pz+eoZoBuyi+v+t2b94QavR19EZpfe9kwTxMp
         1bn3Z7ZlqpiUG540K7WY0GxNUUgMlO9ZxbqgF7UmrkqomX5P4cxrq5szovarsq4g+3BP
         IlcVEoZE/9gTNDuNvrwIIHjKI9eYZBgKN/Tb9FGwVguciLwtfNsmJgz6fXxhv7weUNIJ
         zU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732406; x=1741337206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLmHR/SpSqY6N3h+Iw3NISXuCevyPVad+x0gw7x/vBw=;
        b=OFHbcGlg2R3qvpz9WWc0r7h/WM05qMj1ix1nfCyb0ky7C7WsQ7TSqetNLiLTErWuEu
         J6AOLEfL+eGzl56GO3zvwRpNSrWrG44nlRsYK5pg8Vw5DclqUvk8fbWTzv64Y2HafRxa
         uIChv2Vh6XhMUM7Tyt4jRJY6xXOdlF04x30S2HT2ABqbop9ezpc5ttyrFhVa1Xj8GyYF
         srkXrIlU4CDsGfNfZ8WbocodXRGQjil/vPIgniV3oRzYZIvSc03O5iH+BfnnIA3fmy65
         Jzh/QAzFQCL769sADFVNTxwNEYLpPIZ0A02PRh/IquzIzO/b+vJoY6oTRKIjYEIDJRVf
         Pqfg==
X-Forwarded-Encrypted: i=1; AJvYcCWeq1pIkjMl8dHwAyBy4wsjpXBM1W+nI16GC+mj4Q7VFT1JMu1jmrngElGzO3w3h4CVrAVw4IhzIVYnkw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw13tpBIcFXZG1DK+7Z0SRGQDWn3PYtH6R1/cHbuWhCS+wFV3EB
	20CKM85kxm+/Zj+Jbhd0zzKIUX7RfU+AmOxbW+7eC2q124RmxPx8
X-Gm-Gg: ASbGnct8rWgt5kVeJQfWTX+zgfn+j0BQI6ZXAG2HuEvnBKja5HbSYRWkrU35N323UJ5
	cjwfgNUUJDMHkCcfL1NATy90lWkbRfzZZxWj5THXNm39u1vS2XtGZM6qI61pvtI3qVqqoBzU+Lp
	k/mJAlwBPQoaaa1fxDl91CfJsOrl/bKQfe7qTc+zmTaj8Bc7Tpt3EhAHRVQQoJ8wXPDf5BGuJVp
	GlNkJ/45YzCbjDUAOZl/rF0oWI/VChbLEwNj/kBCjs5qk7gNC2NS2uUBw7UEP22J+Ui+QZZ0aQR
	+Q==
X-Google-Smtp-Source: AGHT+IGlyCXuariPZPwL7PuD8T0egLT46qA1ZdYfUWGVbxZHrud8Fu7VDXUjdtaUdRLOr7L0vfkfvA==
X-Received: by 2002:a05:622a:198a:b0:472:1812:23d3 with SMTP id d75a77b69052e-474bc04ec55mr26784781cf.10.1740732405593;
        Fri, 28 Feb 2025 00:46:45 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47472409ab5sm22150091cf.63.2025.02.28.00.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:46:45 -0800 (PST)
Date: Fri, 28 Feb 2025 16:46:22 +0800
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
Message-ID: <pbj22qvat76t74nppabekvyncc4ptt6wede4q6wfygbrzcj3ag@ruvt26eqiybu>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
 <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
 <20250225-lapel-unhappy-9e7978e270e4@spud>
 <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_004646_949184_A0FEA7D3 
X-CRM114-Status: GOOD (  32.63  )
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

On Fri, Feb 28, 2025 at 02:34:00PM +0800, Inochi Amaoto wrote:
> On Tue, Feb 25, 2025 at 11:35:23PM +0000, Conor Dooley wrote:
> > On Tue, Feb 25, 2025 at 07:48:59AM +0800, Inochi Amaoto wrote:
> > > On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> > > > On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > > > > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > > > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > > > > The pcie controller on the SG2044 is designware based with
> > > > > > > custom app registers.
> > > > > > > 
> > > > > > > Add binding document for SG2044 PCIe host controller.
> > > > > > > 
> > > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > > ---
> > > > > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> > > > > > >  1 file changed, 125 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > 
> > > > > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..040dabe905e0
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > @@ -0,0 +1,125 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > > > +
> > > > > > > +description: |+
> > > > > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > > > > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > > > > +  snps,dw-pcie.yaml.
> > > > > > > +
> > > > > > > +allOf:
> > > > > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: sophgo,sg2044-pcie
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    items:
> > > > > > > +      - description: Data Bus Interface (DBI) registers
> > > > > > > +      - description: iATU registers
> > > > > > > +      - description: Config registers
> > > > > > > +      - description: Sophgo designed configuration registers
> > > > > > > +
> > > > > > > +  reg-names:
> > > > > > > +    items:
> > > > > > > +      - const: dbi
> > > > > > > +      - const: atu
> > > > > > > +      - const: config
> > > > > > > +      - const: app
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    items:
> > > > > > > +      - description: core clk
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    items:
> > > > > > > +      - const: core
> > > > > > > +
> > > > > > > +  dma-coherent: true
> > > > > > 
> > > > > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > > > > > used to indicate systems/devices that are not.
> > > > > 
> > > > > The PCIe is dma coherent, but the SoC itself is marked as
> > > > > dma-noncoherent.
> > > > 
> > > > By "the SoC itself", do you mean that the bus that this device is on is
> > > > marked as dma-noncoherent? 
> > > 
> > > Yeah, I was told only PCIe device on SG2044 is dma coherent.
> > > The others are not.
> > > 
> > > > IMO, that should not be done if there are devices on it that are coherent.
> > > > 
> > > 
> > > It is OK for me. But I wonder how to handle the non coherent device
> > > in DT? Just Mark the bus coherent and mark all devices except the
> > > PCIe device non coherent?
> > 
> > Don't mark the bus anything (default is coherent) and mark the devices.
> 
> I think this is OK for me.
> 

In technical, I wonder a better way to "handle dma-noncoherent".
In the binding check, all devices with this property complains 

"Unevaluated properties are not allowed ('dma-noncoherent' was unexpected)"

It is a pain as at least 10 devices' binding need to be modified.
So I wonder whether there is a way to simplify this.

Regars,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
