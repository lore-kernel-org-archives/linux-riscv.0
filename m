Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A37BC44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 17:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIccPtdZzFA4P5HFoW77CM4/zNUfKX8OTanadMtee7s=; b=kCKQ2lcGOUSNli
	vpSpa85YFb+nLco35W8JEZjdvjb91Qun3v3s8nmZPjK+zVmQgV9Hxu+4b2lImCiQwlVGOkQJYDSqs
	dTC1mB9GkNhoqBrFXyPtEWEvk0aGGCOs+TgeSO6K5aIsECpx4KWfrxHD5U+Kcu6isJnR4v4cOfNb8
	Ul4Eb1Yb/sBIud1nA/e+fsNjMVFv0gJ+4jKFxUpsDXudHm242/qOUmUNhm7RAPb2V6OqeClgSwvIb
	zfuWkaHvQNl1ORqfDqu/XDjbt1doyQTViyWLkoadmGBf0omdhf+1llVhFHXhOKeBg/UaTVHfDNfHF
	4vDJ9uFp8s/Jg80X5MKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlru9-00000007YQe-2B9w;
	Mon, 20 Jul 2026 17:35:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlru7-00000007YPc-1e4r
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 17:35:48 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cf420670bbso3478315ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 10:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1784568946; x=1785173746; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcxOfDsXTcakJrNFPmSVKWlmd6kcWw4ERDrOVBmABaQ=;
        b=J14vbNoHeOnVVXEdFbsygOp1Oor/EfEureByp7P0PGqKWDJkeGFC8U/GAD2f5wTu+o
         DYaZOaeF87UhATTEN/uEQ+41qjQ7ST7ojr6NUk6itJEpFfYkN7b4vpdhkeFUthtq3KEE
         XnHyHxbuKlZGYqwcWm+PEJZqXJhONAJ9s05ydHxF54lD3u+YMhedFWc2Db/KZwvXZB7j
         Tz8wW4v/r5yLNKrkVqXpg2XTGwRI1F4n497w45j/+sf6Ue9+7CALVp831MQs7wZ2YGn2
         CjlpktDRuhcsDWXxFqGKnXirSORHUGMO/htd9Y/oADOoJdyWDhU/ME5gtdd2aOSZ0Er5
         zTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568946; x=1785173746;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fcxOfDsXTcakJrNFPmSVKWlmd6kcWw4ERDrOVBmABaQ=;
        b=UBUv0QhVv/5g3R3G2D06dwNpTPtHArN4XliqESU9K/fRQv4ro0YIporwQMQVANwFgJ
         d1b8tl95+ozxJMogHw9W39Mh46M6ONpuKWZkEmE/xTFu2d9SeVJ5bFiapeHGtfB92z3U
         RRPeMQk1SJljZMCHIJbnPwf/L44RpOL/7z+Dz6Hl3u36LzLo+KTNOCeb0HGJByTqTL6I
         g6WhwOyW2xzSY5i2QQQGVvKKurOJRSLtOQpv/jBgVwQFTp5prSENBSVIZobkFrWg8QIn
         eL5TGpR2DJFbcPlCvaT9erywpko0x7roVqljtk3sJeaHY5fCF4DKtS/9SlnUMtp/KPx7
         f5gw==
X-Forwarded-Encrypted: i=1; AHgh+RqSIrrN4JFvgq5+CzzIt06CjRDbMzgpRTz/IILMi01ZRn4iq0i4uTl4AuOATdwMC72PkCZrDgqFvWBEZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YziXqKMN90TJatL8Oo8+tEaIf4kUuX+ruKjX8xwImDGoVa3cBDG
	1iVH/f81Y6o+j0/Uux2Wusx1rzA7DExrgl0HBwk7fFX9sa48WPug98BSFnREVdotl3E=
