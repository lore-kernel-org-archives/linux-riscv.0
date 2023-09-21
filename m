Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2350E7D0AB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 22:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TySW7Mp8rrBBAxX61mE5bRCDq2TLe94BH8S94F4ePg=; b=UOOvj/oDb9DHoi
	QVoqgS8bB+DeV+Sv7lkp0jgy/AJdLgFO9p8AkVd1T6gMQ/FChh3aAB294lw7ZHUiBwC9plImSCLeB
	+jpm59fUJPO+bE4b5MFE7HfT7iC4XbSn5bP8R4pgx8g3dsdxu6JiSWdHSs0RO01K5RYfvvdEle2ex
	f4NyLCUxmQXi1UmR57VX1vUT1hQtcre/8Jkl3LDO+L46HUeZn97dxlOLm80uJN5e1sIsrP4i0bUms
	z3cBjLq/IHOEM+iQtGmoAvBN6EczzzPUarRe/SWPPk+hKsZuafjYj/0rA+9uWYn/Jtf+17pcPJJgt
	cxh59oJ+y/oAWnOLDkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjSCW-007Inj-0w;
	Thu, 21 Sep 2023 22:31:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjSCP-007Ijd-1J;
	Thu, 21 Sep 2023 22:31:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4513E6210F;
	Thu, 21 Sep 2023 22:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF12AC433B7;
	Thu, 21 Sep 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695335460;
	bh=MM21fpAAqNycTt4Xaf9NDcGQ0SQTcft6//RqlmbkVyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BJxXZzf/aXubyQy2npZARHLDDjhgoXgiIEWqva3Fcvcj9zcoZxEU8fccdvHJ+HE1c
	 zzl8qTcUY9d4Go4O1phE4VHiUrxF82TprIMut63M6/i0lBXABCB/bZlTOwWqPbu1BQ
	 q5zu/0Z8B9EGkvCak3DZShCJdshYKc/r/AcXEeYIu2QyWVYI9Vx+BhQ1n26cL4/b0+
	 PS4cfkMveOYxyjpv6hbMeZ6FHOjVVnzGDFbwXlAgoIyH9v7qk7z8sPhWkYP6GlWWax
	 6oJu48Ae0Rkgt9SjGUY0GxlfVZDTstOKna+Ts701hrySxm3sOn2mvMBH6VjZ4iOt+Q
	 WLPXTkK17R7VA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50337b43ee6so2400563e87.3;
        Thu, 21 Sep 2023 15:31:00 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw2RTC2BN2sPSCXsrW1HpwUit1iMDo42Q+LfA8o41y20ZtIJ1e4
	b5+xoWgEBiXpDMI5TvLcat05pX40+2+DcXSN27Q=
X-Google-Smtp-Source: AGHT+IH8pmyQuqpvewRyL7QPTAL4jcebA+VNDdobgdjzXZOsPDkVCcZQaQNB105RzqTdIxkf8GblFKytjbdsRKyccPQ=
X-Received: by 2002:a05:6512:10c4:b0:500:7f71:e46b with SMTP id
 k4-20020a05651210c400b005007f71e46bmr7439120lfg.1.1695335458957; Thu, 21 Sep
 2023 15:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-10-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-10-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:30:46 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5Vg7yDn8zb5ez4JY4efoQ6aW+vYm9OL+Xr0NJnLfMYHg@mail.gmail.com>
Message-ID: <CAPhsuW5Vg7yDn8zb5ez4JY4efoQ6aW+vYm9OL+Xr0NJnLfMYHg@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] powerpc: extend execmem_params for kprobes allocations
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_153105_532307_70038CAF 
X-CRM114-Status: GOOD (  12.58  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTI6MzHigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+ClsuLi5dCj4gQEAgLTEzNSw1ICsxMzgsMTMgQEAgc3RydWN0IGV4
ZWNtZW1fcGFyYW1zIF9faW5pdCAqZXhlY21lbV9hcmNoX3BhcmFtcyh2b2lkKQo+Cj4gICAgICAg
ICByYW5nZS0+cGdwcm90ID0gcHJvdDsKPgo+ICsgICAgICAgZXhlY21lbV9wYXJhbXMucmFuZ2Vz
W0VYRUNNRU1fS1BST0JFU10uc3RhcnQgPSBWTUFMTE9DX1NUQVJUOwo+ICsgICAgICAgZXhlY21l
bV9wYXJhbXMucmFuZ2VzW0VYRUNNRU1fS1BST0JFU10uc3RhcnQgPSBWTUFMTE9DX0VORDsKCi5l
bmQgPSBWTUFMTE9DX0VORC4KClRoYW5rcywKU29uZwoKPiArCj4gKyAgICAgICBpZiAoc3RyaWN0
X21vZHVsZV9yd3hfZW5hYmxlZCgpKQo+ICsgICAgICAgICAgICAgICBleGVjbWVtX3BhcmFtcy5y
YW5nZXNbRVhFQ01FTV9LUFJPQkVTXS5wZ3Byb3QgPSBQQUdFX0tFUk5FTF9ST1g7Cj4gKyAgICAg
ICBlbHNlCj4gKyAgICAgICAgICAgICAgIGV4ZWNtZW1fcGFyYW1zLnJhbmdlc1tFWEVDTUVNX0tQ
Uk9CRVNdLnBncHJvdCA9IFBBR0VfS0VSTkVMX0VYRUM7Cj4gKwo+ICAgICAgICAgcmV0dXJuICZl
eGVjbWVtX3BhcmFtczsKPiAgfQo+IC0tCj4gMi4zOS4yCj4KPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
