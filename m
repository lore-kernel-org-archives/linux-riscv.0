Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B18C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZmjvP06gHLBilpmzaJMUS8xvHC//KYA5aBmThLiEnE=; b=lipPk5w6IrQ4yP
	aC9oxySQ7PwojQlRGO4/T9g/MFZKVYY1gDhFhfS1kXlwfqAZwj8aAl+81oqBhlRDcBRCud6dC6O6o
	1YPDmD0Fga9uUavERtSA0J4Nhv0e0Yfzhjg7J3JheVmrHIEV7WxbVVHaRtDH3EGJwhjf/gNvq0cjx
	rFuNtWJEN+Vy1wc8H8xlGLYDEOiWpMizh3G3CAinkumOB9RV9WN2FaX8EJs7iOZ3ltvYg+NRehNe/
	zQ8syFNX/0TCe/7kOgPweoNNZgD7ZMRq87wFewdRIbw4omulUzrYpJvXbR3oa9rSeFFwPIYVuaxx0
	fV6aa3rYbqzCdkOHNL7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaaC-00000001OCy-0Ocb;
	Mon, 10 Feb 2025 20:40:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaa9-00000001OCX-3nMl;
	Mon, 10 Feb 2025 20:40:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso25233475e9.3;
        Mon, 10 Feb 2025 12:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739220040; x=1739824840; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EOrJyLpi9o+aX1l7UhQTaefPqHhchUVGMwHkMkiXSo0=;
        b=LQc6nDA5ukxXQfacyMg8NSnFhzo2jcgKivAlGgclm5um4KpDm2zhg/rVOk+aTClCGb
         n8TdR/N049UvtNN7AnwjC1nro5qqMmQLs4eqSLEntT9Q7+TeRhbEFe5oqFGPmu2vXCNw
         hEQ9O8b9MzQQbPY2AEne8CoxBRgEYzvrCTl7f77+1OXwDOgT09Xoa9nn4Q4rF4p602rd
         lMuh6kuawLgYg2ELtL9VlT+Z1Zyk4u++ovNWnAoMoEPUxfDxYv/9m+kvaPiuEv1Yze1V
         +wrstVLqmReOVYHlOLOu+yipLoj4gjur6YBHnx8Sa0AbSk46o+ppfEJGr1zdoSJtLC9D
         AYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220040; x=1739824840;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOrJyLpi9o+aX1l7UhQTaefPqHhchUVGMwHkMkiXSo0=;
        b=BwJRkqU1dmh+IfMqE6h58bAZyqnTz7jOFPsUycIq+ZZjS1xBg60kgc2+Om/M4Vf1dX
         /a0pSImT33U2eY0LBHQwfBv+ZWMN0hVOLo2ldnE0wcOtg6m9lb6Mq9Qg2UflgF+w5Vi+
         70HN/ql+l0GFu/Zk/KNvv2muJD6qSvUeVaGtolzJT+8mH+yyRrev7A0j9i6CB966P5jh
         EDvXJo1vzyq43eLmaLeKHznU7Vm0jrXa/ofaXgfbamooZzaO4gg/mGeje0QNtpDdu9b7
         2sd5m/UZ+F27SIRyynRzqi1broa5EPkvQfUufJ9EQkZos10Yk+qaPOlF/UnIlGRP3yWz
         MFwA==
X-Forwarded-Encrypted: i=1; AJvYcCVwWcKou/igIjyRa2p3PexF8rF3Pdn1c+wy9l/BdIEQHiu1al6trh3DOc3us/0iSY9ZS4bmg1Nxvhl+dQg=@lists.infradead.org, AJvYcCXSkOxXTY1ouz8ywhxYIgImS7Q0hjjlY4mgpC5rAt8QNGysXQELGSUw/M4rwR/JbEQA86aM2xdEuITgvSsuTc6T@lists.infradead.org
X-Gm-Message-State: AOJu0Yylli7y1Ak1H0LmGcJOPDQNBujDIyuqbZScS6OhNmSurroblAnq
	TT6ULWuJGCpz44IOrFvbZ6MTEZ+tsQ695+S1bMUWm5OJ5gvoK9D7++kl9ilP
