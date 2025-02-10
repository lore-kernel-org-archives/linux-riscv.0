Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75737C0219B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 07:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XN2Dodf4a1Y0XWZT+vgpqpck/0tNJKOwG7D3tkwcRhA=; b=TNs6k8EpiujIxw
	R4s9IBHkDKjTdM+JtOw08mn3LgcLWNH93S5VUbOBB1MiawrpFeEItQ8Zl+tQlS//JUTsIzD/AppYB
	SQMxildLJG+lUEiQkFwtUwiLIJrzKMnvo6izqd39VJRuKwpoL+AUd/e2smwWpKBMMVA35D02Ymoe8
	VFBJUb0U47Cc12AMhasYHLdyIRRtAPfIUVrZw2rxfMWlTO/YgAnOiUTa7wNmNh320vSzIAXemHvmX
	5LbeA8TdM+FSHDM4RfDNh2lvCux2bXUwWiSJkz1yR9v9uCC7Rvxhn0+3weHnFN+57DI1LQcSep9cy
	vyzd1wgNhqZMuOY3sUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thORI-0000000GYFm-3PNB;
	Mon, 10 Feb 2025 07:42:44 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thORG-0000000GYE6-0BCy
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 07:42:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dc5b8ed86so1580395f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2025 23:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739173360; x=1739778160; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jki0b2am8yzlz3QyhCDEFnMh6r+K6Xff5FC3zmcGxIQ=;
        b=1wToadBUXuFe7ohL7aPWVHXwYmxMWDocUb2/otxYZj6SkXG4oMb8eMe43zO0HP+7rP
         YJes0s7TriQXUPyDRkiZus3DRef5UMwJwNM+xHHqTGNBmEQPV9UfqDXr62yGKvVMeIBI
         8LqZJQQQ8CHN/gaX4oDWyy97K5ugtsXQED+zw8VHn6z0lIPAp3hPIzhvYgsb7RdF8MFf
         ikuiZzBDs0RO41DdnnXLxyvd+PNTNuOikDtli1uauAFbuzkMwtyB0v3/KVl9q6bOrW3X
         qzJdXBbuftkSAMkACdc7ityHWGDHJqcgbedHScv8PrIOU6g6wAGA1LG0nz/RzIjS3k1k
         ChCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173360; x=1739778160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jki0b2am8yzlz3QyhCDEFnMh6r+K6Xff5FC3zmcGxIQ=;
        b=FohFJ0utXI+YfDPDxeQSRcCok+alQoeiz6NUAN7RAm/4HeBnj88zeqv8xP4LjT4a2J
         UTiUVezNXB2/Oo5pLojIFLvt8DXByGywCiXMX5j9LM9Hu7BpwuTs2pchvrQJSyW42P1q
         ZEdRQjn1umDZrlhad2IvIA0YjRaDWWpem6cOcev8mBJUvMwAxCfRXULxsSarHqBj3orN
         AwlRxKOofxvADqR0yn2vFdHlrt46embIQ28GcVLRZS6x9qI73APU+tfNPo/Xbn5IZDr+
         ZVGa5UoNcaXzI8Q9Gt8vXUGSUZnh0DAaEWMnr6Xgeg5IL3LRd8vMDVx9KfA9E5PXJmxc
         hSlA==
X-Forwarded-Encrypted: i=1; AJvYcCVt7U7UI25ql5eVrddqhjKH/EIyCmzOGyzkOl3/NkkRaBqnEYV7CuJZw1VL7gkNQtvLcVBJwWpIyNt60A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLzTti8RXJrntd5eHa1RepZilsli5NdBR3P7imfKIdM4K5PCH5
	z6oV+r4pi9VBtyAogylzN08jLnCcuoSRd+irNWvJUD8KW6h/KMIiT6bRg69gyqg=
X-Gm-Gg: ASbGncs0t+071HLWywVzsigRb7CsuXsNfkqQaYqJ6E5aFbiceJWsh5NtePNtz0tMCle
	rvC0/t2HLtR3+z3TGWI26vny8qnIstxSQvx3hL1xBh7KEtbOmQAZ3oa+sJ/O1x6FhGSYgEhoOZC
	iPpW31auD9xKysW34Tf3BYXGUXRm9xSzdK+4bW3hQvFQvgFxfuSp6S46JSM7cHfZNQkM+bZj6/c
	jGNQx8rCSK8m1gHobqvRy0oWaWHD26ln7ihLD6J2uMXZnFKhFVlLAZld1YMCIvsjC4mFRF/37GY
	wYGwW7xWuWFVwfMVZeQEttUaUDiCNelPwICN2QvHemPAcLRsJAS0VRIWTTQY
