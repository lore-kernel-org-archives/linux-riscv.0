Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D272C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 06:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA8160F9C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 06:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AA8160F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8GNocxTGw9qbkJ+2r0BP5/SP31l1Zwwruqg4W8yI9g=; b=T5gi1FmjrJ44jrosksHqaW9I3f
	3wpSresBCrpdBMpiFH/hLsFQ6eoanf/ovLPRq9zCbSh5nPhQTuowqnUySdP5TiP3Ak5mrFQ0qsJ0Q
	dJrA5XeARzDvddBQKVE+nvEq6FC4jax+5AgsCA/dq2cqUfQgvTXj/t6kOLwvXG2QAEPviz22q7HZ5
	sbAe1DarF+huk8qLhJB33sjuIHxWNHsJL78qSWQG2s9vmdRy+Zm3qALQ4+YoQ+pdVFANBO85bFHtO
	CnGQSti4eYAC+AlMwmSZBvUXNC10MBCozdsthPtDFkvRA/npPQB3QzKudrwdZgajxJtobUDMvwsGQ
	EW9rdybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8d0y-00HFi9-HK; Wed, 28 Jul 2021 06:26:00 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8d0v-00HFhO-6X
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 06:25:59 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 54CD01C0002;
 Wed, 28 Jul 2021 06:25:48 +0000 (UTC)
Subject: Re: [PATCH -next] riscv: mm: remove redundant trampoline PGD for 64bit
To: "Sunnanyong (Nanyong Sun, Intelligent Computing Solution Development Dep)"
 <sunnanyong@huawei.com>, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, anup.patel@wdc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmerdabbelt@google.com, atish.patra@wdc.com, wangkefeng.wang@huawei.com
References: <20210527144819.12101-1-sunnanyong@huawei.com>
 <33f93026-cbd2-acd4-e737-c744207f82f2@ghiti.fr>
 <fe5c5f82-2528-caf9-9bd4-09987bdec05c@huawei.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <2e4ea006-5a8d-3578-1cba-363b7ba37e6d@ghiti.fr>
Date: Wed, 28 Jul 2021 08:25:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <fe5c5f82-2528-caf9-9bd4-09987bdec05c@huawei.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_232557_420703_9ACA5EF4 
X-CRM114-Status: GOOD (  21.51  )
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

