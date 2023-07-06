Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2CFEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMo88UxQ5G/frTY559uZ5sSNci5FlUqU4KJeUwjRKl0=; b=POSo2ZZLH7Bq/H
	JlwAapN6QBVyIg/agixSsowjcWYvw+umqrZZkddmiT7vW1Kqj7Jt73DhdZDv4IZAEx9PIzDBBxFkT
	0ITT6BlxWI74UApb9nOGB1Do3VO6sbyaj7q1U/tQRwSI3c1tWwbI5l2NznvDV6Nk09mTZGcuajzUw
	Y/FuEnfH691D/r1UJi+h5tOdpiH6wcL0vYCDSsvy0+OT/FvZxEf7AwaOcxt5VtA+Vk3lq5e9FaUTu
	2l9B4JbOO5O1oZrEvs5Vho5TrLBNFbYS/8IsBPyoOSL38CaLlzmsKCQKDBMDkFCcev3xRnvBzC92/
	Fk4Tf+srOTK9Bxv+Sb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHKir-00104c-05;
	Thu, 06 Jul 2023 08:52:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHKio-00104A-0P
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 08:52:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D1B461847;
	Thu,  6 Jul 2023 08:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F287C433C7;
	Thu,  6 Jul 2023 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688633536;
	bh=ggVTIl5Ohn7qil0HaYjyKOkRlN5j1S5LhF5oA/HxgDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nAAQ8I4u0oL9hHLlo/IXbbKw8j0UTDg3vzzcYaZRFuADEI3gURbH0O9DKjt8D1aKN
	 kDmwv0Qr/cVFXAmFfR2dLyGi7A3EAi9ho2+uYSOLchmnNI+VfPy8UoyBkwrhMknQzM
	 ZIdPoltZ082Zr/hs44C3Z3fGsQsv56AAbwypk7mR3iwPnR36pb5NhtacSgPio1lrB0
	 2yckYj+tMSfftDmbv8vlu3lPqihTDgTLHqJuPJ/KmvPVg3PjFpU+tHvdyTNqU+yLZL
	 zbZ/Up0WYMimXJlNVEnnTSHAn9qv/eXnMpfjE6145ztLWg+JxbLtMpwOv4iboeVApW
	 OB7BTLbhow/Qg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Emil Renner Berthing
 <emil.renner.berthing@gmail.com>, Andrew Jones <ajones@ventanamicro.com>,
 Ard Biesheuvel <ardb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>,
 rminnich@gmail.com, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>, jdelvare@suse.com, yc.hung@mediatek.com,
 angelogioacchino.delregno@collabora.com, allen-kh.cheng@mediatek.com,
 pierre-louis.bossart@linux.intel.com, tinghan.shen@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org,
 geshijian@bytedance.com, weidong.wd@bytedance.com, graf@amazon.de
