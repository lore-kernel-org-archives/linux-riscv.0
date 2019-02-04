Return-Path: <SRS0=qOfL=QL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74629C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Feb 2019 20:16:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FAB020821
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Feb 2019 20:16:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TwZBXuYx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4O3KAGh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FAB020821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G25LA9p1ZopMqbDYsjNye16nZhuhVsozhFYYnK/jVkc=; b=TwZBXuYxinRqAu
	Waj8NajSCITTEgfQYr7C4+U07LVLRgKtIUTHebzMg2j4ZaLFtBAdwghoiH1CqjHfER1RHmDrue2mY
	nb7LisqxwLXcOhRbBtCB8S/y1MJyOWVHanACAlpKI8ZLjGI+6dfc0IISY+KASGc5f65WjPLDZJAE+
	BazUrH58NMyesq/eWx6VSQj0O+nTPQIFa3Gqc7XNETkbzSLvRbOeam2C6CCvYH7upj8NmT+sXTHU8
	nvz7aPrtP1QmE/P3RHg8HKBhL+m6QZa61RaTgWErenPmGya/vm2ydwma77SkZhHhBBwWv9vAiTv44
	ZIhnUQ+wm1WsbpoLeU0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqkfY-0007we-VC; Mon, 04 Feb 2019 20:16:40 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqkfW-0007uA-BK
 for linux-riscv@lists.infradead.org; Mon, 04 Feb 2019 20:16:39 +0000
Received: by mail-qk1-x742.google.com with SMTP id m17so769029qki.5
 for <linux-riscv@lists.infradead.org>; Mon, 04 Feb 2019 12:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k0AJytDHmP0Lw3fF9SpIrKceMGpD4esWH9RTVM7MhQA=;
 b=f4O3KAGhw1/0yOYGGEsf+99jXPIuwoUpj9iRMBvCtdxbWcO0phR/g4U0I8buKepFUU
 yYEeD9V+7Nn+UlQ3APlBVl6hizTK7OMiCkgVipOX2OnE9Uhe4PPAWA0AHloz3YwUJvAN
 8P18sevT+I06en2hvPTI2yGXPTVAGZzZ6UEbUzwrf0YUkT+RRAVjxkNCPRdyoVClEzcI
 0RCN/k5BQQjAhrAJXBmmq9fNBrGmn9vckQdagNngrsv+tC0nLMTZ+KcBHEvYY1gOff//
 iCY94TXvvo52z3Ev3fKyxx2s5ewTzsom8CqIRAeEOcqOK93vyjEhmkIRJoTYVzX1Q+E2
 BCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k0AJytDHmP0Lw3fF9SpIrKceMGpD4esWH9RTVM7MhQA=;
 b=nQ6M6bVnY+WzmWjr6SY6qjdZbP/FG3AZO2PcQ8R+QeDfId4jld8txaYJYwhxGxUzoW
 o7uFXWgSKvsSPr183zEQbiQgD8usL04bJyvn49tunTJIBLJ3hLdbkwbau/ChH4Ie3yGK
 x8slPvMUfnkny3zBeipjPnENrD6uKB5ZfndooNsmEM54rIKLab5P7OG4AG+EFZURIpvT
 XKVbS458oPzmnSXPKGN/EUeiSy/Lbk6ZDhVPWrp8ROzCpVpSjdeUwtGI+eMhJJymDnIF
 XMgk/bXUb4p7TqnsZdCx3emNhkkSuvtdAYnibju4UfL4Xmd9APvk7wEX/ZiqQxTja3oM
 5/SQ==
X-Gm-Message-State: AHQUAuZUa6LfBlMFPP5bqB1bewIoIC63CemvbwJTUg2JVaWR/J4tEQr9
 XOqXXXkF5ipEJJ4+O6/RNkO7nB9AXoYLW+ngj0Q=
