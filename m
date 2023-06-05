Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE500C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pTru8No6fj3hEKi6GKv4rLOs9F537jSulHMGEWnBg8=; b=0qDmSA7ve761lK
	+MpacBue/kFbdVKlRcfP3aY3T+IrhE0BPvLnLX0lfHwgPKdciAUNBSOftkaI1zKlxi4fkCE16XRHc
	UZXrx/UK33gYmBWzDs8MH5BESU/+AiH6Gxv+dLpiiX3hqRZ3Za0ZhMl3DLb++xDo74PKq5latHl9W
	1jH0aL8G6waM6blwN/Qzp3o+Usl9C3H0oDKQIanrb/xZDCi0K+b+ytD3AIt1ZsYd2gaDgemWkzue+
	h8MIcbqjO9zxkrabnl8l0Lz4EFV4yXAym2LFoI8wSBP5lGsDMRKbOm76XonC+3liCgjVQclTxaDY0
	BL/JwL9tNSXx/8Krl4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6BFG-00FnXy-2F;
	Mon, 05 Jun 2023 14:31:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6BFE-00FnXM-2p;
	Mon, 05 Jun 2023 14:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BiPvjTv/FYunN657bgF+yNRJOdTpXopCkXASdTpg1Uc=; b=GP6BI6o/RWse87MYAcH2tBGwFC
	1xo49SpOTHTqX/SNw6WIScHfA1CLXfvHzRLVuxt6T+16iO4u5ouWiGJLuVzRxBdUTTm09RJ1iGdu9
	RRddCKQqTw9TCJA/6qz7QVtJs6rtjPCc9FTTMwHSuWr4+eb6h586uY3btuolAk+IqFkin2N1PXV5z
	5y4ebWemjxfvAHrJp+TnUSgvHYQmxJIW2zERevpXZuLIwjv2+9pmZkmkSQpE8r/4XKU3X7PwndMbh
	qJdAAZZ8u5U4PbwJA5jCiMPp9LpR9v+vomAIzlr9MpZfV69+iDDDPidBtLhalTA381wQ0mY7XnVSd
	Y7UzC+Fw==;
Received: from [187.19.173.165] (helo=quaco.ghostprotocols.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q6BFD-00C6TC-8Q; Mon, 05 Jun 2023 14:31:39 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id E3B0240692; Mon,  5 Jun 2023 11:31:36 -0300 (-03)
Date: Mon, 5 Jun 2023 11:31:36 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/10] perf: tests: Adapt mmap-basic.c for riscv
Message-ID: <ZH3xyJkEf1b51Ydy@kernel.org>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-11-alexghiti@rivosinc.com>
 <20230531-31bd9ddeaca8cb338f81ed14@orel>
 <ZH3ovt4WnTJuTinF@kernel.org>
 <CAHVXubhofC+WaSysWaxcTA2GdJAF8kTD3COBeQDAy25af_rSLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubhofC+WaSysWaxcTA2GdJAF8kTD3COBeQDAy25af_rSLg@mail.gmail.com>
X-Url: http://acmel.wordpress.com
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

