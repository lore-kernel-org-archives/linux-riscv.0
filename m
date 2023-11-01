Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249B8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 20:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAt6XkHWVlSBaW24IiaYIj8MvTERhDsg1XmFvEOQCSw=; b=vcq9fz2Td39CzD
	4mZ+nDvSd3ncOvjcEu3HGnX6pLeMimbrOPYr35E4HceLzd3QCIAvaoiN27X+WMX5pSKJQTFuXKTuK
	TpkEF7aIdbSzh0KQxXnyhq1YcN+J5PvYboQ2oApdU26ZNg1KdPBfhdRdJ1eXEgaZqvUkDMcoC7K4o
	C7wL0tGO+JWe3X6VvIxSDdmF973R9pWczwQVm0XdSenMxeAA5SKkiW3l3XOaf5AAWWXcsGMsOzM1q
	1+U6I/caB4S6TkCCnBjwX2dXB1TJiyu8k99mq9IxkIhjECCmqxBIoczviZ/ecANhXolFDmyZNhDRg
	cIAleS6SYLkXserOzLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyHZr-0084uY-11;
	Wed, 01 Nov 2023 20:12:35 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyHZo-0084t7-1b
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 20:12:34 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6b709048d8eso235753b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 13:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698869548; x=1699474348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XBY0JWp+fvBCeujtT4HwLCwKShpFadpYymdfioiLqEY=;
        b=O6Qp1OVTxqBz9DCiGDbu4sIDOhYcyam702shHo3Kb4BadPQs7qfjaPMtJTQcf/VCyw
         U0KOe//NZGmiyyPnARxLgCfXrD9YJStcqqEH88DE9pg7lfefDLJ/Hkqptm41mjkUEzYd
         795vZaQASLAkrG1ash4hGtnQw0JFuHZ0AIhlD3vGANsLqiuP5FHetcpdFgwjbAOiNh89
         mCanOQbr2WyP7W1ksEVRySq0q1mVws6hRDucc28RAFYe9xjXO0lGbJdQlAxh5cUDXeH/
         yboIaosiY2yiokqjmtxyx9VE6CQXi3PE7lr8AC3Bg3TxAv08PsmLbOla6gOEYbATTs45
         2+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698869548; x=1699474348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBY0JWp+fvBCeujtT4HwLCwKShpFadpYymdfioiLqEY=;
        b=J10t0nqkOyzO4ua+8TfL2TA8Aktk35yS2OX7qj7G4wlVbIsQACsfUifHMSgMxf/1ds
         4h3o5e6TM58Yw1WkUzf5qC1HsEht7D+YotESMjGe76uSn3PWqP26gIXmKmr9kTZ3vmT6
         Pde7FLgsJWgJoMFFzsNTH3IK5+okUaCRKZz7fSLDeEZNHZyYHDs6wx40ph1UpJ/VvCZZ
         FcT7c1usaDwEVWn1dAe0dXJFI/vwBe7BcacS0THdYekLe/c4ac+Ullj/rlz1Yn5Y4uxs
         pQ4H47vPksPqarU1xqZCSNbs1gZug1FmuzwH/w6Rgiha6lcSYAeiHVWORN9PNq13EVaM
         26pg==
X-Gm-Message-State: AOJu0Yyg7jhqxquYhdkD3eM6YeYnWAxTTwhk5aF8WrcNyTj2JjkWT4Pm
	CoIo45mowSutkU8kFm2Lh5Dt8Dmq3csPQ0e7I34=
X-Google-Smtp-Source: AGHT+IGZCGUcTXRTOrpzR95F1FXg0ZwWYA/hCUz78Q1veCMd1klHXEEda84Z+O8rabrVvTyQI5zB/w==
X-Received: by 2002:a05:6a00:1797:b0:6b4:6b34:8cef with SMTP id s23-20020a056a00179700b006b46b348cefmr15788129pfg.34.1698869547714;
        Wed, 01 Nov 2023 13:12:27 -0700 (PDT)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id u18-20020a056a00125200b00688435a9915sm1584901pfi.189.2023.11.01.13.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 13:12:27 -0700 (PDT)
Date: Wed, 1 Nov 2023 13:12:24 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	David Laight <David.Laight@aculab.com>,
	Xiao W Wang <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v9 5/5] riscv: Test checksum functions
Message-ID: <ZUKxKFlIHcxZWVKg@ghost>
References: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
 <20231031-optimize_checksum-v9-5-ea018e69b229@rivosinc.com>
 <be85f9cb-25cb-4d58-a0db-9b85af240bba@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be85f9cb-25cb-4d58-a0db-9b85af240bba@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_131232_537176_918EB991 
X-CRM114-Status: GOOD (  15.08  )
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

On Wed, Nov 01, 2023 at 08:14:07PM +0100, Arnd Bergmann wrote:
> On Wed, Nov 1, 2023, at 01:18, Charlie Jenkins wrote:
> > Add Kconfig support for riscv specific testing modules. This was created
> > to supplement lib/checksum_kunit.c, and add tests for ip_fast_csum and
> > csum_ipv6_magic.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig.debug              |   1 +
> >  arch/riscv/lib/Kconfig.debug          |  31 ++++
> >  arch/riscv/lib/Makefile               |   2 +
> >  arch/riscv/lib/riscv_checksum_kunit.c | 330 ++++++++++++++++++++++++++++++++++
> 
> I don't understand this bit, what is special about riscv here
> that prevents you from adding it to the common lib/checksum_kunit.c?
> 
>        Arnd

Oh, I can add it to the common one. I was hesitant to do that just
because it would affect all archs.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
