Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69C9C54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 21:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSFRThuzFltj9C+21xWzyhW8ZNTMPPoZ2nO/faNjGWs=; b=bSdn9HNbv7iVtz
	0FNCdMVTBTe1DvRgOLKI60LUpllbatJZLqrzXyZzTcXRVI044L4ZuXF8rryyJIRUrmUBOnhQ01N2q
	T6r9n4Uicilu7AvjbRUQTYrAeXwneTgB+HiShtgl18KTAQRFLsHf517BMB8f6Hp9gFrjEMvkgICD/
	V+mnwN+LIUzmLLzmSONmodVeObbzBg+gT7kjMbbZXLTDYL3vKlkNAMxKjm5m/81LEHkndViHsr+Q6
	RSJI4goKigN4NFVWA7hL5jaXMUgslTRsSv5gum1pcCi+KJ8Bzv+atCf/8fbCSHvLjMChp+Jv+Tfny
	MTh4jRY9kpTK2jH3kv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKY6-0000000ADYE-2sKo;
	Mon, 18 Mar 2024 21:29:38 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKY3-0000000ADVq-0xd7
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 21:29:37 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3684320a751so2157235ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710797373; x=1711402173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Nul1eVuq4XLe3SGFf2DVNn6S2hK2sqq4oKFGkGjGXg=;
        b=J4HmqOBK2A+6Nd2ojvA3QwnYRYTiYlK8n8ozJWMrM90iJs80YtOuFfuWNBaRawOVvx
         7XeEo2riBRMz+/vNRCgdTCn8zn9JF8iXBrwZRP47UvTkMFU/CDuOe2kPSzf9CnszQi8v
         GpMl7y1a2oafnmZIb77OM8UBQm9Yjcnkvt87jodif2uJVW1dcs5M56sr1kTjkntttJNf
         OS5hpH47TAAvrTAjq5QEUN0Xo49ndYEYK5CdT97nXnCcQhyCa9BclBEtxzhnqZ4jvt9g
         w1pqHGjJcq26g2tUCt3WgmTm0g1Qc4R8lZ/nGZm/H8nzBCJ0W8R7IHCJR5HUqqIhRypJ
         QpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710797373; x=1711402173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nul1eVuq4XLe3SGFf2DVNn6S2hK2sqq4oKFGkGjGXg=;
        b=Hu9JVRIhInTMLZ9CvppwLRUxzTYvz2tKv4oqKZ+YvTbY/WvlXy5ceNFiUVcBNAjsxe
         9PqQdpfL1LqOx5UY3j9uOq46XuD5qqGtRrOoCCmNMPSt0Q4wlhPKLp41gK+BQ8qRZUdq
         2zF2nN+Kd4cyulZ4bddU0w2zyHypfLuKGcpCx54cmuYbdnMraB7PwxuH0Ojqgeaj9zVq
         90/KUOfCzP3F+rjWt2zEJzBe5BKAtlqZVY/jDXv2PyCa9cg2dp1j8MVb4eBzawQPsL5D
         mtcX05m/RhFjxGXT41F7+z5CJcL2C7lmLi38hbkiB7DLZM3Q1/shEy4lyqrotXVdhU7r
         4V5w==
X-Forwarded-Encrypted: i=1; AJvYcCWuhyCNXww/iwkKRSWJ0ug4IwRb2bWqOtGyngwz5JY3BxZDcvali3lphKwXT2rFjKn8VjxyQ5yzx79y9ydv5Pw7kEGA2M4B5Yl1mwxnQAL5
X-Gm-Message-State: AOJu0YwxkpYY5nJBBz6mCt81hgfhrhYLRnDSVAZDZoAUCyIM07MPBDsL
	Mr5sHA/wqmmGPEDHYIubzcANhpsboLOb00jN8khxpgGBlH7zoWdOlM6pplJKo/k=
X-Google-Smtp-Source: AGHT+IGplRx/3NjrYT/brJF88QRJLUV/wi8Qy9KFuvMjBRp+xMbCOC5rIkYwtdBM4rJ6IEL040jsVA==
X-Received: by 2002:a05:6e02:1064:b0:366:8c58:42ea with SMTP id q4-20020a056e02106400b003668c5842eamr887284ilj.11.1710797372753;
        Mon, 18 Mar 2024 14:29:32 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id l13-20020a056e0205cd00b00366164573dfsm2512024ils.63.2024.03.18.14.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 14:29:32 -0700 (PDT)
