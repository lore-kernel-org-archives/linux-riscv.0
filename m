Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449ABC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zm4QL4kFhOSjt8gw/TzVaMa3N4P1pgYivSVBX9tiAl0=; b=rrcI8tPv3erd4B
	H7uCqc3vr7mp46hIgrO3QKJe7TdBGZy22AcOIRPU+KVDgxBlsEwaQ1LlNTyLr+FQ2RUC0xJ3y3ida
	FGl5iOvrnI8dGp7Cpw7uGAvZNGAC37HwRO7WKqDPSUJqmdfEXGxOXOq26SOR5HYoAixs/vl/Fwdy4
	BIvm/NYco+1tpcDcw1T1IiY0YyKHuSzH02/IZH47Ic1Je7j/7U61eLCbD7mRb+CEy+wMCXwVVxDHX
	12HwHIyjjTr88U4ry498gFA9vX81x0EGfNDJDDzUau4ibUTF55hTEhpYUkyKMR1wh/BV96W0ocqCd
	UGuFsfZ8Pn40KU2PTALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgyu-00000003hKl-3FE2;
	Wed, 05 Feb 2025 15:06:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgu0-00000003gcR-3j9Q
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 15:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9EDACA4375A
	for <linux-riscv@lists.infradead.org>; Wed,  5 Feb 2025 14:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2BCC4CEEF
	for <linux-riscv@lists.infradead.org>; Wed,  5 Feb 2025 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738767678;
	bh=jI6mFqZXpNqzB11L+dcLlQT43GiVzIhoAANt38o1ASM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TbbXK6NY8hjqEnQH5UquGwKLgA+RIycrPoiBQhU+HwKL9V3EKfKL5/5PaR5sIJ3Dl
	 3o8G2OVJlCaQvEWK+GUPpYR0sxlqiIkrv1tmLiwVgFNxPlhjU7akp0Bnv/ATz9ShlZ
	 k6Z60MQpJw3r1bXMWPMoSiMxgAafwAZ8AgClIhCGU1xFywFHEVGNHF4iryXfzRGC2I
	 A+/4fcaVYWEwG57CCPH8n+nhbONQkqOJtCwT00XaRc0AuDPlgWZ3SnZR2a5yQU7HrR
	 zzE2+4hAccmejDoGvBCQUtkaUabuzDGGD16ShoMr2II515Wkad51XadKu3raxDLnU1
	 1zhSQNrAudvxw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30761be8fa7so67143711fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 07:01:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbj+OAuNiWf8kiE0dnZ1bMnZHrbcM/TvMk+NTNZe7csrBYt5U5BJ8/U5ktd0UAFibv652qWN0NazjsNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YylW52VGzcpTOn/Kht452fyOE0HeJlotlvHVNYS8kDf4ytJZI3k
	ZMDCMjsE8M7uwXL2+Qqs99+WJBhfqh/CQ2YGxfSnHjiTlvUT1yyK/DRJ7gU10kSPfeLb9L6r78T
	au7EnzcijMMtaYNRiEGYsCqNe9t8=
X-Google-Smtp-Source: AGHT+IHBb3ZeLGy1cAwth78pTANNFx2IuQ0g1ShCCMr1SOasPwPJY8/Avdj1h8ZJ4TvLE0Z8RjKtTm/R4F0rwync+j4=
X-Received: by 2002:a05:651c:154f:b0:300:33b1:f0e7 with SMTP id
 38308e7fff4ca-307cf31470cmr12662021fa.10.1738767677437; Wed, 05 Feb 2025
 07:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162> <Z5xzkwwZAWRRLCdj@ghost> <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
 <Z51BpVEkmVCg7gTX@ghost> <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>
 <Z6JcgeDmt63MupyW@ghost>
