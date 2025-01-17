Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05945C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4C7fuqY1YAB5dVgTXsVfFD1GuDxQQzkZbzhwy9+YfI=; b=VdVYsptEem75/L
	oYJwDDk5dSa2Xnc5jtVWS6U764jgYI15jq/yTsa89fubMWoYTfxHGFgGDcX/AJtd9iLNi/VksMFFy
	U4xmD6ptdR2BUJ0bFZlCqyZpTp37pXQoNHv+YjYjxTxbnrl7XpzmcaziDO7XUN4x49xH6ZmY2yZhB
	/zP8aagUvH9gmkO8xVOE3mKDtOJ19zyInaZ1Kt0V+b7Zq+yzrWWGVHrK32/aTGPAKNE8VhORkKZLQ
	UTlLfa5GOY/MC21oUM5AIbApGNpt3PS8CEzsnBCNfgnfdIvdWE3YwP9aVZ3O8hxMz/dOijoqaRis0
	pOYASNy/FHMiYQ/FNXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnyY-00000000Z0p-1Dbb;
	Fri, 17 Jan 2025 15:09:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnyV-00000000Yzk-2mpm
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 15:09:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436a39e4891so14898835e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 07:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737126569; x=1737731369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeBHQLs9jVU95ezPlxDDqu8VwoV3ld6Y4fMnADed+lM=;
        b=kuPYzz80ptYo8cYMwP1+8V4AqXoMjBKBWuFePGlHm8UwEzq6jkPqWH6gvFhSjRLezo
         Oug0HihaXQ5hNZwySunkoTikjH813O2vmlALy1RQrwPJYuKcq2CqHm8RpH4e4e8mGfMr
         aly5xuxJe/4IvL8zrgRpvVPyWn79kMb71zlc+ZxA6ZOuXvU+Tv5cjz5f6ojlorJivuun
         WJzioL+rFLhpIYlQfzKilRgdk5a3JztIlycebOHNGh+Fo9djfXdnP3YDBPU2YxOCHjp9
         diE1YAEtcEQu3kbXK99MNLxSt8afMehs4UdVefXOgxRQkvd4RwXPgfHr+jr7bFMqp7YL
         xOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737126569; x=1737731369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eeBHQLs9jVU95ezPlxDDqu8VwoV3ld6Y4fMnADed+lM=;
        b=owxxNrmvquKM/TDd7miJtqQzv7zXkRukT7QX/QVCVnEOhzmz59Q3/DflrRzn8gLh6M
         n5tHBxZJhcYlvqktKEgaHHfyPeJ35peZdPtJObOAI0fGgh5F1OBGKVki5NUvyoazWhSs
         Zu4/TfMpCVDNzIAjU6cKPbUW9Ow1PB1/ZfPbLk0/TwlQmCV43hJ8Huf+OHmv07/TlgHK
         OM0YCcrOVwaU1JyXbkg6jP5iEfSO5OhwYMAtYf73Hp+Bbu1eXVzqk0mjCmG7J3HEQw8C
         2oGxzeRy1Rc6YKYH0ESMJnuz4bv4cmQ9/taOFVbGtJWH7PXQy2CE1rRTRBmQGjT5N/Oq
         Z7xA==
X-Forwarded-Encrypted: i=1; AJvYcCW//70fSFs+wQYiMDWy+8j4B9SWp8f4AE/0krpas+3geIqQwOZmlBLjTVweWQ6+CfDT82VKIfKDuRKfTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5p0I53yxLXlV6OSOTBwa7kcdytPK3GgrLV5PGh3JtSTMgrYIY
	0uTBi54uizbRAG2dfiUvLCb4zNtQ8rkkhQnJX7q9jMQnkhPGdJsXIqTuOiQiny8=
X-Gm-Gg: ASbGncsGQbQmlvxFEdC0Ronyc2OlownfY+59QrJeJ17mwrwfty16Ia6lEeBUxzbOx3s
	hguCV9xBbc0xzfvtE8v8GaqpQgaDqoi/QlLVJhRGHUx1DajdCzBqhpg1zEiUHI/aAWqi9xw6K1N
	G0MzWGviQ664RcBtJnJjAnl2b71ABNPvat9c8lrD0pHMySRYoxtzkoIrBSIP6aw4OLLZElAoSGZ
	Q8gbjri8IUuSeGEaU2Tspkvo7jvptpK4KmvGhFvmyAUJlN5CwTP32DBbH3DDAPUm29uuHi+wHq0
	n79h+hGEcelaQJsO5xs/TmooBA==
