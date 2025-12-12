Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE99CD43369
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 03:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMka337BN2KYUhhA5M0lz6AD7uzHgWPWS9m6Q15zRNY=; b=DN5kgS5cTKykmX
	i8t9v2ifnHDHRxdAEnnKArVTUU07QFDI28YlGOxvxiZzlEkTQKnk3jC/Mkk8sYOlDld6fiYu6vMp6
	ZRIJ7SYiRpBxzpib/tVHae5cl6dVYMu86hR9N0j/xqrGj3FINjpZYueUZMX6aksL5bV8JqylT+i1p
	YBEkK0MUTeZneK6EiZy2bDCsCGvuTmdFXsK0xdAF5Zr2GtJiMNmTmJv6FC5dgUiv18TcX7UsHkFsR
	HMhDU6jb9T84QxrahnmoKbqc+7urFX0pmRdLWeTIoy6b0mrUVknLjN8H9f+SL0Pe7ovk2p6QLu8fp
	hUJHnBH1XOBYaqyqTCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtww-000000001Xr-15Z2;
	Fri, 12 Dec 2025 03:36:10 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtws-000000001X5-3fiG
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 03:36:08 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b7697e8b01aso160569266b.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Dec 2025 19:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1765510564; x=1766115364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ofnmmsc+p8cbk8w5KbuxpSjDMLzqoPAmhlHL6cy9Bx0=;
        b=M0FHzCa4LOY7ZaQgAv10P5bReSkWCvNX+zZdoBkpYLyEjLVxizvdyXEjM6QY7PheLZ
         B0PriJwWe+94E83Eae79lnv/a2zK2E/e6FeBfLFTtwaYOilv++rgDL6ES5bIkznhNBEg
         jkAAPDh1HMhm/DYYRUuQxXzvRB+7m/woL3uqeNYjkxnK3WXsVXFfaaZ/BuNsAH22C5SR
         95gNsOjjzUrU4Nbgfq0IvtNz35apVHnDfj1PADJ62JU/XX27CqwpLqrvp99/gJC5pMPH
         /JsZWzAXla8fzRWx7DUy/RbWI5wo15oT6/xrHU6vD46LFRBZ17xLZQdLP2pr86K4uAVf
         UGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765510564; x=1766115364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ofnmmsc+p8cbk8w5KbuxpSjDMLzqoPAmhlHL6cy9Bx0=;
        b=RHd3PBHFdWcA/yfgP6yJBf4YbOrRmHm6S0WH78y8y48DLcYE+mh+Gf0HQIJj2ZnqtT
         jM3hQAtVOrkSkqdwThmm8oyyT5iTe+BBFGs2Q0ltkYGq3RpPGRmX+xYGq0M90dQve/5S
         zFq3aDf3j4+ourhkoYMZTyLLbjLFU3zq1sIhh47a0BuLByjlFEapOcC3Mtr5wRbCXVas
         LPpKSdYwVMN2V2bgoGwsYwZFCPfFgycjO5LvXSB+KE3DEoSI/t3SgdR2OwWSYg2Ib1Tw
         Zl31gZrbYdTk5tLzMDuzt+6/dUwqdVMMYi5+eBM1D6c0pi+ROCCDiHhi2FsCWcjtRClV
         XaOg==
X-Forwarded-Encrypted: i=1; AJvYcCXQSJoNAzScPKMWjcjNYeJoSfLRPQJTB+V/jae4N49loHUqYGgfB0iikpB6jnHpFxsC8fBGgnTgKpILFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2LEmiRW96qBGSmPBwUygbJ+V//VIwE+r+Wy1zaGX5R0Nob5zc
	zxwCaQDgxByWrddNSlke6JOGPeJxG+3pMTxLx/K/VzbL/G6bbff/lfGpI88/SJnTGvQZqb+Suww
	PlO2TFPaDGp5mnNic2nYbMhgrU2MB95yohL2Flng79w==
