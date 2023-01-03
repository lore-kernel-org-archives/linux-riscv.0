Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27304C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbp178u47R0rP7bdx+aOehsTfOWbkQLJ5CmEUbm1XRE=; b=gwN+wWiLXmNTnQ
	Z/1XNFaSw9D8icAW4ZWeVXHiAmAbX7PP/RuPz6YKFfJ+6rpLwrIogTGwTyBaZqvpWTQCmZIj6Zf3u
	pCnJ+jZsqNEE6PE9+o7dDo8U3GV0L9iH99ntPdksKkDP4BiTNxnKBRsW2vKaejapGf119nCuwSia5
	iY1z/O6F684hmnYe9JK4qTu2oP4pePdtvq5Rlb6BrLFmcMUce6f8aIiBz+6Wekm097fV5/JjpznUq
	UuGuWXKIEOppw6VVKjD6PiuSP+v1v0AAy7z2ZMblKNctHTZOidW0MAtnsPosQ8cN/OAyUZVhmK8GU
	GP4szBd6a2SKzftBg1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdWa-000RpO-OJ; Tue, 03 Jan 2023 09:24:00 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdL8-000Q2I-RY
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 09:12:13 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id DFA53FF80E;
	Tue,  3 Jan 2023 09:11:56 +0000 (UTC)
Message-ID: <36314eb6-e41d-30b9-9ac4-12b88a108b7b@ghiti.fr>
Date: Tue, 3 Jan 2023 10:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH -next V12 3/7] riscv: entry: Add noinstr to prevent
 instrumentation inserted
Content-Language: en-US
To: guoren@kernel.org, arnd@arndb.de, palmer@rivosinc.com,
 tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
 conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
 lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
 apatel@ventanamicro.com, atishp@atishpatra.org, mark.rutland@arm.com,
 ben@decadent.org.uk, bjorn@kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
References: <20230103033531.2011112-1-guoren@kernel.org>
 <20230103033531.2011112-4-guoren@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230103033531.2011112-4-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_011211_101221_CDC4F37C 
X-CRM114-Status: GOOD (  20.15  )
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

