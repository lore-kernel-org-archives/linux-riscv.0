Return-Path: <SRS0=fbrL=XO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210ACC49ED7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2019 03:25:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E603720815
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2019 03:25:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PdyZAFey";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hardenedlinux.org header.i=@hardenedlinux.org header.b="eQupdZtb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E603720815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hardenedlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:From:To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqamvDld+0m9Xp4UD5u2+9fUcRX75IBZzFywIOOP59g=; b=PdyZAFeyNgf23E
	Y1f5nPiRkGW39TKQF0eJUhAyPGgOTImLF/HIhThFXL+pCgDweycQh4itEwNkj4PtujrYT9kxWSUTO
	bSxjpgsNdbZ2/BM78yKqS6wSkre1fEO2dZDv/+ySisVBKizQOyprTSaBzGk/Bf5empfUYAAgOU3pJ
	hLBxr85sLKXTDB+Kqw2mN+CtbhdnxdI/ICAow+IRJw3D6QX99eVaqYGTbcTU46V/S7J1Fp2SHOQ0x
	1pPGn6HlA2bMFiMEKm8WQYv2d5j8z3uBfTrmPTG8e64fwDJB/6m30Gud2NqdJqaw9av6fYgQX934H
	172RyNWtAPlUVPT2DHhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAn47-0006Gh-TW; Thu, 19 Sep 2019 03:25:08 +0000