X-Gm-Gg: AY/fxX5JsnHpLXzLYCWCbQtkB6LZlqNF3F6fttiDWOpQMbLc+m7UXvShosBiiT23R71
	P5oM/hoy94eE63d1DDu6IZSKg4Nk05LvS49Z/4CEuHNPBdYUzieG4AVp4Q7Ji5ZSileD3etNye5
	LCpKI2WHeHpyyUDv2/2CfqPw5o1AcFwqyFnoav1of9bAoV3eqdRMYDqKF5N6KpSVb0memAMKMLT
	ly1nVapgdY2HAxDx3u5Ir38yufZTEY1lXXk37SvvrZ0siBpdJQcGS3enNC2d9atxkibet2k/ubn
	V6/FW8YesNm2L4n0g1aPvvKYqITMxQ==
X-Google-Smtp-Source: AGHT+IES7BBbTn7tqCPfnDPHjSNdpqaXrpbRG6DqnnJ1DEXLbtMv8wmJUtOWcZP/vd9EsPmBwealpv5uJAbWVaKwNko=
X-Received: by 2002:a17:906:794f:b0:b72:8489:7e65 with SMTP id
 a640c23a62f3a-b7d23c1e339mr40812866b.31.1765510564545; Thu, 11 Dec 2025
 19:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20250909091335.183439-1-ajd@linux.ibm.com> <336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
 <20250925161726.2b34890070e6d8dcf8ad3ba9@linux-foundation.org>
In-Reply-To: <20250925161726.2b34890070e6d8dcf8ad3ba9@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 12 Dec 2025 12:35:27 +0900
X-Gm-Features: AQt7F2oPlCrCn0vgeBqPFjk6oJGdLPXS9LGfuM7Cqn1iLUHRy15krGx13xCnA8U
Message-ID: <CA+CK2bDDZi0TR9fhAuKpxz+XJU6-rOS_iM-akU=oTb5wVoVxMQ@mail.gmail.com>
Subject: Re: [PATCH v17 00/12] Support page table check on PowerPC
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	sweettea-kernel@dorminy.me, nicholas@linux.ibm.com, 
	christophe.leroy@csgroup.eu, alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_193606_930730_6D92FD50 
X-CRM114-Status: GOOD (  20.85  )
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

