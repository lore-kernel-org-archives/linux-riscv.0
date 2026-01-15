Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14CBD4660F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GnTIWMXpm8ROX8hDFJroClVPJwzG+DsYJ3GFpju73M=; b=ZJ4ik3YB6mdBZN
	5/MdP+aJW9zENZ+iITKo/fgQDUR+PLsrIuJAX44iBFXH6gqqjW71fzrHXLE4cHwflgl+ELrRSFDfb
	qVn+OQppADyhaGBZs2mQJI+mRexN5cYi70LdbTgrzZP7q3+e05GNOTeIYlcoYk6Gav+fPLHFFtpWC
	AVFsmY4wuYPG+JDuw8BvDznKfCAgUGrvUoctM9Gde59CrogIRWwg68IDFGQjqIaSIuUHL+5oZAtyH
	t4sapG+JMgr/YWqU7BWlYwDIy1u2z/wh3/tJ9mYKdDRjTnTNxdtHaGPtqbegusnigOGFFbUyw6C10
	jO54MOZxJrIwK3yu6jmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSpU-0000000D25L-0h0g;
	Thu, 15 Jan 2026 19:16:24 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSpQ-0000000D23e-1WbE
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:16:23 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dsXlJ6fR4z1sCH8;
	Thu, 15 Jan 2026 20:16:12 +0100 (CET)
DKIM-Signature: a=rsa-sha256; bh=L0Qqo2/Q0TKdi0GtVD8j5L6jRYfrkFAC4l3jYU9Bu7s=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Message-ID:Date:Subject:To:From;
        s=r1; t=1768504572; v=1;
        b=xgLN1L41/RMzf2bQ2Wyu+l7ZwmEe0xA+wKqQjWtFzrW9iQkVxI9rVFdLDFTAUYTT
         NCiUb1RDVwiyQjyUGWnYzh7DTZ05Jo9EKnMvENnlkoGTtEJNimvc6KO47c0kcFYW
         WquSU4sNjjDkImPPhAUXnZGsRlrrVH6LSkPPwtA422wvl76QtX4HAzLbO6Azy0pI
         v15hcP22afgaE81J4LXy08QxtU/LWKSIw9mnpkSgey6Nv2GpqLsNy31JtMuml7xm
         YBX/RBnaoZ31isrH4alRTQFwAB24EX2c0WleRoT3Sz29IXL15WLVK2JIbFrk1zfP
         W0lppNIJFb/QqaK2NPQ+lA==
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dsXlG545bz1sCH1;
	Thu, 15 Jan 2026 20:16:10 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4dsXlG4HD2z1qqlb;
	Thu, 15 Jan 2026 20:16:10 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id tvqsgjq_KNzM; Thu, 15 Jan 2026 20:16:09 +0100 (CET)
