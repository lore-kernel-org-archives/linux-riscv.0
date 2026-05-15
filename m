Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E71CD4F39
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 00:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qANYfKXCgLWUgqUUyOOihjCOkMJR/jbOPil+rOXYR+8=; b=QTw7WXjLbDBYu6
	u8if5s4H+MYe0sT6hlygR9CNYF9x9wnyX708vNqnXzXaT/aRauQuigdy39i8xPt7w3riIhyEdGmmb
	wV0FsulIhe3piEeiARfTqb2PeL1tVkgsOBFh41i+Ejpgn9iQm3LF14FZ4YNyJFtTYoaXMV/DwkaDB
	04ev+J7aJb5NHAgCU2hWzakxBqJJqanPFSYQiySWWcE6t10rnLa9R1GHBvJs7Oggrut0uc3po02Mf
	L0iLYAbS/JS/V+RJ3DCNZGiy2NTIGGiE86oCTQVf3Joaij+UMDVGL+AGXqRJt1BoSMsaDpwjyK+7i
	EYPXktRyfhkBOhI+P65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNgQ0-00000006uyW-2MpP;
	Fri, 15 May 2026 00:28:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNgPx-00000006uxs-2BT6;
	Fri, 15 May 2026 00:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D861044301;
	Fri, 15 May 2026 00:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24972C2BCB3;
	Fri, 15 May 2026 00:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778804920;
	bh=1pZiWvBhnqpkHnvABTbPJV3MrqThd/XnMjqELMyQAfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gDZopiaXEuLmbxRVtu2LNZBW8ZsvcPy0oNkp+Sw2hi05Y+eATPkT0ax3t/rkKz1gV
	 8sZ26tsyVqPB2tGkdcea9zSEsCh74+BTGl/b2UGintZqO/9GHoeAe4SDMJpqi4l49S
	 maTiw9VeGOHgeayLdwfRrgvLneG4C0RmisI2JKZRSVH4i/7HVjWr/TaVhaQiMXDbEh
	 E4O+ZrYzW0IFwdAXnMRYmofaJtYCAxObDvuVrAObK6OO2nBFqPpE3dUirDK2na9W15
	 JhymhkelrgSjLaTNGj4Zw8c+PGan8coxx4/gR4Jkl6PWrP/aaSrAL6Rt2jnlC7NKHZ
	 qyZpUCYkoeOCw==
Date: Thu, 14 May 2026 21:28:37 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com,
	james.clark@linaro.org, namhyung@kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Li Guan <guanli.oerv@isrc.iscas.ac.cn>, 9erthalion6@gmail.com,
	alex@ghiti.fr, alexander.shishkin@linux.intel.com,
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
	atrajeev@linux.ibm.com, howardchu95@gmail.com,
	john.g.garry@oracle.com, jolsa@kernel.org, leo.yan@linux.dev,
	libunwind-devel@nongnu.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org, mingo@redhat.com,
	palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org,
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com,
	will@kernel.org
Subject: Re: [PATCH v5 0/7] perf libunwind multiple remote support
Message-ID: <agZotfb5C06VIcEd@x1>
References: <20260413024805.1316480-1-irogers@google.com>
 <20260513233151.572332-1-irogers@google.com>
 <CAP-5=fW6S1XzZvq=kWj6ma=O1UCDrVV3ZNbzK0fMS_ho6e1qVg@mail.gmail.com>
 <agZiS2-fY49MjsY6@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <agZiS2-fY49MjsY6@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_172841_600250_F89E0CEF 