X-Google-Smtp-Source: AGHT+IG1uZGUInjJmwhJbH8Ho3BFf5w1Dx39oNxBLgMYa7175SzgdXR9MqOpaXnkZP4l9hYELj4CQA==
X-Received: by 2002:a05:600c:5101:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-438913c85e0mr30286255e9.6.1737126568985;
        Fri, 17 Jan 2025 07:09:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499bbasm101555505e9.3.2025.01.17.07.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 07:09:28 -0800 (PST)
Message-ID: <24f9b863-9b88-4a58-a7a0-b562f6be56ad@rivosinc.com>
Date: Fri, 17 Jan 2025 16:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] riscv: request misaligned exception delegation from
 SBI
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-3-cleger@rivosinc.com>
 <fca2a328-f2c4-4df3-9086-06b8a12b8da4@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <fca2a328-f2c4-4df3-9086-06b8a12b8da4@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_070931_967030_02F0094B 
X-CRM114-Status: GOOD (  18.69  )
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

CgpPbiAxMS8wMS8yMDI1IDAwOjM1LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPiBIaSBDbMOpbWVu
dCwKPiAKPiBPbiAyMDI1LTAxLTA2IDk6NDggQU0sIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4g
Tm93IHRoYXQgdGhlIGtlcm5lbCBjYW4gaGFuZGxlIG1pc2FsaWduZWQgYWNjZXNzZXMgaW4gUy1t
b2RlLCByZXF1ZXN0Cj4+IG1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbiBkZWxlZ2F0aW9uIGZy
b20gU0JJLiBUaGlzIHVzZXMgdGhlIEZXRlQgU0JJCj4+IGV4dGVuc2lvbiBkZWZpbmVkIGluIFNC
SSB2ZXJzaW9uIDMuMC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVh
dHVyZS5oICAgICAgICB8ICAxICsKPj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWdu
ZWQuYyAgICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysKPj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyB8ICAyICsKPj4gIDMgZmlsZXMgY2hhbmdlZCwg
NjIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jcHVmZWF0dXJlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+PiBp
bmRleCA0YmQwNTRjNTRjMjEuLmNkNDA2ZmUzN2RmOCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jcHVmZWF0dXJlLmgKPj4gQEAgLTYyLDYgKzYyLDcgQEAgdm9pZCBfX2luaXQgcmlzY3ZfdXNl
cl9pc2FfZW5hYmxlKHZvaWQpOwo+PiAgCV9SSVNDVl9JU0FfRVhUX0RBVEEoX25hbWUsIF9pZCwg
X3N1Yl9leHRzLCBBUlJBWV9TSVpFKF9zdWJfZXh0cyksIF92YWxpZGF0ZSkKPj4gIAo+PiAgYm9v
bCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpOwo+PiArdm9p
ZCB1bmFsaWduZWRfYWNjZXNzX2luaXQodm9pZCk7Cj4+ICAjaWYgZGVmaW5lZChDT05GSUdfUklT
Q1ZfU0NBTEFSX01JU0FMSUdORUQpCj4+ICB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11
bGF0ZWQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCk7Cj4+ICB2b2lk
IHVuYWxpZ25lZF9lbXVsYXRpb25fZmluaXNoKHZvaWQpOwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jCj4+IGluZGV4IDdjYzEwOGFlZDc0ZS4uNGFjYTYwMDUyN2U5IDEwMDY0NAo+
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4+IEBAIC0xNiw2ICsxNiw3IEBACj4+
ICAjaW5jbHVkZSA8YXNtL2VudHJ5LWNvbW1vbi5oPgo+PiAgI2luY2x1ZGUgPGFzbS9od3Byb2Jl
Lmg+Cj4+ICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KPj4gKyNpbmNsdWRlIDxhc20vc2Jp
Lmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+PiAgCj4+ICAjZGVmaW5lIElOU05fTUFU
Q0hfTEIJCQkweDMKPj4gQEAgLTY4OSwzICs2OTAsNjEgQEAgYm9vbCBjaGVja191bmFsaWduZWRf
YWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCj4+ICAJcmV0dXJuIGZhbHNlOwo+PiAgfQo+
PiAgI2VuZGlmCj4+ICsKPj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfU0JJCj4+ICsKPj4gK3N0cnVj
dCBtaXNhbGlnbmVkX2RlbGVnX3JlcSB7Cj4+ICsJYm9vbCBlbmFibGU7Cj4+ICsJaW50IGVycm9y
Owo+PiArfTsKPj4gKwo+PiArc3RhdGljIHZvaWQKPj4gK2NwdV91bmFsaWduZWRfc2JpX3JlcXVl
c3RfZGVsZWdhdGlvbih2b2lkICphcmcpCj4+ICt7Cj4+ICsJc3RydWN0IG1pc2FsaWduZWRfZGVs
ZWdfcmVxICpyZXEgPSBhcmc7Cj4+ICsJc3RydWN0IHNiaXJldCByZXQ7Cj4+ICsKPj4gKwlyZXQg
PSBzYmlfZWNhbGwoU0JJX0VYVF9GV0ZULCBTQklfRVhUX0ZXRlRfU0VULAo+PiArCQkJU0JJX0ZX
RlRfTUlTQUxJR05FRF9FWENfREVMRUcsIHJlcS0+ZW5hYmxlLCAwLCAwLCAwLCAwKTsKPj4gKwlp
ZiAocmV0LmVycm9yKQo+PiArCQlyZXEtPmVycm9yID0gMTsKPj4gK30KPj4gKwo+PiArc3RhdGlj
IHZvaWQgdW5hbGlnbmVkX3NiaV9yZXF1ZXN0X2RlbGVnYXRpb24odm9pZCkKPj4gK3sKPj4gKwlz
dHJ1Y3QgbWlzYWxpZ25lZF9kZWxlZ19yZXEgcmVxID0ge3RydWUsIDB9Owo+PiArCj4+ICsJb25f
ZWFjaF9jcHUoY3B1X3VuYWxpZ25lZF9zYmlfcmVxdWVzdF9kZWxlZ2F0aW9uLCAmcmVxLCAxKTsK
Pj4gKwlpZiAoIXJlcS5lcnJvcikgewo+PiArCQlwcl9pbmZvKCJTQkkgbWlzYWxpZ25lZCBhY2Nl
c3MgZXhjZXB0aW9uIGRlbGVnYXRpb24gb2tcbiIpOwo+PiArCQkvKgo+PiArCQkgKiBOb3RlIHRo
YXQgd2UgZG9uJ3QgaGF2ZSB0byB0YWtlIGFueSBzcGVjaWZpYyBhY3Rpb24gaGVyZSwgaWYKPj4g
KwkJICogdGhlIGRlbGVnYXRpb24gaXMgc3VjY2Vzc2Z1bCwgdGhlbgo+PiArCQkgKiBjaGVja191
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKCkgd2lsbCB2ZXJpZnkgdGhhdCBpbmRlZWQgdGhlCj4+
ICsJCSAqIHBsYXRmb3JtIHRyYXBzIG9uIG1pc2FsaWduZWQgYWNjZXNzZXMuCj4+ICsJCSAqLwo+
PiArCQlyZXR1cm47Cj4+ICsJfQo+PiArCj4+ICsJLyoKPj4gKwkgKiBJZiBhdCBsZWFzdCBkZWxl
Z2F0aW9uIHJlcXVlc3QgZmFpbGVkIG9uIG9uZSBoYXJ0LCByZXZlcnQgbWlzYWxpZ25lZAo+PiAr
CSAqIGRlbGVnYXRpb24gZm9yIGFsbCBoYXJ0cywgaWYgd2UgZG9uJ3QgZG8gdGhhdCwgd2UnbGwg
cGFuaWMgYXQKPj4gKwkgKiBtaXNhbGlnbmVkIGRlbGVnYXRpb24gY2hlY2sgdGltZSAoc2VlCj4+
ICsJICogY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCgpKS4KPj4gKwkgKi8KPj4gKwly
ZXEuZW5hYmxlID0gZmFsc2U7Cj4+ICsJcmVxLmVycm9yID0gMDsKPj4gKwlvbl9lYWNoX2NwdShj
cHVfdW5hbGlnbmVkX3NiaV9yZXF1ZXN0X2RlbGVnYXRpb24sICZyZXEsIDEpOwo+PiArCWlmIChy
ZXEuZXJyb3IpCj4+ICsJCXBhbmljKCJGYWlsZWQgdG8gZGlzYWJsZSBtaXNhbGlnbmVkIGRlbGVn
YXRpb24gZm9yIGFsbCBDUFVzXG4iKTsKPiAKPiBUaGlzIGxvZ2ljIGRvZXNuJ3QgaGFuZGxlIHRo
ZSBjYXNlIHdoZXJlIHRoZSBkZWxlZ2F0aW9uIHJlcXVlc3QgZmFpbGVkIG9uIGV2ZXJ5Cj4gQ1BV
LCBzbyB0aGVyZSdzIG5vdGhpbmcgdG8gcmV2ZXJ0LiBUaGlzIGNhdXNlcyBhIHBhbmljIGluIGEg
S1ZNIGd1ZXN0IGluc2lkZQo+IHFlbXUtc29mdG1tdSAodGhlIGhvc3Qga2VybmVsIGRldGVjdHMg
TUlTQUxJR05FRF9TQ0FMQVJfRkFTVCwgc28KPiB1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSgpIHJl
dHVybnMgZmFsc2UsIGFuZCBhbGwgRldGVCBjYWxscyBmYWlsKS4KCkhpIFNhbXVlbCwKCkluZGVl
ZCwgdGhhdCdzIGEgcHJvYmxlbSBhbmQgdGhlIHJldmVydCBpcyBub3QgcmVhbGx5IGNsZWFuIHNp
bmNlIGl0IGlzCmNhbGxlZCBvbiBhbGwgQ1BVcyAoZXZlbiB0aGEgcm9uZSB0aGF0IGZhaWxlZCku
IEknbGwgbW9kaWZ5IHRoYXQgdG8gdXNlCmNwdW1hc2tzIGFuZCB0aHVzIGNsZWFubHkgcmV2ZXJ0
IHRoZSBtaXNhbGlnbmVkIGRlbGVnYXRpb24gb24gQ1BVcyB0aGF0CmFjdHVhbGx5IHN1Y2NlZWRl
ZCBvbmx5LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gUmVnYXJkcywKPiBTYW11ZWwKPiAKPj4g
Kwo+PiArfQo+PiArCj4+ICt2b2lkIHVuYWxpZ25lZF9hY2Nlc3NfaW5pdCh2b2lkKQo+PiArewo+
PiArCWlmIChzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfRldGVCkgPiAwKQo+PiArCQl1bmFs
aWduZWRfc2JpX3JlcXVlc3RfZGVsZWdhdGlvbigpOwo+PiArfQo+PiArI2Vsc2UKPj4gK3ZvaWQg
dW5hbGlnbmVkX2FjY2Vzc19pbml0KHZvaWQpIHt9Cj4+ICsjZW5kaWYKPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwo+PiBpbmRleCA5MWYxODljZjE2MTEuLjFl
MzE2NjEwMDgzNyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2Fj
Y2Vzc19zcGVlZC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nf
c3BlZWQuYwo+PiBAQCAtNDAzLDYgKzQwMyw4IEBAIHN0YXRpYyBpbnQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19hbGxfY3B1cyh2b2lkKQo+PiAgewo+PiAgCWJvb2wgYWxsX2NwdXNfZW11bGF0ZWQs
IGFsbF9jcHVzX3ZlY191bnN1cHBvcnRlZDsKPj4gIAo+PiArCXVuYWxpZ25lZF9hY2Nlc3NfaW5p
dCgpOwo+PiArCj4+ICAJYWxsX2NwdXNfZW11bGF0ZWQgPSBjaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkX2FsbF9jcHVzKCk7Cj4+ICAJYWxsX2NwdXNfdmVjX3Vuc3VwcG9ydGVkID0gY2hl
Y2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKTsKPj4gIAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
