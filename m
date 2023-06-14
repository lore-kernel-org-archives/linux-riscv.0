Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA216EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 12:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6u/sekhqez4o+jqziXTh61TfV6GVagDkibESAGxOrQ=; b=ZkvZXGHyZD9oqR
	ZmaXaHhCs6jImbEvvhP6M+kcE1MEfcG4hYQrX63lHIaGWTUOnPVCYL96mz48T0DongBxF9xgzAh7J
	6mKeJlNXDYCadZT/DIliSejpRQKLqj2ovt1WEkMPLLGoABgHGK0YXP6P8Xemmg/ZT9TJsbVt2I9Zh
	GZuGJoVIAvdQkx+KFDNB3AFhrGvUnikYhjNtPdBqGq2SXINyFh5JqB3FgC6sWX0E/Uj6Yax8kdXBj
	gPgSOZtOERu2WliQw82fD/oQOy76UPTZE/hmzt64ILlk48TrqsUt5KDHLHgJdtscvMsVX9yxFfG5B
	LdUUMaMJL1ZIOzW8tf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9PpW-00BeNd-0q;
	Wed, 14 Jun 2023 12:42:30 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9PpR-00BeLf-26
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 12:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1686746531;
	bh=W9K2TxMhc8/BCOfweWhHmxvkNzTtaiHhyGiv6S2JZdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KSLOcm6Y13HG8LCDfeLbq1KVABp/qzdT62DfN7TYOuk9vqvt4SvkmNVylGCvIGHge
	 kyp4hUdIzv+fTF6k0idDXXdRWracn36TQsmzrY8HMWoyv2k+KuV4jfLjFqdZopFIjg
	 4VTz5tjn5PuNB/762ZOv2KLwK3m4andUmHgF22EY=
Received: from localhost ([101.224.149.128])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id A70A7608; Wed, 14 Jun 2023 20:41:48 +0800
X-QQ-mid: xmsmtpt1686746508taw99y47e
Message-ID: <tencent_C1CE680F8B300559050D967C7DC8305CA90A@qq.com>
X-QQ-XMAILINFO: ONeAaaONYXuw+NsuqA0HVM0JtE6Xfpe7VSuvouDHpiQ9EP60FsSsp2ZVsfbc9Y
	 ezlnQyGT4svrR4QrXHQjXRLaJoJEQGbbrVO22MxSQFNM6vIBvxHV59zZpJG37v8OKyrbgR32XtLu
	 U+QeDI3js9uYwtOJiijFjcBJEJetXW/tfjaZJsIirkqvinrYyfn8UJhq1/jXgeBI69gD1NaFIeYl
	 ZkKNStGbjLV/JobHpnIp0/rOcahI162KwO/8DTXaDm3iinug5CnjyB+HuzOPRVuKs5DydCcSfoa5
	 Mz3jKDZggEH5VK7ToMT0VptYc21BACpRTh51phb3WmBl4A6WF5k6fT6qe5V/1opN4XcqUwLr8IPp
	 PHyUYPgMk/veLO/JMCJXm8iperT0OA/faRjmBV246B0O3OzmVxzOqTOGVTnv4u0UusD2Lvz6/rRX
	 G+rUSsSX0C+BJqTEWxAwx7iDl6RRyOKihovyRLDb3aw/NdCFDDvJGlHHnJ9a9v0w960ZcdYMst0N
	 mnSkwVnDHdL076kjImSFlNoykqj0mnBjb6jPKwJXmKTRb0gvbiKs5bW3mIyNFII3K3W3LWxhfs4g
	 3oJFIz8TEMTE5LDOSJQV4bUXjVoWj+CL84AQLQw6TU8JclLD2e5Xl6sVuttknPEGTmUE2vnsziTf
	 JsoTztbSLMsQAFL0CuUcEKEC1huLK+3BTvVlfMLEh+Z1SzfHDmReZWjPOOL0fBQ+VgaiulJm5ioK
	 sIlEUEvuMktPcEFKjYR9idkCANV4tfqP8HnJWVR6DdDwTLjOVhglaxW+86bVZ/yCfpz0Kyz9IHYD
	 KECNch+bKbh9DhVssouN6vb5+G9+piwfbAYqXC5KYRpHFajq+juult/yhbRR/b7GYcg5QcsILTyN
	 HHBYW6Pa9xdai4Ydfqx41Ink+E+nn8yvySMK65NtyPKCpz72beEqZeZcIypYIVLd2FEo82RZHlg+
	 2/xtc08Rtaf7g1kDynYNcIPnXe2t6V
