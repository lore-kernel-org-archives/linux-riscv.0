Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F9ACD6E7D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nY0RXmoQvbxzf/0Z4gSj0yTojdltzVQ7SsK6BNP3ou4=; b=JTAtUgJnCOpszA
	5eRLyluXroTWTnhlWroREHuOxafrFNBzjmTknPxLUi+YXoVuulZYGGs/TJc64pyE5XfxtW4td816y
	tNO+erQTUWyfr7WMno7sJUNQVRnqcpM4YSI6TPqRzpt5zPqvdbcc3QKhv8N7w4tYyFRy69u7hZUir
	xzMsvXTN/Avb1vuuQehXTIvRh4evdPhMtyXirv7/Ixx+edmTrmDWLPgRbpYbY4X9MQo6Kqorqu5f8
	vvM84NPgnl9R+mExwqAWtnNPHmBBsIrvYyPsNrZhFjKnUbbXJeaqeeFmaHs5JB61FJAt3hoqpB7EJ
	8Wr5vSg2qXzOGw+fRUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqb6H-00GBO1-1A;
	Wed, 11 Oct 2023 15:26:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqb6D-00GBN4-0F;
	Wed, 11 Oct 2023 15:26:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 595D5CE0E29;
	Wed, 11 Oct 2023 15:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06141C433C9;
	Wed, 11 Oct 2023 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697037969;
	bh=ffZCdV6S3mfAswlL4iRHUl65ZXH/97XVC+UgVd+j71w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuMHdz03n1BfB2yvbi90uIfPDcGaOQm/4sxL26h4J46dlTFjur9pQdPbgXE1MWXh/
	 awQXJQGRuGbvfsBzZS320T2CSWWhpRB35hO0o/kXRPEG0CRnZtbNqsphpUgaRgCFe3
	 86EcgS2jYsbId1dSXsdUlYVace+g2HNvcvCBqnWY=
Date: Wed, 11 Oct 2023 17:26:06 +0200
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
Subject: Re: [PATCH 2/6] RISC-V: KVM: Change the SBI specification version to
 v2.0
Message-ID: <2023101148-anatomy-mantis-a0f5@gregkh>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-3-apatel@ventanamicro.com>
 <2023101013-overfeed-online-7f69@gregkh>
 <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com>
 <2023101107-endorse-large-ef50@gregkh>
 <CAK9=C2XYQ0U9CbuCg6cTf79sSsy+0BxF5mBE0R+E3s9iZFzEWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XYQ0U9CbuCg6cTf79sSsy+0BxF5mBE0R+E3s9iZFzEWw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_082613_476345_66BBB883 
X-CRM114-Status: GOOD (  30.33  )
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

