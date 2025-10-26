Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E689CCD193
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w941CGQvuk1hXQg1RH9q7H5HO10JD9fTcX3mqvhOu5Q=; b=uCMjUASFYorNky
	BchXuUCgTfb1AIUf5Q1o43hiA/K159ydcXf9OqfQzxGRiVQ8xHvq5TJipz1MYY4pRL/aetw+QDM+U
	3gi1AMOKrAGOzUiFj3wBBqIEXzpKFgMlEww1L/G+6nZmBUlf7q/Os/87WYGfxL7cSBeqL3uFdQJA8
	hl0nGEwMc7BU33QHCp8aXThQ/O1gV8laNx/Tn8gGhVTe7aBkMBhSplMaWVmoNmBDS68KBqu20IcXt
	bE+KMG0M9Of45Ao7ec+dmukU30/aYTehIYRzlQNv/Bsf+Ndi6OMk/Wam0SsDSiVw2J2zPtNgudCB1
	vSgSGsTNBvcPUk3Bl2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCxLg-0000000CDt9-3sRS;
	Sun, 26 Oct 2025 09:47:40 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCxLd-0000000CDsJ-42E5
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 09:47:39 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-33d463e79ddso4516264a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 26 Oct 2025 02:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761472057; x=1762076857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C91HvAQxwR7B1bhgRZq1EXx7cSrqAYa22OF4JmCWXOg=;
        b=WG1C3dXSVXNGMSA0SUjY5xjPKJ1UF07KftoqfjdJ7Ps9U20SKseZ1P6NgMaLtqRI+P
         50gxjFY7lfn9FS0QPT3F1XDrz8s1KaFHqkPDZtPfSX8T4OqCcaUGY/XQH5/wElvb2BtB
         x3f74Hyho9fD3WAfI5QO7C5a5TQrVg8vHPuh4Sw3KjWxUdmhAEsiBV25QkRm9Ov/dMaI
         OaMNTMCVWsPAOUv2msmtoG0U5mLxOAGeLhWBTZutNpZgt1RqC1cqIbNpqoDkdpx7HNB/
         YY0vjxLJ/CImmKLGBiODZZ3c4NU8kOAFiyAy7o/ilqNWaB1kLyjY0vFXYdtHxdEVabvv
         lTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761472057; x=1762076857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C91HvAQxwR7B1bhgRZq1EXx7cSrqAYa22OF4JmCWXOg=;
        b=m1agGM+dUhTI1A1RS+iTca1xMKFBGoi73Dm/zDRq8F5+0qjArcG+0bItwxgPABhqcD
         ibOWMz5s+L5EeVbAmb4aQphRBemtTynAgq2x2HfluitCAv5fR4riq9CSRd8yVKF2F+2D
         6ZhMLuDkXeYTZfTNiA0J812tgZ9XohpL2ctAqyEEQWX/N28trF9qaUle5ZO/Vjenf63z
         mbCY351rCWYEe8D/UJF4iwUboOVZ5V7R6F14t6nrlxUyF9qbFMLRYT5aTTq1hjlJwR12
         DWE+JoAJ580W1KY8HjHpc7+ejBLwVYV/KDDsisFT4izfwTx57y6HF3ebSAKp13V6U13O
         Iipw==
X-Forwarded-Encrypted: i=1; AJvYcCWj9DPDoGC4DhWyRB6Wxp+6l8hBOEIKDQNOuNCLgEXOzb/MUPjJG+j6ie0dzFGywv0+Aibqii1HTxJyKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxHqliJdztECPt9TM94HFBKvScBllz6N7NBO4cKAoJQ+gxxIyl
	827FHO52Ts/Xsm/6Us28pK49fL30tE87R1JF4QCF8c95Uc/m2b/uCO7G
