Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E47C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWbI0kObOthulO7zMVz+EEoHS8By885xHICFkXtvZ0s=; b=uiwD7TyDpiwcU1c1IhKENnKPdq
	UhUX0bTzKAEaLpMAmsw5a70fzIvN46fLV6/vHPjmAA/dtS1VTyGHru8k0cb9ezYQ5N2uStBs3urKz
	wR1NMeix+jWB81uVPL0Ns+HV1Kdo2BGHkCVnQ2YOwdzOrcx+xNrZ3utos6B/LTaTAnjDXEnjf4wAN
	Gzdma/HFr54/xJOIyyFjnx0MfcEhKyNqTWYmLqdAmQV9BDnC080+ZPoqvd+DZT4p+OliRUJEiaGl1
	6R9WsM6B12OKEA2RxCeN7PdgAfcwXA1HrRVlcALJrKITaMW0CjewPx45eu+4VgMchrWJ9RwSTMjlr
	vjuoyjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMsec-008XW4-2k; Tue, 31 Jan 2023 15:34:38 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMseZ-008XUS-3w
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 15:34:36 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 8755D100012;
	Tue, 31 Jan 2023 15:34:26 +0000 (UTC)
Message-ID: <b504f547-a1bf-3ba0-7fce-60bc48d89f65@ghiti.fr>
Date: Tue, 31 Jan 2023 16:34:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/1] riscv: Allow to downgrade paging mode from the
 command line
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230131151115.1972740-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230131151115.1972740-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_073435_312029_979E9361 
X-CRM114-Status: GOOD (  19.54  )
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

U29ycnksIEkgZm9yZ290IHRoZSBjaGFuZ2Vsb2cgYWdhaW46Cgp8djQ6IC0gUmVtb3ZlIHRoZSBr
YXNhbiBsaW1pdGF0aW9uIGJ5IGNvbXBpbGluZyAnbG9jYWwnIGZkdCBmdW5jdGlvbnMsIAphcyBk
b25lIGluIGFybTY0IGJ5IEFyZCAtIFJlbW92ZSBSQiBmcm9tIEJqw7ZybiBhcyB0aGUgY21kbGlu
ZSBoYW5kbGluZyAKY2hhbmdlZCB2MzogLSBNYXNzYWdlIGNvbW1pdCBsb2cgdG8gbWFrZSBubzRs
dmwgY2xlYXJlciwgYXMgYXNrZWQgYnkgCkNvbm9yIC0gQWRkIGEgbm90ZSB0byBrZXJuZWwtcGFy
YW1ldGVycy50eHQgcmVnYXJkaW5nIHRoZSBpbXBvc3NpYmlsaXR5IAp0byB1c2UgdGhvc2UgcGFy
YW1ldGVycyB3aGVuIEtBU0FOIGlzIGVuYWJsZWQsIGFzIHN1Z2dlc3RlZCBieSBDb25vciAtIApB
ZGQgUkIgZnJvbSBCasO2cm4gdjI6IC0gSG9ub3IgQ01ETElORV9FWFRFTkQgYW5kIENNRExJTkVf
Rk9SQ0UgYXMgCm5vdGljZWQgYnkgQmrDtnJufAoKT24gMS8zMS8yMyAxNjoxMSwgQWxleGFuZHJl
IEdoaXRpIHdyb3RlOgo+IFRoaXMgbmV3IHZlcnNpb24gZ2V0cyByaWQgb2YgdGhlIGxpbWl0YXRp
b24gdGhhdCBwcmV2ZW50ZWQgS0FTQU4ga2VybmVscwo+IHRvIHVzZSB0aGUgbmV3bHkgaW50cm9k
dWNlZCBwYXJhbWV0ZXJzLgo+Cj4gV2hpbGUgbG9va2luZyBpbnRvIEtBU0xSLCBJIGZlbGwgb250
byBjb21taXQgYWFjZDE0OWI2MjM4ICgiYXJtNjQ6IGhlYWQ6Cj4gYXZvaWQgcmVsb2NhdGluZyB0
aGUga2VybmVsIHR3aWNlIGZvciBLQVNMUiIpOiBpdCBhbGxvd3MgdG8gdXNlIHRoZSBmZHQKPiBm
dW5jdGlvbnMgdmVyeSBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzIHdpdGggS0FTQU4gZW5hYmxl
ZCBieSBzaW1wbHkKPiBjb21waWxpbmcgYSBuZXcgdmVyc2lvbiBvZiB0aG9zZSBmdW5jdGlvbnMg
d2l0aG91dCBpbnN0cnVtZW50YXRpb24uCj4KPiBJIGhhZCB0byBjaGFuZ2UgdGhlIGhhbmRsaW5n
IG9mIHRoZSBjb21tYW5kIGxpbmUgcGFyc2luZyB0byBtYWtlIHRoZQo+IGNvZGUgc2VsZi1jb250
YWluZWQgaW4ga2VybmVsL3BpL2NtZF9lYXJseS5jIHRvIGF2b2lkIGNhbGxpbmcgdG9vIG1hbnkK
PiBfX3BpIHByZWZpeGVkIGZ1bmN0aW9ucyBmcm9tIG91dHNpZGUgdGhpcyBmaWxlLgo+Cj4gSSds
bCB1c2UgdGhpcyBhcHByb2FjaCBsaWtlIGFybTY0IHRvIGhhbmRsZSB0aGUgZXh0cmFjdGlvbiBv
ZiB0aGUgcmFuZG9tCj4gc2VlZGkgZnJvbSB0aGUgZGV2aWNlIHRyZWUgZm9yIEtBU0xSLgo+Cj4g
QEFyZDogSSBjb3BpZWQgdGhlICJwaSIgbmFtZSBidXQgSSBoYXZlIHRvIGFkbWl0IEkgZG9uJ3Qg
a25vdyB3aGF0IGl0Cj4gbWVhbnMuCj4KPiBBbGV4YW5kcmUgR2hpdGkgKDEpOgo+ICAgIHJpc2N2
OiBBbGxvdyB0byBkb3duZ3JhZGUgcGFnaW5nIG1vZGUgZnJvbSB0aGUgY29tbWFuZCBsaW5lCj4K
PiAgIC4uLi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8ICA1ICst
Cj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMiAr
Cj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9waS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAzNCAr
KysrKysrKysrKysKPiAgIGFyY2gvcmlzY3Yva2VybmVsL3BpL2NtZGxpbmVfZWFybHkuYyAgICAg
ICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysKPiAgIGFyY2gvcmlzY3YvbGliL21lbWNweS5T
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKPiAgIGFyY2gvcmlzY3YvbGliL21lbW1vdmUu
UyAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKPiAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDM2ICsrKysrKysrKystLS0KPiAgIDcgZmlsZXMgY2hh
bmdlZCwgMTI2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvcGkvTWFrZWZpbGUKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBhcmNoL3Jpc2N2L2tlcm5lbC9waS9jbWRsaW5lX2Vhcmx5LmMKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
