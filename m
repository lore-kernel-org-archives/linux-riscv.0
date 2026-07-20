Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8860DC44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMJiIfZVpN+qq+HzQiu2wRyXsXL91INTgbyUIBrsl14=; b=DfZb/ib/EBOM8j
	E9+do8QRkcYo2vOgpdYf9M0sKveN34njJnvEVPhvKFah06spBAZDB8IExmKR3fM/7ylbIBaBsRSY+
	+lC+74dcZL2pcRhVtbQm/UmQ48BGlxCNtCMvrvSSklmudDSL4Iy1f/jRmoAJeYxuZSvsoPJ7IqO87
	5FuJ/VTqqjCWfa4x4dqYIbKV7ob/0kErj/tKv/8JxpOAoZs1RRmrmsKBnzfRX/FQORbkGzXdTP/Pz
	30vU7KFE2ec++HNyMQhPFgXHs+zhWY9SYKgZVG8/NvU0jkwcngtJCiom4Jq4Apx6qvE5iV4+alzdM
	52iZFI5Wnr7/Fp1pxEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsi9-00000007eHm-3VAn;
	Mon, 20 Jul 2026 18:27:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsi8-00000007eHV-0rhQ
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 18:27:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76EA9600AD;
	Mon, 20 Jul 2026 18:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF581F000E9;
	Mon, 20 Jul 2026 18:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784572047;
	bh=fpgz63qvHBupygN3mQvY/iJ84B9krvFuOUSphu2lqfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJi1C8dLeB9ahq5RN6Tf2UNkh5SlJQsN/DYjI4AYhL66yHqZDmCxwOtILK8kktbzT
	 +j9cchAnNfyGNPjAPcuNVp2K2F4b8D0IjqGWEouhLltJtieFAwA2jPnMr3Molz5+TL
	 ETsCcQLWIfQ4Zf6U/mqrDwYIEqd9LQm5fi/uEDFoIORROQVzDJS0Z4IPFoyogdeZwm
	 B2mBlxnkQMNIpBDzAIpuMB8yckyTYYO02gb5V/Y/FhXRSWiCUktPK2Dof4Dh6MB2TN
	 3ex/tnqH1oT3lF/oFdDqh2sBM3DBA+5DevppR6lYKVE9ydrGO5VPRJivINUNXFeHKG
	 9VZOY4Me3KIWA==
Date: Mon, 20 Jul 2026 11:27:25 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 4/5] riscv: dts: thead: Add IO labels for the IO
 expansion on I2C1