Subject: Re: [External] [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
In-Reply-To: <CAEEQ3wnaaMvJ3=7udvAjiP3q36nvqAwb8sh34f+nO8Ua_83yFw@mail.gmail.com>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
 <20230703-71f67eb66a037f5c0fb825c6@orel>
 <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
 <CANBLGcwcvK55dZ1__wvWCtcw=XoKt=qki8g6C_QYo+TBqqJ=TA@mail.gmail.com>
 <50F3BD62-78F1-456E-A44A-0C7D9A2D4113@jrtc27.com>
 <87bkgql8rq.fsf@all.your.base.are.belong.to.us>
 <CAEEQ3wnaaMvJ3=7udvAjiP3q36nvqAwb8sh34f+nO8Ua_83yFw@mail.gmail.com>
Date: Thu, 06 Jul 2023 10:52:14 +0200
Message-ID: <87sfa1toap.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_015218_281006_E396C005 
X-CRM114-Status: GOOD (  18.80  )
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

6L+Q6L6J5bSUIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JpdGVzOgoKPiBIaSBCasO2cm4s
Cj4KPiBPbiBXZWQsIEp1bCA1LCAyMDIzIGF0IDEwOjQz4oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympv
cm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3
LmNvbT4gd3JpdGVzOgo+Pgo+PiA+IE9uIDMgSnVsIDIwMjMsIGF0IDE5OjU4LCBFbWlsIFJlbm5l
ciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAZ21haWwuY29tPiB3cm90ZToKPj4gPj4K
Pj4gPj4gT24gTW9uLCAzIEp1bCAyMDIzIGF0IDE1OjMzLCDov5DovonltJQgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPj4gPj4+Cj4+ID4+PiBIaSBkcmV3LAo+PiA+Pj4KPj4gPj4+
IE9uIE1vbiwgSnVsIDMsIDIwMjMgYXQgOTowMeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiA+Pj4+Cj4+ID4+Pj4KPj4gPj4+PiAoVGhpcyBpcyBh
IHJlcGx5IHRvIGEgbm9uLWV4aXN0ZW50IGNvdmVyIGxldHRlci4pCj4+ID4+Pgo+PiA+Pj4gVGhp
cyBoYXMgYmVlbiBkaXNjdXNzZWQgbWFueSB0aW1lcyB3aXRoIEFyZCwgUGxlYXNlIHJlZmVyIHRv
IDoKPj4gPj4+IGh0dHBzOi8vcGF0Y2hlcy5saW5hcm8ub3JnL3Byb2plY3QvbGludXgtYWNwaS9w
YXRjaC8yMDIzMDQyNjAzNDAwMS4xNi0xLWN1aXl1bmh1aUBieXRlZGFuY2UuY29tLwo+PiA+Pgo+
PiA+PiBIaSBZdW5odWksCj4+ID4+Cj4+ID4+IEZyb20gdGhhdCBkaXNjdXNzaW9uIGl0IHdhcyBt
ZW50aW9uZWQgdGhhdCB0aGF0IGFybSBzdXBwb3J0cyAzIG1ldGhvZHMKPj4gPj4gb2YgYm9vdGlu
ZzoKPj4gPj4gIGRpcmVjdCArIGRldmljZXRyZWUKPj4gPj4gIEVGSSArIGRldmljZXRyZWUKPj4g
Pj4gIEVGSSArIEFDUEkKPj4gPj4gLi5idXQgbm90Cj4+ID4+ICBkaXJlY3QgKyBBQ1BJCj4+ID4+
Cj4+ID4+IFRvIG1lIGl0IGlzbid0IG9idmlvdXMgZnJvbSB0aGF0IG9yIHRoaXMgdGhyZWFkLCBh
bmQgc2luY2UgYXJtIHNlZW1zCj4+ID4+IHRvIGJlIGRvaW5nIGZpbmUgd2l0aG91dCB0aGUgNHRo
IG9wdGlvbiBJJ20gY3VyaW91cyB3aHkgdGhhdCdzCj4+ID4+IG5lY2Vzc2FyeSBvbiByaXNjdj8K
Pj4gPgo+PiA+IElmIGFueXRoaW5nIHdlIHNob3VsZCBiZSByZW1vdmluZyBvcHRpb24gMSwgYmVj
YXVzZSB0aGF04oCZcyBub3QgYQo+PiA+IGNyb3NzLU9TIHN0YW5kYXJkICh0aG91Z2ggUklTQy1W
4oCZcyBTQkkgZGlyZWN0IGJvb3RpbmcgaXMgYXQgbGVhc3Qgbm90Cj4+ID4gdGllZCB0byB0aGUg
T1MpLiBBbnkgYXBwbGljYXRpb24tY2xhc3MgcGxhdGZvcm0gc3BlYyBpcyBnb2luZyB0bwo+PiA+
IG1hbmRhdGUgRUZJLCBiZWNhdXNlLCB3aGF0ZXZlciB5b3VyIHRob3VnaHRzIG9mIEVGSSBhcmUs
IHRoYXQgaXMgKnRoZSoKPj4gPiBzdGFuZGFyZC4gQW5kIGlmIHlvdeKAmXJlIHdpbGxpbmcgdG8g
cGljayB1cCBhbGwgdGhlIGNvbXBsZXhpdHkgb2YgQUNQSSwKPj4gPiB3aGF04oCZcyBhIGJpdCBv
ZiBFRkkgKGVzcGVjaWFsbHkgaWYgeW91IG9ubHkgZ28gZm9yIGEgbWluaW1hbCBvbmUgYSBsYQo+
PiA+IFUtQm9vdCk/Cj4+Cj4+IFdlbGwgc2FpZCEKPj4KPj4gWXVuaHVpLCB3aHkgbm90IHNpbXBs
eSBhZGQgYSBtaW5pbWFsIFVFRkkgc3R1YiB0byBDb3JlYm9vdCAobGlrZSBKZXNzCj4+IHBvaW50
cyBvdXQgYWJvdmUpPwo+Cj4gSW4gZmFjdCwgaW4gdGhlIHYxIGVtYWlsLCBDb3JlYm9vdCdzIG1h
aW50YWluZXIgUm9uIGhhcyBtYWRlIGl0IGNsZWFyCj4gdGhhdCBDb3JlYm9vdCBkb2VzIG5vdCBz
dXBwb3J0IEVGSSwgYW5kIGl0IGlzIG5lY2Vzc2FyeSB0byB0cmFuc21pdAo+IGZpcm13YXJlIGlu
Zm9ybWF0aW9uIHRocm91Z2ggRFRTIG9uIFJJU0MtVi4KCkl0IGNsZWFyIHRoYXQgQ29yZWJvb3Qg
ZG9lc24ndCBzdXBwb3J0IFVFRkkgdG9kYXkuIFdlJ3JlICJhcmd1aW5nIiB0aGF0Cml0J3MgbGVz
cyB3b3JrL3ZlcmlmaWNhdGlvbiBhZGRpbmcgdGhlIG5lY2Nlc2FyeSBtaW5pbWFsIFVFRkkgcGx1
bWJpbmcKZm9yIENvcmVib290LCB0aGFuIGp1bXBpbmcgdGhyb3VnaCBob29wcyBpbiB0aGUga2Vy
bmVsIHRvIHdvcmsgYXJvdW5kCml0LgoKSSdtIGdldHRpbmcgc29tZSBVRUZJIEZVRCB2aWJlcyBo
ZXJlLiBJIGFsc28gdGhpbmsgdGhhdCBwYXJ0cyBvZiBVRUZJIGlzCmtpbmQgb2YgdWdseSwgYnV0
IGl0J3MsIGFzIEplc3Mgc2F5cywgKnRoZSogc3BlYyBhbmQgaG9uZXN0bHksIGEgYml0CndoYXQn
cyBleHBlY3RlZCAoSGkgQ1hMKS4KClVFRkkgaXMgYSBzcGVjaWZpY2F0aW9uLCBhbmQgaW1wbGVt
ZW50aW5nIHRoZSBtaW5pbWFsIHJlcXVpcmVtZW50cyBmb3IKVUVGSSBpcyBub3QgdGhhdCBvZiBh
IGJpZyBkZWFsLiBMb29rIGF0IEFsZXggR3JhZidzIChldCBhbCkgd29yayBvbgp1LWJvb3QgVUVG
SS4gVS1ib290IGlzIHNtYWxsL2xlYW4vb3BlbiAqYW5kKiBtYW5hZ2UgdG8gc3VwcG9ydCBlbm91
Z2gKVUVGSSBmb3IgQUNQSS4KClRoZSB3aG9sZSAiT2gsIFVFRkkgaXMgc28gYmFkLCBibG9hdGVk
LCBhbmQgY2xvc2VkIiBoYW5kLXdhdmVyeSBpcyBhIGJpdAp0aXJpbmcuIDotKAoKLi4udGhlc2Ug
bGFzdCBmb3VyIHNlY3Rpb25zIGlzIG1vcmUgb2YgYSBiZWVyIGRpc2N1c3Npb24uIEknbGwgdGFr
ZSBteQoibXkgRlcgaXMgYmV0dGVyIHRoYW4geW91cnMiIHJhbnRzIGVsc2V3aGVyZS4gOy0pCgoK
QmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
