Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93440D15D89
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHq5QE08EUZV3M+ayeLlreZbfcQmhMOQdiuwu3RPYUU=; b=5GlOn3s/OJUTl3
	2LTg1+nDS4wdQINAfPQjMSAJYIY4gw9yex/i5qP/DGZ2jJK0xA3BiBM5NaXRbONzUUjjuPDHGPz/7
	29FvVJ0TvxK5oPdhepyHpBvS1chI8TVKDGmqVA+SWPpgoOuyUSlheIvRP1nzRIO2tn/OVatWVwGFI
	HjsblBFTFdkQ1jJlgFjeVgwscIjP0zU6Vi1j/9z9lElUj4hK5iHH9qAVAyr5h3QpJ5N3xN3Ip5oPt
	MnWnmH6jiuMMoN+wY9+8i/xlaTreeSkIHYhOVjXZbQmD4twxhwoefTzWaNr6XzjcTqHKJgx3c0DqA
	BwgO6c9vOs4tb0yLBdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rjj-00000007IMt-0naJ;
	Mon, 21 Oct 2024 12:42:15 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rRu-00000007E29-0CeA
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 12:23:51 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3e5fb8a4e53so1886358b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 05:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729513428; x=1730118228; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OgXSaFGWlsNd0CbHWwjqIDW8aVdA/ighcZzKc7cVXd0=;
        b=UchoB2wyB1JwMCBf+Wxt/gU58o/L3g3C9E29kNrslvioLFhg46gThtmEgeje6ikzAC
         fiXYdKS46IiFiROh264ujYL5bEI0/Efl47DoYae3aaJvFgc/E6+OJGwT+zFkZJnTdacd
         2j3Nqs/gv8BBSMZGbMScXYvvRQVwN9+VNEhdbtLKvc+ZTCT9im58sbIlwYcU8WmJn9jl
         cMJtMtDneD8QmRUQCxHoSmg7+g3l0MkHabZ1jRWpsJDc5cjugsKOFbSABR7oVCLAOAae
         jN+mVlZP7QuCoTsffEyO2UCb7bYepztdjVnPqZBRg9VJiMIDOAKPD+DiNIrgIS+1/9UD
         KL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513428; x=1730118228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgXSaFGWlsNd0CbHWwjqIDW8aVdA/ighcZzKc7cVXd0=;
        b=wkqRtcJcKHrEMhWx8xdlBVFXr/Zm8hzbjEzzEOLsdGJHYROnHy7j7R0fAFEEqmSKTp
         +FJXZnBprzQITliJi/Q/fcUSlCg7HojFtksXGgmxhRAl24UpfV6VXbbsLKpiS8WhxfgN
         vPyazpngzI3FhuzjcCeqoLs2WmQ2eN2xu1XOPAGNelLeRxYbfr7SqACHA39x8I8f7Ajf
         k2hid3ycQkynzkyJQagRdGwIWnCIANjVslH2U37Zr/Z/pNTyAaTHD13P5NWDRcITiIM7
         sx7o3BtX6Z0qFAK8/qIX/FZE4wymkPC4ItV9N3Ov61J86WnYoqCDLtBCrreYSZDijKst
         NR0g==
X-Forwarded-Encrypted: i=1; AJvYcCWtf5Rya33JxIzKNnXrOZB/k535mT5S6EhB//nrQzqALwpDdNt2LG1DrhrENa/EbJ8Ee71FuJe76iDPlw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+8EyQ40GQngOIcYqVKqnEQ6J1VCB5YDXNXfT/0KVCbPCsr3oo
	GY0+UpAbkiBod1Q+ut7o76EGOobvcBGQOEHeycAxnOWTLwp5sc2Tcl5/Ow==
X-Google-Smtp-Source: AGHT+IG6AbXnc+JnTbQtqAFHScJgxFYihFzpe/ayUKl45Zmwl2fKaZXsfhokHl5gSrgPWj7HcVOoDQ==
X-Received: by 2002:a05:6808:2f0a:b0:3e6:1170:a58f with SMTP id 5614622812f47-3e61170a67cmr3003068b6e.5.1729513428463;
        Mon, 21 Oct 2024 05:23:48 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaebd061c1sm2332892a12.19.2024.10.21.05.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:23:48 -0700 (PDT)
Date: Mon, 21 Oct 2024 20:23:30 +0800
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
Message-ID: <2zawe64brm3sfuslh443352wfupgnhb4xw7jragkzxu6kgg6t7@b4qiya3jdij4>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-2-inochiama@gmail.com>
 <20241021-outlying-washday-8f171dedc703@spud>
 <r5ngs2j776jcy6sfirwzmtsoljotatfvgmlmv4sj4xksye2bff@xtn7adafbpfz>
 <20241021-rosy-drove-1ae3c8985405@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021-rosy-drove-1ae3c8985405@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_052350_114682_42C8D8A3 
X-CRM114-Status: GOOD (  22.42  )
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

On Mon, Oct 21, 2024 at 01:21:58PM +0100, Conor Dooley wrote:
> On Mon, Oct 21, 2024 at 08:18:58PM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 21, 2024 at 01:10:52PM +0100, Conor Dooley wrote:
> > > On Mon, Oct 21, 2024 at 03:26:05PM +0800, Inochi Amaoto wrote:
> > > > The UART of SG2044 is modified version of the standard Synopsys
> > > > DesignWare UART. The UART on SG2044 relys on the internal divisor
> > > > and can not set right clock rate for the common bitrates.
> > > > 
> > > > Add compatibles string for the Sophgo SG2044 uarts.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > > index 4cdb0dcaccf3..6963f89a1848 100644
> > > > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > > @@ -58,6 +58,10 @@ properties:
> > > >                - brcm,bcm11351-dw-apb-uart
> > > >                - brcm,bcm21664-dw-apb-uart
> > > >            - const: snps,dw-apb-uart
> > > > +      - items:
> > > > +          - enum:
> > > > +              - sophgo,sg2044-uart
> > > > +          - const: snps,dw-apb-uart
> > > 
> > > Why does each vendor have an items entry of its own? Seems like needless
> > > clutter of the file IMO, except for the renesas bit.
> > 
> > I just follow others when writing this binding. I think it may need
> > another patch to fix this problem, right?
> 
> Yeah. But I'd hold off to see if someone gives a rationale for it being
> done this way before sending that. I've not deleted this thread, and
> will send an ack if someone justifies why the binding is written like
> this.

Thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
