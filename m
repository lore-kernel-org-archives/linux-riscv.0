Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7C2C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZP4IeaxAZMALhqRrOlXcpbr76AeSp9NJ4acpibnaHqo=; b=sJfmy+53IvBQxm
	zEO++qbacUVVXPizqj8b/7mdgrbh8Q0jQGB947JYrnE/P3Gv0T/4NrLaOppXeDSI3uAxs3M7bGABR
	2h0TUHDYCqTnfJ+u7GsOAPDCME6kd8fHW4LY6NSdxeZJB/+zIHIwmorXX8sT3ykhHqdTou/kkMDCo
	ymhzfJYyV7tIbUPQWr0C94wldykkhSknVTInNLedU95aO4QGa8pKEdZWq+E7o3AdqtnhRdwdIubT0
	ForSk/qK7UxdRU+iUfVSy2wBDEVG75K8cNGQf7v7Vef3Oe8qNWraXbEfRSIrgilUtnzz0pZGorU/H
	o9mv28cB5lCjgGYwAK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAD7-00EdTq-VC; Wed, 01 Mar 2023 00:20:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAD4-00EdTI-Ee
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 00:20:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DE861B80EE6;
	Wed,  1 Mar 2023 00:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60500C433D2;
	Wed,  1 Mar 2023 00:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677630039;
	bh=5PUYaVCUEIzlyFQ1PECX/TblYbIvQl2OaQqQ0Z1W70s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=smZrsxG0SK/mfdR4SCQBaXISd6+Ry4n6tvEDzA4WRPcVYvNDcp3h/ZoYevCo1Qwqa
	 w1X3qxiXPxAqvTMdbVw0EcDq4/UKzFSGtlf4Vqi43X2fbArJONFB/IGSVu5FgsIUZO
	 rLM7MwvukCDCDhxxsv0Op2vyTFkQhfYZbo0sKh3tbE1bA6QeIECNaKpnTjnGywaap5
	 ttCWURiX6HEYEvuafotkHraIo+GXt1rvIAqYQhUGyWssn6MSKKd2ow6hLIZu2vkixP
	 fqngkXSdWwVDs66Ev8jU3z1EdZcBUtwszeDwf+lKPAseQg0fSmS5weC55dYCS0clKO
	 P1nM9CV4yAoKw==
Message-ID: <d641459e-c52b-c42e-dfcb-77bb978414f8@kernel.org>
Date: Wed, 1 Mar 2023 10:20:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/2] riscv: support ELF format binaries in nommu mode
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, damien.lemoal@opensource.wdc.com
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <mhng-20faeb04-8ed4-4759-8f13-aef3d2446d15@palmer-ri-x1c9a>
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <mhng-20faeb04-8ed4-4759-8f13-aef3d2446d15@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_162042_805230_3C866275 
X-CRM114-Status: GOOD (  25.30  )
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

