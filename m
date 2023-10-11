Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BA0CD98F6
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGRPCFMroosakwHRP7m18vC1AY3+Jl0rqWRdTnLte4U=; b=kjThUm92fGOxTm
	Wn+rglBbBADDgyQSTjr6I5XS2x7naCmaBJuqdFGotsI8KDj3hJ95fk6CHQsaftCZfMhX4mXUqoAHK
	aiEfB47abRFdEBCVQZ0jQJHUmNaIbvZ6n8DG0B3g6Ov7j75rv9eNbAfIhPj7KgzPN56u1pViLwpHS
	w+4d86FccvqFd13xrdw121a5T/Fy2CmZFO7PLioZEzNEGtg7Llpe6WMTEjqhRUbT2tF4eJdKhcXM+
	mi21V6suaHBU2s703ZLFVak05YPlKGO53cSn3T6w18EPprBv6l7Gbo8tC4qurHOcYdSoCSwg36W7m
	RspqTJScKIVqpiAw2Gug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqTcc-00F51U-1j;
	Wed, 11 Oct 2023 07:27:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqTcZ-00F50V-3C;
	Wed, 11 Oct 2023 07:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E195661811;
	Wed, 11 Oct 2023 07:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03683C433C7;
	Wed, 11 Oct 2023 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697009225;
	bh=wdBRBWPG1q+slhhNVCbJyKyr4zxhG5iWNoRBaC45st0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sM6P/GYLthcfQbXg4JirQV4bK0QZKxkEghoQcQYgs8kX/K4EDu95Wcn6L8UQnSDWW
	 rZf7pdAcvMFZONtoU2fTHSUZHnC60MjoaJkIYNcuGZQyH3EmdflPgP4Jl75eTej5di
	 KYtj+i110e2I/lBBebrafdiPPzsNzo4mviAIPdOE=
Date: Wed, 11 Oct 2023 09:27:02 +0200
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
Message-ID: <2023101107-endorse-large-ef50@gregkh>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-3-apatel@ventanamicro.com>
 <2023101013-overfeed-online-7f69@gregkh>
 <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_002708_112550_275E32FF 
X-CRM114-Status: GOOD (  23.35  )
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

