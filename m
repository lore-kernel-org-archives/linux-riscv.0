Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB87C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 11:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rs+gNJrCYiQUe/1H91xlvZ87YjSHHS8YE421k05VwBM=; b=MRnqBQDyxnO/v9
	Ek6z+Jz2Sx64WqkklIYv6BPW0cPpHYz7oaS2kRCEHisWg6Fx4MW8U1WIU6HWttE+MEzmq7homttwD
	8gYw7iZJERiE3KOD7t0vYY2TwZm4XL1borYgbWgL7hmpbgQ2HqUsAzVlIdgXfRQ6+fqrMi8WEznbP
	NPC0R/b/PDtyEun7YaaxcvztNt9EEclLqaui1v/JSaQzIvkdMWFLMM5qX4Tv2Y0cz+DtIaFFd13F/
	UzjSMVJciU33th40COk9Sy0rDhj53HKhs1oNVFKnvlRxlmnf9bMWNRUAhqEOEySsjyKiGzEFXxGa1
	sgAO4oAtoG/PUkN6Quzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1m7p-00000006Ffx-3Riu;
	Tue, 30 Apr 2024 11:58:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1m7k-00000006Fcl-2U7N
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 11:58:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-34aa836b948so973072f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 04:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714478293; x=1715083093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OzSSsyfFzBl2mcBYufKCnCUvVLKXjpztnM9DRhV5I5Q=;
        b=j3u0Uy1efShNac0m5g8DSE3NCWlozLjDt+o++OtNvGE9KsfYwFgXao5Vt4lEsLsplN
         SSbHEweigRgaI4n9yrPYC6laFmiQUyzOP0jDCIrskd1EZ6T3svsOHQyZsHm6oMQxFKT0
         V2Q6Djr6AQpPaqs1utqCPz1j8lGSq4hpkZhWkJiEN1GgLK4z+QeyCV1cH4rq/nz2oeSI
         5Ca1Oepv02uwHO0yxnfhbCc79Yn6OWyBAQ0WHBtKrHwEdCKXXf25S2cx4BEtfSgP3Ncm
         Vi+o4KdqIsoZf4HsTphoiOfLAKMlp3VWEFurVwHtLnQZleF/2pU9M5UmKHtmpkkZRYAC
         2STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714478293; x=1715083093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OzSSsyfFzBl2mcBYufKCnCUvVLKXjpztnM9DRhV5I5Q=;
        b=JpmfppKzTqA32kJz2jD+0dhZvq68CA2HSR1LBQomzpgbWhIwKYlgTrL39DgStfKQiC
         UuYtT7125MV3Adg2LsdmK+geHNz7gou2hURwF5LChFN/AYCt04emBZRGKCSF1mBw74c8
         mL8R3hbF7c4x5tY/NOQtWsyRf4pUxU/NZOp2coT/UCUuNsvCz4Jdrq15F5m4taNNFpFN
         IKquPCmoIuH2yeWDcY4L0d+A/12P+reJfF33YAqOfK+Cg+n+BMszGAk+z9FmZdsrCm48
         jOfjzzjVPuMm85p0cwsh4GXVdJohdWye0BABRQfqcixEVE9wAi6XOC/t1GFquqQhSCsV
         xiHA==
X-Forwarded-Encrypted: i=1; AJvYcCU3zgTn4NrozvaMUWM1E6aPe/VyAsJe0eMP9KGH2KzL5v4IM1xQR1n1tWnDG426PRwyJ8RQGvyIaOdQVU2qDKPXpwMnOW0G2fk+VLuW7y71
X-Gm-Message-State: AOJu0Yz/ZOAvFZMiXVb/UMCoDheMNs0aDTID0kW8nUap9h5dnN/44C4e
	hgtCNf0XaWWhSOszZhkobrropjNwR5i2e9NaIIk2UGWoLV94izrBZ1XGpXJx3Po=
X-Google-Smtp-Source: AGHT+IFowi0uScE3U6kwtOLic0zxD94ruOb8GXnQAwFE/D5XSkJPVJ8UzE8OGVrMPrp7yPhK24S50A==
X-Received: by 2002:a05:6000:1756:b0:34d:af59:32bc with SMTP id m22-20020a056000175600b0034daf5932bcmr103435wrf.7.1714478293117;
        Tue, 30 Apr 2024 04:58:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:c21b:67fd:90ab:9053? ([2a01:e0a:999:a3a0:c21b:67fd:90ab:9053])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d5551000000b0034c5e61ee82sm10843260wrw.67.2024.04.30.04.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 04:58:12 -0700 (PDT)
