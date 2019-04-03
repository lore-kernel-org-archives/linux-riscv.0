Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4708AC10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 09:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F4E20830
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 09:58:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AnxFMgpu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uBhtTYra"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F4E20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2pcDzbV4j9P1cEBUOv1JRIR8s8Dw9edJKPL4eFoUH8=; b=AnxFMgpuD7cm+M
	aghTwfTumpAd0U7yWPkmAixkbQs68/bQYqOzkwh13RIiysLwlz01w+tXGPnpSc/JCdEpxXBGYK3B8
	3rKzqKsjlIDw0fC+9AR1QjfxNKLOsZtff6sjebScOPsCjdNzb55f4T1o34kgNU1G8QHtiiNCRmRUH
	AX88753cpxX/EOqIm0bfl07tbpR7l6ThvpwPod+q6891W8ZSlcKD/Cu6ONhLx44JBt17dM7jALjq3
	vfh1VCr06TyV/AiCT92M9XwZC+R26fauKbgAyBoYC8ofQn1WiMXMFA+9ubckaGW9Ar0ebvTBUQUIv
	RKjPL3X7Cwa5NQ8yrM6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBcfN-00060c-VU; Wed, 03 Apr 2019 09:58:45 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBcfL-0005pq-37
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 09:58:44 +0000
Received: by mail-ed1-x544.google.com with SMTP id x14so14338545eds.1
 for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2019 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2CalOlNQiGx8b43xIZ470xPMzFYaMKE+KhTiKUWQC5k=;
 b=uBhtTYra9kfPKro/gfrnTKrANPNJ9LkNIPLgZSOkGzynZrTelWPgXVO9gN4DUfgvXE
 xPeJaqMO3yBaMYyWmlyIDByJyx8lyfoDmkjA853zNIEJNCX1sj2xGVSuHk6EmrNrSPqo
 MDP1HSGtA94SCRjPUVStOVUgnoxA1adGM89ajZVjfcbnxmGiyzp5BzT369fxMSM4yvu7
 M67dfdgRFdx1+GDoLkZ2edDjoDcPXO45vIXGn+tV/S/AShYBP+fE6HXxKDwdug22HaRs
 bVAnFn3FeL7Sy6gR/7CDgpZjQQrGdCYyG5NsW3fkPV8zPQpum9gOUmok9/szWHsg80aJ
 /c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2CalOlNQiGx8b43xIZ470xPMzFYaMKE+KhTiKUWQC5k=;
 b=fQXkh8Q2rzGboCu38mULH8nYxQGNoMSzFSiHxmDaaGPqi4hHNRrDTSr2YhCpMHZp7L
 Q0YLCbT5GPAjZbpaPIzvLNZfQbacwotkBUWK8Rr+6gz8WHmI9ckjxhloF28H+dWV4X4I
 TSj0MdSIyLil6NbKod9zZGdemzTFDJWhxFl9PVkwLGOWijdo0B8k7BiDdiGIBrWmh6Ol
 y3Dt5wHQiJUSvJUC/OLWox5Ltw9EWXZ+reE3HZqPaJ+pz+Ry6x/rNOeTC2oyEIWVBm8z
 81SvgubHExJnvll4h/ouCj1YhyUhpJ5I0lk29XfmaTqun//iZvUJF2WNcDE/K7FBGTnT
 uR7A==
X-Gm-Message-State: APjAAAUAGtCf8m7njAZIVN1WZhyaZ06Rk5lTyXu83pY7IAhLimHpDYyR
 XKTegTkS8QSeaob/ioTmi7u9oZgp
X-Google-Smtp-Source: APXvYqxqfEzXKcHLd8z/SWSm3VWOEg6DDEYYCdimlAZPt4ysv/NB4/PWma/OjWNafqBFlUXffUuIQQ==
X-Received: by 2002:a17:906:259b:: with SMTP id
 m27mr43446884ejb.60.1554285521373; 
 Wed, 03 Apr 2019 02:58:41 -0700 (PDT)
Received: from aurora.visucore.com (92-110-144-95.cable.dynamic.v4.ziggo.nl.
 [92.110.144.95])
 by smtp.gmail.com with ESMTPSA id l26sm470038ejr.82.2019.04.03.02.58.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Apr 2019 02:58:40 -0700 (PDT)
