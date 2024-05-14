Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DC7C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mM4/lCxhSIQ9erJqEz+HSl5SuiVfZgUDq1dq/kLYaLA=; b=t3lzN5Xwc9d26K
	Fu4XO63z8bfECK8QW4Dd3AcDuS8xuaTZ2nUAWt3FXzeOzgctKpjxA2bM0y1zrUpF512fBcMjFZBzT
	QCzk/z2mwygWNj7QurLKo5HQLtoe/0t4Ot0rq1soAfoq1PdRy1Xmwo2X1FUw2cPcMV7/kNFM/Ufi6
	ABstLNcOJTalw9HiHg8M764XtCl0ohy6H3H4DWPzWCzVdaiC42njrFEznM/HCWvo6egTxmru7es67
	yOSf+Eaqs+k1BhLQrActeJuqsTFMPlpJqdcRL3neK1DCFqGKCPQ+V3e+BpWIUEkk5OyBdhqVuqy1a
	tCCmuta3pZJBwFUIceKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6myJ-0000000FHWw-1VUu;
	Tue, 14 May 2024 07:53:15 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6myG-0000000FHWA-1K0I
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 07:53:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-51fa8f5269eso1112198e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715673190; x=1716277990; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLTEzVHwu7ZYKj/KSfivTkPQEQSaRSHzucHxEOOY2fE=;
        b=Rtz28DJjIWuhutZ3S5UH0fbTUrqUcoUJmsOROenMyjN6KfaOpFur5n3I4m5qvTSf/o
         m8JYLahk9WxIfQuj5KV95eC4jg+q7tn8cxvpXpqojqbUj0zjwWMMhfGXBlHb/RtkeIYq
         DTa6ZwFiqL7PvmWNAXuUdd0MeRbu+RwmP0ayRBWs4BaY1JaLD9og7eb3dILZa3uF7eZL
         nNmQ2Rbw1RhApeIl4FU2UnUoCaBLL8v4MXkZNIZDYuMRhsGPyyBj1dzMFVKWLX30II4Z
         UTqdZiS33OhTXZUY4YzULeVRHVXzmszuO6NuZ5bi0AkRmabRseZeacbBi00EcUA2K2qs
         25TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715673190; x=1716277990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLTEzVHwu7ZYKj/KSfivTkPQEQSaRSHzucHxEOOY2fE=;
        b=loJkpnBWnZAWlRzAvlsmDb5WMTl2Bu2g1akGOuf3FVfcvGK5iT0ArV9v6AofPFhrS2
         cPqo7qXBZySbtgs1qhvClS/xD1KwqB22pDcn1KyOyN1WFDYBAxVLY7lcVY24z5+w+T2S
         invEaP8rs/uwgeo1KONNmASWOu+1hwRBniWTZIpCA3A5PN2ywNnUCtrCha5XvpqaHrFj
         fg7oE/xa2Qizom/T5kyDlqEJwYej1fqUxWyz+LicGXmt1WIX9IkeqnmyAU98eeBBSTOg
         2eXja/KZTMc3jsZRKl1HGN+JRhSKNacBb+uJXs8No1hq5kF9qYcuB6NbglxY3YyVf4tF
         +opw==
X-Forwarded-Encrypted: i=1; AJvYcCUmHH3YA5pRQdKDOgDpCy1XTxZnfBqxPK3EF4nubO7V8GN+WiPJjOjFyg66r3VkiIlYGQLZZ1FsfM+DPQ8xwwe7SEv1u05Vxqty39WeKJpd
X-Gm-Message-State: AOJu0YyjiY3M7dTbnkTXukXwnCYkkFD2eCmE7ScRXSlpys0LTEnGLy6R
	cVTxwOMXDN4rYoTmhSp+/7UrBnrrxjUDKVfnXjnMzUZQomMjdiLpxo0FKzAnhMY=
