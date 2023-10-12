Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD4FCDB47E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmFrvtvM8JuW/pCb92zZyoVFQVxWM5aJXMnMmGVVq64=; b=Xybc6lA55Yt1ul
	eyYEgBt5QOlhTgWIqJbuqAIERabPmh0ieO5Y4Qy1nLfKtzZIMDugzU5yyR0rk/6Q7Fz1Uhku097pr
	3VYZY52mOm5wYi3SwCAdfXY8B9peELPPu3i1lO7BN18MikqSQ7+k5WAQLTfmcsyTeEy9DY+lWWcDj
	iiQ83hdv2BzwtgcNCCqFM7wxDusaAwAklgGDJ3CBrL5UsjgUImXIKJXyAe2m0t738qxku+0sAWkBy
	7g7Vfb1OOcUUIeoPUbPh0zoHZRuykTCW6dxaiRhehmrczJP8qkgD4IqRvvQauxjPeuLAyp0gmHE9J
	V0oEswal1EH7SnhMh0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyjC-001RMI-1X;
	Thu, 12 Oct 2023 16:40:02 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyj9-001RLL-1R
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 16:40:00 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1e9b6f39f9eso556305fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697128796; x=1697733596; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8qkbsJSpT2TRETnt50S/RzeKbde+NrItqgAZk1AZUU=;
        b=O4wHmkSCAkRleYFP5X8QDxhUvl3DUzgh5NMN4UauScCwgt5NiCWJMHyKGZudVND06N
         rQzqq7lO4Fy4QNRNLw2naxFcLpCkkWFzaZ+nmrrJOhwjHd8HSjF/zwStS/Vu7SeUDsON
         EUUxA+/OuvhVoxd1u6bmfm+cp6tSqUyTcjIpJcWNKhFDmEWEgMQm8+u5Data5fN+Z8mM
         OBn01VbSveK2apzGospH+4HqUSnK9QB2GjId2aMYMLuMR4AlNbc2yxr3KeOm81WeXU81
         qFJ8ME1di+Rjdy7vNqfUT7LPEAR0XCukbLp5vrlN6v0lFSLN59RcVZR2bWLQtC7Z77ZK
         n8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128796; x=1697733596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8qkbsJSpT2TRETnt50S/RzeKbde+NrItqgAZk1AZUU=;
        b=VFzp0c3IvIt0+zlVICDw/UoOJ8pmtkaZLvBqq78LCakvtAx3UJ0BhHxZ/G6Tj7hh95
         TgvWwXfVpG7mB3/iviv3EbyfCFWYPzVzzYESgXtpD8J7cgGnuWeqSpBiIE8yFCM33OTV
         wAL294c0bvBmsFzTTrAGdYdmsieVYwiIbmnP4mmJSIrXHpyeHQQz4ZkndcLlFS8TGRF6
         LUdA2rWwlbKiyiha61fmdpxGHl3RNDis9J5k0E6SjccsQH3CRs5t9+bPbB/KrmseaMA8
         2BmQ5Jg36EdY4ZL6TVAWBPnc7vOhqJ+CXmMKdBSMiB7pbutirF2OAVZSQRynhWUmMbwq
         NTuw==
X-Gm-Message-State: AOJu0YzSVpIWaGRYa0+2SdUenHAD6p79Jl1j36aP0Drh44X1X1aex3Jl
	aFxiItL0tpSwpdNY/pKopT4409+wIqnNsbaOqfFQpQ==
X-Google-Smtp-Source: AGHT+IHyIoe1BRcql8MZDxmWR45KVy+kv7CjZkI82dIqgKZxxTjGQ5ZOQyWQXSdOigp1FumuiDutCzxtQIQO1aH+gsw=
X-Received: by 2002:a05:6870:14d3:b0:1e1:372:1f4d with SMTP id
 l19-20020a05687014d300b001e103721f4dmr30193888oab.36.1697128796237; Thu, 12
 Oct 2023 09:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231012072148.7010-3-ajones@ventanamicro.com>
 <20231012072148.7010-4-ajones@ventanamicro.com> <20231012-powdery-demeanor-4d8dde576f24@spud>
 <20231012-pulverize-founding-f459336028a2@spud> <20231012-0cb15beef3128da9f3bd3299@orel>