Date: Wed, 3 Apr 2019 11:58:38 +0200
From: "Wladimir J. van der Laan" <laanwj@gmail.com>
To: Alan Kao <alankao@andestech.com>
Subject: Re: Perf counters on SiFive FU540-C000
Message-ID: <20190403095838.wganlywnxphv53na@aurora.visucore.com>
References: <20190331143732.7n4b5llrkxs5nbvm@aurora.visucore.com>
 <mhng-0cd5a4db-2499-4830-a4bf-656275714836@palmer-si-x1c4>
 <20190403010426.GA4033@andestech.com>
 <20190403084237.qygtfnefppdr3vtj@aurora.visucore.com>
 <20190403092758.GA26612@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190403092758.GA26612@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_025843_163270_33B36144 
X-CRM114-Status: GOOD (  26.28  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 nickhu@andestech.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gQWxhbiwKCk9uIFdlZCwgQXByIDAzLCAyMDE5IGF0IDA1OjI3OjU4UE0gKzA4MDAsIEFs
YW4gS2FvIHdyb3RlOgoKPiA+ID4gPiA+SSBmb3VuZCBzb21lIGRvY3VtZW50YXRpb24gYWJvdXQg
cGxhdGZvcm0gc3BlY2ZpYyBjb3VudGVycyBpbiBEb2N1bWVudGF0aW9uL3Jpc2N2L3BtdS50eHQs
Cj4gPiA+ID4gPmhvcGVmdWxseSB0aGlzIGlzIGVub3VnaCB0byBnZXQgbWUgc3RhcnRlZC4KPiA+
ID4gPiA+KElmIHNvbWVvbmUgc3RhcnRlZCB3b3JrIG9uIHRoaXMsIHBsZWFzZSBsZXQgbWUga25v
dykKPiA+ID4gPiAKPiA+ID4gPiBTb21lb25lIGZyb20gQW5kZXMgaGFkIHBhdGNoZXMgb3V0IHRv
IGFkZCBzdXBwb3J0IGZvciB0aGVpciBwZXJmb3JtYW5jZQo+ID4gPiA+IGNvdW50ZXJzIGEgd2hp
bGUgYWdvLiAgVGhlIGlzc3VlIHRoZXJlIHdhcyB0aGF0IHRoZSBwZXJmb3JtYW5jZSBjb3VudGVy
Cj4gPiA+ID4gaW1wbGVtZW50YXRpb24gd2FzIGNob3NlbiBhdCBjb21waWxlIHRpbWUsIGJ1dCBp
dCBzaG91bGQgcmVhbGx5IGJlIGRldGVjdGVkCj4gPiA+ID4gYXQgcnVuIHRpbWUgdmlhIHNvbWUg
cGxhdGZvcm0tc3BlY2lmaWMgbWVjaGFuaXNtIChpZSwgZGV2aWNlIHRyZWUpLgo+ID4gPiAKPiA+
ID4gUE1VIGRldGVjdGlvbiB3YXMgb25lIG9mIHRoZSBwcm9ibGVtcywgYW5kIHNob3VsZCBoYXZl
IGJlZW4gc29sdmVkIGluIHByZXZpb3VzCj4gPiA+IHBhdGNoZXMuICBGb3IgdGhlIHJlc3Qgb2Yg
dGhlIHByb2JsZW1zLCBEb2N1bWVudGF0aW9uL3Jpc2N2L3BtdS50eHQgc2hvdWxkCj4gPiA+IHNl
cnZlIGFzIGEgZ29vZCBndWlkZS4KPiA+IAo+ID4gTG9va2luZyBhdCB0aGUgZGV2aWNlIHRyZWUg
KGZvciAnc2lmaXZlLGZ1NTQwZycgY29tcGF0aWJpbGl0eT8pIHNlZW1zLCB0byBtZSwKPiA+IHRv
IGJlIHRoZSByaWdodCBhbnN3ZXIgaGVyZS4KPiAKPiBJZGVhbGx5IHRoZXJlIHNob3VsZCBiZSBh
IFBNVSBub2RlIGluIHRoZSBEVFMuICBJIGRvbid0IGhhdmUgdGhlIERUUyBmb3IgRlU1NDAKPiBz
byB5b3UgaGF2ZSB0byBjaGVjayBpZiBzb21ldGhpbmcgYWxpa2UgZXhpc3RzLgoKSSB0aGluayB0
aGlzIGlzIHRoZSBEVFMgZW1iZWRkZWQgaW50byBGU0JMIG9mIHRoZSBTaUZpdmUgVW5sZWFzaGVk
IGJvYXJkCihoYXZlbid0IGNyb3NzLWNoZWNrZWQgd2l0aCBtaW5lKToKaHR0cHM6Ly9naXRodWIu
Y29tL3Jpc2N2L3Jpc2N2LWRldmljZS10cmVlLWRvYy9ibG9iL21hc3Rlci9leGFtcGxlcy9zaWZp
dmUtaGlmaXZlX3VubGVhc2hlZC1taWNyb3NlbWkuZHRzCgpDYW5ub3QgZmluZCBhbnl0aGluZyBh
Ym91dCBhIFBNVSwgYnV0IGFsc28gZG9uJ3QgaGF2ZSBhIGdyYXNwIG9mIGhvdyBzb21ldGhpbmcK
bGlrZSB0aGlzIChwYXJ0IG9mIENQVSByZWdpc3RlcnMsIGJ1dCByZWFsbHkgcGFydCBvZiB0aGUg
cGxhdGZvcm0pIHdvdWxkIGV2ZW4KYmUgZGVzY3JpYmVkLgoKPiA+IEl0J2QgYmUgcG9zc2libGUg
dG8gcmVhbGx5LWRldGVjdCBieSBjb25maWd1cmluZyBhIHNwZWNpZmljIGV2ZW50IHR5cGUgdGhl
bgo+ID4gcnVubmluZyB0aGF0IGluc3RydWN0aW9uIGFuZCBsb29raW5nIGF0IHRoZSBjb3VudGVy
cywgYnV0IHRoYXQgc2VlbXMKPiA+IHVubmVjZXNzYXJ5Lgo+ID4gCj4gCj4gU3VyZS4gIGJlbGVp
dmluZy1yZWFkaW5nLXBhcnNpbmcgdGhlIERUUyB5b3UgZ290IGlzIHRoZSBub3JtLgoKT0ssIGdv
b2QuCgo+ID4gPiA+IEFzaWRlIGZyb20gdGhhdCBJIHRoaW5rIHRoZSBvbmx5IGlzc3VlIHdhcyBo
b3cgdG8gZXhwb3NlIHRoZXNlIHRvIHVzZXJzcGFjZQo+ID4gPiA+IGluIGEgc2FuZSBmYXNoaW9u
LCB3aGljaCBpcyBzb21ldGhpbmcgSSB0aG91Z2h0IHdvdWxkIGJlIHF1aXRlIHRyaWNreS4gIElJ
UkMKPiA+ID4gPiBzb21lb25lIG1hbmFnZWQgdG8gY29udmluY2UgbWUgdGhhdCB0aGVyZSB3YXMg
YSByZWFsbHkgc2ltcGxlIHNjaGVtZSBmb3IKPiA+ID4gPiBkb2luZyB0aGlzLCBidXQgSSBkb24n
dCByZW1lbWJlciB3aGF0IGl0IHdhcy4KPiA+ID4gCj4gPiA+IFRoZSBjb3JyZXNwb25kaW5nIHVz
ZXJzcGFjZSB0b29sIGlzIGluIHRvb2xzL3BlcmYuICBPbmNlIG9uZSBmaW5pc2hlcyB0aGUga2Vy
bmVsCj4gPiA+IHBhcnQsIHRoZSB3b3JrIGxlZnQgZm9yIHVzZXJzcGFjZSBwZXJmIHdpbGwgYmUg
dGhlIHN5bWJvbGl6YXRpb24gb2YgUE1VIHJhdwo+ID4gPiBldmVudHMuICBUaGUgcHJlbGltaW5h
cnkgcGF0Y2ggc3VwcG9ydHMgY29tbW9uIGNvdW50ZXJzIG9ubHksIHNvIEkgYmVsaWV2ZSB0aGlz
Cj4gPiA+IHdpbGwgYmUgdGhlIGZpcnN0IHBsYXRmb3JtLXNwZWNpZmljIFBNVSBpbiBSSVNDLVYu
Cj4gPiAKPiA+IFJpZ2h0LXRoZSB1c2VyLXNwYWNlIGludGVyZmFjZSB3b3VsZCBiZSAncGVyZics
IHRoZSBpZGVhIHdvdWxkIGJlIHRvIG1ha2UgdGhhdAo+ID4gd29yayBmb3IgYWxsIHRoZSBjb3Vu
dGVycyBzbyB0aGF0ICdwZXJmIHRvcCcgYW5kIHByb2ZpbGluZyB3b3JrIGZvciB0aGVtLgo+ID4g
Cj4gCj4gT29wcyAuLi4gY3VycmVudCBzcGVjIGdpdmVzIHlvdSBubyBpbnRlcnJ1cHQgd2hlbiBh
IGNvdW50ZXIgb3ZlcmZsb3dzLCBzbwo+IGJhc2ljYWxseSB5b3UgY2Fubm90IGRvIHRoZSBwcm9m
aWxpbmcgYnkgcGVyZiBldmVuIGlmIHlvdSBmaW5pc2ggdGhlIGV2ZW50Cj4gbWFwcGluZy4gIFRo
ZSBiZXN0IHlvdSBjYW4gZ2V0IGlzICJwZXJmIHN0YXQiIHRvIHdvcmsuCgpJIGRvbid0IGdyYXNw
IHdoeSB0aGUgaW50ZXJydXB0cyBhcmUgc28gaW1wb3J0YW504oCUYXJlbid0IHRoZSA2NC1iaXQg
Y291bnRlcnMsCmV2ZW4gaWYgdGhleSB0cmlnZ2VyIGV2ZXJ5IGN5Y2xlLCB1bmxpa2VseSB0byBv
dmVyZmxvdyB3aXRoaW4gdGhlIGVudGlyZQpsaWZlc3BhbiBvZiB0aGUgaGFyZHdhcmU/IChhbmQg
dGhhdCBlZGdlIGNhc2UgaXQgY291bGQgZXZlbiBiZSBkZXRlY3RlZCBieQpoYXZpbmcgdGhlIG5l
dyB2YWx1ZSBiZSBzbWFsbGVyIHRoYW4gdGhlIG9sZCBvbmUpCgo+ID4gU28gaXQgc2VlbXMgdG8g
bWUgdGhhdCBvbiB0aGUga2VybmVsIHNpZGUsIGFwYXJ0IGZyb20gdGhlIHNldHVwIGFuZCBhbGxv
Y2F0aW9uCj4gPiBsb2dpYywgdGhhdCB0aGVzZSBwbGF0Zm9ybS1zcGVjaWZpYyBjb3VudGVycyBj
YW4gYmUgaGFuZGxlZCBpbiB0aGUgc2FtZSB3YXkgYXMKPiA+IGBtY3ljbGVgIGFuZCBgbWluc3Ry
ZXRgIGFyZSwgdGhleSdyZSBhbHNvIHNpbXBsZSBjb3VudGVycyB3aXRob3V0IG92ZXJydW4KPiA+
IG5vdGlmaWNhdGlvbiBsb2dpYyBvciBvdGhlciBmYW5jeSBmZWF0dXJlcy4KPiA+IAo+ID4gQWxz
byB3aXRoIHRoZSBzYW1lIGxpbWl0YXRpb24gdGhhdCB0aGV5IGNhbm5vdCBiZSB3cml0dGVuIHRv
IGZyb20gdGhlIGtlcm5lbAo+ID4gaW4gUy1tb2RlLCBzbyBuZWVkIHRvIGtlZXAgdHJhY2sgb2Yg
ZGVsdGFzLgo+ID4gCj4gPiBTcGVha2luZyBvZiB3aGljaCwgY2FuIHRoZSBrZXJuZWwgd3JpdGUg
dG8gdGhlIHNlbGVjdG9ycz8gT2ggY3JhcCBJIGd1ZXNzIG5vdC4KPiAKPiBVbmZvcnR1bmF0ZWx5
IHlvdSBhcmUgcmlnaHQuICBZb3UgaGF2ZSB0byBtYW51YWxseSBoYWNrIHNvbWUgU0JJcyBmb3Ig
d3JpdGluZwo+IGV2ZW50IG1hc2tzLgoKSGVoZS4gSGVyZSB3YXMgbWUgdGhpbmtpbmcgdGhpcyB3
b3VsZCBiZSBmYWlybHkgZWFzeSBhbmQgc3RyYWlnaHRmb3J3YXJkLCBidXQKYXBwYXJlbnRseSBJ
IHdvdWxkIG5lZWQgdG8gZ28gYWxsIHRoZSB3YXkgdXAgdGhlIHN0YWNrLiBJJ20gbm90IGV2ZW4g
dXNpbmcKT3BlblNCSSB5ZXQuCgpXbGFkaW1pcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
