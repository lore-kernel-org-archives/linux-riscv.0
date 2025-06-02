Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A44C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Atg8oGucxBESCK2KW4H4obyvv6vUUZj8QTewp8s9Pck=; b=luqvZX6fjld3PY
	qsQgmyttDK8AaakeQLsr33a5Q+xSGQD0Xq6qnkL+5gs/kZ4Ri5raaiKt5/euVNHLlzb2/BJYxsvuS
	E82Xee8fkRdmaJai/Av7cA1p/avWhC4ov7tH5iMTj2vfTriSWGpj/8Rf8b87FVuq/PIvc4OfbwgcT
	3EMRyTmP3jwbZYCoi6R5CtR0r8ANUkzENgzDECijZ6B3J2A4pJY6Yl/O5Va3IV4BA2j3U2g8Hvsw1
	fo0it7CB0tZUBm5AhbgOL5oF1TEsogKUDHNGzssgcuEXNO2rkSgUh7uLOFhM83OQ1L3MwEUWxSF4w
	+O8o1QgplFNwGs6Fl5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzgd-00000006utM-3paR;
	Mon, 02 Jun 2025 07:34:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzgb-00000006usm-2GLA
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 07:34:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so106686f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 00:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748849660; x=1749454460; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lomQSXMXVkyAhZfDo/QfGczWq75wkCBIKASDR7utUXs=;
        b=EPpXm22u7r+Lyko/w6cI+GY3/55DmStPkDFZVkueTfBBOy6L8SRtH6FyU5eQjsYamc
         BFg+YGkm76p7DdHYIRHysnzf3dLGzmnLtezK+hjXBKIvhcBwbSMI1DDW8jC4NwPFTXa6
         h3Z7ofbaEirzVVN9GmbIxcmx+jRQD5FXiPw0rVzWpnZkzef7uycy5HQH5CioAQRqazpK
         PLoWmKyM601gc/iT2I1zGiYKFVoO6sXWN4clfstWEOeWji9VUVnI2gRfa+gDvVmbgbua
         HU+c2g1U1dDXAgcXy8DN7BukAL9gS3GLAEXZ0srLH9VIuvk8smI2kuINQK2cuK+u/rCf
         h9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849660; x=1749454460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lomQSXMXVkyAhZfDo/QfGczWq75wkCBIKASDR7utUXs=;
        b=ODZdlqh7Wm0l5UDlY41/pl+llkaRuuE4U1S6tqQHIazGup4qsIGH70s6ZPz8XNra0x
         4xtUb5vr0m6ekTOLT/GEmjFRK6YIGBgwZFo9dRvK1aT3n9uCQL7KFCxgghw9DVvPstPg
         D88KR6ECTl0zd6/Hs0phytX1/nBCFz2NhXnQN0M+vxkSzoqiVsKvao0xbHgoxApqPnS9
         VinT9ld5K6djx/h2EhgTPwedm3JPZY6Fp8xn3Sd+ICn2WdU9jh72vCk2qpY2K4Z40uJl
         wdnJNVjVOeCn7chFM1X1Tp4FuZITs8FGBdalX9nMuqWs0u5X3VObWG/R3jF1vcLAZ3Ls
         UP8w==
X-Gm-Message-State: AOJu0YzNDoRKl2gNX+AA/IMJFXNivPwfMLVuBMxycc1UYl678yhan9LU
	losFgp3hgczXgVnyX7ZmkYK+Eepj88cuAqSbqHS0DgMhd8qMppLjme0unPZpLESqq7c=
X-Gm-Gg: ASbGncuQguqiCnUiJWxdzWTQYraHNPVyupjGIlTntS476Q+QGsgDCp/aP8ronbi++O3
	3EQ+mizUcApxRtXKER/6BuWsbL1xoG6ifbclVgeg8o2Tqx2YZXJ3ubWCUaTFFiFk/HRi9+C2+hA
	VCrPuKYdqpdCJlM0jWcci4eJZ24714kUJDcXtoSEGo2QCB7EWsv7DL4cCIwoD9e6wWLmFTv6UXf
	olLmLRLivMYkvw4ynS3PQcXZpGiOGrSOVA0T/ZSPLaeibmsysg7z1/w1zKIHIyL4ry0xveBiL3x
	ZcZRTW1AokgJ1cqpmrVXiI8iY5L+X7JvYKPELEQQKCPQ3WqpcE0XGcINlyypCmQb4ei4cZ6ZmAP
	xNq1ENrlpdk3HU8JWzawik7Cr+u9NqBM=
