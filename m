Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F03C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 07:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZmjCovX80EP2iDdGp2fsBUnkbEr3K+tbJDJ88g3ZME=; b=Mgk1QCX23MlcvK
	DA8ao66J0095I3YlYtRXUPNUpJUSsq0db9gHpFe5VHBXEpfgKvleOYWdQEcOIVx8TCUGU+Npfedcv
	X8vVKO5SeTQBI9TlNauR9VxEArZyBXnagOS37TUjA/MpA43nlab3nL1AsmGpTnQCiO4j6AB3D63gc
	kcQrpaRNf4s20Zu637N9bkIX4E38HiooON8tnVnlusZ2FIpCvciSTaLFGV/UWyJx9ynNviGY3T+9/
	0WEAGcjotOZLAvlXMsj2BbMTLiuCOxljTb6uzPAbd0HXEzB32TN2oxO89+c3hw0ZF8pNKgblm52Be
	aKRTJ5mr7LpThmhd9BaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNub-005nlg-8Z; Tue, 22 Nov 2022 07:41:45 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNuY-005nf6-3U
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 07:41:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669102896; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YqA87QW/3JpiBXgyEi1gDKmIXTOzfkgeskrWThHVTE0RU4KYBbUSNif8Yq3An2qcs6xPdK+de0Uq0akZOx6zd6elX4WnE4uj6F41Kx1qiPo40yjj+QuF663EwFt6y8bCPOwQM7c4ZOsqQXfQ4alnyxi6oUw1VqaUE6ItRGgIc00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669102896; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=b7Rx3DilGCP5lCz1j9EnhzYAfhA1dEnQkYpfsFyULHI=; 
	b=cO7egFhVwCWN1RbtDPLu8iKeqwMuCrqrCstEi/qtFyXJnQQt7fGUUmrIRIB/JGajK2Cq7nIMTlp7pQcK7mq0tlXsGHiQFeh+SQtLqv/NlWy3e4u8+FCeFf+tYiLbXeZOEO4ZJk6R0Ts4qg9mMBOOTXeZ0qrDx99AjTxX6nsdnfI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669102896;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=b7Rx3DilGCP5lCz1j9EnhzYAfhA1dEnQkYpfsFyULHI=;
	b=QGs2QRaSj4ngLjmlTGF03F2rC6ETgz/rwmuxWNjPybZ3seTFe5ktcgC+muA7qRfs
	+VRS/cQffh9aLTVBt7HrZt2P0YX6G0q7wbFRCle038WN1Zyv9C1H5tbY67otH9MNJjo
	MKadpz7RZ2mNgx9JbscAoCJYULO9PRJMLc7GJE0w=
Received: from [127.0.0.1] (112.94.100.29 [112.94.100.29]) by mx.zohomail.com
	with SMTPS id 1669102895638415.06106473348734; Mon, 21 Nov 2022 23:41:35 -0800 (PST)
Date: Tue, 22 Nov 2022 15:41:27 +0800
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/3=5D_dt-bindings=3A_timer=3A_si?= =?US-ASCII?Q?five=2Cclint=3A_add_compatible_for_OpenC906?=
User-Agent: K-9 Mail for Android
In-Reply-To: <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
References: <20221121041757.418645-1-uwu@icenowy.me> <20221121041757.418645-3-uwu@icenowy.me> <98005150-83a7-5439-0db1-d93d459c3809@linaro.org> <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me> <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
Message-ID: <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_234142_223997_137EF181 
X-CRM114-Status: GOOD (  11.02  )
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

Cgrkuo4gMjAyMuW5tDEx5pyIMjLml6UgR01UKzA4OjAwIOS4i+WNiDM6MzU6NDgsIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4g5YaZ5YiwOgo+T24g
MjIvMTEvMjAyMiAwODoxOCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4g5ZyoIDIwMjItMTEtMjHm
mJ/mnJ/kuIDnmoQgMTE6MDYgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93c2tp5YaZ6YGT77yaCj4+
PiBPbiAyMS8xMS8yMDIyIDA1OjE3LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+Pj4+IFQtSGVhZCBP
cGVuQzkwNiBpcyBhIG9wZW4tc291cmNlLWxpY2Vuc2VkIGZpeGVkLWNvbmZpZ3VyYXRpb24gb2YK
Pj4+PiBDOTA2LAo+Pj4+IHdoaWNoIGlzIG5vdyBwdWJsaWMgYW5kIGFibGUgdG8gYmUgaW50ZWdy
YXRlZC4KPj4+Pgo+Pj4+IEFkZCBhIGNvbXBhdGlibGUgZm9yIHRoZSBDTElOVCBzaGlwcGVkIGFz
IHBhcnQgb2YgT3BlbkM5MDYsIHdoaWNoCj4+Pj4gc2hvdWxkCj4+Pj4ganVzdCBiZSBvcmRpbmFy
eSBDOXh4IENMSU5ULgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1
QGljZW5vd3kubWU+Cj4+Pj4gLS0tCj4+Pj4gwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgfCAxICsKPj4+PiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdAo+Pj4+IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4+Pj4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPj4+
PiBpbmRleCBhYWRhNjk1NzIxNmMuLjg2NzAzZTk5NWUzMSAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPj4+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNs
aW50LnlhbWwKPj4+PiBAQCAtMzUsNiArMzUsNyBAQCBwcm9wZXJ0aWVzOgo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC0gY29uc3Q6IHNpZml2ZSxjbGludDAKPj4+PiDCoMKgwqDCoMKgwqAgLSBp
dGVtczoKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gdGhlYWQsb3BlbmM5MDYtY2xpbnQKPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gYWxsd2lubmVyLHN1bjIwaS1kMS1jbGludAo+Pj4KPj4+IEFkZCBl
bnRyaWVzIHNvcnRlZCBhbHBoYWJldGljYWxseS4gVGhpcyBzaG91bGQgYmUgc3F1YXNoZWQgd2l0
aAo+Pj4gcHJldmlvdXMKPj4+IHBhdGNoLgo+PiAKPj4gSSBtYWtlIGl0IGEgc2VwZXJhdGVkIHBh
dGNoIGJlY2F1c2UgSSB0aGluayBpdCdzIGEgcXVlc3Rpb25hYmxlCj4+IGFwcHJvYWNoLgo+PiAK
Pj4gSWYgeW91IHRoaW5rIGl0J3Mgb2theSwgSSB3aWxsIGp1c3Qgc3F1YXNoIGl0IGFuZCBwdXQg
aXQgYXMgdGhlIHNlY29uZAo+PiBwYXRjaCBpbiB0aGUgbmV4dCBpdGVyYXRpb24sIHdpdGggYWRk
aW5nIG9wZW5jOTA2LXBsaWMgYXMgdGhlIGZpcnN0Cj4+IG9uZS4KPgo+V2hhdCBpcyBhIHF1ZXN0
aW9uYWJsZSBhcHByb2FjaD8gV2h5IGNvbW1pdCBtc2cgaXMgbm90IHNheWluZyB0aGlzPwoKQWgg
SSBtZW50aW9uZWQgaXQgaW4gdGhlIGNvdmVyIGxldHRlci4gVGhlIHByb2JsZW0gaXMganVzdCBJ
IGRvdWJ0IHdoZXRoZXIKYmluZGluZyBzdHJpbmdzIGZvciBzaW5nbGUgU29DcyBhcmUgbmVjZXNz
YXJ5LgoKPgo+QmVzdCByZWdhcmRzLAo+S3J6eXN6dG9mCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
