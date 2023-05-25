Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D9EC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 07:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGpEI3t7qL/nQnNz/5pzowoRiTnJ1GOlAcYunj2vsWs=; b=NgKFtL8Tdw8WhL
	0rA5oz+ClbYAnwsrqIiO+kFDLlGsptP3T5TNLxGl9S7WKyr/YIspaWbqpQm6gA7CCCRd7ACBhoHAQ
	13BT/HYPzljQLy2h4KWA2XM0tMQrdH/dV2HnUtBEdiNZdYpr9pkiaoiCH7RooNCQy22h/E3GCK9PE
	KQlvpsd1naQQxwiaBG+fEcecB18T0zAy+lWaovMJM5HKSLy9kH2k9H7K2wlEQ9ECtvQIReeDw+xC2
	GviK4ZIi8DodrPLaY5UbvbQaOlYQzPv7M9ld06AukyWq6p2uNA5WPXSB/eWFWVS1V2BN974i55bug
	3BIrDayflpu1Lwf5hyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q25Gm-00FmRb-2r;
	Thu, 25 May 2023 07:20:20 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q25Gj-00FmQh-1h
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 07:20:19 +0000
X-QQ-mid: bizesmtp77t1684999208te24henb
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 15:20:06 +0800 (CST)
X-QQ-SSF: 00200000000000D0V000000A0000000
X-QQ-FEAT: Q40xx9djesR71y0DVBMSVqb0OB8JvjMOQvnH/KC7DVtwDqMquhU67lAmpEDDm
	hbAf1eZ+0xinoQqUjGbKuiN2C8Df2P279pX7plJZfUj5i0uR3laz/qvsRZW49i1gTd823Qe
	Pu+6f1es9OrUPzbE9i+0Ojj0Va73paf9p0Z9g2LnvRwwSXcN9RN1vHhfzLLZnc0c5KbGYlG
	7OXDeJb1Nb3YVpQHlA2ImiJfRehTLMB6/KGxOPc0uHF5Q4RgFYIPEoYvtLaYpI42pzBeCTA
	eV/51v6GyHOmnwef1j5VyqTWcrTSusTIOZWIbGTkRDLOpH3sriihuVhci9KjweWWG6SQ0ux
	uZinBD86WNqojgeRc2Domv3Nq3Zj1mmhPxNRC1BKWVIKvu3fPpmJc1pq37FHgowjBIKREX0
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3158394778450214080
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	w@1wt.eu
Subject: Re: [PATCH 04/13] selftests/nolibc: syscall_args: use __NR_statx for rv32
Date: Thu, 25 May 2023 15:20:01 +0800
Message-Id: <20230525072001.77353-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <09d60dc2-e298-4c22-8e2f-8375861bd9be@t-8ch.de>
References: <09d60dc2-e298-4c22-8e2f-8375861bd9be@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_002017_866982_16B9B747 
X-CRM114-Status: GOOD (  15.94  )
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