SGkgTmFueW9uZywKCkxlIDI4LzA3LzIwMjEgw6AgMDU6MDksIFN1bm5hbnlvbmcgKE5hbnlvbmcg
U3VuLCBJbnRlbGxpZ2VudCBDb21wdXRpbmcgClNvbHV0aW9uIERldmVsb3BtZW50IERlcCkgYSDD
qWNyaXTCoDoKPiDlnKggMjAyMS82LzI5IDIxOjAxLCBBbGV4IEdoaXRpIOWGmemBkzoKPiAKPj4g
SGkgTmFueW9uZywKPj4KPj4gTGUgMjcvMDUvMjAyMSDDoCAxNjo0OCwgTmFueW9uZyBTdW4gYSDD
qWNyaXTCoDoKPj4+IFJlbW92ZSByZWR1bmRhbnQgdHJhbXBvbGluZSBQR0QgZm9yIDY0Yml0IGFu
ZCBhZGQgbW9yZSBjb21tZW50Cj4+PiBmb3Igd2h5IDMyYml0IHN5c3RlbXMgbmVlZCB0cmFtcG9s
aW5lIFBHRC4KPj4+Cj4+PiBUaGVyZSB3YXMgYSBwYXRjaCBhbmQgZGlzY3Vzc2lvbiBzaW1pbGFy
IHRvIHRoaXMscmVmZXIgdG8KPj4+IHRoZSBsaW5rIFsxXVsyXS4KPj4+Cj4+PiBUaGUgdHJhbXBv
bGluZSBQR0QgaXMgcmVkdW5kYW50IGZvciA2NGJpdCBzeXN0ZW1zIGJlY2F1c2U6Cj4+PiAxLiBU
aGUgZWFybHkgUEdEIGNvdmVycyB0aGUgZW50aXJlIGtlcm5lbCBtYXBwaW5nLiBEaXJlY3RseQo+
Pj4gbG9hZGluZyBlYXJseSBQR0QgY2FuIGFjaGlldmUgdGhlIHJlc3VsdCBpbiBib290IHN0YWdl
Lgo+Pj4gQSBtb3JlIHRyYW1wb2xpbmUgUEdEIG1ha2VzIGNvZGUgaGFyZCB0byB1bmRlcnN0YW5k
Lgo+Pj4gMi4gRGlyZWN0bHkgbG9hZGluZyBlYXJseSBQR0QgaXMgc2FmZSBpbiA2NGJpdCBzeXN0
ZW1zIHNpbmNlCj4+PiB0aGUga2VybmVsIHZpcnR1YWwgYWRkcmVzcyBzdGFydHMgYXMgMHhGRkZG
eHh4eHh4eHh4eHh4LAo+Pj4gd2hpY2ggaGFzIGEgdmVyeSBiaWcgZ2FwIHdpdGggUkFNIGFkZHJl
c3MuSXQgd29uJ3QgZmFsbCBpbnRvCj4+PiB0aGUgY29ybmVyIGNhc2UgdGhhdCAzMmJpdCBzeXN0
ZW0gd29ycnlzLgo+Pj4gMy4gUmVtb3ZlIHJlZHVuZGFudCB0cmFtcG9saW5lIFBHRCBjYW4gYmVu
ZWZpdCB0byBjb2RlIG1haW50YWluY2UsCj4+PiBiZWNhdXNlIDY0Yml0IHN5c3RlbXMgaGF2ZSBt
b3JlIHBhZ2UgdGFibGUgbGV2ZWxzLkZvciBleGFtcGxlOgo+Pj4gSWYgd2Ugd2FudCB0byBzdXBw
b3J0IFNWNDggd2hpY2ggaGFzIDQgcGFnZSB0YWJsZSBsZXZlbHMsIHdlIGhhdmUKPj4+IHRvIGFk
ZCBhIHRyYW1wb2xpbmVfcHVkIGFuZCBpbnNlcnQgaXQgYmVmb3JlIHRyYW1wb2xpbmVfcG1kLgo+
Pgo+PiBJIGRvIGFncmVlIHdpdGggeW91ciBsYXN0IHBvaW50IGFib3V0IGNvZGUgbWFpbnRlbmFu
Y2UgYW5kIHRoaXMgd291bGQgCj4+IGJlIGEgd2VsY29tZSBpbXByb3ZlbWVudCBiZWZvcmUgSSBy
ZXNwaW4gbXkgc3Y0OCBzZXJpZXMuCj4+Cj4+IFNvbWUgY29tbWVudHMgYmVsb3cgdGhvdWdoLgo+
Pgo+Pj4KPj4+IFJlZmVyZW5jZSBsaW5rOgo+Pj4gWzFdaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvMjAxOTAzMjUwOTIyMzQuNTQ1MS00LWFudXAucGF0ZWxAd2RjLmNvbS8gCj4+
Pgo+Pj4gWzJdaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMy8yOC8xNDcKPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBOYW55b25nIFN1biA8c3VubmFueW9uZ0BodWF3ZWkuY29tPgo+Pj4gLS0tCj4+
PiDCoCBhcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgfCAxMyArKysrKysrKysrKy0tCj4+PiDCoCBh
cmNoL3Jpc2N2L21tL2luaXQuY8KgwqDCoMKgIHwgMjEgKysrKysrKy0tLS0tLS0tLS0tLS0tCj4+
PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9oZWFkLlMKPj4+IGluZGV4IDg5Y2M1OGFiNTJiNC4uMTg5N2IxN2M1ZmNjIDEwMDY0
NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4+PiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9oZWFkLlMKPj4+IEBAIC05MywxMiArOTMsMTggQEAgcmVsb2NhdGU6Cj4+PiDCoMKg
wqDCoMKgIGFkZCBhMiwgYTIsIGExCj4+PiDCoMKgwqDCoMKgIGNzcncgQ1NSX1RWRUMsIGEyCj4+
Cj4+IFRoaXMgaXMgbm90IG5lZWRlZCBpbiA2NC1iaXQgdGhlbi4KPj4KPj4KPiBJJ20gYWZyYWlk
IHRoaXMgaXMgc3RpbGwgbmVlZGVkIGZvciA2NC1iaXQsIHdoaWNoIGNhbiBjb252ZXJ0IHRoZSAK
PiBwaHlzaWNhbCBhZGRyZXNzIHdvcmxkIHRvIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgd29ybGQuCj4g
Cj4gSSBhbHNvIGhhdmUgbWFkZSBhIGV4cGVyaW1lbnQsIGl0IGNvdWxkIG5vdCBib290IHVwIGlm
IHRoaXMgaXMgZGVsZXRlZC4KPiAKClllcyB5b3UncmUgcmlnaHQsIHNvcnJ5IGFib3V0IHRoYXQu
Cgo+PiBUaGFua3MsCj4+Cj4+IEFsZXgKPj4gLgo+IAo+IEhpIEFsZXgsCj4gCj4gIMKgwqDCoCBW
ZXJ5IHRoYW5rcyBmb3IgeW91ciBjYXJlZnVsbHkgcmV2aWV3LCBJIGhhdmUgdXBkYXRlZCB0byB2
ZXJzaW9uIAo+IHR3byBqdXN0IG5vdyA6ICkKPiAKPiAKClRoYW5rcywgSSdsbCB0YWtlIGEgbG9v
ay4KCkFsZXgKCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
