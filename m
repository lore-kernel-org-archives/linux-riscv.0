Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D452CE8D47
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1UrBmqV5Qw46Zp7JoZYqjeIET+ndnPawXIDLT/5Idk=; b=alPoiAVq17bPn7
	5jJ2bpGJtOIBQ71TDr19sxoDs0O3OD+QbnRz//xBBOUKnv+oZgsF2Mid6rf4+79LBSQEzB45xSFIZ
	4MdqX2MDmIRe+UYCt16h6tIoIAhOSeXBdBU48uKHOvjzZ5/UEPsdEqaGdglndfQSKx88FBwJY3GSK
	YAN0tCgVo7TUtitcY1dyum+QA5WonMPtvJppMjobVZkYTc4ddsSFZAVEieeS4TuRLcpsy9PbJIaDf
	YgiEHJOlrmfzvTEPJK5bomMIWOwGf89LGWg1IZ//BLqS01XZJUSqRUAjcaiFauOkdw0Buz3ndRojH
	SiT4nyP1aJoFfOnwDOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvvj-0000000Cb4M-14aW;
	Fri, 14 Nov 2025 15:41:43 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvvg-0000000Cb3B-2R2m
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 15:41:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-29516a36affso22728265ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Nov 2025 07:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1763134900; x=1763739700; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sg8Ti14sQYHN7alKAMbJMnVItExkexNvxjvu4qSCw0M=;
        b=KLuzf9tbLa8PhdWdaMfvuI2+AvC6fbUB/peuy+rvPxGZNqBskdN0Qenp2wsVjlBCtr
         133tKBW2zdL4fEVuXm6/kUeyYV4nFl0kQ9n6KtY293IHgeCqkRhSphFkrz5mSAL2Or1R
         yj9WkZ2VyQ2YZNiAXYG10VrtKRUv0lsNiIF+bsVyS+pzy9XAWCRKubedHnYSFgbLO6lS
         pHzpc1SksxdmXsrVS0oWNLP+maP9VNgvCLmdfTp3bMkvplRz2nG9RxGJh1uaNnJo5Npe
         55sBJAlHrrExyNjByofCGU04QevAcsvahqItwgnGwV6NDFEwI1THOmVZz4bqOdOMBqju
         cNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763134900; x=1763739700;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sg8Ti14sQYHN7alKAMbJMnVItExkexNvxjvu4qSCw0M=;
        b=OvdMnnSGYWGa+94S5YOqlf9oglgy1Q9hpQIZu65bcvXJ9f/L8+6gggdOvdTLJJLpmM
         LdRfziQIC+zkXHZMD/KTzHnyG1cYngndiySoONrJE65fk3BgS2VXcpB9ELeQ+UP87Mqs
         NzYQXVna6K5MjggPcUwZHYmKxHLLQI55PThDJkeSA6cf1ihPIoNZw0Uyz0RIdbdvtzLX
         uUxL4Fo5Py7ZZXDKHq+VzeUNrP1TOGVF7iubSXtNhqp7iGexBBH2abcE+Hdks+hSlQfG
         Yid8dDV+q0Swpr7t2lOaenZRz5S36c6ICL/FniaET2EbtACfh8iYEd/bbIXmckSeHtUq
         /U/w==
X-Forwarded-Encrypted: i=1; AJvYcCWOhxgvw71CIG1a90E3OHjP/qo7W4gLQxau7cgSudeW7Sy4aI6rALPhxaDB9puyr7OwDUWgEgOhL4RzDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ2wxhNARZL1Rm2qvq5SD3WUWQVnU+F7Rqp0F2IYcSYRUHqvt0
	Ytrp/LSGrrWt3h8hl7M/37kp8fhYmw0ZVxDvXfb/9ShQ+Rg1U/xRRygN0YG0l4U0ylk=
