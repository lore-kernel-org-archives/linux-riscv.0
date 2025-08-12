Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DD1CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 20:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WN1IW/CZ+Z4d13YYXjxBYt8oNfW+qvtKxdg+HRWjcc=; b=HX3lNr0LMM5stb
	TQQqmV2MuE7k4bYwcLJdcGTKuI8HiX7qa0bYTAbI87mbT8hTH3KFhwOs7jHBHuEckVOrp+53C6MsO
	Pq/Av53TVKAocruEItf5+8Nhp+r0s0V40mnbdLiwleUzm9/N/crEIW8Cj/623kkDmawExHdDYR8NL
	kKuZosX3sXAGKdByY7CDxu/vO2PoYYdZ7fpaL5NtN3C7oG0LRX9pGw/PBA0sva2wgGw9eUbOBGq+2
	C/sUWFE9E7iMGWJvRWGtslMfPbl6568UbJVjz9B8SuyJwoahnWUAxc/5yrqiJ1mT1B0c8cHGFz0qS
	IRxGh5WuucbbUMp7OYkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvo9-0000000BzQt-0mFK;
	Tue, 12 Aug 2025 20:41:21 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulv1N-0000000Bt6P-0cU4
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 19:50:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755028251; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yu2uMhrYNyWUaUAxeXazZGYnC3OQ+fFsVVXyioRB4l3zGU87q0jdihf0lF8RdXAatkxjDYHB5wzC0tAYBK26tHxrMoyOU7lZSgBQTaHo1WPpicRM7U+0CnN1VZUdGnY9uJL7OVhDraYf+wgtD6ZdLOW6pBMaYi+3wMab5Mvo7ww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755028251; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zxtnfHjBmtD/lxeHHqZiSVIbM/qGuG4divGdFW2qdi4=; 
	b=LBV1vkfZBkH5KA+5yDrt9f1dGHl+GXtTUACqb/JLXqH7xqcffzywwLe6Lnpnz/zwWRMYrIHd9MuRmeZN8n1x4upmZYjCPKAEr0941g2YNhVWp1qcpNSX0X1Aiw1K+RJPrl2EkHsN7YMYh6z63vCmdKDeEv96ODvyCN0LxGAPjmk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755028251;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=zxtnfHjBmtD/lxeHHqZiSVIbM/qGuG4divGdFW2qdi4=;
	b=eMaxHeqi/xXZKL/Enk0BfHNra7ug75xEgLch8DA1wWP6u7eVWwiu5R+SWQcTjwdW
	hSWxMzgRAu4b8Q6pvL9yLpf9TC9+imJfrVMH7pWoZEMiNh4fYl7U+lc3cKuIwTO9Pav
	98dsHfouGehJ/S1QgxIm6qmpkgiT4JFFiOwtNN0fmjMS/jcBW1gBO/vfXaZ2K/l6agb
	eOSh36HYmKFdkGjrHHa50R+Fq5I4npRJQrBfMwtBslImpci1f2wMWH9ayCaW6PIs0/Z
	Kf2NczJdEpkPu7Af5XlSlCJA9kOq2CwyMAg3rDxmbOhmFBtVoAJjuW73GYTfkZj1M1r
	uqHlEasbIA==
Received: by mx.zohomail.com with SMTPS id 175502824888099.24369588420063;
	Tue, 12 Aug 2025 12:50:48 -0700 (PDT)
Message-ID: <5909560f051cb17bcbdcad4142cf99b03e1a4c3a.camel@icenowy.me>
Subject: Re: [PATCH 0/4] clk: thead: Misc changes to TH1520 clock driver
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Michal
 Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 13 Aug 2025 03:50:45 +0800
In-Reply-To: <aJtqrz9y4/hR8fEu@x1>
References: <20250812054258.1968351-1-uwu@icenowy.me>
	 <50a61990b5009217dcc0ed74142c4ffeba137f73.camel@icenowy.me>
	 <aJtqrz9y4/hR8fEu@x1>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_125057_257917_2488D861 
X-CRM114-Status: GOOD (  24.87  )
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