X-Google-Smtp-Source: AHgI3IY/t4MJc0N+wREQCmNdDHP9N+Z6dNE5LyBENiENTtl108ECy8abzHgQzV/ey7+0i9xQ9aUePEZ8+QjHwER6/ek=
X-Received: by 2002:a37:5807:: with SMTP id m7mr869301qkb.141.1549311396505;
 Mon, 04 Feb 2019 12:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20190203115132.8766-1-bjorn.topel@gmail.com>
 <20190203115132.8766-4-bjorn.topel@gmail.com>
 <d033e68a-b520-c25d-e951-761693c16fe7@iogearbox.net>
In-Reply-To: <d033e68a-b520-c25d-e951-761693c16fe7@iogearbox.net>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Mon, 4 Feb 2019 21:16:24 +0100
Message-ID: <CAJ+HfNhQz5C1Eifjo1ApPF0jfF3zFiSyRph4wUYjvSFicAdN4g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 3/3] bpf, doc: add RISC-V to filter.txt
To: Daniel Borkmann <daniel@iogearbox.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_121638_421298_21F11B16 
X-CRM114-Status: GOOD (  16.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Netdev <netdev@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 ast@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RGVuIG3DpW4gNCBmZWIuIDIwMTkga2wgMjE6MDkgc2tyZXYgRGFuaWVsIEJvcmttYW5uIDxkYW5p
ZWxAaW9nZWFyYm94Lm5ldD46Cj4KPiBPbiAwMi8wMy8yMDE5IDEyOjUxIFBNLCBiam9ybi50b3Bl
bEBnbWFpbC5jb20gd3JvdGU6Cj4gPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybi50b3BlbEBn
bWFpbC5jb20+Cj4gPgo+ID4gVXBkYXRlIERvY3VtZW50YXRpb24vbmV0d29ya2luZy9maWx0ZXIu
dHh0IHRvIG1lbnRpb24gUklTQy1WLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KPgo+IE5pdDogaW4gRG9jdW1lbnRhdGlvbi9zeXNj
dGwvbmV0LnR4dCB1bmRlciBicGZfaml0X2VuYWJsZSB0aGVyZSBpcyBhbHNvCj4gYSBjb25jcmV0
ZSBsaXN0IG9mIGVCUEYvY0JQRiBKSVRzLCB3b3VsZCBiZSBnb29kIHRvIGFkZCByaXNjdjY0IHRo
ZXJlIGFzCj4gd2VsbC4KPgoKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCEgSSdsbCBkbyBh
IHYyLgoKCkJqw7ZybgoKPiA+ICBEb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZmlsdGVyLnR4dCB8
IDE2ICsrKysrKysrKy0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL25ldHdv
cmtpbmcvZmlsdGVyLnR4dCBiL0RvY3VtZW50YXRpb24vbmV0d29ya2luZy9maWx0ZXIudHh0Cj4g
PiBpbmRleCAwMTYwM2JjMmVmZjEuLmI1ZTA2MGVkZmMzOCAxMDA2NDQKPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vbmV0d29ya2luZy9maWx0ZXIudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL25l
dHdvcmtpbmcvZmlsdGVyLnR4dAo+ID4gQEAgLTQ2NCwxMCArNDY0LDExIEBAIGJyZWFrcG9pbnRz
OiAwIDEKPiA+ICBKSVQgY29tcGlsZXIKPiA+ICAtLS0tLS0tLS0tLS0KPiA+Cj4gPiAtVGhlIExp
bnV4IGtlcm5lbCBoYXMgYSBidWlsdC1pbiBCUEYgSklUIGNvbXBpbGVyIGZvciB4ODZfNjQsIFNQ
QVJDLCBQb3dlclBDLAo+ID4gLUFSTSwgQVJNNjQsIE1JUFMgYW5kIHMzOTAgYW5kIGNhbiBiZSBl
bmFibGVkIHRocm91Z2ggQ09ORklHX0JQRl9KSVQuIFRoZSBKSVQKPiA+IC1jb21waWxlciBpcyB0
cmFuc3BhcmVudGx5IGludm9rZWQgZm9yIGVhY2ggYXR0YWNoZWQgZmlsdGVyIGZyb20gdXNlciBz
cGFjZQo+ID4gLW9yIGZvciBpbnRlcm5hbCBrZXJuZWwgdXNlcnMgaWYgaXQgaGFzIGJlZW4gcHJl
dmlvdXNseSBlbmFibGVkIGJ5IHJvb3Q6Cj4gPiArVGhlIExpbnV4IGtlcm5lbCBoYXMgYSBidWls
dC1pbiBCUEYgSklUIGNvbXBpbGVyIGZvciB4ODZfNjQsIFNQQVJDLAo+ID4gK1Bvd2VyUEMsIEFS
TSwgQVJNNjQsIE1JUFMsIFJJU0MtViBhbmQgczM5MCBhbmQgY2FuIGJlIGVuYWJsZWQgdGhyb3Vn
aAo+ID4gK0NPTkZJR19CUEZfSklULiBUaGUgSklUIGNvbXBpbGVyIGlzIHRyYW5zcGFyZW50bHkg
aW52b2tlZCBmb3IgZWFjaAo+ID4gK2F0dGFjaGVkIGZpbHRlciBmcm9tIHVzZXIgc3BhY2Ugb3Ig
Zm9yIGludGVybmFsIGtlcm5lbCB1c2VycyBpZiBpdCBoYXMKPiA+ICtiZWVuIHByZXZpb3VzbHkg
ZW5hYmxlZCBieSByb290Ogo+ID4KPiA+ICAgIGVjaG8gMSA+IC9wcm9jL3N5cy9uZXQvY29yZS9i
cGZfaml0X2VuYWJsZQo+ID4KPiA+IEBAIC02MDMsOSArNjA0LDEwIEBAIGdvdCBmcm9tIGJwZl9w
cm9nX2NyZWF0ZSgpLCBhbmQgJ2N0eCcgdGhlIGdpdmVuIGNvbnRleHQgKGUuZy4KPiA+ICBza2Ig
cG9pbnRlcikuIEFsbCBjb25zdHJhaW50cyBhbmQgcmVzdHJpY3Rpb25zIGZyb20gYnBmX2NoZWNr
X2NsYXNzaWMoKSBhcHBseQo+ID4gIGJlZm9yZSBhIGNvbnZlcnNpb24gdG8gdGhlIG5ldyBsYXlv
dXQgaXMgYmVpbmcgZG9uZSBiZWhpbmQgdGhlIHNjZW5lcyEKPiA+Cj4gPiAtQ3VycmVudGx5LCB0
aGUgY2xhc3NpYyBCUEYgZm9ybWF0IGlzIGJlaW5nIHVzZWQgZm9yIEpJVGluZyBvbiBtb3N0IDMy
LWJpdAo+ID4gLWFyY2hpdGVjdHVyZXMsIHdoZXJlYXMgeDg2LTY0LCBhYXJjaDY0LCBzMzkweCwg
cG93ZXJwYzY0LCBzcGFyYzY0LCBhcm0zMiBwZXJmb3JtCj4gPiAtSklUIGNvbXBpbGF0aW9uIGZy
b20gZUJQRiBpbnN0cnVjdGlvbiBzZXQuCj4gPiArQ3VycmVudGx5LCB0aGUgY2xhc3NpYyBCUEYg
Zm9ybWF0IGlzIGJlaW5nIHVzZWQgZm9yIEpJVGluZyBvbiBtb3N0Cj4gPiArMzItYml0IGFyY2hp
dGVjdHVyZXMsIHdoZXJlYXMgeDg2LTY0LCBhYXJjaDY0LCBzMzkweCwgcG93ZXJwYzY0LAo+ID4g
K3NwYXJjNjQsIGFybTMyLCByaXNjdiAoUlY2NEcpIHBlcmZvcm0gSklUIGNvbXBpbGF0aW9uIGZy
b20gZUJQRgo+ID4gK2luc3RydWN0aW9uIHNldC4KPiA+Cj4gPiAgU29tZSBjb3JlIGNoYW5nZXMg
b2YgdGhlIG5ldyBpbnRlcm5hbCBmb3JtYXQ6Cj4gPgo+ID4KPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
