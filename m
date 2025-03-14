Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D5FC28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vpfc+dTFsqydeVv0wzvMAyE1+T+Hk7CDc3LASKrpPVE=; b=Lyj0DyN7TZgOfC
	zCqniowZQJxsrWUBkD56gOdolD1QT02HYR/pHiZ86x9UW2tBcXkm+hgf6jF6/akgdmaKBJfQa4Dpw
	3Rq2v66agKnxJGBXuttC7TZwrMNuNLkVCb4NOmDY32s5S3N81ABlPM9dkznRDXHDWRUtBmJXoUWjL
	em30kwdOsnfkTSMZAS5O4T9Mdt32DheuRyZSFbwxANOV9YwZ7QQHigFvR1cH7DuwYBb3fbt3gKOAZ
	jjLJc0B+NioIjchCy+Tbga6BY9a/E/r8X+bMESkces9iUU1RUTDyMJfdZescWNjSlJgirUeyO5vpO
	WMg/AXDFGOzkl0BxfAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3On-0000000E23z-3RkV;
	Fri, 14 Mar 2025 11:40:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3Ic-0000000E0lF-1aYL
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:33:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso13240455e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741952037; x=1742556837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nsvbx0/e3umNGv5t27NVbjQ76HCEZqmQcUDkEBMQhSw=;
        b=MpTiX8nys14WcY9pi8wuPFcrvknS7INU3+6foaNInPtDbODA2zjqOJLIoirR8gTcUr
         2qmsVZobJuSEb4M8DH+FKDtbYHyr26ubyCHSny5NRGkltaiExbynihBVU0Znuw/alZYA
         kpraKudU40aV+5blt9oXe1nqolDGyk3NLOf7gC9v9NTJHfodAWygxiXigKw+JuY4hVtl
         qiItS7QkcB+tHOvgn/ILzn+bhR2rWFrRPMu8vYBXL3+PS4J3bkr9lOiYDzAxQ9ZruWPc
         OXfwieNF0G6USGRDPRBVNlBQ9KMdoFMTEKVjVxPRVCz5wPogu7ohGOKij5b0l/ss0LbE
         9o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741952037; x=1742556837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsvbx0/e3umNGv5t27NVbjQ76HCEZqmQcUDkEBMQhSw=;
        b=S95A5QBaYUfZ43MqADomhSCupBzI8V5s9JhI4aEZWvFQSl7qFf2hVptD91mCIt2Zef
         yt8Ou16T4Cs3xy297r4e1y3JW4jAIABQnqAghbXFGXX5B1mvmPr+Cjnw/FAm+/0u2neY
         X4NTSvmdcE4DbfplCyrLoGm/Lh2JcpO/Mq9Zl4eeqkMDSYu7P9EJiFj8KxBEYVT3PTwH
         FxBzRFMUEt6sMEpREqgJJKsJL9hf7uYyEvyXUlCs4ZkCKqym6QFTzlFXeGcvkF1gW4JL
         btAOlFdU61n9sdTGXT9vT3wTeauoAusnP3CQ1JBgkIdBYU8TzkISvpSYyFcmX0vt9iOH
         R9hg==
X-Forwarded-Encrypted: i=1; AJvYcCU1nkWAjF1CpYVCL2sxDgQAibQy4ebEZJkRmtmm656bXtNdjk9CF2hA6sM4ZfB4Ilh76Y8j1EkoJXeeVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfI32CnzYHe61EIqi8I+Eje0Oq2Qo2fUYUchwy3pbBVpHyv5Ta
	FSYTQ4i7YD+sv5imsDgOLbiunfBNtCXYUrspc3XfAQrSCe44FBuQ5jkqxlu3Pls=
X-Gm-Gg: ASbGnctddpN7ioMJOJP4Mg+Trp6AjvZpwJMXyHw2xS12XFOiJ1xU4eO/zO7FqnJE4Yx
	3Ewic0wqIBtIPllMsGxrdqL6RSobNDT72W7DEBt702tF3wNmv2RL2KgYioMxBs+6M7nu3UVnFsA
	Xf6WBvf1eYbT9GEWUO0cRbvW+QlKp/+ndjKJDEsVMtbAbrVBS3e2Ni0vfnufO6UQkFeHW1hvCkr
	96vP7lxSnq+0wRtU2/LF6kaZH9qblJn6+mc3ddKSTKQnp5YTIEMf1YfHfLvudc64raWxUDFL94d
	WKS5GYtQbyPzRbEFMPfvwH6LH4oQMbd40BNjcUq+NKpzFr9cNc1wNngIjweocpcSSzSeGO+g9K6
	5y6/I5FbDj/lD2g==
