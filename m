Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83868C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 11:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFAr19oR2Hko03WL10TUaM7/rQMy6FmIF3RD9GDL82w=; b=WZ/4zq6Eh6rtV7
	/z3rRnFvGwYtmUpW7whbg5FF8FvJfLMHCXFd4rP0/TCJ1NkVj5Q+2cFis9gpYBolVk/9EqC//gcnc
	8Ow5V4BWgUwoZPZfs8j2PgzPaBuM0ky/v6fclGwrIbZwGwFH4mtdxd0JQnwSrsjxIB0t4sVeNdpnr
	9VhgPEzI0AY6ULcwdtN3fcCBR6+HNvweA3pBJn4LLMtVG3HKCAz0DVpD8uw8vcMkha+YbmH5MlJFl
	sRXE2LzCtezLDXDIYNu879Czp3xAXvbQ0iAaBBDZX+u67g9b9hpKdfUT8uQ2OgjIFuNS2/Kozhw9V
	FKsh19SAS24tGOJkGbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVsDf-001WYy-0v;
	Tue, 15 Aug 2023 11:28:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVsDc-001WYe-2V
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 11:28:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16BCC60BFB;
	Tue, 15 Aug 2023 11:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09005C433C7;
	Tue, 15 Aug 2023 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692098891;
	bh=xdi1jGLMckK268j9IlNX+dC0+pe6CBw+0NcwYiCBDho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DIj0QdymeZXoFQsVArWxs4PylsATrt7Eci1reKiQXtiogv2DGQ49Wh46dwelnMaW2
	 aj64APvWWI0AUFJ+QEh/WI4yRcb4ikd8ZTs8iCn9ZTgE+R91Qca7MNTZ3TOKcyXO7W
	 cSWm8dGOFKL+VV1ClSs5C9FL9/B7DkztLMOWzE/Q9j+55hnGaucvle/GWPyXNgvHhu
	 03qnCz3QWanxROB1EoiSodTbyaWoS5/qu1qVte+D/P6ALtlZPS5FSw0+6lsQo7xV+a
	 bogUPj2F3x9lyf2j1TqTWxpK3J2WwKo03T7n/ots8OgyWn9apgK5FK3BI2zDBzX9CI
	 mPWwyjgZL/oxw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, paul.walmsley@sifive.com,
 guoren@linux.alibaba.com, anup@brainfault.org, atishp@atishpatra.org,
 heiko.stuebner@vrull.eu, Vincent Chen <vincent.chen@sifive.com>, Andy Chiu
 <andy.chiu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
 <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, =?utf-8?B?QmrDtnJuIFQ=?=
 =?utf-8?B?w7ZwZWw=?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Alexandre
 Ghiti <alexghiti@rivosinc.com>, Xianting Tian
 <xianting.tian@linux.alibaba.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Anup Patel <apatel@ventanamicro.com>,
 Jisheng Zhang <jszhang@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [v2, 2/5] riscv: Add support for kernel mode vector
In-Reply-To: <20230721112855.1006-3-andy.chiu@sifive.com>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
 <20230721112855.1006-3-andy.chiu@sifive.com>
