Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35F9C76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bX+Qu+05iTplIk+ki/yVDDNskeR6kZEinXnzzZo6gE=; b=GuXkAnEXigtTFH
	k5druby2ae2LK+jz+HSZrZUFOO4ocPvt9iwqHNw1WcxKXj9WNjKzdOlUaxx/VgpVgbuA1063+g4d2
	vPIFWooyQeTJCKJAtdPtg6N+10kK8NosHvqX8fRPdnpGeLc0YE3MeJXnbK9ZCf6lrHNKN2G0u4GBx
	5NWjjVxL8XTxLD9FoCtoadE9xRk3SqCRejeiwnIJ+ctq3l+kA4zlebqYC0jt/H8OXV5ZkfPt2Q0eF
	KzrGpmf+L3DYL27mo+80fRvwob3zM4T4AXd6Q926kUaafPoWrWQAk0p9sG7l/cCsH118YzNWKWO4Y
	SwLuCtRgDlmKdSl/hIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piaX1-00AWkm-1E;
	Sat, 01 Apr 2023 12:40:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pia4U-00ANP5-04
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 12:11:03 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pia3u-0002IB-NC; Sat, 01 Apr 2023 14:10:26 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guo Ren <guoren@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, arnd@arndb.de, palmer@rivosinc.com,
 tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
 conor.dooley@microchip.com, jszhang@kernel.org, lazyparser@gmail.com,
 falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
 atishp@atishpatra.org, mark.rutland@arm.com, ben@decadent.org.uk,
 bjorn@kernel.org, palmer@dabbelt.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Yipeng Zou <zouyipeng@huawei.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
Date: Sat, 01 Apr 2023 14:10:25 +0200
Message-ID: <2587778.7s5MMGUR32@diego>
In-Reply-To:  <CAJF2gTSWETHhQFuE19H+RVX6Jbue+UAu8o94QoBFx65NABas1Q@mail.gmail.com>
References:  <20230222033021.983168-1-guoren@kernel.org> <23668656.ouqheUzb2q@diego>
 <CAJF2gTSWETHhQFuE19H+RVX6Jbue+UAu8o94QoBFx65NABas1Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_051102_068356_8BE64179 
X-CRM114-Status: GOOD (  28.10  )
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

