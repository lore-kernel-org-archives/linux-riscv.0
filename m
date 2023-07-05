Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F30EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeMHwPZH9hZ7HoA+YAP4TDRt6dNkiABr6peUHrdJnhs=; b=Ey/IThc3Zhz+G5
	qiAuv4yY3oO3Qj9D9roIn0TjAaSlR/9hhGVz2HAFacvOUZnc+ujO+dcnf5JQatDiG001AuhnkJ+R3
	+Npi2suFPmAVkv+VwJc7uGNpXonlDGBLyMuSXJ2BJj9APCbNUUVw1wRKY1FSaq3D950CHYCdgMlI6
	7BYtcRlBjJsT29v3yCh8d6oFlDC/SzQotwm1y/gJiw0QJXJPUfd1WXVyqeBs4WSakRpjfv2sGxYfl
	6N1eL/adGO5EsnarXSE8Q0nHl13yWIwpHltKP340Q7Ia9nMa+tFpuuhx0Rr1n0Qe353XjaBgRiCdy
	ipfUaUby81bKEeaPS7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3iL-00GAtF-06;
	Wed, 05 Jul 2023 14:42:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3iI-00GAr6-2H
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 14:42:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0249C615D7;
	Wed,  5 Jul 2023 14:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E85DC433C7;
	Wed,  5 Jul 2023 14:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688568156;
	bh=89PZ/QaDV/f5qPoJLlgOoWPxoC4vw+BEViZ9AyZWsfg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DfJpQcZ5wYbIRdrAxfvkOEeQ58K5JIHMs2FykL5zAQ2Pv1iLJaDus12bGeMN5OIni
	 /D0lLEsHoJ68qb2bWiEIORQV+3sph/xv9ZxP/oakwPnlxKQYcPeIwNsHH+5uX1f6+j
	 1zQdvnww3UBWVPg1Z2nJ0ILX7uqBx7lb05o0Fe4CQB1S5X9MWiyLXhx4xN3lsIqAWx
	 nzrHbS1MJgvtMYBmpB+zMkSzM8iUMIDrneRNkvqK1ETFJ6vV5glD8ABGTKfKJz56pj
	 oN3ZVXO1IctgMPpWmdDJuGm/+YEdlAeXX2T4iQFNVsFE50XMkGYWqre3TxkZUjXPpt
	 x+hYbs5HsGqQw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>, Jessica Clarke
 <jrtc27@jrtc27.com>, Emil
 Renner Berthing <emil.renner.berthing@gmail.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel
 <ardb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv
 <linux-riscv@lists.infradead.org>, rminnich@gmail.com, Mark Rutland
 <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael
 J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 jdelvare@suse.com, yc.hung@mediatek.com,
 angelogioacchino.delregno@collabora.com, allen-kh.cheng@mediatek.com,
 pierre-louis.bossart@linux.intel.com, tinghan.shen@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org,
 geshijian@bytedance.com, weidong.wd@bytedance.com
