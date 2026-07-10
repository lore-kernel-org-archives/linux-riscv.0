Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB2EC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 01:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKfuoEOl6aElOQv9MiQBNk2Ni2UssOWyawLBwRQu1Ag=; b=rAiwEZHNwAi6aC
	YjAjzrkrriomw36JQnwDBaYPPeKxYGB58tjNLvibOo2ou3ztklfU2mgI4sq+A2NomEJ8MOH2pHn9+
	9Xl4g1AJElaxMU5Zce1xI6b2RtMksPVsvADoQnaL+KBcTCZ4G3A0Ci0BwQABhm7mV5fy7roecK16w
	un5hO0frBElbedENuGy8KuoybXjPfzYa7NQCCQxVvbKpjsEAvXfrgjGkknyoLkbGF2tkngOPgFN2r
	hMOFRQ3XtEP65xcDywml8zkiCxPLCiZv3bysY+78wXHdU1mKI+EPAwS9RvzDVsR1SL+t1DoF3lUrs
	oGT3nykb9Uey1We3Vmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzll-00000003u9e-2Dl0;
	Fri, 10 Jul 2026 01:11:09 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzli-00000003u9F-1TDr
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 01:11:08 +0000
X-UUID: 35ec4dac7bfc11f1aa26b74ffac11d73-20260710
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:71b5238d-519d-42c1-96c0-3c245c376d54,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1237003babe3a477118e7027bc06823f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 35ec4dac7bfc11f1aa26b74ffac11d73-20260710
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1339851726; Fri, 10 Jul 2026 09:10:59 +0800
Message-ID: <53a8635f-3215-40eb-b48f-f46df0e6cf1c@kylinos.cn>
Date: Fri, 10 Jul 2026 09:10:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: spacemit: fix spurious IRQ handling returning
 IRQ_HANDLED
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, andi.shyti@kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
References: <aaba8ba228a99f580050004c5b7e262d855de44c.1783590752.git.xiaopei01@kylinos.cn>
 <1783645601561936.18899.seg@mailgw.kylinos.cn>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <1783645601561936.18899.seg@mailgw.kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_181106_696919_EB86BA61 
X-CRM114-Status: GOOD (  12.74  )
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

CgrlnKggMjAyNi83LzkgMTg6MTYsIFRyb3kgTWl0Y2hlbGwg5YaZ6YGTOgo+IE9uIFRodSBKdWwg
OSwgMjAyNiBhdCAyOjU0IEFNIFBEVCwgUGVpIFhpYW8gd3JvdGU6Cj4+IFdoZW4gdGhlIGludGVy
cnVwdCBzdGF0dXMgcmVnaXN0ZXIgcmVhZHMgemVybyAobm8gaW50ZXJydXB0IHBlbmRpbmcKPj4g
ZnJvbSB0aGlzIGRldmljZSksIHRoZSBoYW5kbGVyIHNob3VsZCByZXR1cm4gSVJRX05PTkUuIFJl
dHVybmluZwo+PiBJUlFfSEFORExFRCBpbmNvcnJlY3RseSBjbGFpbXMgdGhlIGludGVycnVwdCB3
YXMgc2VydmljZWQsIHdoaWNoIGNhbgo+PiBwcmV2ZW50IG90aGVyIGRldmljZXMgc2hhcmluZyB0
aGUgc2FtZSBJUlEgbGluZSBmcm9tIHJlY2VpdmluZyB0aGVpcgo+PiBpbnRlcnJ1cHRzLgo+Pgo+
PiBGaXggdGhpcyBieSByZXR1cm5pbmcgSVJRX05PTkUgaW5zdGVhZCBvZiBJUlFfSEFORExFRCB3
aGVuIHRoZQo+PiBzdGF0dXMgcmVnaXN0ZXIgaXMgemVyby4KPiBUaGUgY2hhbmdlIGdvZXMgaW4g
dGhlIHJpZ2h0IGRpcmVjdGlvbiwgYnV0IHRoZSByYXRpb25hbGUgaW4gdGhlCj4gY29tbWl0IG1l
c3NhZ2UgZG9lc24ndCBob2xkLCBhbmQgSSB0aGluayB0aGUgY2hlY2sgaXRzZWxmIGNhbiBiZQo+
IGltcHJvdmVkLgo+Cj4gVGhpcyBkcml2ZXIgcmVxdWVzdHMgaXRzIElSUSB3aXRob3V0IElSUUZf
U0hBUkVEIChzZWUKPiBzcGFjZW1pdF9pMmNfcHJvYmUoKSwgd2hpY2ggcGFzc2VzIG9ubHkgSVJR
Rl9OT19TVVNQRU5EKSwgc28gdGhlcmUKPiBhcmUgbm8gIm90aGVyIGRldmljZXMgc2hhcmluZyB0
aGUgc2FtZSBJUlEgbGluZSIgdG8gYmVnaW4gd2l0aC4KPiBFdmVuIG9uIGEgZ2VudWluZWx5IHNo
YXJlZCBsaW5lLCB0aGUga2VybmVsIGludm9rZXMgZXZlcnkgaGFuZGxlcgo+IHJlZ2lzdGVyZWQg
b24gdGhlIGxpbmUgcmVnYXJkbGVzcyBvZiB3aGF0IHByZXZpb3VzIGhhbmRsZXJzIHJldHVybiwK
PiBzbyBJUlFfSEFORExFRCBjYW5ub3QgcHJldmVudCBvdGhlciBoYW5kbGVycyBmcm9tIHJ1bm5p
bmcuClRoYW5rcyBmb3IgcG9pbnRpbmcgb3V077yBCj4KPiBXaGF0IHRoZSByZXR1cm4gdmFsdWUg
YWN0dWFsbHkgZmVlZHMgaW50byBpcyB0aGUgc3B1cmlvdXMgaW50ZXJydXB0Cj4gYWNjb3VudGlu
ZyBpbiBub3RlX2ludGVycnVwdCgpOiBmYWxzZWx5IGNsYWltaW5nIElSUV9IQU5ETEVEIGRlZmVh
dHMKPiB0aGUgImlycSBYWDogbm9ib2R5IGNhcmVkIiBkZXRlY3Rpb24sIHNvIGEgc3R1Y2sgaW50
ZXJydXB0IHNvdXJjZQo+IHdvdWxkIG5ldmVyIGJlIGNhdWdodC4gVGhhdCBhcHBsaWVzIHRvIGRl
ZGljYXRlZCBsaW5lcyBhcyB3ZWxsLCBhbmQKPiBpcyB0aGUgcmVhbCBqdXN0aWZpY2F0aW9uIGZv
ciB0aGlzIGNoYW5nZS4KPgo+IENvdWxkIHlvdSByZXdvcmsgdGhlIGNoZWNrIGFuZCB0aGUgY29t
bWl0IG1lc3NhZ2UgYW5kIHNlbmQgYSB2Mj8KeWVzLCBJIHdpbGwgY2hlY2sgYWdhaW4gYW5kIHNl
bmQgYSB2Mi4KClRoYW5rcyHCoApQZWkuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0gVHJveQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
