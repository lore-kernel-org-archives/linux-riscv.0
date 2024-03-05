Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38222C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 18:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDO8IJSZ4EAMysZlk8r0ffc7HKe2aGtqf2Yd7PENPBo=; b=YABfkm1G3oTczm
	CscW6+0m3/uqJUURC1K+Cpsqi7O0Obq2Vpxg5GBzZrNuRCDkTRfy3Kt5qVAe0WFb/ziSjfJauyTe5
	pTBxniIxSGwBTM2njBVNdvSzkxHVz/CJFP49gydzRTlVCGO3uc14mr58pU5YJggbhFBqsnL+asOuf
	YQ9NZTn16GCbAY8CQ/8LLsXErprDJL59dzIvGds+wNlWa4kVN8kZfRh8T/the+7frP/aA+q6n1Bl2
	ui4UFIn0cR+I9USFPoQTSwdY/VVqfOcThJSqERDXhSnntXfvMrtrZJ9hsz2QbBBDLPoPbjmB6CZsy
	4TH1oq4UeVyxR1HDqI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZaa-0000000ErWu-2d7N;
	Tue, 05 Mar 2024 18:32:32 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZaW-0000000ErVd-0xc7
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 18:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709663542; bh=d+kTQqs56hEdA/J+nt265wjTS9zlpPPPEe2AQ1DBrK8=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=VvMhsHbRkWtnuiD4186yxFfJG9MQR75thEL2V/yNPEj+1tz9MG5Zp8ftMjCKNOEWA
	 d4GpucP5+U2rDeZxOAT120YYmzfynVi0wSBVYMGoyijszBBXKLKqBSo9Dwmdbbmlsk
	 f2ohgbnNvdaBYRbLZxMAz+yhW8BGqmiiSm7qyrQM=
Received: from smtpclient.apple ([2001:da8:c800:d084:84f7:c158:bab8:8899])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 81283222; Wed, 06 Mar 2024 02:32:18 +0800
X-QQ-mid: xmsmtpt1709663538tl2ajfv2w
Message-ID: <tencent_4B189E90E5C66BBE3EC1386D32C715DCF407@qq.com>
X-QQ-XMAILINFO: NJ/+omVLhVgagmpidtm5HSHBgBqIXOrSOPIHRoXnn6toxcP2mSDvTvhAT4+3eJ
	 Sa0aDbfx+/GgyXyxqSa/eaVsT/ozJp30wkBBZHgmP6RHaE5PRqQnwLRJEpDCcFkE4FdoHidjzEte
	 XvEyL5qAeaeZyGTsjtar6rYrLT85pxfca6/Qtnz6dpea+lmdufCPCcvDGqaFPrdwXJiieH9Lg080
	 6sf9X4nD0a2rXUuCERx+Eptb1pAmDhBjvYZT87nCoAapCau0r7wlKBWr/pEUaeTK06qxLRhGdqWh
	 +pP/Itxm7tMYSjE/jft0vUSs4/cUve+FHOXjtgFhZdCz8450Tf50tVjcS8GhT85dzU4x7QXdICuo
	 yIYhtdgFYu7hrpiBUhD8bV+mUvj/kgSfrpp1rYkjYFn6bO54KeohAHD+fO1c+r3kYLL7nhbE41Vp
	 I6k7HAmovJOZPBt/nEXqHKfdMNXqSEOzLQV60J+saHB9WFnribuH8HtqXdKfKD9hf/eAXA8FSvGc
	 aJHIlWTKeF0M7v8fAPkPpaB6ePdpU+/p2CbCwmlqA2XFlWutSZr/xl9uyE4otZrPp4u7BtzI4ibv
	 4wlS93tVGpmgZhI4FtCyLV7QuP42vzIkzCvX9U2Y34UCDoYfJu9NHLMBJrw7t3LIm+bkTCPE56w6
	 L63LpPBKQIi1NA7HK/PbjU0Z0anfDnWxto9s+GoPDz40v/lOE6nafb1QoUrUfqQssYboo83uufI2
	 O07JXdwpA0VegJnJS25eISXxPNuosMiqbrJaaZRAHmgVkHhWQRxWwiB5wn/Q/Zb7bwlvh7Lvdgkt
	 VvWiIVcEHm8xk10ytYjV+BpkCA856C1JVbPkSlPY5d9yHu4/i9//M7oMTpHofRpP/zVlihEKRSBb
	 lfvs0OUqc/kpb6N8HDTjt7OIfCUHxdpxaMkehK3n0eccsivWS6X56W5ebDVR21Jju0TZK2Rzcfu0
	 kCexfBUfhoBUJuAw7qOQ9QYEpI3DHM4SlTf4DpktPInYZ0QGOzcmomoAFxHqOXi4/JnEm2FI+fvj
	 LPcndT/O1/UtG/gBsvF7fWyf9nCNhYgO8Rt7B0hVn8bFJeJ46p
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: Resend: Re: [PATCH v3 5/7] riscv: Kconfig.socs: Allow SOC_CANAAN
 with MMU for K230
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <tencent_AA20462764AFF185EF405043DBC99119F705@qq.com>
Date: Wed, 6 Mar 2024 02:32:08 +0800
Cc: Damien Le Moal <dlemoal@kernel.org>,
 linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
