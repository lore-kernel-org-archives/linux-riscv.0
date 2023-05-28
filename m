Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA444C77B7E
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTiMpZQMxiCi3iN0Xmn+mhPO8l5H45VHOox+cnXyiXA=; b=jP1PsQen7sPI/C
	EaH3Jr93cFuOaRusN88n3bLxlMGO7Yw+ZjFsk0OKArlIebvQoyPtZnWzO4QQ72dUC1p/Z75u5S6ON
	q1Ko9TE8jrjQ2ds+1bJK+hZiy8LMKUjaKoHkk5HTCU2r7Tax4wVW7lGzqYNClIMWmaM06Al6uKp1C
	3bDLWVVZt1y4b7WsUNog0Gcu0QNr9EPdQS11yCzJiOwozjwKIekK4GqYhfYvZzTG9LUcCHK0b3RZO
	l5lewuNN2P95gNITdRFImW1YuiZ61MtFNtaf95P5rKaEBCT2cAsiVBmxbHR+bdzrvH+2d2DyQ/DYt
	QczH1qPgcEIf/6B2luwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3G1L-007fNq-20;
	Sun, 28 May 2023 13:01:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3G1H-007fNF-39
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 13:01:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30ae5f2ac94so738206f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 28 May 2023 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685278868; x=1687870868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmSD/mMKdh/z5N+sCe3c2tpdqKCT7mWgSBl+i6i1id0=;
        b=NtaqX3glS//gpzcZ9RWLeaPh2+1IMGg5/S/qZ3Nt/o1C5eH6GAIfb7gxnd4/OZj7pI
         dBUkcgdl4rheF+IZ30vnYN6TxkgxssOVArqJpruF2K+fe9NFj9kLjybZRHxrlbXxwbZ2
         0mDAhbDRt2TcgwOm+79LQiutKOF8I61BM7ZvI5BLrEQbMXYgSBktw4S42NWJ1JV9afJJ
         nc8VAlOgvGIl+rY94763GRpYlp1Pu5Jpe2htuuJZk9e5ysgJWXSNq0FSQR9aZpebQzei
         SamvVmzb2VD+M3WkifzcoVtYHmAW4fbVp5LdMO1a5II2e7JLl+TwrA/ZOEapqrHFCzXq
         TgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685278868; x=1687870868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmSD/mMKdh/z5N+sCe3c2tpdqKCT7mWgSBl+i6i1id0=;
        b=jc5WJbd74yrBznK0DlsDTS3QlNU+e0Cqu9q3/WqTcI1Cn926eoTSFl+cuQAq0T+JwY
         uY069XmSM09aPf8JwoQ4RTeWxrSBz0OlsxM6vqCkGYVQSorRWUP92Cy3By5D3/V3QFjY
         euSEgvPqMeuzis9HpRcpDBi2/dz8dPymn9/ryr7VRMcK41/JG6zFaTGANak/1AsgGREY
         B8uim5vDzaz0P5z1n4RtRKid04gzm8+soStdGRMkP4UgB4Iti9AQ+sYRsC174S66b41u
         Z0PtZhdFRFoH99zgW9bnyAY5fWLFtnn9QmVoWEEW45mJJrPjfvc+tun/1ruLgFYbI8di
         VRsw==
X-Gm-Message-State: AC+VfDxg6oOoP32toiNpSTT0azi3bGeoRmiNpnnUfYpdEPX1AhAXPjQf
	CLmLco6Qrshvz7VgO2RInXrliyA85WWxTzxJubTjIg==
X-Google-Smtp-Source: ACHHUZ7+17dKZkWBx2usLAcAjzua73N800snDWC4IqZPOvC1tsLLqyUxWCEdEkWPnzYIK7Q7fHOMIwMUAOV4FIwkjwM=
X-Received: by 2002:a5d:65c3:0:b0:30a:e69d:721e with SMTP id
 e3-20020a5d65c3000000b0030ae69d721emr2344793wrw.55.1685278868682; Sun, 28 May
 2023 06:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
 <20230526-clergyman-wriggly-accc659a3fad@spud> <20230526-rockfish-moody-f6d3e71f9d24@spud>
 <f6522c82-01bd-8a03-579d-a5b294784480@ghiti.fr> <20230527-hyperlink-doctrine-ef22cfcb508a@spud>
In-Reply-To: <20230527-hyperlink-doctrine-ef22cfcb508a@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Sun, 28 May 2023 15:00:57 +0200
Message-ID: <CAHVXubgx3uBEjMLHXTxr0192ZHbSb=qK4NggZyWQTDfgrJt2-g@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_060112_275463_E8245D23 
X-CRM114-Status: GOOD (  35.48  )
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

