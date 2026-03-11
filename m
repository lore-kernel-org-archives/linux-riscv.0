Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB6EFD064D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iC1U9E6fhcYqxcC8kk2XdgqDZDq/O9kPkPSWpG9Yd8=; b=FhPUpm85yXcI2O
	fXcGQqnWhXRPqAa2jJqK9aVNMJwS42LlqvYwlUytXz1KWx3j/tfXM1abELcUQLzR6CM6AyWEEMQ7/
	iqWU8C9w3lVQRITYqp+s0E4kPRwlzhNm1YK5sUzdsUFB2yXRqaW0CXNZHEZDZ+5+yf2SuFCozw7Me
	x9Gj6eJudosfHnT3BJH5lw5LortXZJSl1md8hPWc39YLEAX3jrQ6XWEcOiQhcV1NVxW/QzElYAgPV
	3iri34wYzZzBzM/BUp/JVEm5WtQN4ROvz+AgHkFH+O7rS5D+NMrzTkn5hu41KuZeaieBY19O0JfsB
	9oNYA4M4x1GOipYKsr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EKa-0000000B584-0CYz;
	Wed, 11 Mar 2026 07:50:12 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EKW-0000000B568-3mO0
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 07:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1773215305;
	bh=qWgwB8j/M+E4gmyyhynMGAfBcceSPDvi0TFbAOKm01s=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=aU2nOozP+kpSvl+z8QOWdSmz7dQ3RWdlByK0RvnhCov68BDICDL+bAKxYl+SAQ/yl
	 8rv4SJRCziHfJcX3EqHkUzfC6J5ce9UMylorkeOBaKBYE8iAwwNaSekQABl8iGaaQl
	 AikxHQh7SXB0Xw86xyHLemxBD8FQh1qvBeFytUmo=
X-QQ-mid: zesmtpsz9t1773215295tb12a1a0e
X-QQ-Originating-IP: ldkFeB95AQ/Pqp2XqD3PI0/pyB/6365kIn1OTkLhfkU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Mar 2026 15:48:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5492583855199653968
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Wed, 11 Mar 2026 15:48:13 +0800
Message-Id: <DGZSCZZTZXMI.15QP3KJ8LB61V@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yanko Kaneti" <yaneti@declera.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Aurelien Jarno" <aurelien@aurel32.net>
Cc: <linux-kernel@vger.kernel.org>, "Lee Jones" <lee@kernel.org>, "Sebastian
 Reichel" <sre@kernel.org>, "Yixun Lan" <dlan@gentoo.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "open
 list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit"
 <spacemit@lists.linux.dev>, "open list:SYSTEM RESET/SHUTDOWN DRIVERS"
 <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <20251102230352.914421-3-aurelien@aurel32.net>
 <b51a62513daa9d2390031ec350e0b33bdb7e54aa.camel@declera.com>
 <aaC78FTN31QYaVg0@aurel32.net>
 <990bc03ed2baa05e619f0aa9cc6a23acadd66ea6.camel@declera.com>
 <aaS6xeKFZz06fb1_@aurel32.net> <aaXuWwyA5NzBZzlW@aurel32.net>
 <36f8df695463e5ff3eaaffbac357fc73026f7373.camel@declera.com>
 <aadGw1fIlJyNNoum@aurel32.net>
 <DGZM6WUAVPPS.20Y0NIZYI4572@linux.spacemit.com>
 <4ab8430161252ec778fabf7e9b68acf3645ed4c7.camel@declera.com>
