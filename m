Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ECBCD98CE
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vL2eeuQbZlI7ubGMirEcFWGiV4O/QBUiryC6TKOlcYA=; b=s2lwDIzDuBUVet
	6gQurGBOd888XcNpc8a152BfAihj5PybIGPnHdHA/Ad8Z2/aYDqnDYi14dTib7EKsIzgTVny0UVt7
	s/ehGv0RqtIwr3HylcE3cFnXQD5owuGSvVWIOXB6b/TQDKq91dxDV7Ta24Z+E8pLgtSuib86CVfRx
	gTOk3wHmW/OZGM/JZV6csJbxGh4rX1cJFu7tK4PXG6BZWCExisyeiFAOTn2aYFRitYSvxzT3Walei
	9E5LhG7CKr2+iVCCeyTy1Cinu5w1quEK04afBYp4NniXNe5eyJrZHTHE4ePnjrifqPDPz0p2YgPum
	GhgxuZcPtKCU7FSxMXbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwbK-0000000AUdr-1prv;
	Fri, 12 Jun 2026 07:46:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwbI-0000000AUdN-1r6J;
	Fri, 12 Jun 2026 07:46:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D16B743684;
	Fri, 12 Jun 2026 07:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68651F000E9;
	Fri, 12 Jun 2026 07:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781250407;
	bh=wsHqcKwo5977UKsycGEh8MAYVcFHAquPzMtiUyoer6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G+1QaXUCq74YYvlVOgn/Ru3J12byjHh3oF1trnV981cS8ZSh9VtCGlEcXiRceS0W6
	 IhRSby5DNEkviGLbN1SJZptVd+Wb/RffOlOwE1U+cFRwqF18XDv85vCbSHbM7+5/sm
	 ZJVjKw3nQftPFdVwiHE5wpG8sVvghI4L+wmFDV4YkBs95Lw8BE64SN38qzA3aYMtOl
	 8gOo8rbJsRMkdZE+zW4NFVpPJKluCb+Mi3j8kkfeNi9kReI4EBo06U7Qnmvvo9n5rK
	 J0h1wU6VurMB/ZF/CcGpHyeIPLFwdZxhS1OatXGHm3KmYVsRvP2CkmHWxP3azrFqlR
	 HzDiFLG4oNUMA==
Date: Fri, 12 Jun 2026 09:46:41 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 6/6] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
Message-ID: <aiu5YU+Yn1DekE+E@lpieralisi>
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
 <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMDgsIDIwMjYgYXQgMDc6MTg6MTVQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMywgMjAyNiBhdCAxMDoyMeKAr0FNIExvcmVuem8gUGll
cmFsaXNpIDxscGllcmFsaXNpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFJlZ2lzdGVyIGFu
IEFDUEkgaG9vayBpbiB0aGUgQUNQSSBpbnRlcnJ1cHQgbWFuYWdlbWVudCBjb2RlIGZvciBHSUN2
NSB0bwo+ID4gcmV0cmlldmUgdGhlIEFDUEkgaW50ZXJydXB0IGNvbnRyb2xsZXIgaGFuZGxlIChp
ZiBhbnkpIG9mIHRoZSBjb250cm9sbGVyCj4gPiBoYW5kbGluZyBhIHNwZWNpZmljIEdTSSwgYnkg
dXBkYXRpbmcgdGhlIGFjcGlfc2V0X2lycV9tb2RlbCgpIGNhbGwgd2l0aAo+ID4gdGhlIGdpY192
NV9nZXRfZ3NpX2hhbmRsZSgpIGZ1bmN0aW9uIHBvaW50ZXIgcGFyYW1ldGVyLgo+ID4KPiA+IGdp
Y3Y1X2dldF9nc2lfaGFuZGxlKCkgYWxsb3dzIEFDUEkgY29yZSB0byBkZXRlY3QgdGhlIEFDUEkg
aGFuZGxlCj4gPiBvZiB0aGUgY29udHJvbGxlciB0aGF0IG1hbmFnZXMgYSBzcGVjaWZpYyBHU0kg
aW50ZXJydXB0Lgo+ID4KPiA+IFVwZGF0ZSB0aGUgSVdCIGRyaXZlciB0byBjbGVhciBkZXZpY2Ug
ZGVwZW5kZW5jaWVzIGluIEFDUEkgY29yZSBvbmNlIHRoZQo+ID4gSVdCIGRyaXZlciBoYXMgcHJv
YmVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFsaXNp
QGtlcm5lbC5vcmc+Cj4gPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+Cj4g
PiBDYzogTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
aXJxY2hpcC9pcnEtZ2ljLXY1LWl3Yi5jIHwgIDUgKysrKysKPiA+ICBkcml2ZXJzL2lycWNoaXAv
aXJxLWdpYy12NS5jICAgICB8IDEzICsrKysrKysrKysrLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LWl3Yi5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMt
djUtaXdiLmMKPiA+IGluZGV4IDkxMDNmZWI3MGNlOC4uYTAyY2I5NTM3YjE1IDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjUtaXdiLmMKPiA+ICsrKyBiL2RyaXZlcnMv
aXJxY2hpcC9pcnEtZ2ljLXY1LWl3Yi5jCj4gPiBAQCAtMjY5LDYgKzI2OSwxMSBAQCBzdGF0aWMg
aW50IGdpY3Y1X2l3Yl9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiA+ICAgICAgICAgaWYgKElTX0VSUihpd2Jfbm9kZSkpCj4gPiAgICAgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIoaXdiX25vZGUpOwo+ID4KPiA+ICsjaWZkZWYgQ09ORklHX0FDUEkKPiA+ICsg
ICAgICAgaWYgKGhhc19hY3BpX2NvbXBhbmlvbigmcGRldi0+ZGV2KSkKPiA+ICsgICAgICAgICAg
ICAgICBhY3BpX2Rldl9jbGVhcl9kZXBlbmRlbmNpZXMoQUNQSV9DT01QQU5JT04oJnBkZXYtPmRl
dikpOwo+ID4gKyNlbmRpZgo+IAo+IEkgd291bGQgcmF0aGVyIGFkZCBhIHdyYXBwZXIgZm9yIHRo
aXMsIGFsb25nIHdpdGggYW4gZW1wdHkgc3R1YiBmb3IKPiB0aGUgIUNPTkZJR19BQ1BJIGNhc2Uu
CgpHaXZlbiB0aGF0IHRoaXMgaGFzIG5vIE9GIGNvdW50ZXJwYXJ0LCBJJ2QgcmF0aGVyIGFkZCBh
biBlbXB0eSBzdHViCmZvciBhY3BpX2Rldl9jbGVhcl9kZXBlbmRlbmNpZXMoKSBhbmQgcmVtb3Zl
IHRoZSBpZmRlZiAtIEkgYW0gbm90CnN1cmUgdGhhdCBhZGRpbmcgYSBGVyBhZ25vc3RpYzoKCmRl
dl9jbGVhcl9kZXBlbmRlbmNpZXMoKQoKd291bGQgaGVscCBtdWNoIGJ1dCB0aGF0J3MganVzdCBt
eSBvcGluaW9uLiBUaGVuIHRoZSBxdWVzdGlvbiBpcyB3aGV0aGVyIEkKc2hvdWxkIGNvbnZlcnQg
YWxsIG90aGVyIGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcygpIHVzZXJzICh3aXRoIGlmZGVm
ZmVyeQppbmNsdWRlZCkgaW4gdHJlZS4KClRoYW5rcywKTG9yZW56bwoKPiAKPiA+ICsKPiA+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNo
aXAvaXJxLWdpYy12NS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjUuYwo+ID4gaW5kZXgg
MDNjYzI4MzBiMjYwLi4yNmNmYWVhMWFmNDEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lycWNo
aXAvaXJxLWdpYy12NS5jCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jCj4g
PiBAQCAtMTIxNywxMSArMTIxNywxOSBAQCBzdGF0aWMgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmdz
aV9kb21haW5faGFuZGxlOwo+ID4gIHN0YXRpYyBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZ2ljX3Y1
X2dldF9nc2lfZG9tYWluX2lkKHUzMiBnc2kpCj4gPiAgewo+ID4gICAgICAgICBpZiAoRklFTERf
R0VUKEdJQ1Y1X0dTSV9JQ19UWVBFLCBnc2kpID09IEdJQ1Y1X0dTSV9JV0JfVFlQRSkKPiA+IC0g
ICAgICAgICAgICAgICByZXR1cm4gaW9ydF9pd2JfaGFuZGxlKEZJRUxEX0dFVChHSUNWNV9HU0lf
SVdCX0ZSQU1FX0lELCBnc2kpKTsKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gaW9ydF9pd2Jf
aGFuZGxlX2Z3bm9kZShGSUVMRF9HRVQoR0lDVjVfR1NJX0lXQl9GUkFNRV9JRCwgZ3NpKSk7Cj4g
Cj4gV2h5IGlzIHRoaXMgY2hhbmdlIG5lZWRlZD8KPiAKPiA+Cj4gPiAgICAgICAgIHJldHVybiBn
c2lfZG9tYWluX2hhbmRsZTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBhY3BpX2hhbmRsZSBnaWNf
djVfZ2V0X2dzaV9oYW5kbGUodTMyIGdzaSkKPiA+ICt7Cj4gPiArICAgICAgIGlmIChGSUVMRF9H
RVQoR0lDVjVfR1NJX0lDX1RZUEUsIGdzaSkgPT0gR0lDVjVfR1NJX0lXQl9UWVBFKQo+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybiBpb3J0X2l3Yl9oYW5kbGUoRklFTERfR0VUKEdJQ1Y1X0dTSV9J
V0JfRlJBTUVfSUQsIGdzaSkpOwo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gTlVMTDsKPiA+ICt9
Cj4gPiArCj4gPiAgc3RhdGljIGludCBfX2luaXQgZ2ljX2FjcGlfaW5pdCh1bmlvbiBhY3BpX3N1
YnRhYmxlX2hlYWRlcnMgKmhlYWRlciwgY29uc3QgdW5zaWduZWQgbG9uZyBlbmQpCj4gPiAgewo+
ID4gICAgICAgICBzdHJ1Y3QgYWNwaV9tYWR0X2dpY3Y1X2lycyAqaXJzID0gKHN0cnVjdCBhY3Bp
X21hZHRfZ2ljdjVfaXJzICopaGVhZGVyOwo+ID4gQEAgLTEyNDIsNyArMTI1MCw4IEBAIHN0YXRp
YyBpbnQgX19pbml0IGdpY19hY3BpX2luaXQodW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpo
ZWFkZXIsIGNvbnN0IHVuc2lnCj4gPiAgICAgICAgIGlmIChyZXQpCj4gPiAgICAgICAgICAgICAg
ICAgZ290byBvdXRfaXJzOwo+ID4KPiA+IC0gICAgICAgYWNwaV9zZXRfaXJxX21vZGVsKEFDUElf
SVJRX01PREVMX0dJQ19WNSwgZ2ljX3Y1X2dldF9nc2lfZG9tYWluX2lkLCBOVUxMKTsKPiA+ICsg
ICAgICAgYWNwaV9zZXRfaXJxX21vZGVsKEFDUElfSVJRX01PREVMX0dJQ19WNSwgZ2ljX3Y1X2dl
dF9nc2lfZG9tYWluX2lkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ljX3Y1X2dl
dF9nc2lfaGFuZGxlKTsKPiA+Cj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4KPiA+Cj4gPiAtLQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
