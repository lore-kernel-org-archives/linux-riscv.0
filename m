Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7B2C47DA7
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 07:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJJgvBd4ciTK70fNmW4SnfVtCN+rxdHPY17niYWGdqU=; b=12bMMYfT9JkUMG
	6s7BXxxqR5p7E2JEDTbEJknYooqVDL29ruQ5npzo7HPXzRp75FgBysv/MGvuEYCDPwO0UwFvtI9Ug
	rw/TWKf7LNJmAVV97WGvK6HSU72jCALOuzvWnXhqbUrO9MO7yXQ5kXGyROtiD3xKySzR9NFCJQAJn
	Cg2c5vIMxpiy4J85Rh392IfHOU3ycCZ3yp1qukz0ugVJuAxp4mDTjrfJmIGhTdvBDZczsfRHs3Xts
	tPDG0IHLPPUhtNC1Qz5JdKzwZQsw//3vyC/B2wGrcx77Ju0Rnv723bTON4J3spcVDh3ONYDwXcXqX
	LbEfryhmf4M0cqnZ9Y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0Lo-00Egjh-1d;
	Wed, 17 Jan 2024 07:28:40 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0Lj-00EgjE-2p
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 07:28:37 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50ea9e189ebso12311673e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 23:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705476511; x=1706081311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phJlqIJpEW8SqL09qKW+SfxMOx0V7LTY01BjUv6mizw=;
        b=SFi+O1J8R71fbvZbCC6XzhVR6xOHXdtYo5GuP/0W43fcKsDGxpfzU5ANEi4kOOkxSv
         kMsbkTFVIwgPkPM6WUTVHz53MoUBXCIybgz5gACZ4m+6u0pPW9M9usw4TJFqG4NuVJEz
         zhW+AoAHCdcMcEI1wut2Vvhw2V0ZH1+7kqAi13DbJ/Y6ESZHYTL5mDtkLzfcNqafR45K
         kJURBj27BrRyyfg8kCSfmaztksw8GtlRfUV2ZdmwRLl2mxcHgRUbEHFbfl/ZrW2aKgx+
         7gPSM7pRvB0ak69qvx83+cr1xpV1yaPyW2QBHRNCsasK8pyXuWbSG+wJcKkY8mNuqxKo
         UAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705476511; x=1706081311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phJlqIJpEW8SqL09qKW+SfxMOx0V7LTY01BjUv6mizw=;
        b=Si1mhR5txKlHDN7duC75rqcC+F5qbEnyLj0RAe1XCCy2W4AV+dcjCV1It+86kGw7Eo
         PUxP44bjJ/oepY6YsKRRpsTLIAIJjZsuQ9BgkO7G4oj+5K1sTMzLYFjU+g+vJRSrMuPK
         CRLPgpKZd2fyvjJMw5ndSO3pf/Z05PVujeJDgsvm5GBW7EubFfrsgjrXTCFkQN6XpzfM
         BEM0d+iLIjxML+WNYVkBgfrEnXG4OEzoU691dyR1bMbFi6Fomvg8ripJoL28t1CJ93r8
         cMXupBYHpYWJqWt60GDjj0wG2oL+2bcf7mCYpD2gJXjGpJMRxLRKxqR6WRz64BWraubs
         tbYA==
X-Gm-Message-State: AOJu0Yxb+VHcQx05KiY4oN4CQdRNrIsGz7D9Yce8BM/PWXIKe7aC4Yk5
	Z8a7LoJ+VNGHl2lUXKTH96ZQKRdl5ZDrDA==
X-Google-Smtp-Source: AGHT+IH9hHciuhF5K41Lf06HGxi4+feqNSRkmGOauDu7lDWjSuC7ivZ8xszoHdTF7X88kNfD6edNfA==
X-Received: by 2002:a19:6915:0:b0:50e:e779:e6f7 with SMTP id e21-20020a196915000000b0050ee779e6f7mr3247493lfc.122.1705476511610;
        Tue, 16 Jan 2024 23:28:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id x25-20020a1709064bd900b00a28f54aacf1sm7458859ejv.185.2024.01.16.23.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 23:28:31 -0800 (PST)
