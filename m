Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E6CC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gij6zhAAxwQukA/EVctRh3v0pwxGfOexf+/1fYR6nn0=; b=F3FUnntNBQrT4a
	ztdq1cGO6rVO26Z8AQOnTNe1CRwS76SrgoFU81FZTwHXGQF60Zpg//SpfrbzpKQssTxyBaSG6cK24
	cjXBUS7skqTkCDeILdsnO6+ianu6cuo1kkQ4FK0XIhnBNDbKqQCBv/0uiCNwR+hmc4sc128Y+szkJ
	RfgkO7PsmblcdHwswITLNczGVOSM0qUqwDRdckKi+BrVdRMbwD2x6AmP4wMqLHe7asPhwLjXmNe54
	xM7bpotnesrmoxnqhjFl4GLmq8NfJl0g2Y9Bys8hsBal8mJrdVeUxLEL+OYzNo+g/hjfkUHZxKj1t
	wyZrNe69onEVwXrFiWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypQJ-0000000CmVG-0tFW;
	Mon, 22 Apr 2024 08:53:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypQG-0000000CmST-3zjV
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Apr 2024 08:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+/fvR+HwOJPjnOfbOHG69UP92YiSjqkbM928Puj2/Go=; b=RTakisCVB801+eWoAEoLBpuQWX
	k83crr3P3zqPPwYj7wHYKEgwIGCq8EuqoJdJf32k4kw2XOo2waiUJvXFbdQ/fV8C1xguWpb2asllx
	58Ib96V9kteOOR793Zi7F7GW9xLyh+5q74u2wbRAQ9ttzziEuoaUXqEbho+raCYCYSCgVKDMoWzMJ
	/MEnWqPcHz5uKtXmGaxZugbkjZWPgVai30NuuLK3vuDD+fHxWax77pk8nAg4hrbXlJXdnLZcvbv0D
	h0DAGXKSQxLdaeBp9SavSPoBLdMaI0qphZzrOlou/Y4QYAOBWdJmED7F1FlpZOnSkNrFPJuz8HL8q
	9qIyYxoA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypQC-0000000Db6F-3Pgf
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 08:53:11 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-34b39ecbcccso53113f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 01:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713775986; x=1714380786; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/fvR+HwOJPjnOfbOHG69UP92YiSjqkbM928Puj2/Go=;
        b=fbJWSmrNb3TWD1zyC8EB0FIW8pswxOsle9MUokrUwYttI/W/Guzel7EfxbizDLoxDV
         FHqeYof/FnC+9CHhIFe7lGPOwgk1HobU/ig/NVoI8ORwUj/7CMYVd3SdN/WItbH3d1rQ
         gn+rLOC9Nq9rDzxPtDEt/aQR6fugVcT1uABfCkT+r76SDZa/7NvUNjFmlmS8M6viaCiY
         Y21KCLXrmNn3qAo5cA2EHIipxrs6pKMfDJrkVy0aeeU9iXuXa1x/C7f4CMwowWOTMeES
         p924kS/ujcruahvVeAdC0K6+owjqjCM3c2ojC3zcg9CtJxy1qFNSF62Em7hJrngGVcgF
         C7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713775986; x=1714380786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/fvR+HwOJPjnOfbOHG69UP92YiSjqkbM928Puj2/Go=;
        b=qbAUTgBLIP4Kjjlj9zlN7YdCUO5K5fYngu/Nlb4/PuxlLcTzQtiUV5iJP7K0hxLPVK
         pvC4ZvXM3CBdzaC3di3uOfEh4bU7Dlg1gGFRplK4fOGxoVtA2wSah+VicSmQrfBxxdW/
         Z2fUt28nR3ABQZ4dH4c1urVvaD2Vc8hIHVaYwvAxfAoVIJChutKmTz5Nj9uFYYAF0zzi
         3whLaRtLnN1MXBEWqiE7pumYrleqC7uQi1Y1+W8Y41ycQ/nF9+KyNKSv1Gz/r4qMNkzy
         gPnapF5FDC8ZUjEvsxv2bONFzexjKtCa8w1UIkV7I9PRIvQN7SPAsySF0hHtJAIp/nwt
         Ge4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMzRhHzT3npu0dBP804t/u4esbuIP0WzJxFk87KzmMwflcTTrKO1qT3fsL/iMh3p1igL+jJFyZAKqPCHthyqciv8h+Q60k/GhTN5nPJZJT