Date: Tue, 15 Aug 2023 13:28:08 +0200
Message-ID: <87il9gee9j.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_042812_923223_1088B9FE 
X-CRM114-Status: GOOD (  19.32  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBGcm9tOiBHcmVlbnRp
bWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+Cj4gQWRkIGtlcm5lbF92ZWN0b3JfYmVn
aW4oKSBhbmQga2VybmVsX3ZlY3Rvcl9lbmQoKSBmdW5jdGlvbiBkZWNsYXJhdGlvbnMKPiBhbmQg
Y29ycmVzcG9uZGluZyBkZWZpbml0aW9ucyBpbiBrZXJuZWxfbW9kZV92ZWN0b3IuYwo+Cj4gVGhl
c2UgYXJlIG5lZWRlZCB0byB3cmFwIHVzZXMgb2YgdmVjdG9yIGluIGtlcm5lbCBtb2RlLgo+Cj4g
Q28tZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+IC0tLQo+IENo
YW5nZWxvZyB2MjoKPiAgLSAncy9rZXJuZWxfcnZ2L2tlcm5lbF92ZWN0b3InIGFuZCByZXR1cm4g
dm9pZCBpbiBrZXJuZWxfdmVjdG9yX2JlZ2luCj4gICAgKENvbm9yKQo+ICAtIGV4cG9ydCBtYXlf
dXNlX3NpbWQgdG8gaW5jbHVkZS9hc20vc2ltZC5oCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2ltZC5oICAgICAgICAgIHwgIDUwICsrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3ZlY3Rvci5oICAgICAgICB8ICAgMiArCj4gIGFyY2gvcmlzY3Yva2VybmVsL01h
a2VmaWxlICAgICAgICAgICAgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21v
ZGVfdmVjdG9yLmMgfCAxMDEgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNo
YW5nZWQsIDE1NCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NpbWQuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJu
ZWwva2VybmVsX21vZGVfdmVjdG9yLmMKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3NpbWQuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2ltZC5oCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmVmNzBhZjc4MDA1ZAo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NpbWQuaAo+IEBAIC0wLDAgKzEs
NTAgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLwo+ICsv
Kgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTcgTGluYXJvIEx0ZC4gPGFyZC5iaWVzaGV1dmVsQGxp
bmFyby5vcmc+Cj4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBTaUZpdmUKPiArICovCj4gKwo+ICsj
aWZuZGVmIF9fQVNNX1NJTURfSAo+ICsjZGVmaW5lIF9fQVNNX1NJTURfSAo+ICsKPiArI2luY2x1
ZGUgPGxpbnV4L2NvbXBpbGVyLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pcnFmbGFncy5oPgo+ICsj
aW5jbHVkZSA8bGludXgvcGVyY3B1Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wcmVlbXB0Lmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICsKPiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0Ff
Vgo+ICsKPiArREVDTEFSRV9QRVJfQ1BVKGJvb2wsIHZlY3Rvcl9jb250ZXh0X2J1c3kpOwo+ICsK
PiArLyoKPiArICogbWF5X3VzZV9zaW1kIC0gd2hldGhlciBpdCBpcyBhbGxvd2FibGUgYXQgdGhp
cyB0aW1lIHRvIGlzc3VlIHZlY3Rvcgo+ICsgKiAgICAgICAgICAgICAgICBpbnN0cnVjdGlvbnMg
b3IgYWNjZXNzIHRoZSB2ZWN0b3IgcmVnaXN0ZXIgZmlsZQo+ICsgKgo+ICsgKiBDYWxsZXJzIG11
c3Qgbm90IGFzc3VtZSB0aGF0IHRoZSByZXN1bHQgcmVtYWlucyB0cnVlIGJleW9uZCB0aGUgbmV4
dAo+ICsgKiBwcmVlbXB0X2VuYWJsZSgpIG9yIHJldHVybiBmcm9tIHNvZnRpcnEgY29udGV4dC4K
PiArICovCj4gK3N0YXRpYyBfX211c3RfY2hlY2sgaW5saW5lIGJvb2wgbWF5X3VzZV9zaW1kKHZv
aWQpCj4gK3sKPiArCS8qCj4gKwkgKiB2ZWN0b3JfY29udGV4dF9idXN5IGlzIG9ubHkgc2V0IHdo
aWxlIHByZWVtcHRpb24gaXMgZGlzYWJsZWQsCj4gKwkgKiBhbmQgaXMgY2xlYXIgd2hlbmV2ZXIg
cHJlZW1wdGlvbiBpcyBlbmFibGVkLiBTaW5jZQo+ICsJICogdGhpc19jcHVfcmVhZCgpIGlzIGF0
b21pYyB3LnIudC4gcHJlZW1wdGlvbiwgdmVjdG9yX2NvbnRleHRfYnVzeQo+ICsJICogY2Fubm90
IGNoYW5nZSB1bmRlciBvdXIgZmVldCAtLSBpZiBpdCdzIHNldCB3ZSBjYW5ub3QgYmUKPiArCSAq
IG1pZ3JhdGVkLCBhbmQgaWYgaXQncyBjbGVhciB3ZSBjYW5ub3QgYmUgbWlncmF0ZWQgdG8gYSBD
UFUKPiArCSAqIHdoZXJlIGl0IGlzIHNldC4KPiArCSAqLwo+ICsJcmV0dXJuICFpbl9pcnEoKSAm
JiAhaXJxc19kaXNhYmxlZCgpICYmICFpbl9ubWkoKSAmJgoKaW5faXJxKCkgaXMgZGVwcmVjYXRl
ZCwgdXNlIGluX2hhcmRpcnEoKSBpbnN0ZWFkLgoKQ291bGQgeW91IGVsYWJvcmF0ZSB3aHkgIWly
cXNfZGlzYWJsZWQoKSBpcyByZXF1aXJlZD8KCk5pdDogVXNlIHRoZSBmdWxsIDEwMCBjaGFycyBm
b3IgdGhlIGxpbmUuCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
