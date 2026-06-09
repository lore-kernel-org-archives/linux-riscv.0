Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9AACD8CAC
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=397CbCEomhmF5dHfs5MG+yxjvRtRRhVczp15X8DGiw4=; b=rUYaphGxGvoEWZ
	lE6QotKSLL5atx7unl68jAuZU7/42MQTouiM0zlpFULtvWXBnuN4YSXR+ZJuJIb0cltwDSewesdHK
	+KM3HJXN1H5KPqZqMLMfmCFyzNvJJwEUWI6f0ZFAEZbm6hD3O1h/3M0h/aDF9jaU+HIcAhPK3CwiC
	uCxvQi1dPTD3LoHqRz84AvR84thCPpE8oBa85mW0kcEssodYGuNkWN7exgNmCLt3QjljGZ0trSmP9
	ZBnwzoQQtyFRaPrRvDIO6Xbh+VsT9HI3z2iNN93szMpVogx9G2ZVM3oM4YB3WKWkc9C41Lbr01nec
	9NDHfuOVs5LZaT2S0bIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrR1-000000051WS-3aBH;
	Tue, 09 Jun 2026 08:03:43 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrQz-000000051Vj-0C6c
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 08:03:42 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-69e59978deeso2011295eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 01:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780992219; cv=none;
        d=google.com; s=arc-20240605;
        b=My9EbeHtMVA14NxWPzNvgnvG6gw+xpdgwRBuGZ039J7o+qRK6yMVmlDvGrttAaMIa+
         9+hPR6g7qFa1InN/VlyGkaePyIz+NaCDsgLXJCVx0rRP5SHdtLbNZLrVByac3AUgHdcS
         JcEndaAiz5p7JVIIYgNqZLMZGIprkZVHOmezvHN6oPagYQapZLRXZrEtUqEviafHH0M1
         VMO5yIOsa4uF1Ntdi3pidoHYZyLv3+T7jDD5sQ2IDB0aD9mi4sBpAZm+42KxHlAVx+pB
         fYgbNVO5ccvTX/pBkZJOgGp+F595DtU1XjpuCjIgkSw4r3W/UI3L6gbcIewHOySc46W1
         uXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JEN+pnbmymI5Y7/8Nui3uQlN5rlTfMbB0VlJQM992Lo=;
        fh=QaQRw0ctrkNlfgAyw7UnFGJarJTlE2dofqQW+yHQMVY=;
        b=TlKm4Y+yOALuaTuINFLUSTQ9xydDuMrKteCYAERKQqlrgo1t6rEOwyN4YIGGJYlMhJ
         OM6qciKqulM80Aw/AS1ZpM3zfA3+9cENNAprlLtPMHG9WfQL8v/efL61s+SghrWvJEdj
         kRab+ZiSmFMHevO0uyR0FFpAgZpmF7JIEhAE4uETjdQQ1i7t1ncXPYirbRIPyb1zcIak
         Z7JziNaW51kBdLQmexAtvXyly9tXC9Pba6Qi0MWwSGluPHn3unl414dwVEoNoM5uahiJ
         xNLwjpouXkGmEXrZ78fMuPGKgyAwWro0FTdqo/KOmtejReRQ3U4c/+1Jot9Y22q+5lE0
         5y6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780992219; x=1781597019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEN+pnbmymI5Y7/8Nui3uQlN5rlTfMbB0VlJQM992Lo=;
        b=hxbc4DQqouOoBMBtn39o65dtzM/PfPhqLKkQSdSWeTlFI5BHfRlR96KqIo8aXi3OON
         mAnWt9nRNs4jBnFy6NE320vUew209Wa8i+2UfGQoCprkCQ9wBTWOlPKyZ6TMUmpRYPDU
         PkPW7ZOcSLx2hgY/TVB75sEEQMSsvqmX4WnJrsaww0E8zfZB7h9+gvzqx0d1oxWFFv2T
         0nX3yoonBWZ6jM5dkbOOAQTEyR86GkmUzXUeY6mvplzCKVlARW0gDsIHNGIbfqJw56P2
         Q9ljk/zA5xO8+erFtQHApLmpOySEopbwy/mSswzkXRY25GJctP88ODlW79frs413FCuz
         /8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992219; x=1781597019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JEN+pnbmymI5Y7/8Nui3uQlN5rlTfMbB0VlJQM992Lo=;
        b=s0DxDSoBhjL56zRsy0w7R5ESeM9NZWePTvNUIDCYqYMrLuDB/N2vOPgPnJ8LGQ3u+9
         N8ltDQ75W/H8gsblPw0baWTrKna3rNEeINhgDs0Tsp5V6mlcfAG16pK/TB/sT1yqjCVd
         bROjDISETEVLmEOrw5Ecdwbbn49e1I7piEEqgcOMrlXiTmxltjsC7yFOj9OAJXEUNJH1
         1MgB3CBjQMhuQ60lCn4UNTDqhFynybtQzJB6zriojukv2wA1BcmaJuOn5vpEHeoVoIZ0
         o5ggrJMxQC3rDMl7B80oivrn9AWzG/fNS0oDbIYI26tFnSL8GA6nziCNa/0MJ56aoWrp
         nX4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/1OmkHZ6of1gSdgMbwdFIvmIziralLO23k4qwt7TEyUUiZBsge4Jf5Dk4iBOgjNJUf24TF6aQrPykZDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcNKDgZNpVuAUGbKa9vqjh4czpNgTsWmRXQsYP7mJcJiW+GwP3
	9QzkeekzlNByr+FgfaIypRELh99vRPT6lOoHSZ6bmHRFPgmHJATnr+z5XeLPMY4IyhRq69UlDtr
	YTVN0jOpgGbpy1JRU/mxIiVcyqFzQm5m3kHLQlHK9drYFjIK4krwgxGK5EA==