In-Reply-To: <4ab8430161252ec778fabf7e9b68acf3645ed4c7.camel@declera.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NV3zG3Y1/ZrFkl9v1qFAFTsRT8MNPHEJeXoudNFh/AKGgU6jZ9e47BiX
	mbFjpjoJorFjcXKIB+FKlxHtPgE7TS8rbdkqIr+cg4p63RlH94gutJn2nck+Jiio8iy1vdg
	r1yOVvY1ctNEIXNyG4S9ESFSV3HWElF/jlGKSj9SpaYz/rMAvZ99iTBgded8jq48hOTGFTy
	wPVko/hWLiFC0qoekGa5pgGSREA+ZvnxoYSgZXFzHxZRxRW3l9skww7D9DtJ7UzTCK14/1j
	vM+nQKYwm3wZHbPBBZLEEGrujQkYcbJQU2J47XxwvlUb7epFcP+tzDV7u85y4x9FLuGF3Hv
	y6Ce7JmK1JrfLR8Ynhp2DMwhPvknEKpH3Tac/KXTFO+wKGjwj4klx8FhE6PXDQj/3hN9y4w
	Z3qf+VV+tHgvfyCOM94hJQyCnP9Ufr6NXn+z/iU+376tgIPEg3IQWaPX1KdvXFdaM6Ga3s9
	3IckOxj1NYAl+oDZp+QUpQKaWe5J7klMeDaVhVYQVMOmMCDy4UMPpDEkmkN4gxOiDL8mKjT
	tgj0FdrCVpRnl4zGuef+LkdNVekR1ZdpbyGR6c+cPfGoF0jpHmuoZDO7QAP4kiwPxb7T5tQ
	jlGQtYuuP/4UpwZBfszGH7Sw0gSP3AdQPEflm7JuuaTzrFZS/3gLqoQ039TM1iuZfOLi2nb
	0CV1hFA+wLNYqcVpCX7kg+qEbzgFih9KcsZLBLFF9UC9ejpLFJu21TjaxHVeD4l9pZQczO/
	ucLBNcjgRu9QrpRUeuz6WGPsn7850RI9yKMPNBEnq4EQodhutTMz+cZZzZCL5LOUICQYTO2
	jQ87zTciBtQJJzrnSq2O6CUXbKefc8bEMQjkN7jzZ8a6GiyjXCutQqmDND5Y+GCE56j9d16
	ejcSghWf4v1NeuRsre7YarXE3eiSXfqQBDGpLk3fDssmXacgszQ1eqfomO5sI0umkOzaO/x
	gwlPg0PBW65v5QmSqyo+IH0E9x3Th3Xs2bBUkhIDiltL+vUSO83wM4c3BuG+rBrVB+eEtli
	r66lcojXKTQBe8UpfhS31sCcYVe6riMoGmqShEpO3h6bcdAWbxmM1R+16K5BZgN3WYo29zf
	AyJ6zdHTBMDED0B6SjvwI7co1gVmgpTNFlv9WWh48uRPsdzl/4ZugpjZvkX6gDKiw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_005009_873262_4D9CD0E3 
X-CRM114-Status: GOOD (  40.89  )
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

