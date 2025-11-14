Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857C1CE7B08
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 13:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTALzQiewLnYcV2Ztdnd8GWOdpN2j3szC+xohb39Bog=; b=yRCVugS7WGDWdZ
	JWH18VJoY+qe5gYAwBhnBzRD/xoevvTOvxCMIG6q87CQ6fCfVAvhf1ATLdvlw1Skiab5ww3L7SKRV
	EPULwob093o1TcuN1D1AYMv7DuZsO3t6JekmqVWE55/CBjhUrwtXkEYPrwrMHH5wLrWiepLxWNLZO
	AHrFNqOBGlxV7Lf7A7G4NTi/jkOCsw84ayS7QI6B07i/6ATbzdaNlVKpqxmFScmKM3gs9e2FqgUwR
	LLpZqDTVNH20TahKIjMe6ckksvCA8wpRpZnKPjiBQyp4wRL9kYu3VuP6cuw8Z+ByCb2E9LZzAIHF9
	3hdvpStHQOjS8jd3HQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtyc-0000000CGpN-14A2;
	Fri, 14 Nov 2025 13:36:34 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtyY-0000000CGoM-3ntL
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 13:36:33 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34381ec9197so1884896a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Nov 2025 05:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1763127390; x=1763732190; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHEr0VGdvNGDZiR6SQYgH1KlLGPNA+7KAqiw0a2paZY=;
        b=AQW09aAc44xA1D+dTz6hmPQrPEZaYHvJQt+M6pHgchWqykzuqZkHfH0as2Ye3MvS6n
         0CWHbIhTpx4xHzDV60XnlMaeIE42JnVq0c4zGayjDWHfvx+oTjefFEUFNC8T4rmhLlHt
         YzWdITwF1Ud8TTza+at62F40lZJo4Tb5Lw4EsJYAxExGmuEBzdtwzBCQcRhbIcrKqzcJ
         QqKJALa8lf1iDkNZ3aeYhJyAsQaM5ytbMdcbz03lyfGEbY3hbelRmG7CYGIsqB3VQfjm
         qp5L1EQsZTmd/cIWUBdPWugyZtBwwygiQex2n3lsEiv5j04KXJhfN/oO7JM/5gWf6Ll7
         XNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127390; x=1763732190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHEr0VGdvNGDZiR6SQYgH1KlLGPNA+7KAqiw0a2paZY=;
        b=O9tzITKpYN7wa0hB3XxiL7Y/+EzNstfEv0FbxhDUjV79uS830zUwOLbbntxIiEQ3BJ
         xpWQYAaevm0d4vT/mFym/L1tHHI05zEuN9l6ZkIIqHQ+gQRMMlO6cpZFlDS7zlULo5l8
         f6p+LDz3CTWGGij9lh1C3mHUzK/nDulZAN5Hj9SLGOcDCnsHTAlvBwHUpzJtpX5rGIwU
         hyPOV7hvPHqRiCitT0VhinJBsESJE5H5Skiutve2D3j3twyf16dwRO5yZX452ZQ4U99y
         YUTfw2cCA4kpfpbUSomdbmt6UNubn2mAI9+5S0kvxDVkfoePjfs5ZWDDhZiXFVSnPLcq
         2QYg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Twnnc9sZoJs3RuhFo5Z/gXNZZADaB+c7JqmvwAi4DaQc7cQvQNrgPCd6pDbJ2MnpPsL4aK6VLF60/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoD+HV+FMj4tygNBv1jZ2DqmQGfK+eV8MrQp1ajwQdVceC9SCN
	n03X4gwcojL2ocem3Kan2/OiXkSs17fYgkqF/BwDH7V9k41lJexWhlMHfrkmEoMLypc=
