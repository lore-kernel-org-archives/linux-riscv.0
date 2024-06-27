Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D123C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 10:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJYjyxTAvsf7OawtAYH3k7bOjwBBhRN6sTjQhoI2NoU=; b=BsybUzYh56Q7eI
	/KunVIQ9MUQWUB+hTSYw+ye81q1GyZRWlQcnPnx1nEOy8FNHguXiacWDb7yDePviko7T+hIH+pnSp
	BFnX/9fL+Qzg/8Vg1roKvoVgTFQOqhw7x0ahYyl4Ddl9bXT7jEvu7ZB52uveXM3c8tYKdfpNl+dCd
	ekM4Lux26oxHksY+xEdwYZRU04JmvH8EVwOwoTs6PpnVmUwtsLAlHbDKtNYMtlNwSj2jj41Y/h9aY
	MAtInlA0uVvJfgT8OvT88QkJn1/MbJbyaSPTVG/tWF2hJFbkEeqiJ4PaNAbOgeTV7+TYkz9pbRmGh
	VeJaQEuCEc8gLCqjwpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmTH-00000009yLU-0brb;
	Thu, 27 Jun 2024 10:35:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmRG-00000009xQI-3QVr
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Jun 2024 10:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fXlkJ4byuNhY1OxdtQQCWbR2oVqHbP/kpXhyEnlbP48=; b=PM77Sqmu2/50Ubr+u8m3TM08+4
	rFkzIiSzWF54c7AAehnTTQX+sZsvZehoZEiX422jh+wU00KXEQEWe/i9Me1vjGC656ld3MBGTT+4Q
	gD+KLxYD0FoLEFMwcWu5HhQv/KZgQbTzwLrKebMHTDgXDC1Ya6pBSXL1V0TsX3SHn36VCaH0A3zjO
	g1Mfkd44FENYepFKvAqsB7LWeK7tvKidJxl+Ly8LIG6zX9AVF3grQs0h8cy6NdSl6QI00uvla8m/h
	4ael6tuf33gFATlDiA0JoxF6wFxJQUQGoJ6D4SrTMkqZ5AuaUSxT91WHBL/ZKc827H0tHuxXQhl0J
	Xo5sbojg==;
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMlXe-00000008oG2-2BQt
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 09:36:13 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1faad409ca7so2557805ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719480940; x=1720085740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fXlkJ4byuNhY1OxdtQQCWbR2oVqHbP/kpXhyEnlbP48=;
        b=AMzYwj9PPcL18iAdFKMP2sxyKn9mL6irzsmzkz8OshmRti32eJIqfGtsnfiCGtTnBY
         Fntjqal2Zf7e34vvWT0qWmjEswA2suqC0fZFOxliVpVoaBVDPgQk9l6jRsOtKKSqOmrj
         98ziKzZO93pyHl4SVPOiwhPMo9ZUAChs0gKeiuIfuFuRyf9Me8wgO2F/8wUw3d8U/ANt
         DzAn0fNvucYFZHq5ew+AhqkrtQy425K9K5mpkpVdygTsqYpAtiO4fQue1TX4H01yfRtp
         mxXM/y8CNp1llO3UTZRTmLmws2GAPPzIAiqmAnWN12Wp56h8Tkmbbv6SRYCeVd4QxSua
         rPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719480940; x=1720085740;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXlkJ4byuNhY1OxdtQQCWbR2oVqHbP/kpXhyEnlbP48=;
        b=Efg5jlhayZ81MwMR/TU3wTBi/Rrg4IOodSrhfelU3csT8rOAmxIepm44UVyDSc77zX
         HlxC/QMSNk/9PUzjbE64xI9/UF/5XRKSn3VlxtHrb6htd8Z2q6MgeJIOPGdEfK9MmlHU
         r16RXXO4KJSvJxVZo7Xq0buGvkStDA8t36Qrb4wBMO9MxVXk8rkC+pAZk4ExMhkX3lNZ
         anCc145iHhrYLr6ze0Z5TxOgN3Tau7tMheBy/yf0o+8bMXpK/0ECi4FFs7ny6vqh5NQ4
         9yKo7hEjws93BO0dW316XCimCRqOfTA3NMCTt5Eqd0EBr3zyqraj//c5GOt0TvD+ri1A
         USjA==
X-Forwarded-Encrypted: i=1; AJvYcCUs9ZnObJRiYxrAGMy2QIwvFCej9IsY7ODIzM4VpkxvRGWcO+ebXGwICa7RQQAWVRcpHKzjm4F2ivbBbInC1MFbLXVpot44dlDhUAxiRA+h
X-Gm-Message-State: AOJu0YwvHm2usiDh6qxbsomzFcB22rEPNd+RyEGnb6GlfcQwof4mGsJY
	DtLwanZRxTlPnTWV3kEcZ2ChXHFA8w5pVA/cTeuN7011IMmeJfHw
X-Google-Smtp-Source: AGHT+IFLVCNKAo3CIqvXHbk62t3KgTprcj8Cnnpwdw3N22YyO1klv1GgNefbpUPx/KlnWsY2bqhTvQ==
X-Received: by 2002:a17:902:e889:b0:1fa:918e:ec4 with SMTP id d9443c01a7336-1fa918e1130mr51805505ad.59.1719480940219;
        Thu, 27 Jun 2024 02:35:40 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac979f54sm9033675ad.153.2024.06.27.02.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 02:35:39 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <8fb8d780-9e42-438d-88d5-8fe1495cf4d2@gmail.com>
Date: Thu, 27 Jun 2024 17:35:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
Content-Language: en-GB-large
To: Andreas Schwab <schwab@suse.de>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Laight <David.Laight@ACULAB.COM>, Felix Yan
 <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Ivan A. Melnikov" <iv@altlinux.org>
References: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
 <20240627071422.GA2626@altlinux.org>
 <9c102328-6bb3-46b6-bc2f-d011a284d5b0@gmail.com> <mvmr0cin6vc.fsf@suse.de>
In-Reply-To: <mvmr0cin6vc.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_103559_734651_0DC00D09 
X-CRM114-Status: UNSURE (   6.48  )
X-CRM114-Notice: Please train this message.
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

On 2024-06-27 16:10, Andreas Schwab wrote:

> On Jun 27 2024, Celeste Liu wrote:
> 
>> suggestion and we found cast long to ulong is implementation-defined
>> behavior in C
> 
> There is nothing implementaton-defined in a long to ulong conversion.
> 

Ok, I misremembered. long to ulong is modulo arithmetic but ulong to long
is implementation-defined behavior. There is no type cast issue.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