X-Google-Smtp-Source: AGHT+IGAAZ+jOBUCojQGggh22j6hs6WvIQhPLRiw+ncZod2lDfQS/ZA3a8ERikpxDRqLtFBslYYo/A==
X-Received: by 2002:a2e:9094:0:b0:2df:4bad:cb7f with SMTP id 38308e7fff4ca-2e51fd4b333mr72404111fa.2.1715673189903;
        Tue, 14 May 2024 00:53:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:1660:5f6e:2f9c:91b9? ([2a01:e0a:999:a3a0:1660:5f6e:2f9c:91b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8e3csm185259155e9.1.2024.05.14.00.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 00:53:09 -0700 (PDT)
Message-ID: <e57f8b70-7981-42c1-bb04-2060054dd796@rivosinc.com>
Date: Tue, 14 May 2024 09:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] riscv: add ISA extensions validation
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240429-subtext-tabby-3a1532f058a5@spud>
 <5d5febd5-d113-4e8c-9535-9e75acf23398@rivosinc.com>
 <20240430-payable-famished-6711765d5ca4@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240430-payable-famished-6711765d5ca4@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_005312_385646_366C24D5 
X-CRM114-Status: GOOD (  34.36  )
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

CgpPbiAzMC8wNC8yMDI0IDEzOjQ0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBBcHIg
MzAsIDIwMjQgYXQgMDk6MTg6NDdBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAzMC8wNC8yMDI0IDAwOjE1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBNb24s
IEFwciAyOSwgMjAyNCBhdCAwNTowNDo1NVBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+Pj4gU2luY2UgYSBmZXcgZXh0ZW5zaW9ucyAoWmljYm9tL1ppY2JveikgYWxyZWFkeSBuZWVk
cyB2YWxpZGF0aW9uIGFuZAo+Pj4+IGZ1dHVyZSBvbmVzIHdpbGwgbmVlZCBpdCBhcyB3ZWxsICha
YyopIGFkZCBhIHZhbGlkYXRlKCkgY2FsbGJhY2sgdG8KPj4+PiBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhLiBUaGlzIHJlcXVpcmUgdG8gcmV3b3JrIHRoZSB3YXkgZXh0ZW5zaW9ucyBhcmUKPj4+
PiBwYXJzZWQgYW5kIHNwbGl0IGl0IGluIHR3byBwaGFzZXMuIEZpcnN0IHBoYXNlIGlzIGlzYSBz
dHJpbmcgb3IgaXNhCj4+Pj4gZXh0ZW5zaW9uIGxpc3QgcGFyc2luZyBhbmQgY29uc2lzdHMgaW4g
ZW5hYmxpbmcgYWxsIHRoZSBleHRlbnNpb25zIGluIGEKPj4+PiB0ZW1wb3JhcnkgYml0bWFzayB3
aXRob3V0IGFueSB2YWxpZGF0aW9uLiBUaGUgc2Vjb25kIHN0ZXAgInJlc29sdmVzIiB0aGUKPj4+
PiBmaW5hbCBpc2EgYml0bWFwLCBoYW5kbGluZyBwb3RlbnRpYWwgbWlzc2luZyBkZXBlbmRlbmNp
ZXMuIFRoZSBtZWNoYW5pc20KPj4+PiBpcyBxdWl0ZSBzaW1wbGUgYW5kIHNpbXBseSB2YWxpZGF0
ZSBlYWNoIGV4dGVuc2lvbiBkZXNjcmliZWQgaW4gdGhlCj4+Pj4gdGVtcG9yYXJ5IGJpdG1hcCBi
ZWZvcmUgZW5hYmxpbmcgaXQgaW4gdGhlIGZpbmFsIGlzYSBiaXRtYXAuIHZhbGlkYXRlKCkKPj4+
PiBjYWxsYmFja3MgY2FuIHJldHVybiBlaXRoZXIgMCBmb3Igc3VjY2VzcywgLUVQUk9CRURFRkVS
IGlmIGV4dGVuc2lvbgo+Pj4+IG5lZWRzIHRvIGJlIHZhbGlkYXRlZCBhZ2FpbiBhdCBuZXh0IGxv
b3AuIEEgcHJldmlvdXMgSVNBIGJpdG1hcCBpcyBrZXB0Cj4+Pj4gdG8gYXZvaWQgbG9vcGluZyBt
dXRsaXBsZSB0aW1lcyBpZiBhbiBleHRlbnNpb24gZGVwZW5kZW5jaWVzIGFyZSBuZXZlcgo+Pj4+
IHNhdGlzZmllZCB1bnRpbCB3ZSByZWFjaCBhIHN0YWJsZSBzdGF0ZS4gSW4gb3JkZXIgdG8gYXZv
aWQgYW55IHBvdGVudGlhbAo+Pj4+IGluZmluaXRlIGxvb3BpbmcsIGFsbG93IGxvb3BpbmcgYSBt
YXhpbXVtIG9mIHRoZSBudW1iZXIgb2YgZXh0ZW5zaW9uIHdlCj4+Pj4gaGFuZGxlLiBaaWNib3og
YW5kIFppY2JvbSBleHRlbnNpb25zIGFyZSBtb2RpZmllZCB0byB1c2UgdGhpcyB2YWxpZGF0aW9u
Cj4+Pj4gbWVjaGFuaXNtLgo+Pj4KPj4+IFlvdXIgcmVwbHkgdG8gbXkgbGFzdCByZXZpZXcgb25s
eSB0YWxrZWQgYWJvdXQgcGFydCBvZiBteSBjb21tZW50cywKPj4+IHdoaWNoIGlzIHVzdWFsbHkg
d2hhdCB5b3UgZG8gd2hlbiB5b3UncmUgZ29ubmEgaW1wbGVtZW50IHRoZSByZXN0LCBidXQKPj4+
IHlvdSBoYXZlbid0Lgo+Pj4gSSBsaWtlIHRoZSBjaGFuZ2UgeW91J3ZlIG1hZGUgdG8gc2hvcnRl
biBsb29waW5nLCBidXQgSSdkIGF0IGxlYXN0IGxpa2UKPj4+IGEgcmVzcG9uc2UgdG8gd2h5IGEg
c3BsaXQgaXMgbm90IHdvcnRoIGRvaW5nIDopCj4+Cj4+IEhpIENvbm9yLAo+Pgo+PiBNaXNzZWQg
dGhhdCBwb2ludCBzaW5jZSBJIHdhcyBmZWVsaW5nIHRoYXQgbXkgc29sdXRpb24gYWN0dWFsbHkK
Pj4gYWRkcmVzc2VzIHlvdXIgY29uY2VybnMuIFlvdXIgYXJndW1lbnQgd2FzIHRoYXQgdGhlcmUg
aXMgbm8gcmVhc29uIHRvCj4+IGxvb3AgZm9yIFppY2JvbS9aaWNib3ogYnV0IHRoYXQgd291bGQg
YWxzbyBhcHBseSB0byBaY2YgaW4gY2FzZSB3ZSBhcmUKPj4gb24gUlY2NCBhcyB3ZWxsIChzaW5j
ZSB6Y2YgaXMgbm90IHN1cHBvcnRlZCBvbiBSVjY0KS4gU28gZm9yIFpjZiwgdGhhdAo+PiB3b3Vs
ZCBsZWFkIHRvIHVzaW5nIGJvdGggbWVjYW5pc20gb3IgYWRkaXRpb25hbCBpZmRlZmVyeSB3aXRo
IGxpdHRsZSB0bwo+PiBubyBhZGRlZCB2YWx1ZSBzaW5jZSB0aGUgY3VycmVudCBzb2x1dGlvbiBh
Y3R1YWxseSBzb2x2ZXMgYm90aCBjYXNlczoKPj4KPj4gLSBXZSBkb24ndCBoYXZlIGFueSBleHRy
YSBsb29waW5nIGlmIGFsbCB2YWxpZGF0aW9uIGNhbGxiYWNrIHJldHVybnMgMAo+PiAoZXhjZXB0
IHRoZSBpbml0aWFsIG9uZSBvbiByaXNjdl9pc2FfZXh0LCB3aGljaCBpcyBraW5kIG9mIHVuYXZv
aWRhYmxlKS4KPj4gLSBaaWNib20sIFppY2JveiBjYWxsYmFja3Mgd2lsbCBiZSBjYWxsZWQgb25s
eSBvbmNlICh3aGljaCB3YXMgb25lIG9mCj4+IHlvdXIgY29uY2VybikuCj4+Cj4+IEFkZGluZyBh
IHNlY29uZCBraW5kIG9mIGNhbGxiYWNrIGZvciBhZnRlciBsb29wIHZhbGlkYXRpb24gd291bGQg
b25seQo+PiBsZWFkIHRvIGEgYnVuY2ggb2YgYWRkaXRpb25hbCBtYWNyb3MvaWZkZWZlcnkgZm9y
IGV4dGVuc2lvbnMgd2l0aAo+PiB2YWxpZGF0ZSgpIGNhbGxiYWNrLCB3aXRoIHZhbGlkYXRlX2Vu
ZCgpIG9yIHdpdGggYm90aCAoaWUgWmNmKSkuIEZvcgo+PiB0aGVzZSByZWFzb25zLCBJIGRvIG5v
dCB0aGluayB0aGVyZSBpcyBhIG5lZWQgZm9yIGEgc2VwYXJhdGUgbWVjaGFuaXNtCj4+IG5vciBh
ZGRpdGlvbmFsIGNhbGxiYWNrIGZvciBzdWNoIGV4dGVuc2lvbnMgZXhjZXB0IGFkZGluZyBleHRy
YSBjb2RlCj4+IHdpdGggbm8gcmVhbCBhZGRlZCBmdW5jdGlvbmFsaXR5Lgo+Pgo+PiBBRkFJSywg
dGhlIHBsYXRmb3JtIGRyaXZlciBwcm9iaW5nIG1lY2hhbmlzbSB3b3JrcyB0aGUgc2FtZSwgdGhl
IHByb2JlKCkKPj4gY2FsbGJhY2sgaXMgYWN0dWFsbHkgY2FsbGVkIGV2ZW4gaWYgZm9yIHNvbWUg
cmVhc29uIHByb3BlcnRpZXMgYXJlCj4+IG1pc3NpbmcgZnJvbSBub2RlcyBmb3IgcGxhdGZvcm0g
ZGV2aWNlcyBhbmQgdGh1cyB0aGUgcHJvYmUoKSByZXR1cm5zCj4+IC1FSU5WQUwgb3Igd2hhdGV2
ZXIuCj4+Cj4+IEhvcGUgdGhpcyBhbnN3ZXJzIHlvdXIgcXVlc3Rpb24sCj4gCj4gWWVhaCwgcHJl
dHR5IG11Y2ggSSBhbSBoYXBweSB3aXRoIGp1c3QgYW4gIml0J3Mgbm90IHdvcnRoIGRvaW5nIGl0
Igo+IHJlc3BvbnNlLiBHaXZlbiBpdCB3YXNuJ3QgeW91ciBmaXJzdCBjaG9pY2UsIEkgZG91YnQg
eW91J3JlIG92ZXJseSBoYXBweQo+IHdpdGggaXQgZWl0aGVyLCBidXQgSSByZWFsbHkgd291bGQg
bGlrZSB0byBhdm9pZCBsb29waW5nIHRvIGNsb3N1cmUgdG8KPiBzb3J0IG91dCBkZXBlbmRlbmNp
ZXMgLSBwYXJ0aWN1bGFybHkgb24gdGhlIGJvb3QgQ1BVIGJlZm9yZSB3ZSBicmluZwo+IGFueW9u
ZSBlbHNlIHVwLCBidXQgaWYgdGhlIGNvZGUgaXMgbm93IG1vcmUgcHJvYWN0aXZlIGFib3V0IGJy
ZWFraW5nCj4gb3V0LCBJIHN1cHBvc2UgdGhhdCdsbCBoYXZlIHRvIGRvIDopCj4gSSBraW5kYSB3
aXNoIHdlIGRpZG4ndCBkbyB0aGlzIGF0IGFsbCwgYnV0IEkgdGhpbmsgd2UndmUgYnJvdWdodCB0
aGlzCj4gdXBvbiBvdXJzZWx2ZXMgdmlhIGh3cHJvYmUuIEknbSBzdGlsbCBvbiB0aGUgZmVuY2Ug
YXMgdG8gd2hldGhlciB0aGluZ3MKPiB0aGF0IGFyZSBpbXBsaWVkIG5lZWQgdG8gYmUgaGFuZGxl
ZCBpbiB0aGlzIHdheS4gSSB0aGluayBJJ2xsIGJyaW5nIHRoaXMKPiB1cCB0b21vcnJvdyBhdCB0
aGUgd2Vla2x5IGNhbGwsIGJlY2F1c2Ugc28gZmFyIGl0J3Mgb25seSBiZWVuIHlvdSBhbmQgSQo+
IGRpc2N1c3NpbmcgdGhpcyByZWFsbHkgYW5kIGl0J3MgYSBwb2xpY3kgZGVjaXNpb24gdGhhdCBo
d3Byb2JlLWlzdHMKPiBzaG91bGQgYmUgaW52b2x2ZWQgaW4gSSB0aGluay4KCkhpIENvbm9yLAoK
V2VyZSB5b3UgYWJsZSB0byBkaXNjdXNzIHRoYXQgdG9waWMgPwoKPiAKPiBJbXBsaWVkIGV4dGVu
c2lvbnMgYXNpZGUsIEkgdGhpbmsgd2Ugd2lsbCBldmVudHVhbGx5IG5lZWQgdGhpcyBzdHVmZgo+
IGFueXdheSwgZm9yIGV4dGVuc2lvbnMgdGhhdCBtYWtlIG5vIHNlbnNlIHRvIGNvbnNpZGVyIGlm
IGEgY29uZmlnIG9wdGlvbgo+IGZvciBhIGRlcGVuZGVuY3kgaXMgZGlzYWJsZWQuCj4gRnJvbSB0
YWxraW5nIHRvIEVyaWMgQmlnZ2VycyB0aGUgb3RoZXIgd2VlayBhYm91dAo+IHJpc2N2X2lzYV9l
eHRlbnNpb25fYXZhaWxhYmxlKCkgSSdtIG9mIHRoZSBvcGluaW9uIHRoYXQgd2UgbmVlZCB0byBk
bwo+IGJldHRlciB3aXRoIHRoYXQgaW50ZXJmYWNlIHcuci50LiBleHRlbnNpb24gYW5kIGNvbmZp
ZyBkZXBlbmRlbmNpZXMsCj4gYW5kIHdoYXQgc2VlbXMgbGlrZSBhIGdvb2QgaWRlYSB0byBtZSBh
dCB0aGUgbW9tZW50IGlzIHB1dHRpbmcgdGVzdHMgZm9yCj4gSVNfRU5BQkxFRChSSVNDVl9JU0Ff
Rk9PKSBpbnRvIHRoZXNlIHZhbGlkYXRlIGhvb2tzLgo+IAo+IEknbGwgdHJ5IHRvIGxvb2sgYXQg
dGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBoZXJlIHRvbW9ycm93LgoKRGlkIHlvdSBmb3VuZCB0
aW1lIHRvIGxvb2sgYXQgdGhlIGltcGxlbWVudGF0aW9uID8KClRoYW5rcywKCkNsw6ltZW50Cgo+
IAo+IENoZWVycywKPiBDb25vci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
