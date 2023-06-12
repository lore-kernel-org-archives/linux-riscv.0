Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7D2C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRD3ANE12XtekiSRWqiF5Gp6HT+WCNSjdZWBPvovB2I=; b=Mwosrxe8/9pLxm
	+UOayhNpVARCzECFD9oHREI8GpaFNayK1aTaviId4Rd35C7dXYuDhzWL2QkUYcSTJGSDoA/qwvkfD
	VEbsi2l/o8WXvLuXmsuKnDd4SxyhacjtaxN/scvACVCXcR03lzO2QTdJ/akLCQTt6syuv6q+YP7ve
	ACe5BQqmR0lZENHJBC62bSByesPK2NEXm5Em4IFSm7p4ZgJ+eWgASCf2+Ldc0pdVb3nme6IBAHoeq
	rZiTKvOm++MQTkFQSuI820Fnjo5IUV8bblbuO5HyK0v0nxzgF3HnOa5CDVxVrUiOSjlJI5RlQtGK7
	bBHSR2Oe9F+LABaKByDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8cM9-002ync-0a;
	Mon, 12 Jun 2023 07:52:53 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8cM6-002ymm-10
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 07:52:51 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-19f6211d4e1so2759354fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 00:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686556368; x=1689148368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VAjIEiwZu5OALOSzZ0b1pS9HZZYRHfw2JqmOl3GFk0c=;
        b=Zr0t+9MoLTM7XtvsMDHPLLlYU7tnSe4830HtrZS7DQKZ7RvBVaWb8CvaX+c+sDwnd8
         iAjmEsl7cLw3AkDzQ+Ce/LUf9A1bfu3N5GTQhq5W7/FiId5jmdfiu7caQfE6t+8Mxwm7
         sETkwoOIfE0d/p8hwoHpmQB8hXna99qtCAkwaTVXCKYvi4lXdZhChAskMXHlpsAftfsJ
         lRkCuXjDvoLkjoyQYvtNasf28LL28YBCLAsMDwSi78jG809/d7ECNDLDHgXte48yQZfJ
         h7mKtbBYIAMoKtfj4lzKf4KDJgnF4uzb/mCdVZr2Nrfh1EvHGabZwa+MUhEB/o2ZNOEy
         vn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686556368; x=1689148368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAjIEiwZu5OALOSzZ0b1pS9HZZYRHfw2JqmOl3GFk0c=;
        b=KQTCNfpiSICYwmC7wV0mfWMTP9gbpZ032pYeM47CG97qWUGiebYG8KG4gIZ5LN6J8M
         Sux3yFPDiMQO4iUuChdxPibC0F92eb/Qd8i271wWIVGVzYkKu/edIEm7RDmBKJ46cg2S
         nvOwhNOi5LwpIktBb+QmMgR66/istdMEV7nvlDtn7gC7w28q5TnSmaQ2hU99aNvbSkly
         rjpxdxapaJPg2OUeTExneyIW8DruGhUOX9e7sfn1Mbv5St3YJmw6a0KX9uJjyTMDKp8s
         ICvCEudrWv6ZSui5bOJ/BzGN+WwkEuHt48C0iebTUFdgTyyPeeteOE+3vDJ1iSI7ESqe
         qIXg==
X-Gm-Message-State: AC+VfDyg6aPNnf0ISC/GtTdxTtPmk7zPMjp+iYB6a82ZDByONDynGtfA
	gk8amG7B3TSuATS04ZuaHwya2w==
X-Google-Smtp-Source: ACHHUZ41/WLgMKQP5VCoZao+RL+8BsTaz6T5lruPMf9QxvU4QhrngI8kFmo8uHK0j4sPArdooUSQDA==
X-Received: by 2002:a05:6870:5ab0:b0:1a6:98ca:4343 with SMTP id dt48-20020a0568705ab000b001a698ca4343mr614417oab.1.1686556368248;
        Mon, 12 Jun 2023 00:52:48 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id z41-20020a056870c22900b00172428894e0sm1779118oae.28.2023.06.12.00.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:52:47 -0700 (PDT)
Date: Mon, 12 Jun 2023 13:22:39 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Yangyu Chen <cyy@cyyself.name>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 5/7] RISC-V: remove decrement/increment dance in ISA
 string parser
Message-ID: <ZIbOx5nIq2OGObBO@sunil-laptop>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
 <20230607-estate-left-f20faabefb89@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607-estate-left-f20faabefb89@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_005250_349483_1B2E7DD4 
X-CRM114-Status: GOOD (  19.49  )
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

On Wed, Jun 07, 2023 at 09:28:29PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While expanding on the comments in the ISA string parsing code, I
> noticed that the conditional decrement of `isa` at the end of the loop
> was a bit odd.
> The parsing code expects that at the start of the for loop, `isa` will
> point to the first character of the next unparsed extension.
> However, depending on what the next extension is, this may not be true.
> Unless the next extension is a multi-letter extension preceded by an
> underscore, `isa` will either point to the string's null-terminator or
> to the first character of the next extension, once the switch statement
> has been evaluated.
> Obviously incrementing `isa` at the end of the loop could cause it to
> increment past the null terminator or miss a single letter extension, so
> `isa` is conditionally decremented, just so that the loop can increment
> it again.
> 
> It's easier to understand the code if, instead of this decrement +
> increment dance, we instead use a while loop & rely on the handling of
> individual extension types to leave `isa` pointing to the first
> character of the next extension.
> As already mentioned, this won't be the case where the following
> extension is multi-letter & preceded by an underscore. To handle that,
> invert the check and increment rather than decrement.
> Hopefully this eliminates a "huh?!?" moment the next time somebody tries
> to understand this code.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
