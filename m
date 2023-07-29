Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF72C0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jul 2023 07:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCHxYuIrLxxvz2rPGJnsYy7jc6wkiBFy91oW7nsPpzw=; b=CCYIyuHaX1qXAF
	1v/nMMHWsmcJeocOs1QjKRo2r/b3W3ejWDFDpFpSQUIoeRtWgoelE1AKcD8EGNFtqHxvao4wqD8K9
	281s+dKo9LpLsTO6BfdgrdYRAmtHmF3Rvz4TlknzMoJEseBpt2FVijQaRnIGUHcyqkcblmVQe7KQs
	iKcBsJEDC7JqlDvGf1086oKa81eCVeV2BQWpgjGd2I6RThI30EbBXuNPD7Wwn0voI3BI8RBzg8sBc
	to4T7LVCq8c9q/VF6ybD/Cxd3eHNTIyA3uOegpTj8VFt5jQvbjsPFGKc9daXMwlx1QnY+eHSmH4KI
	WEqVl1f/gsPEpj+rJmKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPe79-006cWb-2A;
	Sat, 29 Jul 2023 07:11:47 +0000
Received: from rivendell.linuxfromscratch.org ([208.118.68.85])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPe76-006cW3-27
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jul 2023 07:11:46 +0000
Received: from [192.168.124.11] (unknown [113.140.29.5])
	by rivendell.linuxfromscratch.org (Postfix) with ESMTPSA id D31131C1D3F;
	Sat, 29 Jul 2023 07:11:34 +0000 (GMT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.0 at rivendell.linuxfromscratch.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
	s=cert4; t=1690614701;
	bh=GtWup6G69OxGe9NTbfxKk/AU+VDZ7uQHTSJ8d2QGmfQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Bj1leRvNyevEtj8TzesgVIBZYbWbdWg23CPM/Xn5iwZyDxfdaMspe2ttJVf9hZnGl
	 q67wOPsfDIm7OX52dFItVqoytUuczsto/umSo/psLgv7r4ZD9lOLOEsSYQ9EhUaHPw
	 7PmcJ8PNVoml/FFf7xUuP+KZNzIlHDAvT5vKAvh7QZjceBnG4ipFEPv2ggBz9z4A8n
	 J+S47IMhVlhXBjpDiAO/QGKyTlf9osQwNKpIu3e2Pz8xxtIRCoqNA7hGgJCu8ZIywN
	 naYpGypcuG/4c4oKhZeryhCqS+HN6xw3CxyrsTIHlOJUvF7ju5vPx2rVhQ4X8MPbA2
	 mD0mxJ8IlVLpw==
Message-ID: <a4e5c82728d053b6888fdb6870ec69bd83cb6405.camel@linuxfromscratch.org>
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
From: Xi Ruoyao <xry111@linuxfromscratch.org>
To: Drew Fustini <dfustini@baylibre.com>, Emil Renner Berthing
	 <emil.renner.berthing@canonical.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,  Daniel
 Lezcano <daniel.lezcano@linaro.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org
Date: Sat, 29 Jul 2023 15:11:27 +0800
In-Reply-To: <ZMQAqUfb0y/igQs2@x1>
References: <3e0994dab495920ac590dc28d6b9d9765abe0c7e.camel@linuxfromscratch.org>
	 <ZME1J4mpVf5yth32@xhacker>
	 <866eab3e30a18c50742a75d62aee223fdc7e3cee.camel@linuxfromscratch.org>
	 <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
	 <ZMKXQpreSr47MFj6@xhacker>
	 <290101d386866f639a7c482527d7a78c5108d49b.camel@linuxfromscratch.org>
	 <ZMNojqwLxcG8FcHN@x1>
	 <af41edfe515373530d3d1ffc43c581131e6f6038.camel@linuxfromscratch.org>
	 <0f528aa0d4e6f2491835c9a78bb38dd162b75810.camel@linuxfromscratch.org>
	 <CAJM55Z9SeT_-5vDWVUAOKeNGZ0TmBPQMjdaZuyVcnbNJuxNCBQ@mail.gmail.com>
	 <ZMQAqUfb0y/igQs2@x1>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_001144_872275_D918235A 
X-CRM114-Status: GOOD (  26.31  )
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

T24gRnJpLCAyMDIzLTA3LTI4IGF0IDEwOjUzIC0wNzAwLCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4g
T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMTI6MjM6MTJQTSArMDIwMCwgRW1pbCBSZW5uZXIgQmVy
dGhpbmcgd3JvdGU6Cj4gPiBPbiBGcmksIDI4IEp1bCAyMDIzIGF0IDEyOjA3LCBYaSBSdW95YW8g
PHhyeTExMUBsaW51eGZyb21zY3JhdGNoLm9yZz4gd3JvdGU6Cj4gPiA+IAo+ID4gPiBPbiBGcmks
IDIwMjMtMDctMjggYXQgMTU6NDAgKzA4MDAsIFhpIFJ1b3lhbyB3cm90ZToKPiA+ID4gPiBPbiBG
cmksIDIwMjMtMDctMjggYXQgMDA6MDQgLTA3MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPiA+ID4g
PiA+IEl0IHNlZW1zIGxpa2UgeW91ciBrZXJuZWwgY29uZmlnIGlzIHRoZSBwcm9ibGVtLiBJIHVz
ZWQgaXQgYW5kIEkgc2F3Cj4gPiA+ID4gPiB0aGUgc2FtZSByZXN1bHQgb2YgYSBwYW5pYyBpbiBy
aXNjdl9pbnRjX2lycToKPiA+ID4gPiA+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3BkcDcvMWEy
NmViZTIwMDE3YTNiOTBjNGU5YzAwNWY4MTc4ZTEKPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyBp
cyB0aGUgY29uZmlnIEkgaGF2ZSBiZWVuIHVzaW5nIHN1Y2Nlc3NmdWxseToKPiA+ID4gPiA+IGh0
dHBzOi8vZ2lzdC5naXRodWIuY29tL3BkcDcvZWNiMzRiYTFlOTNmYzZjZmM0ZGNlNjZkNzFlMTRm
ODIKPiA+ID4gPiA+IAo+ID4gPiA+ID4gQ291bGQgeW91IHRyeSB0aGF0IGNvbmZpZz8KPiA+ID4g
PiA+IAo+ID4gPiA+ID4gTGludXggNi41LXJjMyBib290cyBva2F5IHdoZW4gYnVpbHQgd2l0aCBp
dDoKPiA+ID4gPiA+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3BkcDcvNTgwYjA3MmY5YTViZjli
ZTg3Y2Y4OGI1ZjgxZTUwZTMKPiA+ID4gPiAKPiA+ID4gPiBZZXMsIHlvdXIgY29uZmlndXJhdGlv
biB3b3Jrcy4KPiA+ID4gPiAKPiA+ID4gPiBJJ2xsIHRyeSB0byBmaWd1cmUgb3V0IHdoaWNoIHNw
ZWNpZmljIGNvbmZpZ3VyYXRpb24gaXRlbSBpcyBwcm9ibGVtYXRpYwo+ID4gPiA+IGluIG15IG9y
aWdpbiBvbmUuLi4KPiA+ID4gCj4gPiA+IEFoLCBJIGZvdW5kIGl0Li4uIElmIEkgZGVzZWxlY3Qg
Q09ORklHX0ZSQU1FX1BPSU5URVIgaXQgd2lsbCBjcmFzaC4KPiA+ID4gCj4gPiA+IEFuZCBJIHNl
ZSBSSVNDLVYgc2VsZWN0cyBBUkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMsIHNvIGl0IHNlZW1zIGZy
YW1lCj4gPiA+IHBvaW50ZXIgaXMgbWFuZGF0ZWQuwqAgQnV0IHRoZW4gd2h5IEknbSBhYmxlIHRv
IGRlc2VsZWN0Cj4gPiA+IENPTkZJR19GUkFNRV9QT0lOVEVSPwo+ID4gCj4gPiBZb3UndmUgcHJv
YmFibHkgcnVuIGludG8gdGhpcyBpc3N1ZToKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjMwNzE2MDAxNTA2LjM1MDYwNDEtMS1ndW9yZW5Aa2VybmVsLm9yZy8KPiA+
IAo+ID4gVHJ5IGFwcGx5aW5nIHRob3NlIHR3byBwYXRjaGVzLgo+ID4gCj4gPiAvRW1pbAo+IAo+
IFRoYW5rcywgSSB0aGluayB0aGF0IGZpeGVzIHRoZSBpc3N1ZSB3aXRoIENPTkZJR19GUkFNRV9Q
T0lOVEVSPW4uIEkgaGFkCj4gdGhlIHNhbWUga2VybmVsIGNyYXNoIFsxXSB3aGVuIHRyeWluZyB0
aGUgY29uZmlnIGZyb20gWGkgWzJdLgo+IAo+IEkganVzdCBkaWQgJ2I0IHNoYXphbSAyMDIzMDcx
NjAwMTUwNi4zNTA2MDQxLTEtZ3VvcmVuQGtlcm5lbC5vcmcnIGFuZAo+IHRoZSByaXNjdl9pbnRj
X2lycSBwYW5pYyBubyBsb25nZXIgb2NjdXJzIFszXS4gSSBkb24ndCBoYXZlIHRoZSBtbWMKPiBw
YXRjaGVzIGFwcGxpZWQgb24gdGhpcyBicmFuY2ggc28gdGhlIGJvb3QganVzdCBoYW5ncyBhdCBt
b3VudGluZyByb290ZnMKPiBidXQgSSB0aGluayBpdCBpcyBvdGhlcndpc2Ugb2theS4KCkFnYWlu
IHRoYW5rcyBmb3IgeW91ciBoZWxwISAgSSdtIGxvb2tpbmcgZm9yd2FyZCB0byB5b3VyIE1NQyBk
cml2ZXIgOikuCgo+IFsxXSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9wZHA3LzFhMjZlYmUyMDAx
N2EzYjkwYzRlOWMwMDVmODE3OGUxCj4gWzJdIGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3BkcDcv
YzZlMzU4YmU4OTJkNTA2ODI2YmUzMDRkY2MzNDZhN2EKPiBbM10gaHR0cHM6Ly9naXN0LmdpdGh1
Yi5jb20vcGRwNy84NzFhZGE0MzRmZWJlY2E0ZmY5M2YyMzgxMzUyYzAzOAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
