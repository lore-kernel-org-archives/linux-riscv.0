Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4C1CFC282
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 14:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqAMrK6OtzV78DwCtt4owG3XPMHl43ODZnMNtI+8Yns=; b=oRqczXqHLHOi9m
	uLVCb1RgsHsBOWWENpGKFOnWhWrGQsFZWMSk0s+dVwdbGyYa75RzqxDEHIX5pAEYfk8RxzhU9EtgE
	ewKkM425hC67P2N3k6nB/Wr7vVxi68PjxDuLh5yv7fhy/Apnlh32KGuMJTbOX+uQ8azObj8OpRFiL
	n8YjPV2sp7xrw92PCTd+0jpM/0i+sXLjKDy7iqmT7cQ/9KEOrl+up20y4PKqEzS97C7clEUhAcWCg
	DeeG68m9bTOm/q3mC6Cm+2e3WRwuGuwxaBxjmLR/MGm6s9yoTtOzlV9uxhHM6ENOlbZ9tWtMfN9JW
	jypeyF22jvyb5qIraanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMS2A-00000008VzO-3aQX;
	Fri, 21 Nov 2025 14:22:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMS28-00000008Vyg-0z6Z
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 14:22:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so2029230f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 06:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1763734962; x=1764339762; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9Tj2omosRcUYxdoccgm+YuolCAEZN/10noVoCt2ot0=;
        b=FjhtqYKEU2/7h7yniNNpWtk4mIqWR6uKQdVS/McZO/9p/EEh5aBGtrIzXP7mvRgKrc
         bc5wv45ptxIOUcEjfELIRT/5qu+4HPmkGTExK0xQn8XCtUWlBz5Qu99ayWPgmlz3P8O2
         IkSrK5MHfnBy+VQTLStuWDJwuX61IqLWGDWGuaDF4B2GJMMn62u6Ijm+5MZlOO+TxLbM
         Vu7D5wjUnxQeQl+rIPrSMXR78oxq1jS6Xv38HpFVWkZ3jnyNzzWri6TPN0gNhLZi7PDO
         V4URXeJrd/3LNlPuM0sg/BNNmmIW3wU4+CZ2lTgpmQRe0VhXlldARH1fB1616ZSOLRyq
         qZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734962; x=1764339762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9Tj2omosRcUYxdoccgm+YuolCAEZN/10noVoCt2ot0=;
        b=VGjVjainxEBERjp0qA6ULM0K/LAFRGvs+Jt6FAD1Wr0gk8SQ8hma38cU9Kw4X0vABU
         7goDE959SzjCfQFxptIzMGo+O3zlLJFRecU/9x7h0OyeWNXFIuvyh1QciDKqdaaHNM+J
         v8Zho6Ld5E+U3VG737h4XgTxLzmMCWtC9AN4Tt3obMqgShTLVh62LvckNhMmt5hZp3BZ
         nFDDUvBehQruIC9mKPBx2qQji+4Ng18HvT0c2Djnt/+UPnQdD3z/WCsWihggqn3/HEfW
         wF85D4qXISIvlpfQOPfV19G0ELHa+vaRMxTbfL7NeO2L93Rvtl6HTU33McuouERPB79i
         wlNg==
X-Forwarded-Encrypted: i=1; AJvYcCWADVtw9B6JOS+3D+VJjHGCXEumoXVeG2vTXzHKzAPKn/J18XD4/oTo3nB5/u01vNP2bMHwcL/aLwWNjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9G9CGzFG5NGNLZOTdKSj0sFbMQalpmVfiIBP/X7yDWtJ4JIRX
	/7bR7z1Jb1bkhVd0ta5qTX2QdBprsjApDMaJ2E6u3wnBV09Sya03otbFvkxAvf8Txys=
