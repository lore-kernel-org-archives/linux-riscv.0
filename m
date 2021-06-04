Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C82C07E94
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:53:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59C4761400
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59C4761400
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Duq/YPqwyk22MyvAQ+wAtWoEi7Ek2/7rJG6UFGxTecM=; b=zdyMqgtiU0+678
	F/ICLBUis/TMKez/qcEx3f/Q0HIb7q/QSFGimXNLv3QZz+t32eiSvMZlUZT+emkUhOJVw21Me/Of7
	6QcZR9HlBzozkw9zMQRUmc+6E++A4T/wvXYCprDuNxuGbqRLpwn8aAwRtrQ+Oe0xIBN6+mreL9orc
	eb9PuJ+cAfYzDqyhCPXqhMhhVeL5cPHLEIFzIit102zdWdh27HHttoxb7CqjggBJGvdOg4UdhfDhQ
	FDpABNK4o5YjoZVrZxwHOUTTnlhzHmIMQa/8MtS8fR7Ak5yKnqmjwsqHkUa3RzTzAqLMUPrvESIGD
	L2dbUIUxuxh1fSWPvSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6Vg-00Ckyd-1x; Fri, 04 Jun 2021 09:53:00 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6Va-00CkwK-Ln
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 09:52:58 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id s107so12904512ybi.3
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 02:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dHxjx5YL69TG257xYMSlRK9DeSKTQjJUGuYuF182ZkA=;
 b=ZjNrkxUTZGVEOoJt3tb3BRIbJS+FLoZFrMhc6MX/H92/nvb6aCc3J/4G1fgy3QycmF
 wI/D/zKJ5ReMigNMp1Yruu+AfWR9GYZFfjznAioLnLSJQieXrGVOO6VX0V7ya22FKgQi
 l4R+FvRvFa0eHm/hoSZ3YM1MqKW1pwFIOSlqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dHxjx5YL69TG257xYMSlRK9DeSKTQjJUGuYuF182ZkA=;
 b=rJ0cLL7VOymGdYxHdVJxB1oK42tbbazLCPKQBP2JbKKxDpPpqHYNVCOmFGfoA1hL8H
 UAJPM4s9kW9CH4KUFUvXuCIGlLhSlFkHdjtM509RNK5oHMq/wn0CwwY85oi5jlH15Sgp
 AiIDsAyuXNLDhLkhTzMRtZcCOlq8pbBFpP7seiSCHQQMwJJqR8dzbzVmtSed2ADmJVPd
 jFh7VO5dPHTK9g/dslHUV+2sNkQkGuJyXFVFEugPFFFzfGetfyL46u7EyZsfivfpx4aT
 udZsh9GKBvk9R4kJLePOnWezt7mW4XBndJ9+yUUCieSJwAs6aDz6/qcWlMDa79iQ08T/
 nY9A==
X-Gm-Message-State: AOAM532b6C2OarBZih5QViob4pcvJWUSyAEvAQOjzHlf00ac9GLmh8+X
 9sndPzMfkI07WwWFkm33ZooNpfZJX7FczcegXuNDLA==
X-Google-Smtp-Source: ABdhPJyS9cYbCFKGsztRDfF6yaEQmGAAoAeRCo6x/1tvJKc15N9ceuS5HGdAbrtrzPPK25UBZxg8Mk36jlthwCVCiaE=
X-Received: by 2002:a05:6902:4b2:: with SMTP id
 r18mr3959329ybs.446.1622800371649; 
 Fri, 04 Jun 2021 02:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210531085342.17494-1-vitaly.wool@konsulko.com>
 <62961217-1733-eaa3-b072-cbb252620c9a@ghiti.fr>
 <2fb64dce-779a-c6f2-53b7-088cd38813a4@ghiti.fr>
In-Reply-To: <2fb64dce-779a-c6f2-53b7-088cd38813a4@ghiti.fr>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Fri, 4 Jun 2021 11:52:40 +0200
Message-ID: <CAM4kBBKL0D0cvHaNTt2DobbUROp1eGAfmNkakOqzgakEZDLYbA@mail.gmail.com>
Subject: Re: [PATCH] riscv: xip: support runtime trap patching
To: Alex Ghiti <alex@ghiti.fr>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Nicolas Pitre <nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_025254_758655_521EA8EE 
X-CRM114-Status: GOOD (  29.85  )
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