Received: from mail1.protonmail.ch ([185.70.40.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAn43-00057P-Ru
 for linux-riscv@lists.infradead.org; Thu, 19 Sep 2019 03:25:05 +0000
Date: Thu, 19 Sep 2019 03:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardenedlinux.org;
 s=protonmail; t=1568863498;
 bh=UGPlxdw/GA0C+GgCymCvb83hIycn10vrVkMuVgnbqls=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=eQupdZtbt6KaoPyu7zLqHFSOw/5smDSldJpuvRo2+051rY8TyCtLzGQrY7FNutC4e
 u6xjnBS5v9xDo5d3SbxvElYg5bQa4oeqMV3ohqbhezE/tYTCAgdl+XZN5tuZV8OUNo
 VZqe/467zvs8aT6lKehkXnyBSJHXO6Ia+aJPv4Pg=
To: Palmer Dabbelt <palmer@sifive.com>
From: Xiang Wang <merle@hardenedlinux.org>
Subject: Re: arch/riscv: disable too many harts before pick main boot hart
Message-ID: <LQ8iC9RFpYZKFM9BGCpoHtnE3mzT-DqRwTKwJ_ngjvojyMAVvsVGaLscmiSopwR14QkhFejc7r9Qc8orGLN_H7lqo3yxAmcrYc5sZh9ZqXI=@hardenedlinux.org>
In-Reply-To: <mhng-0a85b4e9-be39-469c-9a50-4ee1310f6e8e@palmer-si-x1e>
References: <mhng-0a85b4e9-be39-469c-9a50-4ee1310f6e8e@palmer-si-x1e>
Feedback-ID: BRRa7Rf7LqOlikZR00e5gSr_IsihWq0drDTak4NnawY-ONQTW87vpTHz90bkJTl_rn8r4L6gc-nP1pm37CQtxw==:Ext:ProtonMail
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_202504_208182_A0A2338E 
X-CRM114-Status: GOOD (  13.58  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Xiang Wang <merle@hardenedlinux.org>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "citypw@hardenedlinux.org" <citypw@hardenedlinux.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CgoKCgrigJDigJDigJDigJDigJDigJDigJAgT3JpZ2luYWwgTWVzc2FnZSDigJDigJDigJDigJDi
gJDigJDigJAKT24gMjAxOeW5tDnmnIgxNOaXpVNhdHVyZGF5QU0z54K5MDTliIYsIFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAc2lmaXZlLmNvbT4gd3JvdGU6Cgo+IE9uIFRodSwgMDUgU2VwIDIwMTkg
MjM6NTE6MTUgUERUICgtMDcwMCksIG1lcmxlQGhhcmRlbmVkbGludXgub3JnIHdyb3RlOgo+Cj4g
PiBGcm9tIDEyMzAwODY1ZDExMDM2MThjOWQ0YzM3NWY3ZDdmYmU2MDFiNjYxOGMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCj4gPiBGcm9tOiBYaWFuZyBXYW5nIG1lcmxlQGhhcmRlbmVkbGludXgu
b3JnCj4gPiBEYXRlOiBGcmksIDYgU2VwIDIwMTkgMTE6NTY6MDkgKzA4MDAKPiA+IFN1YmplY3Q6
IFtQQVRDSF0gYXJjaC9yaXNjdjogZGlzYWJsZSB0b28gbWFueSBoYXJ0cyBiZWZvcmUgcGljayBt
YWluIGJvb3QgaGFydAo+ID4gVGhlc2UgaGFydHMgd2l0aCBpZCBncmVhdGVyIHRoYW4gb3IgZXF1
YWwgdG8gQ09ORklHX05SX0NQVVMgbmVlZCB0byBiZSBkaXNhYmxlZC4KPiA+IEJ1dCBwaWNrIHRo
ZSBtYWluIEhhcnQgY2FuIGNob29zZSBhbnkgb25lLiBTbywgYmVmb3JlIHBpY2sgdGhlIG1haW4g
aGFydCwgeW91Cj4gPiBuZWVkIHRvIGRpc2FibGUgdGhlIGhhcnQgd2l0aCBpZCBncmVhdGVyIHRo
YW4gb3IgZXF1YWwgdG8gQ09ORklHX05SX0NQVVMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWGlh
bmcgV2FuZyBtZXJsZUBoYXJkZW5lZGxpbnV4Lm9yZwo+ID4KPiA+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPgo+ID4gYXJjaC9yaXNjdi9rZXJu
ZWwvaGVhZC5TIHwgOCArKysrKy0tLQo+ID4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFk
LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiA+IGluZGV4IDBmMWJhMTdlNDc2Zi4uY2Zm
ZmVhMzhlYjE3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiA+IEBAIC02Myw2ICs2MywxMSBAQCBfc3Rh
cnRfa2VybmVsOgo+ID4gbGkgdDAsIFNSX0ZTCj4gPiBjc3JjIHNzdGF0dXMsIHQwCj4gPiArI2lm
ZGVmIENPTkZJR19TTVAKPiA+Cj4gPiAtICAgbGkgdDAsIENPTkZJR19OUl9DUFVTCj4gPiAtICAg
YmdldSBhMCwgdDAsIC5Mc2Vjb25kYXJ5X3BhcmsKPiA+ICAgICArI2VuZGlmCj4gPgo+ID4gLQo+
ID4KPiA+IC8qIFBpY2sgb25lIGhhcnQgdG8gcnVuIHRoZSBtYWluIGJvb3Qgc2VxdWVuY2UgKi8K
PiA+IGxhIGEzLCBoYXJ0X2xvdHRlcnkKPiA+IGxpIGEyLCAxCj4gPiBAQCAtMTU0LDkgKzE1OSw2
IEBAIHJlbG9jYXRlOgo+ID4gLkxzZWNvbmRhcnlfc3RhcnQ6Cj4gPiAjaWZkZWYgQ09ORklHX1NN
UAo+ID4KPiA+IC0gICBsaSBhMSwgQ09ORklHX05SX0NQVVMKPiA+IC0gICBiZ2V1IGEwLCBhMSwg
LkxzZWNvbmRhcnlfcGFyawo+ID4gLQo+ID4KPiA+IC8qIFNldCB0cmFwIHZlY3RvciB0byBzcGlu
IGZvcmV2ZXIgdG8gaGVscCBkZWJ1ZyAqLwo+ID4gbGEgYTMsIC5Mc2Vjb25kYXJ5X3BhcmsKPiA+
IGNzcncgQ1NSX1NUVkVDLCBhMwo+Cj4gSXQgd291bGQgYmUgYmV0dGVyIHRvIGRlY291cGxlIHRo
ZSBoYXJ0IG1hc2tzIGZyb20gTlJfQ1BVUywgYXMgdGhlcmUncyByZWFsbHkKPiBubyByZWFzb24g
Zm9yIHRoZXNlIHRvIGJlIHRoZSBzYW1lLgoKVGhpcyBtYXkgYmUgbmV3IGZlYXR1cmUuIE5lZWQg
dG8gZGVmaW5lIG5ldyBtYWNyb3Mgc3VjaCBhcyBkaXNhYmxlZF9oYXJ0X21hc2ssCnRoaXMgcGF0
Y2ggaXMgdXNlZCB0byBmaXggYnVnIGFuZCBub3QgYWRkIG5ldyBmZWF0dXJlLgoKPgo+IFJldmll
d2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCBwYWxtZXJAc2lmaXZlLmNvbQoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