T24gU2F0LCBNYXkgMjcsIDIwMjMgYXQgMTI6MDLigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBNYXkgMjcsIDIwMjMgYXQgMTE6MTM6MThBTSAr
MDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4KPiA+IE9uIDI2LzA1LzIwMjMgMTg6MzUs
IENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gT24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMDU6MjQ6
NDFQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgTWF5IDI2LCAy
MDIzIGF0IDA1OjQ2OjMwUE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+ID4gPiA+
IEVhcmx5IGFsdGVybmF0aXZlcyBhcmUgY2FsbGVkIHdpdGggdGhlIG1tdSBkaXNhYmxlZCwgYW5k
IHRoZW4gc2hvdWxkIG5vdAo+ID4gPiA+ID4gYWNjZXNzIGFueSBnbG9iYWwgc3ltYm9scyB0aHJv
dWdoIHRoZSBHT1Qgc2luY2UgaXQgcmVxdWlyZXMgcmVsb2NhdGlvbnMsCj4gPiA+ID4gPiByZWxv
Y2F0aW9ucyB0aGF0IHdlIGRvIGJlZm9yZSBidXQgKnZpcnR1YWxseSouIFNvIG9ubHkgdXNlIG1l
ZGFueSBjb2RlCj4gPiA+ID4gPiBtb2RlbCBmb3IgdGhpcyBlYXJseSBjb2RlLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4KPiA+ID4gPiA+IE5vdGUgdGhhdCBJJ20g
bm90IHZlcnkgaGFwcHkgd2l0aCB0aGlzIGZpeCwgSSB0aGluayB3ZSBuZWVkIHRvIHB1dCBtb3Jl
Cj4gPiA+ID4gPiBlZmZvcnQgaW50byAiaGFybW9uaXppbmciIHRoaXMgdmVyeSBlYXJseSBjb2Rl
IChpZSBiZWZvcmUgdGhlIG1tdSBpcwo+ID4gPiA+ID4gZW5hYmxlZCkgYXMgaXQgaXMgc3ByZWFk
IGJldHdlZW4gZGlmZmVyZW50IGxvY2F0aW9ucyBhbmQgY29tcGlsZWQKPiA+ID4gPiA+IGRpZmZl
cmVudGx5Lgo+ID4gPiA+IFRvdGFsbHkgJiBJJ2xsIGhhcHBpbHkgc3BlbmQgdGhlIHRpbWUgdHJ5
aW5nIHRvIHJldmlldyB0aGF0IHdvcmsuCj4gPiA+ID4KPiA+ID4gPiA+IEknbGwgd29yayBvbiB0
aGF0IGxhdGVyLCBidXQgZm9yIG5vdywgdGhpcyBmaXggZG9lcyB3aGF0IGlzCj4gPiA+ID4gPiBu
ZWVkZWQgdG8gd29yayAoZnJvbSBteSB0ZXN0aW5nIGF0IGxlYXN0KS4gQW55IFRlc3RlZC1ieSBv
biB0aGUgVW5tYXRjaGVkCj4gPiA+ID4gPiBhbmQgVC1oZWFkIGJvYXJkcyBpcyB3ZWxjb21lIQo+
ID4gPiA+IE9uIDYuNC1yYzEgJiB2Ni40LXJjMSArIHRoaXMgcGF0Y2gsIHdpdGggQ09ORklHX1JF
TE9DQVRBQkxFIGFkZGVkIHRvIG15Cj4gPiA+ID4gY29uZmlnLCBteSBOZXpoYSBmYWlscyB0byBi
b290LiBUaGVyZSBpcyBubyBvdXRwdXQgd2hhdHNvZXZlciBmcm9tIHRoZQo+ID4gPiA+IGtlcm5l
bC4gVHVybmluZyBvZmYgQ09ORklHX1JFTE9DQVRBQkxFIGJvb3RzIGFnYWluLgo+ID4gPiBJIGRv
bid0IGtub3cgaWYgdGhpcyBpcyBiZXR0ZXIgb3Igd29yc2UgbmV3cywgYnV0IHNhbWUgdGhpbmcg
aGFwcGVucyBvbgo+ID4gPiBhbiBpY2ljbGUga2l0LiBXaGF0IHN5c3RlbXMsIG90aGVyIHRoYW4g
UUVNVSwgaGFzIHRoZSByZWxvY2F0YWJsZQo+ID4gPiBlcmllcyBiZWVuIHRlc3RlZCB3aXRoLCBi
dHc/Cj4gPgo+ID4KPiA+IEkgdGVzdGVkIGl0IG9uIHRoZSBVbm1hdGNoZWQgKEFuZHJlYXMgZGlk
IHRvbykuCj4KPiBDb29sLiBJIGNyYWNrZWQgb3V0IG15IHVubWF0Y2hlZCBhbmQgaXQgaGFzIHRo
ZSBzYW1lIGlzc3VlIGFzIHRoZQo+IGljaWNsZS4gRGl0dG8gbXkgVmlzaW9uZml2ZSB2Mi4gSGVy
ZSdzIG15IGNvbmZpZy4KPiBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vQ29uY2h1
T0QvcmlzY3YtZW52L2Rldi9jb25mL2RlZmNvbmZpZwo+Cj4gQSB+ZGVmYXVsdCBxZW11IHZpcnQg
ZG9lc24ndCB3b3JrIGVpdGhlci4gKC1tIDJHIC1zbXAgNSkKCkkgY2FuIGJvb3Qgd2l0aCB0aGlz
IGNvbmZpZyB1c2luZzoKCiQgc3VkbyB+L3FlbXUvYnVpbGQvcWVtdS1zeXN0ZW0tcmlzY3Y2NCAt
bWFjaGluZSB2aXJ0IC1jcHUKcnY2NCxzdjQ4PW9mZiAtbm9ncmFwaGljIC1tIDJHIC1zbXAgNSAt
a2VybmVsCmJ1aWxkX2Nvbm9yL2FyY2gvcmlzY3YvYm9vdC9JbWFnZSAtcwoKSSBub3RpY2VkIHdo
ZW4gdHJ5aW5nIHRvIGFkZCB0aGlzIHRvIG91ciBpbnRlcm5hbCBDSSB0aGF0IEkgaGFkIGxvY2Fs
CmZhaWx1cmVzIHRoYXQgZGlkIG5vdCBoYXBwZW4gaW4gdGhlIENJIGJlY2F1c2UgdGhlIENJIHdh
cyBub3QgdXNpbmcKdGhlIHNhbWUgdG9vbGNoYWluOiBjYW4geW91IGdpdmUgbWUgdGhlIGZ1bGwg
LmNvbmZpZz8gU28gdGhhdCBJIGNhbgpzZWUgaWYgdGhlIGNvbXBpbGVyIGFkZGVkIHN0YWNrIGd1
YXJkcyBvciBzb21lIG90aGVyIHRoaW5ncyBJIGRpZCBub3QKdGhpbmsgb2YuCgpUaGFua3MhCgo+
Cj4gPiBWZXJ5IHdlaXJkIGl0IGRvZXMgbm90IHdvcmsgb24gdGhlIGljaWNsZSBraXQsIHRoZXJl
IGlzIG5vIGVycmF0YSBmb3IgdGhpcwo+ID4gc29jLCBzbyB3aGF0IGdldHMgZXhlY3V0ZWQgdGhp
cyBlYXJseSBmb3IgdGhpcyBzb2M/IERvIHlvdSBrbm93IHdoZXJlIGl0Cj4gPiBmYWlscyB0byBi
b290PyBJZiB5b3UgY2FuIGRlYnVnLCB5b3Ugc2hvdWxkIGJyZWFrIG9uIHRoZSBhZGRyZXNzIG9m
IHRoZQo+ID4gZW50cnkgcG9pbnQgKHVzdWFsbHkgMHg4MDIwXzAwMDApIHNpbmNlIHRoaXMgaXMg
dGhlIHN0dmVjIGFkZHJlc3MsIHNvIHdoZW4KPiA+IHlvdSBnZXQgYSB0cmFwLCB5b3Ugd2lsbCBi
cmFuY2ggdGhlcmUsIGFuZCB0aGVuIGNvdWxkIHlvdSBkdW1wICRzZXBjLCAkcmEKPiA+IGFuZCAk
c3R2YWwgd2hlbiB5b3UgZ2V0IHRoZXJlPwo+Cj4gPiBSZWdhcmRpbmcgdGhlIHRoZWFkIGlzc3Vl
LCBJIHRoaW5rIHRoZSBmb2xsb3dpbmcgc2hvdWxkIGZpeCBpdDoKPgo+IEl0IGRpZCBub3QgOi8K
Pgo+IENoZWVycywKPiBDb25vci4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
