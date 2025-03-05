Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACBBC19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 04:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFroXYN5DKWv6j6onTQy2UdXjzoPB4PJhwRMib9qbrI=; b=zVguCkuHBUZgAs
	FnPrcZZSfsspQalR/AVCnaczagVDhMQZs+HmTOjf/af/WrUUVW5YqsA72jdGjWbmWDLCj88Hp1/2Z
	7BXVbVKitue2d9vwab6iNRTFJ9MJCk81ocRyP7GEiXGmmfzrqbBjDs97nGX6W/0B7SjUU452Yk19G
	l1khC3X93yZIPpdEhrW7lYVEkXnHeaOVtkiRjKfFp+sLyduq9V2A4vIHfthUDQ2Js2kGJgCuNMEyQ
	v8snJ6rZP6KT0TjFLcwpr4UWdI6S//i4vpGbWbEQzZ4QKE6IwAKjfpAHGHkqMz30I4ISNYHirFnWG
	eoNdnekwTwwlGQtYYE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpgcN-00000006yeO-032t;
	Wed, 05 Mar 2025 04:44:27 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpgcK-00000006ydx-1yf0
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 04:44:25 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7be49f6b331so621161785a.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 20:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741149863; x=1741754663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hhrXpKwS144c42p98nTp/KcoHaTZ8dOPbT6iHsDq2Ao=;
        b=Rq0Q8QKvZZ+ANSi6lnXXhex4+HM0SdvkkqyPRmhtE4a0ZXnd64uEGUTuJdqzFdSjdR
         ncNbwl8HRwU+FxD98uR7gogFrcCewCw5ZpZAXKoX1eYrfYdeqqE0uaT5/aom7ifB8j5v
         ymVfrtES+GU28Xi81ljHVEwP4LtW/MVwaPq46lDzaQX3I58J+fk/K6/5hnH6aGEGfP+d
         30H6iXiazXEv4zg8OnaXaxaTONTJCOR4A7+bdBo8g6V2OiIcXTI4mig6c7cVvwh7azHa
         ZOoSotuXM3sv3s0H7wNPIkhLJMDAMHcwUYzFsUe+wMJz4oC2DOpEWSBONW8TO7ek+05X
         FJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741149863; x=1741754663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhrXpKwS144c42p98nTp/KcoHaTZ8dOPbT6iHsDq2Ao=;
        b=wKxhyAEJF4zgnD/XnVmpMhyMe1pA7PSQYdVsi0GUKuVfyt/oxZINx7XYgXY+6u3xJi
         fBVEGWtdY/0Gq/b2QZu3cRN47ICyWxNvXAV1ECiLxR9puTC5II34nuGP1/Rj2OF6Nc0u
         Yb0cwUTL2+Ih60AcPq2uOXF0fSmAcz66DgJS56urr/bKA7wp4aRP9cIWsJfXkqYNks/C
         CSAVyZTvsc8bETaV8J4u+c+fZ8Qtx2/leMKm7l0F55dnKSl0j+4k6Ytqqh9NcbM7Hpdi
         kg9sJcLqyqVqj2+RStjyvbVVrLI8yZMwGaGmNcVPxrpJzw4WR0sR8WGqNxaQqbFDw7w5
         XzbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7+wqSVDqU1+KmOTOpEa2cr2evn68z8HvMILmMKxH8hABUVlFC2q/9wc/fOsjzochzomvkQbnlg1Yjsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI1VwYlLMUAX5HNdvMG6X60tEbs58uz5TYnx0j62cklPgzsC5k
	pdIxwOw7zl+/ASK3VApQCGpp9RDKbNRyL06simCocIPjIEKg9xN+
