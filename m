Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9A8D2FED2
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PC7Jdy8lRyvS82EQblcF3BRjRzlauVP1iTcOzHcAERg=; b=iiR9sC53522XR2
	wWndHE37/fLyaYhr9853v3Ly5+MbkezsL/NJgwkMJlpVo3FvC3vEp+AOBLDBKMFetmrUnhalUyFwN
	gNxg8MytgzHnzCuv+sC5hyBO0TJSuMuRTUdmCikChU+KKJe+2gFlCgkVkyqLt2EQCOuNrzEpvg96N
	Myio1JWbpD+DdIdwjmtBfv2eomowbL4eD4FH42cxNs0aDMWmxYikRPtIb/SiF8QF9hOEM1ljY6jMQ
	qWbxNLg/a9V1GeGN022XfTYQ4wMOrEETse1UHLOmHEa1jFqR4QeqjcNTds6+tbMIv1b465uACE0sL
	S4APIUsjPEbZAo6tC63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoA5-0000000Eqii-35G6;
	Tue, 27 Jan 2026 18:51:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko9r-0000000Eqhk-3x9r
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 18:51:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47ee0291921so51962985e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539882; x=1770144682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkNqmPn4BV41VYFQxjkR3+9fZTczW5ysPjEroCIQMPE=;
        b=iHSEVEdY0rzIw8t3uH20+u6bc+R1mXAEHj4kx8Fyyr7ldZcapUOtGDUOwQUyWCoIvz
         x6YDsxEFa201/h0Eexkb3lHy8YRFd3olDMWjCddiQowPUrZUHWNZBo6kmtrBXfK784sC
         0mFLra+byoKjtlOef8jZw/yFJrboiZqGfjA3zCsGGzHvHvWAr/Vo1mriluc5aoJpzVx2
         bXs1WOJA6KjnEqlbE7MfAHsvOsyePeuXfYo6gqJWIA/CfB7+rtdFM6osRS4Soql/pLAE
         4d+pcbzbtWGTOy6zLxMAMrjIlJrDU5kZLFk8ZXEH8AYAjxHESlx71KSEVOIQg9ozmmwQ
         0bCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539882; x=1770144682;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkNqmPn4BV41VYFQxjkR3+9fZTczW5ysPjEroCIQMPE=;
        b=KXZMjsnPaNejc6nnBqAINM7alaoNRM1JAG0+kqwbE/NqJwj+fd+wjqpUuVYgARLLk1
         tEWVbeLuOr7pBahez1s2yc5O0oYNNisb7NisUAkhlhwmjTmxfu/yi02/jdqjjvV3Ya5C
         RjoLqt5/UwO4wyHXwxm7U0mfA+qxy1T1glYUWbV6UDw0ND8+EN9oYJg2TDg5laGoue1n
         rfHT7kLm/grxZnBBq7AfQfeFySiAEdx+LMLUOYLiMk8NWj2yGiPmiTIyzKY/h78TQyhn
         MUw/QYLg+F+XkVvtWsJgBrNH9ROZphUBe6uWOf1gnQ0Lpq8+oLt2HJdyjS3tqoP2y2bU
         4kwA==
X-Forwarded-Encrypted: i=1; AJvYcCWRFOOLlLwGWsn7vl5sHbVTJk3OQLDHaXW7q1e50DLXidValkhLNInUGxgNhejLOIx1GUN4K99cqlLqgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg1fD7S089a9rTYe1L08EuQ67FygB9EPTz0inhSf08VwOMukDB
	bp3d3jAWTrpKag4EWLWbIdsCBpJhZwYDRCHGArGQ1nK2yBBfLCKOVyQj
X-Gm-Gg: AZuq6aLzFSTGQJBH/QtA8qhaRHDIYQblOCx70oIATlffXYfVlVoLMbc92/blvSloK0E
	cwT+JMtkaef6sS3Yux/9SYOrfEKtVS9vHb6MtGdE2fAC0lUh1WdhbUDBRRxr+CqeqZJWXtTGAY+
	igt2Xf+Zyegys5jojnkX4TKNOqH6DQVWV2dYor1il058ntnUXuXuGeN3lcA+A0nbYaBdBV8Oafh
	K89lJV4aMTcWY0YVNELXmRXe/XdyIBufE/tFWj0XhJ9LZS2uVKW74LMLMSVhqGvGwuDDfDR6b/o
	mzKQgg4Y7o1r/JvNHy5dsJAQKQWdTWhktUQY/t12IKS4jolaeEFIfZfl3QNXkF/9vs4ut1F6B6X
	fzK3eTQBmJ5f5OQl5VUaFn+XEPrx0xQldH5CjjiKkswBU1kG2yci0tisNyX7BxxGKp7akmvItfH
	r2rnqWjAWtxoVSmAEL4xQeWLwQ38me/QpP9p717W4bOycSoHZfC99m13o=
X-Received: by 2002:a05:600c:b8a:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-48069cb8baemr40072695e9.35.1769539881833;
        Tue, 27 Jan 2026 10:51:21 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806d255f81sm1827095e9.4.2026.01.27.10.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:51:21 -0800 (PST)
Date: Tue, 27 Jan 2026 22:51:17 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Message-ID: <aXkI5jnCEb1SLnlD@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <50b16e42-2621-46d9-bb3f-5b4ea20aaaa5@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50b16e42-2621-46d9-bb3f-5b4ea20aaaa5@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_105126_189275_53CBBADF 
X-CRM114-Status: GOOD (  13.03  )
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

On Tue, Jan 27, 2026 at 12:50:34PM +0400, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 11:06:02PM +0400, Anton D. Stavinskii wrote:
> > This patch series adds basic audio support for Sophgo CV1800B,
> > as used on boards such as the Milk-V Duo.
> > The series introduces the I2S controller driver,
> > the DAC and ADC codec drivers, corresponding DT bindings,
> > and DTS updates to wire the components together.
> 
> I'm going to apply these, but there's a couple of small issues - please
> send incremental patches fixing these.

Hope everything done correctly here 
https://lore.kernel.org/all/20260127-incremental-for-i2s-dvier-v1-2-431b809c632d@gmail.com/

Thank you very much for the review

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
