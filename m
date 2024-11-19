Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F6FD591A5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVEzZdWb4GUp5h89BCNOHJCKS9/Me02bGb7M9UimbU0=; b=s3EAWEXBjHgR4t
	vJsFfUmw+/KxxxR3m7Zck80AIaukBUWH8wpplmvEyFo3cN/aXlL4tEDY0EQflbfe8tLTErMnMUGdq
	4KuwjTUfen4kpTNGE0c/chZniYXVt6bHqzyGEJfMtOXqnVIqGokdodpgNZ6vZAHju6+ghmZu0I0G/
	EeAknCFFfBPb9frWPrx5Y9lKwNiNAUs0XtUKAuYDnw+1Bdtnb6NiNvFopZTYWvV+O2L76f8IDg1o6
	B4gchD1LU9g3ODKpVsLU6fScrHzTT4oSeX4q2yFayJGi0yOkhbvZPgMuab9ahBMV9Na/TRWkOxOfm
	KuARzw6hiopM2vIZ9s9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRgy-0000000DA44-1AIi;
	Tue, 19 Nov 2024 17:07:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRXq-0000000D7vB-2Ca5
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 16:57:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21210eaa803so28008865ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 08:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732035461; x=1732640261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zIM5C3U9SgKHG2ejtKJVceWgRiY5n+HYVGt81nCAm3w=;
        b=19XLquf/6sWPMtE6SXB7RXhXytQhPYwd4gyWBsuG41N4QuPx7/0jxFD5kKjm9Jcmd0
         S2Gzl+SK5b/SrkrBhZqqhlkL91n57Wmo7sUuuUQDfkUJnRSCg3FqYdCsZrr6ga0a8Qia
         v6vnr71TSjvLRPatqj0UPu0gZQwhKWwqRx6X7FXxxuL7WPCATku9wBuio06/uNc5mjL9
         vOUaLdVtt80OIhDAQxSBoD2HXWfU7wa6GioEAAhwzsR+dVMOiilWw+hn/hNrzGN7X3ao
         khnm84a/qYAg/J7uyGxi1MFqGzmgZsF7TABOZVDh1c/wYFSuLP0UYkAubg7JEupWKP7g
         NGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732035461; x=1732640261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIM5C3U9SgKHG2ejtKJVceWgRiY5n+HYVGt81nCAm3w=;
        b=u6JocenAPSwTinJuGMtF3LZ0YHvhJtuuHpcQhpGzZmwhgjv9RNynJuacdoElYsTe6Q
         gveXS38zvbPntgEB0OOK4bDherKd8X91JAs7E5E02yqpH+2kzlzH4RA7yDTRhFLXa7UA
         ITETrwLa4/tCfLce94kP+2TWFQu5lp7JPZuMhGmR/TZh4bQoQkGyc6RvoQysDvE8IDUu
         HIcEBDuGUWVKwgrjq/zxp33ZQiKXiNXgMnbTmkLUZDaOhD8To9UTPURh3d5MuDCttQZu
         KsbNZtFX5uzKOrdikRh4Tb86P5yaAcOn8ZjdB/EVao+mGVX51jXaKmPEIrUkOyCyy/iT
         jwHw==
X-Forwarded-Encrypted: i=1; AJvYcCVAw+IZGhu70mBH9p2my0+oCBoyTfHiCrFpO2BpNp1jIlWFUup+Y8D7mlMhCO7zGZ8uGF48Giu9ef/ETw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpCpw1DelowBy+UgN3x9lsJQRDsrFg2G18bBp82Wx001sH9ec2
	rBqhOgHCXGFR+pSeexDqFqWUawMDaLGFt9Fi6A+roQgLEAhz+IkJcgdXQ4VaAWk=
X-Google-Smtp-Source: AGHT+IG4kkUTi/c5CZ92Iiptcoo64JT2r4oVJmh+qSFIGjvkOyirSO0mJ0D9m90WudNodnVcPjFy/w==
X-Received: by 2002:a17:903:946:b0:212:4cfa:ba78 with SMTP id d9443c01a7336-2124cfabbfbmr49230275ad.52.1732035460759;
        Tue, 19 Nov 2024 08:57:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f346cbsm77340865ad.118.2024.11.19.08.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 08:57:40 -0800 (PST)
Message-ID: <ffcdbcbe-a5f6-48f4-a0a3-0d35c6c80050@rivosinc.com>
Date: Tue, 19 Nov 2024 17:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: fix memory leakage in
 process_accumulated_relocations
To: zhangkai@iscas.ac.cn, Walmsley <paul.walmsley@sifive.com>,
 Dabbelt <palmer@dabbelt.com>, Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <35cab46a.6d145.19334919ed0.Coremail.zhangkai@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <35cab46a.6d145.19334919ed0.Coremail.zhangkai@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_085742_765260_7671D101 
X-CRM114-Status: GOOD (  14.83  )
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

