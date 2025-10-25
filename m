Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B771CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 02:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVm0jRDlRfdPzKrGWnOJ1+fJ8H2Q165gtsec1JTuTaY=; b=MV3GKmRoGyYikV
	miraL2HcgcNOspsn8ZhmL7O+ZMmPbBN4ONo19GLOmbAkorbrYEHzuFPj5fgovKOdPCCC8fH8wowrH
	gG23hDjh6HNdCbBqmzX1PuFOG2KZml1gq53LHoshhE3YqONI1nf33evm8UcTEQnZhaof2AOn4dutU
	/kt/g7SCNkESb6N1k+rIAfROYYuYT8K5xDt79v5EEjo3xhMuUy3xtZqPdcW0I+VNHih9avuW/tOkR
	XZt210uRsZ5+tT7undfVjV1oslY+5t3JMEpxGjLHZiGsP9tKV0yB3AKsznTZdvfwGEQQpgTv6HLb/
	H/tc6y/e7Dt8sbDbWeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCU00-0000000Aq1Z-14l9;
	Sat, 25 Oct 2025 02:27:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTzx-0000000Aq1C-1KzJ
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 02:27:18 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-290dc63fabbso26492575ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 19:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761359236; x=1761964036; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m5g8OWVuVjsbahwY/Qa7JcyvpPlQfkEr7235nxaCt5s=;
        b=mWAl1raNsD9b2TquzfDChR/WRW6tndzk7htXZJGpK9fu8Zml/Ze3bfKDHaX7hHWU2b
         9BFhsOhHUk4rpQUQE2pmLe/uEA7SbTXyY3fGcGY4I+Bbh8h9YqeEiwoXN0IKxbzPagGT
         fr7JKgUHPaBdMVXWZSpgduMD1crdrn10vEYmpxfzsJR3llxeQwWmi1gTGOk1p8HcMvvX
         8PEOiq4UMJoJeqvVJ5lUUqwcj0fqk8mGv7GtHDLSArjjCtNk2zCduUpCXmc+rEG3bHiH
         XhXqS7wCR2dZMYmPMt4HNkjp5nPAk3bLSAxGlktTTMmti5tQWaxRZETGn27wgtYBhYHx
         0ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761359236; x=1761964036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5g8OWVuVjsbahwY/Qa7JcyvpPlQfkEr7235nxaCt5s=;
        b=UQe0g6fE399l9bGScjr6rz/+RaT4wA9vX/IZRsPa9wQkURBOwQgrEZSQtcHDZyUrON
         vL1CiMaydRx+7Hugs4qMfC6fzRy+sVikUD19eoqqRNtZRH1den5R2bLzzEmldf+akWx2
         IX8Wi8tXoJ1hgNvlik+46McPUIP6E9YALi9ZQj+x6z+84uVvRfGbVBD6lMpqDkB8q2mV
         x8LCb47TRQShFqYmAtSWuB1jJn7/4h0rGMQ9repth80TkHE+7duu3u2Oe+5t9yVbRDMq
         rORJMBAY5Othv+xUkaQ8lU1/SHV8a0oKzNFwJgYcCSHkESm0TkU8dT8jmDPIRDsksWLz
         NUVA==
X-Forwarded-Encrypted: i=1; AJvYcCVtSzRjOQrLkqMJq/asYAPcliEIqMKsevx6oKX6+OGuklM1YU8LbqDOu+p0AR0LDFbgCYZAFvjsHDqoTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGMjmcMSGh3I56DYrj9S1tetb+4MgZxQX9G+VYpMknVJLLzKvs
	W6HSw8VG4oJPYA5EkXUtdXKikSiXVXIO5ew90o26g/jR276DmaVaZ5cc
X-Gm-Gg: ASbGncv6KOiZ80EJm9IFG3VHgpqBcyTm3ilGjFJl2lXUsGaQZX0aozicLfESsaCu8Wf
	16+lJadfl02AVSg6UIuWs/8rqA/Z/fmjMSChrlT5g6QaazQB0s2oA5/xafq1cKJfEZXd0dQzM1M
	cAeg1ZGBLi2WqsAPkB6DZnp5f9A0MBrwpGfRSYJlFqbkdav0ZgC26AL22Qg3LPUQw6HrPL2dt5Y
	JvWEVJdJt0+8jDSxl4ielNAmIl26aEzOASjFv5rDc9Suj7QYdT2TfxK6zpF082VQYiXhu9A56/7
	4rQIi0sOFZTe8hmslNzHsupSMAN7q6r/VreLAn1fqqdr6qzTWvPyE1aDvOu0euQT/4Vwwh79QMc
	hMgRsAUs1c/XKtSR02y2bXZ4xj3ORoaPwA9izN5WwW2qeMsVUNNUz3zcjXGJkx3z2NsjnBhbtvx
	Ngh1O7n45pE5oxTweu7aA0PA==
X-Google-Smtp-Source: AGHT+IFfj8dcaPyoJUnBwrQrbEjc0tKnxl0fbsVgVFk4QvGgEAOydtQrbEdriDic6wnAsYVeECy3eg==
X-Received: by 2002:a17:903:1c2:b0:270:ced4:911a with SMTP id d9443c01a7336-2946de4071amr99308125ad.9.1761359236031;
        Fri, 24 Oct 2025 19:27:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d23334sm6685145ad.52.2025.10.24.19.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 19:27:15 -0700 (PDT)
Date: Sat, 25 Oct 2025 10:27:13 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <oymxspgopaqja63nipufgzn6kpobkdopemfaw3azhom3ikvk5f@e7cg4lq64j2o>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
 <20251024-hangout-designing-33e96c0d35fc@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251024-hangout-designing-33e96c0d35fc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_192717_380631_004B1A27 
X-CRM114-Status: GOOD (  13.08  )
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

On Fri, Oct 24, 2025 at 05:46:03PM +0100, Conor Dooley wrote:

> > ...
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: sophgo,cv1800b-top-syscon
> > +          - const: syscon
> > +          - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges: true
> 
> Do you actually use ranges?
> 
> > +patternProperties:
> > +  "dma-router@[0-9a-f]+$":
> 
> Do these actually appear at variable addresses, or is it always 48 for
> the phy and 53 for the dma router?
> 
> > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > +    unevaluatedProperties: false
> > +
> > +  "phy@[0-9a-f]+$":
> > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/sophgo,cv1800.h>
> > +
> > +    syscon@3000000 {
> > +      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
> > +      reg = <0x03000000 0x1000>;
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +
> > +      usbphy: phy@48 {
> 
> Drop the labels off of these two, since they're unused in the example.
> 

Hi,

Thanks for the review.

There are a couple of different opinions here.
Could you please help confirm which approach is preferred here?

This is Rob's reply:
https://lore.kernel.org/all/20251015134144.GA3265377-robh@kernel.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