Message-ID: <326dd12e-2d52-4d4c-8197-5d35a0c52cf5@linaro.org>
Date: Wed, 17 Jan 2024 08:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
Content-Language: en-US
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com,
 unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dlan@gentoo.org, inochiama@outlook.com
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com>
 <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
 <CAJRtX8QFLoWnJBkepZrbneHX8qZdde=aw+zbdErVC91B=u==MA@mail.gmail.com>
 <007e8c14-13eb-4917-b9da-8d47d6c965c7@linaro.org>
 <CAJRtX8ROH4R_s1=ML5ka340PAE0SWJKK24yVWHw5gCd+7d9pkA@mail.gmail.com>
 <dfcf74a9-db76-43fe-9261-20bf7a993bc3@linaro.org>
 <CAJRtX8Tkie+ykLv8L2EgBQcy9tVP5Yz-_J_eHE-9N9hjt+6gkg@mail.gmail.com>
 <f99da95d-a6ab-4646-8ad8-8245e275639e@linaro.org>
 <CAJRtX8Qxvpf_CTJG41U6JC3_qLL9raFxX3LD0LoPNhve=MDyFA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAJRtX8Qxvpf_CTJG41U6JC3_qLL9raFxX3LD0LoPNhve=MDyFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_232835_949079_ECF119CB 
X-CRM114-Status: GOOD (  33.82  )
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

