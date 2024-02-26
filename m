Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56013C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ux6LaqniYOUS5wgWdRew2gAxDE4TCYzEYTlV7exJ8Xo=; b=bER8Y3lR7/y3nF
	W/9L68PwOi4vKJ8+mvCCjrSy981Il1P94/0yc50CitUq3EAbLFwBCjJIhqOGtygKSICpir22ka9J/
	x50r22bM0vH66Ap8RpbQrm22CdqIAxBOlrUoYaV0xADSXwTxZfLHw51trUfH9YCZVqA01cwgkbQaR
	PGUdzctP9xDWTX9MrewL23SX00YDppGW1ZcMhGBcjhSyiPUL1+py9GFS8UxdQJUG5lexEIy0jE8SD
	t7c2zFDUl+oB38uhd9eXmH5KTrdgXv7UnQfZog3rYH8DIxtBOUivf/h1x0rxWIuJTsZPv+k7GpIod
	jzXfgdOA40HmnjDq4rzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1recQA-00000001HYp-0Oxk;
	Mon, 26 Feb 2024 14:57:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1recQ6-00000001HWi-3xAp
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 14:57:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D32DCE12B8;
	Mon, 26 Feb 2024 14:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8177AC433C7;
	Mon, 26 Feb 2024 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708959447;
	bh=sPrQVnmnSPaSkztqFXjNFHxol/WrC9nhR5tw9QxJAlg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PxbLvpIJEYlHpdr1A8xYVZRVEbIsK/+s101mjGkyPaiXKiPlcVWfV2SiMgC/jEhP+
	 pQ06pJ9ltxPT4xzdZVPbL5vPpsXFsMWNNY7WFaQchZgDkrqta2QfSXLaRZ+TMlXRsV
	 wcJseGzQbaBG4yMbJMQ8ctIV42ivMZcMBzyDTYsfYg4qytm99Bfyth0btOZvBHrzf5
	 NTsW19P3iTQp1Cu+X93N5fQ/whpRMnjv2RYLnoXDfR2z6Y/KXZPcq/x5K/NeMuSKKy
	 ro7+4jgNNjBpkEoEFsSxPksi74HqjL7p/YvTAkn7feRnNRHCW20UNUiGZCC5K0qFqz
	 wP7R/3P8DyLGQ==
Message-ID: <07675649-181a-4509-a595-d7ff9230e402@kernel.org>
Date: Mon, 26 Feb 2024 06:57:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Atish Patra <atishp@rivosinc.com>
References: <20240226140649.293254-1-cleger@rivosinc.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240226140649.293254-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_065731_355586_813C6C01 
X-CRM114-Status: GOOD (  18.91  )
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