X-Gm-Gg: ASbGnctuTpqVUGA0OE0Su3iPNJYmBxEKfg4R4hF94mUHrPtQkYcEcVwoRk5WFhiJBF9
	qtE53/jCa5VIGY5SyfZkcewXH0K/0rgJZUJg1V0VVD0bN+p2GTtcdJ0KR47XCRizD0HTBeJef6S
	3FNobUSyAUKhokzJ+c8zk/jbgnl+N7QctOIdK871UtaYSDTna73IYmvKjiR+gIlVuylHdXgwSeE
	hhSrFYKLcHbmRbMZwHuXYFpC2iVe31c9G9WgJ4qZQd+FnYqLLsCnlF7YdpAXdBn3lu8hg0Mljve
	Aq7tjndoHEofB81EOHJ7BfBuBWRbmA2zuJiHXuiHo165AbVtrNNAFRdI2OrfWp6PUwrlKyCKPSg
	mV2WZ6Hz2hxoPVciYuDcOLz3Y4c0UFCEs4tP15AWxSU2WSpAdlRgBUIenF9WrHrIvwmDxmO5P0V
	8j
X-Google-Smtp-Source: AGHT+IGBtA0xQBuD4uogDvjIhQK7Qhr4z8CGsMy+ULWwP1OFvRuXkY87KrHlWUr9Efn6GjJx6fmMdw==
X-Received: by 2002:a17:90b:3e43:b0:32e:7270:9499 with SMTP id 98e67ed59e1d1-33bcec297c9mr40598008a91.0.1761472056734;
        Sun, 26 Oct 2025 02:47:36 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed807dbasm4802556a91.12.2025.10.26.02.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 02:47:36 -0700 (PDT)
Date: Sun, 26 Oct 2025 17:47:32 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <ugmphokne6ssc7ou7apvbldxg7xxk24wp5jrzdasjiplnu6gfy@ebbuxnjqlsw4>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
 <20251024-hangout-designing-33e96c0d35fc@spud>
 <oymxspgopaqja63nipufgzn6kpobkdopemfaw3azhom3ikvk5f@e7cg4lq64j2o>
 <20251025-shakable-jujitsu-3a5e9c8895a5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251025-shakable-jujitsu-3a5e9c8895a5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_024738_005797_DA0D97B4 
X-CRM114-Status: GOOD (  24.09  )
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

On Sat, Oct 25, 2025 at 01:44:00PM +0100, Conor Dooley wrote:
> On Sat, Oct 25, 2025 at 10:27:13AM +0800, Longbin Li wrote:
> > On Fri, Oct 24, 2025 at 05:46:03PM +0100, Conor Dooley wrote:
> > 
> > > > ...
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: sophgo,cv1800b-top-syscon
> > > > +          - const: syscon
> > > > +          - const: simple-mfd
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 1
> > > > +
> > > > +  ranges: true
> > > 
> > > Do you actually use ranges?
> > > 

Actually, I do not use it.
I added it following Rob's suggestion in
https://lore.kernel.org/all/20251015134144.GA3265377-robh@kernel.org/.
Should I drop it or not?

> > > > +patternProperties:
> > > > +  "dma-router@[0-9a-f]+$":
> > > 
> > > Do these actually appear at variable addresses, or is it always 48 for
> > > the phy and 53 for the dma router?
> > > 
> > > > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > > > +    unevaluatedProperties: false
> > > > +
> > > > +  "phy@[0-9a-f]+$":
> > > > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> > > > +    unevaluatedProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - "#address-cells"
> > > > +  - "#size-cells"
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/sophgo,cv1800.h>
> > > > +
> > > > +    syscon@3000000 {
> > > > +      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
> > > > +      reg = <0x03000000 0x1000>;
> > > > +      #address-cells = <1>;
> > > > +      #size-cells = <1>;
> > > > +
> > > > +      usbphy: phy@48 {
> > > 
> > > Drop the labels off of these two, since they're unused in the example.
> > > 
> > 
> > Hi,
> > 
> > Thanks for the review.
> > 
> > There are a couple of different opinions here.
> > Could you please help confirm which approach is preferred here?
> > 
> > This is Rob's reply:
> > https://lore.kernel.org/all/20251015134144.GA3265377-robh@kernel.org/
> 
> I don't think that Rob and I disgree about the example, having child
> nodes is good, having the label on them is what I don't want.
> 
> Re: the child node patterns, I was not looking for a return to what Rob
> didn't like, but rather a move to just making them normal properties
> rather than a pattern, if there's only one possible address.

Thanks!
I will drop the lable and move the child nodes to normal properties.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