RW0gTW9uLCBKdW4gMDUsIDIwMjMgYXQgMDQ6MDA6MTJQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IGVzY3JldmV1Ogo+IE9uIE1vbiwgSnVuIDUsIDIwMjMgYXQgMzo1M+KAr1BNIEFybmFsZG8gQ2Fy
dmFsaG8gZGUgTWVsbyA8YWNtZUBrZXJuZWwub3JnPgo+IHdyb3RlOgo+IAo+ID4gRW0gV2VkLCBN
YXkgMzEsIDIwMjMgYXQgMDU6MTU6MTVQTSArMDIwMCwgQW5kcmV3IEpvbmVzIGVzY3JldmV1Ogo+
ID4gPiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCAxMDo1MzoyMUFNICswMjAwLCBBbGV4YW5kcmUg
R2hpdGkgd3JvdGU6Cj4gPiA+ID4gcmlzY3Ygbm93IHN1cHBvcnRzIG1tYXBpbmcgaGFyZHdhcmUg
Y291bnRlcnMgdG8gdXNlcnNwYWNlIHNvIGFkYXB0IHRoZQo+ID4gdGVzdAo+ID4gPiA+IHRvIHJ1
biBvbiB0aGlzIGFyY2hpdGVjdHVyZS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4g
PiAgdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2ljLmMgfCA0ICsrLS0KPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+
IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYwo+ID4gYi90b29scy9w
ZXJmL3Rlc3RzL21tYXAtYmFzaWMuYwo+ID4gPiA+IGluZGV4IGU2OGNhNjIyOTc1Ni4uZjUwNzVj
YTc3NGY4IDEwMDY0NAo+ID4gPiA+IC0tLSBhL3Rvb2xzL3BlcmYvdGVzdHMvbW1hcC1iYXNpYy5j
Cj4gPiA+ID4gKysrIGIvdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2ljLmMKPiA+ID4gPiBAQCAt
Mjg0LDcgKzI4NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgdGVzdF9jYXNlIHRlc3RzX19iYXNpY19tbWFw
W10gPSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgInBlcm1pc3Npb25zIiksCj4gPiA+
ID4gICAgIFRFU1RfQ0FTRV9SRUFTT04oIlVzZXIgc3BhY2UgY291bnRlciByZWFkaW5nIG9mIGlu
c3RydWN0aW9ucyIsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgbW1hcF91c2VyX3JlYWRf
aW5zdHIsCj4gPiA+ID4gLSNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0
X18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18pCj4gPiA+ID4gKyNpZiBkZWZpbmVkKF9faTM4Nl9f
KSB8fCBkZWZpbmVkKF9feDg2XzY0X18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18pCj4gPiB8fCBf
X3Jpc2N2X3hsZW4gPT0gNjQKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAicGVybWlzc2lv
bnMiCj4gPiA+ID4gICNlbHNlCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgInVuc3VwcG9y
dGVkIgo+ID4gPiA+IEBAIC0yOTIsNyArMjkyLDcgQEAgc3RhdGljIHN0cnVjdCB0ZXN0X2Nhc2Ug
dGVzdHNfX2Jhc2ljX21tYXBbXSA9IHsKPiA+ID4gPiAgICAgICAgICAgICApLAo+ID4gPiA+ICAg
ICBURVNUX0NBU0VfUkVBU09OKCJVc2VyIHNwYWNlIGNvdW50ZXIgcmVhZGluZyBvZiBjeWNsZXMi
LAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgIG1tYXBfdXNlcl9yZWFkX2N5Y2xlcywKPiA+
ID4gPiAtI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVm
aW5lZChfX2FhcmNoNjRfXykKPiA+ID4gPiArI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmlu
ZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX2FhcmNoNjRfXykKPiA+IHx8IF9fcmlzY3ZfeGxl
biA9PSA2NAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICJwZXJtaXNzaW9ucyIKPiA+ID4g
PiAgI2Vsc2UKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAidW5zdXBwb3J0ZWQiCj4gPiA+
ID4gLS0KPiA+ID4gPiAyLjM3LjIKPiA+ID4gPgo+ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTogQW5k
cmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+Cj4gPiBXYXMgdGhlIGtlcm5l
bCBwYXJ0IG1lcmdlZCB1cHN0cmVhbT8KPiA+Cj4gCj4gTm8sIEkgc3RpbGwgaGF2ZW4ndCBhbnN3
ZXJlZCB0aGUgcmV2aWV3cyA6KQoKT2ssIEknbGwgdGhlbiB3YWl0IGZvciBpdCB0byBoYXBwZW4g
dG8gY29uc2lkZXIgbWVyZ2luZyB0aGUgdXNlcmxhbmQKcGFydHMsCgpUaGFua3MsCgotIEFybmFs
ZG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
