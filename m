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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3291C2D0E4
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 01:43:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA4D7208CA
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 01:43:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1BZT+eJA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgphcYh3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA4D7208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yTUncSMcJWyY34ym7wHaNKtkIpU/RYJsL8U5KmFkNYE=; b=1BZT+eJABk1CoeGKhXIZ7xhCb
	mMv8YfVevWCVopgJ974kU7jbJec2yfeX1JGkoWjCFJgMitqYYucbDxA0QnW9ezbYX2Y+csyL24/Pw
	krNbPxil6e4XFTHljWNMRRDFltTmxBuWuNrKlDTmeqW5D1BSNrxBzhf+K5B9VZGJo0EGlmQ/v7aps
	KWkMA789Od79tmntxXJU5VwjzesqV13LRnEYlUydCigWxtV1LR3U+e460GGZTXMAVI7VZ2BDnlQAQ
	xwUd7dEDPuLqWK8CD+zFeQ9MvZeTXDOT1XFTHtV5luWWk//uP+1jEOPGYAYjqECWuX/WKsXQpP0RS
	FQOCKbydw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfCVR-0001zi-5t; Wed, 18 Nov 2020 01:43:33 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfCVO-0001z1-KM
 for linux-riscv@lists.infradead.org; Wed, 18 Nov 2020 01:43:31 +0000
Received: by mail-yb1-xb43.google.com with SMTP id d1so134165ybr.10
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 17:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A0mg8MQgDfS28elA9JqsJHkeWfTEE+rH9xC3HBAsDTg=;
 b=sgphcYh3rXQDQAttlOMBcQeIjjiScpH7D0ffvdbaYtWknDW3gVnBofQGEXkYsePLoA
 2WneqMphHz63xTkANHjzxgE+LsO+i7dbCJ1ZY5WibGiATKWJQyIrgBlgH45ha9EaBgg+
 DxG5hpXeXVk0immvY+4igWB+jJQUClWsGe4wbJxJZc8aew7YKJvnY5WMwcIuTD9u7QP4
 +N0JTl4edTjrFRnRNZw7CBfiMdz3B9vhC2ykyp6NyWQrIjIO0F2oQQpNAxrhB1ytX5V+
 WdnzF1HMVM6O12iZVU4UZYDB8ldRsTk7cnZ/oRhodJsoLx7iKarsITF2tJPBItI8+OF0
 I4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A0mg8MQgDfS28elA9JqsJHkeWfTEE+rH9xC3HBAsDTg=;
 b=OpxPNUHMgEtWFogztkl6kIWDuUq+Z0+XHZa8pwmGjwOURY8Rtm/pzz90vpx9ousH7D
 hGzzhPq2XpImeyXmHO/XVdKvYEVsBjPGP6i6fHno8L03hGUjt9ORDD2lU6LaVc33VHTe
 KMJ2PFS7t2KLcJIqgydw1DxtEo8T8oJze9slkx4DxkZHHhhTeGsxtq/wTR3cxfjTLX3O
 rD5gMvu+AWbDsUK1ZY/tcyV19Y83eeSThtQSR28Nqflqk1YoK/nsnTISvVeiE0JECtYp
 y6TQ7E1diqybQ4M6EANPeKVi34w9ITgb7L+0qe3Kj4Fdncpk+lD8zh8t14CbFH72/tj3
 MY0A==
X-Gm-Message-State: AOAM532x5rsfF2dEbOCr6oPdnBVVYcRIN+vFxIRRj+bscOGUQONLXbgf
 KB+5njT6m3Zy9cH30zse06u5zSIlz9iWtsBqCI6i/n6EXTX+Pw==
X-Google-Smtp-Source: ABdhPJyPjcvp0eDkEPhJbKd3l8mS5PDRqmOWT3VyTCvQjZogHc/R25npp99td9VnSjQY+Kj50W7IXcvzzGaVmoBpHYk=
X-Received: by 2002:a25:7717:: with SMTP id s23mr4306672ybc.459.1605663807287; 
 Tue, 17 Nov 2020 17:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20201117082638.43675-1-bjorn.topel@gmail.com>
 <20201117082638.43675-2-bjorn.topel@gmail.com>
In-Reply-To: <20201117082638.43675-2-bjorn.topel@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 17 Nov 2020 17:43:16 -0800
Message-ID: <CAEf4BzYJRqf4ho3hSmXWi2oTMts69ix8nODcoePmnUfg+jjdbQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/3] selftests/bpf: Fix broken riscv build
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_204330_682644_2D81587C 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, luke.r.nels@gmail.com,
 Networking <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-riscv@lists.infradead.org, xi.wang@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMTI6MjggQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9w
ZWxAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZSBzZWxmdGVzdHMvYnBmIE1ha2VmaWxlIGluY2x1
ZGVzIHN5c3RlbSBpbmNsdWRlIGRpcmVjdG9yaWVzIGZyb20KPiB0aGUgaG9zdCwgd2hlbiBidWls
ZGluZyBCUEYgcHJvZ3JhbXMuIE9uIFJJU0MtViBnbGliYyByZXF1aXJlcyB0aGF0Cj4gX19yaXNj
dl94bGVuIGlzIGRlZmluZWQuIFRoaXMgaXMgbm90IHRoZSBjYXNlIGZvciAiY2xhbmcgLXRhcmdl
dCBicGYiLAo+IHdoaWNoIG1lc3NlcyB1cCBfX1dPUkRTSVpFIChlcnJuby5oIC0+IC4uLiAtPiB3
b3Jkc2l6ZS5oKSBhbmQgYnJlYWtzCj4gdGhlIGJ1aWxkLgo+Cj4gQnkgZXhwbGljaXRseSBkZWZp
bmluZyBfX3Jpc2NfeGxlbiBjb3JyZWN0bHkgZm9yIHJpc2N2LCB3ZSBjYW4KPiB3b3JrYXJvdW5k
IHRoaXMuCj4KPiBGaXhlczogMTY3MzgxZjNlYWMwICgic2VsZnRlc3RzL2JwZjogTWFrZWZpbGUg
Zml4ICJtaXNzaW5nIiBoZWFkZXJzIG9uIGJ1aWxkIHdpdGggLWlkaXJhZnRlciIpCj4gU2lnbmVk
LW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgo+IC0tLQo+ICB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgfCAzICsrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYnBmL01ha2VmaWxlCj4gaW5kZXggYzE3MDhmZmE2YjFjLi45ZDQ4NzY5YWQyNjggMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCj4gKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCj4gQEAgLTIxOSw3ICsyMTksOCBAQCAk
KFJFU09MVkVfQlRGSURTKTogJChCUEZPQkopIHwgJChCVUlMRF9ESVIpL3Jlc29sdmVfYnRmaWRz
ICBcCj4gICMgYnVpbGQgd291bGQgaGF2ZSBmYWlsZWQgYW55d2F5cy4KPiAgZGVmaW5lIGdldF9z
eXNfaW5jbHVkZXMKPiAgJChzaGVsbCAkKDEpIC12IC1FIC0gPC9kZXYvbnVsbCAyPiYxIFwKPiAt
ICAgICAgIHwgc2VkIC1uICcvPC4uLj4gc2VhcmNoIHN0YXJ0cyBoZXJlOi8sL0VuZCBvZiBzZWFy
Y2ggbGlzdC4veyBzfCBcKC8uKlwpfC1pZGlyYWZ0ZXIgXDF8cCB9JykKPiArICAgICAgIHwgc2Vk
IC1uICcvPC4uLj4gc2VhcmNoIHN0YXJ0cyBoZXJlOi8sL0VuZCBvZiBzZWFyY2ggbGlzdC4veyBz
fCBcKC8uKlwpfC1pZGlyYWZ0ZXIgXDF8cCB9JykgXAo+ICsgICAgICAgJChzaGVsbCAkKDEpIC1k
TSAtRSAtIDwvZGV2L251bGwgfCBncmVwICcjZGVmaW5lIF9fcmlzY3ZfeGxlbiAnIHxzZWQgJ3Mv
I2RlZmluZSAvLUQvJyB8IHNlZCAncy8gLz0vJykKCmp1c3Qgbml0czogc2Vjb25kICQoc2hlbGwg
KSBpbnZvY2F0aW9uIHNob3VsZCBiZSBhdCB0aGUgc2FtZQppbmRlbnRhdGlvbiBsZXZlbCBhcyB0
aGUgZmlyc3Qgb25lCgphbHNvICd8c2VkJyAtPiAnfCBzZWQnID8KCk90aGVyd2lzZSBJIGhhdmUg
bm8gaWRlYSB3aGF0IHRoaXMgZG9lcyBhbmQgbm8gd2F5IHRvIHRyeSBpdCBvbgpSSVNDLVYsIGJ1
dCBpdCBkb2Vzbid0IGJyZWFrIG15IHNldHVwLCBzbyBJJ20gZmluZSB3aXRoIGl0LiA7KQoKCj4g
IGVuZGVmCj4KPiAgIyBEZXRlcm1pbmUgdGFyZ2V0IGVuZGlhbm5lc3MuCj4gLS0KPiAyLjI3LjAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