X-Auth-Info: NHT9NzqB4U0ywCFHHmPmUCIWVoGA51+W79MLwnPvnPJgiGzuOTYRaJ0iHkISTN8Z
Received: from wiesel.intern (aftr-82-135-82-125.dynamic.mnet-online.de [82.135.82.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 15 Jan 2026 20:16:09 +0100 (CET)
Received: from [IPV6:fdea:9b79:8984:1:4b9e:eb3a:b0b7:b462] (unknown [IPv6:fdea:9b79:8984:1:4b9e:eb3a:b0b7:b462])
	by wiesel.intern (Postfix) with ESMTP id 5F94779A0813;
	Thu, 15 Jan 2026 20:16:07 +0100 (CET)
Message-ID: <0733e741-ec63-4419-a08d-50b70210361b@muenchen-mail.de>
Date: Thu, 15 Jan 2026 20:16:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Typo in pinctrl-th1520.c
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Linus Walleij <linusw@kernel.org>, linux-riscv@lists.infradead.org
References: <029e5e79-ae9c-4d31-b75f-8f48f359d539@muenchen-mail.de>
 <aWk59MT8yWcxiYKr@x1>
Content-Language: de-DE, en-US
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
In-Reply-To: <aWk59MT8yWcxiYKr@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111621_613536_9BF5A112 
X-CRM114-Status: GOOD (  19.55  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpBbSAxNS4wMS4yNiB1bSAyMDowMyBzY2hyaWViIERyZXcgRnVzdGluaToKPiBPbiBXZWQs
IEphbiAxNCwgMjAyNiBhdCAwNDoyMDoxN1BNICswMTAwLCBUaG9tYXMgR2VybmVyIHdyb3RlOgo+
PiBIZWxsbywKPj4KPj4gaW4gdGhlIHBpbmNvbnRyb2wgZmlsZSBmb3IgdGhlIFRIMTUyMCBTT0Mg
YSBwYWQgaXMgbmFtZWQgd3JvbmcuIEFjY29yZGluZyB0bwo+PiBUSDE1MjAgU3lzdGVtIFVzZXIg
TWFudWFsLCBjaGFwdGVyIDMuMi4xIChwYWdlIDM4KSBwYWQgOCBpbiBwYWQgZ3JvdXAgMyBpcwo+
PiBuYW1lZCBRU1BJMF9EM19IT0xELiBXaXRoIHRoZSB3cm9uZyBuYW1lIFFTUEkxX0QzX0hPTEQg
b25lIGNhbm5vdCBzZWxlY3QgdGhlCj4+IHJpZ2h0IHBhZCBpbiBhIGRldmljZSB0cmVlIGJlY2F1
c2UgdGhlIG5hbWUgaXMgbm90IHVuaXF1ZS7CoFFTUEkxX0QzX0hPTEQgaXMKPj4gZGVmaW5lZCBp
biBwYWQgZ3JvdXAgMi4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgdGhlIHBhZCBuYW1lLgo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMKPj4gYi9kcml2ZXJz
L3BpbmN0cmwvcGluY3RybC10aDE1MjAuYwo+PiBpbmRleCBlNjQxYmFkNjcyOGMuLjgzZTljOWY3
NzM3MCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMKPj4g
KysrIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMKPj4gQEAgLTI4Nyw3ICsyODcs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBpbmN0cmxfcGluX2Rlc2MKPj4gdGgxNTIwX2dyb3Vw
M19waW5zW10gPSB7Cj4+ICDCoCDCoCDCoCDCoCBUSDE1MjBfUEFEKDUswqAgUVNQSTBfRDBfTU9T
SSwgUVNQSSwgUFdNLMKgIEkyUyzCoCBHUElPLCBfX19fLCBfX19fLAo+PiAwKSwKPj4gIMKgIMKg
IMKgIMKgIFRIMTUyMF9QQUQoNizCoCBRU1BJMF9EMV9NSVNPLCBRU1BJLCBQV00swqAgSTJTLMKg
IEdQSU8sIF9fX18sIF9fX18sCj4+IDApLAo+PiAgwqAgwqAgwqAgwqAgVEgxNTIwX1BBRCg3LMKg
IFFTUEkwX0QyX1dQLMKgIMKgUVNQSSwgUFdNLMKgIEkyUyzCoCBHUElPLCBfX19fLCBfX19fLAo+
PiAwKSwKPj4gLcKgIMKgIMKgIMKgVEgxNTIwX1BBRCg4LMKgIFFTUEkxX0QzX0hPTEQsIFFTUEks
IF9fX18sIEkyUyzCoCBHUElPLCBfX19fLCBfX19fLAo+PiAwKSwKPj4gK8KgIMKgIMKgIMKgVEgx
NTIwX1BBRCg4LMKgIFFTUEkwX0QzX0hPTEQsIFFTUEksIF9fX18sIEkyUyzCoCBHUElPLCBfX19f
LCBfX19fLAo+PiAwKSwKPj4gIMKgIMKgIMKgIMKgIFRIMTUyMF9QQUQoOSzCoCBJMkMyX1NDTCzC
oCDCoCDCoCBJMkMswqAgVUFSVCwgX19fXywgR1BJTywgX19fXywgX19fXywKPj4gMCksCj4+ICDC
oCDCoCDCoCDCoCBUSDE1MjBfUEFEKDEwLCBJMkMyX1NEQSzCoCDCoCDCoCBJMkMswqAgVUFSVCwg
X19fXywgR1BJTywgX19fXywgX19fXywKPj4gMCksCj4+ICDCoCDCoCDCoCDCoCBUSDE1MjBfUEFE
KDExLCBJMkMzX1NDTCzCoCDCoCDCoCBJMkMswqAgX19fXywgX19fXywgR1BJTywgX19fXywgX19f
XywKPj4gMCksCj4+IC0tLQo+Pgo+PiBCZXN0IHJlZ2FyZHMKPj4gVGhvbWFzCj4gSGVsbG8sIHRo
YW5rIHlvdSBjYXRjaGluZyB0aGlzIGFuZCBwcm92aWRpbmcgYSBmaXguIFRoZSBjaGFuZ2UgbG9v
a3MKPiBjb3JyZWN0IG1lLCBidXQgSSBiZWxpZXZlIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZyB3
aXRoIHRoZSBwYXRjaC4KPgo+IERpZCB5b3UganVzdCBwYXN0ZSBhIGRpZmYgaW50byBhbiBlbWFp
bD8KPgo+IEkgd291bGQgc3VnZ2VzdCB1c2luZyBnaXQgc2VuZC1lbWFpbC4gS2VybmVsTmV3Ymll
cyBbMV0gaGFzIHNvbWUgZ29vZAo+IHRpcHMgYXMgd2VsbCBhcyBOaWNrJ3MgZ3VpZGUgWzJdLgoK
WWVzLCBJIHBhc3RlZCB0aGUgcGF0Y2ggdG8gVGh1bmRlcmJpcmQgYW5kIGl0IGxvb2tzIHRoZSBt
YWlsIGNsaWVudCAKcmVmb3JtYXR0ZWQgdGhlIG1haWwgZHVyaW5nIHNlbmQuIEhvd2V2ZXIsIHRo
ZSBmaXggaXMgb25seSBhIHNpbmdsZSAKbGV0dGVyIGFuZCBjYW4gYmUgZG9uZSBlYXNpbHkgd2l0
aCBhbiBzaW1wbGUgdGV4dCBlZGl0b3IsIGp1c3QgY2hhbmdlIApRU1BJMSB0byBRU1BJMCBpbiB0
aGUgbGluZSBvZiBwYWQgOC4KCkknbSBuZXcgaW4gd29ya2luZyBvbiB0aGUgTGludXgga2VybmVs
IGJlY2F1c2Ugb2YgbXkgQmVhZ2xlVi1BaGVhZC4gTmV4dCAKdGltZSB3aGVuIEkgc2VuZCBhIHBh
dGNoIEkgd2lsbCB1c2UgZ2l0IHNlbmQtZW1haWwuCgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo+IFRo
YW5rcywKPiBEcmV3Cj4KPiBbMV0gaHR0cHM6Ly9rZXJuZWxuZXdiaWVzLm9yZy9GaXJzdEtlcm5l
bFBhdGNoCj4gWzJdIGh0dHBzOi8vbmlja2Rlc2F1bG5pZXJzLmdpdGh1Yi5pby9ibG9nLzIwMTcv
MDUvMTYvc3VibWl0dGluZy15b3VyLWZpcnN0LXBhdGNoLXRvLXRoZS1saW51eC1rZXJuZWwtYW5k
LXJlc3BvbmRpbmctdG8tZmVlZGJhY2svCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