T24gMTcvMDEvMjAyNCAwNDoyNCwgSmluZ2JhbyBRaXUgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMTcs
IDIwMjQgYXQgMTI6NTjigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCj4gPGtyenlzenRvZi5rb3ps
b3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDE2LzAxLzIwMjQgMTc6MjksIEppbmdi
YW8gUWl1IHdyb3RlOgo+Pj4gT24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgMTI6MDPigK9BTSBLcnp5
c3p0b2YgS296bG93c2tpCj4+PiA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90
ZToKPj4+Pgo+Pj4+IE9uIDE2LzAxLzIwMjQgMTY6NTEsIEppbmdiYW8gUWl1IHdyb3RlOgo+Pj4+
Pj4+IENWMTgwMCBpcyBhIFJJU0NWIGJhc2VkIFNPQyB0aGF0IGluY2x1ZGVzIGFuIFJUQyBtb2R1
bGUuIFRoZSBSVEMKPj4+Pj4+PiBtb2R1bGUgaGFzIGFuIE9TQyBvc2NpbGxhdG9yCj4+Pj4+Pgo+
Pj4+Pj4KPj4+Pj4+IEkgYW0gbm90IGdvaW5nIHRvIHJlYWQgcGFnZXMgb2YgZGVzY3JpcHRpb24u
IFBsZWFzZSB3cml0ZSBjb25jaXNlIHJlcGxpZXMuCj4+Pj4+Cj4+Pj4+IFRoYW5rcywgV2hhdCBJ
IG1lYW4gaXMgdGhhdCB0aGlzIGhhcmR3YXJlIGluY2x1ZGVzIHR3byBmdW5jdGlvbnMsIFJUQwo+
Pj4+PiBhbmQgUE9SLiBIb3cgc2hvdWxkIEkgZGVzY3JpYmUgdGhlaXIgcmVsYXRpb25zaGlwPwo+
Pj4+Cj4+Pj4gWW91ciBQT1IgZG9lcyBub3QgbmVlZCB0byB0YWtlIGFueSByZXNvdXJjZXMsIHNv
IG5vIG5lZWQgdG8gZGVzY3JpYmUgYW55Cj4+Pj4gcmVsYXRpb25zaGlwLgo+Pj4+Cj4+Pj4gLi4u
Cj4+Pj4KPj4+Pj4+PiBZb3VyIHN1Z2dlc3Rpb24gaXMsIGZpcnN0bHksIHRoZSBwb3Igc3VibW9k
dWxlIGRvZXMgbm90IGhhdmUgYW55Cj4+Pj4+Pj4gcmVzb3VyY2VzLCBzbyBpdCBzaG91bGQgYmUg
ZGVsZXRlZC4KPj4+Pj4+Cj4+Pj4+PiBTbyB3aGVyZSBkaWQgeW91IGRlbGV0ZSBpdD8gSSBzdGls
bCBzZWUgaXQgaW4gdGhpcyBwYXRjaC4KPj4+Pj4KPj4+Pj4gU2hvdWxkIEkgY29tcGxldGVseSBk
ZWxldGUgaGltPyBIb3cgY2FuIGEgcG9yIGRyaXZlciBvYnRhaW4gZGV2aWNlIGluZm9ybWF0aW9u
Pwo+Pj4+Cj4+Pj4gRGVsZXRlIGNvbXBsZXRlbHkuCj4+Pj4KPj4+PiBEZXZpY2UgaW5mb3JtYXRp
b24/IFdoYXQgaXMgdGhpcz8gV2UgYWxyZWFkeSBhZ3JlZWQgeW91IGRvbid0IGhhdmUgYW55Cj4+
Pj4gcmVzb3VyY2VzIGZvciBQT1IuCj4+Pj4KPj4+PiAuLi4uCj4+Pj4KPj4+Pj4+IERldmljZSBp
cyBvbmx5IG9uZSB0aGluZywgbm90IHR3by4KPj4+Pj4+Cj4+Pj4+Pj4gICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHg1MDI1MDAwIDB4MjAwMD47Cj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHRzID0gPDE3IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgY2xvY2tzID0gPCZvc2M+Owo+Pj4+Pj4+IH07Cj4+Pj4+Pj4gSG93ZXZlciwg
aW4gcmVhbGl0eSwgdGhlIFBPUiBzdWJtb2R1bGUgZG9lcyBub3QgdXNlIElSUSBhbmQgQ0xLLgo+
Pj4+Pj4+IFBsZWFzZSBkbyBub3QgaGVzaXRhdGUgdG8gdGVhY2guIFRoYW5rcy4KPj4+Pj4+Cj4+
Pj4+PiBJIGV4cGVjdCBvbmUgZGV2aWNlIG5vZGUuIEhvdyBtYW55IGRyaXZlcnMgeW91IGhhdmUg
ZG9lcyBub3QgbWF0dGVyOiB5b3UKPj4+Pj4+IGNhbiBpbnN0YW50aWF0ZSAxMDAgTGludXggZGV2
aWNlcyBpbiAxMDAgTGludXggZGV2aWNlIGRyaXZlcnMuCj4+Pj4+Cj4+Pj4+IEkgdW5kZXJzdGFu
ZCB3aGF0IHlvdSBtZWFuLiBBIGRldmljZSBub2RlIGNvcnJlc3BvbmRzIHRvIG11bHRpcGxlIGRy
aXZlcnMuCj4+Pj4+IFNob3VsZCBJIGNvbXBsZXRlbHkgZGVsZXRlIHRoZSBQT1IgZGV2aWNlIHRy
ZWUgbm9kZSBhbmQgYWRkIGl0IHdoZW4KPj4+Pj4gc3VibWl0dGluZyB0aGUgUE9SIGRyaXZlcj8K
Pj4+Pgo+Pj4+ID8gSSB3cm90ZSBpdCBpbiBwcmV2aW91cyBtZXNzYWdlcyBhbmQgdHdpY2UgaW4g
dGhpcyB0aHJlYWQuIENvbXBsZXRlbHkKPj4+PiBkZWxldGUuIFlvdSBkbyBub3QgYWRkIGl0IGJh
Y2shIEJlY2F1c2UgaWYgeW91IGV2ZXIgaW50ZW5kZWQgdG8gYWRkIGl0Cj4+Pj4gYmFjaywgaXQg
c2hvdWxkIGJlIGFkZGVkIHNpbmNlIGJlZ2lubmluZy4gSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQK
Pj4+PiBzdWJtaXR0aW5nIGxhdGVyIHdvdWxkIHNvbHZlLgo+Pj4+Cj4+Pj4+IElmIHRoYXQncyB0
aGUgY2FzZSwgaG93IGNhbiBJIGV4cGxhaW4gdGhhdCB0aGUgcnRjIGRldmljZSB0cmVlIG5vZGUK
Pj4+Pj4gdXNlcyB0aGUgc3lzY29uIHRhZz8KPj4+Pj4gSG93IGNhbiBJIGRlc2NyaWJlIGEgUE9S
IGRldmljZSBpbiBEVFM/IFBPUiBpcyBhIHN1Ym1vZHVsZSBvZiBSVEMsIGFuZAo+Pj4+PiBpdCBh
bHNvIGhhcyBjb3JyZXNwb25kaW5nIGRyaXZlcnMuCj4+Pj4KPj4+PiBJIHNhaWQsIHRoZXJlIGlz
IG5vIG5lZWQgZm9yIFBPUiBpbiBEVFMsIGJlY2F1c2UgeW91IGhhdmUgbm90aGluZyB0aGVyZS4K
Pj4+PiBXaHkgZG8geW91IGluc2lzdCBvbiBwdXR0aW5nIGl0IG9uIERUUz8KPj4+Pgo+Pj4+PiBJ
dCdzIGp1c3QgdGhhdCBoaXMgcmVzb3VyY2VzIGFyZSBvbmx5IHNoYXJlZCB3aXRoIFJUQydzIFJl
Zy4KPj4+Pgo+Pj4+IFdoYXQgcmVzb3VyY2VzPyBSZWc/IFRoYXQncyBub3QgYSBzZXBhcmF0ZSBy
ZXNvdXJjZS4KPj4KPj4gSSBtZWFudCwgc2VwYXJhdGUgZnJvbSB0aGUgUlRDLiBJIGhhZCBpbXBy
ZXNzaW9uIHRoYXQgSU8gc3BhY2UgaXMgc2hhcmVkCj4+IG9yIG1peGVkIHdpdGggUlRDPyBJZiBp
dCBpcyBzZXBhcmF0ZSwgd2h5IGl0IHdhc24ndCBsaXN0ZWQ/Cj4+Cj4+Pgo+Pj4gSSdtIHZlcnkg
c29ycnkgYWJvdXQgdGhpcy4KPj4+IEJ1dCBJIGZvdW5kIGEgYmluZGluZyBmaWxlIHRoYXQgb25s
eSBjb250YWlucyBSZWcgYW5kIENvbXBhdGlibGUuCj4+Pgo+Pj4gcnRjQDgwOTIwMDAwIHsKPj4+
IGNvbXBhdGlibGUgPSAiY2lycnVzLGVwOTMwMS1ydGMiOwo+Pj4gcmVnID0gPDB4ODA5MjAwMDAg
MHgxMDA+Owo+Pj4gfTsKPj4+Cj4+PiBMaW5rOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcnRjL2NpcnJ1cyxlcDkzMDEtcnRjLnlhbWwKPj4KPj4gQW5kPwo+Pgo+Pj4KPj4+Pgo+
Pj4+IFRvIHN1bW1hcml6ZTogRHJvcCBQT1IgZnJvbSBEVFMgYW5kIG5ldmVyIGJyaW5nIGl0IGJh
Y2ssIHVubGVzcyB5b3UgY29tZQo+Pj4+IHdpdGggc29tZSBkaWZmZXJlbnQgYXJndW1lbnRzLCB3
aGljaCB5b3UgZGlkIG5vdCBzYXkgYWxyZWFkeS4KPj4+Pgo+Pj4KPj4+IFlvdSBhcmUgcmlnaHQs
IGlmIHRoZXJlIGlzIG5vIHBvciBkZXZpY2UgdHJlZSBub2RlLCBob3cgY2FuIHRoZSBwb3IKPj4+
IGRyaXZlciBvYnRhaW4gdGhlIFJlZz8KPj4KPj4gVGhlIHNhbWUgYXMgY3VycmVudGx5LiBEb2Vz
IHlvdXIgUE9SIG5vZGUgaGFzIHJlZz8gTm8sIHNvIGFjY29yZGluZyB0bwo+PiB5b3VyIGxvZ2lj
IGl0IGNhbm5vdCBvYnRhaW4gYWRkcmVzcyBzcGFjZS4KPj4KPj4gQ2hpbGRyZW4gTGludXggZGV2
aWNlcyBzaGFyZSByZWdtYXAgd2l0aCBwYXJlbnQgZGV2aWNlLgo+Pgo+IAo+IFRoYW5rcywgUG93
ZXItT24tUmVzZXQvUE9SIGRyaXZlciByZXF1aXJlcyBSZWcgdG8gY29tcGxldGUgaXRzIGZ1bmN0
aW9ucy4KPiBUaGUgY29tcGF0aWJsZSBvZiBQT1IgaXMgcmVxdWlyZWQgaW4gRFRTIHRvIGxvYWQg
dGhlIGNvcnJlc3BvbmRpbmcgZHJpdmVyLgoKTm8sIGl0IGlzIG5vdCBuZWVkZWQuIEkgYWxzbyB3
cm90ZSB0byBpbiBwcmV2aW91cyBtZXNzYWdlcyB0byBrZWVwCmRyaXZlcnMgb3V0IG9mIHRoaXMu
IFRoZXkgYXJlIG5vdCByZWxhdGVkIHRvIHRoaXMgdG9waWMgYW5kIGRvbid0IHVzZQp0aGVtIGFz
IGFyZ3VtZW50cy4KCgo+IFRoZSBQT1IgZHJpdmVyIHdhcyBub3Qgc3VibWl0dGVkIGluIHRoZSBw
YXRjaC4gSG93ZXZlciwgdGhpcyBwYXRjaCByZXF1aXJlcwo+IHRoZSBhZGRpdGlvbiBvZiBSVEMg
aW4gRFRTLiBDb25zaWRlcmluZyB0aGUgZnV0dXJlIGFkZGl0aW9uIG9mIFBPUgoKTm8uIEJpbmRp
bmdzICpNVVNUIEJFIENPTVBMRVRFKiwgbm90IGRlcGVuZCBvbiBzb21lIG90aGVyIGRyaXZlcnMu
ClN1Ym1pdCAqQ09NUExFVEUqIGJpbmRpbmdzIGZvciBlbnRpcmUgaGFyZHdhcmUuIFRoZW4gc3Vi
bWl0IGNvbXBsZXRlCkRUUy4gSSBkb24ndCBjYXJlIGFib3V0IHRoZSBkcml2ZXJzIGFuZCB0aGV5
IGRvIG5vdCBoYXZlIHRvIGJlIGNvbXBsZXRlLgoKCj4gZHJpdmVyLCBJIGFkZGVkIGEgUE9SIG5v
ZGUuCj4gSSdtIG5vdCBzdXJlIHdoeSB0aGUgUE9SIG5vZGUgbmVlZHMgdG8gYmUgZGVsZXRlZCwg
anVzdCBiZWNhdXNlIGl0Cj4gb25seSBoYXMgdGhlIGNvbXBhdGlibGUgYXR0cmlidXRlPwoKVGhp
cyBpcyBsaWtlIGEgdGVudGggbWVzc2FnZSBhbmQgSSB3YXMgZXhwbGFpbmluZyBpdCBtdWx0aXBs
ZSB0aW1lcy4gR28KYmFjayB0byBwcmV2aW91cyBlbWFpbHMuCgo+IE9yIG1heWJlIGl0J3MgYmVj
YXVzZSBJIGRpZG4ndCBzdWJtaXQgdGhlIFBPUiBkcml2ZXIsIHNvIEkgbmVlZCB0bwo+IGRlbGV0
ZSB0aGUgUE9SIG5vZGUuCgpQbGVhc2UgZG9uJ3QgbWVudGlvbiBkcml2ZXJzIGFueW1vcmUgaW4g
dGhpcyBkaXNjdXNzaW9ucy4gSXQgb25seQpjb25mdXNlcyB5b3UuCgo+IEkgZm91bmQgYW4gZXhh
bXBsZS4KPiAKPiBzdDogdGltZXJAZmZmZmZkMDAgewo+ICAgICBjb21wYXRpYmxlID0gImF0bWVs
LGF0OTFybTkyMDAtc3QiLCAic3lzY29uIiwgInNpbXBsZS1tZmQiOwo+ICAgICByZWcgPSA8MHhm
ZmZmZmQwMCAweDEwMD47Cj4gICAgIGludGVycnVwdHMgPSA8MSBJUlFfVFlQRV9MRVZFTF9ISUdI
IDc+Owo+ICAgICBjbG9ja3MgPSA8JnNsb3dfeHRhbD47Cj4gICAgIHdhdGNoZG9nIHsKPiAgICAg
ICBjb21wYXRpYmxlID0gImF0bWVsLGF0OTFybTkyMDAtd2R0IjsKPiAgICAgfTsKPiB9Owo+IAo+
IExpbms6YXJjaC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL2F0OTFybTkyMDAuZHRzaToxMTQKPiAK
PiBMaWtlIHRoaXMsIHdoZW4gdGhlIHBvciBkcml2ZXIgaW5zbW9kIGlzIGFjdGl2YXRlZCwgdGhl
IHBvciBkcml2ZXIgY2FuCj4gb2J0YWluIHRoZSByZWdzIG9mIHRoZSBwYXJlbnQgZGV2aWNlLgoK
RXhhbXBsZSBvZiB3aGF0PyBXaGF0IGlzIHRoZSBxdWVzdGlvbj8gSSBmb3VuZCBhIGJ1ZyBpbiBM
aW51eCwgc28gY2FuIEkKY3JlYXRlIHN1Y2ggYnVnIGFnYWluPwoKVGhpcyBkaXNjdXNzaW9uIGlz
IGZydWl0bGVzcyBhbmQgdGlyZXNvbWUuIFlvdSBhcmUgcmVwZWF0aW5nIHRoZSBzYW1lCmlzc3Vl
cyBhbmQgYXNraW5nIHRoZSBzYW1lIHF1ZXN0aW9ucy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