In-Reply-To: <20231012-0cb15beef3128da9f3bd3299@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Oct 2023 22:09:44 +0530
Message-ID: <CAK9=C2VFi+jtNGo+dueXcG8iRW=r1z-c1P_8SRGAxaByW=8tuA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] riscv: sbi: Introduce system suspend support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com, 
	conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_093959_505359_7B35338B 
X-CRM114-Status: GOOD (  28.99  )
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

T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgOTozMeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMDI6MzI6
NDZQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMTIsIDIwMjMg
YXQgMDI6MzA6MDJQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBZbywKPiA+ID4K
PiA+ID4gT24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMDk6MjE6NTBBTSArMDIwMCwgQW5kcmV3IEpv
bmVzIHdyb3RlOgo+ID4gPiA+IFdoZW4gdGhlIFNVU1AgU0JJIGV4dGVuc2lvbiBpcyBwcmVzZW50
IGl0IGltcGxpZXMgdGhhdCB0aGUgc3RhbmRhcmQKPiA+ID4gPiAic3VzcGVuZCB0byBSQU0iIHR5
cGUgaXMgYXZhaWxhYmxlLiBXaXJlIGl0IHVwIHRvIHRoZSBnZW5lcmljCj4gPiA+ID4gcGxhdGZv
cm0gc3VzcGVuZCBzdXBwb3J0LCBhbHNvIGFwcGx5aW5nIHRoZSBhbHJlYWR5IHByZXNlbnQgc3Vw
cG9ydAo+ID4gPiA+IGZvciBub24tcmV0ZW50aXZlIENQVSBzdXNwZW5kLiBXaGVuIHRoZSBrZXJu
ZWwgaXMgYnVpbHQgd2l0aAo+ID4gPiA+IENPTkZJR19TVVNQRU5ELCBvbmUgY2FuIGRvICdlY2hv
IG1lbSA+IC9zeXMvcG93ZXIvc3RhdGUnIHRvIHN1c3BlbmQuCj4gPiA+ID4gUmVzdW1wdGlvbiB3
aWxsIG9jY3VyIHdoZW4gYSBwbGF0Zm9ybS1zcGVjaWZpYyB3YWtlLXVwIGV2ZW50IGFycml2ZXMu
Cj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPgo+ID4gPgo+ID4gPiA+ICtzdGF0aWMgaW50IF9faW5pdCBzYmlfc3lzdGVt
X3N1c3BlbmRfaW5pdCh2b2lkKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyBpZiAoIXNiaV9zcGVjX2lz
XzBfMSgpICYmIHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9TVVNQKSA+IDApIHsKPiA+ID4K
PiA+ID4gUmFuZG9tIHRob3VnaHQgSSBoYWQgcmVhZGluZyB0aGlzLCB3YXMgdGhhdCBpdCdsbCBi
ZSBwb3NzaWJsZSB0byBoYXZlIGEKPiA+ID4gZmlybXdhcmUgdGhhdCBpbXBsZW1lbnRzIFNCSSA8
IDIuMCB0aGF0IHByb3ZpZGVzIHRoZSBTVVNQIGV4dGVuc2lvbi4KPiA+ID4gRldJVywgSSBkb24n
dCB0aGluayB0aGF0IHRoYXQgaXMgcHJvYmxlbWF0aWMsIGJ1dCBtYXliZSBJIGFtIG1pc3NpbmcK
PiA+ID4gc29tZXRoaW5nIHRoYXQgd291bGQgbWFrZSBpdCBzby4KPiA+Cj4gPiBIbW0sIG5leHQg
cGF0Y2ggSSBsb29rIGF0IGlzIGZyb20gQW51cCdzIGRlYnVnIGNvbnNvbGUgc2VyaWVzLCBhbmQg
aGUKPiA+IGRvZXMgY2hlY2sgdGhhdCB0aGUgU0JJIGltcGxlbWVudGF0aW9uIGlzIGF0IGxlYXN0
IHZlcnNpb24gMi4wIGJlZm9yZQo+ID4gcHJvYmluZyBmb3IgdGhlIGV4dGVuc2lvbi4gV2Ugc2hv
dWxkIHByb2JhYmx5IGhhdmUgdGhlIHNhbWUgcG9saWN5Cj4gPiBldmVyeXdoZXJlLgo+Cj4gWWVh
aCwgdGhlIG1haW4gcmVhc29uIEkgd3JvdGUgaW4gdGhlIG90aGVyIHJlc3BvbnNlIHRoYXQgSSdk
IHByZWZlciBub3QKPiB0byBhbHdheXMgY2hlY2sgdmVyc2lvbiB3aGVuIHByb2JpbmcgaXMgYmVj
YXVzZSBpbiBtb3N0IChJIHRoaW5rIGFsbAo+IGV4Y2VwdCBQTVUpIGNhc2VzIGl0IHdvdWxkIG9u
bHkgcmVkdWNlIHRoZSBwbGF0Zm9ybXMgd2hlcmUgdGhlIGV4dGVuc2lvbgo+IGNhbiBiZSB1c2Vk
LCBidXQgd2l0aG91dCBhbnkgcmVhc29uIHRvIGRvIHNvLiBGb3IgZXhhbXBsZSwgcmlnaHQgbm93
IFFFTVUKPiBidW5kbGVzIGFuIE9wZW5TQkkgdjEuMy4xIGJpbmFyeSBhbmQgdGhhdCB2ZXJzaW9u
IHN1cHBvcnRzIGJvdGggU1VTUCBhbmQKPiBEQkNOLCBidXQsIGlmIHdlIHdlcmUgdG8gYWRkIFNC
SSAyLjAgY2hlY2tzIGluIExpbnV4IGZvciB0aG9zZSBleHRlbnNpb25zLAo+IHRoZW4gdXNlcnMg
d2lsbCBuZWVkIHRvIHVwZGF0ZSB0aGVpciBTQkkgaW1wbGVtZW50YXRpb25zIGluIG9yZGVyIHRv
IHVzZQo+IHRoZW0uIFdoaWxlIHJlcXVpcmluZyB1c2VycyB0byB1cGRhdGUgdGhlaXIgU0JJIGlt
cGxlbWVudGF0aW9ucyBtYWtlcwo+IHNlbnNlIGZvciBuZXcgZnVuY3Rpb25hbGl0eSBvciBmaXhl
cywgaXQgc2VlbXMgbGlrZSBhIGxvdCB0byBhc2sgZm9yIHRoZW0KPiB0byBqdXN0IGdldCBhIGJp
Z2dlciBudW1iZXIgaW4gdGhlaXIgdmVyc2lvbiBjaGVjay4KPgo+IChBbmQgdGhlbiB0aGVyZSdz
IGRvd25zdHJlYW0gU0JJIGltcGxlbWVudGF0aW9ucyB3aGljaCBtYXkgZW5kIHVwIGNoZXJyeQo+
IHBpY2tpbmcgZXh0ZW5zaW9ucywgc28gdGhlaXIgdmVyc2lvbiBudW1iZXJzIHdvdWxkIGJlIGhh
cmQgdG8gZGVmaW5lLikKPgo+IFNvIG15IHZvdGUgZm9yIExpbnV4IHBvbGljeSB3b3VsZCBiZSB0
byBvbmx5IGRvIHZlcnNpb24gY2hlY2tzIHdoZW4KPiBuZWNlc3NhcnkuIEFuZCBteSBwcmVmZXJl
bmNlIGZvciBTQkkgd291bGQgYmUgdG8gdHJ5IGFuZCBhdm9pZCBzcGVjaWZ5aW5nCj4gZXh0ZW5z
aW9ucyB3aGljaCByZXF1aXJlIGNsaWVudHMgdG8gY2hlY2sgdmVyc2lvbnMuCgpJbiBhZGRpdGlv
biB0byBTQkkgUE1VLCBldmVuIFNCSSBTVEEgYW5kIFNCSSBOQUNMIHJlcXVpcmVzIHNwZWMgdmVy
c2lvbgpjaGVjayBiZWNhdXNlIHRoZXNlIG5ldyBTQkkgZXh0ZW5zaW9ucyB1c2UgU0JJX0VSUl9O
T19TSE1FTQplcnJvciBjb2RlIHdoaWNoIGlzIG5vdCBhdmFpbGFibGUgaW4gU0JJIHYxLjAgKG9y
IGxvd2VyKS4KCk15IHJlY29tbWVuZGF0aW9uIGlzIHRoYXQgU0JJIGltcGxlbWVudGF0aW9uIHNo
b3VsZCBjb21wbHkgd2l0aCB0aGUKbWluaW11bSBTQkkgc3BlYyB2ZXJzaW9uIHJlcXVpcmVkIGJ5
IHRoZSBTQkkgZXh0ZW5zaW9ucyB3aGljaCBpdAppbXBsZW1lbnRzLgoKUmVnYXJkcywKQW51cAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
