Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080FCC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZqB2ZuZi+o+/EM33UOn79cag6v19qeLIwuc1WSxTb0=; b=TOsFKm9Fk220AB
	MsXylnB9VtFCfHhRUQLTdo/BjkwktlhCmF7Taf+OnnGQiZDfpISzp6tZmQh3dKUPNCzwZzOJotHkv
	l3VycZKjcyd3yLkM2qDDqLb2zeT2dnX6iJhrYLCxu/MabsIBxdRMRnY/0PzooMQXP4+oWE6RqPyVv
	DsxM1BfjvRXTpjyq1OQfOBihk7klzAVHRSy8RzCvQOYSOoiKw7rjt30dYF7Nn2m44b/S9BOFreBtF
	SwpDCEXALBVw4UOjCXhurXClkn8vTteIULexwiprmnyfoHtIwy8AVrtbGKAjJrlUUUSLw0f0NWXAZ
	1jh9MpZZPbKN9nPz+o+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5QH-009ypk-Gy; Wed, 04 Jan 2023 15:11:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD2N7-008vDT-12
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 11:55:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EBD51042;
	Wed,  4 Jan 2023 03:56:28 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.37.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C49E53F587;
	Wed,  4 Jan 2023 03:55:43 -0800 (PST)
Date: Wed, 4 Jan 2023 11:55:35 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, ben@decadent.org.uk, bjorn@kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH -next V12 3/7] riscv: entry: Add noinstr to prevent
 instrumentation inserted
Message-ID: <Y7VpN/fFjqGJbxPu@FVFF77S0Q05N>
References: <20230103033531.2011112-1-guoren@kernel.org>
 <20230103033531.2011112-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230103033531.2011112-4-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_035553_154668_CD7D20EB 
X-CRM114-Status: GOOD (  18.18  )
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

T24gTW9uLCBKYW4gMDIsIDIwMjMgYXQgMTA6MzU6MjdQTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IAo+
IFdpdGhvdXQgbm9pbnN0ciB0aGUgY29tcGlsZXIgaXMgZnJlZSB0byBpbnNlcnQgaW5zdHJ1bWVu
dGF0aW9uICh0aGluawo+IGFsbCB0aGUgaypTQU4sIEtDb3YsIEdDb3YsIGZ0cmFjZSBldGMuLikg
d2hpY2ggY2FuIGNhbGwgY29kZSB3ZSdyZSBub3QKPiB5ZXQgcmVhZHkgdG8gcnVuIHRoaXMgZWFy
bHkgaW4gdGhlIGVudHJ5IHBhdGgsIGZvciBpbnN0YW5jZSBpdCBjb3VsZAo+IHJlbHkgb24gUkNV
IHdoaWNoIGlzbid0IG9uIHlldCwgb3IgZXhwZWN0IGxvY2tkZXAgc3RhdGUuIChieSBwZXRlcnop
CgpUaGF0J3MgZ2VuZXJhbGx5IHRydWUsIGFuZCBtYWtlcyBzZW5zZSB0byBtZSwgYnV0IC4uLi4K
Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvWXhjUTZOb1BmM0FI
MEVYZUBoaXJlei5wcm9ncmFtbWluZy5raWNrcy1hc3MubmV0Lwo+IFJldmlld2VkLWJ5OiBCasO2
cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWps
c3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4gVGVzdGVkLWJ5OiBKaXNoZW5nIFpoYW5nIDxq
c3poYW5nQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4
LmFsaWJhYmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgNCArKy0tCj4gIGFyY2gvcmlz
Y3YvbW0vZmF1bHQuYyAgICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IGluZGV4IDU0OWJkZTVjOTcwYS4u
OTZlYzc2YzU0ZmYyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gQEAgLTk1LDkgKzk1LDkgQEAgc3RhdGlj
IHZvaWQgZG9fdHJhcF9lcnJvcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgaW50IHNpZ25vLCBpbnQg
Y29kZSwKPiAgfQo+ICAKPiAgI2lmIGRlZmluZWQoQ09ORklHX1hJUF9LRVJORUwpICYmIGRlZmlu
ZWQoQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFKQo+IC0jZGVmaW5lIF9fdHJhcF9zZWN0aW9uCQlf
X3NlY3Rpb24oIi54aXAudHJhcHMiKQo+ICsjZGVmaW5lIF9fdHJhcF9zZWN0aW9uIF9fbm9pbnN0
cl9zZWN0aW9uKCIueGlwLnRyYXBzIikKPiAgI2Vsc2UKPiAtI2RlZmluZSBfX3RyYXBfc2VjdGlv
bgo+ICsjZGVmaW5lIF9fdHJhcF9zZWN0aW9uIG5vaW5zdHIKPiAgI2VuZGlmCj4gICNkZWZpbmUg
RE9fRVJST1JfSU5GTyhuYW1lLCBzaWdubywgY29kZSwgc3RyKQkJCQlcCj4gIGFzbWxpbmthZ2Ug
X192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgbmFtZShzdHJ1Y3QgcHRfcmVncyAqcmVncykJ
XAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMgYi9hcmNoL3Jpc2N2L21tL2Zh
dWx0LmMKPiBpbmRleCBkODZmN2NlYmQ0YTcuLmIyNmY2OGVhYzYxYyAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiBAQCAt
MjA0LDcgKzIwNCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBhY2Nlc3NfZXJyb3IodW5zaWduZWQg
bG9uZyBjYXVzZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gICAqIFRoaXMgcm91dGlu
ZSBoYW5kbGVzIHBhZ2UgZmF1bHRzLiAgSXQgZGV0ZXJtaW5lcyB0aGUgYWRkcmVzcyBhbmQgdGhl
Cj4gICAqIHByb2JsZW0sIGFuZCB0aGVuIHBhc3NlcyBpdCBvZmYgdG8gb25lIG9mIHRoZSBhcHBy
b3ByaWF0ZSByb3V0aW5lcy4KPiAgICovCj4gLWFzbWxpbmthZ2Ugdm9pZCBkb19wYWdlX2ZhdWx0
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICthc21saW5rYWdlIHZvaWQgbm9pbnN0ciBkb19wYWdl
X2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQoKLi4uIHdoeSBkbyB5b3UgbmVlZCB0aGF0IGZv
ciBkb19wYWdlX2ZhdWx0PyBUaGF0IGRvZXNuJ3QgKGN1cnJlbnRseSkgZG8gYW55CmVudHJ5L2V4
aXQgbG9naWMsIHNvIHRoaXMgc2VlbXMgdW5uZWNlc3NhcnkgcGVyIHRoZSBjb21taXQgZGVzY3Jp
cHRpb24uCgpUaGFua3MsCk1hcmsuCgo+ICB7Cj4gIAlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzazsK
PiAgCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+IC0tIAo+IDIuMzYuMQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
