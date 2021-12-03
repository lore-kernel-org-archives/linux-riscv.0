Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4141FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 12:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xTRvFolhJM+EBjOyfZ8LdbS5QB7rCpP4aml3hghuSKs=; b=sFS5dfVL07/cym745B78QbmlEG
	wQeBvYSFCAR/J6HxSbhujZqsHDjSM6k0TY5Iuk1bTFIlos/Zs8m5X4h7v1UQysFzUh22RGXpShSVC
	b/LjhD8kwLVHcK8nrOqgSMZwSfIMZI17P98YWWbEs9jI2CgtiBexMaAtjsm6p0PKfUUjctMKA2Iq0
	SGUEHV5iUqPlKRNItPxWql5SprbrDeBnsUUEZaN8SF/BTfXD/uueJ3UhqmzHEgfskrRlEsxlacEmn
	U1FE9WBdxlU+iyfTYEUL6QrVb/z139i/sAQodFz959zla2UiLUwU6G/up1UW0WLEojOS8/RP1idbB
	Zjg2rflw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt7FQ-00FaNN-3G; Fri, 03 Dec 2021 12:01:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt7Ey-00FaCo-T4; Fri, 03 Dec 2021 12:00:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68B981396;
 Fri,  3 Dec 2021 04:00:35 -0800 (PST)
Received: from [10.1.29.138] (e127744.cambridge.arm.com [10.1.29.138])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 213453F5A1;
 Fri,  3 Dec 2021 04:00:31 -0800 (PST)
Subject: Re: [PATCH v1 2/4] perf script: Add "struct machine" parameter to
 process_event callback
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo
 <acme@kernel.org>, John Garry <john.garry@huawei.com>,
 Will Deacon <will@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20211201123334.679131-1-german.gomez@arm.com>
 <20211201123334.679131-3-german.gomez@arm.com>
 <D6A3A8F3-9946-44FE-A70F-42977C6F38A1@linux.vnet.ibm.com>
From: German Gomez <german.gomez@arm.com>
Message-ID: <38fd4992-63ae-4871-ddfd-27d40b5c48d2@arm.com>
Date: Fri, 3 Dec 2021 12:00:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <D6A3A8F3-9946-44FE-A70F-42977C6F38A1@linux.vnet.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_040037_025517_A3A5CD05 
X-CRM114-Status: GOOD (  19.38  )
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

