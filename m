Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04AECAC5BB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 20:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8zIpoUlO47vR8bRtWQ/anojmpokXieLv/LrvKWlQOg=; b=M35tGNzENKwPP8
	U1TgSbIo8dSa4/z7C9g4ZS1nYYYaa3jmkmfqeV3VAyw3BWoRKgnmpp2+9KpaHLfzGZfEICJxzP2py
	T5LAiTaDNbtaEi4ADQUQec/sOd4BOOEw9w7Duj4vHS3JsskSyFgDllIWJcx1y15uTb3PKE/FdkiMH
	CEiK++nB1Wkuj43NV+JV3bz5mlUcAOVE6Ek7RyXLn3RMuBNSNuzyeyk8+PC88f6kHXNwaC+loN4Q9
	slpiryjLrjfWLJYzHsKByEf0Tjjq+fpYMSyLjaPgnGteiX4WdeJ7EpHFUd0309vR6uKlADaS2Z5SQ
	E+9FgVbuIGnTHFfdm9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1s8C-0000000CWOo-2FgQ;
	Thu, 25 Sep 2025 19:59:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1s87-0000000CWKL-3hJu
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 19:59:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-781010ff051so931517b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 12:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758830390; x=1759435190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAdEQBdz9dDV+qB/r+6Q6b9tiykVbAuQh1lcreO6d6U=;
        b=kCmw3BYrcFn9I/XQ1iOnyxeqZFgvDYUzthTkfjhS0q6cnv26qdQSF1YoEelOdgKopt
         3P3OsUOcz8IhNO2Cj1ui50/G++1PBCtzf3fVDbVnoldfd8nmjYyrew5wG0DC20SvYp2R
         WBa1tJzmQLkpdCJvP0nKaykUak2WBwhWLgALk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830390; x=1759435190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAdEQBdz9dDV+qB/r+6Q6b9tiykVbAuQh1lcreO6d6U=;
        b=XXAwnFYUvUyyns6w7ygaKjPLgqTwKbe4wP1UywBPCzxO99m7zApsr1l9gFIhoRBuYV
         z8bBREv4KflsWxm9GtR6A1BDvvZDrwvDZWcah4kylfPCwWcsTvijG4ojWB8oSNMF8Gyu
         74SeqQQcy8SA3yWa4Fc6ZaeVEVM99TgqdxfP7b0EhkusrwZVCU/IYch3mbu9vShHCdY+
         pvgmmRlnOaDU/4KAe0MZ/v+RZno1OnP2MvEA6qnoACNgYfkasEFtWBCDTNgHM0LLtkxy
         E2qYwsLo47wCoInemK2hrKiByXYoc8FcN9zkZoD8ZMIP+1bD/BBn2IYHaSjWetNMNCUh
         YXfA==
X-Forwarded-Encrypted: i=1; AJvYcCUL5MM4ArN5BMfION+IFCCSrpg3UWSZjRmvn7vmQ5R9w8NMRTMAFrRLDy+Fs4dvWJJQXuxpXe/DlEBTWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU8HO287o1fTQhnVG66bzHzyv0yQizRV4ocAmGX7Pw2FrHjxfM
	ku61eOKV8xwyurRkMjHqiB3tDZqnvOYFDv4Z3ZmeHtNaEz9UhgBt3tib2BWN2gqVO6We3dX2m/D
	jb5U=
X-Gm-Gg: ASbGncsCUv7NC0RI6t6eCyV/K5y9jq7DP1psUHuAL530R12XUhzuOK11MUDJrdwDBxl
	S0ekCcAhkVJJYcFggXSbPCxCV39/haWHEy+4zetC0qOW8Z8T2NCS8MQGFOK54eIiWB5Q0Iisuzs
	FtG+VkRPqpP4XO4SfqC1eO07sdigV/d8m7m/TxiUPOVHFb7ghjyjmeybCt0RY5Yj61d9eGQzwtT
	RzsP6UGcX3bkjGzJTfg0d10D+eg/MV13VhHr8pZX2dCQUzbu4O9CKx7cc2ls1NhQaWfyjRavYRz
	f41rvHCStNOCA6hWw98QpAM2vA28909XgpBvjOo07J8l8ZR0P1LmTqAKA2lwVYW5y4DSkqwQXMk
	zim4xJnBaJ34w8xpzXTbJbutpiMS+FcVeDUAj8t7CVREbBWiy29bFeMnP+XIhYqjcFg==
X-Google-Smtp-Source: AGHT+IFA8xALTrxdwf+IBnObBc4VBR0ifruyIHwpQMnOTFfPaZ4JxIaM5howB0vXo1li/+nSzCyALA==
X-Received: by 2002:a05:6a20:3946:b0:2d3:8d14:7fad with SMTP id adf61e73a8af0-2e7cb16a3dcmr5633953637.27.1758830390552;
        Thu, 25 Sep 2025 12:59:50 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53bacf4sm2946173a12.7.2025.09.25.12.59.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:59:48 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2681660d604so13643415ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 12:59:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4hg5w1VKldCgqEMsNJJ4kv4eNYWrzE9+iHfMLD1W5s9YQh6pikO8CHMXRopL5/gwxfSXILlsT2L21KA==@lists.infradead.org
X-Received: by 2002:a17:902:ec8b:b0:26a:f6e6:ef4f with SMTP id
 d9443c01a7336-27ed4a78d67mr40499335ad.60.1758830387808; Thu, 25 Sep 2025
 12:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com> <20250925084806.89715-3-cuiyunhui@bytedance.com>
In-Reply-To: <20250925084806.89715-3-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Sep 2025 12:59:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VpCZzw24VH4DAvt5UhZHJD1TMO-t5HB8Kfw3pw+jO7sA@mail.gmail.com>
X-Gm-Features: AS18NWCOLLpqvX90nBBWu9Muo_va5K9CeZWn93TLpPGzigEq33VTJanz9wj8IRk
Message-ID: <CAD=FV=VpCZzw24VH4DAvt5UhZHJD1TMO-t5HB8Kfw3pw+jO7sA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_125951_928230_0172FA79 
X-CRM114-Status: GOOD (  14.20  )
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

SGksCgpPbiBUaHUsIFNlcCAyNSwgMjAyNSBhdCAxOjQ44oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gRW5hYmxlIHRoZSBIQVJETE9DS1VQX0RFVEVD
VE9SX1BFUkYgZnVuY3Rpb24gYmFzZWQgb24gUklTQy1WIFNTRS4KPgo+IFNpZ25lZC1vZmYtYnk6
IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2
L0tjb25maWcgICAgICAgICAgIHwgIDMgKysrCj4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMgfCAxMCArKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
IGluZGV4IGJhZGJiMmIzNjY5NDYuLmJiNGU4YzVhMTg3MTcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTE4Niw2ICsxODYs
OSBAQCBjb25maWcgUklTQ1YKPiAgICAgICAgIHNlbGVjdCBIQVZFX1BBR0VfU0laRV80S0IKPiAg
ICAgICAgIHNlbGVjdCBIQVZFX1BDSQo+ICAgICAgICAgc2VsZWN0IEhBVkVfUEVSRl9FVkVOVFMK
PiArICAgICAgIHNlbGVjdCBQRVJGX0VWRU5UUwoKSSBkb24ndCB0aGluayB5b3Ugd2FudCB0byBz
ZWxlY3QgdGhpcywgZG8geW91PyBKdXN0IGRlcGVuZCBvbiBpdD8KCk90aGVyIHRoYW4gdGhhdCwg
dGhpcyBsb29rcyBnb29kIHRvIG1lLgoKCi1Eb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
