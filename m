Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9492C61DB9
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 18:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lp4hfc8XuqYa6ohPfTWRpidzqJSZXkmk7W3DMx8P/ls=; b=bOjMuX17LI58yy
	losEv7m8wEGib4324uH5jp0IN+3hQp5QE9ZVF8sZV54V//zsL2RuKwqD3PAjb3VdvD6UqrslVXo7A
	SJOdDOzWbyVUliFWTQQWYfKhkbOGzpoGSf858DTA7wOJQcAzgx93ttkpiGtoOGJijcE+Ah2rGFHnc
	QjGieOdmGOdVkQyJg6as79vNIfhkK3sVxmFHP+9LDOxeu+iNP5kwDWMSheJ5MhkbmKKQJH6Z1UviJ
	of6qJzCBnMeMn2ykaDBzWmEztzReQgMWgSns9wBs/gyjIIXERocDrd8Yig6D4LvWtESbnzaALQrN1
	2RnBc0dGngA47r0DZeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0key-000000080Ji-2SgT;
	Sun, 30 Aug 2026 18:53:40 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0kev-000000080JJ-3GuE
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 18:53:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788116008; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J9pPgTGIWkMZT/3kcW8s3iyH3mjyqeElsf5bAvw8Faod+/zY3tXC+Tu8SjrvaiY/iqb0I5EeACcU2ERDgrPyil2AHWMMEGiT/bpTq6Hhiw1YbDpHuSn+TOlcsZtvMBXkAktzrJN9ZACKEvXrfASlW03X+mVliCZR2/jDCIodjVA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788116008; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nVDIHfbzyQ8ElDQ6asi5CRQYO2SYCRhwy8nKszFhgXE=; 
	b=Nst6fob6AmqcyVng6Ai1+J4+iWEEcX0QzPrIEl6XaAzAYQuzUVqgyHSdbMyEcI+Ur4XJ/BEb808B4Nw+bzF3a54QlBWNJn/SIi/7UATz3Nhsv52e67OUAuS4uChZR/0jZyCXaKe1NlaN+CXzA7q4hu5GtV8Fv6TNj9UIWocgTIU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788116008;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=nVDIHfbzyQ8ElDQ6asi5CRQYO2SYCRhwy8nKszFhgXE=;
	b=gV+lB/IczCLw56DM6o/kKneXdg3VmBKnUY0te+8GoVcCTl9/xpgGrA7bJSjDkbfG
	wXWkEf0yuUMTIcUwvC6FOmoeEj96fckJ/eQ7RBLTzPoYGB1XycmhySdfVXmixleoryD
	Tnp7fxEjhHdqedAJ7vgGJ5kKr5JTSXgfv8oXJBEQ=
Received: by mx.zohomail.com with SMTPS id 1788116003921735.6548742229019;
	Sun, 30 Aug 2026 11:53:23 -0700 (PDT)
Date: Sun, 30 Aug 2026 18:53:07 +0000
From: Yao Zi <me@ziyao.cc>
To: Weijie Yuan <wy@wyuan.org>, Yao Zi <me@ziyao.cc>
Cc: Yukai Wu <xiaoyewuz.ruster@gmail.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Message-ID: <apR8CoTs4hj-vqLG@pie>
References: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
 <apMPjRICH06wAxPp@pie>
 <apQ-7U-omIeXvZ1N@wyuan.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apQ-7U-omIeXvZ1N@wyuan.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/288.103.78
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_115337_916215_6746BE83 
X-CRM114-Status: GOOD (  27.24  )
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