X-Google-Smtp-Source: AGHT+IGFCS6aHC85bI1G02X5ARi0quKTYrYIojfOtWsQSuEVwoRIcZmL2DpiMo0uOfjcu6utBxTbug==
X-Received: by 2002:a05:6000:4025:b0:391:1139:2653 with SMTP id ffacd0b85a97d-3971ffb3a29mr1899191f8f.52.1741952036756;
        Fri, 14 Mar 2025 04:33:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe65977sm14993745e9.36.2025.03.14.04.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:33:56 -0700 (PDT)
Message-ID: <dad465de-e5da-4ebb-8395-ea9e181a6f57@rivosinc.com>
Date: Fri, 14 Mar 2025 12:33:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/17] riscv: sbi: add FWFT extension interface
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-3-cleger@rivosinc.com>
 <20250313-5c22df0c08337905367fa125@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-5c22df0c08337905367fa125@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_043358_420542_C899DFD6 
X-CRM114-Status: GOOD (  30.34  )
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

CgpPbiAxMy8wMy8yMDI1IDEzOjM5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMDQ6MTI6MDlQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBU
aGlzIFNCSSBleHRlbnNpb25zIGVuYWJsZXMgc3VwZXJ2aXNvciBtb2RlIHRvIGNvbnRyb2wgZmVh
dHVyZSB0aGF0IGFyZQo+PiB1bmRlciBNLW1vZGUgY29udHJvbCAoRm9yIGluc3RhbmNlLCBTdmFk
dSBtZW52Y2ZnIEFEVUUgYml0LCBTc2RibHRycAo+PiBEVEUsIGV0YykuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgIDUgKysKPj4gIGFyY2gvcmlzY3Yva2VybmVs
L3NiaS5jICAgICAgfCA5NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5o
Cj4+IGluZGV4IGJiMDc3ZDBjOTEyZi4uZmM4N2M2MDljMTFhIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2JpLmgKPj4gQEAgLTUwMyw2ICs1MDMsMTEgQEAgaW50IHNiaV9yZW1vdGVfaGZlbmNlX3Z2bWFf
YXNpZChjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCj4+ICAJCQkJdW5zaWduZWQgbG9u
ZyBhc2lkKTsKPj4gIGxvbmcgc2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0KTsKPj4gIAo+PiAr
aW50IHNiaV9md2Z0X2FsbF9jcHVzX3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1
ZSwgdW5zaWduZWQgbG9uZyBmbGFncywKPj4gKwkJCSAgYm9vbCByZXZlcnRfb25fZmFpbHVyZSk7
Cj4+ICtpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSk7
Cj4+ICtpbnQgc2JpX2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1
bnNpZ25lZCBsb25nIGZsYWdzKTsKPj4gKwo+PiAgLyogQ2hlY2sgaWYgY3VycmVudCBTQkkgc3Bl
Y2lmaWNhdGlvbiB2ZXJzaW9uIGlzIDAuMSBvciBub3QgKi8KPj4gIHN0YXRpYyBpbmxpbmUgaW50
IHNiaV9zcGVjX2lzXzBfMSh2b2lkKQo+PiAgewo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+PiBpbmRleCAxOTg5YjhjYWRl
MWIuLjI1NjkxMGRiMTMwNyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPj4gQEAgLTI5OSw2ICsyOTksMTAzIEBA
IHN0YXRpYyBpbnQgX19zYmlfcmZlbmNlX3YwMihpbnQgZmlkLCBjb25zdCBzdHJ1Y3QgY3B1bWFz
ayAqY3B1X21hc2ssCj4+ICAJcmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gK2ludCBzYmlfZndmdF9n
ZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQo+PiArewo+PiArCXJldHVybiAt
RU9QTk9UU1VQUDsKPj4gK30KPj4gKwo+PiArLyoqCj4+ICsgKiBzYmlfZndmdF9zZXQoKSAtIFNl
dCBhIGZlYXR1cmUgb24gYWxsIG9ubGluZSBjcHVzCj4gCj4gY29weStwYXN0ZSBvZiBkZXNjcmlw
dGlvbiBmcm9tIHNiaV9md2Z0X2FsbF9jcHVzX3NldCgpLiBUaGlzIGZ1bmN0aW9uCj4gb25seSBz
ZXRzIHRoZSBmZWF0dXJlIG9uIHRoZSBjYWxsaW5nIGhhcnQuCj4gCj4+ICsgKiBAZmVhdHVyZTog
VGhlIGZlYXR1cmUgdG8gYmUgc2V0Cj4+ICsgKiBAdmFsdWU6IFRoZSBmZWF0dXJlIHZhbHVlIHRv
IGJlIHNldAo+PiArICogQGZsYWdzOiBGV0ZUIGZlYXR1cmUgc2V0IGZsYWdzCj4+ICsgKgo+PiAr
ICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFwcHJvcHJpYXRlIGxpbnV4IGVycm9yIGNvZGUgb3Ro
ZXJ3aXNlLgo+PiArICovCj4+ICtpbnQgc2JpX2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25l
ZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdzKQo+PiArewo+PiArCXJldHVybiAtRU9Q
Tk9UU1VQUDsKPj4gK30KPj4gKwo+PiArc3RydWN0IGZ3ZnRfc2V0X3JlcSB7Cj4+ICsJdTMyIGZl
YXR1cmU7Cj4+ICsJdW5zaWduZWQgbG9uZyB2YWx1ZTsKPj4gKwl1bnNpZ25lZCBsb25nIGZsYWdz
Owo+PiArCWNwdW1hc2tfdCBtYXNrOwo+PiArfTsKPj4gKwo+PiArc3RhdGljIHZvaWQgY3B1X3Ni
aV9md2Z0X3NldCh2b2lkICphcmcpCj4+ICt7Cj4+ICsJc3RydWN0IGZ3ZnRfc2V0X3JlcSAqcmVx
ID0gYXJnOwo+PiArCj4+ICsJaWYgKHNiaV9md2Z0X3NldChyZXEtPmZlYXR1cmUsIHJlcS0+dmFs
dWUsIHJlcS0+ZmxhZ3MpKQo+PiArCQljcHVtYXNrX2NsZWFyX2NwdShzbXBfcHJvY2Vzc29yX2lk
KCksICZyZXEtPm1hc2spOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IHNiaV9md2Z0X2ZlYXR1
cmVfbG9jYWxfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLAo+PiArCQkJCSAg
ICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCj4+ICsJCQkJICAgICAgYm9vbCByZXZlcnRfb25fZmFp
bCkKPj4gK3sKPj4gKwlpbnQgcmV0Owo+PiArCXVuc2lnbmVkIGxvbmcgcHJldl92YWx1ZTsKPj4g
KwljcHVtYXNrX3QgdG1wOwo+PiArCXN0cnVjdCBmd2Z0X3NldF9yZXEgcmVxID0gewo+PiArCQku
ZmVhdHVyZSA9IGZlYXR1cmUsCj4+ICsJCS52YWx1ZSA9IHZhbHVlLAo+PiArCQkuZmxhZ3MgPSBm
bGFncywKPj4gKwl9Owo+PiArCj4+ICsJY3B1bWFza19jb3B5KCZyZXEubWFzaywgY3B1X29ubGlu
ZV9tYXNrKTsKPj4gKwo+PiArCS8qIFdlIGNhbiBub3QgcmV2ZXJ0IGlmIGZlYXR1cmVzIGFyZSBs
b2NrZWQgKi8KPj4gKwlpZiAocmV2ZXJ0X29uX2ZhaWwgJiYgZmxhZ3MgJiBTQklfRldGVF9TRVRf
RkxBR19MT0NLKQo+IAo+IFNob3VsZCB1c2UgKCkgYXJvdW5kIHRoZSBmbGFncyAmLiBJIHRob3Vn
aHQgY2hlY2twYXRjaCBjb21wbGFpbmVkIGFib3V0Cj4gdGhhdD8KPiAKPj4gKwkJcmV0dXJuIC1F
SU5WQUw7Cj4+ICsKPj4gKwkvKiBSZXNldCB2YWx1ZSBpcyB0aGUgc2FtZSBmb3IgYWxsIGNwdXMs
IHJlYWQgaXQgb25jZS4gKi8KPiAKPiBIb3cgZG8gd2Uga25vdyB3ZSdyZSByZWFkaW5nIHRoZSBy
ZXNldCB2YWx1ZT8gc2JpX2Z3ZnRfYWxsX2NwdXNfc2V0KCkgbWF5Cj4gYmUgY2FsbGVkIG11bHRp
cGxlIHRpbWVzIG9uIHRoZSBzYW1lIGZlYXR1cmUuIEFuZCBoYXJ0cyBtYXkgaGF2ZSBoYWQKPiBz
YmlfZndmdF9zZXQoKSBjYWxsZWQgb24gdGhlbSBpbmRlcGVuZGVudGx5LiBJIHRoaW5rIHdlIHNo
b3VsZCBkcm9wIHRoZQo+IHdob2xlIHByZXZfdmFsdWUgb3B0aW1pemF0aW9uLgoKVGhhdCdzIGFj
dHVhbGx5IHVzZWQgZm9yIHJldmVydF9vbl9mYWlsdXJlIGFzIHdlbGwgbm90IG9ubHkgdGhlCm9w
dGltaXphdGlvbi4KCj4gCj4+ICsJcmV0ID0gc2JpX2Z3ZnRfZ2V0KGZlYXR1cmUsICZwcmV2X3Zh
bHVlKTsKPj4gKwlpZiAocmV0KQo+PiArCQlyZXR1cm4gcmV0Owo+PiArCj4+ICsJLyogRmVhdHVy
ZSBtaWdodCBhbHJlYWR5IGJlIHNldCB0byB0aGUgdmFsdWUgd2Ugd2FudCAqLwo+PiArCWlmIChw
cmV2X3ZhbHVlID09IHZhbHVlKQo+PiArCQlyZXR1cm4gMDsKPj4gKwo+PiArCW9uX2VhY2hfY3B1
X21hc2soJnJlcS5tYXNrLCBjcHVfc2JpX2Z3ZnRfc2V0LCAmcmVxLCAxKTsKPj4gKwlpZiAoY3B1
bWFza19lcXVhbCgmcmVxLm1hc2ssIGNwdV9vbmxpbmVfbWFzaykpCj4+ICsJCXJldHVybiAwOwo+
PiArCj4+ICsJcHJfZXJyKCJGYWlsZWQgdG8gc2V0IGZlYXR1cmUgJXggZm9yIGFsbCBvbmxpbmUg
Y3B1cywgcmV2ZXJ0aW5nXG4iLAo+PiArCSAgICAgICBmZWF0dXJlKTsKPiAKPiBuaXQ6IEknZCBs
ZXQgdGhlIGFib3ZlIGxpbmUgc3RpY2sgb3V0LiBXZSBoYXZlIDEwMCBjaGFycy4KPiAKPj4gKwo+
PiArCXJlcS52YWx1ZSA9IHByZXZfdmFsdWU7Cj4+ICsJY3B1bWFza19jb3B5KCZ0bXAsICZyZXEu
bWFzayk7Cj4+ICsJb25fZWFjaF9jcHVfbWFzaygmcmVxLm1hc2ssIGNwdV9zYmlfZndmdF9zZXQs
ICZyZXEsIDEpOwo+PiArCWlmIChjcHVtYXNrX2VxdWFsKCZyZXEubWFzaywgJnRtcCkpCj4+ICsJ
CXJldHVybiAwOwo+IAo+IEknbSBub3Qgc3VyZSB3ZSB3YW50IHRoZSByZXZlcnRfb25fZmFpbCBz
dXBwb3J0IGVpdGhlci4gV2hhdCBoYXBwZW5zIHdoZW4KPiB0aGUgcmV2ZXJ0IGZhaWxzIGFuZCB3
ZSByZXR1cm4gLUVJTlZBTCBiZWxvdz8gQWxzbyByZXR1cm5pbmcgemVybyB3aGVuCj4gcmV2ZXJ0
IHN1Y2NlZWRzIG1lYW5zIHRoZSBjYWxsZXIgd29uJ3Qga25vdyBpZiB3ZSBzdWNjZXNzZnVsbHkg
c2V0IHdoYXQKPiB3ZSB3YW50ZWQgb3IganVzdCBzdWNjZXNzZnVsbHkgcmV2ZXJ0ZWQuCgpTbyB0
aGF0IG1pZ2h0IGFjdHVhbGx5IGJlIG5lZWRlZCBmb3IgZmVhdHVyZXMgdGhhdCBuZWVkcyB0byBi
ZSBlbmFibGVkCm9uIGFsbCBoYXJ0IG9yIG5vdCBlbmFibGVkIGF0IGFsbC4gSWYgd2UgZmFpbCB0
byBlbmFibGUgYWxsIG9mIHRoZW0sCnRoZW0gdGhlIGhhcnQgd2lsbCBiZSBpbiBzb21lIG5vbiBj
b2hlcmVudCBzdGF0ZSBiZXR3ZWVuIHRoZSBoYXJ0cy4KVGhlIHJldHVybmVkIGVycm9yIGNvZGUg
dGhvdWdoIGlzIHdyb25nIGFuZCBJJ20gbm90IHN1cmUgd2Ugd291bGQgaGF2ZSBhCndheSB0byBn
cmFjZWZ1bGx5IGhhbmRsZSByZXZlcnRpb24gZmFpbHVyZSAoZXhjZXB0IG1heWJlIHBhbmlja2lu
ZyA/KS4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+PiArCj4+ICsJcmV0dXJuIC1FSU5WQUw7Cj4+
ICt9Cj4+ICsKPj4gKy8qKgo+PiArICogc2JpX2Z3ZnRfYWxsX2NwdXNfc2V0KCkgLSBTZXQgYSBm
ZWF0dXJlIG9uIGFsbCBvbmxpbmUgY3B1cwo+PiArICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIHRv
IGJlIHNldAo+PiArICogQHZhbHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBzZXQKPj4gKyAq
IEBmbGFnczogRldGVCBmZWF0dXJlIHNldCBmbGFncwo+PiArICogQHJldmVydF9vbl9mYWlsOiB0
cnVlIGlmIGZlYXR1cmUgdmFsdWUgc2hvdWxkIGJlIHJlc3RvcmVkIHRvIGl0J3Mgb3JpZ25hbAo+
IAo+IGl0cyBvcmlnaW5hbAo+IAo+PiArICogCQkgICAgdmFsdWUgb24gZmFpbHVyZS4KPiAKPiBM
aW5lICd2YWx1ZScgdXAgdW5kZXIgJ3RydWUnCj4gCj4+ICsgKgo+PiArICogUmV0dXJuOiAwIG9u
IHN1Y2Nlc3MsIGFwcHJvcHJpYXRlIGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgo+PiArICov
Cj4+ICtpbnQgc2JpX2Z3ZnRfYWxsX2NwdXNfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25n
IHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdzLAo+PiArCQkJICBib29sIHJldmVydF9vbl9mYWls
KQo+PiArewo+PiArCWlmIChmZWF0dXJlICYgU0JJX0ZXRlRfR0xPQkFMX0ZFQVRVUkVfQklUKQo+
PiArCQlyZXR1cm4gc2JpX2Z3ZnRfc2V0KGZlYXR1cmUsIHZhbHVlLCBmbGFncyk7Cj4+ICsKPj4g
KwlyZXR1cm4gc2JpX2Z3ZnRfZmVhdHVyZV9sb2NhbF9zZXQoZmVhdHVyZSwgdmFsdWUsIGZsYWdz
LAo+PiArCQkJCQkgIHJldmVydF9vbl9mYWlsKTsKPj4gK30KPj4gKwo+PiAgLyoqCj4+ICAgKiBz
Ymlfc2V0X3RpbWVyKCkgLSBQcm9ncmFtIHRoZSB0aW1lciBmb3IgbmV4dCB0aW1lciBldmVudC4K
Pj4gICAqIEBzdGltZV92YWx1ZTogVGhlIHZhbHVlIGFmdGVyIHdoaWNoIG5leHQgdGltZXIgZXZl
bnQgc2hvdWxkIGZpcmUuCj4+IC0tIAo+PiAyLjQ3LjIKPiAKPiBUaGFua3MsCj4gZHJldwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