CgpPbiAxNi8xMS8yMDI0IDExOjQyLCB6aGFuZ2thaUBpc2Nhcy5hYy5jbiB3cm90ZToKPiBXaGVu
IG1vZHVsZSByZWxvY2F0aW9uIGlzIGRvbmUsIHByb2Nlc3NfYWNjdW11bGF0ZWRfcmVsb2NhdGlv
bnMoKQo+IGZyZWVzIGFsbCBkeW5hbWljIGFsbG9jYXRlZCBtZW1vcnkuIHJlbF9oZWFkX2l0ZXIt
Jmd0O3JlbF9lbnRyeSBpcwo+IG1pc3NlZCB0byBmcmVlIHRoYXQga21lbWxlYWsgbWlnaHQgcmVw
b3J0Ogo+IAo+IHVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmZmZkODgwYzVmYzQwIChzaXplIDE2
KToKPiAgIGNvbW0gImluc21vZCIsIHBpZCAxMTAxLCBqaWZmaWVzIDQyOTUwNDUxMzgKPiAgIGhl
eCBkdW1wIChmaXJzdCAxNiBieXRlcyk6Cj4gICAgIGUwIGMwIGY1IDg3IGQ4IGZmIGZmIGZmIDYw
IGM1IGY1IDg3IGQ4IGZmIGZmIGZmICAuLi4uLi4uLmAuLi4uLi4uCj4gICBiYWNrdHJhY2UgKGNy
YyBkMmVjYjIwYyk6Cj4gICAgIFsmbHQ7MDAwMDAwMDBiMDE2NTVmNiZndDtdIGttYWxsb2NfdHJh
Y2Vfbm9wcm9mKzB4MjY4LzB4MmY2Cj4gICAgIFsmbHQ7MDAwMDAwMDA2ZGMwMDY3YSZndDtdIGFk
ZF9yZWxvY2F0aW9uX3RvX2FjY3VtdWxhdGUuY29uc3Rwcm9wLjArMHhmMi8weDFhYQo+ICAgICBb
Jmx0OzAwMDAwMDAwZTFiMjlhMzYmZ3Q7XSBhcHBseV9yZWxvY2F0ZV9hZGQrMHgxM2MvMHgzNmUK
PiAgICAgWyZsdDswMDAwMDAwMDc1NDNmMWZiJmd0O10gbG9hZF9tb2R1bGUrMHg1YzYvMHg4M2UK
PiAgICAgWyZsdDswMDAwMDAwMGFiY2UxMmU4Jmd0O10gaW5pdF9tb2R1bGVfZnJvbV9maWxlKzB4
NzQvMHhhYQo+ICAgICBbJmx0OzAwMDAwMDAwNDk0MTNlM2QmZ3Q7XSBpZGVtcG90ZW50X2luaXRf
bW9kdWxlKzB4MTE2LzB4MjJlCj4gICAgIFsmbHQ7MDAwMDAwMDBmOWI5OGI4NSZndDtdIF9fcmlz
Y3Zfc3lzX2Zpbml0X21vZHVsZSsweDYyLzB4YWUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBLYWkgWmhh
bmcgPHpoYW5na2FpQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9tb2R1
bGUuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1
bGUuYwo+IGluZGV4IDFjZDQ2MWYzZDg3Li5mOGMzYzRiNDdkYyAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5j
Cj4gQEAgLTY0Myw2ICs2NDMsNyBAQCBwcm9jZXNzX2FjY3VtdWxhdGVkX3JlbG9jYXRpb25zKHN0
cnVjdCBtb2R1bGUgKm1lLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZWxvY19oYW5kbGVyc1tjdXJyX3R5cGVdLmFjY3VtdWxhdGVfaGFuZGxl
cigKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1lLCBsb2NhdGlvbiwgYnVmZmVy
KTsKPiArICAgICAgICAgICAgICAgICAgICAgICBrZnJlZShyZWxfaGVhZF9pdGVyLSZndDtyZWxf
ZW50cnkpOwoKSGV5IEthaSwKCllvdXIgcGF0Y2ggb3V0cHV0IGlzIG1lc3NlZCB1cCBwcm9iYWJs
eSBkdWUgdG8gc29tZSBlbmNvZGluZyBpc3N1ZS4KCkJ1dCBsb29rbmlnIGF0IGl0IGFuZCB0aGUg
bW9kdWxlIGNvZGUsIGl0IHNlZW1zIGxpa2UgcmVsX2VudHJ5IGRvZXMgbm90Cm5lZWQgdG8gYmUg
YSBwb2ludGVyLiBJdCBjYW4gYmUgYSBwbGFpbiAic3RydWN0IGxpc3RfaGVhZCByZWxfZW50cnki
IGFuZAp0aGVuIHNpbXBseSBwYXNzIHRoZSBsaXN0X2hlYWQgcG9pbnRlciByYXRoZXIgdGhhbiBh
bGxvY2F0aW5nL2ZyZWVpbmcKaXQuIFRoYXQgcmVtb3ZlIGFuIGFsbG9jYXRpb24gYXMgd2VsbCBh
cyBzb21lIG1lbW9yeSBsZWFrLgoKQlRXLCBmb3IgZml4ZXMsIHlvdSBzaG91bGQgYWRkIGEgRml4
ZXM6IHRhZyB3aXRoIHRoZSBvcmlnaW5hbCBjb21taXQKc2hhMSB0aGF0IGludHJvZHVjZWQgdGhl
IGJ1Zy4KClRoYW5rcywKCkNsw6ltZW50Cgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGtmcmVl
KHJlbF9oZWFkX2l0ZXIpOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIGtm
cmVlKGJ1Y2tldF9pdGVyKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
