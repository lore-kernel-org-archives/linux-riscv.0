Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01999C5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 06:32:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6185C24655
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 06:32:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wrxrtdke";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1w+kD+Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6185C24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ilxfxbaDT+P33Jo+eJKfxzRPkk3SSjbXDsC2tIzpXKs=; b=WrxrtdkesLa8/YE4GbW4hvvSn
	kZPVGJ+8H9pxPXZP83o5rM/egSH2UeHoDKfhL6jDbZPZ61whvSq3SQxOM0lKAdwh4cnrIqo7wapO1
	HcSLGCBUt/QKaCy1XX+8cNxJA4ylk+iOW2GCNKvEjEk7AXwllAWg2oE2HMCk7dgIcqtOuiYZsd/Gk
	d6TDxbuuwr1qUXoUtm8oOumUjVHrkJ+8X+/J60Sr4MDFZf+nVJDIeb12AH0HmdZ3E/ukx6ywcK7bh
	YtkyY+vwo73i2Rr01wjgm0PqHwcMwTymNWANqq6q0qMUn78t0AgLPrT6X2CZxbrK2khWxggWJ3As9
	m258xIP0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfH1A-00026Y-Sw; Wed, 18 Nov 2020 06:32:36 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfH18-00025t-Kt
 for linux-riscv@lists.infradead.org; Wed, 18 Nov 2020 06:32:35 +0000
Received: by mail-wr1-x444.google.com with SMTP id p8so1013392wrx.5
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 22:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wqgSZ9r2kfTRap69aHQFZm5M1DT8YcVhJNk7kUqL2DY=;
 b=F1w+kD+Ycj6h5wqFwDdP+v6KZD0wQRFvur4V7623BsRHBAQXippuoKHI1wbldMlI8q
 5/j3GgKBDdd3iDpULoXDT1MnIJXy5UdLy10Ek5+Bmym8/8wIcReTxk0lpn1jqLEtpNma
 O91eTm5P31EwuhbXrT0qtQ1hroncRha1CPoquMw+saESEiSC5zLX+hvcHpywi0TNN+hl
 XN5Pk2B83/PDhsK56VLRZvpTJPTnwnSmLE3tIZG9q310w8fzFH661YaHG1L3mxIOi3Ca
 8tXPRQlArZPMaaNseA/ceWfrHwCcu/5tcPiNnFAp51pBK8ZTpeDiZ4pBgyt1PDeO7xBy
 scng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wqgSZ9r2kfTRap69aHQFZm5M1DT8YcVhJNk7kUqL2DY=;
 b=MthKAuY866l72sB3bgct2ALAEl1/ikZiK+3X/9gJv0U9Yu8tnwmj2it2tg7h8rCNeu
 kv7pMLHddt1ITPbf9Hq+4VBfwllTbcxyoPMIbMZxSdXareCzw7edD5SZUY4bNTLQV8cl
 mjasqufCXuj83V6MCAsfpiD8z/f3j+jYRuskgG3soDQYeTRqfQtPOSbkz4yGpHfQ5T07
 fb1hSHlGhlgcRw5L7xZKakbTKKF5Mw6WINqUpWMWKdhNzdML4TuVWAz9HKXwWNkm5Bsd
 CpJ6vnRGF4g5eOvvEMIk2zc3XOeAQEgDdYsbewXuICQvsfXmIHFsNzmNNyNjoyw3Z9SN
 U5lQ==
X-Gm-Message-State: AOAM531ZsvUbWw6qaRG7mk0HmKn/rumHHkb5qWPoyPe9lmxRZcStzq9j
 7ENZQZxqfVnHAXUyNgU1NigPgghSW3lqzj6Dix1BsqVpDwI=
X-Google-Smtp-Source: ABdhPJx/SGBBnXmA99q5yVAio/qHRvzL6aSrJc1+CarckpmICW4YIjM8xB3gt4Fz4hrAv3Nh3u4xmirC7RwsskpkD3M=
X-Received: by 2002:adf:ed04:: with SMTP id a4mr3361502wro.172.1605681153633; 
 Tue, 17 Nov 2020 22:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20201117082638.43675-1-bjorn.topel@gmail.com>
 <20201117082638.43675-3-bjorn.topel@gmail.com>
 <CAEf4BzZYXw8cd53+owz1ctsO9diFNJ9oCzgEEGMqRVUjmsN+ew@mail.gmail.com>