SGkgR3VvLAoKQW0gU2Ftc3RhZywgMS4gQXByaWwgMjAyMywgMDQ6MTU6MzIgQ0VTVCBzY2hyaWVi
IEd1byBSZW46Cj4gT24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgMjo0N+KAr1BNIEhlaWtvIFN0w7xi
bmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+ID4gQW0gRnJlaXRhZywgMzEuIE3DpHJ6IDIw
MjMsIDIwOjQxOjM1IENFU1Qgc2NocmllYiBDb25vciBEb29sZXk6Cj4gPiA+IE9uIEZyaSwgTWFy
IDMxLCAyMDIzIGF0IDA3OjM0OjM4UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4g
PiBPbiBUdWUsIEZlYiAyMSwgMjAyMyBhdCAxMDozMDoxOFBNIC0wNTAwLCBndW9yZW5Aa2VybmVs
Lm9yZyB3cm90ZToKPiA+ID4gPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJh
LmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIHBhdGNoIGNvbnZlcnRzIHJpc2N2IHRvIHVz
ZSB0aGUgZ2VuZXJpYyBlbnRyeSBpbmZyYXN0cnVjdHVyZSBmcm9tCj4gPiA+ID4gPiBrZXJuZWwv
ZW50cnkvKi4gVGhlIGdlbmVyaWMgZW50cnkgbWFrZXMgbWFpbnRhaW5lcnMnIHdvcmsgZWFzaWVy
IGFuZAo+ID4gPiA+ID4gY29kZXMgbW9yZSBlbGVnYW50LiBIZXJlIGFyZSB0aGUgY2hhbmdlczoK
PiA+ID4gPiA+Cj4gPiA+ID4gPiAgLSBNb3JlIGNsZWFyIGVudHJ5LlMgd2l0aCBoYW5kbGVfZXhj
ZXB0aW9uIGFuZCByZXRfZnJvbV9leGNlcHRpb24KPiA+ID4gPiA+ICAtIEdldCByaWQgb2YgY29t
cGxleCBjdXN0b20gc2lnbmFsIGltcGxlbWVudGF0aW9uCj4gPiA+ID4gPiAgLSBNb3ZlIHN5c2Nh
bGwgcHJvY2VkdXJlIGZyb20gYXNzZW1ibHkgdG8gQywgd2hpY2ggaXMgbXVjaCBtb3JlCj4gPiA+
ID4gPiAgICByZWFkYWJsZS4KPiA+ID4gPiA+ICAtIENvbm5lY3QgcmV0X2Zyb21fZm9yayAmIHJl
dF9mcm9tX2tlcm5lbF90aHJlYWQgdG8gZ2VuZXJpYyBlbnRyeS4KPiA+ID4gPiA+ICAtIFdyYXAg
d2l0aCBpcnFlbnRyeV9lbnRlci9leGl0IGFuZCBzeXNjYWxsX2VudGVyL2V4aXRfZnJvbV91c2Vy
X21vZGUKPiA+ID4gPiA+ICAtIFVzZSB0aGUgc3RhbmRhcmQgcHJlZW1wdGlvbiBjb2RlIGluc3Rl
YWQgb2YgY3VzdG9tCj4gPiA+ID4KPiA+ID4gPiBUaGlzIGhhcyB1bmZvcnR1bmF0ZWx5IGJyb2tl
biBib290aW5nIG15IHVzdWFsIE5GUyByb290ZnMgb24gYm90aCBteSBEMQo+ID4gPiA+IGFuZCBJ
Y2ljbGUuIEl0J3Mgb25lIG9mIHRoZSBGZWRvcmEgaW1hZ2VzIGZyb20gRGF2aWQsIEkgdGhpbmsg
dGhpcyBvbmU6Cj4gPiA+ID4gaHR0cDovL2ZlZG9yYS5yaXNjdi5yb2Nrcy9rb2ppZmlsZXMvd29y
ay90YXNrcy8zOTMzLzEzMTM5MzMvCj4gPiA+ID4KPiA+ID4gPiBJdCBnZXRzIHByZXR0eSBmYXIg
aW50byB0aGluZ3MsIGl0J3Mgb25jZSBzeXN0ZW1kIGlzIG9wZXJhdGlvbmFsIHRoYXQKPiA+ID4g
PiB0aGluZ3MgZ28gcGVhciBzaGFwZWQ6Cj4gPiA+Cj4gPiA+IFNob3VsZGEgc2FpZCwgY2FuIHNo
YXJlIHRoZSBmdWxsIGxvZ3MgaWYgcmVxdWlyZWQgb2YgY291cnNlLCBidXQgdGhleSdyZQo+ID4g
PiBxdWl0ZSB2ZXJib3NlIGNvcyBzeXN0ZW1kIGV0Yy4KPiA+Cj4gPiBJIHdhcyBqdXN0IGludmVz
dGlnYXRpbmcgdGhlIHNhbWUgdGhpbmcganVzdCBub3cuIFNvIHRoYXQgc2F2ZXMgbWUgc29tZQo+
ID4gdHJhY2tpbmcgZG93biB0aGUgY3VscHJpdCA6LSkgLgo+ID4KPiA+IE15IG1haW4gcWVtdSBp
cyBsaXZpbmcgYXMgYSAiYm9hcmQiIGluIG15IGJvYXJkZmFybSAoYWxzbyBkb2luZyBuZnNyb290
KQo+ID4gYXMgd2VsbCBhcyBteSBkMSBuZXpoYSB3aXRoIG5mc3Jvb3Qgd2FzIGFmZmVjdGVkLgo+
IENhbiB5b3UgcmVwcm9kdWNlIGl0IHdpdGggcWVtdT8gQ291bGQgZ2l2ZSBtZSBzb21lIHRpcHMg
YW5kIGxldCBtZQo+IHJlcHJvZHVjZSBpdCBvbiBxZW11PwoKQXMgd3JpdHRlbiB0aGUgaXNzdWUg
Ym90aCBoYXBwZW5zIG9uIHFlbXUtdmlydCBhbmQgYWxzbyB0aGUgZDEtbmV6aGEgYm9hcmQuCkJl
bG93IEkndmUgc3VtbWFyaXplZCBteSBzZXR1cCBhIGJpdDoKCgooMSkgUWVtdS1jb21tYW5kbGlu
ZToKLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgovdXNyL2xvY2FsL2Jpbi9xZW11LXN5c3RlbS1yaXNj
djY0IC1NIHZpcnQgLXNtcCAyIC1tIDFHIC1kaXNwbGF5IG5vbmUgXAogIC1jcHUgcnY2NCx6YmI9
dHJ1ZSx6YmM9dHJ1ZSxzdnBibXQ9dHJ1ZSxaaWNib209dHJ1ZSxaYXdycz10cnVlLHNzY29mcG1m
PXRydWUsdj10cnVlIFwKICAtc2VyaWFsIHRlbG5ldDpsb2NhbGhvc3Q6NTUwMCxzZXJ2ZXIsbm93
YWl0IC1rZXJuZWwgL2hvbWUvZGV2ZWwvbmZzL2tlcm5lbC9yaXNjdjY0L0ltYWdlIFwKICAtYXBw
ZW5kICJlYXJseWNvbj1zYmkgcm9vdD0vZGV2L25mcyBuZnNyb290PTEwLjAuMi4yOi9ob21lL2Rl
dmVsL25mcy9yb290ZnMtcmlzY3Y2NHZpcnQgaXA9ZGhjcCBydyIgXAogIC1uZXRkZXYgdXNlcixp
ZD1uMSAtZGV2aWNlIHZpcnRpby1uZXQtcGNpLG5ldGRldj1uMQoKV2hpY2ggZG9lcyB0aGUgc3Rh
cnQgdXNpbmcgYSBuZnMtcm9vdCBjb21pbmcgZnJvbSBhbiBuZnMtc2VydmVyIHJ1bm5pbmcKb24g
dGhlIHNhbWUgaG9zdCBhcyBxZW11LgoKVGhvdWdoIHRoZSBpc3N1ZSBkb2VzIG5vdCBzZWVtIHRv
IGJlIHJlbGF0ZWQgdG8gdGhlIG5mcy4gSSBhbHNvIHRyaWVkCnN0YXJ0aW5nIHdpdGggYSBsb2Nh
bCBkaXNrIGltYWdlIGxpa2UgWzBdIGFuZCB0aGUgaXNzdWUgd2l0aCB0aGUgam91cm5hbGQKc3Rp
bGwgcGVyc2lzdHMuCgoKKDIpIHRoZSByb290ZnMtY29udGVudHM6Ci0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQoKQ29ub3Igc2VlbXMgdG8gYmUgdXNpbmcgRmVkb3JhLCB3aGlsZSBteSBkaXN0cmli
dXRpb24gb2YgY2hvaWNlIGlzIERlYmlhbi4KTXkgcm9vdGZzIHdhcyBjcmVhdGVkIGZvbGxvd2lu
ZyB0aGUgaW5zdHJ1Y3Rpb25zIG9uIHRoZSBEZWJpYW4gd2lraSBmb3IKdGhlIGRlYnBvcnRzIHdp
dGggZGVib290c3RyYXAgWzFdLgoKClRoaXMgbW9ybmluZyBJIGFsc28gcmUtY3JlYXRlZCBhIGNv
bXBsZXRlbHkgbmV3IGFuZCBwcmlzdGluZSByb290ZnMgdXNpbmcKdGhvc2UgaW5zdHJ1Y3Rpb25z
IGFuZCB0aGUgaXNzdWUgYXBwZWFyZWQgaW1tZWRpYXRlbHkgb24gZmlyc3QtYm9vdC4KCgpIb3Bl
IHRoaXMgaGVscHMgYSBiaXQKSGVpa28KCgpbMF0gc2FtZSByZXN1bHQgd2l0aCBhIGRpc2staW1h
Z2UgLi4uIGpvdXJuYWxkIGZhaWxpbmcKL3Vzci9sb2NhbC9iaW4vcWVtdS1zeXN0ZW0tcmlzY3Y2
NCAtTSB2aXJ0IC1zbXAgMiAtbSAxRyAtZGlzcGxheSBub25lIFwKICAtY3B1IHJ2NjQsemJiPXRy
dWUsemJjPXRydWUsc3ZwYm10PXRydWUsWmljYm9tPXRydWUsWmF3cnM9dHJ1ZSxzc2NvZnBtZj10
cnVlLHY9dHJ1ZSBcCiAgLXNlcmlhbCB0ZWxuZXQ6bG9jYWxob3N0OjU1MDAsc2VydmVyLG5vd2Fp
dCAta2VybmVsIC9ob21lL2RldmVsL25mcy9rZXJuZWwvcmlzY3Y2NC9JbWFnZSBcCiAgLWFwcGVu
ZCAncm9vdD0vZGV2L3ZkYSBjb25zb2xlPXR0eVMwJyBcCiAgLWRyaXZlIGZpbGU9L2hvbWUvZGV2
ZWwvbmZzL3Jvb3Rmcy1yaXNjdjY0dmlydC5leHQ0LGZvcm1hdD1yYXcsaWQ9aGQwIFwKICAtZGV2
aWNlIHZpcnRpby1ibGstcGNpLGRyaXZlPWhkMAoKWzFdIGh0dHBzOi8vd2lraS5kZWJpYW4ub3Jn
L1JJU0MtViNkZWJvb3RzdHJhcAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