X-Gm-Gg: Acq92OE4TzcEhsrsqtZA67oEmh7oE8GEYK3/rrYlchiEWLB8ZJy+tGFglwsa79rr8Yu
	tFGu/hsePs5A97Ihnp398ZwJ3LlpOe3UmIa2xsYq3j61rUh8ElRQNLEp4+VJ06NnmeH/FdrXktc
	uV8zvjsqR2Trzcd2yccaNLHFtf2dh37sUe2+SwM8BidynRc2zkxhoKuQ7yrV/kOzFlod014CHUj
	NcSN85NPmn39FM1bN/0O25fgZQBAZEbMre0tIfFVqmnBYQtWXunol38/DtS5xMDr4QyXNzegdnk
	8bH8Y3VtkVy9LdtHNXb3VkthM1uiIT/rIWpDQcTFxr6l+FfYaoW3zOOP2Ew4ZVnxNbI8kxHMqet
	7HQTAiF0pE7VsA1Pcr/+mz293rR4PZ+fgMgUfhg==
X-Received: by 2002:a05:6820:198f:b0:69e:4403:330a with SMTP id
 006d021491bc7-69e68b5e101mr9952696eaf.21.1780992219248; Tue, 09 Jun 2026
 01:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260608115935.2194813-1-fanwenhui@masscore.cn>
In-Reply-To: <20260608115935.2194813-1-fanwenhui@masscore.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Jun 2026 13:33:27 +0530
X-Gm-Features: AVVi8CfWUzz-EtP3fTxuyXCcepSvBlvvdnz3oAZPQTk74p8XeTlqp7_HSoOyAGs
Message-ID: <CAAhSdy3iqKo=ps9rkeLUWFRTxwEi+7CkFt0z+qYmb-BAruGMwg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix IPI target CPU mapping for
 sparse hartid topology
To: Wenhui Fan <fanwenhui@masscore.cn>
Cc: tglx@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_010341_348978_07FF9B28 
X-CRM114-Status: GOOD (  21.64  )
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

