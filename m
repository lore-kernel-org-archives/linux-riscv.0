Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B08CD6E64
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=6mJZOZ7xHICKtvW1KpJGpTfLxYqqC1RhNb2NAwB7nuc=; b=OVd
	m+4/+j1iCaPTRcQeHYEcQL0AYR6wx0OLYg4922fMVjs1VogKAX7bru60waZTIA2q9PHhlRzQG7F1o
	LLKnCq1pd1tL7R0wcL/d+429br8Tyxm21zSmuvSxGVyrek+1WhzBPmTkwTrqT5zkgwOeiwt/lErhs
	81lt1dk2p1gkV7s/uneEbfEIlAEeJaELYRCWnCzj/iyuGq/NsGZVasJKJeJNSaElWCtJxdAlWpxbc
	Vd0FY72XEikdVMKAFTE3/cR9c1V92iQq1QZ/yQdBDFgpvk20aMs+m4Qor7Nn5B5OQuNfCUKPYoq8Q
	pCbaiVWsjfWlVarBQY08EUSa9zAT/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZ8P-00FxCo-30;
	Wed, 11 Oct 2023 13:20:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZ8N-00FxBg-0G
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 13:20:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A1787B820E2;
	Wed, 11 Oct 2023 13:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30A5C433C8;
	Wed, 11 Oct 2023 13:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697030417;
	bh=ykRmIq0tYqtR0xjYPm3Se7zVmdYlC2qR118zJz3huxs=;
	h=From:To:Cc:Subject:In-Reply-To:Date:From;
	b=S5Vn3o+ph/BX9PwI1wPXh1+oZ1OeiF3A64odPINfuclUol++eEMJ9LWcMGT9fmmul
	 8mIut7OvT2Y1vzGLM1kjixyWR6nol7ysbBuddEyzEw4REIlKuQ+jedWGuWz4WqkPrE
	 EQcIoJxWHyJOZRreb8Ih1S+F5VbdLZdep0SqZV2RyBYmBf4lgmqAZg0P8PCFxZ8tnE
	 cPKdoRqnugV6AtfJxhyMPDAVlucG2eFL/9ZNXZr2dlkBZmlyqDLiYScPM6im+BQUKL
	 5VQYBnn9R2fXOPXp19c7FmJ90sV3wPic/qQ2F39s0MLloL3QrequbO49R0UR42MXLJ
	 AyD31ui858PTA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 guoren@kernel.org, bjorn@rivosinc.com, conor.dooley@microchip.com,
 jszhang@kernel.org, andy.chiu@sifive.com, dave.hansen@linux.intel.com,
 elver@google.com, glider@google.com, cyphar@cyphar.com,
 kirill.shutemov@linux.intel.com, keescook@chromium.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH v6] riscv: add userland instruction dump
 to RISC-V splats
In-Reply-To: <CAEEQ3wkBACC2SdHQZYyVoXzGhd+=wHD9Hf5gL_Yhu1dWuXAVZQ@mail.gmail.com>
Date: Wed, 11 Oct 2023 15:20:14 +0200
Message-ID: <87jzrt70tt.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_062019_265504_EC46161C 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

eXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKCj4gSGkgQmrDtnJu
LAo+Cj4gT24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgODoxM+KAr1BNIEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRh
bmNlLmNvbT4gd3JpdGVzOgo+Pgo+PiA+IEFkZCB1c2VybGFuZCBpbnN0cnVjdGlvbiBkdW1wIGFu
ZCByZW5hbWUgZHVtcF9rZXJuZWxfaW5zdHIoKQo+PiA+IHRvIGR1bXBfaW5zdHIoKS4KPj4gPgo+
PiA+IEFuIGV4YW1wbGU6Cj4+ID4gWyAgICAwLjgyMjQzOV0gRnJlZWluZyB1bnVzZWQga2VybmVs
IGltYWdlIChpbml0bWVtKSBtZW1vcnk6IDY5MTZLCj4+ID4gWyAgICAwLjgyMzgxN10gUnVuIC9p
bml0IGFzIGluaXQgcHJvY2Vzcwo+PiA+IFsgICAgMC44Mzk0MTFdIGluaXRbMV06IHVuaGFuZGxl
ZCBzaWduYWwgNCBjb2RlIDB4MSBhdCAweDAwMDAwMDAwMDAwNWJlMTggaW4gYmJbMTAwMDArNWZi
MDAwXQo+PiA+IFsgICAgMC44NDA3NTFdIENQVTogMCBQSUQ6IDEgQ29tbTogaW5pdCBOb3QgdGFp
bnRlZCA1LjE0LjAtcmM0LTAwMDQ5LWdiZDY0NDI5MGFhNzItZGlydHkgIzE4Nwo+PiA+IFsgICAg
MC44NDEzNzNdIEhhcmR3YXJlIG5hbWU6ICAsIEJJT1MKPj4gPiBbICAgIDAuODQxNzQzXSBlcGMg
OiAwMDAwMDAwMDAwMDViZTE4IHJhIDogMDAwMDAwMDAwMDA3OWU3NCBzcCA6IDAwMDAwMDNmZmZj
YWZkYTAKPj4gPiBbICAgIDAuODQyMjcxXSAgZ3AgOiBmZmZmZmZmZjgxNmU5ZGM4IHRwIDogMDAw
MDAwMDAwMDAwMDAwMCB0MCA6IDAwMDAwMDAwMDAwMDAwMDAKPj4gPiBbICAgIDAuODQyOTQ3XSAg
dDEgOiAwMDAwMDAzZmZmYzlmZGYwIHQyIDogMDAwMDAwMDAwMDAwMDAwMCBzMCA6IDAwMDAwMDAw
MDAwMDAwMDAKPj4gPiBbICAgIDAuODQzNDM0XSAgczEgOiAwMDAwMDAwMDAwMDAwMDAwIGEwIDog
MDAwMDAwM2ZmZmNhMDE5MCBhMSA6IDAwMDAwMDNmZmZjYWZlMTgKPj4gPiBbICAgIDAuODQzODkx
XSAgYTIgOiAwMDAwMDAwMDAwMDAwMDAwIGEzIDogMDAwMDAwMDAwMDAwMDAwMCBhNCA6IDAwMDAw
MDAwMDAwMDAwMDAKPj4gPiBbICAgIDAuODQ0MzU3XSAgYTUgOiAwMDAwMDAwMDAwMDAwMDAwIGE2
IDogMDAwMDAwMDAwMDAwMDAwMCBhNyA6IDAwMDAwMDAwMDAwMDAwMDAKPj4gPiBbICAgIDAuODQ0
ODAzXSAgczIgOiAwMDAwMDAwMDAwMDAwMDAwIHMzIDogMDAwMDAwMDAwMDAwMDAwMCBzNCA6IDAw
MDAwMDAwMDAwMDAwMDAKPj4gPiBbICAgIDAuODQ1MjUzXSAgczUgOiAwMDAwMDAwMDAwMDAwMDAw
IHM2IDogMDAwMDAwMDAwMDAwMDAwMCBzNyA6IDAwMDAwMDAwMDAwMDAwMDAKPj4gPiBbICAgIDAu
ODQ1NzIyXSAgczggOiAwMDAwMDAwMDAwMDAwMDAwIHM5IDogMDAwMDAwMDAwMDAwMDAwMCBzMTA6
IDAwMDAwMDAwMDAwMDAwMDAKPj4gPiBbICAgIDAuODQ2MTgwXSAgczExOiAwMDAwMDAwMDAwZDE0
NGUwIHQzIDogMDAwMDAwMDAwMDAwMDAwMCB0NCA6IDAwMDAwMDAwMDAwMDAwMDAKPj4gPiBbICAg
IDAuODQ2NjE2XSAgdDUgOiAwMDAwMDAwMDAwMDAwMDAwIHQ2IDogMDAwMDAwMDAwMDAwMDAwMAo+
PiA+IFsgICAgMC44NDcyMDRdIHN0YXR1czogMDAwMDAwMDIwMDAwMDAyMCBiYWRhZGRyOiAwMDAw
MDAwMGYwMDI4MDUzIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDAyCj4+ID4gWyAgICAwLjg0ODIxOV0g
Q29kZTogZjA2ZiBmZjVmIDM4MjMgZmExMSAwMTEzIGZiMDEgMmUyMyAwMjAxIDAyOTMgMDAwMCAo
ODA1MykgZjAwMgo+PiA+IFsgICAgMC44NTEwMTZdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5n
OiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0ISBleGl0Y29kZT0weDAwMDAwMDA0Cj4+ID4KPj4gPiBT
aWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPj4KPj4g
UmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPgo+IENvdWxk
IHUgaGVscCB0byBtZXJnZSB0aGlzIHBhdGNoIGludG8gbGludXgtbmV4dD8gT3IgY2FuIGFueW9u
ZSBoZWxwCj4gdG8gbWVyZ2UgaXQ/CgpIZXkgWXVuaHVpLAoKVGhlIG5leHQgbWVyZ2Utd2luZG93
IG9wZW5zIHNvb24sIHNvIEknZCBndWVzcyBpdCdsbCBiZSBwaWNrZWQgdXAgdGhlbiEKCgpDaGVl
cnMsCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
