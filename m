Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58EFC677F1
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8/F3msqm0NrNdYgSMAC5TGyQPHXvQeuLneDiBVmlgY=; b=wTxmtPEHroYsDy
	fIdciAoTkHq93W83FHMU6vOgKatOZuS+lNnc5rcun5fl0zkybjMumiWJplGwg2gualSvY9VbLu1R0
	tDmcLyARv2T3Rfl9y09/Q6KVOpya/W7ZvLmTWox0dn4Ex+fhxo6A1vL6ohWw/4psS+SnKQyz/K6iM
	IzB4BxnrA04KHxoyvMTrZuSvwohvR1/QEktLuqf3Q7CmYHHTPNPUDCQt+0QZ1KW+G4f6Rn3QPaHJV
	12j9MkYiBXVe+P2Y33iK+3OVKP3ylf3WHWb5C8gn/Gr6HWQRSuvfhm0RlXwfh9pl3a7aDVM0XjXBz
	23vnEQyM+7Fbhh88g0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrIV-000eZT-Ua; Tue, 14 Feb 2023 09:08:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrIT-000eXQ-4c
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 09:08:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id o15so11560204wrc.9
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 01:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJq3RRMzf3lbuS5bgQVc8NQ+nEsYjE4jNGYbXmQQw78=;
        b=Wsp4Zlb8V2Jx4m9+tXkDNgf5Lxau03xHaG+6WGxc+G8HrcJltAE2Px1QSC5XUlVOpz
         2Ng4jqNhjAJ4QJFwe7IYqEDhVP83rKHt0zthGOU/F+j+7d3lCfNC+HaTRTHh98F2fr7Y
         I1aHMaHeLfbmf2lAE+TKEJNN/s8peiJT6bIUpf+6MkHhRn0aKlK4U+gulZSfiKfbW+Eu
         wBNce34+0fI2Gh7tFdgEA0vsetKVHpBVYQ4d3RHWTRqruuVixLinnhKVyILNuRuoZPxH
         SlDA849VfSADVOOeo3f3/Yud1fZ/0yd8ncI6fO9i/ywnDuaYO8zFs36ALYL690/jjvZv
         Clag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJq3RRMzf3lbuS5bgQVc8NQ+nEsYjE4jNGYbXmQQw78=;
        b=HOJemIDsU+EFb//6IBcRoCOxCtQxFxky8y2sChZIryIuFG+uWT8KGacbcOyl50Ejmp
         4s4LDtEJ9DjaNJBAAp4pPP0NsCEhx6C/rdGGharR69FrkczIXpp+hBPXkhOwltKTlriZ
         3pCAivwcwnu6LvHgFfU1glqfFt/jQBdqX5ipkmOIb9eWu5KmY8UfR71WHlwzVLjVkffs
         9F+1MerPFG0LyiP3CTqtfL6tCCiwXxO6a1Ad+s5x5nyMjtC8I/BQ8dqWgieDnm8AfzNH
         ijM0eXpWln/3FYN9+v9wtEAec9SA4EQ5cJVCBuxR67rdNbHgmBIsKxzz9NasdVaLeMka
         KM0A==
X-Gm-Message-State: AO0yUKU3OhYepY1Y4yu5b6gVsf+xGJTqdpUCyGv4siAOZbOAvcYCyyai
	zpnBodaLVdK8BCMnaRJdtvpfoA==
X-Google-Smtp-Source: AK7set9xlomseTD4h4a83sLRQq4DtapmagaqXlgE7UNo4UXcLklpQodFpnducrj9Vfa/kRz/NDHZaQ==
X-Received: by 2002:a5d:4e01:0:b0:2c5:5a68:958 with SMTP id p1-20020a5d4e01000000b002c55a680958mr1356559wrt.33.1676365699836;
        Tue, 14 Feb 2023 01:08:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c3b8d00b003dc434900e1sm17810977wms.34.2023.02.14.01.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:08:19 -0800 (PST)
Message-ID: <f327ff48-cd50-4caa-1bea-f9906994e998@linaro.org>
Date: Tue, 14 Feb 2023 10:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-9-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-9-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_010821_210745_E321D560 
X-CRM114-Status: GOOD (  12.50  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQvMi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEZyb206IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsIHRo
aXMgaXMgbm90IHVzZWQgYnkgdXNlcnNwYWNlIGFuZCB0aHVzIHNob3VsZCBub3QKPiBiZSBwYXJ0
IG9mIHRoZSB1c2VyLXZpc2libGUgQVBJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9wYXJpc2MvaW5jbHVkZS9h
c20vc2V0dXAuaCAgICAgIHwgNyArKysrKysrCj4gICBhcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkv
YXNtL3NldHVwLmggfCAyIC0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3BhcmlzYy9pbmNsdWRl
L2FzbS9zZXR1cC5oCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEBsaW5hcm8ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