SGkgQXRoaXJhLAoKT24gMDIvMTIvMjAyMSAxNjowMywgQXRoaXJhIFJhamVldiB3cm90ZToKPgo+
PiBPbiAwMS1EZWMtMjAyMSwgYXQgNjowMyBQTSwgR2VybWFuIEdvbWV6IDxnZXJtYW4uZ29tZXpA
YXJtLmNvbT4gd3JvdGU6Cj4+Cj4+IEluY2x1ZGUgYSAic3RydWN0IG1hY2hpbmUqIiBwYXJhbWV0
ZXIgdG8gdGhlIHByb2Nlc3NfZXZlbnQgY2FsbGJhY2sgaW4KPj4gdGhlIHNjcmlwdGluZyBsYXll
ci4gVGhpcyB3aWxsIGFsbG93IGFjY2VzcyB0byB0aGUgcGVyZl9lbnYgZnJvbSB3aXRoaW4KPj4g
dGhpcyBjYWxsYmFjay4KPj4KPj4gRm9sbG93dXAgcGF0Y2hlcyB3aWxsIGJ1aWxkIG9uIHRvcCBv
ZiB0aGlzIHRvIHJlcG9ydCB0aGUgY29ycmVjdCBuYW1lIG9mCj4+IHRoZSByZWdpc3RlcnMgaW4g
YSBwZXJmLmRhdGEgZmlsZSwgY29uc2lzdGVudGx5IHdpdGggdGhlIGFyY2hpdGVjdHVyZQo+PiB0
aGUgZmlsZSB3YXMgcmVjb3JkZWQgaW4uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdlcm1hbiBHb21l
eiA8Z2VybWFuLmdvbWV6QGFybS5jb20+Cj4+IC0tLQo+PiB0b29scy9wZXJmL2J1aWx0aW4tc2Ny
aXB0LmMgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+PiAuLi4vdXRpbC9zY3JpcHRpbmctZW5n
aW5lcy90cmFjZS1ldmVudC1wZXJsLmMgfCAgMyArKy0KPj4gLi4uL3NjcmlwdGluZy1lbmdpbmVz
L3RyYWNlLWV2ZW50LXB5dGhvbi5jICAgIHwgMjMgKysrKysrKysrKystLS0tLS0tLQo+PiB0b29s
cy9wZXJmL3V0aWwvdHJhY2UtZXZlbnQtc2NyaXB0aW5nLmMgICAgICAgfCAgMyArKy0KPj4gdG9v
bHMvcGVyZi91dGlsL3RyYWNlLWV2ZW50LmggICAgICAgICAgICAgICAgIHwgIDMgKystCj4+IDUg
ZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS90b29scy9wZXJmL2J1aWx0aW4tc2NyaXB0LmMgYi90b29scy9wZXJmL2J1aWx0
aW4tc2NyaXB0LmMKPj4gaW5kZXggOTQzNDM2N2FmLi43MTExMzJmMGIgMTAwNjQ0Cj4+IC0tLSBh
L3Rvb2xzL3BlcmYvYnVpbHRpbi1zY3JpcHQuYwo+PiArKysgYi90b29scy9wZXJmL2J1aWx0aW4t
c2NyaXB0LmMKPj4gQEAgLTIyNTYsNyArMjI1Niw3IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc19zYW1w
bGVfZXZlbnQoc3RydWN0IHBlcmZfdG9vbCAqdG9vbCwKPj4gCQkJCXRocmVhZF9fcmVzb2x2ZShh
bC50aHJlYWQsICZhZGRyX2FsLCBzYW1wbGUpOwo+PiAJCQlhZGRyX2FsX3B0ciA9ICZhZGRyX2Fs
Owo+PiAJCX0KPj4gLQkJc2NyaXB0aW5nX29wcy0+cHJvY2Vzc19ldmVudChldmVudCwgc2FtcGxl
LCBldnNlbCwgJmFsLCBhZGRyX2FsX3B0cik7Cj4+ICsJCXNjcmlwdGluZ19vcHMtPnByb2Nlc3Nf
ZXZlbnQoZXZlbnQsIHNhbXBsZSwgZXZzZWwsICZhbCwgYWRkcl9hbF9wdHIsIG1hY2hpbmUpOwo+
IEhpLAo+Cj4gTG9va3MgbGlrZSB0aGUgcGF0Y2ggaXMgdXNpbmcg4oCcbWFjaGluZeKAnSB0byBh
bGxvdyBhY2Nlc3MgdG8gcGVyZl9lbnZfX2FyY2ggYW5kIHRoZXJlIGJ5IHRvIGdldCB0aGUg4oCc
YXJjaOKAnSB2YWx1ZS4KPiBCdXQgY2FuIHdlIHVzZSBmcm9tIGV2c2VsLCBsaWtlICAicGVyZl9l
bnZfX2FyY2goZXZzZWxfX2VudihldnNlbCkp4oCdIHRvIGdldCBhcmNoIHZhbHVlIGluc3RlYWQg
b2YgaW5jbHVkaW5nIG5ldyBwYXJhbWV0ZXIgZm9yIOKAnHN0cnVjdCBtYWNoaW5l4oCdID8KPgo+
IFRoYW5rcwo+IEF0aGlyYQoKVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4gSXQgbG9va3MgbGlr
ZSB3ZSBjYW4gc2tpcCB0aGlzIHBhdGNoIGlmIHdlCmNhbiBnZXQgdGhlIGFyY2ggdmFsdWUgdGhh
dCB3YXkuCgpUaGFua3MhCkdlcm1hbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
