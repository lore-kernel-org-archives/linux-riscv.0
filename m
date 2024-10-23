Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3995D2CDF9
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 00:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yc5mKS6nu0P2XSO1hU1mBcCXq656DI0Ima9Ir3QydY8=; b=o/H1S5qLUXpWQi
	dortkBR/7apBe+scdxNRBTC55Dt6pVOKn7nn2+HRSOr8WccY3nBS2DbzDD3vst4mpRCwiHoCL6RSD
	bqbMKn+ebnmfcEB5yA15hbQR8iQ23hvTKm4Dj+t84Z2GcCiFA9dA5xsIh7qZnZG8+o0IUMJD/XN6H
	II9/CGmVCadsed+KixaUBSLMiEw15t+ALAQklLX04ZiCVkIt2s0SgDiOBr2Ri2f056Atk4vwLOm1u
	T0yWAJ9lyYcOSJgoIEOQMz6YWAmedn9IRWzQng27rm7hF5OZPIgY8TAFys2Vby2Knd4T9WiDhddgy
	ZQBlxwKKWYH+ifnK9Qxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3PJT-0000000CWrl-2Yws;
	Wed, 23 Oct 2024 00:33:23 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3PJ9-0000000CWo7-20Xj
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 00:33:04 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20ce65c8e13so53385255ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 17:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729643582; x=1730248382; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7GwFa/KXD9udMqNOk/17VTw0JX40rEFnM+9r84c/Z+c=;
        b=MGvOPAcVAc2B6G8f+TCUSduvxb8TEiMhdsm/BQ8HmKUULx9rqf5RyJbhved55SI/GT
         Xyf4T7TqqM/nRTMAPUIt3bPv8TnPn4jTcSbcHycLHFQwdU4coEcPkT78cQqymRHln/3r
         KpAYt+WDhWsbsLBEhoYbE90W7YXR0DyweS8l9s6HpvgC9PPcOGSnmGKCol0KxagRfprJ
         64R35xt9eCKrzZSgYe/2AzqjaMQraeu9ISoX76xT27rT4bjnn+ISsay10w0Nog52Hhdr
         WGC+Ddfqr+4DWv4Tb1hvHq0Al3cpztEIekVqhr5EEz6yYPv4SkcpWIVLxB4yREh2vg7r
         r3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729643582; x=1730248382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GwFa/KXD9udMqNOk/17VTw0JX40rEFnM+9r84c/Z+c=;
        b=L8zll05awWJqi3oVkawCJ97n60zJk5ePx8QMnOijmFDBNpZG8CYIh/v2axMdNGOkn9
         YObUcmWb2+GuTLDDroisIRyh5MzdZq8B2qQeIJJoq6ldu9OWsE5cDrKC5QkFecBHbn7u
         znF5LszGUB8PIMiTn+Ly/t30+94Uh63ESgbFlCPaaltKpa3oZxphuMO7pwwQrpasId74
         iq47HJmuV5BTrFXlCVA31DEp/ItZPWobfAvE0peg+cCCedVJiFCMRHaHPgcxuIDBouQc
         qMp1TgnmN+yehEF52eCssn5EO4MxWDttxoWhzaQcxBjBFjbJ4udS6YX8aEJf1RVAS88/
         /iyg==
X-Forwarded-Encrypted: i=1; AJvYcCVlmPccKDZXPSPPQYXkLKh/5+5DNx06fQGANN6hS0f+dUqlxJ2latAjYSgrY1TmiGAASddFvLpKopD28A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiMrYOqI1jWyQlNGHQ+dA0cFKJxPJ+ij0vJlupPj0cURQl9Y3y
	6WgmayiS4D9TZItFI2fv5BeMdME8Ng5xsl57jV9byANiYDhfJcab
X-Google-Smtp-Source: AGHT+IHAY4TNmt69KkJHUwnXiPYb1f/Y1IUPucStfdWvNs0yInAp9Vjs+QAiNb2Jmb4WvpYofxCllg==
X-Received: by 2002:a17:902:fc4f:b0:20c:a7d8:e436 with SMTP id d9443c01a7336-20fa9de929dmr13076305ad.4.1729643582441;
        Tue, 22 Oct 2024 17:33:02 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee67b7sm48341985ad.41.2024.10.22.17.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 17:33:01 -0700 (PDT)
Date: Wed, 23 Oct 2024 08:32:42 +0800
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
Message-ID: <e32xi34m4lubrquluk7uu6nvqgarnxtmj57ricxg2gv45xpgcs@x6t7itvwng4h>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-2-inochiama@gmail.com>
 <20241021-outlying-washday-8f171dedc703@spud>
 <r5ngs2j776jcy6sfirwzmtsoljotatfvgmlmv4sj4xksye2bff@xtn7adafbpfz>
 <20241021-rosy-drove-1ae3c8985405@spud>
 <2zawe64brm3sfuslh443352wfupgnhb4xw7jragkzxu6kgg6t7@b4qiya3jdij4>
 <20241022-washday-glass-3db9f6a2cd27@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022-washday-glass-3db9f6a2cd27@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_173303_543960_F9A69D90 
X-CRM114-Status: GOOD (  28.82  )
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

On Tue, Oct 22, 2024 at 06:25:00PM +0100, Conor Dooley wrote:
> On Mon, Oct 21, 2024 at 08:23:30PM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 21, 2024 at 01:21:58PM +0100, Conor Dooley wrote:
> > > On Mon, Oct 21, 2024 at 08:18:58PM +0800, Inochi Amaoto wrote:
> > > > On Mon, Oct 21, 2024 at 01:10:52PM +0100, Conor Dooley wrote:
> > > > > On Mon, Oct 21, 2024 at 03:26:05PM +0800, Inochi Amaoto wrote:
> > > > > > The UART of SG2044 is modified version of the standard Synopsys
> > > > > > DesignWare UART. The UART on SG2044 relys on the internal divisor
> > > > > > and can not set right clock rate for the common bitrates.
> > > > > > 
> > > > > > Add compatibles string for the Sophgo SG2044 uarts.
> > > > > > 
> > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > > > > index 4cdb0dcaccf3..6963f89a1848 100644
> > > > > > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > > > > @@ -58,6 +58,10 @@ properties:
> > > > > >                - brcm,bcm11351-dw-apb-uart
> > > > > >                - brcm,bcm21664-dw-apb-uart
> > > > > >            - const: snps,dw-apb-uart
> > > > > > +      - items:
> > > > > > +          - enum:
> > > > > > +              - sophgo,sg2044-uart
> > > > > > +          - const: snps,dw-apb-uart
> > > > > 
> > > > > Why does each vendor have an items entry of its own? Seems like needless
> > > > > clutter of the file IMO, except for the renesas bit.
> > > > 
> > > > I just follow others when writing this binding. I think it may need
> > > > another patch to fix this problem, right?
> > > 
> > > Yeah. But I'd hold off to see if someone gives a rationale for it being
> > > done this way before sending that. I've not deleted this thread, and
> > > will send an ack if someone justifies why the binding is written like
> > > this.
> 
> Well, Rob doesn't think they should be separate so please add that
> additional patch in your next version.
> 
> Thanks,
> Conor.

It is OK for me. I will add a fix patch in the next version. Can
I add you with suggested-by tag in this fix patch?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