X-CRM114-Status: GOOD (  27.50  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMDk6MDE6MThQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IE9uIFRodSwgTWF5IDE0LCAyMDI2IGF0IDA5OjUxOjA5QU0gLTA3
MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAxMywgMjAyNiBhdCA0OjMy4oCv
UE0gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4gRml4IHRoZSBs
aWJ1bndpbmQgYnVpbGQgZm9yIHdoZW4gbGliZHcgYW5kIGxpYnVud2luZCBhcmUgZmVhdHVyZQo+
ID4gPiBkZXRlY3RlZCwgY3VycmVudGx5IGZhaWxpbmcgd2l0aCBhIGR1cGxpY2F0ZSBzeW1ib2wu
Cj4gPiA+Cj4gPiA+IFJlZmFjdG9yIHRoZSBsaWJ1bndpbmQgc3VwcG9ydCBzbyB0aGF0IHdoZW5l
dmVyIGEgcmVtb3RlIHRhcmdldCBpcwo+ID4gPiBhdmFpbGFibGUsIHBlcmYgZnVuY3Rpb25zIHVz
aW5nIHRoZSBFTEYgbWFjaGluZSBjYW4gdXNlIHRoYXQgcmVtb3RlCj4gPiA+IHRhcmdldCByZWdh
cmRsZXNzIG9mIHdoYXQgdGhlIGhvc3QvbG9jYWwgbWFjaGluZSBpcy4gTWlncmF0ZSBleGlzdGlu
Zwo+ID4gPiBsaWJ1bndpbmQgc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMgbGlrZSBwb3dlcnBjLCBh
cm02NCBhbmQgbG9vbmdhcmNoIHNvCj4gPiA+IHRoYXQgdGhleSBjYW4gd29yayBpbiBhIGNyb3Nz
LWFyY2hpdGVjdHVyZSB3YXkuIEFkZCBzdXBwb3J0IGZvcgo+ID4gPiBSSVNDLVYuIE1ha2UgdGhl
IGNvZGUgbW9yZSByZWd1bGFyIGluIGZ1bmN0aW9uIG5hbWVzLCBldGMuIGFuZCBhdm9pZAo+ID4g
PiBpbmNsdWRpbmcgYSBDLWZpbGUuIFRoaXMgaW5jcmVhc2VzIHRoZSBsaW5lcyBvZiBjb2RlLiBJ
dCBpcyBzaW1pbGFyIGluCj4gPiA+IHN0eWxlIHRvIHRoZSB1bndpbmQtbGliZHcgaW1wbGVtZW50
YXRpb24uIEl0IGlzIGhvcGVkIHRoYXQgdGhlIG1vcmUKPiA+ID4gdW5pZm9ybSBuYXR1cmUgb2Yg
dGhlIGNvZGUgd2lsbCBoZWxwIHdpdGggcmVmYWN0b3JpbmcgdGhlIHBlcmYKPiA+ID4gcmVnaXN0
ZXJzIGZvciBTSU1EL0FQWCBzdXBwb3J0Lgo+ID4gPgo+ID4gPiBBc2lkZSBmcm9tIGxvY2FsIGhv
c3QgdGVzdGluZyB0aGVzZSBwYXRjaGVzIGFyZSB1bmRlciB0ZXN0ZWQsIGluIHBhcnQKPiA+ID4g
YXMgSSdtIGZhaWxpbmcgdG8gc2VlIGhvdyB0byBidWlsZCBsaWJ1bndpbmQgd2l0aCBzdXBwb3J0
IGZvciBtdWx0aXBsZQo+ID4gPiByZW1vdGUgdGFyZ2V0cy4gUGxlYXNlIGNvdWxkIEkgZ2V0IGhl
bHAgaW4gdGVzdGluZy4KPiA+IAo+ID4gU28gdGhlIHBhdGNoZXMgZmFpbGVkIHRvIGFwcGx5IGlu
IFNhc2hpa286Cj4gPiBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MTMyMzMx
NTEuNTcyMzMyLTEtaXJvZ2VycyU0MGdvb2dsZS5jb20KPiA+IFRoZSBiYXNlbGluZSBsb2dzIHNo
b3cgcGVyZi10b29scy1uZXh0IHdhcyBhdCBjb21taXQgOGM4ZjIwOTM2MTQzCj4gPiAoInBlcmYg
YnVpbGQ6IFJlbW92ZSBOT19HVEsyIGJ1aWxkIHRlc3QiKSB3aGljaCBpcyA2IHBhdGNoZXMKPiA+
IG91dC1vZi1kYXRlIGNvbXBhcmVkIHRvIHRoZSBjdXJyZW50IHRpcCB0aGVzZSBwYXRjaGVzIGFy
ZSBhZ2FpbnN0LiBJCj4gPiByYW4gU2FzaGlrbyBsb2NhbGx5LCBzbyBJIGRvbid0IGV4cGVjdCBh
IGh1Z2UgYW1vdW50IGZyb20gdGhlIHJldmlld3MuCj4gPiBDdXJyZW50bHkgU2FzaGlrbyBpcyBj
YXRjaGluZyB1cCB3aXRoIGEgYmFja2xvZyBiZWNhdXNlIGl0cyB0b2tlbnMKPiA+IGhhdmUgYSBs
b3dlciBwcmlvcml0eSBhbmQgdGhlcmUgd2FzIGhpZ2ggbG9hZCBlYXJsaWVyIGluIHRoZSB3ZWVr
Lgo+ID4gQW55d2F5LCBJIGNvdWxkIHJlcG9zdCB0aGUgcGF0Y2hlcyBmb3IgU2FzaGlrbyByZXZp
ZXcgYnV0IGdpdmVuIHRoZQo+ID4gYmFja2xvZyBJIHRoaW5rIHRoYXQgd291bGQganVzdCBjcmVh
dGUgbm9pc2UgYXQgdGhlIG1vbWVudC4gSG9wZWZ1bGx5Cj4gPiBJIGNhbiBnZXQgaHVtYW4gcmV2
aWV3IHNvIHdlIGNhbiBtb3ZlIGZvcndhcmQgd2l0aCBtZXJnaW5nIHRoZXNlCj4gPiBpbXByb3Zl
bWVudHMuCj4gCj4gVHJ5aW5nIHRvIGFwcGx5IGl0IG5vdywgd2lsbCBhbHNvIHJ1biBzYXNoaWtv
IGxvY2FsbHkuCgpJdHMgaW4gcGVyZi10b29scy1uZXh0IHRtcC5wZXJmLXRvb2xzLW5leHQsCgpS
dW5uaW5nIGJ1aWxkIHRlc3RzIG5vdyBhbmQgd2lsbCBsZXQgc2FzaGlrbyBydW5uaW5nIGxvY2Fs
bHksIHByb2JhYmx5CndpbGwgcHVzaCBvdXQgdG9tb3Jyb3cgbW9ybmluZyBpZiBub3RoaW5nIG1h
am9yIGlzIHJlcG9ydGVkLgoKVG8gbWFrZSBwcm9ncmVzcyBJIHRoaW5rIHdlIGNhbiBnbyBvbiBh
ZGRyZXNzaW5nIHNvbWUgU2FzaGlrbyByZXZpZXdzCndpdGggZm9sbG93dXAgc2VyaWVzIG90aGVy
d2lzZSBpdCBkcmFncyBmb3IgYSBsb25nIHRpbWUuCgotIEFybmFsZG8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
