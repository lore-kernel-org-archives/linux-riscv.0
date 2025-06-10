Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39D1C5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 02:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdVCeWPmArEQortcmjVkWBCnNRFOw4g1Cd6UX/J+EVE=; b=KaQJSPXfvu1uNy
	UxowFIOqckgtcFzLlt3pvPy8EH3hovU5hHMm1r2CftqoRmxznDGBrY3kHHjotwauk0Mf8O2ardTZi
	+qlZQcEk+3dtJUJd/XfUnhfbg8eIIph9f9lxUfcdnSZ/5k4g0g7nWtS9nlRM08YkFZ97a6JY4Xikv
	90vJZr3IXdgHJwUHaA31rU+l4nolTo+w/LTlMJkkSOXFhlocGX4Hw2M0i1XRGYEvvtDXOSy5Fzwn3
	+1eXGElzg7akWUhErNgqmhgd3AEWL7NKOZPTqwW2CuW/qdNnRobzF0xaxlRPoNnaP5yoljc+y6LmF
	vm+zOXiQApoSXwdgiCAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOokl-00000005dvt-2NAY;
	Tue, 10 Jun 2025 02:30:19 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOokj-00000005dvY-0qg5
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 02:30:18 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c922169051so280516485a.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749522616; x=1750127416; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SgElAs0y1ZJkhsU5o9mYZFAkDt+b5eZOursoEKVdA8M=;
        b=mi7m0BUsTAsAQJVAoy6f1jpts2IPN8ueaLeQKc6GoeT6TAS0gDhc8DmKeFkG+u/kK1
         1cuL0Du1Omvr1pTgcTXlLwitcu3ZUVdHEirMhxiAd8h8YWMVcCAx6z09z62xi8UqEseb
         byrC1ZCnM8Y7js0jNr+sruQ4904snQkj1nlqg0PJ+7rIW4MsPg7uxzD2nahjdbLRv0sy
         vNvtxile9xDTzZ6490IJzwPIMPWqTFvihUWtIdn4908zVej4EImKxeOAd4/AzgExjvv7
         wQOoFrOMTt8Xp8YRP7SBm88WFF9XOAoYdI01nHVVsq2ThRnny42rSDIssxSHDUpzyS6J
         uq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749522616; x=1750127416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgElAs0y1ZJkhsU5o9mYZFAkDt+b5eZOursoEKVdA8M=;
        b=rHOdygfE2eD7VOcqN7QRYkXgevvafltaHNPLRCASZ1TESsZgBu+PQWgCj16Ydnl4S1
         adPoTsV2iGrZF4LDDW/CxWZu62RgjTpL8ehQnmwZWWgmc9+cvbjQ2YoQIhyCRcrfnSu5
         jXqJHdzk4agzSzX7jnYHvgHXtt6XiUuRJB59xg/WNUfDCR45+DuzwrTKKczlF9gx+mWw
         TROmgIge3fgXueYr05BCtkl3otosSuZh1JipuV4WOXJjacVGeOQjsAuSL2ZoqC0bb5HR
         JtKphTa02ZvAV4kQXAO3eEIkAkrdMKO4AhW7IwNItIgJq7ekaoF5g89dZHd1pb+EsW4G
         PQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsEAS3w2PDGN9LjOxctWb4PJoDF7dwxCAapf6btpGVwbyzGT7VjKDKOzrR3GIgrcla19QRlOrM6VoqRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf0Zv2Jm24SRDADFuwWujXzskoIT/6x8YNeExRIBwtFY+6nmwl
	ZroGHtEj1xC0SxdhsWL1Ai3isl8mtF/WOi9XsVJhwcImSC73Ddtxqgzc7wJ4m+sV
X-Gm-Gg: ASbGncs2nwmEd/BBATEFzw+FMEHE46kkZ7YKt+lXbb5Ut5auRHpvPF61E6d3YpWitz5
	i2alJ1P6vBmLTRLVyJXRsyACHob0k2YbZW9c3/i/LvGQTClOPHXy+CY+fstMYbhvdco++ccTGAQ
	jfWd+oLgsYoLXh9QXxXI1fbPZN+QQ1fmC1tLq9DaOGGI9pH/y43fsMStg91YS4ZmEjNAnbjstTE
	54JVN7zSmLKJbN0towhRIB33Kdj4jqWxQV+kyxUgHpezLIcM8zWRBazAjh4MaW7NHgE0xWbmBpL
	E5r9PV4ZvsczKEQrclu3O4oYG2zaZaUlux9Afw==
X-Google-Smtp-Source: AGHT+IHGAP6xmALkZKuYBUNxKptzmmUckUcUQvkX0yXZ+9n+f0ZjvsKWM3DmWJRkyqr7YpGIbcY5lw==
X-Received: by 2002:a05:620a:1d06:b0:7d3:99db:c4c with SMTP id af79cd13be357-7d399db0c51mr593864685a.6.1749522615969;
        Mon, 09 Jun 2025 19:30:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d2517fa678sm626750385a.22.2025.06.09.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:30:15 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:29:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Message-ID: <orrz4ibchqfiqbbhyxbvlt4ejtu2roankisfy7gfuza2b4phgl@5mbjjnmcm2si>
References: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
 <174952038849.949885.15347540485983948845.b4-ty@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174952038849.949885.15347540485983948845.b4-ty@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_193017_361061_1FD1D128 
X-CRM114-Status: GOOD (  12.46  )
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

On Tue, Jun 10, 2025 at 09:53:12AM +0800, Inochi Amaoto wrote:
> On Tue, 13 May 2025 22:31:25 +0200, Alexander Sverdlin wrote:
> > Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
> > is quite advanced and provides SoC power management functions as well.
> > 
> > The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
> > and an associated SRAM. The corresponding control registers are mapped into
> > RTCSYS address space as well.
> > 
> > [...]
> 
> Applied to fixes, thanks!
> 
> [1/1] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
>       (no commit info)
> 
> Thanks,
> Inochi
> 

Should be for-next branch, I execute in a wrong branch....
The url should be
https://github.com/sophgo/linux/commit/3a8cef361be50c59013cdb2d804c12476c76e848

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
