Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC93D4A5F4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRMyIBI5Jdl7HeF30c9QK11mtjBSQHkgrwAG/eRj7Hk=; b=Lmr9hEinWimmEE
	c6ywD+eC7g+Hh5bWXOnYgS6ZDBBaszkdRohKJk3Qo7NIQiWrLHkm32kfY7COeHRx6MjA8+D+JiZtf
	eFQnrvVgfAnHpUgW8k8O2X4bCgLY+P7LGxcULEyGoiFnmvIDMUZ59RP5DwuaIr91JZylCM7igIBtj
	ju4zQtXaxyrBoD6JELAbDWjV7xShQzqWONNDGF60ZRLfNNYZzeLXDt9xlZ7PsbXt/H6/Y8jLOZPsH
	WTFRGYU76Rhwq9Cp+LZfpZ5fG+BEHKIAjJ6XMwDQI8JZQf3ZIV3oGVX+7OGcl9Aee0+eh5gAU7pkf
	I5FkugKl/rmyQcLciehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhS2v-0000000Hb0c-2SkA;
	Sun, 18 Jan 2026 12:38:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhS2t-0000000Hazq-027S
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 12:38:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4801bc328easo25951425e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 04:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768739897; x=1769344697; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Suqn9RTje01PunnIGGFhUEA52WhKnlG0PrdrAwNU83A=;
        b=HqqndtkHH2j871K7s3FVKLlj+QyLPNjLieeyzgHKxNIqcmHNnfoXKOrUytuRqVX34o
         29DWd5HMZ6Trja1AXXnVeAXU3W92UXCROmHyTlRwu4J9BlX4ZW+Qb0hONvjjx5UwtUyt
         kaGBxOzkKUsBBadtBWRhkz0vwjOWw7Wsq8R0Ztr61rV75gMrswAUlWggW7j9CcR5qEDm
         90RWQKaPF7eS6yja1qlbfNEBp8WlbZ8NXdWoirnmRGUx9Qo3i2FPpElmXEDaJUgm58rb
         tLBWkR+aMUE9fce84njbtpEkJ/IZ4u1hjTkfqOfLeDW6cwsu/KwNINyURQWySZtNcglO
         4C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768739897; x=1769344697;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Suqn9RTje01PunnIGGFhUEA52WhKnlG0PrdrAwNU83A=;
        b=Tbgu2kBw4rJBwg7UfItWnQGosjUBhT71avV61fXNO7Uby/5IfkDBWYVBNoiHnL4N0g
         3MhAYJxEWr/5jTGbetLoVHthV0nEebsK7fqPxwnuRS0e7DY9yHqRCkPsWEdgWUljQro4
         qFMorYOa3oEzTMXo32v3l5crDfwKY8wGT0TtB+29c5WR3dYODTaz57xwqh5SFJgvWmo1
         mZLVTBtRfenkV8Jd5XsUyvg1Pq64r/9OLLJ8a9fBqJyQ32JVPWAv4WE2/5f6QVJfVvjl
         hPnBSvLVlrX89VcsWnykUgY0Sxrc162fuBpfOYhkRkDLQrltdu2KeDxeW+tD4yOK4kii
         X7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCPGvdhzUjZ+Ji+daJ8DviuAHux+hJp5mGX6pBOAurNMrwP914apA62ZYL4dQJ/zlZdx2Iw4c3OlWXfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YytjFx2uNf89+nXbFMy/PqfghG7lsbdRwbR9VxP1IDIrqZm5NKG
	9cFKMZCvXuDK5JWkT03bweDEe5wLm9u14jN/DLdoh09wEsuC4LRv9ExN
X-Gm-Gg: AY/fxX6kQenCuKmSEcewK1TIKT6RLdPyQuI/jCRezvBcnqfuyfUi3NzbrtyZl37DKrD
	l1lU0n0PIoisfL8Mlec/b6moJTTxTLkMxLadexTA8n14/0D7v+qDfwDetB0T949dVNIfrluNNoZ
	N1NafQkEcZ+GpVks+G/ouQGMbSgTTUt1yVRj04hc62ppZs8TXY4D7DpwzbsdbHNrRNwjWPKixiX
	krH9CF7xdXt+RFjse6zfexmkM/EcuD3TLkDE6P3x6vu+99iQpRcDdZZS/Ib8I33D2V+Abnh1vA1
	LrDcABHo8Ps/pMAm8c9S794hWKhSgGUHE8CAzLgveg8lfHjaXbsruRmQZBr451qAKwLwqWgop7w
	Jg11enVfTlD1r4HR0ZHBsXfUbswyGHIMbzaIpPHVyOltkDxowQF81ymrO1A5S4pvLDYPJhhj5cc
	fmjY5LAyJkILoYrB0H6Fozl+hOQ3bduKtfQqVQxBFeLm1EGF5QjlQW7g==
X-Received: by 2002:a05:600c:3107:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4801eabf6b4mr95429315e9.14.1768739896538;
        Sun, 18 Jan 2026 04:38:16 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8caceesm138596495e9.13.2026.01.18.04.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:38:15 -0800 (PST)
Date: Sun, 18 Jan 2026 16:38:09 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: sophgo: add CV1800B internal
 DAC codec
Message-ID: <aWzS4y82qkzJ-xkI@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-5-d10055f68368@gmail.com>
 <20260118-magnificent-horse-of-warranty-e5fdac@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-magnificent-horse-of-warranty-e5fdac@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_043819_100649_CC050202 
X-CRM114-Status: GOOD (  12.94  )
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

On Sun, Jan 18, 2026 at 11:16:15AM +0400, Krzysztof Kozlowski wrote:
> On Sun, Jan 18, 2026 at 12:18:57AM +0400, Anton D. Stavinskii wrote:
> > Document the internal DAC audio codec integrated in the Sophgo
> > CV1800B SoC.
> 
> Squash the binding into previous binding.
> 
> > The codec doesn't have any special configuration at the moment.
> 
> At the moment? Hardware is done. It does not evolve.
Will reprhase, thanks. 
For sure hardware is done, but I'm afraid I could miss some
functionality because I have access only to public documentation and it
is not full enough. For example there is some kind of amplification
limiter register field but there is no information for now how it should
be used. 
> 
> Write complete bindings, see writing-bindings document.
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