X-Google-Smtp-Source: AGHT+IFMNEOccS5H1c+9eg0kvVfM2JTlZ9ejc6LVtNoJXe6O6Fn56JDnZ4pP7VZIoUaQFgbEspXVTA==
X-Received: by 2002:a05:6000:25c1:b0:3a4:d898:3e2d with SMTP id ffacd0b85a97d-3a4f7a654a9mr9829041f8f.24.1748849659826;
        Mon, 02 Jun 2025 00:34:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8besm14017930f8f.16.2025.06.02.00.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 00:34:18 -0700 (PDT)
Message-ID: <836dffaf-c1c4-4e1a-957a-355deaa2d963@rivosinc.com>
Date: Mon, 2 Jun 2025 09:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <20250530205658.624195-3-cleger@rivosinc.com>
 <20250531192801.5d6329c3@pumpkin>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250531192801.5d6329c3@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_003421_583196_559652F4 
X-CRM114-Status: GOOD (  24.23  )
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

CgpPbiAzMS8wNS8yMDI1IDIwOjI4LCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4gT24gRnJpLCAzMCBN
YXkgMjAyNSAyMjo1Njo1OCArMDIwMAo+IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4gCj4+IERvaW5nIG1pc2FsaWduZWQgYWNjZXNzIHRvIHVzZXJzcGFjZSBt
ZW1vcnkgd291bGQgbWFrZSBhIHRyYXAgb24KPj4gcGxhdGZvcm0gd2hlcmUgaXQgaXMgZW11bGF0
ZWQuIExhdGVzdCBmaXhlcyByZW1vdmVkIHRoZSBrZXJuZWwKPj4gY2FwYWJpbGl0eSB0byBkbyB1
bmFsaWduZWQgYWNjZXNzZXMgdG8gdXNlcnNwYWNlIG1lbW9yeSBzYWZlbHkgc2luY2UKPj4gaW50
ZXJydXB0cyBhcmUga2VwdCBkaXNhYmxlZCBhdCBhbGwgdGltZSBkdXJpbmcgdGhhdC4gVGh1cyBk
b2luZyBzbwo+PiB3b3VsZCBjcmFzaCB0aGUga2VybmVsLgo+Pgo+PiBTdWNoIGJlaGF2aW9yIHdh
cyBkZXRlY3RlZCB3aXRoIEdFVF9VTkFMSUdOX0NUTCgpIHRoYXQgd2FzIGRvaW5nCj4+IGEgcHV0
X3VzZXIoKSB3aXRoIGFuIHVuc2lnbmVkIGxvbmcqIGFkZHJlc3MgdGhhdCBzaG91bGQgaGF2ZSBi
ZWVuIGFuCj4+IHVuc2lnbmVkIGludCouIFJlZW5hYmxpbmcga2VybmVsIG1pc2FsaWduZWQgYWNj
ZXNzIGVtdWxhdGlvbiBpcyBhIGJpdAo+PiByaXNreSBhbmQgaXQgd291bGQgYWxzbyBkZWdyYWRl
IHBlcmZvcm1hbmNlcy4gUmF0aGVyIHRoYW4gZG9pbmcgdGhhdCwKPj4gd2Ugd2lsbCB0cnkgdG8g
YXZvaWQgYW55IG1pc2FsaWduZWQgYWNjZXNzZWQgYnkgdXNpbmcgY29weV9mcm9tL3RvX3VzZXIo
KQo+PiB3aGljaCBkb2VzIG5vdCBkbyBhbnkgbWlzYWxpZ25lZCBhY2Nlc3Nlcy4gVGhpcyBjYW4g
YmUgZG9uZSBvbmx5IGZvcgo+PiAhQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NF
U1MgYW5kIHRodXMgYWxsb3dzIHRvIG9ubHkgZ2VuZXJhdGUKPj4gYSBiaXQgbW9yZSBjb2RlIGZv
ciB0aGlzIGNvbmZpZy4KPiAKPiBGb3IgZ2V0X3VzZXIoKSB5b3UgYXJlIG11Y2ggYmV0dGVyIG9m
ZiByZWFkaW5nIHRoZSB0d28gd29yZHMgdGhhdCBjb250YWluCj4gdGhlIHZhbHVlIGFuZCB0aGVu
IGRvaW5nICdzaGlmdCcgYW5kICdvcicgdG8gZ2V0IHRoZSBjb3JyZWN0IHZhbHVlLgo+IAo+IEV2
ZW4gZm9yIHB1dF91c2VyKCkgZG9pbmcgdGhlIGV4cGxpY2l0IGJ5dGUgYWNjZXNzZXMgd2lsbCBi
ZSBmYXN0ZXIgdGhhbgo+IGdvaW5nIHRob3VnaCB0aGUgZ2VuZXJpYyBjb3B5X3RvL2Zyb21fdXNl
cigpIGZ1bmN0aW9uLgoKSGkgRGF2aWQsCgpBbGV4YW5kcmUgdHJpZWQgdGhhdCBhcHByb2FjaCBh
cyB3ZWxsIGJ1dCB0aGF0IGFkZGVkIGEgYml0IG1vcmUgY29kZSBhbmQKaXQgd2FzIG1vcmUgY29t
cGxleCB0aGFuIGp1c3QgY2FsbGluZyBjb3B5X2Zyb20vdG9fdXNlcigpLiBUaGF0IGNhbgpzdGls
bCBiZSBkb25lIGluIGFub3RoZXIgY29tbWl0IGlmIHdlIG5lZWQgbW9yZSBwZXJmb3JtYW5jZSBs
YXRlci4gQXMgYQpzaWRlIG5vdGUsIHByaW9yIHRvIHRoYXQgcGF0Y2gsIHRoZXNlIG1pc2FsaWdu
ZWQgYWNjZXNzZXMgd2VyZSB1c2luZwp0cmFwLWFuZC1lbXVsYXRlIHNvIHRoYXQgaXMgc3RpbGwg
YSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudC4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IAlEYXZp
ZAo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCAyOCAr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPj4g
aW5kZXggMDQ2ZGU3Y2VkMDljLi5iNTQyYzA1ZjM5NGYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oCj4+IEBAIC0xNjksOCArMTY5LDIxIEBAIGRvIHsJCQkJCQkJCVwKPj4gIAo+PiAg
I2VuZGlmIC8qIENPTkZJR182NEJJVCAqLwo+PiAgCj4+ICt1bnNpZ25lZCBsb25nIF9fbXVzdF9j
aGVjayBfX2FzbV9jb3B5X3RvX3VzZXIodm9pZCBfX3VzZXIgKnRvLAo+PiArCWNvbnN0IHZvaWQg
KmZyb20sIHVuc2lnbmVkIGxvbmcgbik7Cj4+ICt1bnNpZ25lZCBsb25nIF9fbXVzdF9jaGVjayBf
X2FzbV9jb3B5X2Zyb21fdXNlcih2b2lkICp0bywKPj4gKwljb25zdCB2b2lkIF9fdXNlciAqZnJv
bSwgdW5zaWduZWQgbG9uZyBuKTsKPj4gKwo+PiAgI2RlZmluZSBfX2dldF91c2VyX25vY2hlY2so
eCwgX19ndV9wdHIsIGxhYmVsKQkJCVwKPj4gIGRvIHsJCQkJCQkJCVwKPj4gKwlpZiAoIUlTX0VO
QUJMRUQoQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MpKSB7CQkJXAo+PiAr
CQlpZiAoIUlTX0FMSUdORUQoKHVpbnRwdHJfdClfX2d1X3B0ciwgc2l6ZW9mKCpfX2d1X3B0cikp
KSB7CQlcCj4+ICsJCQlpZiAoX19hc21fY29weV9mcm9tX3VzZXIoJih4KSwgX19ndV9wdHIsIHNp
emVvZigqX19ndV9wdHIpKSkJXAo+PiArCQkJCWdvdG8gbGFiZWw7CQkJXAo+PiArCQkJZWxzZQkJ
CQkJXAo+PiArCQkJCWJyZWFrOwkJCQlcCj4+ICsJCX0JCQkJCQlcCj4+ICsJfQkJCQkJCQlcCj4+
ICAJc3dpdGNoIChzaXplb2YoKl9fZ3VfcHRyKSkgewkJCQlcCj4+ICAJY2FzZSAxOgkJCQkJCQlc
Cj4+ICAJCV9fZ2V0X3VzZXJfYXNtKCJsYiIsICh4KSwgX19ndV9wdHIsIGxhYmVsKTsJXAo+PiBA
QCAtMjk3LDYgKzMxMCwxNSBAQCBkbyB7CQkJCQkJCQlcCj4+ICAKPj4gICNkZWZpbmUgX19wdXRf
dXNlcl9ub2NoZWNrKHgsIF9fZ3VfcHRyLCBsYWJlbCkJCQlcCj4+ICBkbyB7CQkJCQkJCQlcCj4+
ICsJaWYgKCFJU19FTkFCTEVEKENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNT
KSkgewkJCVwKPj4gKwkJaWYgKCFJU19BTElHTkVEKCh1aW50cHRyX3QpX19ndV9wdHIsIHNpemVv
ZigqX19ndV9wdHIpKSkgewkJXAo+PiArCQkJdW5zaWduZWQgbG9uZyB2YWwgPSAodW5zaWduZWQg
bG9uZykoeCk7CQkJCVwKPj4gKwkJCWlmIChfX2FzbV9jb3B5X3RvX3VzZXIoX19ndV9wdHIsICYo
dmFsKSwgc2l6ZW9mKCpfX2d1X3B0cikpKQlcCj4+ICsJCQkJZ290byBsYWJlbDsJCQlcCj4+ICsJ
CQllbHNlCQkJCQlcCj4+ICsJCQkJYnJlYWs7CQkJCVwKPj4gKwkJfQkJCQkJCVwKPj4gKwl9CQkJ
CQkJCVwKPj4gIAlzd2l0Y2ggKHNpemVvZigqX19ndV9wdHIpKSB7CQkJCVwKPj4gIAljYXNlIDE6
CQkJCQkJCVwKPj4gIAkJX19wdXRfdXNlcl9hc20oInNiIiwgKHgpLCBfX2d1X3B0ciwgbGFiZWwp
OwlcCj4+IEBAIC0zODUsMTIgKzQwNyw2IEBAIGVycl9sYWJlbDoJCQkJCQkJXAo+PiAgCQktRUZB
VUxUOwkJCQkJXAo+PiAgfSkKPj4gIAo+PiAtCj4+IC11bnNpZ25lZCBsb25nIF9fbXVzdF9jaGVj
ayBfX2FzbV9jb3B5X3RvX3VzZXIodm9pZCBfX3VzZXIgKnRvLAo+PiAtCWNvbnN0IHZvaWQgKmZy
b20sIHVuc2lnbmVkIGxvbmcgbik7Cj4+IC11bnNpZ25lZCBsb25nIF9fbXVzdF9jaGVjayBfX2Fz
bV9jb3B5X2Zyb21fdXNlcih2b2lkICp0bywKPj4gLQljb25zdCB2b2lkIF9fdXNlciAqZnJvbSwg
dW5zaWduZWQgbG9uZyBuKTsKPj4gLQo+PiAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nCj4+
ICByYXdfY29weV9mcm9tX3VzZXIodm9pZCAqdG8sIGNvbnN0IHZvaWQgX191c2VyICpmcm9tLCB1
bnNpZ25lZCBsb25nIG4pCj4+ICB7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