T24gU3VuLCBBdWcgMzAsIDIwMjYgYXQgMTA6MzI6MTNQTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6Cj4gT24gU2F0LCBBdWcgMjksIDIwMjYgYXQgMDQ6NTc6NDlQTSArMDAwMCwgWWFvIFppIHdy
b3RlOgo+ID4gT24gU2F0LCBBdWcgMjksIDIwMjYgYXQgMTI6MTU6MTBQTSArMDgwMCwgWXVrYWkg
V3Ugd3JvdGU6Cj4gPiA+IFVwZGF0ZSBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yvdm0tbGF5b3V0
LnJzdCB0cmFuc2xhdGlvbi4KPiA+ID4gCj4gPiA+IFVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhy
b3VnaCBjb21taXQgOTU0MjYwZmY1YTQ2Cj4gPiA+ICgiUmV2ZXJ0ICJSSVNDLVY6IG1tOiBEb2N1
bWVudCBtbWFwIGNoYW5nZXMiIikKPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1a2FpIFd1
IDx4aWFveWV3dXouUnVzdGVyQGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAuLi4vemhfQ04v
YXJjaC9yaXNjdi92bS1sYXlvdXQucnN0ICAgICAgICAgICAgIHwgMTggKysrKysrKysrLS0tLS0t
LS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygt
KQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2FyY2gvcmlzY3Yvdm0tbGF5b3V0LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2FyY2gvcmlzY3Yvdm0tbGF5b3V0LnJzdAo+ID4gPiBpbmRleCA0YjlmNGRjZjZjMTku
LjBkMGVjOGVhNWQwNSAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vYXJjaC9yaXNjdi92bS1sYXlvdXQucnN0Cj4gPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3Yvdm0tbGF5b3V0LnJzdAo+ID4gPiBAQCAt
MTUsNyArMTUsNyBAQCBSSVNDLVYgTGludXjkuIrnmoTomZrmi5/lhoXlrZjluIPlsYAKPiA+ID4g
IDrkvZzogIU6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KPiA+ID4gIDrml6XmnJ86
IDEyIEZlYnJ1YXJ5IDIwMjEKPiA+ID4gIAo+ID4gPiAt6L+Z5Lu95paH5Lu25o+P6L+w5LqGUklT
Qy1WIExpbnV45YaF5qC45L2/55So55qE6Jma5ouf5YaF5a2Y5biD5bGA44CCCj4gPiA+ICvov5nk
u73mlofku7bmj4/ov7DkuoYgUklTQy1WIExpbnV4IOWGheaguOS9v+eUqOeahOiZmuaLn+WGheWt
mOW4g+WxgOOAggo+ID4gPiAgCj4gPiA+ICAzMuS9jSBSSVNDLVYgTGludXgg5YaF5qC4Cj4gPiA+
ICA9PT09PT09PT09PT09PT09PT09PT09Cj4gPiA+IEBAIC0yOCw5ICsyOCw5IEBAIFRPRE8KPiA+
ID4gIDY05L2NIFJJU0MtViBMaW51eCDlhoXmoLgKPiA+ID4gID09PT09PT09PT09PT09PT09PT09
PT0KPiA+ID4gIAo+ID4gPiAtUklTQy1W54m55p2D5p625p6E5paH5qGj5oyH5Ye677yMNjTkvY3l
nLDlnYAgIuW/hemhu+S9v+esrDYzLTQ45L2N5YC86YO9562J5LqO56ysNDfkvY3vvIzlkKbliJnl
sIblj5HnlJ/nvLrpobXlvILluLjjgIIi77ya6L+Z5bCG6JmaCj4gPiA+IC3mi5/lnLDlnYDnqbrp
l7TliIbmiJDkuKTljYrvvIzkuK3pl7TmnInkuIDkuKrpnZ7luLjlpKfnmoTmtJ7vvIzkuIvljYrp
g6jliIbmmK/nlKjmiLfnqbrpl7TmiYDlnKjnmoTlnLDmlrnvvIzkuIrljYrpg6jliIbmmK9SSVND
LVYgTGludXgKPiA+ID4gLeWGheaguOaJgOWcqOeahOWcsOaWueOAggo+ID4gPiArUklTQy1WIOeJ
ueadg+aetuaehOaWh+aho+aMh+WHuu+8jDY0IOS9jeWcsOWdgOKAnOW/hemhu+S9v+esrCA2My00
OCDkvY3lgLzpg73nrYnkuo7nrKwgNDcg5L2N77yM5ZCm5YiZ5bCG5Y+R55Sf57y66aG15byC5bi4
44CC4oCd77yaCj4gPiA+ICvov5nlsIbomZrmi5/lnLDlnYDnqbrpl7TliIbmiJDkuKTljYrvvIzk
uK3pl7TmnInkuIDkuKrpnZ7luLjlpKfnmoTmtJ7vvIzkuIvljYrpg6jliIbmmK/nlKjmiLfnqbrp
l7TmiYDlnKjnmoTlnLDmlrnvvIzkuIrljYrpg6jliIbmmK8gUklTQy1WCj4gPiA+ICtMaW51eCDl
hoXmoLjmiYDlnKjnmoTlnLDmlrnjgIIKPiA+IAo+ID4gSSB0aGluayBjaGFuZ2VzIGFib3ZlIGFy
ZSBwdXJlbHkgc3R5bGUgaW1wcm92ZW1lbnRzPyBJZiBzbyBwbGVhc2UKPiA+IG1lbnRpb24gaXQg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBpbnN0ZWFkIG9mIHNwZWNpZnlpbmcgaXQncyAidXBkYXRp
bmciCj4gPiBvbmx5Lgo+IAo+IEFncmVlZC4gVG8gcHV0IGl0IGZ1cnRoZXIsIEkgdGhpbmsgdGhl
IGNvbW1pdCBtZXNzYWdlIHRlbXBsYXRlIHdlCj4gcHJvdmlkZWQgaW4gaG93LXRvLnJzdCBbMV0g
aXMgc29tZXdoYXQgbGlrZSB0ZWxsaW5nIGNvbnRyaWJ1dG9yczogVGhhdCdzCj4gYWxsIHlvdSBu
ZWVkIHRvIGRvLgoKT29wcywgSSBkb24ndCBldmVuIHJlYWxpemUgaXQncyBwYXJ0IG9mIG91ciBl
eGlzdGluZyBjb250cmlidXRpbmcKZ3VpZGUuLi4KCj4gT2YgY291cnNlLCBpbiBzb21lIGNhc2Vz
LCB0aGUgcGF0Y2ggaXMgcXVpdGUgc2ltcGxlIGFuZCB0aGVyZSBpcyBub3RoaW5nCj4gZWxzZSB0
byBlbGFib3JhdGUgb24uIEhvd2V2ZXIsIGluIHNvbWUgY2FzZXMsIHN1Y2ggYXMgd2hlbiBtYWtp
bmcKPiBleHRlbnNpdmUgY2hhbmdlcyBhbmQgdXBkYXRlcywgd2Ugc2hvdWxkIGVuY291cmFnZSBj
b250cmlidXRvcnMgdG8gd3JpdGUKPiBkb3duIHNvbWUgcmVsZXZhbnQgaW5mb3JtYXRpb24gZm9y
IGZ1dHVyZSByZWZlcmVuY2UuCj4gCj4gU2ltaWxhcmx5LCBqdXN0IGxpa2UgdGhpcyBwYXRjaCwg
dGhlIGF1dGhvciBkaWQgbW9yZSB0aGFuIGp1c3QgdXBkYXRlOwo+IGhlIGFsc28gY2FycmllZCBv
dXQgb3RoZXIgYWN0aW9ucywgYnV0IGZhaWxlZCB0byBpbmNsdWRlIHRoZSByZWxldmFudAo+IGRl
dGFpbHMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBTbyBJIGZlZWwgdGhhdCBwZXJoYXBzIG91ciB0
ZW1wbGF0ZSBtaWdodAo+IGhhdmUgc29tZXdoYXQgcmVzdHJpY3RlZCBvdXIgd3JpdGluZz8gKHRv
IHNvbWUgZXh0ZW50KQoKQWdyZWUuCgo+IFN1cmUsIHRoZSByZXF1aXJlbWVudHMgZm9yIGNvbW1p
dCBtZXNzYWdlcyBpbiB0aGUgQ2hpbmVzZSBkb2N1bWVudGF0aW9uCj4gYXJlIGNlcnRhaW5seSBu
b3QgYXMgc3RyaWN0IGFzIHRob3NlIGZvciB0aGUgbW9yZSBjb3JlIHN1YnN5c3RlbXMuCj4gSG93
ZXZlciwgSSBkbyB0aGluayBpdCdzIGZpbmUgdG8gYXBwcm9wcmlhdGVseSBleHBsaWNpdGx5IGVu
Y291cmFnZQo+IGNvbnRyaWJ1dG9ycyB0byBpbmNsdWRlIG1vcmUgbWVhbmluZ2Z1bCByZWxldmFu
dCBpbmZvcm1hdGlvbiBpbiB0aGUKPiBjb21taXQgbWVzc2FnZXMuCj4gCj4gQW55IGlkZWFzIGZv
ciB0aGlzLCBvciBhbnkgb2JqZWN0aW9ucz8gOykKCkkgdGhpbmsgaXQncyB3b3J0aCBwb2ludGlu
ZyBvdXQgdGhhdCB0aGUgdGVtcGxhdGUgY29tbWl0IG1lc3NhZ2UgaXMgZm9yCnJlZmVyZW5jZSBv
bmx5IGluIGhvdy10by5yc3QsIGFuZCBndWlkaW5nIHJlYWRlcnMgdG8Kc3VibWl0dGluZy1wYXRj
aGVzLnJzdCBzbyBhdCBsZWFzdCBuZXdjb21lcnMgaGF2ZSBhIGJyaWVmIHVuZGVyc3RhbmRpbmcK
b2YgdGhlIHByb2Nlc3MgYW5kIHJlcXVpcmVtZW50cy4KCk5vdyBob3ctdG8ucnN0IHJlZmVycyBw
cm9jZXNzL2luZGV4LnJzdCwgYnV0IHRoaXMgaW5kZXggc2VlbXMgdG8gY29udGFpbgp0b28gbXVj
aCBmb3IgYW55b25lIHVuZmFtaWxpYXIgd2l0aCB0aGUgcHJvY2VzcyB0byByZWFkIHRocm91Z2gu
Cgo+IFRoYW5rcyEKPiAKPiBbMV0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvdHJhbnNsYXRpb25z
L3poX0NOL2hvdy10by5odG1sI2lkMTMKClJlZ2FyZHMsCllhbyBaaQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