X-Gm-Message-State: AOJu0YyRa1XU/uSl+n6s3+YW72ughOPwgSudSKfpYbFAGkyL/3iTZiJf
	77BcavrM4TgSBAJx6V//lceSfc7DIc7Q4O+UacugCEbxfrZLs+eQtCG5QAnaZBs=
X-Google-Smtp-Source: AGHT+IFE4R9zCUkzHMX1ToR2kyTpvZV9gQXHpyVa4BPp1ldGkiKbLmpz+4IIFAyNc6nOuO6PT/9Ayg==
X-Received: by 2002:a05:600c:3baa:b0:418:1303:c3d1 with SMTP id n42-20020a05600c3baa00b004181303c3d1mr7145059wms.3.1713775986113;
        Mon, 22 Apr 2024 01:53:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:dc65:11af:998:225e? ([2a01:e0a:999:a3a0:dc65:11af:998:225e])
        by smtp.gmail.com with ESMTPSA id g7-20020a05600c310700b0041a92bb0c10sm25826wmo.2.2024.04.22.01.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 01:53:05 -0700 (PDT)
Message-ID: <f89c79f7-a09e-4fcf-8e16-0875202ade4a@rivosinc.com>
Date: Mon, 22 Apr 2024 10:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] dt-bindings: riscv: add Zc* extension rules
 implied by C extension
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-4-cleger@rivosinc.com>
 <20240419-blinked-timid-da722ec6ddc4@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240419-blinked-timid-da722ec6ddc4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_095309_056382_DB347D28 
X-CRM114-Status: GOOD (  34.60  )
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

