Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE56C44512
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 02:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41h3ziOJhHQFFsd96usjy/+ThZV3E4Hz7+ODTf80niE=; b=CsT8K3qeNoDB+B
	KPa2Y6YRHvw7Mo8emYqCbueDhng4SI+oNvWLuHZPgWe4/As6H9lahp2SEtcczmgtWC8MLKpQSlX5a
	Hhbh48WDZUlv7yEZJqKwkALbMetpHWz3dIBBYaxj0aaAes5SEeQ+0W9KyYfea3OTvNwSkBfT2xg0t
	rO2b53wL0kbPHaa+BDpfck+5HggFDKnCU34BbfbIVj3oP8GInqswc0lrZyOJr/UVxWTPAyKUpxtHr
	ldXWnAjZnlMQ3nMRCvsYbTgjgfXxOT07xgaTkPEDEk4xf3vPsKNjiq+wCc9z21BFWLf8mDHcGvcLg
	VB6rTZdz08wN+pUm07qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYga-00000000zt4-33k2;
	Fri, 17 Jul 2026 02:52:24 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYgX-00000000zse-3u9M
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 02:52:23 +0000
X-UUID: 848757c0818a11f1aa26b74ffac11d73-20260717
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6a28a301-fe4a-4a87-9769-c44122893332,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:10e6812197b47bb712ec1f1c4f19dbf6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|50,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 848757c0818a11f1aa26b74ffac11d73-20260717
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1511717193; Fri, 17 Jul 2026 10:52:15 +0800
Message-ID: <0676b1c8-b4e5-4118-9211-58fd57aa0439@kylinos.cn>
Date: Fri, 17 Jul 2026 10:52:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] bpf, riscv: add support for timed may_goto
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, Pu Lehui <pulehui@huawei.com>,
 Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260715-riscv-bpf-timed-may-goto-v3-0-cf2a9c3d843f@kylinos.cn>
 <20260715-riscv-bpf-timed-may-goto-v3-1-cf2a9c3d843f@kylinos.cn>
 <8733xjwe5a.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <8733xjwe5a.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_195222_291053_A6B47600 
X-CRM114-Status: GOOD (  16.46  )
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

T24gMjAyNi83LzE2IDE2OjA4LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEZlbmcgSmlhbmcgPGpp
YW5nZmVuZ0BreWxpbm9zLmNuPiB3cml0ZXM6Cj4gCj4+IEltcGxlbWVudCBhcmNoX2JwZl90aW1l
ZF9tYXlfZ290bygpIGZvciB0aGUgUlY2NCBKSVQuIFRoZSBhcmd1bWVudCBhbmQKPj4gcmV0dXJu
IHZhbHVlIGFyZSBjYXJyaWVkIGluIEJQRl9SRUdfQVgsIGFuZCBCUEYgUjAtUjUgYXJlIHByZXNl
cnZlZAo+PiBhY3Jvc3MgdGhlIGNhbGwgdG8gdGhlIGdlbmVyaWMgYnBmX2NoZWNrX3RpbWVkX21h
eV9nb3RvKCkuCj4+Cj4+IEVuYWJsZSBicGZfaml0X3N1cHBvcnRzX3RpbWVkX21heV9nb3RvKCkg
c28gdGhlIHZlcmlmaWVyIHVzZXMgdGhlIHRpbWVkCj4+IGV4cGFuc2lvbiBwYXRoLgo+IAo+IFRo
YW5rcyBmb3Igd29ya2luZyBvbiB0aGlzIQo+IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4g
aW5kZXggYzAzYzFkZTE2Yjc5Li40Zjg4YTQ0NjI3OGEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b21wNjQuYwo+PiBAQCAtMTg0MSw3ICsxODQxLDEzIEBAIGludCBicGZfaml0X2VtaXRfaW5zbihj
b25zdCBzdHJ1Y3QgYnBmX2luc24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+
PiAgCQlpZiAocmV0KQo+PiAgCQkJcmV0dXJuIHJldDsKPj4gIAo+PiAtCQlpZiAoaW5zbi0+c3Jj
X3JlZyAhPSBCUEZfUFNFVURPX0NBTEwpCj4+ICsJCS8qCj4+ICsJCSAqIGFyY2hfYnBmX3RpbWVk
X21heV9nb3RvKCkgaXMgZW1pdHRlZCBieSB0aGUgdmVyaWZpZXIgYW5kCj4+ICsJCSAqIHJldHVy
bnMgaXRzIHJlc3VsdCBpbiBCUEZfUkVHX0FYIGluc3RlYWQgb2YgQlBGX1JFR18wLCBzbwo+PiAr
CQkgKiBza2lwIHRoZSBub3JtYWwgIm1vdmUgcmV0dXJuIHJlZ2lzdGVyIGludG8gUjAiLgo+PiAr
CQkgKi8KPj4gKwkJaWYgKGluc24tPnNyY19yZWcgIT0gQlBGX1BTRVVET19DQUxMICYmCj4+ICsJ
CSAgICBhZGRyICE9ICh1NjQpYXJjaF9icGZfdGltZWRfbWF5X2dvdG8pCj4gCj4gTml0OiBJbiB0
aGUgZnV0dXJlLCBwbGVhc2UgdXNlIGZ1bGwgMTAwIGNoYXJzIGxpbmVzLCBpbnN0ZWFkIG9mIGJy
ZWFraW5nCj4gdGhlIGxpbmUuCj4gCj4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gYWRkIGEgdGVz
dCBmb3IgdGhpcyBjdXN0b20gQUJJPyBUaGUgZmFjdCB0aGF0IGl0Cj4gd2FzIG1pc3NlZCBpbiB2
MSBoaW50cyB0aGF0IGl0IHdvdWxkIGJlIGdvb2QuCj4gCj4gSSBhc2tlZCBhbiBMTE0gdG8gc3Vn
Z2VzdCBhIHRlc3QgWzFdLiBGZWVsIGZyZWUgdG8gYmUgaW5zcGlyZWQgYnkgaXQuCj4gOy0pCj4g
Cj4gCj4gQmrDtnJuCj4gCj4gWzFdIGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC9oaWRkZW4vOWRk
NzY5ZDYKClRoYW5rcyBCasO2cm4hIEknbGwgZml4IHRoZSBsaW5lIHdyYXAgYW5kIGFkZCBhIHRl
c3QgZm9yIHRoZSBjdXN0b20gQUJJLgpXaWxsIHNlbmQgYSB2NCBsYXRlci4KCi0tIApXaXRoIEJl
c3QgUmVnYXJkcywKRmVuZyBKaWFuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
