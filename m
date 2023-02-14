Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D9AC6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=We+n3MYx62z7xGY+YdTiaIZEB1uuPGbC+DWlP4z4j6E=; b=yhJSDlelNd5yYH
	BEg8io92BJNXB6TM2E6rYCck0xatD+/CdV01Zyz1hy+hT1AQA8dYF+/qz352Q3FvcwluJqo2PZmdz
	1oqbagV7FTz5JWDDhyvnplptFCe4nzyUmfPS8soTs2kHfzUXwlewzB/kRAt0ww9Z6spFdb1/Kl4t5
	Fx0u9n9bVaXOcXSFTre98M06mHwy31aBLAMQG74vIsNAfmTHSZZTOa/YVn10yk7fbz3fpBRsiVFIA
	Yrzgw/zPcgSXeoZIA88xg60kkPbhEHzkcX3SfTsTWbIlBPqXyakdTs1H32gUw6u+lN029Dcgk2MXp
	LkefHBN2mxz91dS4bchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrFG-000dDW-13; Tue, 14 Feb 2023 09:05:02 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrFB-000dAB-DP
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 09:04:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id o15so11550162wrc.9
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 01:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZk18aUwfr/crPnHPA/QNPK0H4tWzNL+2OmakVamCi8=;
        b=FuqeOAA0zOBxZDuVrmVbvP8dKvoEf0MRrKKfm5NpFSyLOS1syMedD57gIqKmrL5zko
         qHpdqh+1Qi4vk3xY+Y+b00Y3rfjpVOFAPuWKFoaNHXYX+NhTIfQLIuO5WcCVUFUjRwy7
         xMFDBg0c617IjgdOAOjwaUswIiGz5V4UI7DfJ8LBDe8ExR38WilQf/7hqV4J4nMfP3dK
         +NkXzLhRfCI4LG9OC+J6fTkyG/7he+OYSDs5hlMQV6UXzYF2Dol240t6thsBMIDBZKNF
         mf4lP1Tmk2bhebKijyv57HPqf77+Ml7M9RiO9cyGc/K41l5a0L/IdrW6ctCufCt4MQrg
         Mpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZk18aUwfr/crPnHPA/QNPK0H4tWzNL+2OmakVamCi8=;
        b=vh5TcDBYidH7ytA2BXZH0GWSUDSLo3/FoNsCOr3zmXz6Oo47aJccrpexnJV0LtstUO
         0qXNTOLl1DYIz15W39BnRWNMlskXEKyqsh0l4UL4BH7cXEbA0N5dqM14PJCOcs+Kf+DN
         Trefon016hXfDk78fxHbt0gbTR/a2ZkJkJXlaaVM08LKgPWBthERkDEItME8T+cgI5zo
         1RzHg8yoswWZdzXRCvyo3gbdKshl+4KjF1siMkncwKx0Mb22fs9+vzf9HndRv1Y0x3Qg
         gw9CHSSypySnAT66RDcl3a8c6OgjA/SuXRm4CEVkSDFcMAcK39PamIZdCVwtl33wDnzJ
         UPXA==
X-Gm-Message-State: AO0yUKV4SUIGvwy73uJmOZu1Zs/OS6sZ2IYCjdumMpki+Iw0qgPOFXJd
	bPGqHt6YqwZ0yXohs293n6Wxiw==
X-Google-Smtp-Source: AK7set+jlADAGeMno/J4b9rMaQi1OSFbGE2cOeHJ3WYCoMJkKRkmj2/GQpc+G+sprep4ghyf/aRSVg==
X-Received: by 2002:a05:6000:8b:b0:2bd:f5bd:5482 with SMTP id m11-20020a056000008b00b002bdf5bd5482mr1310606wrx.28.1676365493352;
        Tue, 14 Feb 2023 01:04:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id d13-20020adfe88d000000b002c54f4d0f71sm7494931wrm.38.2023.02.14.01.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:04:52 -0800 (PST)
Message-ID: <a018ab25-b545-1227-951b-a7b4e1c25d5e@linaro.org>
Date: Tue, 14 Feb 2023 10:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 20/24] x86: Remove empty <uapi/asm/setup.h>
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
 <20230214074925.228106-21-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-21-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_010457_478307_A45D62CA 
X-CRM114-Status: UNSURE (   9.61  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQvMi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEZyb206IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC94ODYvaW5jbHVkZS9h
c20vc2V0dXAuaCAgICAgIHwgMiAtLQo+ICAgYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9zZXR1
cC5oIHwgMSAtCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gICBkZWxldGUg
bW9kZSAxMDA2NDQgYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCgpSZXZpZXdlZC1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
