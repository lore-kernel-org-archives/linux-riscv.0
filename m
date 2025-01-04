Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB90E77188
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2025 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5g1hu9SFS3ROUQPz7BlFZpviuZU8cR5/gza4tol4g6w=; b=zA0nT6Pcl0ZwTm
	uDMzdxkSAOv3L5E+NFNazL9BY3SVccuHd+ZAz5cbFclGE+/gZHhTzgdlIZW/Bblx7Qi4g4qw1UyiU
	/UlCShDG9C4iQaPR6HnTRKkfxD1sJyqBy1JbJGabPXq6tIi0Y/1pFTe3orY6tu7hNWuEM+gKh2Q11
	Mxfqw2HDJRG/TQYofEc94UUf1YEyZ9fycl3lIJFoBpj+IRMMsVd+hiVRIOkPTzTVtVFdahnBVraWn
	9kWQf6kROmiw8Rbni/Y+ybOoorxOcvhE+VK0Gv8S52C8VeB0wSWiTc1jQkGU3WG3lGHuCiB7uiOYK
	vIoLntHZPzx8IFButVdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0P7-0000000EmRo-2bux;
	Sat, 04 Jan 2025 09:25:09 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0OK-0000000EmNY-42FB
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jan 2025 09:24:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1735982657; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LYzSUnTJa4+qoqXwETQswTmLOFuX6In09090bCG1gD2Sk9LGFv/V8C3+HQPArzFcI3w/aW7JFHLaloHc9l0sH3mbHhb8Zd12fYouQe8SSO9ZNKZqqWadU8jyiMNgZ/1+KbuQfQcnIyFDjzOKivQpkDfJnN7ackmus2ktZElb0Oo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735982657; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qvEpx9tQfQXItdvKztc15oCP5fKt3Y58w8GW9qtlxlc=; 
	b=LxEVbyYg6TRMuoWTgQJHODAn3EtzKr2hJrINi/Cdk/FRo/vJCFTbav98k4Q0Z/2fAqLYOUubDrdosLyX0GXndVVRbRJfFMPhhVwv0qA3+qXjpYB1MdbYbGp39tuQEVDwhDergr/x+LWtVnar4E4gmLcLdLWchvsq0vMLLBNoMIM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735982657;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=qvEpx9tQfQXItdvKztc15oCP5fKt3Y58w8GW9qtlxlc=;
	b=BvyrZwoGiBVKgBl3FFntZi2FyBxA990DWQnHxO04kqKDrv7zpz8Y1RAwd57rMFYT
	Sp4IeQV3pl34bp4UevHIHFhMFR/n0BwNxBk6OQxIdGfjjsCeNer9jDcYcwCY8AX7oll
	8igGyH7i9/NwMHU3qnRr3en9PbRQ0hRcvBnsKVX8=
Received: by mx.zohomail.com with SMTPS id 1735982655010619.9969737293264;
	Sat, 4 Jan 2025 01:24:15 -0800 (PST)
Message-ID: <39e6bf64-2ce6-45bb-b622-4b413efc185f@zohomail.com>
Date: Sat, 4 Jan 2025 17:23:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Xukai Wang <kingxukai@zohomail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
 <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
 <zfjj33otyxiamsc7u2uwnvygcuhe7u2tfgiz6txp62emnddbw5@5iozmjg4eugn>
Content-Language: en-US
In-Reply-To: <zfjj33otyxiamsc7u2uwnvygcuhe7u2tfgiz6txp62emnddbw5@5iozmjg4eugn>
Feedback-ID: rr080112272919e6c0e1bd9cc03451a21400002fc0fb7a66b46d3058dff1e6030177366b5109484033fe1596:zu08011227921ab4ada6d5e1004a09b7cc0000070a5e76a6dd1681f716aa7fc6946386851f01117160353fc6:rf0801122c68307cbe1cf14e96e53fd7310000da8c39da26132efe406c58157136b906c4764e447eb07a30ab9ff330fafa:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_012421_054594_2F639FAA 
X-CRM114-Status: GOOD (  18.30  )
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

