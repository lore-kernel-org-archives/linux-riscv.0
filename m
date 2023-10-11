Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A56CD98F6
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSQ0o6Jebhh5UDN7Gfej//Kulu1iSHvzEBpdifkRn0I=; b=apc+37PWgnRmJl
	eV/P1Strm3q74tJQkCpUpF9lzNtd152e1QCwa6VLJ3imGY24yz1JPKrPqHXv488l7vqUJe4d5tWdl
	Bd+MvQPDS2GR+2yzrFzbJjhG1ELNTkrimaPxGh0n14uAv8BgTyaVja142DwwOWlEl3Git+TVKhiYG
	+/uHDECHx9V4sKCotG61mU2QlUcJbTSU/t7lYu69bn6WM7QIwrH9TBShNmP18bTIwX6wpaUUfysTs
	VavQ6sG1OK8/GxrkyHoHbo806X4OHVlrwxjV2knboi/u/ofU2vClWhXO56RsxtuCYT3JI/uAmyTXu
	yVyryL85BKWaoAKgj6BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqTbc-00F4sT-0D;
	Wed, 11 Oct 2023 07:26:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqTbV-00F4qu-0p;
	Wed, 11 Oct 2023 07:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9F0D2B81F46;
	Wed, 11 Oct 2023 07:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CD2C433C7;
	Wed, 11 Oct 2023 07:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697009159;
	bh=I+hjt1PIAmeTlSR8yMwMC5kINnpTg7kd2uxBgq828hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vvUjAcwiuU1Y7Tj7a0D35EZe0SxqN+mW7fhJhdPKPZHsA7bkpi+kq6XyZgKWRJkuv
	 wFoBLopdpeV8uJrtE3LTjN5hQ4GGXvHKw8zhDirGSmsdZTrIVkOmuPDRDKHXj1+LnL
	 4btIOyNUCM+4qGWuJA+oAlJPtLbETjMO8IeYC9sw=
Date: Wed, 11 Oct 2023 09:25:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] RISC-V: KVM: Forward SBI DBCN extension to user-space
Message-ID: <2023101105-oink-aerospace-989e@gregkh>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-4-apatel@ventanamicro.com>
 <2023101048-attach-drift-d77b@gregkh>
 <CAK9=C2UEcQpHg8WZM3XxLa5yCEZ6wtWJj=8g5_m_0_RkiNMkTA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2UEcQpHg8WZM3XxLa5yCEZ6wtWJj=8g5_m_0_RkiNMkTA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_002601_606802_2C714729 
X-CRM114-Status: GOOD (  27.12  )
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

