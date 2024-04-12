Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2925AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfXnN4wkqGlZIbJBzMDUFBV+txPyqCqW1yZzKRL6yO4=; b=VaoR9ahP2bd5GM
	l980zdo8NqiNta/42mxRLHCnKvKzI0tDjqI5ogSRRrfOesqhIpr8CmugllUP+ul/PhvowS6YnGBuZ
	omm+yGeHKSDfcsWLUDWzbDnFQH2okpkXrJNlqE+3qUOtnM5516K/GowAtHG6mmLqt4ZY+x60obiWG
	ZxDT4I3X6P6GXmkdSA9lHG/1qkaQfXSoHjBoE5uqfbqA654OiqfoFKmCjC3cy79IXacsqdhwOEnXK
	W3aaOTBOxUyzr2UJR2YKmiye0u69sdy8sbrpGpsMKkgAcm4SRMEVESGKOnBAJgJ8X2USXRvNyueNP
	aC65ThBuPbFCTkUUUH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCtJ-0000000GIpf-2XcO;
	Fri, 12 Apr 2024 09:08:13 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCtG-0000000GIms-175M;
	Fri, 12 Apr 2024 09:08:11 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a46a7208eedso89413166b.0;
        Fri, 12 Apr 2024 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712912885; x=1713517685; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPUGnUPFGvIHpfCf2GVNK2vLyHGdD2DrkaoFCTmwcrI=;
        b=LGUL+lYO80Dqcm6nPLalm4WuTFr89dZ6ODzMqqP0FzXAyKCenk0v7CLIeLULluw+uo
         cYSGPsUg0OCcJSRFgcLq/ZuSCDA6S5kmo/v/1P2xBveKYENn6CJnL83wRpZbNNpJo+qy
         VDH9DirYH1cQcodeG2S0H1ibfhxWKK2OgCG/afI+kZmfQtHgoSdM4hOIUL84pIre40VH
         n0YtpJ8gJX+U3eqColyEZSTbh3eD4uP1gBdn03kwU9clnzOiPGNlQjmywJmzUQoed3XM
         WKfi+tHQX8fgr1cCOg76OaWDV0S60f8yTKP/OQ7D6LdW72o64+VaD2OYuwIODHmuao0k
         XWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712912885; x=1713517685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPUGnUPFGvIHpfCf2GVNK2vLyHGdD2DrkaoFCTmwcrI=;
        b=lb+RZ2RTKQ0TEv9xMLzxQCmP/hqFWDbDKEru3VQ0a/txv94foCoDoyuwEaslMkAzld
         AbdMLKJwf5DY5TbckeDzl5ih3vV/dbFijtmRsJ+LnvuGjqTwgEO3KkyYqHe1hV8B2Ffx
         1Mc0yLsLU0wVD7mbzL2XPx/HBZIaoT27qpPKHBlLWPJZwHXECuCW+fAxCIvHq7wBZMZp
         mwlFH06kvLKasrmVVIaOwU9k6NSvVMTDNhj2kibZiVehvsiL1l/ikYuHrAa+2+6R8lgh
         RkBsWsAqgka/PNLdLBxwV9Ejycjz7yLiqIETIK5VwgGq/aTsBNSJf9ka56CFQyz7RoIj
         x2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCULt5uBuO4KRBnccOj8BRg4bDO+K/EbE5slmZ2EiGBMatZZnepciuM+u/Jcqf0bfivGGZ2e+uPjz3/5m6uH0rJfmimbWAXBAIsIczY+OBPKyMJ58GJjK3OhlQCdlahHkovPMT8HeE/yA2oDMupH65Kwojuc8vg=
X-Gm-Message-State: AOJu0Yz29h7lpOs0oCqJuYD2qd80an3IczVPMJqfjAwuxFEQE2AIYLXl
	ZRklrF5oPWK5rM4Q8UZ1FRqRpxyG9QtzmJM6nSHrLA8FmMg6mrtM
X-Google-Smtp-Source: AGHT+IE1JXTG/LcQoI+lnHKGTMryNiPMKyUlJP80kVd4eHhaWi8p2N8JmnjvJqW2HLQ210FFl8qPZA==
X-Received: by 2002:a17:906:345a:b0:a51:80d9:56de with SMTP id d26-20020a170906345a00b00a5180d956demr1236428ejb.5.1712912884326;
        Fri, 12 Apr 2024 02:08:04 -0700 (PDT)
Received: from gmail.com (1F2EF1A5.nat.pool.telekom.hu. [31.46.241.165])
        by smtp.gmail.com with ESMTPSA id zg22-20020a170907249600b00a51b18a77b2sm1572994ejb.180.2024.04.12.02.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:08:03 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:08:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>, Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [RFC PATCH 5/7] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <Zhj58NVS/iQnPeIq@gmail.com>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411160526.2093408-6-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_020810_348983_CAF79B7B 
X-CRM114-Status: GOOD (  10.22  )
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


* Mike Rapoport <rppt@kernel.org> wrote:

>  	for (s = start; s < end; s++) {
>  		void *addr = (void *)s + *s;
> +		void *wr_addr = addr + module_writable_offset(mod, addr);

So instead of repeating this pattern in a dozen of places, why not use a 
simpler method:

		void *wr_addr = module_writable_address(mod, addr);

or so, since we have to pass 'addr' to the module code anyway.

The text patching code is pretty complex already.

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
