Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB833D34082
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VW8oJ/8XUUlabR2khQVF+MIAdEcI/ohj05x3avlgwTw=; b=W5BH4lFQmeggrG
	5Yb2dawy1UNTw60ftJFRpWYPfeNvCt/CwiUlLsEZfX1jo5GNRkHSi9a6jwjqDvoMoFea+3ZXVMuQZ
	QM/15wPEr6U68IuG+pmX8YG7f1ZgfSJ4R3061XN48CAY3sJH1/AwyGXS2EfxZ4d0gRJyJt6wrP+XQ
	obL5aBoDKevjJr/F+6ZeBu/fwPMy8GUu6DtR491E2qGZfCl4O5j1w1Bmge1VHulSIvGPVB5WtkoMP
	fwuhxDzJuWZ0acYXmgkLBheyqC+p/FNLNPQqI8fYnNWP3jBEqWnUOGM5VK+FeOiZSZgn5cp15XCbA
	CU+41MhnXaYB/7bf/36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkl1Z-0000000EYF3-2ayD;
	Tue, 27 Jan 2026 15:30:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkl1W-0000000EYEi-3a1l
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 15:30:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47ee07570deso45118925e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 07:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769527833; x=1770132633; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+BzwDOXsuwsKZRnCwm7TR0RjiDWsT5xOCESlbi3ly0=;
        b=I1ta05/RxMetwx6vPHCbfeDs8ZTkC28g6GpLMJuo9pqyDiL6bcBKcsjYxfT/yzbUkJ
         kGSotcnTD9XbCZUhSrNMSDv31gGvm/Z6Ln8+3eQj6PFkkyUozww1Bo8PCcush1Lud1nK
         J8lBEwfIZmX+vY6QRoO2YJbCZczfYZSFfxG+OtulAuWWsq9o6T3mPbFU8mB+hfjcqWfq
         y0QTRe5MJ8P7SKTJcNQ/B7v+dYhla6xfW1NeT8BamwUGhh1EeLGYskPrY7I5mYM2PNw3
         BdMPHBO/1pEVeewsGzDTFUEF/i5vSifRPGPOMw83ZpZGmeuPwbWyGkORC6HXJtuyE3ps
         gJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527833; x=1770132633;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+BzwDOXsuwsKZRnCwm7TR0RjiDWsT5xOCESlbi3ly0=;
        b=vmEK6dZes3wVbxiIbMRl/oSqkVqhq8gpDv3NK74zvDpA76aiDav2QkP043v894/xAZ
         qU8Lo+1S3gIQPL3RUUA/1z2Fux2ymaOaFsq9eZFaBh88juQMoYX6DJx6K6PadibrpEqo
         aTd5kZZx/wlS0TM5tJYAtckjuKe7zlFEFIGmZSG/rPvscruTHp/cjlEc2COfodO4qUKH
         yQBbtdIcVRj73XbCHStwMAElVhtyKwxK+5EIWhIVXVgusXB+QBa/MPe3Kpkfo4jVcjy7
         eR1NxPqFVww/XG14VF52/aiIYffC2Nejmd5r4HxnXZr1kCx8bw9Xy5fyF0SJD9BoPK2T
         p/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWge922c/APbnitHLvYU5OzONJd5D5nMdc5pEeWWgXN1oCc+O8HPTT80KmbGTxPJ5srXBbr4OAFH2QXNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIae6pwMJbINNFE29aJsL6KNwIlJ1RRJvLnPQlsXVHyUb3JKvw
	bbjX4JEsWAGALFIItE6ySL/YSuKEcCWs28QALFn/Nb6l6WLOb1aWLnLe
X-Gm-Gg: AZuq6aLax9iQJWoJJox6eKt+cIHSDzdgoQGuIhrbkq8TaUq7u/Nx4/h5glPsGBpFqe2
	TIPJYDYEhtfBiHEq5JqzcDwoM8BlbZeOcqSZio616zAHsqFVPQRiMUNNfOfz8CNR77D67yWhO4U
	q+DDUxhAVy03XQKQ5EV01g3Gfyb1i0Iny+FbVRt3YiZF/1zVusM8ln/K9IK4ZDcFtgl39R1u1LQ
	mxAutQFG3Q2HFsVUcNNFucv/hOWAaWqWGjLuRfOzAm7v4tjsYpAXPrgvAZePxz6qldQ0W3mN5EK
	Erl4jhiSOoeF37ovwdW7inyn4/pIE7BhSbjEGnMxe2s7zRFm5YirBHqEAFFjX57Au4AAUxKL+D/
	ZxNHbfZKfepI1cWzbElolScSe4ZNIbJhRWQZDFhGu1avp5j7CXVGIZh0ZCtW8MoX0PnYwVVg12k
	kO+Xg4U6O2iB6AuTs72VWdoAxP+t4n7Kq85lhPFg34uejxzuWuTl9/3+A=
X-Received: by 2002:a05:600c:1f88:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-48069c39a00mr29694175e9.13.1769527832532;
        Tue, 27 Jan 2026 07:30:32 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db63817sm137117845e9.3.2026.01.27.07.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:30:32 -0800 (PST)
Date: Tue, 27 Jan 2026 19:30:27 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <aXjZoFi_fq3tzJFY@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
 <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
 <aXjRx12yPA7QflaF@anton.local>
 <153acfd6-cb4f-48ee-82e0-0a18a4a1e9c7@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <153acfd6-cb4f-48ee-82e0-0a18a4a1e9c7@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_073034_933456_C547F966 
X-CRM114-Status: GOOD (  24.16  )
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

On Tue, Jan 27, 2026 at 03:13:59PM +0400, Mark Brown wrote:
> On Tue, Jan 27, 2026 at 07:11:24PM +0400, Anton D. Stavinskii wrote:
> > On Tue, Jan 27, 2026 at 12:49:52PM +0400, Mark Brown wrote:
> 
> > > Nothing ever mutes the DAC so this is a bit redundant.  The mute should
> > > probably be a mute_stream() operation.
> 
> > I'm not sure here. DAC mute feature was not implemented because I don't know how
> > exactly do that. The public documentation is very weak for my taste. 
> > This call added here to be sure that override flag is
> > not set (override feature replaces the output by setting it to constant 
> > value and ignoring the input, so it is some kind of mute from my understanding. 
> > So ensuring this off is needed be sure that DAC will output our I2S data). 
> > What do you think will be better to do here? 
> > I'm sure that is needed, but may be better to move 
> > it to some early stages, like probe function. 
> 
> It's probably fine to leave the functional code as is but you should add
> some comments to the mute function explaining waht's going on here.

Sounds good. Will add comments and prepare v5. 
Thanks a lot!


> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
