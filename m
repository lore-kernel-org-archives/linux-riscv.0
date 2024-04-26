Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24631C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoLd/HwmD7r1V+R5FiPdgGvE9BeT+1vvGHoCFStJZ8A=; b=zQuORsfP4vSyF2
	+s8d8r5C81yTNMIq7rv8D9TmHK2/Z6Qz0RUSFqH/WoeF9nDcwd2OkFDshlSzNT22N6ID2KYNRva1S
	9cXdiKhZxbnCCw2ZF+ZM7PSrKKYhHwaiufFOM1fSnhShmSHxqxtwSJy3zS+ytGmNVs5qn3vkQ0SX/
	c8UK+8/f3wsjxldkPw4WqJjYe6N5nfk8KIlyeOvwrTrtCjBS3HQyeMtMZewxMNjluL7WHnP/A4M8f
	ORGvXBwkOjNK8I2vB/1wXymTMU6s8muNomyC8fByj2zgaGHJrWJ4V3AcTXt5og0xG2DuxX5xaueFf
	3yCU93uIKM1XzanJ1B+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Qd7-0000000Dhpx-1TxJ;
	Fri, 26 Apr 2024 18:49:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Qd3-0000000Dho1-1O1B;
	Fri, 26 Apr 2024 18:49:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8397DCE1C9E;
	Fri, 26 Apr 2024 18:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A723CC113CD;
	Fri, 26 Apr 2024 18:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157338;
	bh=Hyt9cSwCpY4B/TYQfJ50zYLktchyWIPJ9BFUEyet93w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N7h4BKoZxJgQd9xVRuX/M86Dlrxi640K1yvD40sd6wIIt1B5wSz+Mr1057jFLkLm7
	 YZLxJUXsO3aGDcNsRJacV4WWKmENUeWDAGgelEEhQ25IisoVmsZjs2wqWO2oDQMI4D
	 uSiPujWrzA8VGIDR/ukvMt5azOqWqFDBQT80OwN/ng08krBNl8C4Y7bbqtWCLiYMMs
	 Ml7Mm3G2ZYOMxJWAhjUW9ZUeZXzqyXsxytjciMPlz0IZG/fa33C4c7C9ww3ptvMroe
	 tBefFgyrg4HjdgYCDGUZZv+XFU/Y1OA/hzEGUupM+8QfQ1YJfq2oXsvFywmF/2Inu5
	 uXrPdi7lPrPAg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a58e2740cd7so10374166b.1;
        Fri, 26 Apr 2024 11:48:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9Iyqiz0vapU1vL/eBojFdXzk3e8UDd1PKCm8BPBt4cAUCj7RfIxDkqW1Mjv8PG7on9NUhILDS8VImhKnnxDXzZUugPqU+QhOlDHTaNECf6O+gCIkn64koeFXElt8wcSP7WlDecO0TFx2eLZeAHSqUz/ToyWU=
X-Gm-Message-State: AOJu0YzvGs8QfoLw+AD5cLgwfry4RwQYffsLbD1fpm4oSMvqVDXWXJe+
	ncRMfwG1QRoxZQv8JCCLf+cXIvzqqyXUU1Vj/26J281WmsE53LSOUysbva6JKjKZfJ5Ors5PJ0I
	pJlYkdvPe/PDvugzKQtg5sIvJUD0=
X-Google-Smtp-Source: AGHT+IFMUG93L8El2Q8N1eCq6gv3PwlvgFwZKVcKUA/i/TE/TYvbrOCl1aD96inecCeUz3meYOs5/CsGWzmxgWNQdJE=
X-Received: by 2002:a05:6512:5cb:b0:51a:cc71:b91d with SMTP id
 o11-20020a05651205cb00b0051acc71b91dmr149470lfo.19.1714157316791; Fri, 26 Apr
 2024 11:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-6-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-6-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 11:48:25 -0700
X-Gmail-Original-Message-ID: <CAPhsuW75813E1MrdMYrqJXvuunbiJ046vT_EoReXA-60HJxT+Q@mail.gmail.com>
Message-ID: <CAPhsuW75813E1MrdMYrqJXvuunbiJ046vT_EoReXA-60HJxT+Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/16] module: make module_memory_{alloc,free} more self-contained
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Sam Ravnborg <sam@ravnborg.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_114901_746916_3186352A 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMTozMOKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoSUJNKSIgPHJwcHRAa2Vy
bmVsLm9yZz4KPgo+IE1vdmUgdGhlIGxvZ2ljIHJlbGF0ZWQgdG8gdGhlIG1lbW9yeSBhbGxvY2F0
aW9uIGFuZCBmcmVlaW5nIGludG8KPiBtb2R1bGVfbWVtb3J5X2FsbG9jKCkgYW5kIG1vZHVsZV9t
ZW1vcnlfZnJlZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCAoSUJNKSA8cnBw
dEBrZXJuZWwub3JnPgpBY2tlZC1ieTogU29uZyBMaXUgPHNvbmdAa2VybmVsLm9yZz4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
