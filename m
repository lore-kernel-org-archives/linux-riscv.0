Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AA3606A32A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 00:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oWd5oGXA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWI7sRTP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SbgnDnx0k3JnhVD1DqO0mu1aW8+Ow8WuM8UU1U3XbeU=; b=oWd5oGXAUdbB7bQtLKnYs5Ewz8
	qRTyOq3ALbrQDbjOMHshGEFIsB6sDYTMBecdP+TxHtLgG/+SMF3B3tikl6dCpkEa6fKAFODm/eAyU
	CxqMJ1tGTgmRzLdVvh7sr/NL0mt7dxqLC+h4PqmZu3gOL6zeHB96X07kFKwByYNQ30RdjNZRs6WIZ
	mVfVQphSlzAx+6wBzUzNNPvyVIf2CoUI6Gat+L1Vimo7sHpmAyfRDssAGLYMWIBwxCpwBrqx6QXq9
	MzkYG9UXI0qnjqFA+XQLc5ysE0wZCim7pnzlHmqePmXDFFTo1xtUNDi2cNOhq72LSd/ZRv62J2QPx
	t/+RZFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCf5-0000000Dl4P-3QA2;
	Fri, 20 Nov 2026 00:39:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCf4-0000000Dl44-2YFR
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 00:39:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E18743433;
	Fri, 20 Nov 2026 00:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61A91F000C6;
	Fri, 20 Nov 2026 00:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135169;
	bh=15vPBWuJO4ML7J1IqfBjScec+aNHdtb9jbP4UwbOc6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fWI7sRTP+d/DvV1dwLK/WyIn1NKJ8h8dEePpuE1WOdxrdr2xlU0g2uzheW1nD6dph
	 fRcFZklRjfdasJ1e0BT6Bp1Mpvi/RPi7cWTtQf+C/LMPJbWpvgekqc1qAVK3YognT3
	 sQdzWrdwqOTLlx16eoPFpAsmRqU0Kjt/y5mA2iWd7ImFReHUkwyJiWC6rSox842JZ8
	 4ALT2B1tdA6+s6qeQHVtnydN8Omn+MFxh9DWkMpzdlo9uFPVGOVaYv36ZbAJnPyn8l
	 TwXQ82uO1HXzJ9q/bXixtTdprJNqYC0k7TIg8PECi7//g1weKZ6PGti1GAzMAws9Qz
	 RvC3Jvv/k3JvA==
Date: Thu, 19 Nov 2026 16:39:27 -0800
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [External] Re: [PATCH v12 1/5] riscv_cbqri: Add capacity
 controller core
Message-ID: <av-WvzoxSv7QpMhQ@thelio>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
 <20261119000846.776930b3@jic23-hlaptop>
 <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMDc6MDA6MjFQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFRodSwgTm92IDE5LCAyMDI2IGF0IDg6MDnigK9BTSBKb25h
