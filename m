Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B794CAC5A5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 06:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUmBACgen7PiMoJxdkJBcUuWrpb8j895ypJd6f8kdZ0=; b=EEbkLWLYweRhbb
	1v5i7yi552kTrxKqUxyhFvgSBg8bjaJUQuOA9ZYn9ZMbm6Jz/TdJMqNugagcLtIxolGBThUez5Kpq
	a1w8A6NnQvGpDGYtbMs1bq4q1FAK3H21HS9cpTjBCuh2fDYEd99yPWCsUz5fAhuCNJHHG+Jp89YAA
	9pfDlhFnfvhcb53t3B2LLqM+sk/qJgHKTxTqQZR1yaXrJCIyHCJhRtJ8tk7Vj1bl4HgBfMPSmYngZ
	3xqTw2KQroONa/cEdibMsyXb9IfMMUEc7S0JNjp7z9/ddN9ZfXFuvxv6MduICWpACZNyU+LqebeMJ
	pwW2jrmFuPArzbZjBhWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wZp-0000000CZsn-3H2V;
	Tue, 23 Sep 2025 06:32:37 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wZm-0000000CZsS-2YVr
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 06:32:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758609104; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jyyQ4VyqYABbZiCkF/HdPD7D7w0rxpDQ/JZZEjz43JXuBVVcE5qdzpMfnLdJ4nhOsaU0+kMSh1yCVILeO48DHntz5RpE+1DGTUclfc1CulRH8tRBDFTDuDH2Yx5AsD64bCv+O9d3FdRSvp13bkSO7STumxN2gpAhK9KuS0KuuNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758609104; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kX0WMRIAiTlqH4/0kQPSeJfGukw8qs11oITboMapl7U=; 
	b=QolxLydcbootGKpejpHChM+hYoa2wrP5p2XzreJ85OhZ1nh3YgwMb00D/1wOjQCq9jAy1diZ0GeQkeGqskVaOhlxb0+o3pNXLghs9uKzr8XSbReDn72FT2rwBmF1kjqOpFY38+erNiM5T0WMu+ebStYFIso0TZslX19Hp6l+VM8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758609104;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kX0WMRIAiTlqH4/0kQPSeJfGukw8qs11oITboMapl7U=;
	b=lhVitvDPy9iTCKcGQL10bEW7RbrPWMPzwZm42zlvmidkeRnG8otydOlsA3bGf+1/
	R3lBHauN/Dk+BRPBLU93bFcXWuEPBzY8PZO+4SKnFWKvf1n7L9c7OgYAeL5OJVZzlYJ
	nhwOXTwaKDNJo6g3l8hW2s3+pumo9CSMJJSlTkoc=
Received: by mx.zohomail.com with SMTPS id 1758609101123227.34763562314959;
	Mon, 22 Sep 2025 23:31:41 -0700 (PDT)
Message-ID: <a9054501-03ce-4db2-a753-81741c6237b6@pigmoral.tech>
Date: Tue, 23 Sep 2025 14:31:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: define a SPI controller node
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250922161717.1590690-1-elder@riscstar.com>
 <20250922161717.1590690-4-elder@riscstar.com>
 <20250923001930-GYB1303776@gentoo.org>
 <ED4C67FD136DEB19+aNINJJVYbNnT87va@LT-Guozexi>
From: Junhui Liu <junhui.liu@pigmoral.tech>
In-Reply-To: <ED4C67FD136DEB19+aNINJJVYbNnT87va@LT-Guozexi>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_233235_082911_8C217D95 
X-CRM114-Status: GOOD (  19.44  )
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

