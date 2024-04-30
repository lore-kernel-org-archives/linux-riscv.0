Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270A9C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 12:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1U3I+SM7u4CRIh0gz3B1dbE3lfy8qDJE7R6wKkWnrY=; b=dUCO+HpBtDrN6x
	XVWcVC6Neon3y4FmB4y1xGMZM7t4eYMCeKwGutIlzmKMZF7KRSey9HWVz1/uZD0TTqgvNxEf58xB3
	oPbFfgb5jcuulnawPhc52Iq4T6lv8dOCT008f6VrRCbgUYuEg4BAZxYhSu/PNBQnkQqBFlzPD4pdC
	jhg3KX3mDHlEtGuFpyvN3i6Oi67AjDfUvyNqFGjS0p+Nc464/+iTLqSB1OMhuM6lorKYMtMwj64ko
	ypB6to93WvfFvcZwHppBDmj+On36bCjJaltSvkwEfFnmKqzNqhtXl7PREr4gvI0c25Wm0olb57B6J
	/XSOxqG26qJSjO77lVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1mnd-00000006MYZ-2Z3u;
	Tue, 30 Apr 2024 12:41:33 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1mna-00000006MWA-046i
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 12:41:31 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-51abd9fcbf6so9422492e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714480887; x=1715085687; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1zoRl9JNX91wxTFZ95WC2aOVdcvQqQ9ebO1YgbX9Wg=;
        b=EiG6zOVZmz7AEnFyR8H6D99DMeu51xcDj9QnTNti/eFrKGnI0/hMUbGO+oPaa9OXxn
         WpSdYxxtjZLx0LpLsfsycNdNiCYmm14v30vy/jkgzajgrKv+34M4xxisRAjK/ni+MhPB
         /xt/yPeuV02xSxPONXtWsAqKkHS8UuXmNqmvDIUnvF5t9JNxi4PhKMj87V752oQbbDlw
         2Hwro4Ki6vfRTUkV+mC48iv0M516C+iiXJbR6nJ8ySbq4ZkWjWXbIYX51rdfGDdP1ppb
         Y2DL/pdy3tB/fFO9WOXss2S+Stkgt4ytqmeO6DEbEx/aU3Doyjk4BFk4s0oxNxokxuN9
         eZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480887; x=1715085687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1zoRl9JNX91wxTFZ95WC2aOVdcvQqQ9ebO1YgbX9Wg=;
        b=W4rEBq9cfflSs2ExB3PNLeYQOT0MDbQxAi/f3TmIulkK2Ob+r16/XNiT8DL140zQLI
         R+YIAirqWtGgciqse4CcMQap61O5pYwvNETVpcvaibhUvfltbXmYrFXKDVHWPBk1GxOH
         AagOrS08Y3NZgAxOkN1MC6AN+GT5cFSSNn87UwHGyLlk3wXBQ/wSIDM31noMaNQbKIIR
         vecPh+H6gyf5WbqimFaEP0+Sxo9S25oQbqLW2EVKi7SLSybhj+z6kJPiHlDN20xHNiU5
         eP+wjEiaxvfRyOl1JsE13zNw3mPg5fEjAeN7OLrSIv/v/W7Jq5Q8J+MSUTm9Wu8RHrif
         pwUA==
X-Forwarded-Encrypted: i=1; AJvYcCVVoa8l5zAxxr/9bfmCRHgsNZTG20yTpTUeLPcJa1eQNUvn58tvASTbjunOWKofdVbs94wQWW+x/oG4zpEhvksF/zvftbHlmV0+yA9hkWKa
X-Gm-Message-State: AOJu0Yw+5ZGtGO8sRJhAgEV+S+2REr3brLGDf3vrWU7qwLJBHHIAwz7a
	FS6G+EsnTOv458rlfIEhCLruPF14gmrXi2uNNAWZu/wg4UvfuKIPuE1FYqc/odg=
X-Google-Smtp-Source: AGHT+IE/W9/dkxBso0irV5VrVX3LkNO5o5h+kLfYM+38G90SJ9h02blz/dj31DJFXSXcVMXms6NQew==
X-Received: by 2002:a05:6512:45c:b0:51c:2c7e:ac92 with SMTP id y28-20020a056512045c00b0051c2c7eac92mr11527071lfk.23.1714480887229;
        Tue, 30 Apr 2024 05:41:27 -0700 (PDT)
Received: from [192.168.69.100] (mab78-h01-176-184-55-179.dsl.sta.abo.bbox.fr. [176.184.55.179])
        by smtp.gmail.com with ESMTPSA id i27-20020a17090639db00b00a58eab2bf0fsm3928326eje.179.2024.04.30.05.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 05:41:26 -0700 (PDT)
Message-ID: <c5248d22-672d-4acc-9b12-86815d6e22dc@linaro.org>
Date: Tue, 30 Apr 2024 14:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/16] module: make module_memory_{alloc,free} more
 self-contained
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
References: <20240429121620.1186447-1-rppt@kernel.org>
 <20240429121620.1186447-6-rppt@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240429121620.1186447-6-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_054130_211122_39C56597 
X-CRM114-Status: GOOD (  10.40  )
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

T24gMjkvNC8yNCAxNDoxNiwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBGcm9tOiAiTWlrZSBSYXBv
cG9ydCAoSUJNKSIgPHJwcHRAa2VybmVsLm9yZz4KPiAKPiBNb3ZlIHRoZSBsb2dpYyByZWxhdGVk
IHRvIHRoZSBtZW1vcnkgYWxsb2NhdGlvbiBhbmQgZnJlZWluZyBpbnRvCj4gbW9kdWxlX21lbW9y
eV9hbGxvYygpIGFuZCBtb2R1bGVfbWVtb3J5X2ZyZWUoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBN
aWtlIFJhcG9wb3J0IChJQk0pIDxycHB0QGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBrZXJuZWwvbW9k
dWxlL21haW4uYyB8IDY0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0p
CgpOaWNlIGNvZGUgc2ltcGxpZmljYXRpb24uCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