5ZyoIDIwMjUtMDgtMTLmmJ/mnJ/kuoznmoQgMDk6MjQgLTA3MDDvvIxEcmV3IEZ1c3Rpbmnlhpnp
gZPvvJoKPiBPbiBUdWUsIEF1ZyAxMiwgMjAyNSBhdCAwOTo0MjoyM1BNICswODAwLCBJY2Vub3d5
IFpoZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjUtMDgtMTLmmJ/mnJ/kuoznmoQgMTM6NDIgKzA4MDDv
vIxJY2Vub3d5IFpoZW5n5YaZ6YGT77yaCj4gPiA+IFRoaXMgcGF0Y2hzZXQgaXMgbXkgY2hhbmdl
cyB0byB0aGUgVEgxNTIwIGNsb2NrIGRyaXZlciwgbWFpbmx5Cj4gPiA+IGZvcgo+ID4gPiBzdXBw
b3J0aW5nIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgKHRoZSBmaXJzdCAzKS4KPiA+ID4gCj4gPiA+
IFRoZSBmaXJzdCB0d28gYXJlIGZ1bmN0aW9uYWxpdHkgYWRkaXRpb25zLCB3aXRoIHRoZSBmaXJz
dCBvbmUKPiA+ID4gYWRkaW5nCj4gPiA+IHN1cHBvcnQgZm9yIGVuYWJsaW5nL2Rpc2FibGluZyBQ
TExzIChmb3IgRFBVIFBMTCkgYW5kIHRoZSBzZWNvbmQKPiA+ID4gb25lCj4gPiA+IGFkZGluZyBz
dXBwb3J0IGZvciBjaGFuZ2luZyBEUFUgZGl2aWRlcnMuCj4gPiA+IAo+ID4gPiBUaGUgM3JkIG9u
ZSBpcyB0byBhZGRyZXNzIGhhbmcgaXNzdWVzIG1ldCB3aGVuIHRlc3RpbmcgdGhlIERQVQo+ID4g
PiBkcml2ZXIKPiA+ID4gdy9vIGNsa19pZ25vcmVfdW51c2VkIGNvbW1hbmQgbGluZSBvcHRpb24u
Cj4gPiA+IAo+ID4gPiBUaGUgNHRoIG9uZSBoYXMgbm8gcmVsYXRpb25zaGlwIHRvIGRpc3BsYXks
IGFuZCBvbmx5IGV4aXN0cyBmb3IKPiA+ID4gbXkKPiA+ID4gbmVlZAo+ID4gPiB0byBjaGFuZ2Ug
YW4gYXJiaXRyYXJ5IEdQSU8gKHdlbGwsIEdQSU8zXzMsIHRoZSBvbmUgY29udHJvbGxpbmcKPiA+
ID4gdGhlCj4gPiA+IGZhbgo+ID4gPiBvbiBMaWNoZWUgUGkgNEEpIHdpdGggZ3Bpb3NldC4KPiA+
ID4gCj4gPiA+IFRoaXMgcGF0Y2hzZXQgaGFzIGEgZGVwZW5kZW5jeSAoYSAwdGggb25lKSBbMV0u
Cj4gPiA+IAo+ID4gPiBbMV0KPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvMjAyNTA4MDktZml4X2Nsb2Nrc190aGVhZF9hdWdfOS12MS0xLTI5OWMzM2Q3YTU5M0BzYW1z
dW5nLmNvbS8KPiA+ID4gCj4gPiAKPiA+IE9vcHMsIGxvb2tzIGxpa2UgdGhpcyBwYXRjaHNldCBk
ZXNlcnZlcyBhIG5ldyByZXZpc2lvbiBub3cuLi4KPiAKPiBUaGFua3MsIHRoYXQgZG9lcyBtYWtl
IGl0IGVhc2llciB0byBhcHBseSB3aXRoICdiNCBzaGF6YW0nLgo+IAo+ID4gUEFUQ0ggMi80IGhh
cyBhIHJvdW5kX3JhdGUoKSBpbXBsZW1lbnRhdGlvbiwgd2hpY2ggaXMgY29uc2lkZXJlZAo+ID4g
b3V0LQo+ID4gb2YtZGF0ZSBhbmQgZGV0ZXJtaW5lX3JhdGUoKSB3aWxsIHJlcGxhY2UgaXQuCj4g
Cj4gSSBzYXcgeW91ciByZXBseSBvdmVyIGluIHRoZSBiaWcgcGF0Y2hzZXQgZnJvbSBCcmlhbiBN
YXNuZXkuIFRoYXQncwo+IGdvb2QKPiB0aGF0IHdlIHdpbGwgYmUgYWJsZSB0byBza2lwIGFkZGlu
ZyByb3VuZF9yYXRlKCkgdG8gdGhlIGRyaXZlci4KPiAKPiA+IFBBVENIIDMvNCB3YXMgYnJva2Vu
IGR1cmluZyByZWJhc2luZy4KPiA+IAo+ID4gUEFUQ0ggNC80IGlzIGZvdW5kIHRvIGJlIG5vdCB3
b3JraW5nIChhbmQgZXZlbiBtYWtlcyBwYWRjdHJsMCBhbgo+ID4gb3JwaGFuCj4gPiBjbG9jayku
IFlhbyBaaSB0b2xkIG1lIHRoYXQgSSBuZWVkIHRvIGZpcnN0IGRvIHNvbWUgY2hhbmdlcyB0bwo+
ID4gY2N1X2dhdGUKPiA+IGNvZGUuCj4gCj4gSXMgdGhlcmUgYSB3YXkgdG8gdGVzdCB0aGUgZnVu
Y3Rpb25hbGl0eSB3aXRob3V0IGFkZGl0aW9uYWwgcGF0Y2hlcwo+IGZyb20KPiB5b3VyIGJyYW5j
aD8KClRvIGJlIGhvbmVzdCBJIGtub3cgYWJvdXQgbGl0dGxlLi4uCgpUaGUgNHRoIHBhdGNoIGlz
IHRoZSBvbmx5IG9uZSBlYXN5IHRvIHRlc3QsIGJ1dCBpdCdzIGJyb2tlbi4uLiAoQQpyZWZhY3Rv
ciBtdXN0IGNvbWUgd2l0aCBpdCB0byBtYWtlIGl0IHdvcmspLgoKRm9yIHBhdGNoIDF+MywgaWYg
eW91IGFyZSBicmF2ZSBlbm91Z2gsIGluIGZpbGUgZHJpdmVycy9jbGsvY2xrLmMsCmNoYW5nZSB0
aGUgbGluZSBgI3VuZGVmIENMT0NLX0FMTE9XX1dSSVRFX0RFQlVHRlNgICdzIGAjdW5kZWZgIHRv
CmAjZGVmaW5lYCBtYXkgZ2l2ZSB5b3Ugc29tZSB0ZXN0aW5nIGZhY2lsaXR5IGluIGRlYnVnZnMg
LS0gd3JpdGluZyBzb21lCmNsb2NrIHJhdGUgKGUuZy4gMTQ4NTAwMDAwKSB0byAvc3lzL2tlcm5l
bC9kZWJ1Zy9jbGsvZHB1MS0KcGl4ZWxjbGsvY2xrX3JhdGUgYW5kIHRoZW4gMSB0byAvc3lzL2tl
cm5lbC9kZWJ1Zy9jbGsvZHB1MS0KcGl4ZWxjbGsvY2xrX3ByZXBhcmVfZW5hYmxlIGluIHRoaXMg
c2l0dWF0aW9uIGNvdWxkIG1pbWljIHdoYXQgdGhlIERDCmRyaXZlciBkb2VzIC0tIEkgYmVsaWV2
ZSBpbiAvc3lzL2tlcm5lbC9kZWJ1Zy9jbGsvY2xrX3N1bW1hcnkgdGhlCmVmZmVjdCBjYW4gYmUg
c2hvd24gKGRwdTEtcGxsIGhhcmR3YXJlIGVuYWJsZSBiZWNvbWVzIFkgYW5kIGRwdTEtCnBpeGVs
Y2xrIHNob3dzIHRoZSBleHBlY3RlZCByYXRlLgoKV0FSTklORzogVEhFIFBBUkFHUkFQSCBBQk9W
RSBJUyBPTkxZIEJBU0VEIE9OIE1ZIFJFQURJTkcgT0YgQ09ERSwgTk9UClZFUklGSUVELCBDQU4g
R0VUIEEgRFJBR09OIFRPIEJVUk4gWU9VUiBIT1VTRS4KCj4gCj4gSSBsb29rIGZvcndhcmQgdG8g
djIuIFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGUgZGlzcGxheS4gCj4gCj4gLURyZXcKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