SGkgVHJveSwKCk9uIDkvMjMvMjUgMTA6NTkgQU0sIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4gT24g
VHVlLCBTZXAgMjMsIDIwMjUgYXQgMDg6MTk6MzBBTSArMDgwMCwgWWl4dW4gTGFuIHdyb3RlOgo+
PiBIaSBBbGV4LAo+Pgo+PiBPbiAxMToxNyBNb24gMjIgU2VwICAgICAsIEFsZXggRWxkZXIgd3Jv
dGU6Cj4+PiBEZWZpbmUgYSBub2RlIGZvciB0aGUgZm91cnRoIFNvQyBTUEkgY29udHJvbGxlciAo
bnVtYmVyIDMpIG9uCj4+PiB0aGUgU3BhY2VtaVQgSzEgU29DLgo+Pj4KPj4+IEVuYWJsZSBpdCBv
biB0aGUgQmFuYW5hIFBpIEJQSS1GMyBib2FyZCwgd2hpY2ggZXhwb3NlcyB0aGlzIGZlYXR1cmUK
Pj4+IHZpYSBpdHMgR1BJTyBibG9jazoKPj4+ICAgIEdQSU8gUElOIDE5OiAgTU9TSQo+Pj4gICAg
R1BJTyBQSU4gMjE6ICBNSVNPCj4+PiAgICBHUElPIFBJTiAyMzogIFNDTEsKPj4+ICAgIEdQSU8g
UElOIDI0OiAgU1MgKGludmVydGVkKQo+Pj4KPj4+IERlZmluZSBwaW5jb250cm9sIGNvbmZpZ3Vy
YXRpb25zIGZvciB0aGUgcGlucyBhcyB1c2VkIG9uIHRoYXQgYm9hcmQuCj4+Pgo+Pj4gKFRoaXMg
d2FzIHRlc3RlZCB1c2luZyBhIEdpZ2FEZXZpY2UgR0QyNVE2NEUgU1BJIE5PUiBjaGlwLikKPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEVsZGVyIDxlbGRlckByaXNjc3Rhci5jb20+Cj4+PiAt
LS0KPj4+IHYzOiAtIE1vdmVkIHRoZSBTUEkgY29udHJvbGxlciBpbnRvIHRoZSBkbWEtYnVzIG1l
bW9yeSByZWdpb24KPj4+Cj4+PiAgIC4uLi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1m
My5kdHMgICAgICB8ICA3ICsrKysrKysKPj4+ICAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1p
dC9rMS1waW5jdHJsLmR0c2kgIHwgMjAgKysrKysrKysrKysrKysrKysrKwo+Pj4gICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kgICAgICAgICAgfCAxNiArKysrKysrKysrKysr
KysKPj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPj4+IGluZGV4
IDJhYWFmZjc3ODMxZTEuLmQ5ZDg2NWZiZTMyMGUgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwo+Pj4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPj4+IEBAIC0xNCw2ICsxNCw3
IEBAIGFsaWFzZXMgewo+Pj4gICAJCWV0aGVybmV0MCA9ICZldGgwOwo+Pj4gICAJCWV0aGVybmV0
MSA9ICZldGgxOwo+Pj4gICAJCXNlcmlhbDAgPSAmdWFydDA7Cj4+PiArCQlzcGkzID0gJnNwaTM7
Cj4+PiAgIAl9Owo+Pj4gICAKPj4+ICAgCWNob3NlbiB7Cj4+PiBAQCAtOTIsNiArOTMsMTIgQEAg
JnBkbWEgewo+Pj4gICAJc3RhdHVzID0gIm9rYXkiOwo+Pj4gICB9Owo+Pj4gICAKPj4+ICsmc3Bp
MyB7Cj4+PiArCXBpbmN0cmwtMCA9IDwmc3NwM18wX2NmZz47Cj4+PiArCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7Cj4+PiArCXN0YXR1cyA9ICJva2F5IjsKPj4+ICt9Owo+Pj4gKwo+Pj4gICAm
dWFydDAgewo+Pj4gICAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4+ICAgCXBpbmN0cmwt
MCA9IDwmdWFydDBfMl9jZmc+Owo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3BhY2VtaXQvazEtcGluY3RybC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9r
MS1waW5jdHJsLmR0c2kKPj4+IGluZGV4IGFmZjE5Yzg2ZDVmZjMuLjIwNWMyMDFhMzAwNWMgMTAw
NjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRz
aQo+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1waW5jdHJsLmR0c2kK
Pj4+IEBAIC03Niw0ICs3NiwyNCBAQCBwd20xNC0xLXBpbnMgewo+Pj4gICAJCQlkcml2ZS1zdHJl
bmd0aCA9IDwzMj47Cj4+PiAgIAkJfTsKPj4+ICAgCX07Cj4+PiArCj4+PiArCXNzcDNfMF9jZmc6
IHNzcDMtMC1jZmcgewo+PiAuLgo+Pj4gKwkJc3NwMy0wLW5vLXB1bGwtcGlucyB7Cj4+IEknZCBw
cmVmZXIgbm90IHRvIGVuZm9yY2UgInB1bGwiIGluZm8gaW5zaWRlIHRoZSBuYW1lLCB5b3UgY2Fu
J3QgZW1iZWQKPj4gYWxsIHByb3BlcnR5IGluZm8sIGJlc2lkZXMsIHdoYXQncyBpZiB5b3Ugd2Fu
dCB0byBjaGFuZ2Uvb3ZlcnJpZGUgbGF0ZXI/Cj4+Cj4+IGhvdyBhYm91dCBqdXN0IG5hbWUgaXQg
YXMgc3NwMy0wLWRlZmF1bC1waW5zIG9yIHNpbXBseSBzc3AzLTAtcGlucz8KPiB1YXJ0OiB1YXJ0
MF8yX2NmZyBhbmQgZnVuY3Rpb24gaXMgMi4KPiBwd206IHB3bTE0XzFfY2ZnIGFuZCBmdW5jdGlv
biBpcyA0Cj4gc3BpOiBzc3AzXzBfY2ZnIGFuZCBmdW5jdGlvbiBpcyAyCj4KPiBJ4oCZbSBhIGJp
dCBjb25mdXNlZCBhYm91dCB0aGUgbWVhbmluZyBvZiB0aGUgc2Vjb25kIG51bWJlciBoZXJlLgo+
IElzIGl0IGludGVuZGVkIHRvIGJlIGFuIGluZGV4LCBvciB0aGUgZnVuY3Rpb24gbnVtYmVyPwo+
Cj4gSWYgaXTigJlzIGFuIGluZGV4LCBzaG91bGQgaXQgc3RhcnQgZnJvbSAwIG9yIDE/Cj4gVGhl
IHN0YXJ0aW5nIHBvaW50IHNlZW1zIGluY29uc2lzdGVudCBhY3Jvc3MgcHdtL3NwaS91YXJ0Lgo+
IElmIGl04oCZcyBzdXBwb3NlZCB0byBiZSB0aGUgZnVuY3Rpb24gbnVtYmVyLAo+IHRoZW4gdGhl
IHNwaSBhbmQgcHdtIHBhcnRzIGxvb2sgaW5jb3JyZWN0Lgo+Cj4gQ291bGQgeW91IGNsYXJpZnkg
dGhpcz8gWWl4dW4uCgpJIHRoaW5rIHRoZSBzZWNvbmQgbnVtYmVyIHJlcHJlc2VudHMgdGhlIGlu
ZGV4IG9mIHRoZSBwaW4gZ3JvdXAgYXZhaWxhYmxlCmZvciB0aGlzIGRldmljZS4KClRha2UgcHdt
MTQgYXMgYW4gZXhhbXBsZTogYWNjb3JkaW5nIHRvIHRoZSBtYW51YWwsIHRoZSBmaXJzdCBwaW4g
Z3JvdXAKKGluZGV4IDApIGF2YWlsYWJsZSBmb3IgcHdtMTQgaXMgR1BJTzYgd2l0aCBmdW5jdGlv
biAzLCB3aGlsZSB0aGUgc2Vjb25kCmdyb3VwIChpbmRleCAxKSBpcyBHUElPNDQgd2l0aCBmdW5j
dGlvbiA0LgoKPiAgICAgICAgICAgICAgICAgIC0gVHJveQoKLS0gCkJlc3QgcmVnYXJkcywKSnVu
aHVpIExpdQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
