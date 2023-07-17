Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19F6C04A6A
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 10:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pC3kxP+R7zPpTJxBTIfneXVinL75lJBBLVL5xu+AAXo=; b=hp0z2AHBM7EzM9
	85bdjq5Iaorj6M4ll9vIZgkeVkIHmcw62QqekhnJxzUXFlNlqThhw7Oan6GT94Itx1UglidxeWALK
	xLMd3IZGOYxSrsAZjjqcayLNDcNGfyu5NFvxDpPCwxHGKXGcV0F8MUquxPYQSXAmciglTFyzfGoLp
	+XvSyEZDDoy2wiAN1awgcP4c2JOYCeTIGho/z2f1ewjMfv4qVsLcZJITqwqG+BDmJLubrcEaoINcs
	uRsTRItavuXNHwXg4eGuePzCPt86XZuZGd8/8oJJO5sZgoPru9L6piYoh8MzFPrY5r4SMrHULzp9m
	BPfwCohuxMrptrMJvejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLlC-003mX2-20;
	Mon, 17 Jul 2023 10:47:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLjF-003mNK-19
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Jul 2023 10:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QwEVqapqGt5c5zaKWTZ1oqQBp+aqsZVTLEsdAj1XcXc=; b=KfCbhY1d2N38BQhLoS0cjcwf70
	APYBflKw7faaRf0xF+22LOt7LWcTL6BiIZJbP9gsvGlUvD233G9fYmlEDCEQ05UmZ6bdE5eWhKDwY
	wq8T1q++Ytsc/QON+PEtavQh4vGyYUNP5/MG+owXZijRVskGujtyBQP79W3sVA9/En1sJktXXP+U/
	2kKcc/v+WP+dF9wwC7K49GtNC+JpS7LOoVXmXZwe8c71u/paZkipy6WfF91+0uk0KuHMFbdKXF3NF
	Ma2l6FPIAAHR/FoQ9bjQA2odhvAdkxVis6y1BprdTbUeHLfcLkx+KDOGvJ59XhOQwce8VRdfC2lip
	UMFlIyZw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLj4-0095fw-0L;
	Mon, 17 Jul 2023 10:45:10 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8B49930020C;
	Mon, 17 Jul 2023 12:45:08 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 667FE2463D7EF; Mon, 17 Jul 2023 12:45:08 +0200 (CEST)
Date: Mon, 17 Jul 2023 12:45:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org,
	mark.rutland@arm.com, bjorn@kernel.org, palmer@dabbelt.com,
	bjorn@rivosinc.com, daniel.thompson@linaro.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