X-Google-Smtp-Source: AGHT+IF39BdEkA9ZgcBIHbLRArZRwyqYfhbYwkkcPtQvR89C0KQhk8Xnq25iZkfcHIflDsp+ppJQFw==
X-Received: by 2002:a5d:47ad:0:b0:38b:d7c3:3768 with SMTP id ffacd0b85a97d-38dc90fdb89mr7501603f8f.12.1739173359748;
        Sun, 09 Feb 2025 23:42:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d896d70sm171375435e9.0.2025.02.09.23.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 23:42:38 -0800 (PST)
Message-ID: <4320b0be-acce-43b2-b148-1577c6a56dff@rivosinc.com>
Date: Mon, 10 Feb 2025 08:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/26] riscv/traps: Introduce software check exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <brauner@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, alexghiti@rivosinc.com,
 samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-14-b37a49c5205c@rivosinc.com>
 <fec3b7be-4259-4eef-87f9-b2cee5718cae@rivosinc.com>
 <Z6Z6mhiQ3DmsNZe9@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z6Z6mhiQ3DmsNZe9@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_234242_337982_BC47C38C 
X-CRM114-Status: GOOD (  16.14  )
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

CgpPbiAwNy8wMi8yMDI1IDIyOjI2LCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gSGkgQ2xlbWVudCwK
PiAKPiBUaGFua3MgZm9yIGxvb2tpbmcgYXQgaXQuIElubGluZQo+IE9uIFRodSwgRmViIDA2LCAy
MDI1IGF0IDAyOjQ5OjA5UE0gKzAxMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4KPj4KPj4g
T24gMDUvMDIvMjAyNSAwMjoyMiwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+Pj4gemljZmlzcyAvIHpp
Y2ZpbHAgaW50cm9kdWNlcyBhIG5ldyBleGNlcHRpb24gdG8gcHJpdiBpc2EgYHNvZnR3YXJlIGNo
ZWNrCj4+PiBleGNlcHRpb25gIHdpdGggY2F1c2UgY29kZSA9IDE4LiBUaGlzIHBhdGNoIGltcGxl
bWVudHMgc29mdHdhcmUgY2hlY2sKPj4+IGV4Y2VwdGlvbi4KPj4KPj4gSGV5IERlZXBhaywKPj4K
Pj4gV2hpbGUgbm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCwgaXMgdGhlIGV4Y2Vw
dGlvbiAxOCBkZWxlZ2F0aW9uCj4+IGRvY3VtZW50ZWQgaW4gdGhlIFNCSSBkb2MgPyBJIG1lYW4s
IHNob3VsZCB3ZSBzcGVjaWZ5IHRoYXQgaXQgaXMgYWx3YXlzCj4+IGRlbGVnYXRlZCB3aGVuIGlt
cGxlbWVudGluZyBGV0ZUIExBTkRJTkdfUEFEL1NIQURPV19TVEFDSyA/Cj4gCj4gSSBkb24ndCB0
aGluayBpdCdzIGRvY3VtZW50IGluIFNCSSBzcGVjIGFueXdoZXJlLiBTaG91bGQgaXQgYmUgPwoK
VGhhdCdzIGEgZ29vZCBxdWVzdGlvbiAhIEkgZG9uJ3Qga25vdyB0aGUgcHJvY2VzcyB0byBkb2N1
bWVudCB0aGF0IHBhcnQKb2YgdGhlIFNCSSBidXQgdGhhdCB3b3VsZCBwcm9iYWJseSBiZSBuaWNl
IHRvIGRvY3VtZW50IGl0IGFueXdheSBJCmd1ZXNzLiBBdGlzaCBtYXkga25vdyB3aGF0IHRvIGRv
IHdpdGggdGhhdC4KCkNsw6ltZW50Cgo+IAo+IAo+IEluIGNvZGUsIG9wZW5zYmkgZGVsZWdhdGVz
IHRoZSBleGNlcHRpb24gKFNXX0NIRUNLKQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0
d2FyZS1zcmMvb3BlbnNiaS8KPiBjb21taXQvMTEwNTI0NDQxYTgyN2UwMjZkYjM1NDdlZDAzYzU3
MjNiOWM5ZTIxMQo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+IENsw6ltZW50Cj4+Cj4+PgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