dGhhbiBDYW1lcm9uIDxqaWMyM0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIDE0
IE5vdiAyMDI2IDE0OjA2OjIxIC0wODAwCj4gPiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gPiBBZGQgdGhlIGNvcmUgZm9yIFJJU0MtViBDQlFSSSBjYXBh
Y2l0eSBjb250cm9sbGVyczogdGhlIHJlZ2lzdGVyCj4gPiA+IGxheW91dCwgdGhlIGNhcGFiaWxp
dHkgcHJvYmUsIGFuZCB0aGUgYWxsb2NhdGlvbiBvcGVyYXRpb25zIHRoYXQKPiA+ID4gcHJvZ3Jh
bSBhIGNhcGFjaXR5IGJsb2NrIG1hc2sgZm9yIGFuIFJDSUQgYW5kIHJlYWQgaXQgYmFjay4KPiA+
ID4KPiA+ID4gQSBkaXNjb3ZlcnkgbGF5ZXIgbWFwcyB0aGUgcmVnaXN0ZXIgYmxvY2sgYW5kIGRl
c2NyaWJlcyB0aGUgY29udHJvbGxlcgo+ID4gPiBpbiBhIGNicXJpX2NvbnRyb2xsZXJfaW5mbyBk
ZXNjcmlwdG9yLiByaXNjdl9jYnFyaV9yZWdpc3Rlcl9jYygpIHByb2Jlcwo+ID4gPiB0aGUgY29u
dHJvbGxlciBmcm9tIHRoYXQgZGVzY3JpcHRvciBhbmQgYWRkcyBpdCB0byB0aGUgY29udHJvbGxl
ciBsaXN0LAo+ID4gPiB3aGljaCBzdGF5cyBwcml2YXRlIHRvIHRoZSBjb3JlLiBUaGUgY29yZSBv
d25zIHRoZSBjb250cm9sbGVyIHN0YXRlCj4gPiA+IGFmdGVyIHJlZ2lzdHJhdGlvbiwgc28gbm90
aGluZyBpbiBpdCBkZXBlbmRzIG9uIGhvdyB0aGUgY29udHJvbGxlciB3YXMKPiA+ID4gZGlzY292
ZXJlZC4gVGhlIGNhbGxlciBrZWVwcyB0aGUgcmVnaXN0ZXIgbWFwcGluZyBhbGl2ZS4KPiA+ID4K
PiA+ID4gVGVzdGVkLWJ5OiBaZW5nIEhlbmcgPHplbmdoZW5nQHBpY29oZWFydC5jb20+Cj4gPiA+
IFJldmlld2VkLWJ5OiBaZW5nIEhlbmcgPHplbmdoZW5nQHBpY29oZWFydC5jb20+Cj4gPiA+IENv
LWRldmVsb3BlZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJyZS5jb20+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmllbiBSaWNjaWFyZGkgPGFyaWNjaWFyZGlAYmF5bGli
cmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVs
Lm9yZz4KWy4uXQo+ID4gPiArICAgICAvKiBUaGUgcmVzY3RybCBnbHVlIGtleXMgaXRzIGRvbWFp
bnMgb24gY2FjaGVfaWQsIG9uZSBjb250cm9sbGVyIGVhY2guICovCj4gPiA+ICsgICAgIGxpc3Rf
Zm9yX2VhY2hfZW50cnkob3RoZXIsICZjYnFyaV9jb250cm9sbGVycywgbGlzdCkgewo+ID4gPiAr
ICAgICAgICAgICAgIGlmIChvdGhlci0+Y2FjaGUuY2FjaGVfbGV2ZWwgPT0gaW5mby0+Y2FjaGVf
bGV2ZWwgJiYKPiA+ID4gKyAgICAgICAgICAgICAgICAgb3RoZXItPmNhY2hlLmNhY2hlX2lkID09
IGluZm8tPmNhY2hlX2lkKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJD
QyBhdCAlcGEgZHVwbGljYXRlcyB0aGUgTCV1IGNhY2hlIGlkICV1IGNvbnRyb2xsZXIgYXQgJXBh
LCBza2lwcGluZ1xuIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmN0cmwt
PmFkZHIsIGluZm8tPmNhY2hlX2xldmVsLCBpbmZvLT5jYWNoZV9pZCwKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJm90aGVyLT5hZGRyKTsKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRUVYSVNUOwo+IAo+IEEgY29udHJvbGxlciB3aXRoIHRoZSBzYW1lIGNh
Y2hlIGxldmVsIGFuZCBDYWNoZSBJRCBpcyBub3QgbmVjZXNzYXJpbHkKPiBhIGR1cGxpY2F0ZS4g
QSBkaXN0cmlidXRlZCBMTEMgbWF5IGhhdmUgbXVsdGlwbGUgcGh5c2ljYWwgY29udHJvbGxlcnMK
PiBtYW5hZ2luZyB0aGUgc2FtZSBsb2dpY2FsIEwzIHJlc291cmNlLgo+IAo+IE1hdGNoaW5nIGNv
bnRyb2xsZXJzIHNob3VsZCBpbnN0ZWFkIGJlIGdyb3VwZWQgaW50byBhIGxvZ2ljYWwgY29tcG9u
ZW50Cj4ga2V5ZWQgYnkgKGNhY2hlX2xldmVsLCBjYWNoZV9pZCksIHdpdGggdGhlIHBoeXNpY2Fs
IGNvbnRyb2xsZXJzIGtlcHQgaW4KPiBhIGxpbmtlZCBsaXN0LiBVc2VyIHNwYWNlIHdvdWxkIHNl
ZSBvbmUgbG9naWNhbCBjb250cm9sbGVyIGFzIGEgc2luZ2xlCj4gcmVzY3RybCBMMyBkb21haW4s
IHdoaWxlIHRoZSB1cGRhdGUgcGF0aCB3b3VsZCBpdGVyYXRlIHRoZSBsaXN0IGFuZAo+IHByb2dy
YW0gZXZlcnkgcGh5c2ljYWwgY29udHJvbGxlci4KCkdvb2QgcG9pbnQgdGhhdCBpdCBpcyBub3Qg
YSBkdXBsaWNhdGUuIEhvd2V2ZXIsIEkgd291bGQgbGlrZSB0byBrZWVwIHRoZQpzY29wZSBvZiB0
aGlzIHNlcmllcyBmcm9tIGV4cGFuZGluZywgc28gSSB3b3VsZCBwcmVmZXIgZm9yIHRoYXQgc2Nl
bmFyaW8KdG8gYmUgaGFuZGxlZCBpbiBhIGZ1dHVyZSBzZXJpZXMuIFRoZSBkb21haW4gaWQgaXMg
dGhlIGNhY2hlIGlkIGluIGJvdGgKY2FzZXMsIHNvIGl0IHdvbid0IGJlIGEgcHJvYmxlbSB0byBh
ZGQgbGF0ZXIuCgpEbyB5b3UgaGF2ZSBhIHBsYXRmb3JtIHdpdGggc3VjaCBhbiBMMyB0aGF0IGl0
IGNvdWxkIGJlIHRlc3RlZCBvbj8KCkZvciB2MTMsIEkgY291bGQgY2hhbmdlIHRoZSBjb21tZW50
IGFuZCB0aGUgd2FybmluZyBzbyB0aGF0IHRoZXkgc2F5IGEKc2Vjb25kIGNvbnRyb2xsZXIgZm9y
IGEgY2FjaGUgaXMgbm90IHN1cHBvcnRlZCwgaW5zdGVhZCBvZiBjYWxsaW5nIGl0IGEKZHVwbGlj
YXRlLiBUaGUgYWx0ZXJuYXRpdmUgY291bGQgYmUgdG8gc2tpcCB0aGUgd2hvbGUgZ3JvdXAgaWYg
aXQgaXMKYSBwcm9ibGVtIHRvIGp1c3QgbGVhdmUgdGhlIGZpcnN0IG9mIHRoZSBncm91cCBlbmFi
bGVkLgoKVGhhbmtzLApEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
