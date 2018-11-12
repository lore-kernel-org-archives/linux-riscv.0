Return-Path: <SRS0=EHGE=NX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0180C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 02:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8F920871
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 02:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ebG6IJjE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JGGmAF7q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A8F920871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=tzdkRGsRErzXWZ9uzrw8n8JLgQC2t8VnMI6ZqW/90vg=; b=ebG6IJjEcvWVPq7jIY8TwXfaF
	CbB0zp/5FSgYfWvqK7vsSvIHbweluWlDQU2KooAt1eRrch2+HqRIwPyfunnPQy1bE0aX23bxmX7RL
	p6xzEXH0q80//a3j6h52RKVTaoypU+Rfd9Iq+WoFaTgQZxu+/hAdefiJbo43ZHq+kDiwQApucUjs7
	5KoEPaThFfZUtqRyZj9vVNwLu37o58l3iX8Y3TcVCKHKh8lmc3zwsTjtiK0CYAuSxOBihCZsFJgvQ
	cawvV24VYfHjPVMh/JbMt1O4+XjFmgiQDmYSRotmNy71m9pUniWE2LGl0BkQaEzv1L5EwlIvSDnfm
	LT8nZ9iIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gM1eg-0000mH-PG; Mon, 12 Nov 2018 02:08:46 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM1ed-0000lr-KB
 for linux-riscv@lists.infradead.org; Mon, 12 Nov 2018 02:08:45 +0000
Received: by mail-pl1-x635.google.com with SMTP id r3-v6so2778066pls.12
 for <linux-riscv@lists.infradead.org>; Sun, 11 Nov 2018 18:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dUWDkH8Yy+6Dzy2lBWM4mYsJRbSEUutFIwUosO8KvY8=;
 b=JGGmAF7qqw7w/qdJK74o8yBhsWnsP0tn11I/d41SO3+a/K3lCohjVV2i+Kh7oYQpjx
 5m2s2z2SIvqXEMNix5THPDeXN/BIA20hTs3pws9+3TIrqUnwByo85Uku/5TqomJq8p5E
 ckrnd4faspKexUMUTCreooHtNSwVsoz97qv1Py9IUlmRFZCzGzd0swuj39U95bsqqiiR
 jKJPfltoTZgVrPORGjpgvJw+A6eCg2Buoy/T3ZMC7NSU4Pj24oYgJO/Do1VPYU0acPJb
 vujJ1m78+90gq2bXDSEwqiUON0Wf3UF7fYxbcE35HsVUosZNz6wTh4+eKGQbEDjWg5r7
 wv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dUWDkH8Yy+6Dzy2lBWM4mYsJRbSEUutFIwUosO8KvY8=;
 b=dICs9LSdluXVnUI2/vYeWwOFxceX/yXalbiFnbyPZjG28VMnRh/4HHMS53OAc1jFmh
 jQF7pGcKZHDNzAhSCcMU2s6IvwCPHV/1dvDa5vFvKBlEvyv52VOoZFUXMiDv5QzpJhoj
 vwSxV70/+K0Ffs+98nMmtPLezmVGjJ8e8uMnPGfdpBvdaQbdG+4mLh2o9Ir3FzCkH2jc
 8Y/EE9cZj2L8Ogp4HpVXa7B/m7gGkyFVIAMmUNfFPINfBVbzuGyF5zQjcTyMxN7vYdNH
 czFGmhPPZ1Hgb+WjN6ZcCp0TwjWAJVQkZVlbQob19Mj75pw2kAqRRnLkrws76iriwpso
 QKTg==
X-Gm-Message-State: AGRZ1gK6wbd0+UVtIhzzQghKggijmxiwSsIZZkklZQzEXCdOlQMx5wsH
 aNEya1PNP7uanddYLI04gSXBUMZOFe8=
X-Google-Smtp-Source: AJdET5eReNlVyJ+Dz6lZQRVH0andzDgwtamDVvh/p0Tum1BEcDU2WzGenP9Raov12v+g0y6QTtE5AQ==
X-Received: by 2002:a17:902:bcc4:: with SMTP id
 o4-v6mr18309004pls.13.1541988512300; 
 Sun, 11 Nov 2018 18:08:32 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id o195-v6sm16518559pfg.112.2018.11.11.18.08.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Nov 2018 18:08:31 -0800 (PST)