Message-ID: <al5ojcKfJZkt3mHA@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-5-zhengxingda@iscas.ac.cn>
 <allEg/A+Gt/em0Hs@x1>
 <1E3154C2-B5BE-46FD-BBFC-87E56FAE3AFE@icenowy.me>
 <al5TWhx7pLIZguAc@gen8>
 <cb14e077de1722d1c36cd0bd877952289dc90abb.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb14e077de1722d1c36cd0bd877952289dc90abb.camel@icenowy.me>
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgMDE6Mjg6NThBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNi0wNy0yMOS4gOeahCAwOTo1NiAtMDcwMO+8jERyZXcgRnVzdGluaeWG
memBk++8mgo+ID4gT24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgMTI6MTE6MjNQTSArMDgwMCwgSWNl
bm93eSBaaGVuZyB3cm90ZToKPiA+ID4gCj4gPiA+IAo+ID4gPiDkuo4gMjAyNuW5tDfmnIgxN+aX
pSBHTVQrMDg6MDAgMDQ6NTI6MTnvvIxEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4K
PiA+ID4g5YaZ6YGT77yaCj4gPiA+ID4gT24gVHVlLCBKdWwgMTQsIDIwMjYgYXQgMDM6NDU6MTRQ
TSArMDgwMCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiA+ID4gPiA+IEZyb206IEVtaWwgUmVubmVy
IEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBBZGQgbGFiZWxzIGZvciBHUElPcyBvbiB0aGUgSU8gZXhwYW5zaW9uIGNoaXAg
b24gdGhlIEkyQzEgYnVzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFbWls
IFJlbm5lciBCZXJ0aGluZwo+ID4gPiA+ID4gPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNh
bC5jb20+Cj4gPiA+ID4gPiBbSWNlbm93eTogU3BsaXR0ZWQgb2ZmIHRoZSBwYXRjaCBhZGRpbmcg
YWxsIDMgSU8gZXhwYW5zaW9uc10KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhl
bmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiDCoGFy
Y2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMgfCA4ICsrKysr
KysrCj4gPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIw
LWxpY2hlZS1waS00YS5kdHMKPiA+ID4gPiA+IGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90
aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gPiA+ID4gaW5kZXggNzRiMTIwYzZiMDYzYS4uNzhm
NTk3OWE1NmMxNCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhl
YWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPiA+ID4gPiA+IEBAIC0xMjgsNiAr
MTI4LDE0IEBAIGlvZXhwMjogZ3Bpb0AxOCB7Cj4gPiA+ID4gPiDCoAkJcmVnID0gPDB4MTg+Owo+
ID4gPiA+ID4gwqAJCWdwaW8tY29udHJvbGxlcjsKPiA+ID4gPiA+IMKgCQkjZ3Bpby1jZWxscyA9
IDwyPjsKPiA+ID4gPiA+ICsJCWdwaW8tbGluZS1uYW1lcyA9ICIiLAo+ID4gPiA+ID4gKwkJCQnC
oCAiY2FtMF9yZXNldCIsCj4gPiA+ID4gPiArCQkJCcKgICJjYW0xX3Jlc2V0IiwKPiA+ID4gPiA+
ICsJCQkJwqAgImNhbTJfcmVzZXQiLAo+ID4gPiA+ID4gKwkJCQnCoCAid2xfaG9zdF93YWtlIiwK
PiA+ID4gPiAKPiA+ID4gPiBJIGFtIG5vdCBzdXJlIHRoZSBsaW5lIG5hbWUgcmVhbGx5IG1hdHRl
cnMgYWxsIHRoYXQsIGJ1dCBpdCBzZWVtcwo+ID4gPiA+IHRoYXQKPiA+ID4gPiBwaW4gNCBpcyBh
bHNvIHVzZWQgYXMgYSByZXNldCBncGlvOgo+ID4gPiAKPiA+ID4gVGhlICJob3N0IiBoZXJlIGlz
IHN1YmplY3QsIHdoaWNoIG1lYW5zICJ0aGlzIHBpbnMgaXMgdXNlZCBieSB0aGUKPiA+ID4gaG9z
dCB0byB3YWtlIHRoZSB3bCIuCj4gPiA+IAo+ID4gPiBNYXliZSBJIHNob3VsZCB0YWtlIHRoZSBz
Y2hlbWF0aWNzIG5hbWUsICJ3bF9ob3N0X3dha2VfZGV2Ij8gT3IgdXNlCj4gPiA+IGFub3RoZXIg
bmFtZSBvbiB0aGUgcGFnZSBmb3IgV2ktRmksICJ3bF9yZWdfb24iPwo+ID4gCj4gPiBJIHRobmsg
IndsX2hvc3Rfd2FrZV9kZXYiIGlzIHNsaWdodGx5IGJldHRlciBpbiB0ZXJtcyBvZiBzZWFyY2hp
bmcKPiA+IHRoZQo+ID4gUERGIFsxXSBhbmQgZmluZGluZyB0aGUgIklPIEV4cGFuc2lvbiAyIiBz
ZWN0aW9uLiBUaGlzIGlzIG1pbm9yCj4gPiBjaGFuZ2UKPiA+IHNvIEkgY2FuIGp1c3QgZml4IHVw
IHdoZW4gYXBwbHlpbmcgaWYgeW91IGFyZSBva2F5IHdpdGggdGhhdC4KPiAKPiBPZiBjb3Vyc2Ug
SSBhbSBva2F5IHdpdGggdGhpcy4KPiAKPiBUaGFua3MsCj4gSWNlbm93eQoKR3JlYXQsIEknbGwg
Zml4dXAgb24gYXBwbHkuCgpSZXZpZXdlZC1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5l
bC5vcmc+ICAgIAoKVGhhbmtzLApEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
