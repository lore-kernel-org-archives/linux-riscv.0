Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10835C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNauXQJBFF+C2K9b9ayw7GrvtkiRYvvYwx5MziXwl5M=; b=sq9UtoT3eCl5Mc
	DoAbGbub2KpEj/aU1iamofZ71UtguYE85uHVffY4PX8IDnu6xMPvJNyr0fdl5+2kl8VFCuoYjvSJv
	4aTdUO9sYZMHMIeBV3zAEG1jARQRk6/NOqr7GJIlMSecfMSr339Q3k/tsXyDdZNgblS1SPH0PFVnM
	ymRz54eXRbxHZ6MH/VV6ukE4BNqKCgdU1G9RiT/oN2uQZJyEbpmJduR7ts46UbDL+M4bigEchg5m+
	rO+57jFgaVgVkgAQqhd6PPySDPg2jY3O590gxje0eKST3hVXfF+TQ9IVq4ATDpxEBLB76jPZFhsVC
	FfGtrEwOEiHe/FchoLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0eaD-003LJr-22;
	Wed, 08 Nov 2023 09:10:45 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0eaA-003LJ6-0T
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 09:10:43 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso8992887e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 01:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699434638; x=1700039438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jcINFlc5Bxzgrbc4MTS9NCkyZbTVVfqU+tkYks0UGuM=;
        b=KY8N4jA9TPHMtxY6IbCXAXKkbKhWtAe5Ubqi0HfzE829quePdD8MgT3whgI1Es52NK
         OAGhrRmnCn9AhptX4Zreggfq5ayVUqr1hxOzLtlemAgQTZdiU4nUGIgFdZ0dORhX/dhM
         WSfmVTps8Vh00xNCYAJKofB92LOy+zHjsxnNJKyTo37PdfJ4tLS5RmrHtZPG6d0n/sbN
         Vra8pzaBoIoyGRjrPuEwWtp2/8IwAF63t62dnxuPd2woiYkr3yApo3VZNf4Ek61rwj+6
         D0hlCMAq6k6OV0ZDsLA1yaA3h1d9kfXBgZaYDnsKf2Bh8p5SkcMhlcr3hxDM7zt3laIs
         9tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699434638; x=1700039438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jcINFlc5Bxzgrbc4MTS9NCkyZbTVVfqU+tkYks0UGuM=;
        b=lX9qQq9fTMkk8EAVNPlqTX3a0Q2oqW8PNZYL03fKj53W3dexDdybewNOwwwtCMxabO
         LMqVu+iEDv9MkqiGy6uNokneEx7QAOJgywy9GN96GazalligQDBA7zCLhaLzyIWSqdNA
         VaVW6grHE5vnlJFtzO4ga42zfomnkB/0siL8HH7E6nfh2rxcQm8TH4VYOY0lFfeaWsRH
         zJ3YTGoJncGZE529oDazdkNttzh25IucpYJXKrXV4TLTgQZU3J5Kv1c7i66+M1zYsD43
         Z7Tt4YbTr0IK1N/HCNr853ZqMHkowu/UTbSLaxVUNZ5gHF9FDGKCOi1yWEFPuVR9hY5o
         7lJw==
X-Gm-Message-State: AOJu0Yxld8O00h/k20G0IX35jzDADIQa2kFdy/idf7CYeBQac3oVSPcF
	N/vuHi39T4hp1bT+P55fkmkyYg==
X-Google-Smtp-Source: AGHT+IFWrJhq0yyPZFGkfsmVVYe9rpitNrcZX/tgpoj4oWjopGFCXaydqgPa9BfS1sjHZGerGEiZTg==
X-Received: by 2002:a19:4351:0:b0:504:2d54:b4d0 with SMTP id m17-20020a194351000000b005042d54b4d0mr788039lfj.19.1699434637594;
        Wed, 08 Nov 2023 01:10:37 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:55a2:c282:5ca3:a855? ([2a05:6e02:1041:c10:55a2:c282:5ca3:a855])
        by smtp.googlemail.com with ESMTPSA id y11-20020adff6cb000000b0032fc609c118sm4397265wrp.66.2023.11.08.01.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 01:10:37 -0800 (PST)
Message-ID: <1dd3d765-c583-4db9-a0aa-303bfcf871db@linaro.org>
Date: Wed, 8 Nov 2023 10:10:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Walker Chen <walker.chen@starfivetech.com>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
 <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
 <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
 <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
 <540136d4-6f8f-49a6-80ff-cc621f2f462b@starfivetech.com>
 <65c38717-3e0c-46d3-a124-29cae48f1a2e@linaro.org>
 <72ad5029-42b2-481a-887f-8f6079d8859b@starfivetech.com>
 <a8f0011c-5689-4071-b5e0-90bd6b7c66bc@linaro.org>
 <b402eb4d-a770-4988-8274-8a2544362229@starfivetech.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <b402eb4d-a770-4988-8274-8a2544362229@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_011042_204337_9B4859DC 
