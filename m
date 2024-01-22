Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D47C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 17:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PY3PvQqsWGhbr9Kk8/v6ntF/F/Llz9eUpV1sZs9/OEQ=; b=Div2ZGRXibtzYu
	M6civJrgCh1Jq2IqdKIF8NzlHw8AaCCfXCBBJPcAHZzUU6u2x3JOYaHcZanlTMITtdSbnlHwzlc7P
	ntal7V/cnpCd7QnVb8niMDB3MQ/I4TN5jcT1E8rsRhst8pcY/QtOZxG+vahPMJoqAz8JXES3NIKnB
	U3jrx4JlQySnWEMDAf27K8rHE0kJFfHwG05D4FR+wKFrkhNUDmEORMX4+yssBmDyPqy9wEEFF0xki
	X78q+LImNj0wfz9J7UvzmgPpEmmf/0PiPfnvwondYnzJEdXrdjqn6Nrbw3bV7ajP9hxd2hAZiFdrP
	IBYtAFm3vue8e3I+9bWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxhS-00D6yR-1v;
	Mon, 22 Jan 2024 17:03:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxhP-00D6xg-1G
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 17:03:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6BF81FB;
	Mon, 22 Jan 2024 09:03:45 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CE1A3F5A1;
	Mon, 22 Jan 2024 09:02:58 -0800 (PST)
Date: Mon, 22 Jan 2024 17:02:55 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Conor Dooley <conor@kernel.org>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, robh@kernel.org, pierre.gondois@arm.com,
	suagrfillet@gmail.com, linux-riscv@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] RISC-V: cacheinfo: add init_cache_level()
Message-ID: <Za6fvzkrkZTxj_G5@bogus>
References: <20240122013510.55788-1-cuiyunhui@bytedance.com>
 <20240122-boxcar-conical-c728a709aa5c@spud>
 <CAEEQ3wmX7_VP-YM9NkesAhd+5zetw79AW9bo0YO7KGAeJX4eRQ@mail.gmail.com>
 <20240122-jawline-handling-e190c90ddcfc@spud>
 <CAEEQ3wn3vuPMG_=6skXcXNvnktv767nAENp=wmXoD_MAi7EuPw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wn3vuPMG_=6skXcXNvnktv767nAENp=wmXoD_MAi7EuPw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_090303_520421_0364E218 
X-CRM114-Status: GOOD (  16.69  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMDY6NTc6NDlQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBDb25vciwKPiAKPiBPbiBNb24sIEphbiAyMiwgMjAyNCBhdCA0OjU14oCvUE0gQ29u
b3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEphbiAy
MiwgMjAyNCBhdCAwNDozMjoxNVBNICswODAwLCB5dW5odWkgY3VpIHdyb3RlOgo+ID4gPiBIaSBD
b25vciwKPiA+ID4KPiA+ID4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgNDowOeKAr1BNIENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24s
IEphbiAyMiwgMjAyNCBhdCAwOTozNToxMEFNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4g
PiA+ID4gV2hlbiBjYWNoZWluZm9fc3lzZnNfaW5pdCgpIGlzIGV4ZWN1dGVkLCB0aGUgZ2VuZXJh
bCB3ZWFrIGZ1bmN0aW9uCj4gPiA+ID4gPiBpbml0X2NhY2hlX2xldmVsKCkgcmV0dXJucyAtRU5P
RU5ULCBjYXVzaW5nIGZhaWx1cmUgdG8gYWRkIHRoZSAiY2FjaGUiCj4gPiA+ID4gPiBub2RlIHRv
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdXgvLiBJbXBsZW1lbnQgdGhlIGluaXRfY2FjaGVf
bGV2ZWwoKQo+ID4gPiA+ID4gZnVuY3Rpb24gb24gUklTQy1WIHRvIGZpeCBpdC4KPiA+ID4gPgo+
ID4gPiA+IElmIHlvdSByZWNhbGwgY29ycmVjdGx5LCBJIGFza2VkIHlvdSB0byBleHBsYWluIGhv
dyB0byByZXByb2R1Y2UgdGhpcwo+ID4gPiA+IHdoZW4geW91IHNlbnQgdGhlIHBhdGNoLgo+ID4g
Pgo+ID4gPiBJbiBmYWN0LCB0aGUgcmVhc29uIGhhcyBiZWVuIGV4cGxhaW5lZCBpbiB0aGUgY29t
bWl0IGxvZy4gQXMgZm9yIGhvdwo+ID4gPiB0byByZXByb2R1Y2UgaXQsIHlvdSBjYW4gY2hlY2sg
d2hldGhlciB0aGVyZSBpcyBhICJjYWNoZSIgbm9kZSBpbgo+ID4gPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHV4LyBvbiB0aGUgcmlzY3YgcGxhdGZvcm0uCj4gPgo+ID4gVGhhdCdzIHRoZSB0
aGluZyAtIEkgdHJpZWQgdG8gcmVwcm9kdWNlIHRoaXMgc2V2ZXJhbCB0aW1lcyBhbmQgZWl0aGVy
Ogo+ID4gYSkgVGhlIHN5c3RlbSBoYWQgY2FjaGUgaW5mb3JtYXRpb24gaW4gRFQgYW5kIHRoZSBk
aXJlY3Rvcnkgd2FzCj4gPiAgICBjcmVhdGVkLiBJZiBJIGhvdCB1bnBsdWdnZWQgYW5kIHJlLXBs
dWdnZWQgdGhlIGRpcmVjdG9yeSB3YXMKPiA+ICAgIHJlLWNyZWF0ZWQuCj4gPiBiKSBUaGUgc3lz
dGVtIGhhZCBubyBjYWNoZSBpbmZvcm1hdGlvbiBpbiBEVCBhbmQgdGhlIGRpcmVjdG9yeSB3YXMg
bmV2ZXIKPiA+ICAgIGNyZWF0ZWQuCj4gCj4gSW5kZWVkLCBJIHZlcmlmaWVkIGl0IGFnYWluLCBp
dOKAmXMgYmVjYXVzZSB0aGVyZSBpcyBubyBjYWNoZSBub2RlIGluCj4gZHRzLCB0aGFuayB5b3Ug
Zm9yIHJlbWluZGluZyBtZS4KPgoKVGhhdCdzIGdvb2QuIEkgd2Fzbid0IGFibGUgdG8gZmlndXJl
IG91dCB3aHkgdGhlIGlzc3VlIGNvdWxkIG9jY3VyIHdpdGhvdXQKaXNzdWVzIGluIERUL0FDUEku
CgotLSAKUmVnYXJkcywKU3VkZWVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
