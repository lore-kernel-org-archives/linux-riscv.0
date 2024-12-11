Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884A3E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 05:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlI5WKWbk2FS5/HmrZimngASEXi4dx4wasE95bZstU4=; b=NoDnB82/75qeD8
	VcvVVNc5T41VAF30DeR7DDwl8OPWTP8g4ci3K4XhfaE+uoZeFUAl4ZHbHcYtZhaDkvspoCwfct883
	N4+GOF26H+FPfVe+8//HJ/1ZGQgs68xx850b1tOkLxZsN2cdVqIh8UMFL8+Pev3dWAeAKfHe0EnmE
	HNWQIU6Y4vuRVlDI8M/lFZ3b+RbuG86uGN9i7X37rHKUlzl3YsgSEoZfrE4dc3NNJOTORHpGDWg9I
	wDLLpn2GznLY6b+byoyEbxg/m5ZCoZFIU3WK3ykWBpMLfu8CW3fKMpkmdGXw+1fBjyf4SI82Z7X7T
	0gfVi9d3PBgHeO7jOUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFYN-0000000DrgN-0o76;
	Wed, 11 Dec 2024 05:46:31 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFYK-0000000Drfv-0IRV
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 05:46:29 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-84197b4e61aso460902439f.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Dec 2024 21:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733895987; x=1734500787; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5oMUqHh+nk9B5mZBiaJ0vvBxq45cqgYB3xD0ERWeFs=;
        b=EXTeh2tJD6wG25d7SgjtrvWpv8qYVvo1jnRcrcJKLTOTExk7ZB70zxhvj0Zfk5Zmd3
         rb08YTPNl8euTn8YgB6ZJSr1lJhVcCVBRBeovEYB6kMWaQJfjKIxSNOk99LBH8xhaDQY
         na8/Or/OiUv6bOlwcJQMsjPfiwq5ade2SbjDZl58Xv1lgRUbvmTcuv7Hd63nQMp23ftF
         gO1nYqJNYhGY4pKl2YguY1lj1dYdoi/qX+Mq8gg2RIgZN/NZKYtBo51c6RnXUBC+xj1X
         16pCfGfb2b6RhxEGRDPxvIj86oYondSV6No5FmxRLqP+QVSte2e+zs2EkmYNueHOw06v
         u3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733895987; x=1734500787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5oMUqHh+nk9B5mZBiaJ0vvBxq45cqgYB3xD0ERWeFs=;
        b=ZSo+pLatZ9EL4vhNyUsW8e0prXwIv/qaVSDsGQCuyMtq97KE8deN/WPuyYyias4fVv
         ZGXfE0aswfDaIr/zBoMvB7UfZnZIDmXCzGGN+VUp2QSSFb/q5KSA5KtBNJYO+d3tVAko
         PRtuibcup3XqvKLr6ts9y6UvcrrvbqeQdqnlXLaOFXd+tkdrrSt7d/xFbuIkzk8TnUxf
         xVcfqYPDGY3rYeAq90FN1c7Xpo/utFC13jQF2s9kIvUpRoxhM2ZJV4RZrZEW8nFuklAa
         n+C5wgZ7GEg/n4PjZdaVHyfor1KMkCk/dg6T+jQh3CTftCp7aHZqCt19nG94G65Awujt
         73Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVYH6IyEp0K/YpMbGkb6KSCVS9iIKs8AduFyTI6g9/8iWVsDSvBpsNz5zpMsBkpiQVKnGm708IVGQB1cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOZXhwI57sWOUjgwFNb1APG6MV3GZRkaVdRGFGUNOyS53CwPwv
	8VN4x7D2r9E4MGDIAo+FggAJwDHvp9qVVPL1drqtcsckjKbmf2FhuV++TiR3Qcc=
X-Gm-Gg: ASbGncv6L/lhX8QeaJ9+1dFaFds4feJsRNfz8kDOUsqjlCPFtdwWLkU2Kzhc68oVdAA
	7pc/9Cgqd57NRZfx4bCjIQT92UK6m1RqheOuJWf5pFSGt1B6GqZZ64mh7JgA982WR95oCR+Sm89
	xxsckUCMU5U2Zfu0f/8ISznarJ5RtZOlj+5JJ+Io+BcwwkGYxmpln/7394w6fDW5/3Wuw1PTPLS
	0fwDrrJ+Df8a3xYV9pyqHslJlt3zR7q0BRZQntFQztl+Q+gKF0k9IgJwdpgJBOzQ4DSJFrBUnUA
	Xks=