T24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgMTI6MDI6MzBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIE9jdCAxMCwgMjAyMyBhdCAxMDo0NeKAr1BNIEdyZWcgS3JvYWgtSGFydG1h
bgo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBP
Y3QgMTAsIDIwMjMgYXQgMTA6MzU6MDBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4g
VGhlIFNCSSBEQkNOIGV4dGVuc2lvbiBuZWVkcyB0byBiZSBlbXVsYXRlZCBpbiB1c2VyLXNwYWNl
Cj4gPgo+ID4gV2h5Pwo+IAo+IFRoZSBTQkkgZGVidWcgY29uc29sZSBpcyBzaW1pbGFyIHRvIGEg
Y29uc29sZSBwb3J0IGF2YWlsYWJsZSB0bwo+IEtWTSBHdWVzdCBzbyB0aGUgS1ZNIHVzZXIgc3Bh
Y2UgdG9vbCAoaS5lLiBRRU1VLUtWTSBvcgo+IEtWTVRPT0wpIGNhbiByZWRpcmVjdCB0aGUgaW5w
dXQvb3V0cHV0IG9mIFNCSSBkZWJ1ZyBjb25zb2xlCj4gd2hlcmV2ZXIgaXQgd2FudHMgKGUuZy4g
IHRlbG5ldCwgZmlsZSwgc3RkaW8sIGV0YykuCj4gCj4gV2UgZm9yd2FyZCBTQkkgREJDTiBjYWxs
cyB0byBLVk0gdXNlciBzcGFjZSBzbyB0aGF0IHRoZQo+IGluLWtlcm5lbCBLVk0gZG9lcyBub3Qg
bmVlZCB0byBiZSBhd2FyZSBvZiB0aGUgZ3Vlc3QKPiBjb25zb2xlIGRldmljZXMuCgpIaW50LCBt
eSAiV2h5IiB3YXMgYXR0ZW1wdGluZyB0byBnZXQgeW91IHRvIHdyaXRlIGEgYmV0dGVyIGNoYW5n
ZWxvZwpkZXNjcmlwdGlvbiwgd2hpY2ggd291bGQgaW5jbHVkZSB0aGUgYWJvdmUgaW5mb3JtYXRp
b24uICBQbGVhc2UgcmVhZCB0aGUKa2VybmVsIGRvY3VtZW50YXRpb24gZm9yIGhpbnRzIG9uIGhv
dyB0byBkbyB0aGlzIHNvIHRoYXQgd2Uga25vdyB3aGF0CndoeSBjaGFuZ2VzIGFyZSBiZWluZyBt
YWRlLgoKPiA+ID4gc28gbGV0Cj4gPiA+IHVzIGZvcndhcmQgY29uc29sZV9wdXRzKCkgY2FsbCB0
byB1c2VyLXNwYWNlLgo+ID4KPiA+IFdoYXQgY291bGQgZ28gd3JvbmchCj4gPgo+ID4gV2h5IGRv
ZXMgdXNlcnNwYWNlIGhhdmUgdG8gZ2V0IGludm9sdmVkIGluIGEgY29uc29sZSBtZXNzYWdlPyAg
V2h5IGlzCj4gPiB0aGlzIG5lZWRlZCBhdCBhbGw/ICBUaGUga2VybmVsIGNhbiBub3QgaGFuZGxl
IHVzZXJzcGFjZSBjb25zb2xlcyBhcwo+ID4gb2J2aW91c2x5IHRoZXkgaGF2ZSB0byBiZSByZS1l
bnRyYW50IGFuZCBpcnEgc2FmZS4KPiAKPiBBcyBtZW50aW9uZWQgYWJvdmUsIHRoZXNlIGFyZSBL
Vk0gZ3Vlc3QgY29uc29sZSBtZXNzYWdlcyB3aGljaAo+IHRoZSBWTU0gKGkuZS4gS1ZNIHVzZXIt
c3BhY2UpIGNhbiBjaG9vc2UgdG8gbWFuYWdlIG9uIGl0cyBvd24uCgpJZiBpdCBjaG9vc2VzIG5v
dCB0bywgd2hhdCBoYXBwZW5zPwoKPiBUaGlzIGlzIG1vcmUgYWJvdXQgcHJvdmlkaW5nIGZsZXhp
YmlsaXR5IHRvIEtWTSB1c2VyLXNwYWNlIHdoaWNoCj4gYWxsb3dzIGl0IHRvIG1hbmFnZSBndWVz
dCBjb25zb2xlIGRldmljZXMuCgpXaHkgbm90IHVzZSB0aGUgbm9ybWFsIHZpcnRpbyBjb25zb2xl
IGRldmljZSBpbnRlcmZhY2UgaW5zdGVhZCBvZiBtYWtpbmcKYSByaXNjdi1jdXN0b20gb25lPwoK
V2hlcmUgaXMgdGhlIHVzZXJzcGFjZSBzaWRlIG9mIHRoaXMgaW50ZXJmYWNlIGF0PyAgV2hlcmUg
YXJlIHRoZSBwYXRjaGVzCnRvIGhhbmRsZSB0aGlzIG5ldyBhcGkgeW91IGFkZGVkPwoKPiAKPiA+
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWlj
cm8uY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVf
c2JpLmggfCAgMSArCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAg
IHwgIDEgKwo+ID4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAgICB8ICA0
ICsrKysKPiA+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyAgICAgfCAzMSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMzcgaW5z
ZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgK
PiA+ID4gaW5kZXggOGQ2ZDRkY2U4YTVlLi5hODVmOTVlYjZlODUgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiA+ID4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4gPiBAQCAtNjksNiArNjksNyBAQCBl
eHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X2lw
aTsKPiA+ID4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1
X3NiaV9leHRfcmZlbmNlOwo+ID4gPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlf
ZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9zcnN0Owo+ID4gPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBr
dm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9oc207Cj4gPiA+ICtleHRlcm4gY29u
c3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X2RiY247Cj4gPiA+
ICBleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0
X2V4cGVyaW1lbnRhbDsKPiA+ID4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4
dGVuc2lvbiB2Y3B1X3NiaV9leHRfdmVuZG9yOwo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oCj4gPiA+IGluZGV4IDkxN2Q4Y2MyNDg5ZS4uNjBkM2IyMWRlYWQ3IDEwMDY0NAo+
ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPiA+IEBAIC0xNTYsNiArMTU2LDcg
QEAgZW51bSBLVk1fUklTQ1ZfU0JJX0VYVF9JRCB7Cj4gPiA+ICAgICAgIEtWTV9SSVNDVl9TQklf
RVhUX1BNVSwKPiA+ID4gICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfRVhQRVJJTUVOVEFMLAo+ID4g
PiAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9WRU5ET1IsCj4gPiA+ICsgICAgIEtWTV9SSVNDVl9T
QklfRVhUX0RCQ04sCj4gPiA+ICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX01BWCwKPiA+Cj4gPiBZ
b3UganVzdCBicm9rZSBhIHVzZXIva2VybmVsIEFCSSBoZXJlLCB3aHk/Cj4gCj4gVGhlIEtWTV9S
SVNDVl9TQklfRVhUX01BWCBvbmx5IHJlcHJlc2VudHMgdGhlIG51bWJlcgo+IG9mIGVudHJpZXMg
aW4gImVudW0gS1ZNX1JJU0NWX1NCSV9FWFRfSUQiIHNvIHdlIGFyZSBub3QKPiBicmVha2luZyAi
ZW51bSBLVk1fUklTQ1ZfU0JJX0VYVF9JRCIgcmF0aGVyIGFwcGVuZGluZwo+IG5ldyBJRCB0byBl
eGlzdGluZyBlbnVtLgoKU28geW91IGFyZSBzdXJlIHRoYXQgdXNlcnNwYWNlIG5ldmVyIGFjdHVh
bGx5IHRlc3RzIG9yIHNlbmRzIHRoYXQgX01BWAp2YWx1ZSBhbnl3aGVyZT8gIElmIG5vdCwgd2h5
IGlzIGl0IGV2ZW4gbmVlZGVkPwoKdGhhbmtzLAoKZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