T24gTW9uLCBKdW4gOCwgMjAyNiBhdCA1OjI54oCvUE0gV2VuaHVpIEZhbiA8ZmFud2VuaHVpQG1h
c3Njb3JlLmNuPiB3cm90ZToKPgo+IFdoZW4gdGhlIHN5c3RlbSBoYXMgc3BhcnNlIGhhcnRpZCB0
b3BvbG9neSAoZS5nLiwgb25seSBoYXJ0MCBhbmQgaGFydDgKPiBhcmUgb25saW5lKSwgdGhlIGN1
cnJlbnQgSU1TSUMgZHJpdmVyIGluY29ycmVjdGx5IGNhbGN1bGF0ZXMgdGhlIE1TSQo+IE1NSU8g
b2Zmc2V0IGZvciBlYWNoIENQVS4gVGhpcyBjYXVzZXMgSVBJcyB0YXJnZXRpbmcgaGFydDggdG8g
YmUKPiBtaXNkaXJlY3RlZCB0byBoYXJ0MS4KClRoZSBjdXJyZW50IERULWJpbmRpbmdzIGhhbmRs
ZXMgc3BhcnNlIGhhcnRpZCBwZXJmZWN0bHkgZmluZS4gVGhlCmludGVycnVwdHMtZXh0ZW5kZWQg
RFQgcHJvcGVydHkgb2YgSU1TSUMgZGVzY3JpYmVzIHRoZSBhcnJhbmdlbWVudApvZiBJTVNJQyBm
aWxlcyBhbmQgdGhlaXIgbWFwcGluZyB0byBIQVJUcy4KCkl0IHNlZW1zIHRoZXJlIGlzIHNvbWUg
aXNzdWUgd2l0aCB5b3VyIGludGVycnVwdHMtZXh0ZW5kZWQgRFQKcHJvcGVydHkgaW4gdGhlIElN
U0lDIERULW5vZGUuIFBsZWFzZSBzaGFyZSB5b3VyIElNU0lDIERUIG5vZGUKb3ZlciBoZXJlIGFu
ZCBleHBsYWluIHRoZSBwcm9ibGVtIHlvdSBhcmUgZmFjaW5nIGJhc2VkIG9uIHRoYXQuCgo+Cj4g
VGhlIHJvb3QgY2F1c2UgaXMgdGhhdCBpbiBpbXNpY19zZXR1cF9zdGF0ZSgpLCB0aGUgTU1JTyBv
ZmZzZXQgaXMKPiBjYWxjdWxhdGVkIHVzaW5nIHRoZSBwYXJlbnQgaW50ZXJydXB0IGluZGV4ICdp
JyByYXRoZXIgdGhhbiB0aGUgYWN0dWFsCj4gaGFydGlkOgo+ICAgICByZWxvZmYgPSBpICogQklU
KGdsb2JhbC0+Z3Vlc3RfaW5kZXhfYml0cykgKiBJTVNJQ19NTUlPX1BBR0VfU1o7Cj4KPiBUaGlz
IGFzc3VtZXMgYSBjb250aWd1b3VzIGhhcnRpZCBzcGFjZSwgd2hpY2ggaXMgbm90IGd1YXJhbnRl
ZWQgaW4gYWxsCj4gc3lzdGVtcy4gV2hlbiBvbmx5IGhhcnQwIGFuZCBoYXJ0OCBhcmUgb25saW5l
LCB0aGUgZHJpdmVyIHJlY2VpdmVzCj4gbnJfcGFyZW50X2lycXM9Miwgd2l0aCBpPTAgZm9yIGhh
cnQwIGFuZCBpPTEgZm9yIGhhcnQ4Lgo+Cj4gVXNpbmcgaT0xIGZvciBoYXJ0OCByZXN1bHRzIGlu
IHVzaW5nIHRoZSB3cm9uZyBvZmZzZXQgd2hpY2ggaXMgaW50ZW5kZWQKPiBmb3IgaGFydDEsIGFu
ZCBjYXVzZXMgdGhlIE1TSSBjb25maWd1cmVkIGZvciBoYXJ0OCB0byBpbmNvcnJlY3RseSBhY2Nl
c3MKPiBoYXJ0MSdzIE1TSSBwYWdlLgo+Cj4gRml4IHRoaXMgYnkgdXNpbmcgdGhlIGFjdHVhbCBo
YXJ0aWQgZm9yIG9mZnNldCBjYWxjdWxhdGlvbjoKPiAgICAgcmVsb2ZmID0gaGFydGlkICogQklU
KGdsb2JhbC0+Z3Vlc3RfaW5kZXhfYml0cykgKiBJTVNJQ19NTUlPX1BBR0VfU1o7Cj4KPiBGaXhl
czogMjFhOGY4YTBlYjM1ICgiaXJxY2hpcDogQWRkIFJJU0MtViBpbmNvbWluZyBNU0kgY29udHJv
bGxlciBlYXJseSBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IFdlbmh1aSBGYW4gPGZhbndlbmh1
aUBtYXNzY29yZS5jbj4KPiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1z
dGF0ZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0
YXRlLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiBpbmRleCBl
M2VkODc0ZDguLjVmNzM3ZWMzNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LWltc2ljLXN0YXRlLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2lj
LXN0YXRlLmMKPiBAQCAtODk0LDcgKzg5NCw3IEBAIGludCBfX2luaXQgaW1zaWNfc2V0dXBfc3Rh
dGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdm9pZCAqb3BhcXVlKQo+Cj4gICAgICAg
ICAgICAgICAgIC8qIEZpbmQgTU1JTyBsb2NhdGlvbiBvZiBNU0kgcGFnZSAqLwo+ICAgICAgICAg
ICAgICAgICBpbmRleCA9IG5yX21taW9zOwo+IC0gICAgICAgICAgICAgICByZWxvZmYgPSBpICog
QklUKGdsb2JhbC0+Z3Vlc3RfaW5kZXhfYml0cykgKgo+ICsgICAgICAgICAgICAgICByZWxvZmYg
PSBoYXJ0aWQgKiBCSVQoZ2xvYmFsLT5ndWVzdF9pbmRleF9iaXRzKSAqCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgIElNU0lDX01NSU9fUEFHRV9TWjsKClVzaW5nIGhhcnRpZCB0byBjYWxjdWxh
dGUgdGhlIElNU0lDIE1NSU8gb2Zmc2V0IGRvZXMgbm90IGFsZ2luCndpdGggdGhlICJpbnRlcnJ1
cHRzLWV4dGVuZGVkIiBEVCBwcm9wZXJ0eSBkZWZpbmVkIGJ5IHRoZSBJTVNJQwpEVC1iaW5kaW5n
cy4KKFJlZmVyLCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvcmlzY3YsaW1zaWNzLnlhbWwpCgpDbGVhcmx5LCB0aGVyZSBpcyBzb21ldGhpbmcg
d3Jvbmcgd2l0aCB5b3VyIERUUyBzbyBOQUNLIGZyb20KbXkgc2lkZS4KClJlZ2FyZHMsCkFudXAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