X-Gm-Gg: AR+sD12BiycRfRLSq3qBluT9JVaFxkWKVRXiwqJ+jIzZRrZxcLuYi9Y0rqrIy8vDLvq
	2EYt0gzMF1RXk8je0CzvMzSaxUpUpYsfkuxRemYdS93sUoPTpm9HFgQHYsSOb2GZNOiKdlAoXmp
	b4+mW76dCQ6ON4keT7dENK91rlQrFsE3z2avkIJxUfwfunItOggTG45Yo9urUkcYp+sLWO4f1fT
	+2OB/vdFrDoCRYX+QErGBNB+rDwn9atIVDQjqhrTlLmhKo/y7wS6GQvh+Y7tXYTqV/Jn92qoN5o
	S2C9jUW9dM9w4AYT1uZtrce/J6CnJNROi2GMsV5rJGnlljIhh/74EGUr++wHKFTGmNc6COjMUbn
	ewIKzzha9IazXKhad1zV0vgiazT1gR0AXj6oxfrO1a39+SetqXJz2d4AhK666M1eRLt+D/fjBiE
	6XXPQNNVEICJ1NPJJq
X-Received: by 2002:a17:902:ef48:b0:2ce:aea4:5e80 with SMTP id d9443c01a7336-2cf7bf7814bmr11505315ad.6.1784568945998;
        Mon, 20 Jul 2026 10:35:45 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::5ee8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b037sm40732696eec.27.2026.07.20.10.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:35:44 -0700 (PDT)
Date: Mon, 20 Jul 2026 10:35:41 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>, Pnina Feder <pnina.feder@mobileye.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
Message-ID: <al5cbYMD18UbKe-6@telecaster>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
 <akybBoCAm-kJbfHL@kernel.org>
 <20260720091927.GA1736709@horms.kernel.org>
 <al4X300UObXawEIJ@kernel.org>
 <al4yeHrkDHFoo6A0@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <al4yeHrkDHFoo6A0@MiWiFi-R3L-srv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_103547_606519_3674A659 
X-CRM114-Status: GOOD (  40.89  )
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