X-Gm-Gg: ASbGncvZ4Eps1sePFR233tUAIHTRPj9w1h3h40xf2fb4UXAP3EHuuy2EDfxFCgQwexx
	ThXWT6aKGOJxLHk44Xt1pk5tfUmpf328vTyg8c9QbDPZ3jyZWIx9zsmd2MLjyw/jDE48mgvYPlo
	JSHuX3wpjskIDbxpMfNjYIRljZ/eg8Y9wGv8E4r9J8Uoqo4RhRjbRaBZjmW7KedRkGbWFjaRMUM
	6W4KTb39wQYsXHQ9H84REMb6ADQvFaDzGonRzhicVUWW1M64DlcDOYYRmjQCjd5ZV+zRXGW520P
	MRNReImJlRuFF5F6hW7jgyjOCXsgCqgG
X-Google-Smtp-Source: AGHT+IGANzhAWt5IwkQhTvn7xGsdCRHvYJ4peTBZKCls6+W0CRyuS6ldpr+5UQbejq+0t4DSbFyanQ==
X-Received: by 2002:a05:600c:b9b:b0:439:4637:9df with SMTP id 5b1f17b1804b1-43946370d05mr42704375e9.3.1739220039819;
        Mon, 10 Feb 2025 12:40:39 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf44f3sm194823195e9.29.2025.02.10.12.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:40:39 -0800 (PST)
Message-ID: <b51ca7db3e2a7fab372ed950e3a18cbcd6c56ba9.camel@gmail.com>
Subject: Re: [PATCH 06/10] dt-bindings: mfd: syscon: Add Cvitek CV18xx
 rtcsys core and ctrl compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org, Sebastian
 Reichel <sre@kernel.org>,  Arnd Bergmann	 <arnd@arndb.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>
Date: Mon, 10 Feb 2025 21:40:36 +0100
In-Reply-To: <e76da2aff03e9c788bc322d84d83b0e6c28f44b0.camel@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
		 <20250209220646.1090868-7-alexander.sverdlin@gmail.com>
		 <fe1fb66d-285d-41b6-af71-89f6f93d1cf0@kernel.org>
	 <e76da2aff03e9c788bc322d84d83b0e6c28f44b0.camel@gmail.com>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_124041_943775_104BC4C9 
X-CRM114-Status: GOOD (  14.58  )
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

On Mon, 2025-02-10 at 21:30 +0100, Alexander Sverdlin wrote:
> On Mon, 2025-02-10 at 09:48 +0100, Krzysztof Kozlowski wrote:
> > On 09/02/2025 23:06, Alexander Sverdlin wrote:
> > > These syscon blocks will be used for CV18xx reset driver.
> > 
> > 
> > No, implement proper reset block instead of abusing syscon.
> 
> I don't think it's an abuse... You need to look into the corresponding TRM [1].
> 
> 4 bits I need to tweak (and one magic number into unlock register) are randomly
> placed at random memory adresses and otherwise adjacent bits have random
> unrelated functions from random unrelated subsystems.
> If it's not syscon, I don't know what it is.
> 
> It has a reset HW block, as you and Inochi have correctly pointed out, for other
> purposes, for resetting the SoC IP blocks. The overall SoC reset is complete
> mamba jamba.
> 
> I was thinking now about a syscon driver, which will register_restart_handler()...

Sorry, I meant "MFD" driver...

> Inochi, do you have more insights into it? You've mentioned RTC and 8051...
> Looking into TRM I don't get it, why a thing blessed to do all the housekeeping
> (and called "System Controller" in imx8, for instance) happen to have RTC_ prefix...
> Would RTC subsystem maintainer be happy with a monster driver which has ties
> to all other subsystems?
> 
> [1] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> ("rtc_ctrl_unlockkey", "rtc_ctrl0", "RTC_EN_WARM_RST_REQ", "RTC_EN_PWR_CYC_REQ").

-- 
Alexander Sverdlin.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
