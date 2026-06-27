Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A520EC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 22:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTHP4LHAQTXo6b8EO8Yk9h2Yrtv2TB1+kOn3iMrEsXo=; b=cK4Le7AwoRRyOv
	wZKs6BamJQ2cqJY2L4AFHuUk7+gxnEAYwXutjjaI4FbXdm8QBxzE0LfMg0CB5NUKmV/9eQDfLOLQD
	pTWRo+eeq8DJqPNTLREG2cA562ZC1slbjaqEiq2cI8DnQ8CntdFu049Mb9UPVP6kdpOv63YOYOhIy
	hChVtP5paWqvpKzr89S3w0lmNtJH78dztf6YwfuvWqGLl4Ag3whHmcQDGjakON5GHD0/nlBDNIwOJ
	CTKkyA6VG90R8o4F1K7lvPTgSrMnCyI/jWGi6j9wr1EeZZaG9tF+Ne85jgaitYtfnk5IaTnyxnt8r
	PR0C/xlcUhsRORGy1GkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbE2-0000000CmyT-0FVi;
	Sat, 27 Jun 2026 22:10:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbE0-0000000CmyN-2Gyu
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 22:10:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30DC743F4D;
	Sat, 27 Jun 2026 22:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C491F000E9;
	Sat, 27 Jun 2026 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782598206;
	bh=hXk/3wj9lPuJCQvYpjGC/6+kjVjcs5SuF2pwhCfblgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KwNrxQgJVN8O/LbbNanheVHNF4seUkCijI6JBEHt+/pVyaoyi8GHna1M8j9Q8rFwy
	 vjYXsheeYMBZZBM4h46nutz/29QBslwVDHlDG8v14K9zWPf8u3Q0TsPvzEpqNPULIy
	 Ka+qEUM7TFWkIGMxpp+GaHihtgYKrWsLDXEZx7dizRfq9smMXkoYJR6bCLe6nSuNeo
	 +kUpVcIbVWV/WYRzdY/1rCdNllhLfi+cVc+AVILwSEZ7UXYXPTaq9jk7fhok7zkKiY
	 12B+J7VadfIPGgB4GEVSueOD6eHRiMYmLCCaiWUf6BRtOeLtSgLeXhN11rAr22sK93
	 rFkVT4B/TcJCg==
Date: Sat, 27 Jun 2026 15:10:04 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [External] [PATCH v2 4/8] riscv_cbqri: Add capacity controller
 probe and allocation device ops
Message-ID: <akBKPFPi5213WgYX@x1>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-4-2f8049fd902b@kernel.org>
 <CAEEQ3w=ZVtHPdLfN0tTzG8AACu+rjhEFWY5pCg+uxvmr7ofqfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=ZVtHPdLfN0tTzG8AACu+rjhEFWY5pCg+uxvmr7ofqfA@mail.gmail.com>
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

