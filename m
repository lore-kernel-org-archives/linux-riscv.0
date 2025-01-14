Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D5BC02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 17:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:In-Reply-To:
	References:To:Message-Id:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPfCKo0BvfQTySQQwlO+59MMDe2d5Z73JW0qfhaWz4k=; b=ZMLu5EzhaqLj42
	THvZvioSzfd2GH1rPOzdHceFXxTxHycTnZBpqGE41fp9GW5no3MqsGrcqyShvgl/YSrBvBtMyOpmD
	aq44GwPq1qO9BOd+oOR06Q9Tf4d4w8Aev2+n4bvlmmOcIlIc+lVweCoBSay96g6czbR3deLA9G5Ov
	yTSyBXQ6LD/XTXFMoUQqlaGKwS+fgeWuTRN8A/c+No2R8CPhfJxrMrXYaN+ViYMI3Wa2eIR+NtOCp
	ROt5pGXd9OjV0fpfbMVVgMHU0u0JKb7APOzfb1Bo9Hjv1vYFOMebfmVblgdBz7aBsgdKRUVOZggLH
	QVt1vxZWqIRRGsNutIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl54-00000009FYY-1su5;
	Tue, 14 Jan 2025 17:51:58 +0000
Received: from mail178-22.suw51.mandrillapp.com ([198.2.178.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl52-00000009FWN-1MI5
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 17:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736877114; x=1737137614;
	bh=az8rpG0APRcxLiWSmI+/bj3xR4gqvWnpdGPbdfScdrk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VlGpXUuJn8Jz2oaK/ZJTwN0W9aMXf793YJWAokZMUSmPjFJwKM8j/ByKpeZs5AUZk
	 zczuJj22N4ZDbsYtqv6N0Y7z58wHQqXthFQ1i3rtL51OtZS1/DlIGM7j6l3mR9C2Su
	 Aw3BZtrqrJo9Tn+E4Uq04wtcaCTFAONz5GFLdvCCnpB3ZkAATbxB7v0Oj31Oek6e6s
	 bQzdKxZ0319KbTJEaEayqB3AP6GUPxGLMj8keOxoUvzzDPNEZ6iG3Fq2o5QLQzyX4X
	 /BwVD+rhyCqLbirP979/6RTnsBwU8jWJAJ7H5E+O1spqWT0sp2TLbkqUVlLhDgerhX
	 xxBZfSjcoLYAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736877114; x=1737137614; i=teddy.astie@vates.tech;
	bh=az8rpG0APRcxLiWSmI+/bj3xR4gqvWnpdGPbdfScdrk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YyNTQjEFcCrEpflceEe0lOYeKaDMVTiRW5SXUCaIVTzXPQvxMrr+yUI5zDB/4e97w
	 4vo58Y7uwgZL+Jw/0bXI1f3nP6+xQIR8ehKzWQipHfQ1tKpUvMgDmBGkOU7S5RfpR0
	 jlkdZlV30mgo9BvdgGtMW2sq1deCDjzg1e7OWDmsci1qriVm01I3SYCqHwdF1bGFli
	 Jxu7PIsBn59BI8XWp8sILKz/eMoaWTLhdlKRJd2k5zxUZH8trrOkMzGN06NXzoOwTK
	 irQfj7NJDURr/rEM6MviOfkPW0eyg2U9Td5iaVdkGEedSTOHYSFreTbj5Hg/uhvSR8
	 /1aXJF9knFBYQ==
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
	by mail178-22.suw51.mandrillapp.com (Mailchimp) with ESMTP id 4YXcBy3dYlzGlsvQs
	for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 17:51:54 +0000 (GMT)
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20riscv:=20Add=20initial=20Xen=20guest=20support=20for=20RISC-V?=
Received: from [37.26.189.201] by mandrillapp.com id 8cbd46ecc1374792bdfc767ea909bec7; Tue, 14 Jan 2025 17:51:54 +0000
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736877112710
Message-Id: <0cac0b13-128c-4d8b-b235-09d7b440ad8e@vates.tech>
To: "Milan Djokic" <milandjokic1995@gmail.com>, linux-riscv@lists.infradead.org
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
In-Reply-To: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8cbd46ecc1374792bdfc767ea909bec7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250114:md
Date: Tue, 14 Jan 2025 17:51:54 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_095156_489816_4D086C3D 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: jgross@suse.com, aou@eecs.berkeley.edu, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, sstabellini@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, xen-devel@lists.xenproject.org, Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TGUgMTQvMDEvMjAyNSDDoCAxNzoxMywgTWlsYW4gRGpva2ljIGEgw6ljcml0wqA6Cj4gZGlmZiAt
LWdpdCBhL3Rlc3QudHh0IGIvdGVzdC50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZTU0MjY3OTk4OTgyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Rlc3Qu
dHh0Cj4gQEAgLTAsMCArMSwyMSBAQAo+ICtXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRl
ZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/Cj4gKyMxMjA6Cj4gK25l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gKwo+ICtXQVJOSU5HOiBkbyBub3QgYWRkIG5ldyB0eXBlZGVm
cwo+ICsjODA4OiBGSUxFOiBpbmNsdWRlL3hlbi9yaXNjdi9pbnRlcmZhY2UuaDoxNToKPiArKwl0
eXBlZGVmIHN0cnVjdCB7IHVuaW9uIHsgdHlwZSAqIHA7IHVpbnQ2NF9hbGlnbmVkX3QgcTsgfTsg
fSAgXAo+ICsKPiArV0FSTklORzogcGxlYXNlLCBubyBzcGFjZXMgYXQgdGhlIHN0YXJ0IG9mIGEg
bGluZQo+ICsjMTAwNjogRklMRTogaW5jbHVkZS94ZW4vcmlzY3Yvc3dpb3RsYi14ZW4uaDoxMDoK
PiArKyAgICByZXR1cm4gMDskCj4gKwo+ICt0b3RhbDogMCBlcnJvcnMsIDMgd2FybmluZ3MsIDgx
MCBsaW5lcyBjaGVja2VkCj4gKwo+ICtOT1RFOiBGb3Igc29tZSBvZiB0aGUgcmVwb3J0ZWQgZGVm
ZWN0cywgY2hlY2twYXRjaCBtYXkgYmUgYWJsZSB0bwo+ICsgICAgICBtZWNoYW5pY2FsbHkgY29u
dmVydCB0byB0aGUgdHlwaWNhbCBzdHlsZSB1c2luZyAtLWZpeCBvciAtLWZpeC1pbnBsYWNlLgo+
ICsKPiArMDAwMS1yaXNjdi1BZGQtaW5pdGlhbC1YZW4tZ3Vlc3Qtc3VwcG9ydC1mb3ItUklTQy1W
LnBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4KPiArCj4gK05PVEU6IElm
IGFueSBvZiB0aGUgZXJyb3JzIGFyZSBmYWxzZSBwb3NpdGl2ZXMsIHBsZWFzZSByZXBvcnQKPiAr
ICAgICAgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlIENIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuCgpJIGFtIG5vdCBzdXJlIHlvdSB3YW50IHRoaXMgaGVyZS4KCiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaCAKYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
PiBhc20vaHlwZXJ2aXNvci5oCiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0CiA+IGluZGV4IDAwMDAw
MDAwMDAwMC4uM2ExMTdhZmU1N2YwCiA+IC0tLSAvZGV2L251bGwKID4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9oeXBlcnZpc29yLmgKID4gQEAgLTAsMCArMSw5IEBACiA+ICsvKiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwogPiArI2lmbmRlZiBfQVNNX1JJU0NWX0hZ
UEVSVklTT1JfSAogPiArI2RlZmluZSBfQVNNX1JJU0NWX0hZUEVSVklTT1JfSAogPiArCiA+ICsj
aW5jbHVkZSA8YXNtL3hlbi9oeXBlcnZpc29yLmg+CiA+ICsKID4gK3ZvaWQga3ZtX2luaXRfaHlw
X3NlcnZpY2VzKHZvaWQpOwogPiArCiA+ICsjZW5kaWYKCmt2bV9pbml0X2h5cF9zZXJ2aWNlcyBz
ZWVtcyBLVk0tc3BlY2lmaWMgYW5kIGRvZXNuJ3Qgc2VlbSB0byBleGlzdCAoeWV0KSAKZm9yIFJJ
U0MtVi4KClRlZGR5CgoKVGVkZHkgQXN0aWUgfCBWYXRlcyBYQ1AtbmcgRGV2ZWxvcGVyCgpYQ1At
bmcgJiBYZW4gT3JjaGVzdHJhIC0gVmF0ZXMgc29sdXRpb25zCgp3ZWI6IGh0dHBzOi8vdmF0ZXMu
dGVjaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