T24gV2VkIE1hciAxMSwgMjAyNiBhdCAzOjA4IFBNIENTVCwgWWFua28gS2FuZXRpIHdyb3RlOgo+
IE9uIFdlZCwgMjAyNi0wMy0xMSBhdCAxMDo1OCArMDgwMCwgVHJveSBNaXRjaGVsbCB3cm90ZToK
Pj4gT24gV2VkIE1hciA0LCAyMDI2IGF0IDQ6MzggQU0gQ1NULCBBdXJlbGllbiBKYXJubyB3cm90
ZToKPj4gIEhpLCBBdXJlbGllbiBhbmQgWWFua28sCj4+ID4gSGksCj4+ID4gCj4+ID4gT24gMjAy
Ni0wMy0wMiAyMjozNCwgWWFua28gS2FuZXRpIHdyb3RlOgo+PiA+ID4gSGVsbG8sCj4+ID4gPiAK
Pj4gPiA+IE9uIE1vbiwgMjAyNi0wMy0wMiBhdCAyMTowOCArMDEwMCwgQXVyZWxpZW4gSmFybm8g
d3JvdGU6Cj4+ID4gPiA+IE9uIDIwMjYtMDMtMDEgMjM6MTYsIEF1cmVsaWVuIEphcm5vIHdyb3Rl
Ogo+PiA+ID4gPiA+IE9uIDIwMjYtMDItMjcgMTM6MjksIFlhbmtvIEthbmV0aSB3cm90ZToKPj4g
PiA+ID4gPiA+IE9uIFRodSwgMjAyNi0wMi0yNiBhdCAyMjozMiArMDEwMCwgQXVyZWxpZW4gSmFy
bm8gd3JvdGU6Cj4+ID4gPiA+ID4gPiA+IEhpLAo+PiA+ID4gPiA+ID4gPiAKPj4gPiA+ID4gPiA+
ID4gT24gMjAyNi0wMi0yNiAxNjozMiwgWWFua28gS2FuZXRpIHdyb3RlOgo+PiA+ID4gPiA+ID4g
PiA+IEhlbGxvLAo+PiA+ID4gPiA+ID4gPiA+IAo+PiA+ID4gPiA+ID4gPiA+IE9uIE1vbiwgMjAy
NS0xMS0wMyBhdCAwMDowMiArMDEwMCwgQXVyZWxpZW4gSmFybm8gd3JvdGU6Cj4+ID4gPiA+ID4g
PiA+ID4gPiBBZGQgYSAic3BhY2VtaXQtcDEtcmVib290IiBjZWxsIGZvciB0aGUgU3BhY2VtaVQg
UDEgY2hpcC4KPj4gPiA+ID4gPiA+ID4gPiA+IAo+PiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVuQGF1cmVsMzIubmV0Pgo+PiA+ID4gPiA+ID4g
PiA+ID4gLS0tCj4+ID4gPiA+ID4gPiA+ID4gPiB2NTogbm8gY2hhbmdlcwo+PiA+ID4gPiA+ID4g
PiA+ID4gCj4+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1pMmMuYyB8
IDEgKwo+PiA+ID4gPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
PiA+ID4gPiA+ID4gPiA+ID4gCj4+ID4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZmQvc2ltcGxlLW1mZC1pMmMuYyBiL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMKPj4g
PiA+ID4gPiA+ID4gPiA+IGluZGV4IDBhNjA3YTFlM2NhMWQuLjU0MmQzNzhjZGNkMWYgMTAwNjQ0
Cj4+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jCj4+
ID4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jCj4+ID4g
PiA+ID4gPiA+ID4gPiBAQCAtOTksNiArOTksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21h
cF9jb25maWcgc3BhY2VtaXRfcDFfcmVnbWFwX2NvbmZpZyA9IHsKPj4gPiA+ID4gPiA+ID4gPiA+
ICB9Owo+PiA+ID4gPiA+ID4gPiA+ID4gIAo+PiA+ID4gPiA+ID4gPiA+ID4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbWZkX2NlbGwgc3BhY2VtaXRfcDFfY2VsbHNbXSA9IHsKPj4gPiA+ID4gPiA+ID4g
PiA+ICsJeyAubmFtZSA9ICJzcGFjZW1pdC1wMS1yZWJvb3QiLCB9LAo+PiA+ID4gPiA+ID4gPiA+
ID4gIAl7IC5uYW1lID0gInNwYWNlbWl0LXAxLXJlZ3VsYXRvciIsIH0sCj4+ID4gPiA+ID4gPiA+
ID4gPiAgCXsgLm5hbWUgPSAic3BhY2VtaXQtcDEtcnRjIiwgfSwKPj4gPiA+ID4gPiA+ID4gPiA+
ICB9Owo+PiA+ID4gPiA+ID4gPiA+IAo+PiA+ID4gPiA+ID4gPiA+IFBlcmhhcHMgaXRzIHNhZmUg
dG8gbWVyZ2UgdGhpcyBvbmUgbm93IHRoYXQgZXZlcnl0aGluZyBQMSBhbmQgSTJDIGlzCj4+ID4g
PiA+ID4gPiA+ID4gYWxyZWFkeSBpbiBsaW51cyB0aXAgPwo+PiA+ID4gPiA+ID4gPiAKPj4gPiA+
ID4gPiA+ID4gVW5mb3J0dW5hdGVseSwgdGhpcyBwYXRjaHNldCBpcyBzdGlsbCBtaXNzaW5nOgo+
PiA+ID4gPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAyMDctYjQtazMt
aTJjLXBpby12Ny0wLTYyNjk0MmQ5NGQ5MUBsaW51eC5zcGFjZW1pdC5jb20vCj4+ID4gPiA+ID4g
PiA+IAo+PiA+ID4gPiA+ID4gPiBUaGlzIG1lYW5zIHRoZSByZWJvb3RzIHdvcmsgbW9zdCBvZiB0
aGUgdGltZSwgYnV0IGFyZSBub3QgMTAwJSByZWxpYWJsZSwgCj4+ID4gPiA+ID4gPiA+IGFuZCB0
aGF0J3MgdGhlIHJlYXNvbiB3aHkgdGhpcyBwYXRjaCBnb3QgYmxvY2tlZCBmcm9tIG1lcmdpbmcu
Cj4+ID4gPiA+ID4gPiAKPj4gPiA+ID4gPiA+IEkgc2VlLiBUaGFua3MuIFNvdW5kcyB0byBtZSBs
aWtlIHNvbWV0aW1lcyB3b3JraW5nIGNvbXBhcmVkIHRvIG5ldmVyCj4+ID4gPiA+ID4gPiB3b3Jr
aW5nIGlzIGJldHRlciAsIGJ1dCBhbnl3YXkuLgo+PiA+ID4gPiA+IAo+PiA+ID4gPiA+IEkgYWdy
ZWUgd2l0aCB0aGF0LCBidXQgdGhlIGRlY2lzaW9uIHdhcyB0byBob2xkIG9uIHRoaXMgcGF0Y2gg
dW50aWwgdGhlIAo+PiA+ID4gPiA+IEkyQyBQSU8gcGFydCBnb3QgbWVyZ2VkLgo+PiA+ID4gPiA+
IAo+PiA+ID4gPiA+ID4gRldJVyAgd2l0aCB0aGlzIHBhdGNoIGFuZCB0aGUgcGlvIHBhdGNoZXNl
dCBJIGdldCB0aGlzIHJjdSBzcGxhdCBvbgo+PiA+ID4gPiA+ID4gcmVib290ICh3aGljaCBpcyBz
dGlsbCB3b3JraW5nKS4gU2ltaWxhciBzcGxhdCBpcyB0aGVyZSB3aXRob3V0IHRoZSBwaW8KPj4g
PiA+ID4gPiA+IHBhdGNoZXNldC4KPj4gPiA+ID4gPiAKPj4gPiA+ID4gPiBJIGhhdmVuJ3QgYmVl
biBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgaGVyZSBhZnRlciAxMCsgcmVib290cyBvbiBh
IAo+PiA+ID4gPiA+IEJQSS1GMyBib2FyZCwgYnV0IEkgdHJpZWQgdGhlIHBhdGNoIG9uIHRvcCBv
ZiA2LjE5LiBJJ2xsIHRyeSB0byBidWlsZCBhIAo+PiA+ID4gPiA+IDcuMC4wLXJjMiBrZXJuZWwg
YW5kIHJlcG9ydCBiYWNrLgo+PiA+ID4gPiAKPj4gPiA+ID4gSSBoYXZlIHRyaWVkIHRoYXQsIGFu
ZCBJIGFtIHN0aWxsIHVuYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIHdpdGggYSAKPj4gPiA+
ID4gNy4wLjAtcmMyIGtlcm5lbCBhbmQgYSBCUEktRjMgYm9hcmQuCj4+ID4gPiAKPj4gPiA+IEkg
Y2FuIHN0aWxsIHNlZSBpdCBvbiBldmVyeSByZWJvb3QgKHdpdGggdGhlIHBhdGNoZXMgdGhhdCBh
bGxvdyByZWJvb3QKPj4gPiA+IHRvIHdvcmspLiBEbyB5b3UgaGF2ZSBDT05GSUdfUFJFRU1QVF9S
Q1UgaW4geW91ciBjb25maWcgPyBpdHMgZGVmYXVsdCBvbgo+PiA+ID4gd2hlbiBhbnl0aGluZyBQ
UkVFTVBUIGlzIHNlbGVjdGVkLiBJbiBGZWRvcmEgaXRzIENPTkZJR19QUkVFTVBUX0RZTkFNSUMK
Pj4gPiA+IHRoYXQgZmxpcHMgaXQuCj4+ID4gCj4+ID4gVGhhbmtzIGZvciB0aGUgaGludCwgdGhh
dCBvcHRpb24gd2FzIG5vdCBhY3RpdmF0ZWQgaGVyZSwgaXQncyBub3QgdGhlIAo+PiA+IHJpc2N2
NjQgZGVmY29uZmlnLiBXaXRoIGl0IEkgYW0gYWxzbyBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNz
dWUuIEknbGwgCj4+ID4gdHJ5IHRvIGRlYnVnIHRoYXQgYW5kIHJlcG9ydCBiYWNrLgo+PiBJIGhh
dmUgc2VudCBhIHBhdGNoIHRvIGFkZHJlc3MgdGhpcyBpc3N1ZSBoZXJlWzFdLgo+PiAKPj4gQ291
bGQgeW91IHBsZWFzZSB0ZXN0IGl0IG9uIHlvdXIgaGFyZHdhcmUgd2hlbiB5b3UgaGF2ZSBhIGNo
YW5jZT8KPj4gCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIC0gVHJveQo+PiAKPj4gTGluazoK
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwMzExLXY3LTAtcmMxLXJ2LWRpcy1p
bnQtYmVmb3JlLXJlc3RhcnQtdjEtMS1iYzQ2YjQzNTFjYWNAbGludXguZGV2LyBbMV0KPgo+IFRo
YW5rcyBUcm95LsKgU2VlbSB0byBmaXggdGhlIGlzc3VlIGhlcmUuCj4gTm8gc3BsYXQgYW5kIHJl
Ym9vdCBzdGlsbCB3b3JrcyBPSyBvbiB0aGUgUjJTClRoYW5rIHlvdSBhbmQgQXVyZWxpZW4gZm9y
IHRoZSB0ZXN0LgoKVG8gYmUgaG9uZXN0LCBJJ20gc3RpbGwgbm90IGVudGlyZWx5IHN1cmUgaWYg
dGhpcyBpcyB0aGUgcmlnaHQgZml4LgpJ4oCZbSBjdXJpb3VzIHdoeSBSSVNDLVYgZG9lc24ndCBk
aXNhYmxlIGludGVycnVwdHMgZHVyaW5nIHRoaXMgdGFzaywKYXMgQVJNIGFuZCBQb3dlclBDIGRv
LgoKSSd2ZSBzZW50IHRoaXMgb3V0IHdpdGggYW4gUkZDIHByZWZpeCBhbmQgYW0gbG9va2luZyBm
b3J3YXJkIHRvIGdldHRpbmcKc29tZSBmZWVkYmFjayBmcm9tIHRoZSBjb21tdW5pdHkuCgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gVHJveQo+Cj4gLSBZYW5r
bwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