X-Gm-Gg: ASbGnct9DOM2cBO7QxF3A3WIJJjnKER4hk1hYnXCfTeh+d7aarcKyUqbmLaOXm3KIrl
	tIVhfhe6aJLLdGbqdk6TYiCLXNYRDI6zJOpur/x2dHFMUZSuxlAxpmSMoWf/mNVATnjLqd8m7jF
	1QXl1Hq1Ozq5Vuo2wgN9CP4zvbxo/PCJQRd6+xOuqGgEFNv4qJyYld4JudHVjrCeUR7Y2pMWA1n
	rDHzZOdDz0WVzmbf1ckeAcpGUW7NA6La9Bgv9HJd74le6M1/s2/bNfSEv6ZzqTZmDkU80M96Cn7
	3SwHUGUoGZljXJnkspT9oS57JvrO/WSHFgY8I0eEeltnZYJ6CZNIHDlJYHMjGuoFPSYS82TSVrp
	97MpMPA2mt2KBue4LTGBN+3Z1mrqBk6Pu2I4XlgzI00eGJjp0LOXCQMc4st8MiJvygnuRx+AYDz
	d1eM9k1cq3nQaSUbIDgL4o3zQzV4PhKhDye+TnV9fs80XU7A==
X-Google-Smtp-Source: AGHT+IGTlOsBEwW7dz/WZ/DHBPhbduYubtpAD4QTiOhGNCk+QaT1FYVrfJAMaEe5hmWNAFKDgI1qjg==
X-Received: by 2002:a17:90b:540e:b0:341:88c5:2073 with SMTP id 98e67ed59e1d1-343f9d906dfmr3058440a91.2.1763127389658;
        Fri, 14 Nov 2025 05:36:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343eac7ec71sm2423873a91.11.2025.11.14.05.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 05:36:28 -0800 (PST)
Message-ID: <bec1e1f4-e188-415d-bbb2-1854b7e8cf1d@rivosinc.com>
Date: Fri, 14 Nov 2025 14:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to Avoid Starving the Kernel When Using SSE
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
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CACnXVncnu6Rnx64GemdBvxu+mTqYEMGePoR5OvaJh3gC4uG-NA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053631_059094_70E3E08F 
X-CRM114-Status: GOOD (  33.76  )
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