T24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgMDQ6MzI6MjJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBXZWQsIE9jdCAxMSwgMjAyMyBhdCAxMjo1N+KAr1BNIEdyZWcgS3JvYWgtSGFydG1h
bgo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBP
Y3QgMTEsIDIwMjMgYXQgMTE6NDk6MTRBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4g
T24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgMTA6NDPigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4KPiA+
ID4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9u
IFR1ZSwgT2N0IDEwLCAyMDIzIGF0IDEwOjM0OjU5UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6
Cj4gPiA+ID4gPiBXZSB3aWxsIGJlIGltcGxlbWVudGluZyBTQkkgREJDTiBleHRlbnNpb24gZm9y
IEtWTSBSSVNDLVYgc28gbGV0Cj4gPiA+ID4gPiB1cyBjaGFuZ2UgdGhlIEtWTSBSSVNDLVYgU0JJ
IHNwZWNpZmljYXRpb24gdmVyc2lvbiB0byB2Mi4wLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+ID4g
LS0tCj4gPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8IDIg
Ky0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgK
PiA+ID4gPiA+IGluZGV4IGNkY2YwZmYwN2JlNy4uOGQ2ZDRkY2U4YTVlIDEwMDY0NAo+ID4gPiA+
ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4gPiA+ID4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4gPiA+ID4gQEAg
LTExLDcgKzExLDcgQEAKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgI2RlZmluZSBLVk1fU0JJX0lNUElE
IDMKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtI2RlZmluZSBLVk1fU0JJX1ZFUlNJT05fTUFKT1IgMQo+
ID4gPiA+ID4gKyNkZWZpbmUgS1ZNX1NCSV9WRVJTSU9OX01BSk9SIDIKPiA+ID4gPgo+ID4gPiA+
IFdoYXQgZG9lcyB0aGlzIG51bWJlciBtZWFuPyAgV2hvIGNoZWNrcyBpdD8gIFdoeSBkbyB5b3Ug
aGF2ZSB0byBrZWVwCj4gPiA+ID4gaW5jcmVtZW50aW5nIGl0Pwo+ID4gPgo+ID4gPiBUaGlzIG51
bWJlciBpcyB0aGUgU0JJIHNwZWNpZmljYXRpb24gdmVyc2lvbiBpbXBsZW1lbnRlZCBieSBLVk0g
UklTQy1WCj4gPiA+IGZvciB0aGUgR3Vlc3Qga2VybmVsLgo+ID4gPgo+ID4gPiBUaGUgb3JpZ2lu
YWwgc2JpX2NvbnNvbGVfcHV0Y2hhcigpIGFuZCBzYmlfY29uc29sZV9nZXRjaGFyKCkgYXJlIGxl
Z2FjeQo+ID4gPiBmdW5jdGlvbnMgKGFrYSBTQkkgdjAuMSkgd2hpY2ggd2VyZSBpbnRyb2R1Y2Vk
IGEgZmV3IHllYXJzIGJhY2sgYWxvbmcKPiA+ID4gd2l0aCB0aGUgTGludXggUklTQy1WIHBvcnQu
Cj4gPiA+Cj4gPiA+IFRoZSBsYXRlc3QgU0JJIHYyLjAgc3BlY2lmaWNhdGlvbiAod2hpY2ggaXMg
bm93IGZyb3plbikgaW50cm9kdWNlcyBhIG5ldwo+ID4gPiBTQkkgZGVidWcgY29uc29sZSBleHRl
bnNpb24gd2hpY2ggcmVwbGFjZXMgbGVnYWN5IHNiaV9jb25zb2xlX3B1dGNoYXIoKQo+ID4gPiBh
bmQgc2JpX2NvbnNvbGVfZ2V0Y2hhcigpIGZ1bmN0aW9ucyB3aXRoIGJldHRlciBhbHRlcm5hdGl2
ZXMuCj4gPiA+IChSZWZlciwgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Yt
c2JpLWRvYy9yZWxlYXNlcy9kb3dubG9hZC9jb21taXQtZmU0NTYyNTMyYTljYzU3ZTU3NDNiNjQ2
Njk0NmM1ZTVjOThjNzNjYS9yaXNjdi1zYmkucGRmKQo+ID4gPgo+ID4gPiBUaGlzIHNlcmllcyBh
ZGRzIFNCSSBkZWJ1ZyBjb25zb2xlIGltcGxlbWVudGF0aW9uIGluIEtWTSBSSVNDLVYKPiA+ID4g
c28gdGhlIFNCSSBzcGVjaWZpY2F0aW9uIHZlcnNpb24gYWR2ZXJ0aXNlZCBieSBLVk0gUklTQy1W
IG11c3QgYWxzbyBiZQo+ID4gPiB1cGdyYWRlZCB0byB2Mi4wLgo+ID4gPgo+ID4gPiBSZWdhcmRp
bmcgd2hvIGNoZWNrcyBpdHMsIHRoZSBTQkkgY2xpZW50IGRyaXZlcnMgaW4gdGhlIExpbnV4IGtl
cm5lbAo+ID4gPiB3aWxsIGNoZWNrIFNCSSBzcGVjaWZpY2F0aW9uIHZlcnNpb24gaW1wbGVtZW50
ZWQgYnkgaGlnaGVyIHByaXZpbGVnZQo+ID4gPiBtb2RlIChNLW1vZGUgZmlybXdhcmUgb3IgSFMt
bW9kZSBoeXBlcnZpc29yKSBiZWZvcmUgcHJvYmluZwo+ID4gPiB0aGUgU0JJIGV4dGVuc2lvbi4g
Rm9yIGV4YW1wbGUsIHRoZSBIVkMgU0JJIGRyaXZlciAoUEFUQ0g1KQo+ID4gPiB3aWxsIGVuc3Vy
ZSBTQkkgc3BlYyB2ZXJzaW9uIHRvIGJlIGF0IGxlYXN0IHYyLjAgYmVmb3JlIHByb2JpbmcKPiA+
ID4gU0JJIGRlYnVnIGNvbnNvbGUgZXh0ZW5zaW9uLgo+ID4KPiA+IElzIHRoaXMgYXBpIGJhY2t3
YXJkcyBjb21wYXRpYmxlLCBvciBkaWQgeW91IGp1c3QgYnJlYWsgZXhpc3RpbmcKPiA+IHVzZXJz
cGFjZSB0aGF0IG9ubHkgZXhwZWN0cyB2ZXJzaW9uIDEuMD8KPiAKPiBUaGUgbGVnYWN5IHNiaV9j
b25zb2xlX3B1dGNoYXIoKSBhbmQgc2JpX2NvbnNvbGVfZ2V0Y2hhcigpCj4gZnVuY3Rpb25zIGhh
dmUgbm90IGNoYW5nZWQgc28gaXQgZG9lcyBub3QgYnJlYWsgZXhpc3RpbmcKPiB1c2VyLXNwYWNl
Lgo+IAo+IFRoZSBuZXcgU0JJIERCQ04gZnVuY3Rpb25zIHRvIGJlIGltcGxlbWVudGVkIGJ5IEtW
TQo+IHVzZXIgc3BhY2UgYXJlOgo+IHNiaV9kZWJ1Z19jb25zb2xlX3dyaXRlKCkKPiBzYmlfZGVi
dWdfY29uc29sZV9yZWFkKCkKPiBzYmlfZGVidWdfY29uc29sZV93cml0ZV9ieXRlKCkKCkFuZCB3
aGVyZSBleGFjdGx5IGlzIHRoYXQgY29kZSBmb3IgdXMgdG8gcmV2aWV3IHRoYXQgdGhpcyBpcyB0
ZXN0ZWQ/Cgp0aGFua3MsCgpncmVnIGstaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