X-CRM114-Status: GOOD (  15.23  )
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

T24gMDgvMTEvMjAyMyAwNDo0NSwgWGluZ3l1IFd1IHdyb3RlOgo+IE9uIDIwMjMvMTEvMiAyMjoy
OSwgRGFuaWVsIExlemNhbm8gd3JvdGU6CgpbIC4uLiBdCgo+IFRoYW5rcy4gVGhlIHJpc2N2LXRp
bWVyIGhhcyBhIGNsb2Nrc291cmNlIHdpdGggYSBoaWdoZXIgcmF0aW5nIGJ1dCBhCj4gY2xvY2tl
dmVudCB3aXRoIGxvd2VyIHJhdGluZ1sxXSB0aGFuIGpoNzExMC10aW1lci4gSSB0ZXN0ZWQgdGhl
Cj4gamg3MTEwLXRpbWVyIGFzIGNsb2NrZXZlbnQgYW5kIGZsYWdnZWQgYXMgb25lIHNob3QsIHdo
aWNoIGNvdWxkIGRvCj4gc29tZSBvZiB0aGUgd29ya3MgaW5zdGVhZCBvZiByaXNjdi10aW1lci4g
QW5kIHRoZSBjdXJyZW50X2Nsb2NrZXZlbnQKPiBjaGFuZ2VkIHRvIGpoNzExMC10aW1lci4KPiAK
PiBCZWNhdXNlIHRoZSBqaDcxMTAtdGltZXIgd29ya3MgYXMgY2xvY2tzb3VyY2Ugd2l0aCBsb3dl
ciByYXRpbmcgYW5kCj4gb25seSB3aWxsIGJlIHVzZWQgYXMgZ2xvYmFsIHRpbWVyIGF0IENQVSBp
ZGxlIHRpbWUuIElzIGl0IG5lY2Vzc2FyeQo+IHRvIGJlIHJlZ2lzdGVyZWQgYXMgY2xvY2tzb3Vy
Y2U/IElmIG5vdCwgc2hvdWxkIGl0IGp1c3QgYmUgcmVnaXN0ZXJlZAo+IGFzIGNsb2NrZXZlbnQ/
CgpZZXMsIHlvdSBjYW4gcmVnaXN0ZXIgdGhlIGNsb2NrZXZlbnQgd2l0aG91dCB0aGUgY2xvY2tz
b3VyY2UuCgpZb3UgbWVudGlvbmVkIHRoZSBKSDcxMTAgaGFzIGEgYmV0dGVyIHJhdGluZyB0aGFu
IHRoZSBDUFUgYXJjaGl0ZWN0ZWQgCnRpbWVycy4gVGhlIHJhdGluZyBpcyB0aGVyZSB0byAiY2hv
b3NlIiB0aGUgYmVzdCB0aW1lciwgc28gaXQgaXMgdXAgdG8gCnRoZSBhdXRob3Igb2YgdGhlIGRy
aXZlciBjaGVjayBhZ2FpbnN0IHdoaWNoIHRpbWVycyBpdCBjb21wYXJlcyBvbiB0aGUgCnBsYXRm
b3JtLgoKVXN1YWxseSwgQ1BVIHRpbWVycyBhcmUgdGhlIGJlc3QuCgpJdCBpcyBzdXJwcmlzaW5n
IHRoZSB0aW1lci1yaXNjdiBoYXMgYSBzbyBsb3cgcmF0aW5nLiBZb3UgbWF5IGRvdWJsZSAKY2hl
Y2sgaWYgamg3MTEwIGlzIHJlYWxseSBiZXR0ZXIuIElmIGl0IGlzIHRoZSBjYXNlLCB0aGVuIGlt
cGxlbWVudGluZyBhIApjbG9ja2V2ZW50IHBlciBjcHUgd291bGQgbWFrZSBtb3JlIHNlbnNlLCBv
dGhlcndpc2Ugb25lIGNsb2NrZXZlbnQgYXMgYSAKZ2xvYmFsIHRpbWVyIGlzIGVub3VnaC4KClVu
dXNlZCBjbG9ja3NvdXJjZSwgY2xvY2tldmVudHMgc2hvdWxkIGJlIHN0b3BwZWQgaW4gY2FzZSB0
aGUgZmlybXdhcmUgCmxldCB0aGVtIGluIGEgdW5kZXRlcm1pbmVkIHN0YXRlLgoKCj4gWzFdCj4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGhlcm1hbC9s
aW51eC5naXQvdHJlZS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMjbjQ1Cj4KPiAg
VGhhbmtzLCBYaW5neXUgV3UKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAg
PGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDov
L3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
