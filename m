Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9217C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uh2B1FyBMQLBHSuehkxRhmBFEt1pz7AiFRZo3x/iHPA=; b=hwKO3eMVw0D93r
	d4eJq5PxJ53b/l5NbfUbVF4kI8zHpYbW9gInGFAAY+H+tnSycbaUI/zkFF4JmXzDoPMaFPLMUCSVC
	NWgsB9TZdRGBo4DoMfF758PzADtmGvROcCPX/RUvjijnXwQefmAq0XfmqasQRPd7psYKdusyJIKzG
	j2MtQG5nhue8a78Y1XsB0XiL5I03RDK2P4b2ndTO+GKyWcne4t0vue+0Ra4Uo/llC24LITNdRUl40
	zkfCaXsiTvcZ4zX91dfrgwiPfSYF0QsTA1DUtE6sil2aGuJN9IcTtoCArdg+rDBb2yOUeuHpxtuJI
	Iuna8HkABXeHvhQZEwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrHO-000dzd-R5; Tue, 14 Feb 2023 09:07:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrHL-000dxp-SY
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 09:07:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so10981599wmb.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 01:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbfAOEl06OR99NGfEFoVS3aDlJXydx8Xm+1KWeTVt3w=;
        b=zRquXGkMWQxsjnDEBjUSG+i3tQ4HS9mWc+qp3B0uER9rI+yxxkGNzBJJJiV3Uc7zDn
         Q/SIl930elCR4FLEZaUlUTER5P0EKYuYi7wU57oROLtYDV50OfmdspRi97sBkypI70dP
         po58UWXAjDuTr6rOOCXox5kdhQcDL9/ogCL3j9KU3d4ifIWTwe8unvDy8lerc6+lmod4
         qwNxvQ7OmxQjhgo8tWmfXCNS63ob4Zt+EmuTDM6lqufmEYJtL7S+0oYcsFKtDBysZ/kW
         iVaSdCu8rkK9JOa4zJmqTtkn2DyLcn71i/iBL0fmcxvBqvih825/Usphrecq1kQudKlb
         ntrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbfAOEl06OR99NGfEFoVS3aDlJXydx8Xm+1KWeTVt3w=;
        b=aY4qJSm/gxCvt7m2a5icGpTIiEu+IBCe/WmQDexOuIyol0sULOuivU0PRZ+ktUGasl
         OAgP96KJjviVFL+MhKhAy/Mk1J+JbMJYqEX4ctiu1uOL9NV32PEk1Sh1YF9GBy8Qik6h
         adT1jUX19LYlLbFXnnQd5Dnlrd0SvPASmczrQfTq9IYKd0Hr0T+23iPtUhQwrHWtjj7X
         rHW008WFYcmh7WxrTUKD+5qCYyHXSqywCvn8NhbIDF0pH8hy4sWW9m0BEb9QBJLWJFl2
         eaiNauIo/v+NLXYOxEszZGF7aHnBFsm6A1pZtBVMw6agR8xZLpCAJjAf+ytf9ZLenWOo
         c4RQ==
X-Gm-Message-State: AO0yUKWST7hwgiL8hGtX++D1Ox3NPWhqsw5qUZDw1c0Zy9Cfuw4sO4ZH
	prt5WLQxiAElbvHlcAbUlY6Qyw==
X-Google-Smtp-Source: AK7set8Wqv9ha6dIxkwRao9Qw+uzxpAx6YT4sYvT8HUQnEonxroJL/jacmiqSmbe1Ht/5qToQDlogw==
X-Received: by 2002:a05:600c:13c3:b0:3dc:1ad6:55fd with SMTP id e3-20020a05600c13c300b003dc1ad655fdmr1420116wmg.32.1676365630595;
        Tue, 14 Feb 2023 01:07:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id c129-20020a1c3587000000b003dc1a525f22sm17268744wma.25.2023.02.14.01.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:07:10 -0800 (PST)
Message-ID: <03a97cc1-1f8c-d412-272b-340e76858b7a@linaro.org>
Date: Tue, 14 Feb 2023 10:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 01/24] alpha: Remove COMMAND_LINE_SIZE from uapi
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
 <20230214074925.228106-2-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_010711_949977_2F23B555 
X-CRM114-Status: GOOD (  12.41  )
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
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9hbHBoYS9pbmNsdWRlL2Fz
bS9zZXR1cC5oICAgICAgfCA0ICsrLS0KPiAgIGFyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2FzbS9z
ZXR1cC5oIHwgMiAtLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBs
aW5hcm8ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
