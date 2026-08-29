Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B88C61DCB
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 20:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfA15/7loAP+UpUB/0eSaiy4X7gcOtrLNH+HF/6Gddo=; b=U8Vz4Xzd0DlUha
	buuBdhUnx6hqtUcTMHo3z6lvpdrY+PLBa4LTnPAlPugpeWRh2diD0hXqr36bTPqzDcvfJCZKsaIlv
	Hgo01NpzUQLnMHtPeFY2qzgo77r4MWhzZK0e05gtcfR1KwrvMmypRkfh70Eeo6lU2c2TC3U3iapRn
	0B1+WTdvctL6PJ+3psbpqbOdiX2wAGp1EWxY6bszZqh7Jd9PUad1s1YP6cxY/2V6oQbv4JBdJ1lG4
	vjm1HojZj2K+XemMjCGQTeWWMxCnNWg2eUn52wvKf0bq2JxbunRMNt/R4B+V0iiyby88sV44h7RmF
	9Rpeui8D5QNsLccOYJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0PNj-00000007Hpl-2CKo;
	Sat, 29 Aug 2026 20:10:27 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0PNg-00000007HpI-2BYF
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 20:10:26 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 449E9C33D3;
	Sat, 29 Aug 2026 23:10:16 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 449E9C33D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788034217;
	bh=ZqxY1D+fzC3+wDVQotEIAuDf7u8tvsnBtIziyWtCx0M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aK3zuHTbhpNWq6uHwc7UtKDWf+dJE5LH64VqksnEnWXlWXtIOLB8PxwHJrv2tmVpQ
	 Imk+iBKtnnSppkyZ6dF8vkTsbdkBA06p16GIYzXGA5iWeEqVKMqRHwdX565jo/DToi
	 0rG7JAuheSc8IdLW60MNCLpxhwlvfo2SXTzESjx9JU4oqzMocGt52e2TcJG9dXMxPh
	 vEqZB7Rw1rCrjetLrjMq+U0Ou3KneOxpIybU+148cJVZXh2WJrIp2AppsIl1YrpgiP
	 /uKYGtCD7lct2Oa3EzCs3k5rgbmYE/rn5WNorewYEnphduIEf57aYqaCW5bVwcSuGa
	 JFWRo+GW28Ydw==
Message-ID: <1778ce7c2880eb5eb719932b5273776a57eea481.camel@rendec.net>
Subject: Re: [PATCH] irqchip/sifive-plic: Avoid signed shift in interrupt
 enable mask
From: Radu Rendec <radu@rendec.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>,  Charles Mirabile <cmirabil@redhat.com>, Lucas
 Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Sat, 29 Aug 2026 16:10:14 -0400
In-Reply-To: <20260825151000.1-plic-bit31-caplitmus-rv@iscas.ac.cn>
References: <20260825151000.1-plic-bit31-caplitmus-rv@iscas.ac.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_131024_752296_8013D3C7 
X-CRM114-Status: GOOD (  13.55  )
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDE1OjMzICswODAwLCBQZW5ncGVuZyBIb3Ugd3JvdGU6Cj4g
X19wbGljX3RvZ2dsZSgpIGJ1aWxkcyBhIDMyLWJpdCBlbmFibGUtcmVnaXN0ZXIgbWFzayBmcm9t
IHRoZSBoYXJkd2FyZQo+IGludGVycnVwdCBudW1iZXIuIEEgdmFsaWQgaW50ZXJydXB0IHdob3Nl
IGxvdyBmaXZlIGJpdHMgYXJlIDMxIGV2YWx1YXRlcwo+IDEgPDwgMzEsIHdoaWNoIHNoaWZ0cyBh
IHNpZ25lZCBpbnQgaW50byBpdHMgc2lnbiBiaXQgYW5kIGlzIHVuZGVmaW5lZAo+IGJlaGF2aW9y
Lgo+IAo+IFVzZSBCSVQoKSwgbWF0Y2hpbmcgdGhlIGVxdWl2YWxlbnQgbWFzayBjb25zdHJ1Y3Rp
b24gaW4gcGxpY19pcnFfZW9pKCkuCj4gCj4gRml4ZXM6IDE0ZmY5ZTU0ZGQxNCAoImlycWNoaXAv
c2lmaXZlLXBsaWM6IENhY2hlIHRoZSBpbnRlcnJ1cHQgZW5hYmxlIHN0YXRlIikKClRoYW5rcyBm
b3IgdGhlIHBhdGNoISBUaGUgcGF0Y2ggaXRzZWxmIGxvb2tzIGdvb2QgYnV0IHRoZSBGaXhlcyB0
YWcKYWJvdmUgZG9lcyBub3QgY29ycmVjdGx5IGlkZW50aWZ5IHRoZSBjb21taXQgdGhhdCBpbnRy
b2R1Y2VkIHRoZQpwcm9ibGVtYXRpYyBsaW5lLiBJcm9uaWNhbGx5LCB0aGF0J3Mgb25lIG9mIHRo
ZSBmZXcgbGluZXMgaW4gdGhhdApmdW5jdGlvbiB0aGF0IHdlcmUgKm5vdCogbW9kaWZpZWQgaW4g
dGhhdCBjb21taXQuCgpQbGVhc2UgdXNlICJnaXQgYmxhbWUiIHRvIGZpbmQgdGhlIHJpZ2h0IGNv
bW1pdCwgYW5kIHJlc2VuZCB0aGUgcGF0Y2gKd2l0aCBhIGNvcnJlY3QgRml4ZXMgdGFnLgoKPiBB
c3Npc3RlZC1ieTogQ29kZXg6Z3B0LTUKPiBTaWduZWQtb2ZmLWJ5OiBQZW5ncGVuZyBIb3UgPHBl
bmdwZW5nQGlzY2FzLmFjLmNuPgo+IC0tLQo+IMKgZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUt
cGxpYy5jIHwgMiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMu
YyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+IGluZGV4IDViMGRhYzEwNDgx
NC4uZDNkNDE4N2I5NmFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZl
LXBsaWMuYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+IEBAIC0x
MDgsNiArMTA4LDYgQEAgc3RhdGljIGludCBwbGljX2lycV9zZXRfdHlwZShzdHJ1Y3QgaXJxX2Rh
dGEgKmQsIHVuc2lnbmVkIGludCB0eXBlKTsKPiDCoHN0YXRpYyB2b2lkIF9fcGxpY190b2dnbGUo
c3RydWN0IHBsaWNfaGFuZGxlciAqaGFuZGxlciwgaW50IGh3aXJxLCBpbnQgZW5hYmxlKQo+IMKg
ewo+IMKgCXUzMiBfX2lvbWVtICpiYXNlID0gaGFuZGxlci0+ZW5hYmxlX2Jhc2U7Cj4gLQl1MzIg
aHdpcnFfbWFzayA9IDEgPDwgKGh3aXJxICUgMzIpOwo+ICsJdTMyIGh3aXJxX21hc2sgPSBCSVQo
aHdpcnEgJSAzMik7Cj4gwqAJaW50IGdyb3VwID0gaHdpcnEgLyAzMjsKPiDCoAl1MzIgdmFsdWU7
CgotLSAKUmVnYXJkcywKUmFkdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