In-Reply-To: <CAEf4BzZYXw8cd53+owz1ctsO9diFNJ9oCzgEEGMqRVUjmsN+ew@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 18 Nov 2020 07:32:21 +0100
Message-ID: <CAJ+HfNj9Ou=ftR__0gN-MnO4NMRLPCJ4krXDNxZk0uEYJAu20A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/3] selftests/bpf: Avoid running unprivileged
 tests with alignment requirements
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_013234_715032_CEB1716C 
X-CRM114-Status: GOOD (  21.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Luke Nelson <luke.r.nels@gmail.com>,
 Networking <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxOCBOb3YgMjAyMCBhdCAwMjo0MywgQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWkubmFr
cnlpa29AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDE3LCAyMDIwIGF0IDEyOjI5
IEFNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
U29tZSBhcmNoaXRlY3R1cmVzIGhhdmUgc3RyaWN0IGFsaWdubWVudCByZXF1aXJlbWVudHMuIElu
IHRoYXQgY2FzZSwKPiA+IHRoZSBCUEYgdmVyaWZpZXIgZGV0ZWN0cyBpZiBhIHByb2dyYW0gaGFz
IHVuYWxpZ25lZCBhY2Nlc3NlcyBhbmQKPiA+IHJlamVjdHMgdGhlbS4gQSB1c2VyIGNhbiBwYXNz
IEJQRl9GX0FOWV9BTElHTk1FTlQgdG8gYSBwcm9ncmFtIHRvCj4gPiBvdmVycmlkZSB0aGlzIGNo
ZWNrLiBUaGF0LCBob3dldmVyLCB3aWxsIG9ubHkgd29yayB3aGVuIGEgcHJpdmlsZWdlZAo+ID4g
dXNlciBsb2FkcyBhIHByb2dyYW0uIEEgdW5wcml2aWxlZ2VkIHVzZXIgbG9hZGluZyBhIHByb2dy
YW0gd2l0aCB0aGlzCj4gPiBmbGFnIHdpbGwgYmUgcmVqZWN0ZWQgcHJpb3IgZW50ZXJpbmcgdGhl
IHZlcmlmaWVyLgo+Cj4gSSdkIGluY2x1ZGUgdGhpcyBwYXJhZ3JhcGggYXMgYSBjb2RlIGNvbW1l
bnQgcmlnaHQgbmV4dCB0byB0aGUgY2hlY2sgYmVsb3cuCj4KPiA+Cj4gPiBIZW5jZSwgaXQgZG9l
cyBub3QgbWFrZSBzZW5zZSB0byBsb2FkIHVucHJpdmlsZWdlZCBwcm9ncmFtcyB3aXRob3V0Cj4g
PiBzdHJpY3QgYWxpZ25tZW50IHdoZW4gdGVzdGluZyB0aGUgdmVyaWZpZXIuIFRoaXMgcGF0Y2gg
YXZvaWRzIGV4YWN0bHkKPiA+IHRoYXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYnBmL3Rlc3RfdmVyaWZpZXIuYyB8IDEyICsrKysrKysrKy0tLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X3ZlcmlmaWVyLmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF92ZXJpZmllci5jCj4gPiBpbmRleCA5YmUzOTVk
OWRjNjQuLjIwNzVmNmE5ODgxMyAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi90ZXN0X3ZlcmlmaWVyLmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi90ZXN0X3ZlcmlmaWVyLmMKPiA+IEBAIC0xMTUyLDkgKzExNTIsMTUgQEAgc3RhdGljIHZv
aWQgZ2V0X3VucHJpdl9kaXNhYmxlZCgpCj4gPgo+ID4gIHN0YXRpYyBib29sIHRlc3RfYXNfdW5w
cml2KHN0cnVjdCBicGZfdGVzdCAqdGVzdCkKPiA+ICB7Cj4gPiAtICAgICAgIHJldHVybiAhdGVz
dC0+cHJvZ190eXBlIHx8Cj4gPiAtICAgICAgICAgICAgICB0ZXN0LT5wcm9nX3R5cGUgPT0gQlBG
X1BST0dfVFlQRV9TT0NLRVRfRklMVEVSIHx8Cj4gPiAtICAgICAgICAgICAgICB0ZXN0LT5wcm9n
X3R5cGUgPT0gQlBGX1BST0dfVFlQRV9DR1JPVVBfU0tCOwo+ID4gKyAgICAgICBib29sIHJlcV9h
bGlnbmVkID0gZmFsc2U7Cj4gPiArCj4gPiArI2lmbmRlZiBDT05GSUdfSEFWRV9FRkZJQ0lFTlRf
VU5BTElHTkVEX0FDQ0VTUwo+ID4gKyAgICAgICByZXFfYWxpZ25lZCA9IHRlc3QtPmZsYWdzICYg
Rl9ORUVEU19FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUzsKPiA+ICsjZW5kaWYKPiA+ICsgICAg
ICAgcmV0dXJuICghdGVzdC0+cHJvZ190eXBlIHx8Cj4gPiArICAgICAgICAgICAgICAgdGVzdC0+
cHJvZ190eXBlID09IEJQRl9QUk9HX1RZUEVfU09DS0VUX0ZJTFRFUiB8fAo+ID4gKyAgICAgICAg
ICAgICAgIHRlc3QtPnByb2dfdHlwZSA9PSBCUEZfUFJPR19UWVBFX0NHUk9VUF9TS0IpICYmCj4g
PiArICAgICAgICAgICAgICAgIXJlcV9hbGlnbmVkOwo+Cj4gSXQncyBhIGJpdCBjb252b2x1dGVk
LiBUaGlzIHNlZW1zIGEgYml0IG1vcmUgc3RyYWlnaHRmb3J3YXJkOgo+Cj4gI2lmbmRlZiBDT05G
SUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+ICAgICBpZiAodGVzdC0+ZmxhZ3Mg
JiBGX05FRURTX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTKQo+ICAgICAgICAgcmV0dXJuIGZh
bHNlOwo+ICNlbmRpZgo+IC8qIHRoZSByZXN0IG9mIGxvZ2ljIHVudG91Y2hlZCAqLwo+Cj4gPwo+
CgpVZ2guIFllcywgaW5kZWVkLiAqYmx1c2gqCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