T24gMjAyNC8wMi8yNiA2OjA2LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gRGVwcmVjYXRpb24g
b2YgTk9NTVUgc3VwcG9ydCBmb3IgcmlzY3Ygd2FzIGRpc2N1c3NlZCBkdXJpbmcgTFBDIDIwMjMK
PiBbMV0uIFJlYXNvbnMgZm9yIHRoaXMgaW52b2x2ZXMgbGFjayBvZiB1c2VycyBhcyB3ZWxsIGFz
IG1haW50ZW5hbmNlCj4gZWZmb3J0cyB0byBzdXBwb3J0IHRoaXMgbW9kZS4gcHNBQkkgRkRQSUMg
c3BlY2lmaWNhdGlvbiBhbHNvIG5ldmVyCj4gbWFkZSBpdCB1cHN0cmVhbSBhbmQgbGFzdCBwdWJs
aWMgbWVzc2FnZXMgb2YgdGhpcyBkZXZlbG9wbWVudCBzZWVtcyB0bwo+IGRhdGUgYmFjayBmcm9t
IDIwMjAgWzJdLiBQbGFuIHRoZSBkZXByZWNhdGlvbiB0byBiZSBkb25lIGluIDIgeWVhcnMgZnJv
bQo+IG5vdy4gTWFyayB0aGUgS2NvbmZpZyBvcHRpb24gYXMgZGVwcmVjYXRlZCBieSBhZGRpbmcg
YSBuZXcgZHVtbXkgb3B0aW9uCj4gd2hpY2ggZXhwbGljaXRseSBkaXNwbGF5cyB0aGUgZGVwcmVj
YXRpb24gaW4gY2FzZSBvZiBDT05GSUdfTU1VPW4uIFRoaXMgb3B0aW9uCj4gaXMgc2VsZWN0ZWQg
aW5kaXJlY3RseSBieSBDT05GSUdfUklTQ1ZfTV9NT0RFIHNpbmNlIGFuIG9wdGlvbiBjYW4gbm90
Cj4gc2VsZWN0IGFub3RoZXIgb25lIGRpcmVjdGx5IHdpdGggYSAic2VsZWN0IiBpbiBjYXNlIG9m
IHN1Y2ggQ09ORklHPW4uCj4gQWRkaXRpb25hbGx5LCBkaXNwbGF5IGEgcHJfZXJyKCkgbWVzc2Fn
ZSBhdCBib290IHRpbWUgaW4gY2FzZSBvZiBOT01NVQo+IGJ1aWxkIHRvIHdhcm4gYWJvdXQgdXBj
b21pbmcgZGVwcmVjYXRpb24uCj4gCj4gTGluazogaHR0cHM6Ly9scGMuZXZlbnRzL2V2ZW50LzE3
L2NvbnRyaWJ1dGlvbnMvMTQ3OC8gWzFdCj4gTGluazogaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNv
bS9hL2dyb3Vwcy5yaXNjdi5vcmcvZy9zdy1kZXYvYy9aallVSnN3a25RNC9tL1dZUlJ5bFR3QUFB
SiBbMl0KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5j
b20+Cj4gCj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgfCA4ICsrKysrKysrCj4g
IGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgfCA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2Fy
Y2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IGJmZmJkODY5YTA2OC4uOGRhNThjMTAyZDNmIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
IEBAIC0yMjEsNiArMjIxLDcgQEAgY29uZmlnIEFSQ0hfTU1BUF9STkRfQ09NUEFUX0JJVFNfTUFY
Cj4gICMgc2V0IGlmIHdlIHJ1biBpbiBtYWNoaW5lIG1vZGUsIGNsZWFyZWQgaWYgd2UgcnVuIGlu
IHN1cGVydmlzb3IgbW9kZQo+ICBjb25maWcgUklTQ1ZfTV9NT0RFCj4gIAlib29sCj4gKwlzZWxl
Y3QgTk9NTVUKPiAgCWRlZmF1bHQgIU1NVQo+ICAKPiAgIyBzZXQgaWYgd2UgYXJlIHJ1bm5pbmcg
aW4gUy1tb2RlIGFuZCBjYW4gdXNlIFNCSSBjYWxscwo+IEBAIC0yMzYsNiArMjM3LDEzIEBAIGNv
bmZpZyBNTVUKPiAgCSAgU2VsZWN0IGlmIHlvdSB3YW50IE1NVS1iYXNlZCB2aXJ0dWFsaXNlZCBh
ZGRyZXNzaW5nIHNwYWNlCj4gIAkgIHN1cHBvcnQgYnkgcGFnZWQgbWVtb3J5IG1hbmFnZW1lbnQu
IElmIHVuc3VyZSwgc2F5ICdZJy4KPiAgCj4gK2NvbmZpZyBOT01NVQo+ICsJZGVwZW5kcyBvbiAh
TU1VCj4gKwlib29sICJOT01NVSBrZXJuZWwgKERFUFJFQ0FURUQpIgo+ICsJaGVscAo+ICsJICBO
T01NVSBrZXJuZWwgaXMgZGVwcmVjYXRlZCBhbmQgaXMgc2NoZWR1bGVkIGZvciByZW1vdmFsIGJ5
Cj4gKwkgIHRoZSBiZWdpbm5pbmcgb2YgMjAyNy4KCjIgeWVhcnMgZnJvbSBub3cgaXMgMjAyNi4u
LgoKPiArCj4gIGNvbmZpZyBQQUdFX09GRlNFVAo+ICAJaGV4Cj4gIAlkZWZhdWx0IDB4QzAwMDAw
MDAgaWYgMzJCSVQgJiYgTU1VCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVw
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gaW5kZXggNGY3M2MwYWU0NGIyLi44Nzk5
ODE2ZWYwYTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiBAQCAtMjk1LDYgKzI5NSwxMCBAQCB2b2lkIF9f
aW5pdCBzZXR1cF9hcmNoKGNoYXIgKipjbWRsaW5lX3ApCj4gIAlyaXNjdl9zZXRfZG1hX2NhY2hl
X2FsaWdubWVudCgpOwo+ICAKPiAgCXJpc2N2X3VzZXJfaXNhX2VuYWJsZSgpOwo+ICsKPiArI2lm
ICFkZWZpbmVkKENPTkZJR19NTVUpCgoJaWYgKCFJU19FTkFCTEVEKENPTkZJR19NTVUpKQoKd291
bGQgYmUgbW9yZSBlbGVnYW50IGhlcmUuLi4KCj4gKwlwcl9lcnIoIlJJU0MtViBOT01NVSBzdXBw
b3J0IGlzIGRlcHJlY2F0ZWQgYW5kIHNjaGVkdWxlZCBmb3IgcmVtb3ZhbCBieSB0aGUgYmVnaW5u
aW5nIG9mIDIwMjdcbiIpOwoKV2h5IHByX2VycigpID8gcHJfd2FybigpIHNlZW1zIG1vcmUgYXBw
cm9wcmlhdGUuCgo+ICsjZW5kaWYKPiAgfQo+ICAKPiAgYm9vbCBhcmNoX2NwdV9pc19ob3RwbHVn
Z2FibGUoaW50IGNwdSkKCi0tIApEYW1pZW4gTGUgTW9hbApXZXN0ZXJuIERpZ2l0YWwgUmVzZWFy
Y2gKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
