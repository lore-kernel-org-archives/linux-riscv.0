Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B35C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 21:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8W74Jillc2r5N5c/9I7Ax0EJTMc29xX/CRUCB1jTmc=; b=H9PbvCeO8ogfXx
	kyko79hliRhM+Kou/nXSVDDElODCm/X2MTT6sXC/9X3T7PmUHIYPIkZAakHxUdTCzmQ60av5NRNmX
	HrTGT4YHfmhEjOyOaLjGRvfkJ43yGlFNbxg0kNEqoV/hd9jsg/41xJ6SZ8lsYiMQVwgTQcFSXOF+I
	APgXLY7MZn6Ow+KrNTTh1Og7JvlKJ1K0fV1BQMEWaLz2H75zfxQ0s0eav3FWkP7hk6n+2LSxoIDa2
	Jj8VjQHtajvTNM3/wvedCgbDL5MFvR9dXEHlA7LZl64Y/Nn1PyKvmkuVCsXUJgbrG3g2p047GauyZ
	Xz/Y1FSnejoyuwEem3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS2Mq-00DHkg-0Q;
	Fri, 04 Aug 2023 21:29:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS2Mn-00DHkC-0t
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 21:29:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 772FA62117
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 21:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F53C433C8
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 21:29:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ekcIQgS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1691184583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZRppS8YYYNW1DE8vo/WJiSC8U8LsPa2fq+ydUpDAgY=;
	b=ekcIQgS12nhcFkjZnjbfT0aqzclNGHZ9MU6yqPy7AF6pF/7KdFJ4fhVgMQ+66cg1eY0duR
	WMMlc5x0Pa0PLKWNmMu+w8sfIPMseaAD8RtuO7h5KWtmQZVP7XpXA0LFQFOBCChrgd8w2a
	sQuq3PX6cIItcs/0OefMFS8BJvV5iBA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b48a1ac (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-riscv@lists.infradead.org>;
	Fri, 4 Aug 2023 21:29:42 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4475d891d0eso1700725137.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 14:29:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YytU/BSLGazR/re8PTFIqF9wTTJpv+nNDrPRQ0af4lsFaqHM/+D
	zJS2qtTVnEoEexhqIKCkJ3W3EL/DpRZW30CCwBg=
X-Google-Smtp-Source: AGHT+IF1lG6rudDFve1O2mJa7z8XRunBD2b3Mqo6itQxmnVkmiR9raxvXerIG+cbT/V6Met3UwtnpA6Xx463rV+8+9c=
X-Received: by 2002:a05:6102:374a:b0:447:5662:b9c3 with SMTP id
 u10-20020a056102374a00b004475662b9c3mr487830vst.13.1691184582248; Fri, 04 Aug
 2023 14:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230614013018.2168426-1-guoren@kernel.org> <20230614013018.2168426-2-guoren@kernel.org>
 <ZM1tGgcJg0silFaJ@zx2c4.com>
In-Reply-To: <ZM1tGgcJg0silFaJ@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 4 Aug 2023 23:28:17 +0200
X-Gmail-Original-Message-ID: <CAHmME9p3VoZco0+io6pZDnzKVdnP4vr4XWNaAPXGew+1RmfVig@mail.gmail.com>
Message-ID: <CAHmME9p3VoZco0+io6pZDnzKVdnP4vr4XWNaAPXGew+1RmfVig@mail.gmail.com>
Subject: Re: [PATCH -next V13 1/3] riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, bjorn@kernel.org, cleger@rivosinc.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_142949_398095_52DFD1D7 
X-CRM114-Status: GOOD (  19.05  )
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

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCAxMToyOOKAr1BNIEphc29uIEEuIERvbmVuZmVsZCA8SmFz
b25AengyYzQuY29tPiB3cm90ZToKPgo+IEhpIEd1bywKPgo+IE9uIFR1ZSwgSnVuIDEzLCAyMDIz
IGF0IDA5OjMwOjE2UE0gLTA0MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gRnJvbTog
R3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IEFkZCBpbmRlcGVuZGVu
dCBpcnEgc3RhY2tzIGZvciBwZXJjcHUgdG8gcHJldmVudCBrZXJuZWwgc3RhY2sgb3ZlcmZsb3dz
Lgo+ID4gSXQgaXMgYWxzbyBjb21wYXRpYmxlIHdpdGggVk1BUF9TVEFDSyBieSBhcmNoX2FsbG9j
X3ZtYXBfc3RhY2suCj4gPgo+ID4gVGVzdGVkLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtl
cm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+
IENjOiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4KPiBUaGlzIHBhdGNo
IGJyb2tlIHRoZSBXaXJlR3VhcmQgdGVzdCBzdWl0ZS4gSSd2ZSBhdHRhY2hlZCB0aGUgLmNvbmZp
Zwo+IGZpbGUgdGhhdCBpdCB1c2VzLiBJJ20gYWJsZSB0byBmaXggaXQgYnkgc2V0dGluZyBDT05G
SUdfRVhQRVJUPXkgYW5kCj4gQ09ORklHX0lSUV9TVEFDS1M9biB0byBlc3NlbnRpYWxseSByZXZl
cnNlIHRoZSBlZmZlY3Qgb2YgdGhpcyBwYXRjaC4gQnV0Cj4gSSdkIHJhdGhlciBub3QgZG8gdGhh
dC4KPgo+IEFueSBpZGVhIHdoYXQncyB1cD8KPgo+IFRoYW5rcywKPiBKYXNvbgoKQW5kLCBlcnIs
IEkgZ3Vlc3MgSSBmYWlsZWQgdG8gZGVzY3JpYmUgd2hhdCdzIGJyb2tlbiBleGFjdGx5LiBIZXJl
J3MKd2hhdCBoYXBwZW5zOgoKdGltZW91dCAtLWZvcmVncm91bmQgMjBtIHFlbXUtc3lzdGVtLXJp
c2N2NjQgXAogICAgICAgLW5vZGVmYXVsdHMgXAogICAgICAgLW5vZ3JhcGhpYyBcCiAgICAgICAt
c21wIDQgXAogICAgICAgLWNwdSBydjY0IC1tYWNoaW5lIHZpcnQgXAogICAgICAgLW0gMjU2TSBc
CiAgICAgICAtc2VyaWFsIHN0ZGlvIFwKICAgICAgIC1jaGFyZGV2CmZpbGUscGF0aD0vaG9tZS96
eDJjNC9Qcm9qZWN0cy93aXJlZ3VhcmQtbGludXgvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvd2ly
ZWd1YXJkL3FlbXUvYnVpbGQvcmlzY3Y2NC9yZXN1bHQsaWQ9cmVzdWx0ClwKICAgICAgIC1kZXZp
Y2UgdmlydGlvLXNlcmlhbC1kZXZpY2UgLWRldmljZSB2aXJ0c2VyaWFscG9ydCxjaGFyZGV2PXJl
c3VsdCBcCiAgICAgICAtbm8tcmVib290IFwKICAgICAgIC1tb25pdG9yIG5vbmUgXAogICAgICAg
LWtlcm5lbCAvaG9tZS96eDJjNC9Qcm9qZWN0cy93aXJlZ3VhcmQtbGludXgvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvd2lyZWd1YXJkL3FlbXUvYnVpbGQvcmlzY3Y2NC9rZXJuZWwvYXJjaC9yaXNj
di9ib290L0ltYWdlCgpPcGVuU0JJIHYxLjIKICBfX19fICAgICAgICAgICAgICAgICAgICBfX19f
XyBfX19fIF9fX19fCiAvIF9fIFwgICAgICAgICAgICAgICAgICAvIF9fX198ICBfIFxfICAgX3wK
fCB8ICB8IHxfIF9fICAgX19fIF8gX18gfCAoX19fIHwgfF8pIHx8IHwKfCB8ICB8IHwgJ18gXCAv
IF8gXCAnXyBcIFxfX18gXHwgIF8gPCB8IHwKfCB8X198IHwgfF8pIHwgIF9fLyB8IHwgfF9fX18p
IHwgfF8pIHx8IHxfCiBcX19fXy98IC5fXy8gXF9fX3xffCB8X3xfX19fXy98X19fXy9fX19fX3wK
ICAgICAgIHwgfAogICAgICAgfF98CgpQbGF0Zm9ybSBOYW1lICAgICAgICAgICAgIDogcmlzY3Yt
dmlydGlvLHFlbXUKUGxhdGZvcm0gRmVhdHVyZXMgICAgICAgICA6IG1lZGVsZWcKUGxhdGZvcm0g
SEFSVCBDb3VudCAgICAgICA6IDQKUGxhdGZvcm0gSVBJIERldmljZSAgICAgICA6IGFjbGludC1t
c3dpClBsYXRmb3JtIFRpbWVyIERldmljZSAgICAgOiBhY2xpbnQtbXRpbWVyIEAgMTAwMDAwMDBI
egpQbGF0Zm9ybSBDb25zb2xlIERldmljZSAgIDogdWFydDgyNTAKUGxhdGZvcm0gSFNNIERldmlj
ZSAgICAgICA6IC0tLQpQbGF0Zm9ybSBQTVUgRGV2aWNlICAgICAgIDogLS0tClBsYXRmb3JtIFJl
Ym9vdCBEZXZpY2UgICAgOiBzaWZpdmVfdGVzdApQbGF0Zm9ybSBTaHV0ZG93biBEZXZpY2UgIDog
c2lmaXZlX3Rlc3QKRmlybXdhcmUgQmFzZSAgICAgICAgICAgICA6IDB4ODAwMDAwMDAKRmlybXdh
cmUgU2l6ZSAgICAgICAgICAgICA6IDIzNiBLQgpSdW50aW1lIFNCSSBWZXJzaW9uICAgICAgIDog
MS4wCgpEb21haW4wIE5hbWUgICAgICAgICAgICAgIDogcm9vdApEb21haW4wIEJvb3QgSEFSVCAg
ICAgICAgIDogMApEb21haW4wIEhBUlRzICAgICAgICAgICAgIDogMCosMSosMiosMyoKRG9tYWlu
MCBSZWdpb24wMCAgICAgICAgICA6IDB4MDAwMDAwMDAwMjAwMDAwMC0weDAwMDAwMDAwMDIwMGZm
ZmYgKEkpCkRvbWFpbjAgUmVnaW9uMDEgICAgICAgICAgOiAweDAwMDAwMDAwODAwMDAwMDAtMHgw
MDAwMDAwMDgwMDNmZmZmICgpCkRvbWFpbjAgUmVnaW9uMDIgICAgICAgICAgOiAweDAwMDAwMDAw
MDAwMDAwMDAtMHhmZmZmZmZmZmZmZmZmZmZmIChSLFcsWCkKRG9tYWluMCBOZXh0IEFkZHJlc3Mg
ICAgICA6IDB4MDAwMDAwMDA4MDIwMDAwMApEb21haW4wIE5leHQgQXJnMSAgICAgICAgIDogMHgw
MDAwMDAwMDhmZTAwMDAwCkRvbWFpbjAgTmV4dCBNb2RlICAgICAgICAgOiBTLW1vZGUKRG9tYWlu
MCBTeXNSZXNldCAgICAgICAgICA6IHllcwoKQm9vdCBIQVJUIElEICAgICAgICAgICAgICA6IDAK
Qm9vdCBIQVJUIERvbWFpbiAgICAgICAgICA6IHJvb3QKQm9vdCBIQVJUIFByaXYgVmVyc2lvbiAg
ICA6IHYxLjEyCkJvb3QgSEFSVCBCYXNlIElTQSAgICAgICAgOiBydjY0aW1hZmRjaApCb290IEhB
UlQgSVNBIEV4dGVuc2lvbnMgIDogdGltZSxzc3RjCkJvb3QgSEFSVCBQTVAgQ291bnQgICAgICAg
OiAxNgpCb290IEhBUlQgUE1QIEdyYW51bGFyaXR5IDogNApCb290IEhBUlQgUE1QIEFkZHJlc3Mg
Qml0czogNTQKQm9vdCBIQVJUIE1IUE0gQ291bnQgICAgICA6IDE2CkJvb3QgSEFSVCBNSURFTEVH
ICAgICAgICAgOiAweDAwMDAwMDAwMDAwMDE2NjYKQm9vdCBIQVJUIE1FREVMRUcgICAgICAgICA6
IDB4MDAwMDAwMDAwMGYwYjUwOQpbdGVybWluYXRlcy9oYW5ncyBoZXJlXQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