T24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgMTE6NDk6MTRBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIE9jdCAxMCwgMjAyMyBhdCAxMDo0M+KAr1BNIEdyZWcgS3JvYWgtSGFydG1h
bgo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBP
Y3QgMTAsIDIwMjMgYXQgMTA6MzQ6NTlQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4g
V2Ugd2lsbCBiZSBpbXBsZW1lbnRpbmcgU0JJIERCQ04gZXh0ZW5zaW9uIGZvciBLVk0gUklTQy1W
IHNvIGxldAo+ID4gPiB1cyBjaGFuZ2UgdGhlIEtWTSBSSVNDLVYgU0JJIHNwZWNpZmljYXRpb24g
dmVyc2lvbiB0byB2Mi4wLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxh
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1fdmNwdV9zYmkuaAo+ID4gPiBpbmRleCBjZGNmMGZmMDdiZTcuLjhkNmQ0ZGNlOGE1ZSAxMDA2
NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4g
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gPiA+IEBAIC0x
MSw3ICsxMSw3IEBACj4gPiA+Cj4gPiA+ICAjZGVmaW5lIEtWTV9TQklfSU1QSUQgMwo+ID4gPgo+
ID4gPiAtI2RlZmluZSBLVk1fU0JJX1ZFUlNJT05fTUFKT1IgMQo+ID4gPiArI2RlZmluZSBLVk1f
U0JJX1ZFUlNJT05fTUFKT1IgMgo+ID4KPiA+IFdoYXQgZG9lcyB0aGlzIG51bWJlciBtZWFuPyAg
V2hvIGNoZWNrcyBpdD8gIFdoeSBkbyB5b3UgaGF2ZSB0byBrZWVwCj4gPiBpbmNyZW1lbnRpbmcg
aXQ/Cj4gCj4gVGhpcyBudW1iZXIgaXMgdGhlIFNCSSBzcGVjaWZpY2F0aW9uIHZlcnNpb24gaW1w
bGVtZW50ZWQgYnkgS1ZNIFJJU0MtVgo+IGZvciB0aGUgR3Vlc3Qga2VybmVsLgo+IAo+IFRoZSBv
cmlnaW5hbCBzYmlfY29uc29sZV9wdXRjaGFyKCkgYW5kIHNiaV9jb25zb2xlX2dldGNoYXIoKSBh
cmUgbGVnYWN5Cj4gZnVuY3Rpb25zIChha2EgU0JJIHYwLjEpIHdoaWNoIHdlcmUgaW50cm9kdWNl
ZCBhIGZldyB5ZWFycyBiYWNrIGFsb25nCj4gd2l0aCB0aGUgTGludXggUklTQy1WIHBvcnQuCj4g
Cj4gVGhlIGxhdGVzdCBTQkkgdjIuMCBzcGVjaWZpY2F0aW9uICh3aGljaCBpcyBub3cgZnJvemVu
KSBpbnRyb2R1Y2VzIGEgbmV3Cj4gU0JJIGRlYnVnIGNvbnNvbGUgZXh0ZW5zaW9uIHdoaWNoIHJl
cGxhY2VzIGxlZ2FjeSBzYmlfY29uc29sZV9wdXRjaGFyKCkKPiBhbmQgc2JpX2NvbnNvbGVfZ2V0
Y2hhcigpIGZ1bmN0aW9ucyB3aXRoIGJldHRlciBhbHRlcm5hdGl2ZXMuCj4gKFJlZmVyLCBodHRw
czovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL3JlbGVhc2VzL2Rvd25s
b2FkL2NvbW1pdC1mZTQ1NjI1MzJhOWNjNTdlNTc0M2I2NDY2OTQ2YzVlNWM5OGM3M2NhL3Jpc2N2
LXNiaS5wZGYpCj4gCj4gVGhpcyBzZXJpZXMgYWRkcyBTQkkgZGVidWcgY29uc29sZSBpbXBsZW1l
bnRhdGlvbiBpbiBLVk0gUklTQy1WCj4gc28gdGhlIFNCSSBzcGVjaWZpY2F0aW9uIHZlcnNpb24g
YWR2ZXJ0aXNlZCBieSBLVk0gUklTQy1WIG11c3QgYWxzbyBiZQo+IHVwZ3JhZGVkIHRvIHYyLjAu
Cj4gCj4gUmVnYXJkaW5nIHdobyBjaGVja3MgaXRzLCB0aGUgU0JJIGNsaWVudCBkcml2ZXJzIGlu
IHRoZSBMaW51eCBrZXJuZWwKPiB3aWxsIGNoZWNrIFNCSSBzcGVjaWZpY2F0aW9uIHZlcnNpb24g
aW1wbGVtZW50ZWQgYnkgaGlnaGVyIHByaXZpbGVnZQo+IG1vZGUgKE0tbW9kZSBmaXJtd2FyZSBv
ciBIUy1tb2RlIGh5cGVydmlzb3IpIGJlZm9yZSBwcm9iaW5nCj4gdGhlIFNCSSBleHRlbnNpb24u
IEZvciBleGFtcGxlLCB0aGUgSFZDIFNCSSBkcml2ZXIgKFBBVENINSkKPiB3aWxsIGVuc3VyZSBT
Qkkgc3BlYyB2ZXJzaW9uIHRvIGJlIGF0IGxlYXN0IHYyLjAgYmVmb3JlIHByb2JpbmcKPiBTQkkg
ZGVidWcgY29uc29sZSBleHRlbnNpb24uCgpJcyB0aGlzIGFwaSBiYWNrd2FyZHMgY29tcGF0aWJs
ZSwgb3IgZGlkIHlvdSBqdXN0IGJyZWFrIGV4aXN0aW5nCnVzZXJzcGFjZSB0aGF0IG9ubHkgZXhw
ZWN0cyB2ZXJzaW9uIDEuMD8KCnRoYW5rcywKCmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