T24gRnJpLCBTZXAgMjYsIDIwMjUgYXQgODoxN+KAr0FNIEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCAyNiBTZXAgMjAyNSAwODo0Mjoz
NSArMTAwMCBBbmRyZXcgRG9ubmVsbGFuIDxhamRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4KPiA+
IE9uIFR1ZSwgMjAyNS0wOS0wOSBhdCAxOToxMyArMTAwMCwgQW5kcmV3IERvbm5lbGxhbiB3cm90
ZToKPiA+ID4gU3VwcG9ydCBwYWdlIHRhYmxlIGNoZWNrIG9uIGFsbCBQb3dlclBDIHBsYXRmb3Jt
cy4gVGhpcyB3b3JrcyBieSBzZXJpYWxpc2luZwo+ID4gPiBhc3NpZ25tZW50cywgcmVhc3NpZ25t
ZW50cyBhbmQgY2xlYXJzIG9mIHBhZ2UgdGFibGUgZW50cmllcyBhdCBlYWNoIGxldmVsIGluCj4g
PiA+IG9yZGVyIHRvIGVuc3VyZSB0aGF0IGFub255bW91cyBtYXBwaW5ncyBoYXZlIGF0IG1vc3Qg
b25lIHdyaXRhYmxlIGNvbnN1bWVyLAo+ID4gPiBhbmQgbGlrZXdpc2UgdGhhdCBmaWxlLWJhY2tl
ZCBtYXBwaW5ncyBhcmUgbm90IHNpbXVsdGFuZW91c2x5IGFsc28gYW5vbnltb3VzCj4gPiA+IG1h
cHBpbmdzLgo+ID4gPgo+ID4gPiBJbiBvcmRlciB0byBzdXBwb3J0IHRoaXMgaW5mcmFzdHJ1Y3R1
cmUsIGEgbnVtYmVyIG9mIGhlbHBlcnMgb3Igc3R1YnMgbXVzdCBiZQo+ID4gPiBkZWZpbmVkIG9y
IHVwZGF0ZWQgZm9yIGFsbCBwb3dlcnBjIHBsYXRmb3Jtcy4gQWRkaXRpb25hbGx5LCB3ZSBzZXBh
cmF0ZQo+ID4gPiBzZXRfcHRlX2F0KCkgYW5kIHNldF9wdGVfYXRfdW5jaGVja2VkKCksIHRvIGFs
bG93IGZvciBpbnRlcm5hbCwgdW5pbnN0cnVtZW50ZWQKPiA+ID4gbWFwcGluZ3MuCj4gPiA+Cj4g
PiA+IE9uIHNvbWUgUG93ZXJQQyBwbGF0Zm9ybXMsIGltcGxlbWVudGluZyB7cHRlLHBtZCxwdWR9
X3VzZXJfYWNjZXNzaWJsZV9wYWdlKCkKPiA+ID4gcmVxdWlyZXMgdGhlIGFkZHJlc3MuIFdlIHJl
dmVydCBwcmV2aW91cyBjaGFuZ2VzIHRoYXQgcmVtb3ZlZCB0aGUgYWRkcmVzcwo+ID4gPiBwYXJh
bWV0ZXIgZnJvbSB2YXJpb3VzIGludGVyZmFjZXMsIGFuZCBhZGQgaXQgdG8gc29tZSBvdGhlciBp
bnRlcmZhY2VzLAo+ID4gPiBpbiBvcmRlciB0byBhbGxvdyB0aGlzLgo+ID4gPgo+ID4gPiBOb3Rl
IHRoYXQgb24gMzIgYml0IHN5c3RlbXMgd2l0aCBDT05GSUdfS0ZFTkNFPXksIHlvdSBuZWVkIFsw
XSB0byBhdm9pZAo+ID4gPiBwb3NzaWJsZSBmYWlsdXJlcyBpbiBpbml0IGNvZGUgKHRoaXMgaXMg
YSBjb2RlIHBhdGNoaW5nL3N0YXRpYyBrZXlzIGlzc3VlLAo+ID4gPiB3aGljaCB3YXMgZGlzY292
ZXJlZCBieSBhIHVzZXIgdGVzdGluZyB0aGlzIHNlcmllcyBidXQgaXNuJ3QgYSBidWcgaW4gcGFn
ZQo+ID4gPiB0YWJsZSBjaGVjaykuCj4gPiA+Cj4gPiA+IChUaGlzIHNlcmllcyB3YXMgaW5pdGlh
bGx5IHdyaXR0ZW4gYnkgUm9oYW4gTWNMdXJlLCB3aG8gaGFzIGxlZnQgSUJNIGFuZAo+ID4gPiBp
cyBubyBsb25nZXIgd29ya2luZyBvbiBwb3dlcnBjLikKPiA+Cj4gPiBJcyB0aGlzIGxpa2VseSB0
byBtYWtlIGl0IGluIGluIHRpbWUgZm9yIDYuMTgsIG9yIHNob3VsZCBJIHJlc3BpbiBpdCBwb3N0
IG1lcmdlCj4gPiB3aW5kb3c/Cj4KPiBUaGUgbGF0dGVyLCBwbGVhc2UuCgpBbmRyZXcgRG9ubmVs
YW4sIGxvb2tzIGxpa2UgdGhlIG1lcmdlIHdpbmRvdyBtaXNzZWQgYWdhaW4sIGNvdWxkIHlvdQpw
bGVhc2UgcmUtc2VuZCB0aGlzIHNlcmllcyBzbyB3ZSBjb3VsZCBnZXQgaXQgaW50byA2LjIwPwoK
VGhhbmsgeW91LApQYXNoYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