T24gU2F0LCBKdW4gMjcsIDIwMjYgYXQgMDU6MzE6MDNQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFRodSwgSnVuIDI1LCAyMDI2IGF0IDk6NDHigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIHN1cHBvcnQg
Zm9yIHRoZSBSSVNDLVYgQ0JRUkkgY2FwYWNpdHkgY29udHJvbGxlci4gQSBwbGF0Zm9ybSBkcml2
ZXIKPiA+IHBhc3NlcyBhIGNicXJpX2NvbnRyb2xsZXJfaW5mbyBkZXNjcmlwdG9yIHRvZ2V0aGVy
IHdpdGggdGhlIGNhY2hlIGxldmVsCj4gPiB0byByaXNjdl9jYnFyaV9yZWdpc3Rlcl9jY19kdCgp
LCB3aGljaCBwcm9iZXMgdGhlIGNvbnRyb2xsZXIgYW5kIGFkZHMgaXQKPiA+IHRvIHRoZSBjb250
cm9sbGVyIGxpc3QuCj4gPgo+ID4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTcK
PiA+IENvLWRldmVsb3BlZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJy
ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRpQGJh
eWxpYnJlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJu
ZWwub3JnPgpbLi5dCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNjdHJsL2NicXJpX2Rldmlj
ZXMuYyBiL2RyaXZlcnMvcmVzY3RybC9jYnFyaV9kZXZpY2VzLmMKPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
Li44YWQ5ZGY0MDRmNjVkNWQ4MjcyMmNmOGI3OGYwMjkzNmM0ODljYTZkCj4gPiAtLS0gL2Rldi9u
dWxsCj4gPiArKysgYi9kcml2ZXJzL3Jlc2N0cmwvY2JxcmlfZGV2aWNlcy5jClsuLl0KPiA+ICsK
PiA+ICsvKiBTZXQgY2FwYWNpdHkgYmxvY2sgbWFzayAoY2NfYmxvY2tfbWFzaykgKi8KPiA+ICtz
dGF0aWMgdm9pZCBjYnFyaV9zZXRfY2JtKHN0cnVjdCBjYnFyaV9jb250cm9sbGVyICpjdHJsLCB1
NjQgY2JtKQo+ID4gK3sKPiA+ICsgICAgICAgaW93cml0ZTY0KGNibSwgY3RybC0+YmFzZSArIENC
UVJJX0NDX0JMT0NLX01BU0tfT0ZGKTsKPiAKPiBUaGUgQ0JRUkkgc3BlYyBhbGxvd3MgbmF0dXJh
bGx5IGFsaWduZWQgNC1ieXRlIGFjY2Vzc2VzIGFuZCBvbmx5IGd1YXJhbnRlZXMKPiBhdG9taWNp
dHkgZm9yIDQtYnl0ZSBhY2Nlc3NlczsgOC1ieXRlIGF0b21pY2l0eSBpcyB1bnNwZWNpZmllZC4K
PiAKPiBXb3VsZCAzMi1iaXQgc3BsaXQgYWNjZXNzZXMgYmUgcHJlZmVyYWJsZSBoZXJlIGluc3Rl
YWQgb2YgcmVseWluZyBvbgo+IGlvcmVhZDY0L2lvd3JpdGU2ND8gVGhpcyBtYXkgYWxzbyBtYWtl
IHRoZSBkcml2ZXIgbGVzcyBkZXBlbmRlbnQgb24gbmF0aXZlCj4gNjQtYml0IE1NSU8gc3VwcG9y
dC4KCkkgc3VwcG9zZSB0aGVyZSBjb3VsZCBiZSBzeXN0ZW1zIHRoYXQgYXJlIFJWNjQgYnV0IGRv
IDQtYnl0ZSBhY2Nlc3MgZm9yCnRoZSBDQlFSSSByZWdpc3RlcnMuIFlvdSBhcmUgcmlnaHQgdGhl
IHNwZWMgb25seSBndWFyYW50ZWVzIGF0b21pY2l0eQpmb3IgbmF0dXJhbGx5IGFsaWduZWQgNC1i
eXRlIGFjY2Vzc2VzIGFuZCBsZWF2ZXMgOC1ieXRlIGF0b21pY2l0eQp1bnNwZWNpZmllZC4KCkkg
d2lsbCBzd2l0Y2ggdGhlIGNvbnRyb2xsZXIgcmVnaXN0ZXIgYWNjZXNzZXMgdG8gMzItYml0IHJl
YWRzIGFuZAp3cml0ZXMuIFRoZSBkcml2ZXIgcmVqZWN0cyBuY2Jsa3MgPiAzMiwgc28gY2NfYmxv
Y2tfbWFzayBvbmx5IHVzZXMgaXRzCmxvdyAzMiBiaXRzLiBGb3IgY2NfYWxsb2NfY3RsLCB0aGUg
d3JpdGFibGUgZmllbGRzIGFsbCBzaXQgaW4gdGhlIGxvdwp3b3JkIHdoaWxlIHRoZSBzdGF0dXMg
YW5kIGJ1c3kgYml0cyBhcmUgcmVhZC1vbmx5IGluIHRoZSBoaWdoIHdvcmQuIEEKcmVhZCBjYW4g
cmVjb25zdHJ1Y3QgdGhlIHZhbHVlIGZyb20gdHdvIDMyLWJpdCByZWFkcyBhbmQgYSB3cml0ZSBv
bmx5Cm5lZWRzIHRoZSBsb3cgd29yZC4gCgpUaGFua3MsCkRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
