Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E7DD15D87
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 12:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogqHsMSdw45Df51LZjy0fENEVEASwp73MvZfDFUVYLw=; b=oYIDIAmZF3NN+a
	GkmQ9Yx3OHwUTHkkhehpMGSeIMcZ1oL307+eHDxV5Oj7VZ/KT+M3MUEIeOrafauMCShydaJxD79hV
	9nrl73gXY/QXURV0r/SKv7PRs0Yr3U4g5HFtq1cONsqqb3GC2X1tusqMRDPBlApTHa39tPPeep70F
	BwHjzhBaMyyBb/fwDXfdxbxOaDfWKgQAiE9x1ygoOCD5oXOKLXluPm6DfT2xTmlTCRGCAhyfrCazq
	AFSvHcvI3DuUSb2LcuAaH01yiD2j54EGOWZsqUUpT9zSroC6CCLOWuIcczSdBoI2D6bPn2/jNj4jT
	FBvbJeZVORombiznB8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rWG-00000007FAm-3j3i;
	Mon, 21 Oct 2024 12:28:20 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rNW-00000007CnV-3tfC
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 12:19:21 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e52582d0bso3369777b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 05:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729513158; x=1730117958; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GzXAN/kGFLyZ6KoxQYaMyN8WIW7O/chKPrM0YUwT+2Y=;
        b=QW7qz79ANsaua5s4HHpYbR8TzFmKSoIwitkPmLW1j2kMbBxZxGxK1wy5nLTZkNgasK
         BsYeSwcGA9MRfJ8wELFK5fYEPHZQls1FN+NFRcgrypUmu+X9CFjuXfjweYWzU1NJPA6O
         zgz93yOZCU3mvAQTgvo+7vzzB6yQ46UzbUjdGTky9Byw02Y4JXJb0dCwNhn68k6ho5wq
         Gfa+FpmeEAtIPL4K728+bEwlILvVlAOzkGOO0/hfpRbng7f99KNixR2BL1sJY296b8Qw
         m/sek9wRVF2bcjWHK8t5Cjgavhtio2+qJMOwqORvwla7ViVbhI8R0iduLmPtNk7jxGg+
         kVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513158; x=1730117958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzXAN/kGFLyZ6KoxQYaMyN8WIW7O/chKPrM0YUwT+2Y=;
        b=qewaq0yfxcs75yb/srRGI5pZtzKw5KcGg2IqFmb056JaKCJB+rzj6Ne3aAzFWBXvFY
         grBIRWVbqSLPxOxvi+5KAANpQkIbXdODjwoLzIoRmsQfdOBzNDWsQ8Ky5u/zZTR8CatA
         eU5MlRke0TJRhFBmfdNodN+oTyzcw+H4f9FEGah4j0FKeP/FYsyIn1R0AQFAvh8kW7xE
         HVuXJR9+YUC4PM65I/EdsyAYh4BIIXy9MPuPL2QvG9EjGPpM1a1veKgncr6h2rdIL4me
         BRzc0poahwSQjDoUWKp9GwsuSJi06Utw5fItmy3F3gr77FBEWKTqjmeLTZA2T+FruU20
         fkNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtBUW87wJHs5RVmehlcMj4FKagi0jVNhhjuEr3Zb4AqDqdY/Qk+V9WcGp+BCb4CPTUn+EHEM6Cw2mtgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy07kqPZ7s8XFZHxGGqfbuBK89+VXlc/LYuebR++Hep9+hdd2z9
	/ofz5EUz7/S0NBh5Uy/Z5Nf7SO7X2SLZLL9V+Ly925OU28rT0egOSzi9pQ==
X-Google-Smtp-Source: AGHT+IG3E9DRACYh7UWi0DZZrBl+qKyuSDA06T/8MVTylVvYqdgNfbdh8aJBhwejFWfecdHUmg2QQQ==
X-Received: by 2002:a05:6a00:98d:b0:71e:1201:636a with SMTP id d2e1a72fcca58-71ea31a5886mr15484512b3a.1.1729513157747;
        Mon, 21 Oct 2024 05:19:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeabdb75esm2907976a12.89.2024.10.21.05.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:19:17 -0700 (PDT)
Date: Mon, 21 Oct 2024 20:18:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@outlook.com>, 
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: snps-dw-apb-uart: Add Sophgo
 SG2044 uarts
Message-ID: <r5ngs2j776jcy6sfirwzmtsoljotatfvgmlmv4sj4xksye2bff@xtn7adafbpfz>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-2-inochiama@gmail.com>
 <20241021-outlying-washday-8f171dedc703@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021-outlying-washday-8f171dedc703@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_051919_257634_8BEC29C8 
X-CRM114-Status: GOOD (  18.03  )
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

On Mon, Oct 21, 2024 at 01:10:52PM +0100, Conor Dooley wrote:
> On Mon, Oct 21, 2024 at 03:26:05PM +0800, Inochi Amaoto wrote:
> > The UART of SG2044 is modified version of the standard Synopsys
> > DesignWare UART. The UART on SG2044 relys on the internal divisor
> > and can not set right clock rate for the common bitrates.
> > 
> > Add compatibles string for the Sophgo SG2044 uarts.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > index 4cdb0dcaccf3..6963f89a1848 100644
> > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > @@ -58,6 +58,10 @@ properties:
> >                - brcm,bcm11351-dw-apb-uart
> >                - brcm,bcm21664-dw-apb-uart
> >            - const: snps,dw-apb-uart
> > +      - items:
> > +          - enum:
> > +              - sophgo,sg2044-uart
> > +          - const: snps,dw-apb-uart
> 
> Why does each vendor have an items entry of its own? Seems like needless
> clutter of the file IMO, except for the renesas bit.
> 
> 
> Cheers,
> Conor.


I just follow others when writing this binding. I think it may need
another patch to fix this problem, right?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