Date: Sun, 11 Nov 2018 18:08:31 -0800 (PST)
X-Google-Original-Date: Sun, 11 Nov 2018 18:08:21 PST (-0800)
Subject: Re: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAPweEDwYRzuuZVvPrDbUcBxCLcpOoR4tfH=9dQDJuwu0Za=nRA@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: lkcl@lkcl.net
Message-ID: <mhng-2e75d6c3-ec0f-42db-be43-cdba1cf52248@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_180843_725381_B8647554 
X-CRM114-Status: GOOD (  32.72  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Christoph Hellwig <hch@infradead.org>,
 Damien.LeMoal@wdc.com, olof.johansson@gmail.com, alankao@andestech.com,
 abner.chang@hpe.com, atish.patra@wdc.com, anup@brainfault.org, agraf@suse.de,
 zong@andestech.com, Olof Johansson <olof@lixom.net>, rminnich@gmail.com,
 sw-dev@groups.riscv.org, Paul Walmsley <paul.walmsley@sifive.com>,
 mick@ics.forth.gr, Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181112020831.xpKHutI0Pa6eqa17iTgtIfdu1Xu9g5K8x3382SRI2G4@z>

T24gU2F0LCAxMCBOb3YgMjAxOCAyMzoxNDo0MCBQU1QgKC0wODAwKSwgbGtjbEBsa2NsLm5ldCB3
cm90ZToKPiAtLS0KPiBjcm93ZC1mdW5kZWQgZWNvLWNvbnNjaW91cyBoYXJkd2FyZTogaHR0cHM6
Ly93d3cuY3Jvd2RzdXBwbHkuY29tL2VvbWE2OAo+Cj4gT24gU3VuLCBOb3YgMTEsIDIwMTggYXQg
MzoxNSBBTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPiB3cm90ZToKPj4KPj4g
zqPPhM65z4IgMjAxOC0xMS0xMCAyMTozOSwgTHVrZSBLZW5uZXRoIENhc3NvbiBMZWlnaHRvbiDO
rc6zz4HOsc+IzrU6Cj4+ID4gLS0tCj4+ID4gY3Jvd2QtZnVuZGVkIGVjby1jb25zY2lvdXMgaGFy
ZHdhcmU6IGh0dHBzOi8vd3d3LmNyb3dkc3VwcGx5LmNvbS9lb21hNjgKPj4gPgo+PiA+IE9uIFNh
dCwgTm92IDEwLCAyMDE4IGF0IDU6NTkgUE0gTmljayBLb3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0
aC5ncj4KPj4gPiB3cm90ZToKPj4gPj4KPj4gPj4gzqPPhM65z4IgMjAxOC0xMS0xMCAxOTo0Nywg
THVrZSBLZW5uZXRoIENhc3NvbiBMZWlnaHRvbiDOrc6zz4HOsc+IzrU6Cj4+ID4+ID4gT24gU2F0
LCBOb3YgMTAsIDIwMTggYXQgNTo0MiBQTSBPbG9mIEpvaGFuc3NvbiA8b2xvZkBsaXhvbS5uZXQ+
IHdyb3RlOgo+PiA+PiA+Cj4+ID4+ID4+IFRoZSBjYXNlIG9mIGNvbnNvbGUgaXMgaW4gdGhpcyBj
YXNlIHByZXR0eSBzaW1wbGU6IEl0J3MgaW50ZW5kZWQgZm9yCj4+ID4+ID4+IGVhcmx5IGJvb3Qg
Zm9yIHZlcnkgc2ltcGxpc3RpYyBlbnZpcm9ubWVudHMgKGJlZm9yZSB0aGUgcmVzdCBvZiB0aGUK
Pj4gPj4gPj4ga2VybmVsIGlzIHVwLCBldGMpLiBLZWVwaW5nIHRoZSBTQkkgY29uc29sZSBhcm91
bmQgYmV5b25kIGVhcmx5IGJvb3QsCj4+ID4+ID4+IGFuZCBzb21laG93IHRyeWluZyB0byBvcHRp
bWl6ZSBmb3IgaXQgZm9yIHRob3NlIHVzZSBjYXNlcyBpcyBhCj4+ID4+ID4+IG1pc2RpcmVjdGVk
IGVmZm9ydDsgdGhhdCdzIHdoYXQgbmF0aXZlIGRyaXZlcnMgYXJlIGZvci4KPj4gPj4gPgo+PiA+
PiA+ICBzcGlrZSAod2hpY2ggaXMgb25seSBhcm91bmQgNywwMDAgbGluZXMgb2YgY29kZSkgZG9l
c24ndCBoYXZlIG5hdGl2ZQo+PiA+PiA+IGRyaXZlcnMsIGFuZCBxZW11IGlzIHRvbyBoZWF2eS1k
dXR5IHRvIGNvbnNpZGVyIGFkZGluZyBjdXN0b20KPj4gPj4gPiBleHRlbnNpb25zIGFuZCBleHBl
cmltZW50YWwgcmVzZWFyY2ggb250by4KPj4gPj4gPgo+PiA+PiA+ICB3aXRoIG5vdGhpbmcgaW4g
c3Bpa2UgKm90aGVyKiB0aGFuIHRoZSBzZXJpYWwgY29uc29sZSwgaXQncyB0aGUgb25seQo+PiA+
PiA+IHdheSBpbiBhbmQgb3V0Lgo+PiA+PiA+Cj4+ID4+ID4gIGwuCj4+ID4+Cj4+ID4+IEFueXRo
aW5nIG1vcmUgdGhhbiBhIG1haW4vZGVidWcgY29uc29sZSBpcyB0b28gbXVjaCBmb3IgdGhlIFNC
SSwgaXRzCj4+ID4+IGdvYWwgaXMgdG8gYmUgdXNlZCBlYXJseSBvbiBpbiB0aGUgYm9vdCBwcm9j
ZXNzIHVudGlsIHRoZSBPUyBvciB0aGUKPj4gPj4gYmFyZSBtZXRhbCBhcHAgdGFrZXMgY29udHJv
bC4KPj4gPgo+PiA+ICBub29vLCB0aGF0J3MganVzdCBfb25lXyB1c2UgdG8gd2hpY2ggaXQncyBi
ZWluZyBwdXQuCj4+ID4KPj4gPj4gSGF2aW5nIG11bHRpcGxlIHNlcmlhbCBsaW5lcyB0aHJvdWdo
Cj4+ID4+IHRoZSBTQkkgZm9yIHRoaW5ncyBsaWtlIFBQUCwgVVBTLCB2aXJ0dWFsIGNvbnNvbGVz
IGFuZCBhbGwgdGhlIHN0dWZmCj4+ID4+IHlvdSBtZW50aW9uZWQgaXMgb3V0IG9mIHNjb3BlLgo+
PiA+Cj4+ID4gIHdoeT8KPj4gPgo+Pgo+PiBCZWNhdXNlIHRoZSBmaXJtd2FyZSBpcyBtZWFudCB0
byBiZSBzb21ldGhpbmcgbWluaW1hbCwgbm90IHRvIHJlcGxhY2UKPj4gdGhlCj4+IE9TLiBMZXQg
bWUgYXNrIHlvdSB0aGlzLCBpZiB5b3Ugd2FudCB0byBjaGFuZ2UgVUFSVCBzcGVlZCBvciBzZXR0
aW5ncyBpbgo+PiBnZW5lcmFsIHdvdWxkIHlvdSBhbHNvIGFzayBmb3IgYW4gU0JJIGNhbGwgZm9y
IHRoYXQgPwo+Cj4gIG9mIGNvdXJzZSwgbm90LCBuaWNrLiAgaXQncyBhIHNpbXBsZSBjdXQvcGFz
dGUgb2YgdGhlIGV4aXN0aW5nCj4gY29uc29sZSBnZXRjaGFyL3B1dGNoYXIgY29kZS4gIHlvdSdy
ZSBiZWdpbm5pbmcgdG8gYWxhcm0gbWUgYnkgbWFraW5nCj4gdGhpcyBvdXQgdG8gYmUgbXVjaCBt
b3JlIGNvbXBsZXggdGhhbiBpdCBpcy4KPgo+ICBpZiBpJ2QgdGhvdWdodCBpdCB3YXMgYSBnb29k
IGlkZWEgdG8gcHJvcG9zZSBhbiBTQkkgY2FsbCB0byBjaGFuZ2UKPiBVQVJUIHNwZWVkIG9yIHNl
dHRpbmdzLCBpIHdvdWxkIGhhdmUgc2FpZCBzby4gIHRoZXJlJ3MgYWJzb2x1dGVseSBubwo+IG5l
ZWQgdG8gbWFrZSBpdCAqbG9vayogbGlrZSBpJ3ZlIHByb3Bvc2VkIHRoYXQuICBkb2luZyBzbyAt
IHB1dHRpbmcKPiB3b3JkcyBpbnRvIHNvbWVvbmUgZWxzZSdzIG1vdXRoIC0gaXMgdW5ldGhpY2Fs
LCBhbmQgaSdkIGFwcHJlY2lhdGUgaXQKPiBpZiB5b3UgY291bGQgc3RvcCBkb2luZyBpdC4KPgo+
Cj4+IFdoYXQncyBjb21pbmcgdXAgbmV4dCA/Cj4KPiAgbm90aGluZywgbmljay4gIGp1c3Qgb25l
IGV4dHJhIHBhcmFtZXRlciB0byB0aGUgY29uc29sZQo+IGdldGNoYXIvcHV0Y2hhciBmdW5jdGlv
biBbb3IgYSBkdXBsaWNhdGUgZnVuY3Rpb24gd2hpY2ggZG9lc10gdGhhdCdzCj4gYWxsLgo+Cj4+
IEFkZGluZyBuZXR3b3JraW5nIHN1cHBvcnQgZm9yIGV4YW1wbGUgPwo+Cj4gIG9mIGNvdXJzZSBu
b3QuICB3aHkgb24gZWFydGggd291bGQgdGhhdCBtYWtlIHNlbnNlPyAgaG93IG9uIGVhcnRoCj4g
d291bGQgbmV0d29ya2luZyBmaXQgaW50byBhIDE2ayBCb290IFJPTT8KPgo+ICBpIGZlZWwgdGhh
dCB5b3UncmUgYXJndWluZyBhbmQgdGhyb3dpbmcgdXAgc3RyYXctbWFuIHF1ZXN0aW9ucyBmb3IK
PiBhcmd1bWVudHMnIHNha2UsIGhlcmUsIGhvcGluZyB0aGF0IG9uZSBvZiB0aGVtIHdpbGwgc3Rp
Y2ssIGFuZCB0aGF0IGJ5Cj4gaWdub3JpbmcgdGhlIHBvc2l0aXZlIGFzcGVjdHMgb2YgdGhlIChp
bmNyZWRpYmx5IHNpbXBsZSkKPiBjdXQvcGFzdGUtc3R5bGUgbWluaW1hbGlzdCBwcm9wb3NhbCBh
bmQgdGhyb3dpbmcgYXMgbWFueSAiYmFkIiBvbmVzCj4gb3V0IHRoZXJlLCBpdCdsbCBzb21laG93
Li4gZG8uLiBpIGR1bm5vLCB3aGF0ICppcyogdGhlIHB1cnBvc2Ugb2YgdGhlCj4gcXVlc3Rpb25z
IHlvdSdyZSBhc2tpbmc/Cj4KPgo+PiBXaGVyZSBkbyB5b3UgcHV0IHRoZQo+PiBiYXJyaWVyCj4+
IG9uIGZpcm13YXJlJ3MgY29tcGxleGl0eSAvIHNjb3BlID8KPgo+ICBhdCB0aGUgZXhhY3Qgc2Ft
ZSBwb2ludCB0aGF0IHlvdSBkbywgdW5kZXIgdGhlIGNpcmN1bXN0YW5jZXMgYW5kCj4gY29udGV4
dCBpbiB3aGljaCB5b3UncmUgbG9va2luZyBhdCBhbmQgZnJvbS4KPgo+ICBub3csIGNhbiB5b3Ug
cmVjb2duaXNlIHRoYXQgdGhlcmUgYXJlICpvdGhlciogbmVlZHMgYW5kIHJlcXVpcmVtZW50cwo+
IGFzIHdlbGwsIGJleW9uZCB0aGUgb25lcyB0aGF0IHlvdSBoYXZlPwo+Cj4+IEJ5IHRoZSB3YXkg
c3Bpa2UgaXMgYW4gSVNBIHNpbXVsYXRvciwgSSBkb24ndCBzZWUgd2h5IGl0IHNob3VsZCBlbXVs
YXRlCj4+IFVBUlQgcG9ydHMsIGxhc3QgdGltZSBJIGNoZWNrZWQgaXQgZGlkbid0LAo+Cj4gIGFo
LCBuaWNrLCBpIGdldCB0aGUgZmVlbGluZyB5b3UncmUgZGVsaWJlcmF0ZWx5IGxvb2tpbmcgZm9y
IHdheXMgdG8KPiBiZSBvYnN0cnVjdGl2ZSwgYW5kIGFsc28gZnVuZGFtZW50YWxseSBtaXN1bmRl
cnN0YW5kaW5nIGhvdyB0aGUKPiBnZXRjaGFyIC8gcHV0Y2hhciBjb2RlIHdvcmtzLgo+Cj4gIHNw
aWtlIHByb3ZpZGVzIGEgbWluaW1hbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgU0JJLCB2aWEgbGli
ZmVzdnIuCj4gdGhlIGRhdGEgdGhhdCBnb2VzIHRvIHRoZSBnZXRjaGFyL3B1dGNoYXIgZnVuY3Rp
b24gaXMgdWx0aW1hdGVseQo+IHJlZGlyZWN0ZWQgdG8gYSBtaW5pbWFsaXN0IHN0ZGluIC8gc3Rk
b3V0IGltcGxlbWVudGF0aW9uLiAgdGhlcmUgKmlzKgo+IG5vIGNhbGwgdG8gVUFSVCBwb3J0cy4K
Pgo+ICBjb21lIG9uLCBtYW4sIGJlIGEgbGl0dGxlIGxlc3MgYWR2ZXJzYXJpYWw6IGl0IG1ha2Vz
IGxpZmUgZWFzaWVyIGZvciBldmVyeW9uZS4KPgo+Cj4+IHNvIHNvbWVvbmUgd2lsbCBuZWVkIHRv
IHdyaXRlCj4+IGNvZGUgZm9yIHRoYXQsIG1vcmUgbW9uZXkgIQo+Cj4gIGknbGwgaGFwcGlseSBk
byBpdCwgYXMgaSBuZWVkIGl0LiAgaXQncyBhIHN0cmFpZ2h0IGN1dC9wYXN0ZSBvZgo+IHByZS1l
eGlzdGluZyBjb2RlLgo+Cj4+IFlvdSBjYW4gdXNlIFFFTVUgZm9yIHRoYXQgd2hlcmUgeW91IGNh
biBoYXZlCj4+IGFzIG1hbnkgVUFSVHMgYXMgeW91IHdhbnQgYW5kIHRoZSBkcml2ZXJzIGZvciB0
aGVtIGFyZSBhbHJlYWR5IGF2YWlsYWJsZQo+PiBmb3IgeW91Lgo+Cj4gIGkgKmNhbid0Ki4gIHFl
bXUgaXMgdG9vIGNvbXBsZXggYW5kIGkndmUgaW52ZXN0ZWQgMiBtb250aHMgb2YKPiBwZXJzb25h
bCBtb25leSAtIHdpdGhvdXQgZnVuZGluZyBvciBncmFudHMgZnJvbSBhbnkgY29ycG9yYXRpb24g
b3IKPiBpbnN0aXR1dGlvbiAtIGludG8gc3Bpa2UsIHByZWNpc2VseSBiZWNhdXNlIGl0J3Mgb25s
eSA3LDAwMCBsaW5lcyBvZgo+IGNvZGUuCj4KPiAgbW9kaWZ5aW5nIHFlbXUgaXMgdG9vIG11Y2gu
ICBpJ3ZlIHNlZW4gc2lnbnMgdGhhdCB0aGV5J3JlIG1vdmluZyBpbnRvCj4gSklUIG9wdGltaXNh
dGlvbiB0ZXJyaXRvcnksIHdoaWNoIGlzIGZhciB0b28gY29tcGxleCB0byBnZXQgaW52b2x2ZWQK
PiB3aXRoLgo+Cj4gc3Bpa2UgaXMgc2ltcGxlLCBpdCdzIHN0cmFpZ2h0Zm9yd2FyZCwgaXQncyBm
YXN0LCBhbmQgaXQgd29ya3MuCj4KPgo+PiA+ICBpJ20gYW4gZXRoaWNhbCBsaWJyZSBkZXZlbG9w
ZXI6IGkgY2FuJ3QgZ28gZm9vdGluZyB0aGUgYmlsbCBmb3Igb3RoZXIKPj4gPiBwZW9wbGUgdG8g
c3BvbmdlIG9mZiBteSBlZmZvcnRzIGFsbCB0aGUgdGltZSwgaSd2ZSBoYWQgMjAgeWVhcnMgb2YK
Pj4gPiBwZW9wbGUgZG9pbmcgdGhhdCBhbmQgaSdtIGYqKioqKmcgd2VsbCBub3QgcHV0dGluZyB1
cCB3aXRoIGl0IG9uIHRoaXMKPj4gPiBwcm9qZWN0Lgo+PiA+Cj4+ID4gIHNvIG5vLCBtaWNrLCBz
b3JyeSwgbm90IGJ1eWluZyB0aGUgYXJndW1lbnQgIml0J3Mgb3BlbiBzb3VyY2UiLgo+PiA+Cj4+
ID4gbC4KPj4KPj4gRG9uJ3QgYXNzdW1lIHlvdSBhcmUgdGhlIG9ubHkgb25lLgo+Cj4gIGdvb2Qg
dG8gaGVhci4KPgo+IG5vdy4uLiBjYW4gaSBhc2sgeW91IGlmIHlvdSBjb3VsZCBwb3NzaWJseSB0
dXJuIGRvd24gdGhlIGFkdmVyc2FyaWFsCj4gc3RyYXctbWFuIHRoaW5nIGp1c3QgYSBsZWVlZXRs
ZSB0aW55IGJpdD8gIGl0IHRha2VzIGEgaHVnZSBhbW91bnQgb2YKPiBlZmZvcnQgb24geW91ciBw
YXJ0IHRvIG1haW50YWluLCBhbmQgbWFrZXMgaXQgcmVhbGx5IHJlYWxseSBkaWZmaWN1bHQKPiBm
b3IgZXZlcnlvbmUgdG8gaGF2ZSB0byByZWFkLCAibm8sIHRoYXQncyBub3QgcmlnaHQsIG5vLCB0
aGF0J3Mgbm90Cj4gdHJ1ZSBlaXRoZXIsIG5vLCBpIGRpZG4ndCBzYXkgdGhhdCBhdCBhbGwiIGFu
ZCBzbyBvbi4KPgo+IHdoYXQgZG8geW91IHRoaW5rPwoKTHVrZTogWW91IG1heSBiZSB1c2VkIHRv
IHBvc3Rpbmcgb24gdGhlIHN3LWRldiBhbmQgaXNhLWRldiBtYWlsaW5nIGxpc3RzIHdoZXJlIAp0
aGlzIGtpbmQgb2YgcG9zdCBhcHBlYXJzIHRvIGJlIGFjY2VwdGFibGUuICBJbiBjYXNlIHlvdSBk
aWRuJ3Qgbm90aWNlLCB5b3UndmUgCm5vdyBtYW5hZ2VkIHRvIGdldCBsaW51eC1yaXNjdiBvbiB5
b3VyIENDIGxpc3QuICBJJ3ZlIGFscmVhZHkgZHJvcHBlZCBhbGwgdGhlIApAcmlzY3Yub3JnIGxp
c3RzIGZyb20gbXkgaW5ib3ggYmVjYXVzZSB0aGV5J3JlIHdvcnRobGVzcywgYnV0IHdvcmsgYWN0
dWFsbHkgCmhhcHBlbnMgb24gbGludXgtcmlzY3YgYW5kIEknZCBsaWtlIGl0IHRvIGNvbnRpbnVl
IGJlaW5nIHVzZWZ1bC4KClBsZWFzZSBrZWVwIHRoZSBub2lzZSBkb3duLgoKVGhhbmtzIQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
