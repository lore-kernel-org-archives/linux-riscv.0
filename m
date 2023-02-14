Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA0CC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 09:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWNQGGLV8ZMTpr6ILXwn4oJ9uEwckRpStM454YASYUs=; b=vtlbLafo9MM8GC
	Scv1yIcUKmv6UytTodnscjOxb9xN1vpeZisJ82I5J8TosJp3Qz0V61PLeAD0z3jn+v73NTc7kUmPZ
	dnAOjsWosWSsJBaaT3ElTSPqkgK04ShQxjNHd+Q+a9XzCG0fqTWy/qy0C1QFSX4GDyIZdXmwjBtyn
	EGadn3TWh9VQEe1JjJYWFVujZQx4Nrxrg4pAXm4koLe3xJCsbHNQPfcG/8qoG2lsASV139wfDLn8j
	XTaZXWs00drlbmuWKNm0JstuUTuodAC9GVaK9rO0nrsBh0Rb+ZGhRtPNdjIWOY4kS9/XXt3khQZlQ
	5I2Cx9pEeLC10YW1u5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrQG-000gn0-13; Tue, 14 Feb 2023 09:16:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrQD-000gmE-0G
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 09:16:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 049C21042;
	Tue, 14 Feb 2023 01:16:58 -0800 (PST)
Received: from [10.57.15.75] (unknown [10.57.15.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 933723F703;
	Tue, 14 Feb 2023 01:16:12 -0800 (PST)
Message-ID: <9d83e21c-01c8-9729-0e2b-54d405b6b1ee@arm.com>
Date: Tue, 14 Feb 2023 09:16:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH bpf-next] selftests/bpf: Cross-compile bpftool
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org,
 netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-kselftest@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>,
 linux-riscv@lists.infradead.org, Quentin Monnet <quentin@isovalent.com>,
 linux-morello@op-lists.linaro.org
References: <20230210084326.1802597-1-bjorn@kernel.org>
 <87pmad63jb.fsf@all.your.base.are.belong.to.us>
From: Zachary Leaf <zachary.leaf@arm.com>
In-Reply-To: <87pmad63jb.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_011621_129786_8674FB2B 
X-CRM114-Status: GOOD (  12.82  )
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

T24gMTMvMDIvMjAyMyAxNDozMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBCasO2cm4gVMO2cGVs
IDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gCj4+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPj4KPj4gV2hlbiB0aGUgQlBGIHNlbGZ0ZXN0cyBhcmUgY3Jvc3Mt
Y29tcGlsZWQsIG9ubHkgdGhlIGEgaG9zdCB2ZXJzaW9uIG9mCj4+IGJwZnRvb2wgaXMgYnVpbHQu
IFRoaXMgdmVyc2lvbiBvZiBicGZ0b29sIGlzIHVzZWQgdG8gZ2VuZXJhdGUgdmFyaW91cwo+PiBp
bnRlcm1lZGlhdGVzLCBlLmcuLCBza2VsZXRvbnMuCj4+Cj4+IFRoZSB0ZXN0IHJ1bm5lcnMgYXJl
IGFsc28gdXNpbmcgYnBmdG9vbC4gVGhlIE1ha2VmaWxlIHdpbGwgc3ltbGluawo+PiBicGZ0b29s
IGZyb20gdGhlIHNlbGZ0ZXN0L2JwZiByb290LCB3aGVyZSB0aGUgdGVzdCBydW5uZXJzIHdpbGwg
bG9vawo+PiBmb3IgdGhlIHRvb2w6Cj4+Cj4+ICAgfCAuLi4KPj4gICB8ICQoUSlsbiAtc2YgJChp
ZiAkMiwuLiwuKS90b29scy9idWlsZC9icGZ0b29sL2Jvb3RzdHJhcC9icGZ0b29sIFwKPj4gICB8
ICAgICQoT1VUUFVUKS8kKGlmICQyLCQyLylicGZ0b29sCj4+Cj4+IFRoZXJlIGFyZSB0d28gaXNz
dWVzIGZvciBjcm9zcy1jb21waWxhdGlvbiBidWlsZHM6Cj4+Cj4+ICAxLiBUaGVyZSBpcyBubyBu
YXRpdmUgKGNyb3NzLWNvbXBpbGF0aW9uIHRhcmdldCkgYnVpbGQgb2YgYnBmdG9vbAo+PiAgMi4g
VGhlIGJvb3RzdHJhcCB2YXJpYW50IG9mIGJwZnRvb2wgaXMgbmV2ZXIgY3Jvc3MtY29tcGlsZWQg
KGJ5Cj4+ICAgICBkZXNpZ24pCj4+Cj4+IE1ha2Ugc3VyZSB0aGF0IGEgbmF0aXZlL2Nyb3NzLWNv
bXBpbGVkIHZlcnNpb24gb2YgYnBmdG9vbCBpcyBidWlsdCwKPj4gYW5kIGlmIENST1NTX0NPTVBJ
TEUgaXMgc2V0LCBzeW1saW5rIHRvIHRoZSBuYXRpdmUvbm9uLWJvb3RzdHJhcAo+PiB2ZXJzaW9u
Lgo+IAo+IC4uLmFuZCB0aGUgZ3JhbmQgbWFzdGVyIHBsYW4gaXMgdG8gYWRkIEJQRiBDSSBzdXBw
b3J0IGZvciByaXNjdjY0LCB3aGVyZQo+IHRoaXMgcGF0Y2ggYSBwcmVyZXF1aXNpdGUgdG8gWzFd
LiBJIHdvdWxkIHN1c3BlY3QgdGhhdCBvdGhlciBwbGF0Zm9ybXMKPiBtaWdodCBiZW5lZml0IGZy
b20gY3Jvc3MtY29tcGlsYXRpb24gYnVpbGRzIGFzIHdlbGwuCgpTaW1pbGFyIHVzZSBjYXNlLiBU
aGVyZSBhbHNvIHNlZW1zIHRvIGJlIGEgbG90IG9mIGlzc3VlcyBidWlsZGluZyB0aGVzZQp0ZXN0
cyBvdXQgb2YgdHJlZS4KCkkgaGF2ZSBzb21lIHBvdGVudGlhbCBmaXhlcyB1cCB0byA2LjEgYnV0
IGxpbnV4LW5leHQgc2VlbXMgdG8gaGF2ZQppbnRyb2R1Y2VkIGEgZmV3IG1vcmUgaXNzdWVzIG9u
IHRvcC4KCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9rZXJuZWwtcGF0Y2hlcy92bXRlc3Qv
cHVsbC8xOTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