Message-ID: <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
Date: Mon, 18 Mar 2024 16:29:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton
 <akpm@linux-foundation.org>, Charlie Jenkins <charlie@rivosinc.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_142935_486647_0BAF8203 
X-CRM114-Status: GOOD (  23.52  )
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

SGkgQWxleCwKCk9uIDIwMjQtMDMtMTggMzo1MCBQTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+
IE9uIFdlZCwgTWFyIDEzLCAyMDI0IGF0IDc6MDDigK9QTSBTYW11ZWwgSG9sbGFuZAo+IDxzYW11
ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPj4KPj4gVEFTS19TSVpFX01BWCBzaG91bGQg
YmUgc2V0IHRvIHRoZSBsYXJnZXN0IHVzZXJzcGFjZSBhZGRyZXNzIHVuZGVyIGFueQo+PiBydW50
aW1lIGNvbmZpZ3VyYXRpb24uIFRoaXMgb3B0aW1pemVzIHRoZSBjaGVjayBpbiBfX2FjY2Vzc19v
aygpLCB3aGljaAo+PiBubyBsb25nZXIgbmVlZHMgdG8gY29tcHV0ZSB0aGUgY3VycmVudCB2YWx1
ZSBvZiBUQVNLX1NJWkUuIEl0IGlzIHN0aWxsCj4+IHNhZmUgYmVjYXVzZSBhZGRyZXNzZXMgYmV0
d2VlbiBUQVNLX1NJWkUgYW5kIFRBU0tfU0laRV9NQVggYXJlIGludmFsaWQKPj4gYXQgdGhlIGhh
cmR3YXJlIGxldmVsLgo+Pgo+PiBUaGlzIHJlbW92ZXMgYWJvdXQgaGFsZiBvZiB0aGUgcmVmZXJl
bmNlcyB0byBwZ3RhYmxlX2xbNDVdX2VuYWJsZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNhbXVl
bCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+PiAtLS0KPj4KPj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5oIHwgMSArCj4+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaCAgICB8IDEgKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02
NC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmgKPj4gaW5kZXggYjk5YmQ2
NjEwN2E2Li5hNjc3ZWYzYzBmZTIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS02NC5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02
NC5oCj4+IEBAIC0xNyw2ICsxNyw3IEBAIGV4dGVybiBib29sIHBndGFibGVfbDVfZW5hYmxlZDsK
Pj4gICNkZWZpbmUgUEdESVJfU0hJRlRfTDQgIDM5Cj4+ICAjZGVmaW5lIFBHRElSX1NISUZUX0w1
ICA0OAo+PiAgI2RlZmluZSBQR0RJUl9TSVpFX0wzICAgKF9BQygxLCBVTCkgPDwgUEdESVJfU0hJ
RlRfTDMpCj4+ICsjZGVmaW5lIFBHRElSX1NJWkVfTDUgICAoX0FDKDEsIFVMKSA8PCBQR0RJUl9T
SElGVF9MNSkKPj4KPj4gICNkZWZpbmUgUEdESVJfU0hJRlQgICAgIChwZ3RhYmxlX2w1X2VuYWJs
ZWQgPyBQR0RJUl9TSElGVF9MNSA6IFwKPj4gICAgICAgICAgICAgICAgIChwZ3RhYmxlX2w0X2Vu
YWJsZWQgPyBQR0RJUl9TSElGVF9MNCA6IFBHRElSX1NISUZUX0wzKSkKPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKPj4gaW5kZXggNjA2NjgyMmU3Mzk2Li4yMDMyZjhhYzVmYzUgMTAwNjQ0Cj4+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+IEBAIC04NjcsNiArODY3LDcgQEAgc3RhdGljIGlu
bGluZSBwdGVfdCBwdGVfc3dwX2NsZWFyX2V4Y2x1c2l2ZShwdGVfdCBwdGUpCj4+ICAjaWZkZWYg
Q09ORklHXzY0QklUCj4+ICAjZGVmaW5lIFRBU0tfU0laRV82NCAgIChQR0RJUl9TSVpFICogUFRS
U19QRVJfUEdEIC8gMikKPj4gICNkZWZpbmUgVEFTS19TSVpFX01JTiAgKFBHRElSX1NJWkVfTDMg
KiBQVFJTX1BFUl9QR0QgLyAyKQo+PiArI2RlZmluZSBUQVNLX1NJWkVfTUFYICAoUEdESVJfU0la
RV9MNSAqIFBUUlNfUEVSX1BHRCAvIDIpCj4+Cj4+ICAjaWZkZWYgQ09ORklHX0NPTVBBVAo+PiAg
I2RlZmluZSBUQVNLX1NJWkVfMzIgICAoX0FDKDB4ODAwMDAwMDAsIFVMKSkKPj4gLS0KPj4gMi40
My4xCj4+Cj4gCj4gSSB0aGluayB5b3UgYWxzbyBuZWVkIHRvIGNoYW5nZSB0aGUgY2hlY2sgaW4g
aGFuZGxlX3BhZ2VfZmF1bHQoKSBieQo+IHVzaW5nIFRBU0tfU0laRV9NQVggaW5zdGVhZCBvZiBU
QVNLX1NJWkUsIG90aGVyd2lzZSB0aGUgZml4dXAgY2FuJ3QKPiBoYXBwZW4gKGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC9yaXNjdi9tbS9mYXVsdC5j
I0wyNzMpLgoKSXQgaXMgbm90IG5lY2Vzc2FyeSB0byBjaGFuZ2UgdGhhdCBjaGVjayBpbiBmYXVs
dC5jIHVubGVzcyB3ZSBleHBlY3QgdG8gaGFuZGxlCmV4Y2VwdGlvbnMgKG91dHNpZGUgb2YgdXNl
cnNwYWNlIGFjY2VzcyByb3V0aW5lcykgZm9yIGFkZHJlc3NlcyBiZXR3ZWVuClRBU0tfU0laRSBh
bmQgVEFTS19TSVpFX01BWC4gSXQgbG9va3MgbGlrZSB0aGUgY2FsbCB0byBmaXh1cF9leGNlcHRp
b24oKSBbYWRkZWQKaW4gNDE2NzIxZmYwNWZkICgicmlzY3YsIG1tOiBQZXJmb3JtIEJQRiBleGhh
bmRsZXIgZml4dXAgb24gcGFnZSBmYXVsdCIpXSBpcwpvbmx5IGludGVuZGVkIHRvIGNhdGNoIG51
bGwgcG9pbnRlciBkZXJlZmVyZW5jZXMuIFNvIG1ha2luZyB0aGUgY2hhbmdlIHdvdWxkbid0Cmhh
dmUgYW55IGZ1bmN0aW9uYWwgaW1wYWN0LCBidXQgaXQgd291bGQgc3RpbGwgYmUgYSB2YWxpZCBv
cHRpbWl6YXRpb24uCgo+IE9yIEkgd2FzIHdvbmRlcmluZyBpZiBpdCB3b3VsZCBub3QgYmUgYmV0
dGVyIHRvIGRvIGxpa2UgeDg2IGFuZCB1c2UgYW4KPiBhbHRlcm5hdGl2ZSwgaXQgd291bGQgYmUg
bW9yZSBjb3JyZWN0IChldmVuIHRob3VnaCBJIGJlbGlldmUgeW91cgo+IHNvbHV0aW9uIHdvcmtz
KQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC94
ODYvaW5jbHVkZS9hc20vcGFnZV82NC5oI0w4Mi4KCldoYXQgd291bGQgYmUgdGhlIGJlbmVmaXQg
b2YgdXNpbmcgYW4gYWx0ZXJuYXRpdmU/IEFueSBhY2Nlc3MgdG8gYW4gYWRkcmVzcwpiZXR3ZWVu
IFRBU0tfU0laRSBhbmQgVEFTS19TSVpFX01BWCBpcyBndWFyYW50ZWVkIHRvIGdlbmVyYXRlIGEg
cGFnZSBmYXVsdCwgc28KdGhlIG9ubHkgYmVuZWZpdCBJIHNlZSBpcyByZXR1cm5pbmcgLUVGQVVM
VCBzbGlnaHRseSBmYXN0ZXIgYXQgdGhlIGNvc3Qgb2YKYXBwbHlpbmcgYSBmZXcgaHVuZHJlZCBh
bHRlcm5hdGl2ZXMgYXQgYm9vdC4gQnV0IGl0J3MgcG9zc2libGUgSSdtIG1pc3NpbmcKc29tZXRo
aW5nLgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