CgpIaSBaaGFucGVuZywKCk9uIDExLzE0LzI1IDExOjI0LCDlvKDlsZXpuY8gd3JvdGU6Cj4gSGkg
Q2zDqW1lbnQsCj4gCj4gTGF0ZWx5LCBJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgaG93IHRvIGF2
b2lkIHN0YXJ2aW5nIHRoZSBrZXJuZWwgd2hlbgo+IHVzaW5nIFNTRToKPiBTU0UgaXMgcG93ZXJl
ZCBieSBNLW1vZGUgaXJxcyBzdWNoIGFzIE0tbW9kZSBQTVUgaXJxIGZvciBwZXJmIHNhbXBsaW5n
IGFuZAo+IE0tbW9kZSBJUEkgZm9yIGludGVyLWhhcnQgaW5qZWN0aW9uLiBNZWFud2hpbGUsIGtl
cm5lbCBpcyBwb3dlcmVkIGJ5IFMtbW9kZQo+IGlycXMsIHNvIHRoZSBrZXJuZWwgbWF5IGV4cGVy
aWVuY2Ugc3RhcnZhdGlvbiB3aGVuIHRoZXJlIGlzIGEgZmxvb2Qgb2YKPiBNLW1vZGUgaXJxcywg
YW5kIGtlcm5lbCBtYXkgY2F1c2Ugc3VjaCBmbG9vZGluZyBvZiBNLW1vZGUgaXJxcyB3aGVuIHVz
aW5nCj4gU1NFLCBlaXRoZXIgZGVsaWJlcmF0ZWx5IG9yIGluYWR2ZXJ0ZW50bHk6Cj4gCj4gICAg
MS4gIE1hbGljaW91cyBTU0UgaGFuZGxlcjogS2VybmVsIG1heSBkZWxpYmVyYXRlbHkgcmVnaXN0
ZXIgYSBiYWQgU1NFCj4gICAgaGFuZGxlciwgd2hpY2ggdHJpZ2dlcnMgYSBuZXcgaW50ZXItaGFy
dCBTU0UgcmVxdWVzdCB2aWEgZWNhbGwuIFRoaXMgd2lsbAo+ICAgIGNhdXNlIGFuIGVuZGxlc3Mg
bG9vcCBvZiBTU0UsIHJlbmRlcmluZyB0aGUga2VybmVsIHVucmVzcG9uc2l2ZS4gSW4gdGhpcwo+
ICAgIGNhc2UsIHRoZSBvbmx5IHRoaW5nIFNCSSBjYW4gZG8gaXMgdG8gcHJldmVudCB0aGUgbmVz
dGluZyBvZiBTU0UgaW4KPiAgICBgc2JpX3RyYXBfaGFuZGxlcmAgYW5kIGVuc3VyZSB0aGF0IFNT
RSBldmVudHMgYXJlIGV4ZWN1dGVkIGluIHByaW9yaXR5Cj4gICAgb3JkZXIuCgpUaGF0IHNlZW1z
IHF1aXRlIGNvbnZvbHV0ZWQuIEFueW9uZSB0aGF0IGNhbiBsb2FkIGEgbW9kdWxlIGNhbiBkbyB3
b3JzZQp0aGFuIGNyYXNoaW5nIHRoZSBrZXJuZWwgOikKCj4gICAgMi4gIFBlcmYgc2FtcGxpbmc6
IEtlcm5lbCBtYXkgaW5hZHZlcnRlbnRseSBjaG9vc2UgYSBiYWQgcGFyYW1ldGVyIGZvcgo+ICAg
IFBlcmYsIHdoaWNoIGNhdXNlcyBQTVUgaXJxcyB0byBvY2N1ciB0b28gZnJlcXVlbnRseS4gQ29u
dGludW91cyBQTVUgaXJxcwo+ICAgIHdpbGwgbGVhdmUgdGhlIHN5c3RlbSB3aXRoIG5vIHRpbWUg
dG8gcmVzcG9uZCB0byBTLW1vZGUgaXJxcy4KCkJ1dCB0aGlzIG9uZSBjb25jZXJuIGhvd2V2ZXIg
aXMgdmFsaWQgIQoKPiAKPiAgSGVuY2UsIEkgdGhpbmsgd2UgYXJlIHN1cHBvc2VkIHRvIGltcHJv
dmUgdGhlIFNTRSBmcmFtZXdvcmsgdG8gYXZvaWQKPiBzdGFydmluZyB0aGUga2VybmVsIHNvIGVh
c2lseS4KPiAKPiBIZXJlIGlzIGEgY2FzZSBzdHVkeSBvZiBwZXJmIHNhbXBsaW5nOgo+IFdoZW4g
dXNpbmcgUE1VLVNTRSBmb3IgUGVyZiBzYW1wbGluZywgdGhlIGtlcm5lbCBtYXkgaGFuZyBhbmQg
YmVjb21lCj4gdW5yZXNwb25zaXZlIGR1ZSB0byB0aGUgUE1VLVNTRSBsb29wLiBPbmNlIHdlIHN0
YXJ0IHRvIHByb2Nlc3MgYSBQZXJmCj4gc2FtcGxpbmcgdXNpbmcgUE1VLVNTRSwgdGhlIGtlcm5l
bCBtYXkgZmFpbCB0byByZXNwb25kIHRvIGBDdHJsK0NgIG9yIGZhaWwKPiB0byBleGl0IGFmdGVy
IHRoZSB0aW1pbmcgb2YgYHNsZWVwIDFgIGNvbXBsZXRlcyAodGhlc2UgYXJlIHRoZSB0d28gbW9z
dAo+IGNvbW1vbmx5IHVzZWQgdGltZS1iYXNlZCBzYW1wbGluZyBtZXRob2RzIGluIHBlcmYpLgo+
IAo+IEJ5IGRlZmF1bHQsIHBlcmYgdXNlcyBhIHJlbGF0aXZlbHkgaGlnaCBzYW1wbGluZyBmcmVx
dWVuY3ksIG5hbWVseQo+IGBwZXJmX2V2ZW50X21heF9zYW1wbGVfcmF0ZWAsIGFuZCB3aWxsIGFk
anVzdCBpdCBvbiBkZW1hbmQgaWYgc2FtcGxpbmcKPiB0YWtlcyB0b28gbXVjaCB0aW1lLiBJZiB0
aGlzIGZyZXF1ZW5jeS9wZXJpb2QgZ29lcyBiZXlvbmQgd2hhdCBzeXN0ZW0gY2FuCj4gaGFuZGxl
LCBpdCB3aWxsIG1ha2UgU1NFIGV2ZW50cyBjb25uZWN0IGVuZC10by1lbmQsIGFuZCB0aGUgc3lz
dGVtIHdpbGwgZ2V0Cj4gc3R1Y2sgaW4gYW4gZW5kbGVzcyBsb29wIG9mICJTU0Ug4oaSIFBNVSBp
bnRlcnJ1cHQg4oaSIFNTRSIuIFRoZSBrZXJuZWwgaXMgdGhlbgo+IHN0YXJ2ZWQgKGF0IHRoaXMg
cG9pbnQsIGlmIHlvdSBwcmludCB0aGUgYHNlcGNgIG9mIFNTRSBjb21wbGV0aW9uLCB5b3Ugd2ls
bAo+IGZpbmQgdGhhdCB0aGUgYHNlcGNgIHJlbWFpbnMgdW5jaGFuZ2VkIGVhY2ggdGltZSwgaW5k
aWNhdGluZyB0aGF0IHRoZQo+IGtlcm5lbCBpcyBzdHVjayksIGFuZCB0aGUga2VybmVsIGNhbiBu
ZXZlciBlc2NhcGUgZnJvbSB0aGlzIGxvb3Agb2YKPiBQTVUtU1NFLCBiZWNhdXNlIGl0IGNhbiBu
ZWl0aGVyIHJlc3BvbmQgdG8gQ3RybCtDIGludGVycnVwdHMgbm9yIGFkanVzdCB0aGUKPiBzYW1w
bGluZyBmcmVxdWVuY3kuCj4gCj4gQ3VycmVudCBzb2x1dGlvbjogVGhlIGtleSB0byB0aGlzIHBy
b2JsZW0gaXMgdGhhdCBldmVyeSB0aW1lIHdlIGZpbmlzaAo+IHNzZV9jb21wbGV0ZSwgdGhlcmUg
aXMgYWxyZWFkeSBhIG5ldyBQTVUgaXJxIHBlbmRpbmcuIFRoZW4gd2UgcmVzdW1lIHRoZQo+IGtl
cm5lbCBleGVjdXRpb24gdmlhIG1yZXQsIGFuZCB0aGUgc3lzdGVtIHdpbGwgaW1tZWRpYXRlbHkg
dHJhcCBiYWNrIGludG8KPiBTU0UuCj4gCj4gVGhlIFBNVS1TU0UtUGVyZiBwcm9jZXNzaW5nIGZs
b3cgaW5jbHVkZXMgdGhlIGZvbGxvd2luZyBzdGVwczogYHNzZV9pbmplY3RgCj4gKG1yZXQgdG8g
U1NFIGhhbmRsZXIpLCBgcG11X3N0b3BgIChjbGVhciBQTVUgcGVuZGluZyBiaXQpLCBgcG11X3N0
YXJ0YCAoc2V0Cj4gYSBuZXcgdmFsdWUgZm9yIFBNVSBjb3VudGVyKSwgYW5kIGBzc2VfY29tcGxl
dGVgIChyZXN1bWUgZXhlY3V0aW9uIHRvIHRoZQo+IHBvaW50IHdoZXJlIHRoZSBrZXJuZWwgd2Fz
IGludGVycnVwdGVkKS4gVGhlIHJlYXNvbiB3aHkga2VybmVsIHRyYXBzIHJpZ2h0Cj4gYWZ0ZXIg
YHNzZV9jb21wbGV0ZWAgaXMgdGhhdCB0aGVyZSBpcyBhIG5ldyBQTVUgaXJxIGdlbmVyYXRlZCBi
ZXR3ZWVuCj4gYHBtdV9zdGFydGAgYW5kIGBzc2VfY29tcGxldGVgLgo+IAo+IEluIG9yZGVyIHRv
IGFkZHJlc3MgdGhpcyBpc3N1ZSwgd2UgcHJvcG9zZSB0byBkZWxheSB0aGUgcHJvY2VkdXJlIG9m
Cj4gcmUtc3RhcnRpbmcgdGhlIG92ZXJmbG93ZWQgUE1VIGNvdW50ZXIgZHVyaW5nIFBNVS1TU0Uu
IFdoZW4ga2VybmVsIHRyaWdnZXJzCj4gYW4gZWNhbGwgdG8gcmVzdGFydCB0aGUgb3ZlcmZsb3dl
ZCBQTVUgY291bnRlcnMsIFNCSSBjYW4gY2hlY2sgd2hldGhlciBpdAo+IGlzIFNTRS1wb3dlcmVk
IFBNVSBoYW5kbGluZy4gSWYgc28sIHdlIHRlbXBvcmFyaWx5IG1vZGlmeSBtaHBtZXZlbnQgQ1NS
IHRvCj4gc3RvcCBjb3VudGluZyBrZXJuZWwgZXZlbnRzLiBJbiB0aGlzIHByb2Nlc3MsIE0tbW9k
ZSBldmVudHMgYXJlIGFsd2F5cwo+IGluaGliaXRlZCwgYW5kIFUtbW9kZSBjb2RlIHdpbGwgbm90
IGJlIGV4ZWN1dGVkIGR1cmluZyB0aGUKPiBgcG11X3NiaV9vdmZfaGFuZGxlcmAsIHNvIHdlIG9u
bHkgbmVlZCB0byBpbmhpYml0IHRoZSBjb3VudGluZyBvZiBrZXJuZWwKPiBldmVudHMuCgpJJ2Qg
cmF0aGVyIGxldCB0aGUga2VybmVsIGNvbnRyb2wgdGhlIFBNVSBTU0UgZXZlbnQgZGVsaXZlcnkg
YnkgbWFza2luZwppdCBhdCB0aGUgZW5kIG9mIHRoZSBTU0UgaGFuZGxlciBhbmQgcmVlbmFibGlu
ZyBpdCBsYXRlci4gQWRkaXRpb25hbGx5LAp0aGF0IHNvbHV0aW9uIGJlaW5nIGluIHRoZSBTQkkg
aXRzZWxmLCBpdCBkb2VzIG5vdCBndWFyYW50ZWUgdGhhdCBhbGwKU0JJIGltcGxlbWVudGF0aW9u
IHdpbGwgYWN0dWFsbHkgZG8gdGhhdCBjb3JyZWN0bHkuCgpXaGF0IHNlZW1zIG9kZCBpcyB0aGF0
IHRoZSBwZXJmX2V2ZW50X3NhbXBsZV90b29rKCkgY2FsbCBhdCBlYWNoIGVuZCBvZgpQTVUgZXZl
bnQgaGFuZGxlciBzaG91bGQgYWN0dWFsbHkgYWxsb3cgcGVyZiBzdWJzeXN0ZW0gdG8gdGhyb3R0
bGUgdGhlCnJhdGUuIEknbGwgdGFrZSBhbm90aGVyIGxvb2sgYXQgdGhhdCBwYXJ0IHRvIG1ha2Ug
c3VyZSBpdCB3b3JrcyBhcwpleHBlY3RlZCBhbmQgdGhhdCB3ZSBhcmVuJ3QgbWlzc2luZyBhbnkg
Yml0cy4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IEluIHRoaXMgd2F5LCB3ZSBjYW4gZW5zdXJl
IHRoYXQgYHBtdV9zYmlfb3ZmX2hhbmRsZXJgIHdpbGwgbm90IGJlCj4gcmUtZW50ZXJlZCBieSB0
aGUgbmV3IFBNVS1TU0UsIGFuZCBtaW5pbWl6ZSB0aGUgbW9kaWZpY2F0aW9uIG9mIHBlcmYgbG9n
aWMuCj4gVGhlIHByaWNlIGlzIHRoYXQgd2UgZ2F2ZSB1cCBzYW1wbGluZyBhIHNtYWxsIHBvcnRp
b24gb2Yga2VybmVsIGNvZGUoZnJvbQo+IGBwbXVfY3RyX3N0YXJ0YCB0byB0aGUgZW5kIG9mIGBw
bXVfc2JpX292Zl9oYW5kbGVyYCksIGFuZCB3ZSBwcm9iYWJseSBuZWVkCj4gYSBuZXcgcGFyYW1l
dGVyIGluIGBwbXVfY3RyX3N0YXJ0YC4KPiAKPiBMb29raW5nIGZvcndhcmQgdG8geW91ciBzdWdn
ZXN0aW9ucy4gVGhhbmtzIQo+IAo+IEJlc3QgcmVnYXJkcywKPiBaaGFucGVuZyBaaGFuZwo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