X-Google-Smtp-Source: AGHT+IEmmvtcV1rwmGFlOaV5k7IoW8oaRRGsYBd4+FUMKqnq0edFVLxZ/CDUJaoapBekOklZskqkiA==
X-Received: by 2002:a05:6e02:3f87:b0:3ab:1b7a:5932 with SMTP id e9e14a558f8ab-3ab1b7a5b26mr1105265ab.18.1733895986822;
        Tue, 10 Dec 2024 21:46:26 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2c8a82832sm1075829173.81.2024.12.10.21.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 21:46:26 -0800 (PST)
Message-ID: <41025b15-2f66-481b-a2da-dbf86e2bfc10@sifive.com>
Date: Tue, 10 Dec 2024 23:46:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] riscv: selftests: Fix warnings pointer masking test
To: Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
References: <20241206-fix_warnings_pointer_masking_tests-v5-1-ed566c2f27e8@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20241206-fix_warnings_pointer_masking_tests-v5-1-ed566c2f27e8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_214628_135894_B2E9B1B1 
X-CRM114-Status: GOOD (  23.83  )
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

SGkgQ2hhcmxpZSwKCk9uIDIwMjQtMTItMDYgMTE6NTIgQU0sIENoYXJsaWUgSmVua2lucyB3cm90
ZToKPiBXaGVuIGNvbXBpbGluZyB0aGUgcG9pbnRlciBtYXNraW5nIHRlc3RzIHdpdGggLVdhbGwg
dGhpcyB3YXJuaW5nCj4gaXMgcHJlc2VudDoKPiAKPiBwb2ludGVyX21hc2tpbmcuYzogSW4gZnVu
Y3Rpb24g4oCYdGVzdF90YWdnZWRfYWRkcl9hYmlfc3lzY3Rs4oCZOgo+IHBvaW50ZXJfbWFza2lu
Zy5jOjIwMzo5OiB3YXJuaW5nOiBpZ25vcmluZyByZXR1cm4gdmFsdWUgb2Yg4oCYcHdyaXRl4oCZ
Cj4gZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV3Vu
dXNlZC1yZXN1bHRdCj4gICAyMDMgfCAgICAgICAgIHB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsg
fAo+ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fiBwb2ludGVyX21hc2tpbmcuYzoyMDg6
OTogd2FybmluZzoKPiBpZ25vcmluZyByZXR1cm4gdmFsdWUgb2Yg4oCYcHdyaXRl4oCZIGRlY2xh
cmVkIHdpdGggYXR0cmlidXRlCj4g4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1y
ZXN1bHRdCj4gICAyMDggfCAgICAgICAgIHB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKPiAKPiBJ
IGNhbWUgYWNyb3NzIHRoaXMgb24gcmlzY3Y2NC1saW51eC1nbnUtZ2NjIChVYnVudHUKPiAxMS40
LjAtMXVidW50dTF+MjIuMDQpLgo+IAo+IEZpeCB0aGlzIGJ5IGNoZWNraW5nIHRoYXQgdGhlIG51
bWJlciBvZiBieXRlcyB3cml0dGVuIGVxdWFsIHRoZSBleHBlY3RlZAo+IG51bWJlciBvZiBieXRl
cyB3cml0dGVuLgo+IAo+IEZpeGVzOiA3NDcwYjVhZmQxNTAgKCJyaXNjdjogc2VsZnRlc3RzOiBB
ZGQgYSBwb2ludGVyIG1hc2tpbmcgdGVzdCIpCj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5r
aW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHY1Ogo+IC0gTm8g
bG9uZ2VyIHNraXAgc2Vjb25kIHB3cml0ZSBpZiBmaXJzdCBvbmUgZmFpbHMKPiAtIFVzZSB3cmFw
cGVyIGZ1bmN0aW9uIGluc3RlYWQgb2YgZ290byAoRHJldykKPiAtIExpbmsgdG8gdjQ6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDUtZml4X3dhcm5pbmdzX3BvaW50ZXJfbWFza2lu
Z190ZXN0cy12NC0xLTBjNzdlYjcyNTQ4NkByaXZvc2luYy5jb20KPiAKPiBDaGFuZ2VzIGluIHY0
Ogo+IC0gU2tpcCBzeXNjdGxfZW5hYmxlZCB0ZXN0IGlmIGZpcnN0IHB3cml0ZSBmYWlsZWQKPiAt
IExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDUtZml4X3dhcm5p
bmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy12My0xLTVjMjhiMGY5NjQwZEByaXZvc2luYy5jb20K
PiAKPiBDaGFuZ2VzIGluIHYzOgo+IC0gRml4IHN5c2N0bCBlbmFibGVkIHRlc3QgY2FzZSAoRHJl
dy9BbGV4KQo+IC0gTW92ZSBwd3JpdGUgZXJyIGNvbmRpdGlvbiBpbnRvIGdvdG8gKERyZXcpCj4g
LSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMjA0LWZpeF93YXJu
aW5nc19wb2ludGVyX21hc2tpbmdfdGVzdHMtdjItMS0xYmYwYzUwOTVmNThAcml2b3NpbmMuY29t
Cj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIEkgaGFkIHJldCAhPSAyIGZvciB0ZXN0aW5nLCBJIGNo
YW5nZWQgaXQgdG8gYmUgcmV0ICE9IDEuCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjQxMjA0LWZpeF93YXJuaW5nc19wb2ludGVyX21hc2tpbmdfdGVzdHMtdjEt
MS1lYTFlOTY2NWNlN2FAcml2b3NpbmMuY29tCj4gLS0tCj4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0
cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMgIHwgMjIgKysrKysrKysrKysrKysrKy0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJf
bWFza2luZy5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFz
a2luZy5jCj4gaW5kZXggZGVlNDFiN2VlM2UzLi41MGM0ZDFiYzc1NzAgMTAwNjQ0Cj4gLS0tIGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5jCj4gKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5jCj4g
QEAgLTE4NSw4ICsxODUsMjAgQEAgc3RhdGljIHZvaWQgdGVzdF9mb3JrX2V4ZWModm9pZCkKPiAg
CX0KPiAgfQo+ICAKPiArc3RhdGljIGJvb2wgcHdyaXRlX3dyYXBwZXIoaW50IGZkLCB2b2lkICpi
dWYsIHNpemVfdCBjb3VudCwgY29uc3QgY2hhciAqbXNnKQo+ICt7Cj4gKwlpbnQgcmV0ID0gcHdy
aXRlKGZkLCBidWYsIGNvdW50LCAwKTsKPiArCj4gKwlpZiAocmV0ICE9IGNvdW50KSB7Cj4gKwkJ
a3NmdF9wZXJyb3IobXNnKTsKPiArCQlyZXR1cm4gZmFsc2U7Cj4gKwl9Cj4gKwlyZXR1cm4gdHJ1
ZTsKPiArfQo+ICsKPiAgc3RhdGljIHZvaWQgdGVzdF90YWdnZWRfYWRkcl9hYmlfc3lzY3RsKHZv
aWQpCj4gIHsKPiArCWNoYXIgKmVycl9wd3JpdGVfbXNnID0gImZhaWxlZCB0byB3cml0ZSB0byAv
cHJvYy9zeXMvYWJpL3RhZ2dlZF9hZGRyX2Rpc2FibGVkXG4iOwo+ICAJY2hhciB2YWx1ZTsKPiAg
CWludCBmZDsKPiAgCj4gQEAgLTIwMCwxNCArMjEyLDEyIEBAIHN0YXRpYyB2b2lkIHRlc3RfdGFn
Z2VkX2FkZHJfYWJpX3N5c2N0bCh2b2lkKQo+ICAJfQo+ICAKPiAgCXZhbHVlID0gJzEnOwo+IC0J
cHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+IC0Ja3NmdF90ZXN0X3Jlc3VsdChzZXRfdGFnZ2Vk
X2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUpID09IC1FSU5WQUwsCj4gLQkJCSAic3lzY3RsIGRp
c2FibGVkXG4iKTsKPiArCWlmICghcHdyaXRlX3dyYXBwZXIoZmQsICZ2YWx1ZSwgMSwgIndyaXRl
ICcxJyIpKQo+ICsJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbChlcnJfcHdyaXRlX21zZyk7Cj4gIAo+
ICAJdmFsdWUgPSAnMCc7Cj4gLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4gLQlrc2Z0X3Rl
c3RfcmVzdWx0KHNldF90YWdnZWRfYWRkcl9jdHJsKG1pbl9wbWxlbiwgdHJ1ZSkgPT0gMCwKPiAt
CQkJICJzeXNjdGwgZW5hYmxlZFxuIik7Cj4gKwlpZiAoIXB3cml0ZV93cmFwcGVyKGZkLCAmdmFs
dWUsIDEsICJ3cml0ZSAnMCciKSkKPiArCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoZXJyX3B3cml0
ZV9tc2cpOwoKWW91J3ZlIHJlbW92ZWQgdGhlIGtzZnRfdGVzdF9yZXN1bHQoKSBjYWxscywgd2hp
Y2ggY29udGFpbiB0aGUgYWN0dWFsIGJlaGF2aW9yYWwKdGVzdHMgKHNldF90YWdnZWRfYWRkcl9j
dHJsKCkpLCBzbyB0aGUgdGVzdCBubyBsb25nZXIgZG9lcyBhbnl0aGluZyBidXQgdG9nZ2xlCnRo
ZSBzeXNjdGw6CgojIFRlc3RpbmcgZm9yay9leGVjIGJlaGF2aW9yCm9rIDU1IGRlcmVmZXJlbmNl
IGFmdGVyIGZvcmsKb2sgNTYgZGVyZWZlcmVuY2UgYWZ0ZXIgZm9yaytleGVjCiMgVGVzdGluZyB0
YWdnZWQgYWRkcmVzcyBBQkkgc3lzY3RsCiMgVGVzdGluZyB0YWdnZWQgYWRkcmVzcyBBQkkKb2sg
NTcgUE1MRU49MCB0YWdnZWQgYWRkcmVzcyBBQkkKb2sgNTggUE1MRU49NyB0YWdnZWQgYWRkcmVz
cyBBQkkKb2sgNTkgUE1MRU49MTYgdGFnZ2VkIGFkZHJlc3MgQUJJCiMgUGxhbm5lZCB0ZXN0cyAh
PSBydW4gdGVzdHMgKDYxICE9IDU5KQojIFRvdGFsczogcGFzczo1OSBmYWlsOjAgeGZhaWw6MCB4
cGFzczowIHNraXA6MCBlcnJvcjowCgpJdCBkb2VzIGRvIHRoZSByaWdodCB0aGluZyBpZiBJIGBt
b3VudCAtLWJpbmQgL2Rldi9mdWxsCi9wcm9jL3N5cy9hYmkvdGFnZ2VkX2FkZHJfZGlzYWJsZWRg
OgoKIyBUZXN0aW5nIGZvcmsvZXhlYyBiZWhhdmlvcgpvayA1NSBkZXJlZmVyZW5jZSBhZnRlciBm
b3JrCm9rIDU2IGRlcmVmZXJlbmNlIGFmdGVyIGZvcmsrZXhlYwojIFRlc3RpbmcgdGFnZ2VkIGFk
ZHJlc3MgQUJJIHN5c2N0bAojIHdyaXRlICcxJzogTm8gc3BhY2UgbGVmdCBvbiBkZXZpY2UgKDI4
KQpub3Qgb2sgNTcgZmFpbGVkIHRvIHdyaXRlIHRvIC9wcm9jL3N5cy9hYmkvdGFnZ2VkX2FkZHJf
ZGlzYWJsZWQKIyB3cml0ZSAnMCc6IE5vIHNwYWNlIGxlZnQgb24gZGV2aWNlICgyOCkKbm90IG9r
IDU4IGZhaWxlZCB0byB3cml0ZSB0byAvcHJvYy9zeXMvYWJpL3RhZ2dlZF9hZGRyX2Rpc2FibGVk
CiMgVGVzdGluZyB0YWdnZWQgYWRkcmVzcyBBQkkKb2sgNTkgUE1MRU49MCB0YWdnZWQgYWRkcmVz
cyBBQkkKb2sgNjAgUE1MRU49NyB0YWdnZWQgYWRkcmVzcyBBQkkKb2sgNjEgUE1MRU49MTYgdGFn
Z2VkIGFkZHJlc3MgQUJJCiMgVG90YWxzOiBwYXNzOjU5IGZhaWw6MiB4ZmFpbDowIHhwYXNzOjAg
c2tpcDowIGVycm9yOjAKClNvIEkgZ3Vlc3MgdGhlICJrc2Z0X3Rlc3RfcmVzdWx0KHNldF90YWdn
ZWRfYWRkcl9jdHJsLi4uIiBuZWVkcyB0byBnbyBpbiB0aGUKZWxzZSBjYXNlIG9mIHRoZSBwd3Jp
dGVfd3JhcHBlcigpIGNhbGwuCgpSZWdhcmRzLApTYW11ZWwKCj4gIAo+ICAJc2V0X3RhZ2dlZF9h
ZGRyX2N0cmwoMCwgZmFsc2UpOwo+ICAKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogNDAzODRjODQw
ZWExOTQ0ZDdjNWEzOTJlODk3NWVkMDg4ZWNmMGIzNwo+IGNoYW5nZS1pZDogMjAyNDEyMDQtZml4
X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy0zODYwZTRmMzU0MjkKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