X-Gm-Gg: ASbGncuOAdeLRkyuNnL+whhX4jY/IFLxHDH6unptVc2QVYvwWQ0zkKyxT16kUxcg6Yw
	8NDG3n8y7XmucwE+40qBDimsC/OrtZZ4kMDPMLe+BjzmemiBuB+QBZY3uKmF/gDU6GiIN4Tt8Qn
	HqzVMFhhN+7vT+kIhaLpIReMhSb+xs1zHouCqqtCUX/SqRj2hOasRzPBLzZ/joVFkbU6SDT6+9y
	pzzw0w3FJnARwnSDPfD9wohoAwbf3XQ+e5Eeb9UOhGImvlh+GOwljIHd6no70e0Or1tT63QYTKK
	IFIz5zqxZXLW04g9mIZf
X-Google-Smtp-Source: AGHT+IH+vwPw5d9BtFzBzxswU9NO4u9DM/L9MRuhwAnolL31OGQxHT7JUwcb3wef6b2uE612tHPZkQ==
X-Received: by 2002:a05:620a:688f:b0:7c0:abe0:ce64 with SMTP id af79cd13be357-7c3d8e46593mr335671185a.9.1741149862764;
        Tue, 04 Mar 2025 20:44:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3be1f0c05sm354577285a.102.2025.03.04.20.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 20:44:21 -0800 (PST)
Date: Wed, 5 Mar 2025 12:43:54 +0800
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
Message-ID: <ktnqf4s4hw2o6x6ir4n5hsrvbxri5cxgjyofrl76by6fwazda3@4ejw2k7k2ush>
References: <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
 <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
 <20250225-lapel-unhappy-9e7978e270e4@spud>
 <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>
 <pbj22qvat76t74nppabekvyncc4ptt6wede4q6wfygbrzcj3ag@ruvt26eqiybu>
 <je4falvfemkemlvdfzdmgc7jx2gz6grpbmo6hwtpedjm7xi2gk@jr4frv3tn3l5>
 <20250303-aground-snitch-40d6dfe95238@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250303-aground-snitch-40d6dfe95238@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_204424_515166_0505E680 
X-CRM114-Status: GOOD (  43.92  )
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