In-Reply-To: <Z6JcgeDmt63MupyW@ghost>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 Feb 2025 00:00:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS5RVtm078rLFJNxQwPf+1VH+zf12dQJ1Xh-Wc4_qFGTw@mail.gmail.com>
X-Gm-Features: AWEUYZmvR9oI4SL8wPTQkoUvSwnAMEleZny79O5YuUFBaIkgVaSJ3j7KI_kBm2s
Message-ID: <CAK7LNAS5RVtm078rLFJNxQwPf+1VH+zf12dQJ1Xh-Wc4_qFGTw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_070121_055990_37BFC984 
X-CRM114-Status: GOOD (  38.30  )
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

T24gV2VkLCBGZWIgNSwgMjAyNSBhdCAzOjI54oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEZlYiAwNCwgMjAyNSBhdCAwMTowNDoy
NlBNICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4gPiBPbiBTYXQsIEZlYiAxLCAyMDI1
IGF0IDY6MzPigK9BTSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gU2F0LCBGZWIgMDEsIDIwMjUgYXQgMTI6MTA6MDJBTSArMDkwMCwg
TWFzYWhpcm8gWWFtYWRhIHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgSmFuIDMxLCAyMDI1IGF0IDM6
NTTigK9QTSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBPbiBUaHUsIEphbiAzMCwgMjAyNSBhdCAwODo1Mjo0NVBNIC0wNzAw
LCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+ID4gPiA+ID4gT24gV2VkLCBKYW4gMjIsIDIw
MjUgYXQgMDc6MTc6MjZQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gPiA+ID4g
PiA+IE9uIHJpc2N2LCBrZXJuZWwgbW9kdWxlcyBlbmQgdXAgd2l0aCBhIHNpZ25pZmljYW50IG51
bWJlciBvZiBsb2NhbAo+ID4gPiA+ID4gPiA+IHN5bWJvbHMuIFRoaXMgYmVjb21lcyBhcHBhcmVu
dCB3aGVuIGNvbXBpbGluZyBtb2R1bGVzIHdpdGggZGVidWcgc3ltYm9scwo+ID4gPiA+ID4gPiA+
IGVuYWJsZWQuIFVzaW5nIGFtZGdwdS5rbyBhcyBhbiBleGFtcGxlIG9mIGEgbGFyZ2UgbW9kdWxl
LCBvbiByaXNjdiB0aGUKPiA+ID4gPiA+ID4gPiBzaXplIGlzIDc1NE1CIChubyBzdHJpcHBpbmcp
LCA1M01CICgtLXN0cmlwLWRlYnVnKSwgYW5kIDIxTUIKPiA+ID4gPiA+ID4gPiAoLS1zdHJpcC11
bm5lZWRlZCkuIE9OIHg4NiwgYW1kZ3B1LmtvIGlzIDQ4Mk1CIChubyBzdHJpcHBpbmcpLCAyMU1C
Cj4gPiA+ID4gPiA+ID4gKC0tc3RyaXAtZGVidWcpLCBhbmQgMjBNQiAoLS1zdHJpcC11bm5lZWRl
ZCkuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBVc2UgLS1zdHJpcC11bm5lZWRlZCBpbnN0
ZWFkIG9mIC0tc3RyaXAtZGVidWcgdG8gc3RyaXAgbW9kdWxlcyBzbwo+ID4gPiA+ID4gPiA+IGRl
Y3JlYXNlIHRoZSBzaXplIG9mIHRoZSByZXN1bHRpbmcgbW9kdWxlcy4gVGhpcyBpcyBwYXJ0aWN1
bGFybHkKPiA+ID4gPiA+ID4gPiByZWxldmFudCBmb3IgcmlzY3YsIGJ1dCBhbHNvIG1hcmdpbmFs
bHkgYWlkcyBvdGhlciBhcmNoaXRlY3R1cmVzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gSXMgdGhlcmUgYW55IHNvcnQgb2YgcmVncmVzc2lvbiByaXNr
IHdpdGggdGhpcyBwYXRjaD8gSWYgc28sIGFub3RoZXIKPiA+ID4gPiA+ID4gb3B0aW9uIG1heSBi
ZSB0byBnaXZlIGFub3RoZXIgbGV2ZWwgdG8gSU5TVEFMTF9NT0RfU1RSSVAgbGlrZSAyIHNvIHRo
YXQKPiA+ID4gPiA+ID4gSU5TVEFMTF9NT0RfU1RSSVA9MSBjb250aW51ZXMgdG8gYmVoYXZlIGFz
IGJlZm9yZSBidXQgcGVvcGxlIGNhbiBlYXNpbHkKPiA+ID4gPiA+ID4gb3B0IGludG8gdGhpcyBv
cHRpb24uIE5vIHN0cm9uZyBvcGluaW9uIGJlY2F1c2UgSSBhbSBub3Qgc3VyZSBidXQgd2FzCj4g
PiA+ID4gPiA+IG5vdCBzdXJlIGlmIGl0IHdhcyBjb25zaWRlcmVkLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IEkgZG8gbm90IGJlbGlldmUgdGhpcyB3b3VsZCBjYXVzZSByZWdyZXNzaW9ucy4gVGhlIGRl
c2NyaXB0aW9uIG9uIGdudQo+ID4gPiA+ID4gc3RyaXAgaXM6Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
IlJlbW92ZSBhbGwgc3ltYm9scyB0aGF0IGFyZSBub3QgbmVlZGVkIGZvciByZWxvY2F0aW9uIHBy
b2Nlc3NpbmcgaW4KPiA+ID4gPiA+IGFkZGl0aW9uIHRvIGRlYnVnZ2luZyBzeW1ib2xzIGFuZCBz
ZWN0aW9ucyBzdHJpcHBlZCBieSAtLXN0cmlwLWRlYnVnLiIKPiA+ID4gPiA+Cj4gPiA+ID4gPiBU
aGUgZGVzY3JpcHRpb24gb24gbGx2bS1zdHJpcCBpczoKPiA+ID4gPiA+Cj4gPiA+ID4gPiAiUmVt
b3ZlIGZyb20gdGhlIG91dHB1dCBhbGwgbG9jYWwgb3IgdW5kZWZpbmVkIHN5bWJvbHMgdGhhdCBh
cmUgbm90Cj4gPiA+ID4gPiByZXF1aXJlZCBieSByZWxvY2F0aW9ucy4gQWxzbyByZW1vdmUgYWxs
IGRlYnVnIHNlY3Rpb25zLiIKPiA+ID4gPiA+Cj4gPiA+ID4gPiBnbnUgc3RyaXAgLS1zdHJpcC11
bm5lZWRlZCBzdHJpcHMgc2xpZ2h0bHkgbW9yZSBhZ2dyZXNzaXZlbHkgYnV0IGl0IGRvZXMKPiA+
ID4gPiA+IG5vdCBhcHBlYXIgdGhpcyBjYXVzZXMgYW55IGlzc3Vlcy4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IFJlZ2FyZGxlc3M6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFJl
dmlld2VkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gVGhhbmtzIQo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gSXQg
aXMgdHJ1ZSAtLXN0cmlwLXVubmVlZGVkIGRyb3BzIGEgbG90IG9mIGNvbXBpbGVyLWdlbmVyYXRl
ZCBzeW1ib2xzLCBidXQKPiA+ID4gPiBpdCBhbHNvIGRyb3BzIHJlYWwgc3ltYm9scyB0aGF0IG9y
aWdpbmF0ZSBpbiB0aGUgc291cmNlIGNvZGUuCj4gPiA+ID4KPiA+ID4gPiBTbywgdGhpcyB3b3Vs
ZCBnaXZlIHVzZXItdmlzaWJsZSBjaGFuZ2VzIGZvciBrYWxsc3ltcyBhdCBsZWFzdC4KPiA+ID4K
PiA+ID4gQWRkaW5nIElOU1RBTExfTU9EX1NUUklQPSItLXN0cmlwLXVubmVlZGVkIiB3b3VsZCBi
ZSBzdWZmaWNpZW50IGZvcgo+ID4gPiByaXNjdi4gSG93ZXZlciwgdGhpcyBoYXMgdGhlIGRvd25z
aWRlIHRoYXQgcmlzY3Ygd2lsbCByZXF1aXJlIGRpZmZlcmVudAo+ID4gPiBmbGFncyB0aGFuIG90
aGVyIGFyY2hpdGVjdHVyZXMgdG8gZ2V0IHJlYXNvbmFibHkgc2l6ZWQgbW9kdWxlcy4KPiA+Cj4g
PiBZb3UgY2FuIHVzZSBJTlNUQUxMX01PRF9TVFJJUD0tLXN0cmlwLXVubmVlZGVkIGZvciBhbGwg
YXJjaGl0ZWN0dXJlIGlmIHlvdSBsaWtlLgo+ID4KPiA+IEkgYXNzdW1lIHRoaXMgaXMgYSByaXNj
diBpc3N1ZS4gU3BlY2lmaWNhbGx5LCByaXNjdiBnY2MuCj4gPiBXaXRoIExMVk09MSwgSSBzZWUg
bXVjaCBzbWFsbGVyIHJpc2N2IG1vZHVsZXMgdXNpbmcgSU5TVEFMTF9NT0RfU1RSSVA9MS4KPiA+
Cj4gPiAtLXN0cmlwLXVubmVlZGVkIGlzIG5lZWRsZXNzbHkgYWdncmVzc2l2ZSBmb3Igb3RoZXIg
YXJjaGl0ZWN0dXJlcywKPiA+IGFuZCBJIGRvIG5vdCBzZWUgYSBnb29kIHJlYXNvbiB0byBjaGFu
Z2UgdGhlIGRlZmF1bHQuCj4KPiBZZXMgaXQgaXMgcHJpbWFyaWx5IGFuIGlzc3VlIHdpdGggcmlz
Y3YgR0NDLiBJIHdhcyBob3BpbmcgZm9yIHNvbWV0aGluZwo+IG1vcmUgc3RhbmRhcmRpemVkIHNv
IHRoYXQgb3RoZXIgcGVvcGxlIHVzaW5nIHJpc2N2IEdDQyB3b3VsZG4ndAo+IGVuY291bnRlciB0
aGlzLiBXb3VsZCBpdCBiZSByZWFzb25hYmxlIHRvIGFkZCB0aGlzIGZsYWcgYnkgZGVmYXVsdCBv
bmx5Cj4gZm9yIHRoZSByaXNjdiBhcmNoaXRlY3R1cmUsIG9yIGRvIHlvdSB0aGluayBpdCdzIGp1
c3QgYmV0dGVyIHRvIGxlYXZlIGl0Cj4gdXAgdG8gdGhlIHVzZXIncyBjaG9pY2U/CgpUaGUgbGF0
dGVyLgoKSU5TVEFMTF9NT0RfU1RSSVA9MSBwYXNzZXMgLS1zdHJpcC1kZWJ1Zy4KVGhpcyBpcyBj
bGVhcmx5IGRvY3VtZW50ZWQgaW4gRG9jdW1lbnRhdGlvbi9rYnVpbGQvbWFrZWZpbGVzLnJzdAph
bmQgaXQgaGFzIHdvcmtlZCBsaWtlIHRoYXQgZm9yIG1hbnkgeWVhcnMsIHdpdGggbm8gZXhjZXB0
aW9uLgoKSWYgdXNlcnMgd2FudCBpdCB0byB3b3JrIGRpZmZlcmVudGx5LCB0aGUgZmxleGliaWxp
dHkgaXMgYWxyZWFkeSB0aGVyZS4KCklmIElOU1RBTExfTU9EX1NUUklQPTEgd29ya2VkIGRpZmZl
cmVudGx5LCBzaWxlbnRseSBvbmx5IGZvciByaXNjdiwKSSB3b3VsZCByZWdhcmQgaXQgYXMgaW5z
YW5lIGJlaGF2aW9yLgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