SGkgUGFsbWVyLAoKT24gMS8zLzIzIDA3OjUyLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBU
dWUsIDI4IEZlYiAyMDIzIDA1OjUxOjI0IFBTVCAoLTA4MDApLCBnZXJnQGtlcm5lbC5vcmcgd3Jv
dGU6Cj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBhZGQgdGhlIGFiaWxpdHkgdG8gcnVuIEVMRiBm
b3JtYXQgYmluYXJpZXMgd2hlbgo+PiBydW5uaW5nIFJJU0MtViBpbiBub21tdSBtb2RlLiBUaGF0
IHN1cHBvcnQgaXMgYWN0dWFsbHkgcGFydCBvZiB0aGUKPj4gRUxGLUZEUElDIGxvYWRlciwgc28g
dGhlc2UgY2hhbmdlcyBhcmUgYWxsIGFib3V0IG1ha2luZyB0aGF0IHdvcmsgb24KPj4gUklTQy1W
Lgo+Pgo+PiBUaGUgZmlyc3QgaXNzdWUgdG8gZGVhbCB3aXRoIGlzIG1ha2luZyB0aGUgRUxGLUZE
UElDIGxvYWRlciBjYXBhYmxlIG9mCj4+IGhhbmRsaW5nIDY0LWJpdCBFTEYgZmlsZXMuIEFzIGNv
ZGVkIHJpZ2h0IG5vdyBpdCBvbmx5IHN1cHBvcnRzIDMyLWJpdAo+PiBFTEYgZmlsZXMuCj4+Cj4+
IFNlY29uZGx5IHNvbWUgY2hhbmdlcyBhcmUgcmVxdWlyZWQgdG8gZW5hYmxlIGFuZCBjb21waWxl
IHRoZSBFTEYtRkRQSUMKPj4gbG9hZGVyIG9uIFJJU0MtViBhbmQgdG8gcGFzcyB0aGUgRUxGLUZE
UElDIG1hcHBpbmcgYWRkcmVzc2VzIHRocm91Z2ggdG8KPj4gdXNlciBzcGFjZSB3aGVuIGV4ZWNp
bmcgdGhlIG5ldyBwcm9ncmFtLgo+Pgo+PiBUaGVzZSBjaGFuZ2VzIGhhdmUgbm90IGJlZW4gdXNl
ZCB0byBydW4gYWN0dWFsIEVMRi1GRFBJQyBiaW5hcmllcy4KPj4gSXQgaXMgdXNlZCB0byBsb2Fk
IGFuZCBydW4gbm9ybWFsIEVMRiAtIGNvbXBpbGVkIC1waWUgZm9ybWF0LiBUaG91Z2ggdGhlCj4+
IHVuZGVybHlpbmcgY2hhbmdlcyBhcmUgZXhwZWN0ZWQgdG8gd29yayB3aXRoIGZ1bGwgRUxGLUZE
UElDIGJpbmFyaWVzIGlmCj4+IG9yIHdoZW4gdGhhdCBpcyBzdXBwb3J0ZWQgb24gUklTQy1WIGlu
IGdjYy4KPj4KPj4gVG8gYXZvaWQgbmVlZGluZyBjaGFuZ2VzIHRvIHRoZSBDLWxpYnJhcnkgKHRl
c3RlZCB3aXRoIHVDbGliYy1uZwo+PiBjdXJyZW50bHkpIHRoZXJlIGlzIGEgc2ltcGxlIHJ1bnRp
bWUgZHluYW1pYyBsb2FkZXIgKGludGVycHJldGVyKQo+PiBhdmFpbGFibGUgdG8gZG8gdGhlIGZp
bmFsIHJlbG9jYXRpb25zLCBodHRwczovL2dpdGh1Yi5jb20vZ3JlZ3VuZ2VyZXIvdWxkc28uCj4+
IFRoZSBuaWNlIHRoaW5nIGFib3V0IGRvaW5nIGl0IHRoaXMgd2F5IGlzIHRoYXQgdGhlIHNhbWUg
cHJvZ3JhbQo+PiBiaW5hcnkgY2FuIGFsc28gYmUgbG9hZGVkIHdpdGggdGhlIHVzdWFsIEVMRiBs
b2FkZXIgaW4gTU1VIGxpbnV4Lgo+Pgo+PiBUaGUgbW90aXZhdGlvbiBoZXJlIGlzIHRvIHByb3Zp
ZGUgYW4gZWFzeSB0byB1c2UgYWx0ZXJuYXRpdmUgdG8gdGhlCj4+IGZsYXQgZm9ybWF0IGJpbmFy
aWVzIG5vcm1hbGx5IHVzZWQgZm9yIFJJU0MtViBub21tdSBiYXNlZCBzeXN0ZW1zLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBHcmVnIFVuZ2VyZXIgPGdlcmdAa2VybmVsLm9yZz4KPj4gLS0tCj4+Cj4+
IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMTEg
KysrKysrKysrLQo+PiDCoGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vbW11LmjCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgwqAgNCArKysKPj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNl
LmggfMKgwqDCoCA1ICsrKysKPj4gwqBmcy9LY29uZmlnLmJpbmZtdMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMiAtCj4+IMKgZnMvYmluZm10X2VsZl9mZHBp
Yy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDM4ICsrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgaW5jbHVkZS9saW51eC9lbGYtZmRwaWMuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMTQgKysrKysrKysrKystCj4+IMKgaW5jbHVkZS91YXBp
L2xpbnV4L2VsZi1mZHBpYy5owqDCoMKgwqDCoMKgIHzCoMKgIDE1ICsrKysrKysrKysrKysKPj4g
wqA3IGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+IAo+
IEFkZGluZyBEYW1pZW4sIGFzIElJUkMgaGUncyBoYWQgc29tZSBoYWNrZWQgdXAgdXNlcnNwYWNl
IGJpdHMgZm9yIHRoZSBLMjEwLsKgIEknbSB5ZXQgdG8gZ2V0IGFueXRoaW5nIHJ1bm5pbmcsIGJ1
dCBpdCdkIGJlIGdyZWF0IGlmIHdlIGdldCB0aGlzIHRvIGEgcG9pbnQgd2hlcmUgSSBjYW4gYWN0
dWFsbHkgYm9vdCB0ZXN0IHRoaXMgb24gUUVNVSAoSSdtIGp1c3QgZG9pbmcgYnVpbGRzIG5vdyku
CgpUaGlzIGlzIGEgc2ltcGxlIHNjcmlwdCBJIHVzZXIgdG8gZ2VuZXJhdGUgYSB3b3JraW5nIFFF
TVUgZXhhbXBsZToKCiAgIGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9ncmVndW5n
ZXJlci9zaW1wbGUtbGludXgvbWFzdGVyL2J1aWxkLXJpc2N2bm9tbXUtbGludXgtdWNsaWJjLWVs
Zi5zaAoKSXQgZG9lcyByZWZlcmVuY2Ugc29tZSBjb25maWdzIGhlcmUgaHR0cHM6Ly9naXRodWIu
Y29tL2dyZWd1bmdlcmVyL3NpbXBsZS1saW51eC90cmVlL21hc3Rlci9jb25maWdzCmFuZCB0aGlz
IHBvc3RlZCBwYXRjaHNldCBhcyBodHRwczovL2dpdGh1Yi5jb20vZ3JlZ3VuZ2VyZXIvc2ltcGxl
LWxpbnV4L3RyZWUvbWFzdGVyL3BhdGNoZXMgKHRoaXMgaXMKanVzdCB0aGVzZSAyIHBhdGNoZXMg
Y29tYmluZWQgYXMgYSBzaW5nbGUgcGF0Y2gpLgoKCj4gR2l2ZW4gdGhhdCBpdCdzIHRoZSBzZWNv
bmQgd2VlayBvZiB0aGUgbWVyZ2Ugd2luZG93IGFuZCB0aGlzIGlzIGEgYnVuY2ggb2YgbmV3IHVB
QkkgaXQgc2VlbXMgYmVzdCB0byBob2xkIG9mZiB1bnRpbCB0aGUgbmV4dCBjeWNsZS7CoCBJIHBv
a2VkIGFyb3VuZCBhbmQgZG9uJ3Qgc2VlIGFueXRoaW5nIHdyb25nLCBidXQgSSdsbCB0cnkgYW5k
IHRha2UgYSBtb3JlIGRldGFpbGVkIGxvb2sgYWZ0ZXIgdGhlIG1lcmdlIHdpbmRvdy4KCk9oLCB5
ZWFoLCBubyBodXJyeS4KClJlZ2FyZHMKR3JlZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