Message-ID: <20230717104508.GF4253@hirez.programming.kicks-ass.net>
References: <20230702025708.784106-1-guoren@kernel.org>
 <20230704164003.GB83892@hirez.programming.kicks-ass.net>
 <CAJF2gTTc0Gyo=K-0dCW6wu7q=Wq34hgTB69qJ7VSF_KAgKhavA@mail.gmail.com>
 <20230710080152.GA3028865@hirez.programming.kicks-ass.net>
 <CAJF2gTTt23iSDG_m4ihPhXhYDrz3Xnih=KGLx_ayBLbzPqaTaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTt23iSDG_m4ihPhXhYDrz3Xnih=KGLx_ayBLbzPqaTaQ@mail.gmail.com>
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgMDc6MzM6MjVBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBNb24sIEp1bCAxMCwgMjAyMyBhdCA0OjAy4oCvUE0gUGV0ZXIgWmlqbHN0cmEgPHBldGVy
ekBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTdW4sIEp1bCAwOSwgMjAyMyBhdCAx
MDozMDoyMkFNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1bCA1LCAyMDIz
IGF0IDEyOjQw4oCvQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiB3cm90
ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFNhdCwgSnVsIDAxLCAyMDIzIGF0IDEwOjU3OjA3UE0gLTA0
MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gPiA+ID4gRnJvbTogR3VvIFJlbiA8Z3Vv
cmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBpcnFlbnRyeV9u
bWlfZW50ZXIvZXhpdCB3b3VsZCBmb3JjZSB0aGUgY3VycmVudCBjb250ZXh0IGludG8gaW5faW50
ZXJydXB0Lgo+ID4gPiA+ID4gVGhhdCB3b3VsZCB0cmlnZ2VyIHRoZSBrZXJuZWwgdG8gZGVhZCBw
YW5pYywgYnV0IHRoZSBrZGIgc3RpbGwgbmVlZHMgImVicmVhayIgdG8KPiA+ID4gPiA+IGRlYnVn
IHRoZSBrZXJuZWwuCj4gPiA+ID4gPgo+ID4gPiA+ID4gTW92ZSBpcnFlbnRyeV9ubWlfZW50ZXIv
ZXhpdCB0byBleGNlcHRpb25fZW50ZXIvZXhpdCBjb3VsZCBjb3JyZWN0IGhhbmRsZV9icmVhawo+
ID4gPiA+ID4gb2YgdGhlIGtlcm5lbCBzaWRlLgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBkb2Vzbid0
IGV4cGxhaW4gbXVjaCBpZiBhbnl0aGluZyA6Lwo+ID4gPiA+Cj4gPiA+ID4gSSdtIGNvbmZ1c2Vk
IChwcm9iYWJseSBiZWNhdXNlIEkgZG9uJ3Qga25vdyBSSVNDLVYgdmVyeSB3ZWxsKSwgd2hhdCdz
Cj4gPiA+ID4gRUJSRUFLIGFuZCBob3cgZG9lcyBpdCBoYXBwZW4/Cj4gPiA+IEVCUkVBSyBpcyBq
dXN0IGFuIGluc3RydWN0aW9uIG9mIHJpc2N2IHdoaWNoIHdvdWxkIHJpc2UgYnJlYWtwb2ludCBl
eGNlcHRpb24uCj4gPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBTcGVjaWZpY2FsbHksIGlmIEVC
UkVBSyBjYW4gaGFwcGVuIGluc2lkZSBhbiBsb2NhbF9pcnFfZGlzYWJsZSgpIHJlZ2lvbiwKPiA+
ID4gPiB0aGVuIHRoZSBiZWxvdyBjaGFuZ2UgaXMgYWN0aXZlbHkgd3JvbmcuIEFueSBleGNlcHRp
b24vaW50ZXJydXB0IHRoYXQKPiA+ID4gPiBjYW4gaGFwcGVuIHdoaWxlIGxvY2FsX2lycV9kaXNh
YmxlKCkgbXVzdCBiZSB0cmVhdGVkIGxpa2UgYW4gTk1JLgo+ID4gPiBXaGVuIHRoZSBlYnJlYWsg
aGFwcGVuZCBvdXQgb2YgbG9jYWxfaXJxX2Rpc2FibGUgcmVnaW9uLCBidXQKPiA+ID4gX19ubWlf
ZW50ZXIgZm9yY2VzIGhhbmRsZV9icmVhaygpIGludG8gaW5faW50ZXJ1cHQoKSBzdGF0ZS4gU28g
aG93Cj4gPgo+ID4gQW5kIHdoeSBpcyB0aGF0IGEgcHJvYmxlbT8gSSB0aGluayBJJ20gbWlzc2lu
ZyBzb21ldGhpbmcgZnVuZGFtZW50YWwKPiA+IGhlcmUuLi4KPiBUaGUgaXJxZW50cnlfbm1pX2Vu
dGVyKCkgd291bGQgZm9yY2UgdGhlIGN1cnJlbnQgY29udGV4dCB0byBnZXQKPiBpbl9pbnRlcnJ1
cHQ9dHJ1ZSwgYWx0aG91Z2ggZWJyZWFrIGhhcHBlbnMgaW4gdGhlIGNvbnRleHQgd2hpY2ggaXMK
PiBpbl9pbnRlcnJ1cHQ9ZmFsc2UuCj4gQSBsb3Qgb2YgY2hlY2tpbmcgY29kZXMsIHN1Y2ggYXM6
Cj4gICAgICAgICBpZiAoaW5faW50ZXJydXB0KCkpCj4gICAgICAgICAgICAgICAgIHBhbmljKCJG
YXRhbCBleGNlcHRpb24gaW4gaW50ZXJydXB0Iik7CgpXaHkgd291bGQgeW91IGRvIHRoYXQ/IT8K
CkFyZSB5b3UncmUgdHJ5aW5nIHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBhbiBleGNlcHRpb24g
YW5kIGFuCmludGVycnVwdD8KCllvdSAqY291bGQqIGhhdmUgZWJyZWFrIGluIGFuIGludGVycnVw
dCwgcmlnaHQ/IFNvIHdoeSBwYW5pYyB0aGUgbWFjaGluZQppZiB0aGF0IGhhcHBlbnM/Cgo+IEl0
IHdvdWxkIG1ha2UgdGhlIGtlcm5lbCBwYW5pYywgYnV0IHdlIGRvbid0IHBhbmljOyB3ZSB3YW50
IGJhY2sgdG8gdGhlIHNoZWxsLgo+IGVnOgo+IGVjaG8gQlVHID4gL3N5cy9rZXJuZWwvZGVidWcv
cHJvdm9rZS1jcmFzaC9ESVJFQ1QKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