CgpPbiAxOS8wNC8yMDI0IDE3OjQ5LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTgsIDIwMjQgYXQgMDI6NDI6MjZQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
cyBzdGF0ZWQgYnkgWmMqIHNwZWM6Cj4+Cj4+ICJBcyBDIGRlZmluZXMgdGhlIHNhbWUgaW5zdHJ1
Y3Rpb25zIGFzIFpjYSwgWmNmIGFuZCBaY2QsIHRoZSBydWxlIGlzIHRoYXQ6Cj4+ICAtIEMgYWx3
YXlzIGltcGxpZXMgWmNhCj4+ICAtIEMrRiBpbXBsaWVzIFpjZiAoUlYzMiBvbmx5KQo+PiAgLSBD
K0QgaW1wbGllcyBaY2QiCj4+Cj4+IEFkZCBhZGRpdGlvbm5hbCB2YWxpZGF0aW9uIHJ1bGVzIHRv
IGVuZm9yY2UgdGhpcyBpbiBkdHMuCj4gCj4gSSdsbCBnZXQgaXQgb3V0IG9mIHRoZSB3YXk6IE5B
SywgYW5kIHRoZSBkdHMgcGF0Y2ggaXMgdGhlIHBlcmZlY3QKPiBleGFtcGxlIG9mIHdoeS4gSSBk
b24ndCB3YW50IHVzIHRvIGhhdmUgdG8gY29udGludWFsbHkgdXBkYXRlCj4gZGV2aWNldHJlZXMu
IElmIHRoZXNlIGFyZSBpbXBsaWVkIGR1ZSB0byBiZWluZyBzdWJzZXRzIG9mIG90aGVyCj4gZXh0
ZW5zaW9ucywgdGhlbiBzb2Z0d2FyZSBzaG91bGQgYmUgYWJsZSB0byBlbmFibGUgdGhlbSB3aGVu
IHRoYXQKPiBvdGhlciBleHRlbnNpb24gaXMgcHJlc2VudC4KCkFja2VkLgoKPiAKPiBNeSBmZWFy
IGlzIHRoYXQsIGFuZCBhIHF1aWNrIGxvb2sgYXQgdGhlICJhZGQgcHJvYmluZyIgY29tbWl0IHNl
ZW1lZCB0bwo+IGNvbmZpcm0gaXQsIG5ldyBzdWJzZXRzIHdvdWxkIHJlcXVpcmUgdXBkYXRlcyB0
byB0aGUgZHRzLCBldmVuIHRob3VnaAo+IHRoZSBleGlzdGluZyBleHRlbnNpb24gaXMgcGVyZmVj
dGx5IHN1ZmZpY2llbnQgdG8gZGV0ZXJtaW5lIHByZXNlbmNlLgo+IAo+IEkgZGVmaW5pdGVseSB3
YW50IHRvIGF2b2lkIGNvbnRpbnVhbCB1cGRhdGVzIHRvIHRoZSBkZXZpY2V0cmVlIGZvciBjaHVy
bgo+IHJlYXNvbnMgd2hlbmV2ZXIgc3Vic2V0cyBhcmUgYWRkZWQsIGJ1dCBub3QgdHVybmluZyBv
biB0aGUgbGlrZXMgb2YgWmNhCj4gd2hlbiBDIGlzIHByZXNlbnQgYmVjYXVzZSAidGhlIGJpbmRp
bmdzIHdlcmUgdXBkYXRlZCB0byBlbmZvcmNlIHRoaXMiCj4gaXMgYSBjb21wbGV0ZSBibG9ja2Vy
LiBJIGRvIGNvbmNlZGUgdGhhdCBoYXZpbmcgdHdvIHBhcmVudHMgbWFrZXMgdGhhdAo+IG1vcmUg
ZGlmZmljdWx0IGFuZCB3aWxsIGxpa2VseSByZXF1aXJlIHNvbWUgY2hhbmdlcyB0byBob3cgd2Ug
cHJvYmUgLSBkbwo+IHdlIG5lZWQgdG8gaGF2ZSBhICJzZWNvbmQgcm91bmQiIHR5cGUgdGhpbmc/
CgpZZWFoLCBJIHVuZGVyc3RhbmQuIEF0IGZpcnN0LCBJIGFjdHVhbGx5IGRpZCB0aGUgbW9kaWZp
Y2F0aW9ucyBpbiB0aGUKSVNBIHByb2JpbmcgbG9vcCB3aXRoIHNvbWUgZGVwZW5kZW5jeSBwcm9i
aW5nIChpZSBsb29wIHdoaWxlIHdlIGRvbid0CmhhdmUgYSBzdGFibGUgZXh0ZW5zaW9uIHN0YXRl
KS4gQnV0IEkgdGhvdWdodCB0aGF0IGl0IHdhcyBub3QgYWN0dWFsbHkKb3VyIHByb2JsZW0gYnV0
IHJhdGhlciB0aGUgSVNBIHN0cmluZyBwcm92aWRlci4gRm9yIGluc3RhbmNlLCBRZW11CnByb3Zp
ZGVzIHRoZW0uCgoKPiBUYWtpbmcgWmNmIGFzIGFuIGV4YW1wbGUsIG1heWJlIHNvbWV0aGluZyBs
aWtlIG1ha2luZyBib3RoIG9mIEMgYW5kIEYgaW50bwo+ICJzdGFuZGFyZCIgc3VwZXJzZXRzIGFu
ZCBhZGRpbmcgYSBjYXNlIHRvIHJpc2N2X2lzYV9leHRlbnNpb25fY2hlY2soKQo+IHRoYXQgd291
bGQgbWFuZGF0ZSB0aGF0IFpjYSBhbmQgRiBhcmUgZW5hYmxlZCBiZWZvcmUgZW5hYmxpbmcgaXQs
IGFuZCB3ZQo+IHdvdWxkIGVuc3VyZSB0aGF0IEMgaW1wbGllcyBaY2EgYmVmb3JlIGl0IGltcGxp
ZXMgWmNmPwoKSSdtIGFmcmFpZCB0aGF0IHJpc2N2X2lzYV9leHRlbnNpb25fY2hlY2soKSB3aWxs
IGJlY29tZSBhIHJhdCBuZXN0IHNvCnJhdGhlciB0aGFuIGdvaW5nIHRoYXQgd2F5LCBJIHdvdWxk
IGJlIGluIGZhdm9yIG9mIGFkZGluZyBhIHZhbGlkYXRpb24KY2FsbGJhY2sgZm9yIHRoZSBleHRl
bnNpb25zIGlmIG5lZWRlZC4KCj4gCj4gR2l2ZW4gd2UnZCBiZSByZWx5aW5nIG9uIG9yZGVyaW5n
LCB3ZSBoYXZlIHRvIHBlcmZvcm0gdGhlIHNhbWUgaW1wbGljYXRpb24KPiBmb3IgYm90aCBGIGFu
ZCBDIGFuZCBtYWtlIHN1cmUgdGhhdCB0aGUgImltcGxpZXMiIHN0cnVjdCBoYXMgWmNhIGJlZm9y
ZSBaY2YuCj4gSSBkb24ndCByZWFsbHkgbGlrZSB0aGF0IHN1Z2dlc3Rpb24sIGhvcGVmdWxseSB0
aGVyZSdzIGEgbmljZXIgd2F5IG9mIGRvaW5nCj4gdGhhdCwgYnV0IEkgZG9uJ3QgbGlrZSB0aGUg
ZHQgc3R1ZmYgaGVyZS4KCkkgZ3Vlc3MgdGhlICJjbGVhbmVzdCIgd2F5IHdvdWxkIGJlIHRvIGhh
dmUgc29tZSAiZGVmZXJlZC1saWtlIgptZWNoYW5pc20gaW4gSVNBIHByb2Jpbmcgd2hpY2ggd291
bGQgYWxsb3cgdG8gaGFuZGxlIG9yZGVyaW5nIGFzIHdlbGwgYXMKZGVwZW5kZW5jaWVzL2ltcGxp
ZXMgZm9yIGV4dGVuc2lvbnMuIEZvciBaY2EsIFpjZiwgd2UgYWN0dWFsbHkgZG8gbm90CmhhdmUg
b3JkZXJpbmcgcHJvYmxlbXMgYnV0IEkgdGhpbmsgaXQgd291bGQgYmUgYSBiaXQgYnJva2VuIG5v
dCB0bwpzdXBwb3J0IHRoYXQgYXMgd2VsbC4KCkkgY2FuIGFjdHVhbGx5IHJldml2ZSB0aGUgd29y
ayBtZW50aW9uZWQgYWJvdmUgdG8gaGFuZGxlIHRoYXQgYW5kIHNlZSBpZgppdCB3b3JrcyBvay4K
CkNsw6ltZW50Cgo+IAo+IFRoYW5rcywKPiBDb25vci4KPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCAgICAgICB8ICA4ICsrKy0tCj4+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAzNCArKysrKysrKysr
KysrKysrKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvY3B1cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2NwdXMueWFtbAo+PiBpbmRleCBkODdkZDUwZjFhNGIuLmM0ZTJjNjU0MzdiMSAxMDA2NDQK
Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFt
bAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55
YW1sCj4+IEBAIC0xNjgsNyArMTY4LDcgQEAgZXhhbXBsZXM6Cj4+ICAgICAgICAgICAgICAgICAg
aS1jYWNoZS1zaXplID0gPDE2Mzg0PjsKPj4gICAgICAgICAgICAgICAgICByZWcgPSA8MD47Cj4+
ICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWJhc2UgPSAicnY2NGkiOwo+PiAtICAgICAgICAg
ICAgICAgIHJpc2N2LGlzYS1leHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImMiOwo+PiArICAg
ICAgICAgICAgICAgIHJpc2N2LGlzYS1leHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImMiLCAi
emNhIjsKPj4gIAo+PiAgICAgICAgICAgICAgICAgIGNwdV9pbnRjMDogaW50ZXJydXB0LWNvbnRy
b2xsZXIgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwx
PjsKPj4gQEAgLTE5NCw3ICsxOTQsOCBAQCBleGFtcGxlczoKPj4gICAgICAgICAgICAgICAgICBy
ZWcgPSA8MT47Cj4+ICAgICAgICAgICAgICAgICAgdGxiLXNwbGl0Owo+PiAgICAgICAgICAgICAg
ICAgIHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPj4gLSAgICAgICAgICAgICAgICByaXNjdixp
c2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImQiLCAiYyI7Cj4+ICsgICAgICAg
ICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEiLCAiZiIsICJkIiwg
ImMiLCAiemNhIiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6
Y2QiOwo+PiAgCj4+ICAgICAgICAgICAgICAgICAgY3B1X2ludGMxOiBpbnRlcnJ1cHQtY29udHJv
bGxlciB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDE+
Owo+PiBAQCAtMjE1LDcgKzIxNiw4IEBAIGV4YW1wbGVzOgo+PiAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAicmlzY3YiOwo+PiAgICAgICAgICAgICAgICAgIG1tdS10eXBlID0gInJpc2N2
LHN2NDgiOwo+PiAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPj4g
LSAgICAgICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJm
IiwgImQiLCAiYyI7Cj4+ICsgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnMgPSAi
aSIsICJtIiwgImEiLCAiZiIsICJkIiwgImMiLCAiemNhIiwKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJ6Y2QiOwo+PiAgCj4+ICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0LWNvbnRyb2xsZXIgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgI2ludGVycnVw
dC1jZWxscyA9IDwxPjsKPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+IGluZGV4IGRiN2RhZjIyYjg2My4uMDE3
MmNiYWExM2NhIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPj4gQEAgLTU0OSw2ICs1NDksMjMgQEAg
cHJvcGVydGllczoKPj4gICAgICAgICAgICAgICAgICBjb25zdDogemNhCj4+ICAgICAgICAgICAg
ICAtIGNvbnRhaW5zOgo+PiAgICAgICAgICAgICAgICAgIGNvbnN0OiBmCj4+ICsgICAgICAjIEMg
ZXh0ZW5zaW9uIGltcGxpZXMgWmNhCj4+ICsgICAgICAtIGlmOgo+PiArICAgICAgICAgIGNvbnRh
aW5zOgo+PiArICAgICAgICAgICAgY29uc3Q6IGMKPj4gKyAgICAgICAgdGhlbjoKPj4gKyAgICAg
ICAgICBjb250YWluczoKPj4gKyAgICAgICAgICAgIGNvbnN0OiB6Y2EKPj4gKyAgICAgICMgQyBl
eHRlbnNpb24gaW1wbGllcyBaY2QgaWYgZAo+PiArICAgICAgLSBpZjoKPj4gKyAgICAgICAgICBh
bGxPZjoKPj4gKyAgICAgICAgICAgIC0gY29udGFpbnM6Cj4+ICsgICAgICAgICAgICAgICAgY29u
c3Q6IGMKPj4gKyAgICAgICAgICAgIC0gY29udGFpbnM6Cj4+ICsgICAgICAgICAgICAgICAgY29u
c3Q6IGQKPj4gKyAgICAgICAgdGhlbjoKPj4gKyAgICAgICAgICBjb250YWluczoKPj4gKyAgICAg
ICAgICAgIGNvbnN0OiB6Y2QKPj4gIAo+PiAgYWxsT2Y6Cj4+ICAgICMgWmNmIGV4dGVuc2lvbiBk
b2VzIG5vdCBleGlzdHMgb24gcnY2NAo+PiBAQCAtNTY2LDYgKzU4MywyMyBAQCBhbGxPZjoKPj4g
ICAgICAgICAgICBub3Q6Cj4+ICAgICAgICAgICAgICBjb250YWluczoKPj4gICAgICAgICAgICAg
ICAgY29uc3Q6IHpjZgo+PiArICAjIEMgZXh0ZW5zaW9uIGltcGxpZXMgWmNmIGlmIGYgb24gcnYz
MiBvbmx5Cj4+ICsgIC0gaWY6Cj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICByaXNj
dixpc2EtZXh0ZW5zaW9uczoKPj4gKyAgICAgICAgICBhbGxPZjoKPj4gKyAgICAgICAgICAgIC0g
Y29udGFpbnM6Cj4+ICsgICAgICAgICAgICAgICAgY29uc3Q6IGMKPj4gKyAgICAgICAgICAgIC0g
Y29udGFpbnM6Cj4+ICsgICAgICAgICAgICAgICAgY29uc3Q6IGYKPj4gKyAgICAgICAgcmlzY3Ys
aXNhLWJhc2U6Cj4+ICsgICAgICAgICAgY29udGFpbnM6Cj4+ICsgICAgICAgICAgICBjb25zdDog
cnYzMmkKPj4gKyAgICB0aGVuOgo+PiArICAgICAgcHJvcGVydGllczoKPj4gKyAgICAgICAgcmlz
Y3YsaXNhLWV4dGVuc2lvbnM6Cj4+ICsgICAgICAgICAgY29udGFpbnM6Cj4+ICsgICAgICAgICAg
ICBjb25zdDogemNmCj4+ICAKPj4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4+ICAuLi4K
Pj4gLS0gCj4+IDIuNDMuMAo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