X-Gm-Gg: ASbGncsY7PeYUaVp9rmXzHu314bpHSEcCqQPUu121vTthAzl2n2byd43sn1cHig100F
	NQ3LNcmssQkeBzPMxb7vW6E9Z9KlbXqMMvN6+vjljkrYEMfov9J3ahx73AigIvOQIGMPnwGxQJh
	6F1x9Xw+Sz4y5pXE6b5Nd87ZBlRPGkxtPRFkeuN6z9aROJNdGPMt7UWjYNOkvyJwzU5ubNJNZCX
	tIsWV3xDU9fFrJpWRJLYlJpISBmEt9zWdyJe2gEpx5yRWfKPfqQKynJE7OyMcWe2jUNFSeuNR+I
	kOJvWtc9SIvCpQDcgPSN+PrC7CoYISQZWv0DOU2j1SjG9wGc3dW9y9ACwfyw/5l3RXOSBwjsGpH
	Ksw5a9ylCxtM3t+4Pnt1tdJIw5H+hQX1ZBkDCLfDRMbxUebpxXV6FAY3DiZ5Y6V5ipiUh0rw4q4
	DJTjQazGzRKwjK1S5vl9bkvG+SwETj0rn4cGKLeGf/Xn/DnMbuVq2WaZGD
X-Google-Smtp-Source: AGHT+IEgxVbe+hqxdvbG56kf9v6CMn5g1qaPlBLoZANmK8RgRjJBLPlXoEtEAoaG63SMBlnIFP5AdQ==
X-Received: by 2002:a5d:5d88:0:b0:3e7:428f:d33 with SMTP id ffacd0b85a97d-42cc135db29mr2815296f8f.16.1763734961910;
        Fri, 21 Nov 2025 06:22:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd9b45sm11126232f8f.43.2025.11.21.06.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:22:41 -0800 (PST)
Message-ID: <9290f53d-3545-4299-9781-c1c558f71158@rivosinc.com>
Date: Fri, 21 Nov 2025 15:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SSE May Corrupt KVM's Context
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, =?UTF-8?B?6Lev5pet?=
 <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 =?UTF-8?B?5bSU6L+Q6L6J?= <cuiyunhui@bytedance.com>,
 =?UTF-8?B?5YWD56u5?= <yuanzhu@bytedance.com>
References: <00786ddb6d626442879072851d455bbd8ef1181d.e1f179e9.b8a1.463b.998f.98948268e9ea@bytedance.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <00786ddb6d626442879072851d455bbd8ef1181d.e1f179e9.b8a1.463b.998f.98948268e9ea@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_062244_413228_B206EFF9 
X-CRM114-Status: GOOD (  11.28  )
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