Ck9uIDIwMjQvMTIvMzAgMTU6NTQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gU3Vu
LCBEZWMgMjksIDIwMjQgYXQgMDk6MjE6MDhQTSArMDgwMCwgWHVrYWkgV2FuZyB3cm90ZToKPj4g
VGhpcyBwYXRjaCBhZGRzIHRoZSBEZXZpY2UgVHJlZSBiaW5kaW5nIGZvciB0aGUgY2xvY2sgY29u
dHJvbGxlcgo+PiBvbiBDYW5hYW4gazIzMC4gVGhlIGJpbmRpbmcgZGVmaW5lcyB0aGUgbmV3IGNs
b2NrcyBhdmFpbGFibGUgYW5kCj4+IHRoZSByZXF1aXJlZCBwcm9wZXJ0aWVzIHRvIGNvbmZpZ3Vy
ZSB0aGVtIGNvcnJlY3RseS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWHVrYWkgV2FuZyA8a2luZ3h1
a2FpQHpvaG9tYWlsLmNvbT4KPj4gLS0tCj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9j
ay9jYW5hYW4sazIzMC1jbGsueWFtbCB8IDQxICsrKysrKysrKysrKysrKysrKwo+PiAgaW5jbHVk
ZS9kdC1iaW5kaW5ncy9jbG9jay9rMjMwLWNsay5oICAgICAgICAgICAgICAgfCA0OSArKysrKysr
KysrKysrKysrKysrKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDkwIGluc2VydGlvbnMoKykKPiBQ
bGVhc2UgcnVuIHNjcmlwdHMvY2hlY2twYXRjaC5wbCBhbmQgZml4IHJlcG9ydGVkIHdhcm5pbmdz
LiBBZnRlciB0aGF0LAo+IHJ1biBhbHNvICdzY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1zdHJpY3Qn
IGFuZCAocHJvYmFibHkpIGZpeCBtb3JlCj4gd2FybmluZ3MuIFNvbWUgd2FybmluZ3MgY2FuIGJl
IGlnbm9yZWQsIGVzcGVjaWFsbHkgZnJvbSAtLXN0cmljdCBydW4sCj4gYnV0IHRoZSBjb2RlIGhl
cmUgbG9va3MgbGlrZSBpdCBuZWVkcyBhIGZpeC4gRmVlbCBmcmVlIHRvIGdldCBpbiB0b3VjaAo+
IGlmIHRoZSB3YXJuaW5nIGlzIG5vdCBjbGVhci4KQXBvbG9naWVzIGZvciBmb3JnZXR0aW5nIHRv
IHVzZSBgLS1zdHJpY3RgIHdpdGggYGNoZWNrcGF0Y2gucGxgLiBJIHdpbGwKcnVuIGl0IGFuZCBh
ZGRyZXNzIHRoZSB3YXJuaW5ncyBhY2NvcmRpbmdseSBiZWZvcmUgbmV4dCBzdWJtaXNzaW9uLgo+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Nh
bmFhbixrMjMwLWNsay55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Ns
b2NrL2NhbmFhbixrMjMwLWNsay55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4
IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmZmZDRlMGIwNTI0NTVi
ZjNkY2VkZDkzNTVkOTM3NjQxMTlkZjNkNjgKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2FuYWFuLGsyMzAtY2xrLnlhbWwK
Pj4gQEAgLTAsMCArMSw0MSBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAxLjIKPj4gKy0tLQo+PiArJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9jbG9jay9jYW5hYW4sazIzMC1jbGsueWFtbCMK
Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iwo+PiArCj4+ICt0aXRsZTogQ2FuYWFuIEtlbmRyeXRlIEsyMzAgQ2xvY2sKPj4gKwo+PiArbWFp
bnRhaW5lcnM6Cj4+ICsgIC0gWHVrYWkgV2FuZyA8a2luZ3h1a2FpQHpvaG9tYWlsLmNvbT4KPj4g
Kwo+PiArcHJvcGVydGllczoKPj4gKyAgY29tcGF0aWJsZToKPj4gKyAgICBjb25zdDogY2FuYWFu
LGsyMzAtY2xrCj4+ICsKPj4gKyAgY2xvY2tzOiAKPj4gKyAgICBjb25zdDogMQo+PiArCj4+ICsg
IHJlZzoKPj4gKyAgICBtYXhJdGVtczogMgo+PiArICAgIG1pbkl0ZW1zOiAxCj4gTGlzdCBhbmQg
ZGVzY3JpYmUgdGhlIGl0ZW1zIGluc3RlYWQuCgpPSywgdGhhbmsgeW91IGZvciB0aGUgc3VnZ2Vz
dGlvbi4gSSd2ZSBhZGRyZXNzZWQgdGhlIGZlZWRiYWNrIGFuZCBsaXN0ZWQKdGhlIGl0ZW1zIHVu
ZGVyIHJlZyB3aXRoIGRldGFpbGVkIGRlc2NyaXB0aW9ucy4KCkhlcmUncyB0aGUgdXBkYXRlIHZl
cnNpb246CgpyZWc6CsKgIGRlc2NyaXB0aW9uOiB8CsKgwqDCoCBUaGUgYHJlZ2AgcHJvcGVydHkg
c3BlY2lmaWVzIHRoZSBiYXNlIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlCmRldmljZSdzIHJlZ2lz
dGVycy4KwqDCoMKgIC0gVGhlIGZpcnN0IGFkZHJlc3MgY29ycmVzcG9uZHMgdG8gdGhlIGJhc2Ug
YWRkcmVzcyBvZiB0aGUgUExMCmNvbnRyb2wgcmVnaXN0ZXJzLgrCoMKgwqAgLSBUaGUgc2Vjb25k
IGFkZHJlc3MgY29ycmVzcG9uZHMgdG8gdGhlIGJhc2UgYWRkcmVzcyBvZiB0aGUgc3lzY2xrCmNv
bnRyb2wgcmVnaXN0ZXJzLgrCoCBtaW5JdGVtczogMQrCoCBpdGVtczoKwqDCoMKgIC0gZGVzY3Jp
cHRpb246IEJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgUExMIGNvbnRyb2wgcmVnaXN0ZXJz
LgrCoMKgwqAgLSBkZXNjcmlwdGlvbjogQmFzZSBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSBzeXNj
bGsgY29udHJvbCByZWdpc3RlcnMuCgpEb2VzIHRoaXMgY29udGVudCBsb29rIGFwcHJvcHJpYXRl
PwoKPj4gKwo+PiArICAnI2Nsb2NrLWNlbGxzJzoKPj4gKyAgICBjb25zdDogMQo+PiArCj4+ICty
ZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsgIC0gcmVnCj4+ICsgIC0gY2xvY2tzCj4+
ICsgIC0gJyNjbG9jay1jZWxscycKPj4gKwo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
Cj4+ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICBjbG9jay1jb250cm9sbGVyQDkx
MTAyMDAwIHsKPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJjYW5hYW4sazIzMC1jbGsiOwo+PiAr
ICAgICAgICByZWcgPSA8MHg5MTEwMjAwMCAweDEwMDA+LCA8MHg5MTEwMDAwMCAweDEwMDA+Owo+
PiArICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4+ICsgICAgICAgIGNsb2NrcyA9IDwmb3Nj
MjRtPjsKPj4gKyAgICB9Owo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9j
ay9rMjMwLWNsay5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9rMjMwLWNsay5oCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAuLjMxZDFmODJmYmNmZjY1NDA3MmVmMWE4OTg1YTg4NDM3N2Q4MDFlNzIKPj4g
LS0tIC9kZXYvbnVsbAo+PiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2syMzAtY2xr
LmgKPj4gQEAgLTAsMCArMSw0OSBAQAo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAqLwo+PiArLyoKPj4gKyAqIEtlbmRyeXRlIENh
bmFhbiBLMjMwIENsb2NrIERyaXZlcnMKPj4gKyAqCj4+ICsgKiBBdXRob3I6IFh1a2FpIFdhbmcg
PGtpbmd4dWthaUB6b2hvbWFpbC5jb20+Cj4+ICsgKi8KPj4gKwo+PiArI2lmbmRlZiBDTE9DS19L
MjMwX0NMS19ICj4+ICsjZGVmaW5lIENMT0NLX0syMzBfQ0xLX0gKPj4gKwo+PiArLyogS2VuZHJ5
dGUgSzIzMCBTb0MgY2xvY2sgaWRlbnRpZmllcnMgKGFyYml0cmFyeSB2YWx1ZXMpLiAqLwo+PiAr
I2RlZmluZQlLMjMwX0NQVTBfU1JDCQkJMAo+IERyb3AgdGhlIGluZGVudGF0aW9uIGFmdGVyICcj
ZGVmaW5lJwpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2suIEkgaGF2ZSByZW1vdmVkIHRoZSBp
bmRlbnRhdGlvbiBhZnRlciAjZGVmaW5lLgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