Subject: Re: [External] [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
In-Reply-To: <50F3BD62-78F1-456E-A44A-0C7D9A2D4113@jrtc27.com>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
 <20230703-71f67eb66a037f5c0fb825c6@orel>
 <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
 <CANBLGcwcvK55dZ1__wvWCtcw=XoKt=qki8g6C_QYo+TBqqJ=TA@mail.gmail.com>
 <50F3BD62-78F1-456E-A44A-0C7D9A2D4113@jrtc27.com>
Date: Wed, 05 Jul 2023 16:42:33 +0200
Message-ID: <87bkgql8rq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_074238_848222_4F2E818D 
X-CRM114-Status: GOOD (  12.99  )
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

SmVzc2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPiB3cml0ZXM6Cgo+IE9uIDMgSnVsIDIw
MjMsIGF0IDE5OjU4LCBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdA
Z21haWwuY29tPiB3cm90ZToKPj4gCj4+IE9uIE1vbiwgMyBKdWwgMjAyMyBhdCAxNTozMywg6L+Q
6L6J5bSUIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4+PiAKPj4+IEhpIGRyZXcs
Cj4+PiAKPj4+IE9uIE1vbiwgSnVsIDMsIDIwMjMgYXQgOTowMeKAr1BNIEFuZHJldyBKb25lcyA8
YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pj4+IAo+Pj4+IAo+Pj4+IChUaGlzIGlz
IGEgcmVwbHkgdG8gYSBub24tZXhpc3RlbnQgY292ZXIgbGV0dGVyLikKPj4+IAo+Pj4gVGhpcyBo
YXMgYmVlbiBkaXNjdXNzZWQgbWFueSB0aW1lcyB3aXRoIEFyZCwgUGxlYXNlIHJlZmVyIHRvIDoK
Pj4+IGh0dHBzOi8vcGF0Y2hlcy5saW5hcm8ub3JnL3Byb2plY3QvbGludXgtYWNwaS9wYXRjaC8y
MDIzMDQyNjAzNDAwMS4xNi0xLWN1aXl1bmh1aUBieXRlZGFuY2UuY29tLwo+PiAKPj4gSGkgWXVu
aHVpLAo+PiAKPj4gRnJvbSB0aGF0IGRpc2N1c3Npb24gaXQgd2FzIG1lbnRpb25lZCB0aGF0IHRo
YXQgYXJtIHN1cHBvcnRzIDMgbWV0aG9kcwo+PiBvZiBib290aW5nOgo+PiAgZGlyZWN0ICsgZGV2
aWNldHJlZQo+PiAgRUZJICsgZGV2aWNldHJlZQo+PiAgRUZJICsgQUNQSQo+PiAuLmJ1dCBub3QK
Pj4gIGRpcmVjdCArIEFDUEkKPj4gCj4+IFRvIG1lIGl0IGlzbid0IG9idmlvdXMgZnJvbSB0aGF0
IG9yIHRoaXMgdGhyZWFkLCBhbmQgc2luY2UgYXJtIHNlZW1zCj4+IHRvIGJlIGRvaW5nIGZpbmUg
d2l0aG91dCB0aGUgNHRoIG9wdGlvbiBJJ20gY3VyaW91cyB3aHkgdGhhdCdzCj4+IG5lY2Vzc2Fy
eSBvbiByaXNjdj8KPgo+IElmIGFueXRoaW5nIHdlIHNob3VsZCBiZSByZW1vdmluZyBvcHRpb24g
MSwgYmVjYXVzZSB0aGF04oCZcyBub3QgYQo+IGNyb3NzLU9TIHN0YW5kYXJkICh0aG91Z2ggUklT
Qy1W4oCZcyBTQkkgZGlyZWN0IGJvb3RpbmcgaXMgYXQgbGVhc3Qgbm90Cj4gdGllZCB0byB0aGUg
T1MpLiBBbnkgYXBwbGljYXRpb24tY2xhc3MgcGxhdGZvcm0gc3BlYyBpcyBnb2luZyB0bwo+IG1h
bmRhdGUgRUZJLCBiZWNhdXNlLCB3aGF0ZXZlciB5b3VyIHRob3VnaHRzIG9mIEVGSSBhcmUsIHRo
YXQgaXMgKnRoZSoKPiBzdGFuZGFyZC4gQW5kIGlmIHlvdeKAmXJlIHdpbGxpbmcgdG8gcGljayB1
cCBhbGwgdGhlIGNvbXBsZXhpdHkgb2YgQUNQSSwKPiB3aGF04oCZcyBhIGJpdCBvZiBFRkkgKGVz
cGVjaWFsbHkgaWYgeW91IG9ubHkgZ28gZm9yIGEgbWluaW1hbCBvbmUgYSBsYQo+IFUtQm9vdCk/
CgpXZWxsIHNhaWQhCgpZdW5odWksIHdoeSBub3Qgc2ltcGx5IGFkZCBhIG1pbmltYWwgVUVGSSBz
dHViIHRvIENvcmVib290IChsaWtlIEplc3MKcG9pbnRzIG91dCBhYm92ZSk/CgpJTU8gd2hhdCBV
LWJvb3QgKG9yCmh0dHBzOi8vZ2l0aHViLmNvbS9jbG91ZC1oeXBlcnZpc29yL3J1c3QtaHlwZXJ2
aXNvci1maXJtd2FyZSBpZiB5b3UncmUKaW50byBSdXN0IDstKSkgaXMgZG9pbmcsIGFuZCBqdXN0
IGhhdmluZyBhIHNtYWxsIFVFRkkgc2hpbSBpcyB0aGUgd2F5IHRvCmdvLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