SGksIFRob21hcwoKPiBPbiAyMDIzLTA1LTI1IDAxOjQ4OjExKzA4MDAsIFpoYW5namluIFd1IHdy
b3RlOgo+ID4gV2hlbiBjb21waWxlIG5vbGliYy10ZXN0LmMgZm9yIHJ2MzIsIHdlIGdvdCBzdWNo
IGVycm9yOgo+ID4gCj4gPiAgICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGli
Yy10ZXN0LmM6NTk5OjU3OiBlcnJvcjog4oCYX19OUl9mc3RhdOKAmSB1bmRlY2xhcmVkIChmaXJz
dCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPiA+ICAgICAgIDU5OSB8ICAgQ0FTRV9URVNUKHN5c2Nh
bGxfYXJncyk7ICAgICAgRVhQRUNUX1NZU0VSKDEsIHN5c2NhbGwoX19OUl9mc3RhdCwgMCwgTlVM
TCksIC0xLCBFRkFVTFQpOyBicmVhazsKPiA+IAo+ID4gVGhlIGdlbmVyaWMgaW5jbHVkZS91YXBp
L2FzbS1nZW5lcmljL3VuaXN0ZC5oIHVzZWQgYnkgcnYzMiBkb2Vzbid0Cj4gPiBzdXBwb3J0IF9f
TlJfZnN0YXQsIHVzZSBfX05SX3N0YXR4IGluc3RlYWQ6Cj4gPiAKPiA+ICAgICBSdW5uaW5nIHRl
c3QgJ3N5c2NhbGwnCj4gPiAgICAgNjkgc3lzY2FsbF9ub2FyZ3MgPSAxICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbT0tdCj4gPiAgICAgNzAgc3lzY2FsbF9hcmdz
ID0gLTEgRUZBVUxUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbT0tdCj4g
PiAKPiA+IEFzIHRvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oIHNob3dzLCBfX05SX3N0YXR4IGlz
IGVpdGhlciBub3Qgc3VwcG9ydGVkCj4gPiBieSBhbGwgcGxhdGZvcm1zLCBzbywgYm90aCBfX05S
X2ZzdGF0IGFuZCBfX05SX3N0YXR4IGFyZSByZXF1aXJlZC4KPiA+IAo+ID4gQnR3LCB0aGUgbGF0
ZXN0IHJpc2N2IGxpYmM2LWRldiBwYWNrYWdlIGlzIHJlcXVpcmVkLCBvdGhlcndpc2UsIHdlIHdv
dWxkCj4gPiBhbHNvIGdldCBzdWNoIGVycm9yOgo+ID4gCj4gPiAgICAgSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIC91c3IvcmlzY3Y2NC1saW51eC1nbnUvaW5jbHVkZS9zeXMvY2RlZnMuaDo0NTIsCj4g
PiAgICAgICAgICAgICAgICAgICAgICBmcm9tIC91c3IvcmlzY3Y2NC1saW51eC1nbnUvaW5jbHVk
ZS9mZWF0dXJlcy5oOjQ2MSwKPiA+ICAgICAgICAgICAgICAgICAgICAgIGZyb20gL3Vzci9yaXNj
djY0LWxpbnV4LWdudS9pbmNsdWRlL2JpdHMvbGliYy1oZWFkZXItc3RhcnQuaDozMywKPiA+ICAg
ICAgICAgICAgICAgICAgICAgIGZyb20gL3Vzci9yaXNjdjY0LWxpbnV4LWdudS9pbmNsdWRlL2xp
bWl0cy5oOjI2LAo+ID4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAvdXNyL2xpYi9nY2MtY3Jv
c3MvcmlzY3Y2NC1saW51eC1nbnUvOS9pbmNsdWRlL2xpbWl0cy5oOjE5NCwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgIGZyb20gL3Vzci9saWIvZ2NjLWNyb3NzL3Jpc2N2NjQtbGludXgtZ251Lzkv
aW5jbHVkZS9zeXNsaW1pdHMuaDo3LAo+ID4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAvdXNy
L2xpYi9nY2MtY3Jvc3MvcmlzY3Y2NC1saW51eC1nbnUvOS9pbmNsdWRlL2xpbWl0cy5oOjM0LAo+
ID4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAvbGFicy9saW51eC1sYWIvc3JjL2xpbnV4LXN0
YWJsZS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYzo2Ogo+ID4g
ICAgIC91c3IvcmlzY3Y2NC1saW51eC1nbnUvaW5jbHVkZS9iaXRzL3dvcmRzaXplLmg6Mjg6Mzog
ZXJyb3I6ICNlcnJvciAicnYzMmktYmFzZWQgdGFyZ2V0cyBhcmUgbm90IHN1cHBvcnRlZCIKPiA+
ICAgICAgICAyOCB8ICMgZXJyb3IgInJ2MzJpLWJhc2VkIHRhcmdldHMgYXJlIG5vdCBzdXBwb3J0
ZWQiCj4gPiAKPiA+IFRoZSBnbGliYyBjb21taXQgNWI2MTEzZDYyZWZhICgiUklTQy1WOiBTdXBw
b3J0IHRoZSAzMi1iaXQgQUJJCj4gPiBpbXBsZW1lbnRhdGlvbiIpIGZpeGVkIHVwIGFib3ZlIGVy
cm9yLCBzbywgZ2xpYmMgPj0gMi4zMyAod2hvIGluY2x1ZGVzCj4gPiB0aGlzIGNvbW1pdCkgaXMg
cmVxdWlyZWQuCj4gCj4gSXQgc2VlbXMgd2VpcmQgdG8gcmVxdWlyZSBsaW1pdHMuaCBmcm9tIHRo
ZSBzeXN0ZW0gbGliYyBhdCBhbGwuCj4KPiBUaGUgb25seSB0aGluZyB1c2VkIGZyb20gdGhlcmUg
YXJlIElOVF9NQVggYW5kIElOVF9NSU4uCj4gSW5zdGVhZCB3ZSBjb3VsZCBkZWZpbmUgb3VyIG93
biB2ZXJzaW9ucyBvZiBJTlRfTUFYIGFuZCBJTlRfTUlOIGluCj4gc3RkaW50LmguCj4gCj4gI2lm
bmRlZiBJTlRfTUFYCj4gI2RlZmluZSBJTlRfTUFYIF9fSU5UX01BWF9fCj4gI2VuZGlmCj4gCj4g
I2lmbmRlZiBJTlRfTUlOCj4gI2RlZmluZSBJTlRfTUlOICgtIF9fSU5UX01BWF9fIC0gMSkKPiAj
ZW5kaWYKPgoKSnVzdCB2ZXJpZmllZCBhbmQgcHJlcGFyZWQgYSBwYXRjaCwgaXQgZGlkIHdvcmsg
cGVyZmVjdGx5LCB0aGFua3MuCgpUaGUgYWJvdmUgY29tbWl0IG1lc3NhZ2UgZXhhY3RseSB0aGUg
ZXJyb3IgaW5mbyB3aWxsIGJlIGNsZWFuZWQgdXAgaW4KdjIuCgpCZXN0IHJlZ2FyZHMsClpoYW5n
amluCgo+IFRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