SGkgR3VvLAoKT24gMS8zLzIzIDA0OjM1LCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiBGcm9t
OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4KPiBXaXRob3V0IG5vaW5zdHIg
dGhlIGNvbXBpbGVyIGlzIGZyZWUgdG8gaW5zZXJ0IGluc3RydW1lbnRhdGlvbiAodGhpbmsKPiBh
bGwgdGhlIGsqU0FOLCBLQ292LCBHQ292LCBmdHJhY2UgZXRjLi4pIHdoaWNoIGNhbiBjYWxsIGNv
ZGUgd2UncmUgbm90Cj4geWV0IHJlYWR5IHRvIHJ1biB0aGlzIGVhcmx5IGluIHRoZSBlbnRyeSBw
YXRoLCBmb3IgaW5zdGFuY2UgaXQgY291bGQKPiByZWx5IG9uIFJDVSB3aGljaCBpc24ndCBvbiB5
ZXQsIG9yIGV4cGVjdCBsb2NrZGVwIHN0YXRlLiAoYnkgcGV0ZXJ6KQo+Cj4gTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvWXhjUTZOb1BmM0FIMEVYZUBoaXJlei5wcm9n
cmFtbWluZy5raWNrcy1hc3MubmV0Lwo+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+Cj4gVGVzdGVkLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IC0tLQo+ICAgYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDQgKystLQo+ICAgYXJjaC9yaXNjdi9tbS9mYXVsdC5j
ICAgICB8IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gaW5kZXggNTQ5YmRlNWM5NzBhLi45NmVjNzZjNTRmZjIg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMKPiBAQCAtOTUsOSArOTUsOSBAQCBzdGF0aWMgdm9pZCBkb190cmFw
X2Vycm9yKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQgc2lnbm8sIGludCBjb2RlLAo+ICAgfQo+
ICAgCj4gICAjaWYgZGVmaW5lZChDT05GSUdfWElQX0tFUk5FTCkgJiYgZGVmaW5lZChDT05GSUdf
UklTQ1ZfQUxURVJOQVRJVkUpCj4gLSNkZWZpbmUgX190cmFwX3NlY3Rpb24JCV9fc2VjdGlvbigi
LnhpcC50cmFwcyIpCj4gKyNkZWZpbmUgX190cmFwX3NlY3Rpb24gX19ub2luc3RyX3NlY3Rpb24o
Ii54aXAudHJhcHMiKQo+ICAgI2Vsc2UKPiAtI2RlZmluZSBfX3RyYXBfc2VjdGlvbgo+ICsjZGVm
aW5lIF9fdHJhcF9zZWN0aW9uIG5vaW5zdHIKPiAgICNlbmRpZgo+ICAgI2RlZmluZSBET19FUlJP
Ul9JTkZPKG5hbWUsIHNpZ25vLCBjb2RlLCBzdHIpCQkJCVwKPiAgIGFzbWxpbmthZ2UgX192aXNp
YmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgbmFtZShzdHJ1Y3QgcHRfcmVncyAqcmVncykJXAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMK
PiBpbmRleCBkODZmN2NlYmQ0YTcuLmIyNmY2OGVhYzYxYyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L21tL2ZhdWx0LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiBAQCAtMjA0LDcg
KzIwNCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBhY2Nlc3NfZXJyb3IodW5zaWduZWQgbG9uZyBj
YXVzZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gICAgKiBUaGlzIHJvdXRpbmUgaGFu
ZGxlcyBwYWdlIGZhdWx0cy4gIEl0IGRldGVybWluZXMgdGhlIGFkZHJlc3MgYW5kIHRoZQo+ICAg
ICogcHJvYmxlbSwgYW5kIHRoZW4gcGFzc2VzIGl0IG9mZiB0byBvbmUgb2YgdGhlIGFwcHJvcHJp
YXRlIHJvdXRpbmVzLgo+ICAgICovCj4gLWFzbWxpbmthZ2Ugdm9pZCBkb19wYWdlX2ZhdWx0KHN0
cnVjdCBwdF9yZWdzICpyZWdzKQo+ICthc21saW5rYWdlIHZvaWQgbm9pbnN0ciBkb19wYWdlX2Zh
dWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQoKCihJIGR1ZyB0aGUgYXJjaGl2ZSBidXQgY2FuJ3Qg
ZmluZCB0aGUgc2VyaWVzIGJlZm9yZSB2NCwgc28gc29ycnkgaWYgaXQgCndhcyBhbHJlYWR5IGFu
c3dlcmVkKQoKSSB0aGluayB3ZSBzaG91bGQgbm90IGRpc2FibGUgdGhlIGluc3RydW1lbnRhdGlv
biBvZiB0aG9zZSB0cmFwIGhhbmRsZXJzIAphcyBhdCBsZWFzdCBwcm9maWxpbmcgdGhlbSB3aXRo
IGZ0cmFjZSB3b3VsZCBwcm92aWRlIHZhbHVhYmxlIAppbmZvcm1hdGlvbiAoYW5kIGdjb3Ygd291
bGQgYmUgbmljZSB0b28pOiB3aHkgZG8gd2UgbmVlZCB0byBkbyB0aGF0PyBBIAp0cmFwIHZlcnkg
ZWFybHkgaW4gdGhlIGJvb3QgcHJvY2VzcyBpcyBub3QgcmVjb3ZlcmFibGUgYW55d2F5LgoKQW5k
IEkgdG9vayBhIGxvb2sgYXQgb3RoZXIgYXJjaGl0ZWN0dXJlcywgbm9uZSBvZiB0aGVtIGRpc2Fi
bGVzIHRoZSAKaW5zdHJ1bWVudGF0aW9uIG9uIGRvX3BhZ2VfZmF1bHQuCgoKPiAgIHsKPiAgIAlz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRzazsKPiAgIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