X-QQ-XMAILREADINFO: M6MeDH90Kfa7jdireGRnptI=
Date: Wed, 14 Jun 2023 20:41:48 +0800
From: Woody Zhang <woodylab@foxmail.com>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: move memblock_allow_resize() after lm is ready
X-OQ-MSGID: <ZIm1jOGyx0Ucvbx7@dev>
References: <tencent_D656D683705F41324657ED3393C3384C7408@qq.com>
 <CAHVXubiYHQCYkymde2y_okNb2XcE-xVBMj8iZ7kM5d08bhqxiQ@mail.gmail.com>
 <6B512C74DCAB0BF0+0ad9a892-6933-baa3-0848-1e1efc685c9f@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6B512C74DCAB0BF0+0ad9a892-6933-baa3-0848-1e1efc685c9f@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_054226_319450_579605D9 
X-CRM114-Status: GOOD (  26.63  )
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMDU6NTE6MjNQTSArMDgwMCwgU29uZyBTaHVhaSB3cm90
ZToKPgo+Cj7lnKggMjAyMy82LzEyIDE1OjE1LCBBbGV4YW5kcmUgR2hpdGkg5YaZ6YGTOgo+PiBI
aSBXb29keSwKPj4gCj4+IE9uIFNhdCwgSnVuIDEwLCAyMDIzIGF0IDE6NDnigK9BTSBXb29keSBa
aGFuZyA8d29vZHlsYWJAZm94bWFpbC5jb20+IHdyb3RlOgo+PiA+IAo+PiA+IFRoZSBpbml0aWFs
IG1lbWJsb2NrIG1ldGFkYXRhIGlzIGFjY2Vzc2VkIGZyb20ga2VybmVsIGltYWdlIG1hcHBpbmcu
IFRoZQo+PiA+IHJlZ2lvbnMgYXJyYXlzIG5lZWQgdG8gInJlYWxsb2NhdGVkIiBmcm9tIG1lbWJs
b2NrIGFuZCBhY2Nlc3NlZCB0aHJvdWdoCj4+ID4gbGluZWFyIG1hcHBpbmcgdG8gY292ZXIgbW9y
ZSBtZW1ibG9jayByZWdpb25zLiBTbyB0aGUgcmVzaXppbmcgc2hvdWxkCj4+ID4gbm90IGJlIGFs
bG93ZWQgdW50aWwgbGluZWFyIG1hcHBpbmcgaXMgcmVhZHkuIE5vdGUgdGhhdCB0aGVyZSBhcmUK
Pj4gPiBtZW1ibG9jayBhbGxvY2F0aW9ucyB3aGVuIGJ1aWxkaW5nIGxpbmVhciBtYXBwaW5nLgo+
PiA+IAo+PiA+IFNpZ25lZC1vZmYtYnk6IFdvb2R5IFpoYW5nIDx3b29keWxhYkBmb3htYWlsLmNv
bT4KPj4gPiAtLS0KPj4gPiAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgNCArKystCj4+ID4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+ID4gCj4+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMK
Pj4gPiBpbmRleCA5ZTlkYTY5NzIwY2UuLjhhMzNlY2JiNGQwZiAxMDA2NDQKPj4gPiAtLS0gYS9h
cmNoL3Jpc2N2L21tL2luaXQuYwo+PiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+ID4g
QEAgLTI1OCw3ICsyNTgsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfYm9vdG1lbSh2b2lk
KQo+PiA+ICAgICAgICAgIGRtYV9jb250aWd1b3VzX3Jlc2VydmUoZG1hMzJfcGh5c19saW1pdCk7
Cj4+ID4gICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzY0QklUKSkKPj4gPiAgICAgICAg
ICAgICAgICAgIGh1Z2V0bGJfY21hX3Jlc2VydmUoUFVEX1NISUZUIC0gUEFHRV9TSElGVCk7Cj4+
ID4gLSAgICAgICBtZW1ibG9ja19hbGxvd19yZXNpemUoKTsKPj4gPiAgIH0KPj4gPiAKPj4gPiAg
ICNpZmRlZiBDT05GSUdfTU1VCj4+ID4gQEAgLTEyNTAsNiArMTI0OSw5IEBAIHN0YXRpYyB2b2lk
IF9faW5pdCBzZXR1cF92bV9maW5hbCh2b2lkKQo+PiA+ICAgICAgICAgIGNzcl93cml0ZShDU1Jf
U0FUUCwgUEZOX0RPV04oX19wYV9zeW1ib2woc3dhcHBlcl9wZ19kaXIpKSB8IHNhdHBfbW9kZSk7
Cj4+ID4gICAgICAgICAgbG9jYWxfZmx1c2hfdGxiX2FsbCgpOwo+PiA+IAo+PiA+ICsgICAgICAg
LyogRGVwZW5kIG9uIHRoYXQgTGluZWFyIE1hcHBpbmcgaXMgcmVhZHkgKi8KPj4gPiArICAgICAg
IG1lbWJsb2NrX2FsbG93X3Jlc2l6ZSgpOwo+PiA+ICsKPj4gPiAgICAgICAgICBwdF9vcHNfc2V0
X2xhdGUoKTsKPj4gPiAgIH0KPj4gPiAgICNlbHNlCj4+ID4gLS0KPj4gPiAyLjM5LjIKPj4gPiAK
Pj4gCj4+IFRoZSBjb21taXQgbG9nIGRvZXMgbm90IGRlc2NyaWJlIHRoZSBpc3N1ZSB0aG9yb3Vn
aGx5IGVub3VnaCB0byBtZSwKPj4gbWF5YmUgeW91IGNvdWxkIHBvaW50IHRvIHRoZSBhcm02NCBj
b21taXQgdGhhdCBkaWQgdGhlIHNhbWU/IEkgbWVhbgo+PiBjb21taXQgMjRjYzYxZDhjYjVhICgi
YXJtNjQ6IG1lbWJsb2NrOiBkb24ndCBwZXJtaXQgbWVtYmxvY2sgcmVzaXppbmcKPj4gdW50aWwg
bGluZWFyIG1hcHBpbmcgaXMgdXAiKS4KPkBBbGV4Cj4KPkkgcmVwcm9kdWNlZCB0aGUgcHJvYmxl
bSBhcyB0aGUgYXJtNjQgY29tbWl0IGRlc2NyaWJlcy4KPllvdSBjYW4gZmluZCB0aGUgY29tcGxl
dGUgbG9nIHZpYSB0aGlzIGxpbms6IGh0dHBzOi8vdGVybWJpbi5jb20vYngwbwo+Cj5JIGNvbnN0
cnVjdGVkIHRoZSBkdGIgd2l0aCBudW1lcm91cyBkaXNjcmV0ZSAvbWVtcmVzZXJ2ZS8gcmVnaW9u
cwo+KHRoZSBudW1iZXJzIG9mIHRoZXNlIHJlZ2lvbnMgYXBwcm94aW1hdGUgSU5JVF9NRU1CTE9D
S19SRUdJT05TKSB3aGljaCBmdWxsCj50aGUgcmVzZXJ2ZWQgcmVnaW9ucyB1cC4KPgo+V2hlbiBt
ZW1ibG9ja19hbGxvd19yZXNpemUgd2FzIHNldCwgdGhlIGNhbGxpbmcgb2YgbWVtYmxvY2tfcmVz
ZXJ2ZSgpIHdvdWxkCj5kb3VibGUvcmVzaXplIHRoZSByZXNlcnZlZCByZWdpb25zIGFuZCBkbyB0
aGUgX19tZW1jb3B5KCkgZnJvbSB0aGUgb2xkCj5yZWdpb25zICggbWFwcGVkIGJ5IGtlcm5lbCkK
PnRvIHRoZSBuZXcgb25lcyAocHJvdmlkZWQgYnkgX192YSgpKS4KPkJ1dCBiZWZvcmUgdGhlIGxp
bmVhciBtYXBwaW5nIHdhcyByZWFkeSAobGlrZTogZHVyaW5nIHRoZSBjcmVhdGluZyBvZiBsaW5l
YXIKPm1hcHBpbmcpLAo+bWVtYmxvY2tfcmVzZXJ2ZSgpIHdhcyBjYWxsZWQgYW5kIHRoZSBtZW1j
b3B5IHdvdWxkIHRyaWdnZXIgYSBTdG9yZS9BTU8gcGFnZQo+ZmF1bHQuCj4KPj4gCj4+IEFub3Ro
ZXIgcG9pbnQgaXMgdGhhdCBJIHdvdWxkIG5vdCBwdXQgdGhpcyBjYWxsIGludG8gc2V0dXBfdm1f
ZmluYWwoKSwKPj4gSSdkIHJhdGhlciBhZGQgaXQgaW4gcGFnaW5nX2luaXQoKSBhcyBpdCBkb2Vz
IG5vdCBzZWVtIGxpa2UgYSBnb29kIGZpdAo+PiBmb3Igc2V0dXBfdm1fZmluYWwoKS4gQnV0IHRo
YXQncyBhIG5pdCBzbyB1cCB0byB5b3Ugb2YgY291cnNlLgo+PiAKPkkgYWdyZWUuCj4KPkBXb29k
eQo+Cj5JIG5vdGljZWQgeW91ciBWMiBbMV0gZGlkbid0IHRha2UgdGhpcyBzdWdnZXN0aW9uLCBt
YXliZSB5b3UgY2FuIHRha2UgaXQgYXQKPlYzLgo+QW5kIGl0IHdpbGwgYmUgbW9yZSBzb3VuZCBp
ZiB5b3Ugc3VwcGxlbWVudCB0aGUgY29tbWl0LW1zZyB3aXRoIHRoZSBwYW5pYwo+aW5mbyBmcm9t
IHRoZSBsb2cuCj4KClRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4gSSB3aWxsIHVwZGF0ZSBpdCB3
aXRoIHlvdXIgcGFuaWMgbG9nIGluIG5leHQKdmVyc2lvbi4KCgpXb29keQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