X-Gm-Gg: ASbGncv6dRH/pUx15pwn+jj3SETMN+buJp8XJGLgtD6Vfg5pT4Opd6Tdp73fA4fxb+U
	nENGESfK6sUeUZREZZMM79iaXXHA16ijGYGly5b/CULtf+s1AaNsUU+Jamp6cAqh+fyPQ0XWvoZ
	syVExUdtyeltpgYB7ah0vWP/pwyWEkALxt27xH/sWTBjnULFZvlKt29mFogKD4FVc/GUdzClO0E
	+fjSIxwI4gshrkawHbZ1UkyyX/PmHM2QtBpT5n/59DcydDacmfuVPGgxkeoZEKKlfDTUfH1PK6j
	vWunv0VBtLruECCrW/C4TPlMDCdhRDbGWoI9mh6nMhCF/p79Urg/VX2H9yZbmD9gHSZqezqfSo5
	0ArY2sahEARaqmoNCByujR5EEr13A6/YnnUL6CyChsjz3Tqe8jOyja6QNql+ZjlmsW3Z3FZj+mz
	DXf55ewz61Dap4JYAofecsYvpgkvCw3s0dl+8DI1kuTq2V8A==
X-Google-Smtp-Source: AGHT+IEIzmumTxzs8HD0cpCB3dd/dOOpZl7zhM3ACSM8EeZdfADSdgjpRi0Fxb/n7gUrXKWU7BOHow==
X-Received: by 2002:a17:903:2f0e:b0:24c:965a:f94d with SMTP id d9443c01a7336-2986a741b6cmr35738145ad.46.1763134899754;
        Fri, 14 Nov 2025 07:41:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c23849esm59745065ad.5.2025.11.14.07.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 07:41:39 -0800 (PST)
Message-ID: <4a24df59-a209-4f2f-9465-f98482e83952@rivosinc.com>
Date: Fri, 14 Nov 2025 16:41:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to Avoid Starving the Kernel When Using SSE
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
To: =?UTF-8?B?5byg5bGV6bmP?= <zhangzhanpeng.jasper@bytedance.com>
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
References: <CACnXVncnu6Rnx64GemdBvxu+mTqYEMGePoR5OvaJh3gC4uG-NA@mail.gmail.com>
 <bec1e1f4-e188-415d-bbb2-1854b7e8cf1d@rivosinc.com>
Content-Language: en-US
In-Reply-To: <bec1e1f4-e188-415d-bbb2-1854b7e8cf1d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_074140_625846_6156A140 
X-CRM114-Status: GOOD (  34.22  )
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