T24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgMTA6NDA6NDNQTSArMDgwMCwgQmFvcXVhbiBIZSB3cm90
ZToKPiBPbiAwNy8yMC8yNiBhdCAwMzo0M3BtLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gSGkg
U2ltb24sCj4gPiAKPiA+IE9uIE1vbiwgSnVsIDIwLCAyMDI2IGF0IDEwOjE5OjI3QU0gKzAxMDAs
IFNpbW9uIEhvcm1hbiB3cm90ZToKPiA+ID4gT24gVHVlLCBKdWwgMDcsIDIwMjYgYXQgMDk6MjE6
NThBTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIEp1biAyMywg
MjAyNiBhdCAxMjoxNDoyNkFNICswMzAwLCBQbmluYSBGZWRlciB3cm90ZToKPiA+ID4gPiA+IFRo
aXMgc2VyaWVzIGV4dGVuZHMgdm1jb3JlaW5mbyB3aXRoIHN0cnVjdCBvZmZzZXRzIGFuZCBzaXpl
cyBuZWVkZWQgYnkKPiA+ID4gPiA+IHRoZSB2bWNvcmUtdGFza3MgdXNlcnNwYWNlIHRvb2wgdG8g
ZXh0cmFjdCBwZXItdGFzayBzdGF0ZSBmcm9tIGEgdm1jb3JlCj4gPiA+ID4gPiBkdW1wIHdpdGhv
dXQgcmVxdWlyaW5nIGtlcm5lbCBkZWJ1ZyBzeW1ib2xzIChEV0FSRi9CVEYpLgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBUaGUgdm1jb3JlLXRhc2tzIHRvb2wgcmVhZHMgL3Byb2Mvdm1jb3JlIChvciBh
IHNhdmVkIHZtY29yZSBmaWxlKSBhbmQKPiA+ID4gPiA+IHJlY29uc3RydWN0cywgZm9yIGVhY2gg
dGFzazoKPiA+ID4gPiA+ICAgLSB0YXNrIG5hbWUsIHBpZCwgc3RhdGUsIGZsYWdzCj4gPiA+ID4g
PiAgIC0gVk1BIGxpc3QgKHN0YXJ0LCBlbmQsIGZsYWdzLCBiYWNraW5nIGZpbGUpCj4gPiA+ID4g
PiAgIC0gdXNlciByZWdpc3RlciBzdGF0ZSAoc2F2ZWQgb24gdGhlIGtlcm5lbCBzdGFjayBhdCBr
ZXJuZWwgZW50cnkpCj4gPiA+ID4gPiAgIC0gdXNlci1zcGFjZSBiYWNrdHJhY2Ugd2l0aCBWTUEv
ZmlsZW5hbWUgbWFwcGluZwo+ID4gPiA+ID4gICAtIGtlcm5lbCBkbWVzZyBidWZmZXIKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gVGhpcyBwcm92aWRlcyBhIGxpZ2h0d2VpZ2h0IHBvc3QtbW9ydGVtIGNy
YXNoIGFuYWx5c2lzIGNhcGFiaWxpdHkgZm9yCj4gPiA+ID4gPiBwcm9kdWN0aW9uIGVudmlyb25t
ZW50cyB3aGVyZSBmdWxsIGRlYnVnIGluZm8gKERXQVJGL0JURikgaXMgbm90Cj4gPiA+ID4gPiBh
dmFpbGFibGUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBjb21wYW5pb24gdXNlcnNwYWNlIHRv
b2wgaXMgc3VibWl0dGVkIHRvIGtleGVjLXRvb2xzOgo+ID4gPiA+ID4gICBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNjA2MjIyMDU1NTAuMTA4NzE2My0xLXBuaW5hLmZlZGVyQG1vYmls
ZXllLmNvbS8KPiA+ID4gPiAKPiA+ID4gPiBTb3JyeSBmb3IgdGhlIGRlbGF5LCB0aGlzIGZlbGwg
YmV0d2VlbiB0aGUgY3JhY2tzIHNvbWVob3cuCj4gPiA+ID4gCj4gPiA+ID4gVGhlIGtlcm5lbCBz
aWRlIGxvb2tzIGZpbmUgb3ZlcmFsbCwgYnV0IHRvIG1lcmdlIGl0IHRoZXJlIHNob3VsZCBiZSBh
bgo+ID4gPiA+IGFncmVlbWVudCBmcm9tIHRoZSB1c2Vyc3BhY2Ugc2lkZSBtYWludGFpbmVycyB0
aGF0IHZtY29yZS10YXNrcyBpcwo+ID4gPiA+IHNvbWV0aGluZyB0aGV5IGFyZSB3aXNoaW5nIHRv
IGFjY2VwdC4KPiA+ID4gCj4gPiA+IEhpIE1pa2UsIGFsbCwKPiA+ID4gCj4gPiA+IFNvcnJ5IGZv
ciB0aGUgZXh0ZW5kZWQgZGVsYXkuCj4gPiA+IAo+ID4gPiBJIHdpbGwgc2VuZCBzb21lIG1pbm9y
IGZlZWRiYWNrIHRvIHRoZSB1c2VyLXNwYWNlIHRvb2wgcGF0Y2hzZXQKPiA+ID4gYnV0IG92ZXJh
bGwsIHllcywgdGhpcyBpcyBzb21ldGhpbmcgSSB3b3VsZCBiZSBoYXBweSB0byBhY2NlcHQuCj4g
PiA+IAo+ID4gPiBJIGRvbid0IHdhbnQgdG8gY3JlYXRlIGEgY2hpY2tlbi1hbmQtZWdnIHR5cGUg
cHJvYmxlbSBoZXJlLgo+ID4gPiBCdXQgaXQncyBwcm9iYWJseSB3b3J0aCBtZW50aW9uaW5nIHRo
YXQgdXN1YWxseSBmZWF0dXJlcwo+ID4gPiBoaXQgdGhlIGtlcm5lbCBiZWZvcmUgdGhlIGNvcnJl
c3BvbmRpbmcgY29kZSBpcyBhY2NlcHRlZAo+ID4gPiBpbnRvIGtleGVjLXRvb2xzLgo+ID4gCj4g
PiBTb3JyeSBpZiBJIHdhc24ndCBjbGVhci4gCj4gPiAKPiA+IEkgZGlkbid0IG1lYW4gdGhhdCB0
aGUgZmVhdHVyZSBzaG91bGQgYmUgbWVyZ2VkIGludG8ga2V4ZWMtdG9vbHMgYmVmb3JlCj4gPiBt
ZXJnaW5nIHRoZSBrZXJuZWwgYml0cy4gSSBqdXN0IHdhbnRlZCB0byBtYWtlIHN1cmUgdGhlcmUn
cyBubyBmdW5kYW1lbnRhbAo+ID4gaXNzdWUgZnJvbSBrZXhlYy10b29scyBwZXJzcGVjdGl2ZS4K
PiA+IAo+ID4gPiBMZXQgbWUga25vdyBob3cgeW91IHdvdWxkIGxpa2UgdG8gcHJvY2VlZC4KPiA+
IAo+ID4gSSdtIGdvaW5nIHRvIHdhaXQgZm9yIEJhb3F1YW4ncyByZXZpZXcgYW5kIG9uY2UgdGhh
dCdzIGRvbmUgSSdsbCBwaWNrIHVwCj4gPiB0aGUga2VybmVsIGJpdHMuCj4gCj4gT2gsIHNvcnJ5
LCBJIGp1c3Qgbm90aWNlZCB0aGlzIHNlcmllcywgYnV0IGEgcXVpY2sgbG9vayBnaXZlIG1lIGEg
aGludAo+IG9mICdObywgSSBkb24ndCBsaWtlIGl0LicgV2UgaGF2ZSBoYWQgQ3Jhc2ggdXRpbGl0
eSwgRHJnbiwgbm93IGEgbmV3IG9uZQo+IGNvbWVzIHVwLiBJIGhhdmUgc29tZSBjb25jZXJucyB0
byBQbmluYToKPiAKPiAxLiBFeHBvcnRpbmcgbWFwbGUgdHJlZSBpbnRlcm5hbHMgKG1hcGxlX25v
ZGUsIG1hcGxlX3JhbmdlXzY0LAo+ICAgIG1hcGxlX2FyYW5nZV82NCwgbWFwbGVfbWV0YWRhdGEp
IGFzIHZtY29yZWluZm8gQUJJIGlzIHByb2JsZW1hdGljLgo+ICAgIFRoZXNlIGFyZSBwcml2YXRl
IGltcGxlbWVudGF0aW9uIGRldGFpbHMsIG5vdCBzdGFibGUgc3RydWN0dXJlcyBsaWtlCj4gICAg
dGFza19zdHJ1Y3QuIEFueSByZWZhY3RvcmluZyBvZiB0aGUgbWFwbGUgdHJlZSB3aWxsIHNpbGVu
dGx5IGJyZWFrCj4gICAgdGhlIHVzZXJzcGFjZSB0b29sLiAKPiAKPiAyLiBXaXRob3V0IERXQVJG
L0JURiwgdGhlIGRlYnVnZ2luZyBzY29wZSBpcyBpbmhlcmVudGx5IGxpbWl0ZWQg4oCUIG5vCj4g
ICAga2VybmVsIHN0YWNrIGJhY2t0cmFjZSwgbm8gc3ltYm9sIHJlc29sdXRpb24sIG5vIHZhcmlh
YmxlIGFjY2Vzcy4KPiAgICBUaGF0J3MgZXNzZW50aWFsbHkgInBzICsgL3Byb2MvUElEL21hcHMi
IGZyb20gYSB2bWNvcmUuIEhhdmUgeW91Cj4gICAgY29uc2lkZXJlZCBlbmFibGluZyBDT05GSUdf
REVCVUdfSU5GT19CVEYgb24geW91ciBwbGF0Zm9ybXMgaW5zdGVhZD8KPiAgICBCVEYgaXMgY29t
cGFjdCAodHlwaWNhbGx5IDwgMSBNQikgYW5kIHdvdWxkIGdpdmUgZHJnbiBmdWxsIGFjY2Vzcwo+
ICAgIHdpdGhvdXQgbmVlZGluZyB2bWxpbnV4IGRlYnVnIHBhY2thZ2VzLiBUaGF0IHNlZW1zIGxp
a2UgYSBiZXR0ZXIKPiAgICByZXR1cm4tb24taW52ZXN0bWVudCB0aGFuIG1haW50YWluaW5nIH40
MCBuZXcgdm1jb3JlaW5mbyBleHBvcnRzLgo+IAo+IDMuIEJleW9uZCB0aGUgdGVjaG5pY2FsIGNv
bmNlcm5zLCBJIHdvbmRlciBhYm91dCBhZG9wdGlvbi4gdm1jb3JlLXRhc2tzCj4gICAgdGFyZ2V0
cyBhIGZhaXJseSBuYXJyb3cgdXNlIGNhc2Ug4oCUIHBsYXRmb3JtcyB3aXRob3V0IERXQVJGL0JU
Riwgd2hlcmUKPiAgICB5b3Ugc3RpbGwgaGF2ZSB2bWNvcmUgYnV0IGNhbid0IHNoaXAgdm1saW51
eC4gSXMgTW9iaWxleWUgY3VycmVudGx5Cj4gICAgdGhlIG9ubHkgY29uc3VtZXI/IEFyZSB5b3Ug
Z3V5cyBhbHJlYWR5IHVzaW5nIGl0IHdpZGVseSBhbmQgZnVsbHk/Cj4gICAgSWYgdGhpcyBsYW5k
cyBidXQgZG9lc24ndCBzZWUgYnJvYWRlciB1cHRha2UsIHRoZSB+NDAgZXhwb3J0cyByaXNrCj4g
ICAgYmVjb21pbmcgZGVhZCB3ZWlnaHQgaW4gdm1jb3JlaW5mbyDigJQgbm9ib2R5IGFjdGl2ZWx5
IHVzZXMgdGhlbSwgYnV0Cj4gICAga2VybmVsIGNoYW5nZXMgc3RpbGwgbmVlZCB0byBrZWVwIHRo
ZW0gY29uc2lzdGVudCwgb3IgdGhleSBzaWxlbnRseQo+ICAgIHJvdCBhbmQgZ2l2ZSB1c2VycyB3
cm9uZyByZXN1bHRzLiAKPiAKPiBSZWdhcmRzLAo+IEJhb3F1YW4KCihBZGRpbmcgbGludXgtZGVi
dWdnZXJzIG1haWxpbmcgbGlzdCkuCgpJIGFncmVlIHdpdGggYWxsIG9mIEJhb3F1YW4ncyBwb2lu
dHMgaGVyZSwgd2l0aCBhIGNvdXBsZSBvZiBub3RlczoKCjEuIGRyZ24ncyBCVEYgc3VwcG9ydCBp
cyBjdXJyZW50bHkgYSB3b3JrIGluIHByb2dyZXNzLCBidXQgaXQncyBzaGFwaW5nCiAgIHVwIHdl
bGw6IGh0dHBzOi8vZ2l0aHViLmNvbS9vc2FuZG92L2RyZ24vcHVsbC82MjUuCjIuIG1ha2VkdW1w
ZmlsZSBpcyBhbHNvIGdhaW5pbmcgQlRGIGV4dGVuc2lvbiBzdXBwb3J0OgogICBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNjA2MTcwNTE4MzQuOTU0MDQtMS1sdGFvQHJlZGhhdC5jb20v
LgogICBJdCdzIGxpZ2h0ZXItd2VpZ2h0IHRoYW4gZHJnbiB3aGlsZSBzdGlsbCBiZWluZyBtdWNo
IG1vcmUgZ2VuZXJhbAogICB0aGFuIHRoaXMgc2VyaWVzLgoKVGhhbmtzLApPbWFyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
