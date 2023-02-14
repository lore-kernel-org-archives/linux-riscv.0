Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3421C64ED8
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 09:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQWlHipZZm1/Dvj8xacmi4cL/fYLz4mo6ByRJ94lKqo=; b=HfftuMvyBWCCd6
	xFz9Cy1/nhROKiGxX6R1/hSKh3/uEFGkBRJ9unwgSjend78qlJGz9YmmRW+iyt2cyR0ENNQJpHQBU
	meeDH4b9ot8q+7+x3P9ZPv2GsnHuypeW+R0LtxXb7FXTcKgn+HLqMh7wiqEaQq/zoDgQQSO/2N3k/
	eDPyLtj6uPl5Gc79tY6K1fnDv/FSJyzAIjW/rDMpGDbT4tsGR50EEswWen4Zxyl5IB6gZW0wzZfAg
	TsznjilOv0tZdV+FxNSu4WEup3C4SsbfGyAt9odIcMM2lL3ecV8QHUxVp9ctKSQK5ZXASkHFbhj0s
	jwyRYgib6V4QXsPwlg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrJ7-000evy-Qf; Tue, 14 Feb 2023 09:09:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrJ3-000eqt-AJ
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 09:08:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id m20-20020a05600c3b1400b003e1e754657aso4705647wms.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 01:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgI+MitPy4LpPY/kxOD/cgobRuJLYDph5veEhGksnEA=;
        b=lB62HMad+osyFa/YRShwy2xvQQhT9yfoc9RwDPDM2XUSGGo5hotMUJADGxDiQ5/oie
         0UWu3aWkXWJPzO2vTsakK1Ei6DOuBI3AmUwSmqLUQ8ZTe80+NCQDOZ6/jIcjNALXtEWB
         myMm5/pYMGpx0868z9pwpjeJrpOhJ3ovmzXzQhl2yeLNk8GtyTunjqqhJ50Jqwbk2KBA
         nUku1vRER3frC96KkvlnDaokGHBYVCdqUaGsTL3zenSy+/9/+IU0+RrXFmVs8uRAFld4
         BkpKIHPTos+3uB9tCP+/qrZBOcLM/octf0KKmtrOqlUnOOZdPlOJ+FnLVLjXXtr1QHtR
         lZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgI+MitPy4LpPY/kxOD/cgobRuJLYDph5veEhGksnEA=;
        b=BPsW8T0u0RykRASMRKJ6S/Wg7jbasWOI0KFODM2JieQTJdxy7RIWAYN49nASY9kPAz
         wFZ+XYsWo22GTd+Yx+VxdALRAbH5XFqtu9p+pdkGs5mrp7/Gul83RLpreFpu9UkCZcO1
         4lYmqOXW/UyPn/vxXNCZR2EvCyZzDlh8JQXAyaE44hwQ1UI0j+DpBDJC6/nVMEwGl8aU
         FtKz+3pgLw/ge2XeR57AyqPf4oM3cHtRI2SpXptcdgXa1AQc5wN8xe+cGPi0HNMXIpmC
         I9/I4d7q20xFf18dOG48LxvwvPYWw5+RL7R0t07GTHPZEHfjrGN0QNwm+tMs1KlkE8Zt
         mXWw==
X-Gm-Message-State: AO0yUKWL0lZZuF99JSQvKxzzOdkqgFyYXev9OhnBUnbYx0Ih8L7/SlUj
	MyM2SbdBtOmdrVaTCPopkkJFgw==
X-Google-Smtp-Source: AK7set8HRSS8W1/cKITusqPpdx9jDHZBvQKOiM1WFF89CfxkBUxGtw8QxLzPMCmfytpLrqWBoPZ9zg==
X-Received: by 2002:a05:600c:3423:b0:3df:e4b4:de69 with SMTP id y35-20020a05600c342300b003dfe4b4de69mr1515046wmp.27.1676365733617;
        Tue, 14 Feb 2023 01:08:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id az7-20020a05600c600700b003dfe659f9b1sm1519398wmb.3.2023.02.14.01.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:08:53 -0800 (PST)
Message-ID: <6f9c7a6b-4f6b-dead-2d9b-14b405f18397@linaro.org>
Date: Tue, 14 Feb 2023 10:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 19/24] parisc: Remove empty <uapi/asm/setup.h>
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
 <20230214074925.228106-20-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-20-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_010857_391378_032A4691 
X-CRM114-Status: UNSURE (   8.75  )
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
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9wYXJpc2MvaW5jbHVk
ZS91YXBpL2FzbS9zZXR1cC5oIHwgNSAtLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRp
b25zKC0pCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBpL2Fz
bS9zZXR1cC5oCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBs
aW5hcm8ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