SGkgQWxleCwKCk9uIEZyaSwgSnVuIDQsIDIwMjEgYXQgMTE6MzUgQU0gQWxleCBHaGl0aSA8YWxl
eEBnaGl0aS5mcj4gd3JvdGU6Cj4KPiBMZSAzMS8wNS8yMDIxIMOgIDE3OjE3LCBBbGV4IEdoaXRp
IGEgw6ljcml0IDoKPiA+IEhpIFZpdGFseSwKPiA+Cj4gPiBMZSAzMS8wNS8yMDIxIMOgIDEwOjUz
LCBWaXRhbHkgV29vbCBhIMOpY3JpdCA6Cj4gPj4gUklTQ1ZfRVJSQVRBX0FMVEVSTkFUSVZFIHBh
dGNoZXMgdGV4dCBhdCBydW50aW1lIHdoaWNoIGlzIGN1cnJlbnRseQo+ID4+IG5vdCBwb3NzaWJs
ZSB3aGVuIHRoZSBrZXJuZWwgaXMgZXhlY3V0ZWQgZnJvbSB0aGUgZmxhc2ggaW4gWElQIG1vZGUu
Cj4gPj4gU2luY2UgcnVudGltZSBwYXRjaGluZyBjb25jZXJucyBvbmx5IHRyYXBzIGF0IHRoZSBt
b21lbnQsIGxldCdzIGp1c3QKPiA+PiBoYXZlIGFsbCB0aGUgdHJhcHMgcmVzaWRlIGluIFJBTSBh
bnl3YXkgaWYgUklTQ1ZfRVJSQVRBX0FMVEVSTkFUSVZFCj4gPj4gaXMgc2V0LiBUaHVzLCB0aGVz
ZSBmdW5jdGlvbnMgd2lsbCBiZSBwYXRjaC1hYmxlIGV2ZW4gd2hlbiB0aGUgLnRleHQKPiA+PiBz
ZWN0aW9uIGlzIGluIGZsYXNoLgo+ID4+Cj4gPgo+ID4gVGhpcyBzb3VuZHMgbGlrZSBhIGdvb2Qg
Zml4IGZvciBzaWZpdmUgcGxhdGZvcm1zIHRvIHdvcmsgd2l0aCBYSVAga2VybmVsCj4gPiBpbiA1
LjEzOiBkaWQgeW91IHRlc3QgdGhhdCBpdCBhY3R1YWxseSB3b3JrcyBvbiBIVz8KPiA+Cj4gPj4g
U2lnbmVkLW9mZi1ieTogVml0YWx5IFdvb2wgPHZpdGFseS53b29sQGtvbnN1bGtvLmNvbT4KPiA+
PiAtLS0KPiA+PiAgIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgICAgIHwgMTMgKysr
KysrKysrLS0tLQo+ID4+ICAgYXJjaC9yaXNjdi9rZXJuZWwvdm1saW51eC14aXAubGRzLlMgfCAx
NSArKysrKysrKysrKysrKy0KPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4+IGluZGV4IDA3MjFiOTc5
ODU5NS4uN2JjODhkOGFhYjk3IDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPj4gQEAgLTg2LDgg
Kzg2LDEzIEBAIHN0YXRpYyB2b2lkIGRvX3RyYXBfZXJyb3Ioc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
IGludAo+ID4+IHNpZ25vLCBpbnQgY29kZSwKPiA+PiAgICAgICB9Cj4gPj4gICB9Cj4gPj4gKyNp
ZiBkZWZpbmVkIChDT05GSUdfWElQX0tFUk5FTCkgJiYgZGVmaW5lZAo+ID4+IChDT05GSUdfUklT
Q1ZfRVJSQVRBX0FMVEVSTkFUSVZFKQo+ID4+ICsjZGVmaW5lIF9fdHJhcF9zZWN0aW9uICAgICAg
ICBfX3NlY3Rpb24oIi54aXAudHJhcHMiKQo+ID4+ICsjZWxzZQo+ID4+ICsjZGVmaW5lIF9fdHJh
cF9zZWN0aW9uCj4gPj4gKyNlbmRpZgo+ID4KPiA+IE1heWJlIHdlIGNvdWxkIGRvIHNvbWV0aGlu
ZyBtb3JlIGdlbmVyaWMuIEF0IHRoZSBtb21lbnQsIG9ubHkgdHJhcHMgYXJlCj4gPiBzdWJqZWN0
IHRvIGFsdGVybmF0aXZlcyBidXQgdGhhdCB3aWxsIGxpa2VseSBleHBhbmQ6IHdoYXQgYWJvdXQg
cmF0aGVyCj4gPiBkZWZpbmluZyBhIHNlY3Rpb24gY2FsbGVkIF9fYWx0ZXJuYXRpdmVfc2VjdGlv
bj8KPgo+IEFueSB0aG91Z2h0cyBhYm91dCB0aGF0PwoKT2ggc29ycnksIEkgaGF2ZSBvdmVybG9v
a2VkIHRoaXMuIEkgZG8gYWdyZWUgdGhpcyBpcyB0aGUgd2F5IHRvIGdvCmxvbmcgdGVybSwgSSBq
dXN0IHdhbnRlZCB0byBkbyBhIHJlYXNvbmFibHkgZ29vZCBxdWljayBmaXggc2luY2UgdGhlCmRl
ZmF1bHQgU2lGaXZlIGNvbmZpZ3VyYXRpb24gd29uJ3QgZXZlbiBidWlsZCB3aXRoIENPTkZJR19Y
SVAgZW5hYmxlZC4KU28gSSB3b3VsZCBwcm9iYWJseSBqdXN0IHN1Z2dlc3QgdG8gdGFrZSB0aGUg
ZXhpc3Rpbmcgc29sdXRpb24gYW5kCnRoZW4gdGhpbmsgb3ZlciB0aGUgZGV0YWlscyAoZS4gZy4g
c2hvdWxkIHdlIGp1c3QgdXNlIG9uZSAiYWx0ZXJuYXRpdmUKc2VjdGlvbiIgZm9yIGJvdGggdGhl
IGZ1bmN0aW9ucyBhbmQgdGhlIHRhYmxlIG9yIGhhdmUgc2VwYXJhdGUgb25lcz8pCmZvciB0aGUg
Z2VuZXJpYyBzb2x1dGlvbi4KCkJlc3QgcmVnYXJkcywKICAgVml0YWx5Cgo+IFRoYW5rcywKPgo+
IEFsZXgKPgo+ID4KPiA+PiAgICNkZWZpbmUgRE9fRVJST1JfSU5GTyhuYW1lLCBzaWdubywgY29k
ZSwgc3RyKSAgICAgICAgICAgICAgICBcCj4gPj4gLWFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQg
bmFtZShzdHJ1Y3QgcHRfcmVncyAqcmVncykgICAgICAgICAgICBcCj4gPj4gK2FzbWxpbmthZ2Ug
X192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgbmFtZShzdHJ1Y3QgcHRfcmVncyAqcmVncykg
ICAgXAo+ID4+ICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+PiAg
ICAgICBkb190cmFwX2Vycm9yKHJlZ3MsIHNpZ25vLCBjb2RlLCByZWdzLT5lcGMsICJPb3BzIC0g
IiBzdHIpOyAgICBcCj4gPj4gICB9Cj4gPj4gQEAgLTExMSw3ICsxMTYsNyBAQCBET19FUlJPUl9J
TkZPKGRvX3RyYXBfc3RvcmVfbWlzYWxpZ25lZCwKPiA+PiAgIGludCBoYW5kbGVfbWlzYWxpZ25l
ZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPiA+PiAgIGludCBoYW5kbGVfbWlzYWxpZ25l
ZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gPj4gLWFzbWxpbmthZ2Ugdm9pZCBkb190
cmFwX2xvYWRfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+PiArYXNtbGlua2Fn
ZSB2b2lkIF9fdHJhcF9zZWN0aW9uIGRvX3RyYXBfbG9hZF9taXNhbGlnbmVkKHN0cnVjdCBwdF9y
ZWdzCj4gPj4gKnJlZ3MpCj4gPj4gICB7Cj4gPj4gICAgICAgaWYgKCFoYW5kbGVfbWlzYWxpZ25l
ZF9sb2FkKHJlZ3MpKQo+ID4+ICAgICAgICAgICByZXR1cm47Cj4gPj4gQEAgLTExOSw3ICsxMjQs
NyBAQCBhc21saW5rYWdlIHZvaWQgZG9fdHJhcF9sb2FkX21pc2FsaWduZWQoc3RydWN0Cj4gPj4g
cHRfcmVncyAqcmVncykKPiA+PiAgICAgICAgICAgICAgICAgIk9vcHMgLSBsb2FkIGFkZHJlc3Mg
bWlzYWxpZ25lZCIpOwo+ID4+ICAgfQo+ID4+IC1hc21saW5rYWdlIHZvaWQgZG9fdHJhcF9zdG9y
ZV9taXNhbGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4+ICthc21saW5rYWdlIHZvaWQg
X190cmFwX3NlY3Rpb24gZG9fdHJhcF9zdG9yZV9taXNhbGlnbmVkKHN0cnVjdAo+ID4+IHB0X3Jl
Z3MgKnJlZ3MpCj4gPj4gICB7Cj4gPj4gICAgICAgaWYgKCFoYW5kbGVfbWlzYWxpZ25lZF9zdG9y
ZShyZWdzKSkKPiA+PiAgICAgICAgICAgcmV0dXJuOwo+ID4+IEBAIC0xNDYsNyArMTUxLDcgQEAg
c3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nCj4gPj4gZ2V0X2JyZWFrX2luc25fbGVuZ3RoKHVu
c2lnbmVkIGxvbmcgcGMpCj4gPj4gICAgICAgcmV0dXJuIEdFVF9JTlNOX0xFTkdUSChpbnNuKTsK
PiA+PiAgIH0KPiA+PiAtYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBkb190cmFwX2JyZWFrKHN0
cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4+ICthc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2Vj
dGlvbiB2b2lkIGRvX3RyYXBfYnJlYWsoc3RydWN0IHB0X3JlZ3MKPiA+PiAqcmVncykKPiA+PiAg
IHsKPiA+PiAgICNpZmRlZiBDT05GSUdfS1BST0JFUwo+ID4+ICAgICAgIGlmIChrcHJvYmVfc2lu
Z2xlX3N0ZXBfaGFuZGxlcihyZWdzKSkKPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdm1saW51eC14aXAubGRzLlMKPiA+PiBiL2FyY2gvcmlzY3Yva2VybmVsL3ZtbGludXgteGlw
Lmxkcy5TCj4gPj4gaW5kZXggNGIyOWI5OTE3Zjk5Li5hM2ZmMDljNGMzZjkgMTAwNjQ0Cj4gPj4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdm1saW51eC14aXAubGRzLlMKPiA+PiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC92bWxpbnV4LXhpcC5sZHMuUwo+ID4+IEBAIC05OSw5ICs5OSwyMiBAQCBT
RUNUSU9OUwo+ID4+ICAgICAgIH0KPiA+PiAgICAgICBQRVJDUFVfU0VDVElPTihMMV9DQUNIRV9C
WVRFUykKPiA+PiAtICAgIC4gPSBBTElHTihQQUdFX1NJWkUpOwo+ID4+ICsgICAgLiA9IEFMSUdO
KDgpOwo+ID4+ICsgICAgLmFsdGVybmF0aXZlIDogewo+ID4+ICsgICAgICAgIF9fYWx0X3N0YXJ0
ID0gLjsKPiA+PiArICAgICAgICAqKC5hbHRlcm5hdGl2ZSkKPiA+PiArICAgICAgICBfX2FsdF9l
bmQgPSAuOwo+ID4+ICsgICAgfQo+ID4+ICAgICAgIF9faW5pdF9lbmQgPSAuOwo+ID4+ICsgICAg
LiA9IEFMSUdOKDE2KTsKPiA+Cj4gPiBXaHkgMTYgaGVyZT8KPiA+Cj4gPj4gKyAgICAueGlwLnRy
YXBzIDogewo+ID4+ICsgICAgICAgIF9feGlwX3RyYXBzX3N0YXJ0ID0gLjsKPiA+PiArICAgICAg
ICAqKC54aXAudHJhcHMpCj4gPj4gKyAgICAgICAgX194aXBfdHJhcHNfZW5kID0gLjsKPiA+PiAr
ICAgIH0KPiA+PiArCj4gPj4gKyAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsKPiA+PiAgICAgICAu
c2RhdGEgOiB7Cj4gPj4gICAgICAgICAgIF9fZ2xvYmFsX3BvaW50ZXIkID0gLiArIDB4ODAwOwo+
ID4+ICAgICAgICAgICAqKC5zZGF0YSopCj4gPj4KPiA+Cj4gPiBUaGFua3MsCj4gPgo+ID4gQWxl
eAo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