CgpPbiAxMS8yMS8yNSAwOToyNiwgWmhhbnBlbmcgWmhhbmcgd3JvdGU6Cj4gSGkgQ2zDqW1lbnQs
wqAKPiAKPiBJIGVuY291bnRlcmVkIGFub3RoZXIgU1NFIHByb2JsZW0gcmVjZW50bHkuIEhvc3Qg
U1NFIGV2ZW50cyBtYXkgYWZmZWN0IHRoZSBndWVzdC4gTmVpdGhlciBQTVUtU0JJLVNTRSBvciBL
Vk0tU1NFIGlzIGVuYWJsZWQuIEp1c3QgdXNpbmcgdGhlIHNpbXBsZXN0IHJpc2N2X3NzZV90ZXN0
IHRvIHRyaWdnZXIgZWNhbGwgU1NFLCBhbmQgaXQgd2lsbCBhZmZlY3QgdGhlIEtWTSB2Y3B1IHJ1
bm5pbmcgaW4gdGhlIGJhY2tncm91bmQuCgpIaSBaaGFucGVuZywKCkknZCBiZSBpbmNsaW5lZCB0
byBzYXkgdGhpcyBpcyBtb3N0IHByb2JhYmx5IGEgcHJvYmxlbSBpbiB0aGUgU0JJCmltcGxlbWVu
dGF0aW9uIHRoYXQgaW5jb3JyZWN0bHkgc2VuZCBvciByZXN0b3JlIHRvL2Zyb20gdmlydCBjb250
ZXh0LgpJJ2xsIHRyeSB0byByZXByb2R1Y2UgaXQgd2l0aCBPcGVuU0JJIGluIHRoZSB1cGNvbWlu
ZyBkYXlzLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gVGhlIGZvbGxvd2luZyBsb2cgaXMgdGhl
IG91dHB1dCBvZiBLVk0gYW5kIFFFTVUgd2hlbiB2Y3B1IGNyYXNoZXM6Cj4gCj4gW8KgIDE1Mi4y
Mjg1NDhdIGt2bSBbMTQ1XTogVkNQVSBleGl0IGVycm9yIC0xNAo+IFvCoCAxNTIuMjMwNjY0XSBr
dm0gWzE0NV06IFNFUEM9MHhmZmZmZmZmZjgwMDQwMjgwIFNTVEFUVVM9MHgyMDAwMDQ1MDAgSFNU
QVRVUz0weDIwMDIwMTEwMAo+IFvCoCAxNTIuMjMxODY4XSBrdm0gWzE0NV06IFNDQVVTRT0weGYg
U1RWQUw9MHgzYzggSFRWQUw9MHgwIEhUSU5TVD0weDEwMzAyMwo+IGVycm9yOiBrdm0gcnVuIGZh
aWxlZCBCYWQgYWRkcmVzcwo+IMKgcGMgwqAgwqAgwqAgZmZmZmZmZmY4MDA0MDI4MAo+IMKgbWhh
cnRpZMKgIDAwMDAwMDAwMDAwMDAwMDAKPiDCoG1zdGF0dXPCoCAwMDAwMDAwMjAwMDAwMTAwCj4g
wqBtaXAgwqAgwqDCoCAwMDAwMDAwMDAwMDAwMDAwCj4gwqBtaWUgwqAgwqDCoCAwMDAwMDAwMDAw
MDAwMDAwCj4gwqBtaWRlbGVnwqAgMDAwMDAwMDAwMDAwMDAwMAo+IMKgbWVkZWxlZ8KgIDAwMDAw
MDAwMDAwMDAwMDAKPiDCoG10dmVjIMKgwqAgMDAwMDAwMDAwMDAwMDAwMAo+IMKgbWVwYyDCoCDC
oCAwMDAwMDAwMDAwMDAwMDAwCj4gwqBtY2F1c2UgwqAgMDAwMDAwMDAwMDAwMDAwMAo+IMKgbXR2
YWwgwqDCoCAwMDAwMDAwMDAwMDAwMDAwCj4gwqBtc2NyYXRjaCAwMDAwMDAwMDAwMDAwMDAwCj4g
wqB4MC96ZXJvwqAgMDAwMDAwMDAwMDAwMDAwMCB4MS9yYSDCoMKgIGZmZmZmZmZmODBjMWFjMmMg
eDIvc3AgwqDCoCBmZmZmZmZmZjgxZTAzY2YwIHgzL2dwIMKgwqAgZmZmZmZmZmY4MjAxYWE2OAo+
IMKgeDQvdHAgwqDCoCBmZmZmZmZmZjgxZTBlMGMwIHg1L3QwIMKgwqAgZmZmZmZmZmY4MGI5MWEw
OCB4Ni90MSDCoMKgIGZmZmZhZjgwZmVlMDAwMDAgeDcvdDIgwqDCoCAwMDAwMDAwMjAwMDAwMDIw
Cj4gwqB4OC9zMCDCoMKgIGZmZmZmZmZmODFlMDNkNTAgeDkvczEgwqDCoCAwMDAwMDAwMDAxMDAw
MDAwIHgxMC9hMCDCoCAwMDAwMDAwMDAwMDAwMDAwIHgxMS9hMSDCoCAwMDAwMDAwMDAwMDAwMDAw
Cj4gwqB4MTIvYTIgwqAgMDAwMDAwMDAwMTAwMDAwMCB4MTMvYTMgwqAgZmZmZmFmODBmZmUwMDAw
MCB4MTQvYTQgwqAgMDAwMDAwMDAwMDAwMDAwMCB4MTUvYTUgwqAgZmZmZmFmN2Y4MDAwMDAwMAo+
IMKgeDE2L2E2IMKgIDAwMDAwMDAwMDAwMDAwMDIgeDE3L2E3IMKgIDAwMDAwMDAwMDAwMDAwMDIg
eDE4L3MyIMKgIGZmZmZhZjgwZmVlMDAwMDAgeDE5L3MzIMKgIGZmZmZmZmZmODE2MzkxNzAKPiDC
oHgyMC9zNCDCoCBmZmZmZmZmZjgyMDIwMGY4IHgyMS9zNSDCoCAwMDAwMDAwMDAwMDAwMDAwIHgy
Mi9zNiDCoCAwMDAwMDAwMDAwMDAwMDAwIHgyMy9zNyDCoCAwMDAwMDAwMDAwMDAwMDAwCj4gwqB4
MjQvczggwqAgMDAwMDAwMDAwMDAwMDAwMCB4MjUvczkgwqAgMDAwMDAwMDAwMDAwMDAwMCB4MjYv
czEwwqAgMDAwMDAwMDAwMDAwMDAwMCB4MjcvczExwqAgMDAwMDAwMDAwMDAwMDAwMAo+IMKgeDI4
L3QzIMKgIGZmZmZmZmZmODBiODUxMTAgeDI5L3Q0IMKgIGZmZmZmZmZmODIwNWQyNTggeDMwL3Q1
IMKgIGZmZmZmZmZmODIwNWQyNTggeDMxL3Q2IMKgIGZmZmZmZmZmODIwNWQyYTAKPiBbwqAgMTUy
LjMxMjgyNF0gcmlzY3Zfc3NlX3Rlc3Q6IEZBSUxFRDogRmFpbGVkIHRvIHdhaXQgZm9yIGV2ZW50
IGxvY2FsX3NvZnR3YXJlX2luamVjdGVkIGNvbXBsZXRpb24gb24gQ1BVIDIKPiBbwqAgMTUyLjMx
NzkzM10gcmlzY3Zfc3NlX3Rlc3Q6IEZBSUxFRDogUmVjZWl2ZWQgU1NFIGV2ZW50IC02NTUzNiBv
biBDUFUgMiBpbnN0ZWFkIG9mIDQKPiAKPiBUaGUgZm9sbG93aW5nIGlzIHRoZSBhc3NlbWJseSBj
b250ZXh0IHdoZXJlIHZjcHUgY3Jhc2hlcywgd2hpY2ggaXMgdGhlIFNBVkVfR1VFU1RfR1BSUyBt
YWNybyB0aGF0IHJ1bnMgd2hlbiBpdCBnZXQgYmFjayB0byBob3N0KHZjcHVfc3dpdGNoLlM6IExr
dm1fc3dpdGNoX3JldHVybikuCj4gVGhlIHNzY3JhdGNoIGlzIHNldCB0byAwKG9yIG90aGVyIGJh
ZCBhbmQgbG93IGFkZHJlc3NlcykgYnkgbWlzdGFrZSwgY2F1c2luZyBhIGNyYXNoIHdoZW4gc3Rv
cmluZyB0aGUgdmlydHVhbCBtYWNoaW5lIGNvbnRleHQuCj4gCj4gwqDCoCAweGZmZmZmZmZmODAw
NDAyN2MgPCsyNTI+OiDCoCBjc3JydyDCoCBhMCxzc2NyYXRjaCxhMAo+IMKgwqAgMHhmZmZmZmZm
ZjgwMDQwMjgwIDwrMjU2PjogwqAgc2QgwqAgwqDCoCByYSw5NjgoYTApCj4gwqDCoCAweGZmZmZm
ZmZmODAwNDAyODQgPCsyNjA+OiDCoCBzZCDCoCDCoMKgIHNwLDk3NihhMCkKPiDCoMKgIDB4ZmZm
ZmZmZmY4MDA0MDI4OCA8KzI2ND46IMKgIHNkIMKgIMKgwqAgZ3AsOTg0KGEwKQo+IMKgwqAgMHhm
ZmZmZmZmZjgwMDQwMjhjIDwrMjY4PjogwqAgc2QgwqAgwqDCoCB0cCw5OTIoYTApCj4gwqDCoCAw
eGZmZmZmZmZmODAwNDAyOTAgPCsyNzI+OiDCoCBzZCDCoCDCoMKgIHQwLDEwMDAoYTApCj4gwqDC
oCAweGZmZmZmZmZmODAwNDAyOTQgPCsyNzY+OiDCoCBzZCDCoCDCoMKgIHQxLDEwMDgoYTApCj4g
Cj4gVGhpcyBpcyBhIG11c3Qtb2NjdXIgcHJvYmxlbSBpbiBteSBlbnZpcm9ubWVudC4gQXMgbG9u
ZyBhcyBhbiBpZGxlIFZNIGlzIHJ1bm5pbmcgaW4gdGhlIGJhY2tncm91bmQswqAgcnVuIHRoZSBT
U0UgdGVzdCBpbiBsb29wIG9uIHRoZSBob3N0LCBhbmQgdGhlIHZjcHUgd2lsbCBjcmFzaC4gQ2Fu
IHRoaXMgcHJvYmxlbSBiZSByZXByb2R1Y2VkIGluIHlvdXIgZW52aXJvbm1lbnQ/Cj4gCj4gUmVn
YXJkcywKPiBaaGFucGVuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