CgpPbiAxMS8xNC8yNSAxNDozNiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IAo+IAo+IEhpIFpo
YW5wZW5nLAo+IAo+IE9uIDExLzE0LzI1IDExOjI0LCDlvKDlsZXpuY8gd3JvdGU6Cj4+IEhpIENs
w6ltZW50LAo+Pgo+PiBMYXRlbHksIEkndmUgYmVlbiB0aGlua2luZyBhYm91dCBob3cgdG8gYXZv
aWQgc3RhcnZpbmcgdGhlIGtlcm5lbCB3aGVuCj4+IHVzaW5nIFNTRToKPj4gU1NFIGlzIHBvd2Vy
ZWQgYnkgTS1tb2RlIGlycXMgc3VjaCBhcyBNLW1vZGUgUE1VIGlycSBmb3IgcGVyZiBzYW1wbGlu
ZyBhbmQKPj4gTS1tb2RlIElQSSBmb3IgaW50ZXItaGFydCBpbmplY3Rpb24uIE1lYW53aGlsZSwg
a2VybmVsIGlzIHBvd2VyZWQgYnkgUy1tb2RlCj4+IGlycXMsIHNvIHRoZSBrZXJuZWwgbWF5IGV4
cGVyaWVuY2Ugc3RhcnZhdGlvbiB3aGVuIHRoZXJlIGlzIGEgZmxvb2Qgb2YKPj4gTS1tb2RlIGly
cXMsIGFuZCBrZXJuZWwgbWF5IGNhdXNlIHN1Y2ggZmxvb2Rpbmcgb2YgTS1tb2RlIGlycXMgd2hl
biB1c2luZwo+PiBTU0UsIGVpdGhlciBkZWxpYmVyYXRlbHkgb3IgaW5hZHZlcnRlbnRseToKPj4K
Pj4gICAgMS4gIE1hbGljaW91cyBTU0UgaGFuZGxlcjogS2VybmVsIG1heSBkZWxpYmVyYXRlbHkg
cmVnaXN0ZXIgYSBiYWQgU1NFCj4+ICAgIGhhbmRsZXIsIHdoaWNoIHRyaWdnZXJzIGEgbmV3IGlu
dGVyLWhhcnQgU1NFIHJlcXVlc3QgdmlhIGVjYWxsLiBUaGlzIHdpbGwKPj4gICAgY2F1c2UgYW4g
ZW5kbGVzcyBsb29wIG9mIFNTRSwgcmVuZGVyaW5nIHRoZSBrZXJuZWwgdW5yZXNwb25zaXZlLiBJ
biB0aGlzCj4+ICAgIGNhc2UsIHRoZSBvbmx5IHRoaW5nIFNCSSBjYW4gZG8gaXMgdG8gcHJldmVu
dCB0aGUgbmVzdGluZyBvZiBTU0UgaW4KPj4gICAgYHNiaV90cmFwX2hhbmRsZXJgIGFuZCBlbnN1
cmUgdGhhdCBTU0UgZXZlbnRzIGFyZSBleGVjdXRlZCBpbiBwcmlvcml0eQo+PiAgICBvcmRlci4K
PiAKPiBUaGF0IHNlZW1zIHF1aXRlIGNvbnZvbHV0ZWQuIEFueW9uZSB0aGF0IGNhbiBsb2FkIGEg
bW9kdWxlIGNhbiBkbyB3b3JzZQo+IHRoYW4gY3Jhc2hpbmcgdGhlIGtlcm5lbCA6KQo+IAo+PiAg
ICAyLiAgUGVyZiBzYW1wbGluZzogS2VybmVsIG1heSBpbmFkdmVydGVudGx5IGNob29zZSBhIGJh
ZCBwYXJhbWV0ZXIgZm9yCj4+ICAgIFBlcmYsIHdoaWNoIGNhdXNlcyBQTVUgaXJxcyB0byBvY2N1
ciB0b28gZnJlcXVlbnRseS4gQ29udGludW91cyBQTVUgaXJxcwo+PiAgICB3aWxsIGxlYXZlIHRo
ZSBzeXN0ZW0gd2l0aCBubyB0aW1lIHRvIHJlc3BvbmQgdG8gUy1tb2RlIGlycXMuCj4gCj4gQnV0
IHRoaXMgb25lIGNvbmNlcm4gaG93ZXZlciBpcyB2YWxpZCAhCj4gCj4+Cj4+ICBIZW5jZSwgSSB0
aGluayB3ZSBhcmUgc3VwcG9zZWQgdG8gaW1wcm92ZSB0aGUgU1NFIGZyYW1ld29yayB0byBhdm9p
ZAo+PiBzdGFydmluZyB0aGUga2VybmVsIHNvIGVhc2lseS4KPj4KPj4gSGVyZSBpcyBhIGNhc2Ug
c3R1ZHkgb2YgcGVyZiBzYW1wbGluZzoKPj4gV2hlbiB1c2luZyBQTVUtU1NFIGZvciBQZXJmIHNh
bXBsaW5nLCB0aGUga2VybmVsIG1heSBoYW5nIGFuZCBiZWNvbWUKPj4gdW5yZXNwb25zaXZlIGR1
ZSB0byB0aGUgUE1VLVNTRSBsb29wLiBPbmNlIHdlIHN0YXJ0IHRvIHByb2Nlc3MgYSBQZXJmCj4+
IHNhbXBsaW5nIHVzaW5nIFBNVS1TU0UsIHRoZSBrZXJuZWwgbWF5IGZhaWwgdG8gcmVzcG9uZCB0
byBgQ3RybCtDYCBvciBmYWlsCj4+IHRvIGV4aXQgYWZ0ZXIgdGhlIHRpbWluZyBvZiBgc2xlZXAg
MWAgY29tcGxldGVzICh0aGVzZSBhcmUgdGhlIHR3byBtb3N0Cj4+IGNvbW1vbmx5IHVzZWQgdGlt
ZS1iYXNlZCBzYW1wbGluZyBtZXRob2RzIGluIHBlcmYpLgo+Pgo+PiBCeSBkZWZhdWx0LCBwZXJm
IHVzZXMgYSByZWxhdGl2ZWx5IGhpZ2ggc2FtcGxpbmcgZnJlcXVlbmN5LCBuYW1lbHkKPj4gYHBl
cmZfZXZlbnRfbWF4X3NhbXBsZV9yYXRlYCwgYW5kIHdpbGwgYWRqdXN0IGl0IG9uIGRlbWFuZCBp
ZiBzYW1wbGluZwo+PiB0YWtlcyB0b28gbXVjaCB0aW1lLiBJZiB0aGlzIGZyZXF1ZW5jeS9wZXJp
b2QgZ29lcyBiZXlvbmQgd2hhdCBzeXN0ZW0gY2FuCj4+IGhhbmRsZSwgaXQgd2lsbCBtYWtlIFNT
RSBldmVudHMgY29ubmVjdCBlbmQtdG8tZW5kLCBhbmQgdGhlIHN5c3RlbSB3aWxsIGdldAo+PiBz
dHVjayBpbiBhbiBlbmRsZXNzIGxvb3Agb2YgIlNTRSDihpIgUE1VIGludGVycnVwdCDihpIgU1NF
Ii4gVGhlIGtlcm5lbCBpcyB0aGVuCj4+IHN0YXJ2ZWQgKGF0IHRoaXMgcG9pbnQsIGlmIHlvdSBw
cmludCB0aGUgYHNlcGNgIG9mIFNTRSBjb21wbGV0aW9uLCB5b3Ugd2lsbAo+PiBmaW5kIHRoYXQg
dGhlIGBzZXBjYCByZW1haW5zIHVuY2hhbmdlZCBlYWNoIHRpbWUsIGluZGljYXRpbmcgdGhhdCB0
aGUKPj4ga2VybmVsIGlzIHN0dWNrKSwgYW5kIHRoZSBrZXJuZWwgY2FuIG5ldmVyIGVzY2FwZSBm
cm9tIHRoaXMgbG9vcCBvZgo+PiBQTVUtU1NFLCBiZWNhdXNlIGl0IGNhbiBuZWl0aGVyIHJlc3Bv
bmQgdG8gQ3RybCtDIGludGVycnVwdHMgbm9yIGFkanVzdCB0aGUKPj4gc2FtcGxpbmcgZnJlcXVl
bmN5Lgo+Pgo+PiBDdXJyZW50IHNvbHV0aW9uOiBUaGUga2V5IHRvIHRoaXMgcHJvYmxlbSBpcyB0
aGF0IGV2ZXJ5IHRpbWUgd2UgZmluaXNoCj4+IHNzZV9jb21wbGV0ZSwgdGhlcmUgaXMgYWxyZWFk
eSBhIG5ldyBQTVUgaXJxIHBlbmRpbmcuIFRoZW4gd2UgcmVzdW1lIHRoZQo+PiBrZXJuZWwgZXhl
Y3V0aW9uIHZpYSBtcmV0LCBhbmQgdGhlIHN5c3RlbSB3aWxsIGltbWVkaWF0ZWx5IHRyYXAgYmFj
ayBpbnRvCj4+IFNTRS4KPj4KPj4gVGhlIFBNVS1TU0UtUGVyZiBwcm9jZXNzaW5nIGZsb3cgaW5j
bHVkZXMgdGhlIGZvbGxvd2luZyBzdGVwczogYHNzZV9pbmplY3RgCj4+IChtcmV0IHRvIFNTRSBo
YW5kbGVyKSwgYHBtdV9zdG9wYCAoY2xlYXIgUE1VIHBlbmRpbmcgYml0KSwgYHBtdV9zdGFydGAg
KHNldAo+PiBhIG5ldyB2YWx1ZSBmb3IgUE1VIGNvdW50ZXIpLCBhbmQgYHNzZV9jb21wbGV0ZWAg
KHJlc3VtZSBleGVjdXRpb24gdG8gdGhlCj4+IHBvaW50IHdoZXJlIHRoZSBrZXJuZWwgd2FzIGlu
dGVycnVwdGVkKS4gVGhlIHJlYXNvbiB3aHkga2VybmVsIHRyYXBzIHJpZ2h0Cj4+IGFmdGVyIGBz
c2VfY29tcGxldGVgIGlzIHRoYXQgdGhlcmUgaXMgYSBuZXcgUE1VIGlycSBnZW5lcmF0ZWQgYmV0
d2Vlbgo+PiBgcG11X3N0YXJ0YCBhbmQgYHNzZV9jb21wbGV0ZWAuCj4+Cj4+IEluIG9yZGVyIHRv
IGFkZHJlc3MgdGhpcyBpc3N1ZSwgd2UgcHJvcG9zZSB0byBkZWxheSB0aGUgcHJvY2VkdXJlIG9m
Cj4+IHJlLXN0YXJ0aW5nIHRoZSBvdmVyZmxvd2VkIFBNVSBjb3VudGVyIGR1cmluZyBQTVUtU1NF
LiBXaGVuIGtlcm5lbCB0cmlnZ2Vycwo+PiBhbiBlY2FsbCB0byByZXN0YXJ0IHRoZSBvdmVyZmxv
d2VkIFBNVSBjb3VudGVycywgU0JJIGNhbiBjaGVjayB3aGV0aGVyIGl0Cj4+IGlzIFNTRS1wb3dl
cmVkIFBNVSBoYW5kbGluZy4gSWYgc28sIHdlIHRlbXBvcmFyaWx5IG1vZGlmeSBtaHBtZXZlbnQg
Q1NSIHRvCj4+IHN0b3AgY291bnRpbmcga2VybmVsIGV2ZW50cy4gSW4gdGhpcyBwcm9jZXNzLCBN
LW1vZGUgZXZlbnRzIGFyZSBhbHdheXMKPj4gaW5oaWJpdGVkLCBhbmQgVS1tb2RlIGNvZGUgd2ls
bCBub3QgYmUgZXhlY3V0ZWQgZHVyaW5nIHRoZQo+PiBgcG11X3NiaV9vdmZfaGFuZGxlcmAsIHNv
IHdlIG9ubHkgbmVlZCB0byBpbmhpYml0IHRoZSBjb3VudGluZyBvZiBrZXJuZWwKPj4gZXZlbnRz
Lgo+IAo+IEknZCByYXRoZXIgbGV0IHRoZSBrZXJuZWwgY29udHJvbCB0aGUgUE1VIFNTRSBldmVu
dCBkZWxpdmVyeSBieSBtYXNraW5nCj4gaXQgYXQgdGhlIGVuZCBvZiB0aGUgU1NFIGhhbmRsZXIg
YW5kIHJlZW5hYmxpbmcgaXQgbGF0ZXIuIEFkZGl0aW9uYWxseSwKPiB0aGF0IHNvbHV0aW9uIGJl
aW5nIGluIHRoZSBTQkkgaXRzZWxmLCBpdCBkb2VzIG5vdCBndWFyYW50ZWUgdGhhdCBhbGwKPiBT
QkkgaW1wbGVtZW50YXRpb24gd2lsbCBhY3R1YWxseSBkbyB0aGF0IGNvcnJlY3RseS4KPiAKPiBX
aGF0IHNlZW1zIG9kZCBpcyB0aGF0IHRoZSBwZXJmX2V2ZW50X3NhbXBsZV90b29rKCkgY2FsbCBh
dCBlYWNoIGVuZCBvZgo+IFBNVSBldmVudCBoYW5kbGVyIHNob3VsZCBhY3R1YWxseSBhbGxvdyBw
ZXJmIHN1YnN5c3RlbSB0byB0aHJvdHRsZSB0aGUKPiByYXRlLiBJJ2xsIHRha2UgYW5vdGhlciBs
b29rIGF0IHRoYXQgcGFydCB0byBtYWtlIHN1cmUgaXQgd29ya3MgYXMKPiBleHBlY3RlZCBhbmQg
dGhhdCB3ZSBhcmVuJ3QgbWlzc2luZyBhbnkgYml0cy4KCkhleSBaaGFucGVuZywKCkNvdWxkIHlv
dSB0cnkgdG8gYXBwbHkgdGhpcyBxdWljayduJ2RpcnR5IHBhdGNoIG9uIHRvcCBvZiB0aGUgU1NF
IHNlcmllcwphbmQgY2hlY2sgaWYgaXQgc3RpbGwgaGFuZyA/CgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wZXJmL3Jpc2N2X3BtdV9kZXYuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfZGV2LmMKaW5k
ZXggN2RlYzljMmFmYTliLi4wZmI4NzQ5YzQ3NmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfZGV2LmMKKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9kZXYuYwpAQCAtMTMy
Niw2ICsxMzI2LDcgQEAgc3RhdGljIGlycXJldHVybl90IHJ2cG11X292Zl9oYW5kbGVyKHN0cnVj
dApjcHVfaHdfZXZlbnRzICpjcHVfaHdfZXZ0LAogICAgICAgIGludCBsaWR4LCBoaWR4LCBmaWR4
OwogICAgICAgIHN0cnVjdCByaXNjdl9wbXUgKnBtdTsKICAgICAgICBzdHJ1Y3QgcGVyZl9ldmVu
dCAqZXZlbnQ7CisgICAgICAgaW50IGV2X292ZXJmbG93ID0gMDsKICAgICAgICB1NjQgb3ZlcmZs
b3c7CiAgICAgICAgdTY0IG92ZXJmbG93ZWRfY3RycyA9IDA7CiAgICAgICAgdTY0IHN0YXJ0X2Ns
b2NrID0gc2NoZWRfY2xvY2soKTsKQEAgLTE0MjMsMTMgKzE0MjQsMTUgQEAgc3RhdGljIGlycXJl
dHVybl90IHJ2cG11X292Zl9oYW5kbGVyKHN0cnVjdApjcHVfaHdfZXZlbnRzICpjcHVfaHdfZXZ0
LAogICAgICAgICAgICAgICAgICAgICAgICAgKiBUT0RPOiBXZSB3aWxsIG5lZWQgdG8gc3RvcCB0
aGUgZ3Vlc3QgY291bnRlcnMKb25jZQogICAgICAgICAgICAgICAgICAgICAgICAgKiB2aXJ0dWFs
aXphdGlvbiBzdXBwb3J0IGlzIGFkZGVkLgogICAgICAgICAgICAgICAgICAgICAgICAgKi8KLSAg
ICAgICAgICAgICAgICAgICAgICAgcGVyZl9ldmVudF9vdmVyZmxvdyhldmVudCwgJmRhdGEsIHJl
Z3MpOworICAgICAgICAgICAgICAgICAgICAgICBldl9vdmVyZmxvdyB8PSBwZXJmX2V2ZW50X292
ZXJmbG93KGV2ZW50LCAmZGF0YSwKcmVncyk7CiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAg
ICAgICAvKiBSZXNldCB0aGUgc3RhdGUgYXMgd2UgYXJlIGdvaW5nIHRvIHN0YXJ0IHRoZSBjb3Vu
dGVyCmFmdGVyIHRoZSBsb29wICovCiAgICAgICAgICAgICAgICBod19ldnQtPnN0YXRlID0gMDsK
ICAgICAgICB9CgotICAgICAgIHJ2cG11X3N0YXJ0X292ZXJmbG93X21hc2socG11LCBvdmVyZmxv
d2VkX2N0cnMpOworICAgICAgIGlmICghZXZfb3ZlcmZsb3cgfHwgIWZyb21fc3NlKQorICAgICAg
ICAgICAgICAgcnZwbXVfc3RhcnRfb3ZlcmZsb3dfbWFzayhwbXUsIG92ZXJmbG93ZWRfY3Rycyk7
CisKICAgICAgICBwZXJmX3NhbXBsZV9ldmVudF90b29rKHNjaGVkX2Nsb2NrKCkgLSBzdGFydF9j
bG9jayk7CgogICAgICAgIHJldHVybiBJUlFfSEFORExFRDsKCj4gCj4gVGhhbmtzLAo+IAo+IENs
w6ltZW50Cj4gCj4+Cj4+IEluIHRoaXMgd2F5LCB3ZSBjYW4gZW5zdXJlIHRoYXQgYHBtdV9zYmlf
b3ZmX2hhbmRsZXJgIHdpbGwgbm90IGJlCj4+IHJlLWVudGVyZWQgYnkgdGhlIG5ldyBQTVUtU1NF
LCBhbmQgbWluaW1pemUgdGhlIG1vZGlmaWNhdGlvbiBvZiBwZXJmIGxvZ2ljLgo+PiBUaGUgcHJp
Y2UgaXMgdGhhdCB3ZSBnYXZlIHVwIHNhbXBsaW5nIGEgc21hbGwgcG9ydGlvbiBvZiBrZXJuZWwg
Y29kZShmcm9tCj4+IGBwbXVfY3RyX3N0YXJ0YCB0byB0aGUgZW5kIG9mIGBwbXVfc2JpX292Zl9o
YW5kbGVyYCksIGFuZCB3ZSBwcm9iYWJseSBuZWVkCj4+IGEgbmV3IHBhcmFtZXRlciBpbiBgcG11
X2N0cl9zdGFydGAuCj4+Cj4+IExvb2tpbmcgZm9yd2FyZCB0byB5b3VyIHN1Z2dlc3Rpb25zLiBU
aGFua3MhCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gWmhhbnBlbmcgWmhhbmcKPj4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