Message-ID: <dbcf0be9-eae6-4776-bc5b-c6fad58df9c3@rivosinc.com>
Date: Tue, 30 Apr 2024 13:58:11 +0200
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
X-CRM114-CacheID: sfid-20240430_045816_910898_5E3BA3EC 
X-CRM114-Status: GOOD (  38.39  )
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
ZWFraW5nCj4gb3V0LCBJIHN1cHBvc2UgdGhhdCdsbCBoYXZlIHRvIGRvIDopCgpBaGFoLCBJIHdv
dWxkIGhhdmUgZG9uZSBpdCBpZiBpdCB3b3VsZCBoYXZlIG1ha2Ugc2Vuc2UgYW5kIGFkZCBhbnkK
dXNlZnVsIHN1cHBvcnQuIEJ1dCBBRkFJQ1QsIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIHNv
bHZlcyBtb3N0IG9mCnRoZSBwcm9ibGVtcyB5b3UgcmFpc2VkLgoKV2hpbGUgdGhpbmtpbmcgYWJv
dXQgaXQsIEkgY2FuIGV2ZW4gc2ltcGx5IGl0IGEgYml0IG1vcmUuIE9uY2UgYSBJU0EKZXh0ZW5z
aW9uIGJpdCBpcyBzZXQgaW4gdGhlIGZpbmFsIG1hc2ssIEkgY2FuIGFjdHVhbGx5IGRpc2FibGUg
aXQgaW4gdGhlCm9yaWdpbmFsIG1hc2sgdG8gYXZvaWQgbG9vcGluZyBvdmVyIGl0IGFnYWluLiBJ
J2xsIHNlbmQgYSBWNS4KCj4gSSBraW5kYSB3aXNoIHdlIGRpZG4ndCBkbyB0aGlzIGF0IGFsbCwg
YnV0IEkgdGhpbmsgd2UndmUgYnJvdWdodCB0aGlzCj4gdXBvbiBvdXJzZWx2ZXMgdmlhIGh3cHJv
YmUuIEknbSBzdGlsbCBvbiB0aGUgZmVuY2UgYXMgdG8gd2hldGhlciB0aGluZ3MKPiB0aGF0IGFy
ZSBpbXBsaWVkIG5lZWQgdG8gYmUgaGFuZGxlZCBpbiB0aGlzIHdheS4gSSB0aGluayBJJ2xsIGJy
aW5nIHRoaXMKPiB1cCB0b21vcnJvdyBhdCB0aGUgd2Vla2x5IGNhbGwsIGJlY2F1c2Ugc28gZmFy
IGl0J3Mgb25seSBiZWVuIHlvdSBhbmQgSQo+IGRpc2N1c3NpbmcgdGhpcyByZWFsbHkgYW5kIGl0
J3MgYSBwb2xpY3kgZGVjaXNpb24gdGhhdCBod3Byb2JlLWlzdHMKPiBzaG91bGQgYmUgaW52b2x2
ZWQgaW4gSSB0aGluay4KClllYWggc3VyZS4KCj4gCj4gSW1wbGllZCBleHRlbnNpb25zIGFzaWRl
LCBJIHRoaW5rIHdlIHdpbGwgZXZlbnR1YWxseSBuZWVkIHRoaXMgc3R1ZmYKPiBhbnl3YXksIGZv
ciBleHRlbnNpb25zIHRoYXQgbWFrZSBubyBzZW5zZSB0byBjb25zaWRlciBpZiBhIGNvbmZpZyBv
cHRpb24KPiBmb3IgYSBkZXBlbmRlbmN5IGlzIGRpc2FibGVkLgo+IEZyb20gdGFsa2luZyB0byBF
cmljIEJpZ2dlcnMgdGhlIG90aGVyIHdlZWsgYWJvdXQKPiByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2
YWlsYWJsZSgpIEknbSBvZiB0aGUgb3BpbmlvbiB0aGF0IHdlIG5lZWQgdG8gZG8KPiBiZXR0ZXIg
d2l0aCB0aGF0IGludGVyZmFjZSB3LnIudC4gZXh0ZW5zaW9uIGFuZCBjb25maWcgZGVwZW5kZW5j
aWVzLAo+IGFuZCB3aGF0IHNlZW1zIGxpa2UgYSBnb29kIGlkZWEgdG8gbWUgYXQgdGhlIG1vbWVu
dCBpcyBwdXR0aW5nIHRlc3RzIGZvcgo+IElTX0VOQUJMRUQoUklTQ1ZfSVNBX0ZPTykgaW50byB0
aGVzZSB2YWxpZGF0ZSBob29rcy4KClllYWgsIHNlZSB3aGF0IHlvdSBtZWFuLiBJIHRoaW5rIHdl
IGFsc28gbmVlZCB0byBkZWZpbmUgaWYgd2Ugd2FudCB0bwpleHBvc2UgYWxsIHRoZSBJU0EgZXh0
ZW5zaW9ucyBpbiAvcHJvYy9jcHVpbmZvIChpZSBubyBtYXR0ZXIgdGhlIGNvbmZpZwpvZiB0aGUg
a2VybmVsKSBvciBub3QuIElmIHNvLCBhZGRpdGlvbmFsIHZhbGlkYXRlKCkgY2FsbGJhY2sgd291
bGQgbWFrZQpzZW5zZS4gSWYgd2Ugd2FudCB0byBrZWVwIHRoZSBmdWxsIElTQSBzdHJpbmcgaW4g
L3Byb2MvaW5mbywgdGhlbiB3ZQp3aWxsIG5lZWQgYW5vdGhlciB3YXkgb2YgZG9pbmcgc28uCgo+
IAo+IEknbGwgdHJ5IHRvIGxvb2sgYXQgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBoZXJlIHRv
bW9ycm93LgoKR3JlYXQsIHRoYW5rcy4KCkNsw6ltZW50Cgo+IAo+IENoZWVycywKPiBDb25vci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