On Mon, Mar 03, 2025 at 05:04:28PM +0000, Conor Dooley wrote:
> On Fri, Feb 28, 2025 at 05:20:28PM +0800, Inochi Amaoto wrote:
> > On Fri, Feb 28, 2025 at 04:46:22PM +0800, Inochi Amaoto wrote:
> > > On Fri, Feb 28, 2025 at 02:34:00PM +0800, Inochi Amaoto wrote:
> > > > On Tue, Feb 25, 2025 at 11:35:23PM +0000, Conor Dooley wrote:
> > > > > On Tue, Feb 25, 2025 at 07:48:59AM +0800, Inochi Amaoto wrote:
> > > > > > On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> > > > > > > On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > > > > > > > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > > > > > > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > > > > > > > The pcie controller on the SG2044 is designware based with
> > > > > > > > > > custom app registers.
> > > > > > > > > > 
> > > > > > > > > > Add binding document for SG2044 PCIe host controller.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > > > > > ---
> > > > > > > > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> > > > > > > > > >  1 file changed, 125 insertions(+)
> > > > > > > > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > > > 
> > > > > > > > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 000000000000..040dabe905e0
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > > > @@ -0,0 +1,125 @@
> > > > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > > > +%YAML 1.2
> > > > > > > > > > +---
> > > > > > > > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > > > +
> > > > > > > > > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > > > > > > > > +
> > > > > > > > > > +maintainers:
> > > > > > > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > > > > > > +
> > > > > > > > > > +description: |+
> > > > > > > > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > > > > > > > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > > > > > > > +  snps,dw-pcie.yaml.
> > > > > > > > > > +
> > > > > > > > > > +allOf:
> > > > > > > > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > > > > > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > > > > > > > +
> > > > > > > > > > +properties:
> > > > > > > > > > +  compatible:
> > > > > > > > > > +    const: sophgo,sg2044-pcie
> > > > > > > > > > +
> > > > > > > > > > +  reg:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - description: Data Bus Interface (DBI) registers
> > > > > > > > > > +      - description: iATU registers
> > > > > > > > > > +      - description: Config registers
> > > > > > > > > > +      - description: Sophgo designed configuration registers
> > > > > > > > > > +
> > > > > > > > > > +  reg-names:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - const: dbi
> > > > > > > > > > +      - const: atu
> > > > > > > > > > +      - const: config
> > > > > > > > > > +      - const: app
> > > > > > > > > > +
> > > > > > > > > > +  clocks:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - description: core clk
> > > > > > > > > > +
> > > > > > > > > > +  clock-names:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - const: core
> > > > > > > > > > +
> > > > > > > > > > +  dma-coherent: true
> > > > > > > > > 
> > > > > > > > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > > > > > > > > used to indicate systems/devices that are not.
> > > > > > > > 
> > > > > > > > The PCIe is dma coherent, but the SoC itself is marked as
> > > > > > > > dma-noncoherent.
> > > > > > > 
> > > > > > > By "the SoC itself", do you mean that the bus that this device is on is
> > > > > > > marked as dma-noncoherent? 
> > > > > > 
> > > > > > Yeah, I was told only PCIe device on SG2044 is dma coherent.
> > > > > > The others are not.
> > > > > > 
> > > > > > > IMO, that should not be done if there are devices on it that are coherent.
> > > > > > > 
> > > > > > 
> > > > > > It is OK for me. But I wonder how to handle the non coherent device
> > > > > > in DT? Just Mark the bus coherent and mark all devices except the
> > > > > > PCIe device non coherent?
> > > > > 
> > > > > Don't mark the bus anything (default is coherent) and mark the devices.
> > > > 
> > > > I think this is OK for me.
> > > > 
> > > 
> > > In technical, I wonder a better way to "handle dma-noncoherent".
> > > In the binding check, all devices with this property complains 
> > > 
> > > "Unevaluated properties are not allowed ('dma-noncoherent' was unexpected)"
> > > 
> > 
> > > It is a pain as at least 10 devices' binding need to be modified.
> > > So I wonder whether there is a way to simplify this.
> > > 
> > 
> > Ignore this, I misunderstood the dma device. it seems like 
> > only dmac and eth needs it.
> 
> Nah, not gonna ignore it ;) You do make a valid point about it being
> painful, but given you mention a different master for the pci device,
> having two different soc@<foo> nodes sounds like it might make sense.
> One marked dma-noncoherent w/ the existing devices and one that is
> unmarked (since that's default) to represent the master than pci is on?

Hi, Conor,

After some testing. It has some new problems. As the pcie
register area and ranges mapping are not isolated. It is a
disaster to figure the right mapping. If writing this with
soc ranges, the thing may look like the following:

/* this is for pcie */
soc@6c00000000 {
		 /* pcie ip register area */
	ranges = <0x6c 0x00000000 0x6c 0x00000000 0x0  0xc0000000>,
		 /* pcie vendor registes area and other mapping */
		 <0x40 0x00000000 0x40 0x00000000 0x28 0x00000000>,
		 /* for 32 bit memory */
		 <0x0  0x00000000 0x0  0x00000000 0x0  0x70000000>;
};

/* this is for others */
soc@6800000000 {
		 /* clint and some peripherals */
	ranges = <0x68 0x00000000 0x68 0x00000000 0x4  0x0000000>,
		 /* other peripherals */
		 <0x6d 0x00000000 0x6d 0x00000000 0x13 0x00000040>,
		 /* this one is for the external msi controller */
		 <0x0  0x7ee00000 0x0  0x7ee00000 0x0  0x00000040>;
	dma-noncoherent;
};

It is complete a mess. I think it is more clear to just make the
dmac and eth device as noncoherent, and use one soc bus for all.
Do you have any suggestions on it?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