X-OQ-MSGID: <444AB6B6-283A-49ED-8CEF-0FE76A4B5DB5@cyyself.name>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_0432DA968E39B81431F921F38D747C008208@qq.com>
 <ef8df22f-dac8-4652-bf17-d10254e6abfb@kernel.org>
 <tencent_E56A833916E00EC7B4840C34FAF1250ADE0A@qq.com>
 <20240305-fascism-enrich-06483ddeb149@spud>
 <tencent_AA20462764AFF185EF405043DBC99119F705@qq.com>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_103228_660614_43C422DB 
X-CRM114-Status: GOOD (  30.72  )
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

Cj4gT24gTWFyIDYsIDIwMjQsIGF0IDAxOjUwLCBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYubmFt
ZT4gd3JvdGU6Cj4gCj4gVGhlIGxhc3QgZW1haWwgd2FzIG5vdCByZWNlaXZlZCBpbiB0aGUgbGlz
dCBkdWUgdG8gSSBkaWRu4oCZdCBjaGFuZ2UgdGhlIG1vZGUKPiB0byBwbGFpbnRleHQuIFNvcnJ5
IGZvciB0aGF0LiBUaGlzIGlzIGEgcmVzZW5kIGVtYWlsLgo+IAo+PiBPbiBNYXIgNiwgMjAyNCwg
YXQgMDE6MjAsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+IAo+PiBP
biBUdWUsIE1hciAwNSwgMjAyNCBhdCAwMzo0NzoxNVBNICswODAwLCBZYW5neXUgQ2hlbiB3cm90
ZToKPj4+IE9uIDIwMjQvMy81IDA3OjQ2LCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPj4+PiBPbiAz
LzUvMjQgMDY6MDUsIFlhbmd5dSBDaGVuIHdyb3RlOgo+Pj4+PiBTaW5jZSBLMjMwIHdhcyByZWxl
YXNlZCwgU09DX0NBTkFBTiBpcyBubyBsb25nZXIgb25seSByZWZlcnJlZCB0byB0aGUgSzIxMC4K
Pj4+Pj4gUmVtb3ZlIGl0IGRlcGVuZHMgb24gIU1NVSB3aWxsIGFsbG93IGJ1aWxkaW5nIGR0cyBm
b3IgSzIzMCBhbmQgcmVtb3ZlIHRoZQo+Pj4+PiBLMjEwIHN0cmluZyBmcm9tIHRoZSBoZWxwIG1l
c3NhZ2UuCj4+Pj4+IAo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNl
bGYubmFtZT4KPj4+Pj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1p
Y3JvY2hpcC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBhcmNoL3Jpc2N2L0tjb25maWcuc29jcyB8IDUg
KystLS0KPj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPj4+Pj4gCj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcyBiL2Fy
Y2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4+Pj4+IGluZGV4IDYyM2RlNWY4YTIwOC4uYjRlOWI3Zjc1
NTEwIDEwMDY0NAo+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+Pj4+PiArKysg
Yi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+Pj4+PiBAQCAtNzUsMTMgKzc1LDEyIEBAIGNvbmZp
ZyBBUkNIX0NBTkFBTgo+Pj4+PiAgZGVmX2Jvb2wgU09DX0NBTkFBTgo+Pj4+PiBjb25maWcgU09D
X0NBTkFBTgo+Pj4+PiAtIGJvb2wgIkNhbmFhbiBLZW5kcnl0ZSBLMjEwIFNvQyIKPj4+Pj4gLSBk
ZXBlbmRzIG9uICFNTVUKPj4+PiAKPj4+PiBUaGlzIHNlZW1zIHdyb25nIHRvIG1lLiBUaGUgazIx
MCBzdXBwb3J0IGRvZXMgcmVxdWlyZSBuby1tbXUuIFNvIHdoeSByZW1vdmUKPj4+PiB0aGlzID8K
Pj4+IAo+Pj4gSXQganVzdCBhbGxvd3MgU09DX0NBTkFBTiB0byBiZSBzZWxlY3RlZCB3aGVuIE1N
VT15LiBXaXRoIHRoaXMgcGF0Y2gsCj4+PiBub21tdV9rMjEwX2RlZmNvbmZpZyBzdGlsbCB3b3Jr
cy4KPj4gCj4+IEkgdGhpbmsgdGhlIGNvbmNlcm4gaGVyZSBpcyB0aGF0IHRoaXMgd291bGQgYWxs
b3cgcGVvcGxlIHRvIGJ1aWxkIGEKPj4ga2VybmVsIGZvciB0aGUgazEyMCB3aXRoIHRoZSBNTVUg
ZW5hYmxlZCwgbm90IHRoYXQgdGhlIGV4aXN0aW5nIG5vbW11Cj4+IGJ1aWxkIHdpbGwgYmUgYWZm
ZWN0ZWQuCj4+IAo+IAo+IEFoYS4gSSBkb24ndCB0aGluayBpcyB0aGVyZSBhbnlvbmUgd2lsbCB0
cnkgYSBidWlsZCB3aXRoIE1NVSBvbgo+IEsyMTAuIEl0IG9ubHkgaGFzIDZNQiBvZiBtZW1vcnkg
YXZhaWxhYmxlIHRvIHRoZSBDUFUuIEZvciBydjY0IGlmCj4gdGhlIFMtTW9kZSBzb2Z0d2FyZSBz
dGFydHMgYXQgMk1CLCBpdCB3aWxsIG9ubHkgaGF2ZSA0TUIgZm9yIFMtTW9kZQo+IExpbnV4LiBJ
dCdzIGhhcmQgdG8gdHJpbSB0aGUga2VybmVsIGFuZCBmaXQgaW4gNE1CIGFuZCBldmVuIHByZXNl
cnZlCj4gc29tZSBtZW1vcnkgZm9yIHVzZXJzcGFjZS4KPiAKPiBJIGFsc28gdHJpZWQgdG8gbWFr
ZSBub21tdV9rMjEwX2RlZmNvbmZpZyBvbiBnY2MgMTMuMi4wLCBpdCBwcm9kdWNlZCBhCj4gMS42
TSBrZXJuZWwgaW4gYXJjaC9yaXNjdi9ib290L0ltYWdlLiBCdXQgaWYgSSB1c2UgbmNvbmZpZyB0
byBzZXQKPiBDT05GSUdfTU1VPXkgYW5kIHJlYnVpbGQsIHRoZSBrZXJuZWwgZmlsZSB3aWxsIGlu
Y3JlYXNlIHRvIDExTS4KPiAKCkFub3RoZXIgaW50ZXJlc3RpbmcgZmluZGluZyBpcyB0aGF0IHRo
ZSByb290IGNhdXNlIG9mIHRoZSBodWdlIGtlcm5lbCBpcwpiZWNhdXNlIENPTkZJR19TVFJJQ1Rf
S0VSTkVMX1JXWC4gSWYgd2UgdHVybiBpdCBvZmYsIHRoZSBzaXplIHdpbGwKcmVkdWNlZCB0byAx
LjlNLiBOb3Qgc28gbXVjaCBmb3IgdXNlcnNwYWNlIGJ1dCBzZWVtcyBvayB0byBib290LgoKVGhh
dCBpcyBiZWNhdXNlIHdlIGRlZmluZWQgU0VDVElPTl9BTElHTiB0byAyTUIgdG8gZml0IHdpdGgg
b25lIFBNRCBvbgpydjY0IHRvIHJlZHVjZSB0aGUgbWlzcyBvZiBUTEIuIEhvd2V2ZXIsIGl0IGlu
Y3JlYXNlZCB0aGUga2VybmVsIHNpemUuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi9kNzhjNjAxZDU1M2RkZTc5MTA1N2I1NDI1MjA2NDIyMWY5NjA1NDZlLjE1ODYz
MzIyOTYuZ2l0LnpvbmcubGlAc2lmaXZlLmNvbS8KCkkga25vdyBNTVUgb24gSzIxMCBpcyBub3Qg
c3RhbmRhcmQgYXMgbm93LiAKCk1heWJlIEkgc2hvdWxkIGNhcmUgYWJvdXQgdGhhdC4gSSB3aWxs
IGZpeCB0aGlzIGZvciBwYXRjaCB2NC4KCj4+IE1heWJlIHlvdSBjb3VsZCBzcXVhc2ggaW4gc29t
ZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZz8KPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L0tjb25maWcuc29jcyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4+IGluZGV4IGI0ZTliN2Y3
NTUxMC4uNzVkNTUwNTkxNjNmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcuc29j
cwo+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+PiBAQCAtNzIsMTUgKzcyLDE5IEBA
IGNvbmZpZyBTT0NfVklSVAo+PiAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIFFFTVUgVmlydCBN
YWNoaW5lLgo+PiAKPj4gY29uZmlnIEFSQ0hfQ0FOQUFOCj4+IC0gZGVmX2Jvb2wgU09DX0NBTkFB
Tgo+PiArIGJvb2wgIkNhbmFhbiBLZW5kcnl0ZSBTb0NzIgo+PiArIGhlbHAKPj4gKyAgIFRoaXMg
ZW5hYmxlcyBzdXBwb3J0IGZvciBDYW5hYW4gS2VuZHJ5dGUgU29DIHBsYXRmb3JtIGhhcmR3YXJl
Lgo+PiAKPj4gY29uZmlnIFNPQ19DQU5BQU4KPj4gLSBib29sICJDYW5hYW4gS2VuZHJ5dGUgU29D
Igo+PiArIGJvb2wgIkNhbmFhbiBLZW5kcnl0ZSBLMjEwIFNvQyIKPj4gKyBkZXBlbmRzIG9uICFN
TVUKPj4gKyBkZXBlbmRzIG9uIEFSQ0hfQ0FOQUFOCj4+IHNlbGVjdCBDTElOVF9USU1FUiBpZiBS
SVNDVl9NX01PREUKPj4gc2VsZWN0IEFSQ0hfSEFTX1JFU0VUX0NPTlRST0xMRVIKPj4gc2VsZWN0
IFBJTkNUUkwKPj4gc2VsZWN0IENPTU1PTl9DTEsKPj4gaGVscAo+PiAtICAgVGhpcyBlbmFibGVz
IHN1cHBvcnQgZm9yIENhbmFhbiBLZW5kcnl0ZSBTb0MgcGxhdGZvcm0gaGFyZHdhcmUuCj4+ICsg
ICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgQ2FuYWFuIEtlbmRyeXRlIEsyMTAgU29DIHBsYXRm
b3JtIGhhcmR3YXJlLgo+PiAKPj4gZW5kbWVudSAjICJTb0Mgc2VsZWN0aW9uIgo+PiAKPj4gKFdo
aWNoIHJlbWluZHMgbWUsIEkgcmVhbGx5IG5lZWQgdG8gZ28gYW5kIGZpbmlzaCBzb3J0aW5nIG91
dCB0aGUgQVJDSF8KPj4gc3R1ZmYpCj4gCj4gU2VlbXMgbGlrZSBhbiBpZGVhIGlmIHdlIHdhbnQg
dGhpcyBjb25zaWRlcmF0aW9uLiBCdXQgSSBkb24ndCB0aGluayB3ZSBuZWVkCj4gdGhpcyBhcyB0
aGUgb3BpbmlvbnMgc2hvd24gYWJvdmUuCj4gCj4gSWYgaXQgc2hvdWxkIGJlLCBJIHRoaW5rIFNP
Q19DQU5BQU4gc2hvdWxkIGJlIHJlbmFtZWQgdG8gU09DX0syMTAgb3IKPiBTT0NfQ0FOQUFOX0sy
MTAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
