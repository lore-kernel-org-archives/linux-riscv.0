Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DDDC02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 23:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sh2cA8CDF9/cosaJZW+OJ9KNJEuyfziI2lgL2mHeyDk=; b=IA8XPkSDuZTXAF
	vpJWsaEvsYqH0GgDNAsJX6lcfvlHXVCXtGuDFGzX6dbrALiKRZSoPNAVshseN3eZJiM12Y1gC8PSF
	gYgR+AWnN+WLh5mlEPonuSUIXivmOtBt47yYxp8xMhExxZWlUMZ/sDFX8CaVJsp2w4ljeG4mwaD53
	RloS8gGfx81uozGD1U6UkpphsKuEu+jm2Pw7OwOUr12V14z8cs45sf9F5LoDYh8A7KYGU/ZqM0A89
	fz/uovmOYi9aW7aoE0NK4CZANKQlJ1EY01FtQDUL8v6QpUGf3HrmZ/F274n8vRuOyVN8JqY0Kv4eo
	h32pFKJcfANDDyK7clkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdA1-00000001q0s-2rNc;
	Mon, 10 Feb 2025 23:25:53 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb60-00000001SRI-2pyu
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:13:38 +0000
Received: by mail-yb1-xb42.google.com with SMTP id 3f1490d57ef6-e4419a47887so3827562276.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739222015; x=1739826815; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p9zBoct08/zHBbjHTsszjb3dp9O/ncBq7kxMVjWp9/A=;
        b=CFUDPwIyDfQEIkq7VY9ogIEhciixl3Hp3aX5pHf7gxM8q11bod4TC7F37q7a7n8Zxe
         yiz2Z7wAoi3fZ1cswaJGqibSdn/XeCe5yx7wAB6Tl4yc/mvGiqh2V6IE2/h6xd0xWgYf
         vFbzzpgXzKUVDm+kcQLz96cZ6xoaF2Iq7+2Y/W8JuEE/apdsbSUzMWT7G/3pPQPrhYLk
         tAJD/2HUZz/bXdkUeXtGEgJqs1hgdzMw+kt0kstXo+k6pryBQxusZEU54wR6fIXB5Gx7
         ghwHJHsIETrMipnIOt1WCXsFYJNduNDuAdspHMj8zJz/5TdqU3/uu7yvoEakjf/FMV30
         HqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739222015; x=1739826815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9zBoct08/zHBbjHTsszjb3dp9O/ncBq7kxMVjWp9/A=;
        b=CZd4npIKT9Cj9RscC1UMNYRXP6IPs3b/zuCAIdjpbKg71cuXItNbb3heX0791kqigZ
         m5ia71vDr4rm2vnNIA+dHV2o2kIIOhSpi/2FoTBnH2cuhmz60zMKNSs/O8af+2MI6KoO
         /1bkN3cSMSVyD7Jmiwn1FgQctihnCCAkKTjiXVPOlzX7LQuRFA6R0bVQ0E9bdw254Iun
         Gk2tYGBsEk3HE6W9Zvzxgd21EjJrJx7aGaHZlra4NtzUUqskX1n10276hf1yDXE/udx5
         oUyxX2uU2/4OsIW/60jFq0Jzdran5jFgsxsoxK8m2RGuaOM0og2Zaz7/ve7td1yG2fvB
         QQKA==
X-Forwarded-Encrypted: i=1; AJvYcCWu9+9aQ77y0+4sS3giezios+I4PoaS0ONFTaC2fJIbwL9tOyM8tweBhgV0Bnzugkyw0oOxDC456wmyfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5wk4Zarur+nXJ15+MfcBSd32ENRL79M0G1w2wucxaP5RGiAm4
	/jPTEJ2vjfJvP+t6A3tCenziidjT1LiQvsR5D4Uey4/n7XuC40wr/+AkRe6sHYw=
X-Gm-Gg: ASbGncstYUsCmNpJpm9PgKUdiIh6t4WS7bIiyWW1+ML0Zs8EpdYnw6pFL2CWIfGIRw3
	ox92TVTubjwirdPRBOwiOJZlNPPKaBhNtFwDIuoX6BNSTxF1y0l1TGDikFO44+Wa2yE7byheNo0
	AwcesvQ0//330DgsKEyp8TkF5NAwUPRbbnWvCPy54goR0xgW8aATR3iqtHXhI9dndElioaY1jDo
	1UrXpic2ix6kDU6SEVI+pkoD3tScsDbhfMJt9jOhjHS+H0Bdrzg1htIIcMzuYk5jUj9pzM4FXtR
	4Ng=
X-Google-Smtp-Source: AGHT+IHeVwLxgzUTGni4MQz60krtxoZ4J3+b9uU9/F3LHNQd0tBJ5bUOpfHtOBixXZAGyjBE0FlmBg==
X-Received: by 2002:a05:6902:98f:b0:e57:e500:16d with SMTP id 3f1490d57ef6-e5b4629bdc6mr14083846276.39.1739222015377;
        Mon, 10 Feb 2025 13:13:35 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a205e82sm2796103276.23.2025.02.10.13.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:13:34 -0800 (PST)
Date: Mon, 10 Feb 2025 13:13:33 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	"palmer@dabbelt.com Anup Patel" <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6pr_avwH55y_0Zh@ghost>
References: <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com>
 <Z6o1bQLJ8aUyjvrQ@ghost>
 <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com>
 <Z6pnTG7YoiDW_Gkq@ghost>
 <fb67c9e8-0de4-4e11-929a-49d36e81a1a2@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb67c9e8-0de4-4e11-929a-49d36e81a1a2@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131336_724064_4FA20320 
X-CRM114-Status: GOOD (  51.67  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDk6NTc6MjZQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDEwLzAyLzIwMjUgMjE6NTMsIENoYXJsaWUgSmVua2lucyB3cm90
ZToKPiA+IE9uIE1vbiwgRmViIDEwLCAyMDI1IGF0IDA5OjQyOjI1UE0gKzAxMDAsIENsw6ltZW50
IEzDqWdlciB3cm90ZToKPiA+Pgo+ID4+Cj4gPj4gT24gMTAvMDIvMjAyNSAxODoyMCwgQ2hhcmxp
ZSBKZW5raW5zIHdyb3RlOgo+ID4+PiBPbiBNb24sIEZlYiAxMCwgMjAyNSBhdCAwMzoyMDozNFBN
ICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4KPiA+Pj4+IE9uIDEw
LzAyLzIwMjUgMTU6MDYsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+Pj4+PiBPbiBNb24sIEZlYiAx
MCwgMjAyNSBhdCAxMjowNzo0MFBNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPj4+
Pj4+Cj4gPj4+Pj4+Cj4gPj4+Pj4+IE9uIDEwLzAyLzIwMjUgMTE6MTYsIEFudXAgUGF0ZWwgd3Jv
dGU6Cj4gPj4+Pj4+PiBPbiBTYXQsIEZlYiA4LCAyMDI1IGF0IDY6NTPigK9BTSBDaGFybGllIEpl
bmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+
IE9uIEZyaSwgRmViIDA3LCAyMDI1IGF0IDA1OjE5OjQ3UE0gKzAxMDAsIEFuZHJldyBKb25lcyB3
cm90ZToKPiA+Pj4+Pj4+Pj4gUHJvYmluZyB1bmFsaWduZWQgYWNjZXNzZXMgb24gYm9vdCBpcyB0
aW1lIGNvbnN1bWluZy4gUHJvdmlkZSBhCj4gPj4+Pj4+Pj4+IGZ1bmN0aW9uIHdoaWNoIHdpbGwg
YmUgdXNlZCB0byBsb29rIHVwIHRoZSBhY2Nlc3MgdHlwZSBpbiBhIHRhYmxlCj4gPj4+Pj4+Pj4+
IGJ5IGlkIHJlZ2lzdGVycy4gVmVuZG9ycyB3aGljaCBwcm92aWRlIHRhYmxlIGVudHJpZXMgY2Fu
IHRoZW4gc2tpcAo+ID4+Pj4+Pj4+PiB0aGUgcHJvYmluZy4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+
IFRoZSBhY2Nlc3MgY2hlY2tlciBpbiBteSBleHBlcmllbmNlIGlzIG9ubHkgdGltZSBjb25zdW1p
bmcgb24gc2xvdwo+ID4+Pj4+Pj4+IGhhcmR3YXJlLiBIYXJkd2FyZSB0aGF0IHN1cHBvcnRzIGZh
c3QgdW5hbGlnbmVkIGFjY2Vzc2VzIGlzbid0IHJlYWxseQo+ID4+Pj4+Pj4+IGltcGFjdGVkIGJ5
IHRoaXM/IEF2b2lkaW5nIGEgbGlzdCBvZiBoYXJkd2FyZSB0aGF0IGhhcyBzbG93L2Zhc3QKPiA+
Pj4+Pj4+PiB1bmFsaWduZWQgYWNjZXNzZXMgaW4gdGhlIGtlcm5lbCB3YXMgdGhlIG1haW4gcmVh
c29uIGZvciBkeW5hbWljYWxseQo+ID4+Pj4+Pj4+IGNoZWNraW5nLiBXZSBkaWQgaW50cm9kdWNl
IHRoZSBjb25maWcgb3B0aW9uIHRvIGNvbXBpbGUgdGhlIGtlcm5lbCB3aXRoCj4gPj4+Pj4+Pj4g
YXNzdW1lZCBzbG93L2Zhc3QgYWNjZXNzZXMsIHdoaWNoIG9mIGNvdXJzZSBoYXMgdGhlIGRvd25z
aWRlIG9mCj4gPj4+Pj4+Pj4gcmVjb21waWxpbmcgdGhlIGtlcm5lbCBhbmQgSSBhc3N1bWUgdGhh
dCB5b3UgYWxyZWFkeSBjb25zaWRlcmVkIHRoYXQuCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gVGhlIGtj
b25maWcgb3B0aW9uIGRvZXMgbm90IGFsaWduIHdpdGggdGhlIHZpc2lvbiBvZiBydW5uaW5nIHRo
ZSBzYW1lCj4gPj4+Pj4+PiBrZXJuZWwgaW1hZ2UgYWNyb3NzIHBsYXRmb3Jtcy4KPiA+Pj4+Pj4K
PiA+Pj4+Pj4gSSdkIHdvdWxkIGJlIGFkdm9jYXRpbmcgdG8gcmVtb3ZlIGNvbXBpbGUgdGltZSBv
cHRpb25zIGFzIHdlbGwgYW5kIHVzZQo+ID4+Pj4+PiBhbm90aGVyIHdheSB0byBza2lwIHRoZSBw
cm9iZSAoc2VlIGJlbG93KS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+
PiBJbnN0ZWFkIG9mIGhhdmluZyBhIHRhYmxlIGluIHRoZSBrZXJuZWwsIHNvbWV0aGluZyB0aGF0
IHdvdWxkIGJlIG1vcmUKPiA+Pj4+Pj4+PiBwbGF0Zm9ybSBhZ25vc3RpYyB3b3VsZCBiZSB0byBo
YXZlIGFuIGV4dGVuc2lvbiB0aGF0IHNpZ25hbHMgdGhpcwo+ID4+Pj4+Pj4+IGluZm9ybWF0aW9u
LiBUaGF0IHNlZW1zIGxpa2UgaXQgd291bGQgYWNjb21wbGlzaCB0aGUgc2FtZSBnb2FsIGFuZAo+
ID4+Pj4+Pj4+IGxldmVyYWdlIHRoZSBleGlzdGluZyBpbmZyYXN0cnVjdHVyZSBpbiB0aGUga2Vy
bmVsLCBhbGJlaXQgd2l0aCB0aGUgbmVlZAo+ID4+Pj4+Pj4+IHRvIG1ha2UgYSBuZXcgZXh0ZW5z
aW9uLgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSU1PLCBleHBlY3RpbmcgYW4gSVNB
IGV4dGVuc2lvbiB0byBiZSBkZWZpbmVkIGZvciBhbGwgcG9zc2libGUKPiA+Pj4+Pj4+IG1pY3Jv
YXJjaGl0ZWN0dXJhbCBjaG9pY2VzIGlzIG5vdCBnb2luZyB0byBzY2FsZSBzbyBpdCBpcyBiZXR0
ZXIKPiA+Pj4+Pj4+IHRvIGhhdmUgaW5mcmFzdHJ1Y3R1cmUgaW4ga2VybmVsIGl0c2VsZiB0byBp
bmZlciBtaWNyb2FyY2hpdGVjdHVyYWwKPiA+Pj4+Pj4+IGNob2ljZXMgYmFzZWQgb24gUklTQy1W
IGltcGxlbWVudGF0aW9uIElELgo+ID4+Pj4+Pgo+ID4+Pj4+PiBTaW5jZSBhZGRpbmcgYW4gZXh0
ZW5zaW9uIHNlZW1zIHF1aXRlIHVubGlrZWx5LCBhbmQgdGhhdCBhIGRldmljZS10cmVlCj4gPj4+
Pj4+IHByb3BlcnR5IGlzIGxpa2VseSBEVCBjZW50cmljIGFuZCBub3QgYXBwbGljYWJsZSB0byBB
Q1BJIGFzIHdlbGwsIHdhcyBhCj4gPj4+Pj4+IGNvbW1hbmQgbGluZSBhcmd1bWVudCBjb25zaWRl
cmVkID8KPiA+Pj4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IEkgZGlkIGNvbnNpZGVyIGFkZGluZyBhIGNv
bW1hbmQgbGluZSBvcHRpb24gaW4gYWRkaXRpb24gdG8gdGhlIHRhYmxlLAo+ID4+Pj4+IGFsbG93
aW5nIHBsYXRmb3JtcyB3aGljaCBuZWl0aGVyIGhhdmUgYSB0YWJsZSBlbnRyeSBbeWV0XSBub3Ig
d2FudCB0byBkbwo+ID4+Pj4+IHRoZSBzcGVlZCB0ZXN0LCB0byBzZXQgd2hhdGV2ZXIgdGhleSBs
aWtlLiBJbiB0aGUgZW5kLCBJIGRyb3BwZWQgaXQsIHNpbmNlCj4gPj4+Pj4gSSBkb24ndCBoYXZl
IGEgdXNlIGNhc2UgYXQgdGhpcyB0aW1lLiBIb3dldmVyLCBpZiB3ZSByZWFsbHkgZG9uJ3Qgd2Fu
dCBhCj4gPj4+Pj4gdGFibGUsIHRoZW4gSSBjYW4gbG9vayBpbnRvIHRoZSBjb21tYW5kIGxpbmUg
b3B0aW9uIGluc3RlYWQuCj4gPj4+Pgo+ID4+Pj4gU29ycnkgaWYgSSB3YXNuJ3QgY2xlYXIsIEkg
d2Fzbid0IGNvbnNpZGVyaW5nIHRoaXMgYXMgYSByZXBsYWNlbWVudCBmb3IKPiA+Pj4+IHlvdXIg
dGFibGUgYnV0IHJhdGhlciBhcyBhIHJlcGxhY2VtZW50IHRvIENoYXJsaWUncyBjb21waWxlIHRp
bWUgZGVmaW5lCj4gPj4+PiB0byBza2lwIG1pc2FsaWduZWQgc3BlZWQgcHJvYmluZyBzaW5jZSBp
dCBpcyBsaWtlICJscGo9PHg+Ii4gWW91IGNhbgo+ID4+Pj4gc3BlY2lmeSBpdCBvbiBjb21tYW5k
IGxpbmUgaWYgeW91IHdhbnQgdG8gc2tpcCB0aGUgbG9vcCB0aW1lIGRldGVjdGlvbgo+ID4+Pj4g
b2YgbG9vcHMgcGVyIGppZmZpZXMgYW5kIGhhdmUgZmFzdGVyIGJvb3QuCj4gPj4+Cj4gPj4+IEpl
c3NlIHNlbnQgb3V0IGEgcGF0Y2ggZm9yIGEga2VybmVsIHBhcmFtZXRlciB0byBzZXQgdGhlIGFj
Y2VzcyBzcGVlZCB0bwo+ID4+PiB3aGF0ZXZlciBpcyBkZXNpcmVkIFsxXS4KPiA+Pgo+ID4+IEhl
eSBDaGFybGllLAo+ID4+Cj4gPj4gVGhhbmtzIGJ1dCBpdCBzZWVtcyB5b3UgZm9yZ290IHRvIGFk
ZCB0aGUgbGluayA/Cj4gPiAKPiA+IE9vcHMsIEkgZnJlcXVlbnRseSBkbyB0aGF0Li4uCj4gPiAK
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwODA1MTczODE2LjM3
MjIwMDItMS1qZXNzZUByaXZvc2luYy5jb20vCj4gPiAKPiA+Pgo+ID4+IEhhdmluZyBjb25maWd1
cmF0aW9uIG9wdGlvbiArIGNvbW1hbmQgbGluZSBvcHRpb24gc2VlbXMgbGlrZSBzb21ldGhpbmcK
PiA+PiBwYXJ0aWN1bGFybHkgaGVhdnkgZm9yIHN1Y2ggZmVhdHVyZS4gVGhlIGlmZGVmZXJ5L2Nv
bmZpZyBvcHRpb25zCj4gPj4gaW52b2x2ZWQgaW4gdGhlIG1pc2FsaWduZWQgcHJvYmluZyBjb2Rl
IGlzIGFscmVhZHkgcXVpdGUgY29tcGxpY2F0ZWQuIElmCj4gPj4gYW5vdGhlciBtZWFuIHRvIHNw
ZWNpZnkgdGhlIG1pc2FsaWduZWQgc3BlZWQgYWNjZXNzIGlzIGFkZGVkLCBJIHRoaW5rCj4gPj4g
YWxsIGNvbmZpZ3VyYXRpb24gb3B0aW9ucyB0byBzZXQgdGhlIHNwZWVkIG9mIGFjY2Vzc2VzIGNh
biB0aGVuIGJlCj4gPj4gcmVtb3ZlZCBhbmQganVzdCBrZWVwIHRoZSBjb21tYW5kIGxpbmUuIFRo
YXQgd2lsbCBjZXJ0YWlubHkgc2ltcGxpZnkgdGhlCj4gPj4gaWZkZWYvY29uZmlnIG9wdGlvbnMu
Cj4gPiAKPiA+IFllYWggdGhhdCdzIHdoeSBpdCBkaWRuJ3QgZ2V0IG1lcmdlZCBiZWNhdXNlIGl0
IGZlbHQgbGlrZSBvdmVya2lsbC4gSQo+ID4gcmVzcG9uZGVkIG9uIHRoZSB0aHJlYWQgdG8gQW51
cCBhcyB3aHkgSSB3b3VsZCBwcmVmZXIgY29uZmlnIG9wdGlvbnMuIEl0Cj4gPiBqdXN0IGNvbWVz
IGRvd24gdG8gY29uZmlnIG9wdGlvbnMgYmVpbmcgcmVxdWlyZWQgdG8gZW5hYmxlIGNvbXBpbGVy
Cj4gPiBmZWF0dXJlcy4gVGhlIGtlcm5lbCBpcyBvbmx5IGJ1aWx0IHdpdGggcnY2NGdjIGFuZCB1
c2FnZSBvZiBhbGwgb3RoZXIKPiA+IGV4dGVuc2lvbnMgcmVxdWlyZXMgaGFuZCB3cml0dGVuIGFz
c2VtYmx5LiBUaGVyZSBhcmUgZWFzeSBwZXJmb3JtYW5jZQo+ID4gZ2FpbnMgd2hlbiBjb21waWxp
bmcgdGhlIGtlcm5lbCB3aXRoIHJ2NjRnY196YmFfemJiX3pia2IgZXRjLgo+ID4gUGVyZm9ybWFu
Y2UgZm9jdXNlZCBrZXJuZWxzIHdpbGwgbmVlZCB0byBiZSByZWNvbXBpbGVkIGFueXdheSBzbyBJ
IGFtIG9mCj4gPiB0aGUgb3BpbmlvbiB0aGF0IGdyb3VwaW5nIGluIG90aGVyIHBlcmZvcm1hbmNl
IGZlYXR1cmVzIGFzIGNvbmZpZwo+ID4gb3B0aW9ucyBsaWtlIHRoaXMgaXMgdGhlIGVhc2llc3Qg
dGhpbmcgdG8gZG8gYW5kIHJlZHVjZXMgdGhlIGFtb3VudCBvZgo+ID4gY29kZSBpbiB0aGUga2Vy
bmVsLgo+IAo+IEFzIGFuc3dlcmVkIG9uIHRoZSBvdGhlciB0aHJlYWQsIHRvdGFsbHkgYWdyZWUs
IGV4Y2VwdCBmb3IgdGhlCj4gbWlzYWxpZ25lZCBhY2Nlc3NlcyBwcm9iaW5nIGNvbmZpZyBvcHRp
b25zIDspLgoKT2ghIEkgaGF2ZSBtaXNzZWQgdGhhdCByZXNwb25zZSwgd2hlcmUgaXMgdGhhdD8K
Cj4gVWx0aW1hdGVseSwgd2UgbmVlZAo+IHByb2ZpbGVzIGNvbmZpZ3VyYXRpb24sIGVpdGhlciB2
aWEgZGVmY29uZmlncyB0aGF0IGVuYWJsZXMgYSBidW5jaCBvZgo+IG9wdGltaXphdGlvbiB2aWEg
SVNBIGV4dGVuc2lvbiBvciBjb25maWd1cmF0aW9uIG9wdGlvbnMgdGhhdCBncm91cHMKPiB0aGVz
ZSBjb25maWcgb3B0aW9ucy4KCldoeSBkbyB5b3UgYWdyZWUgd2l0aCBwcm9maWxlIGNvbmZpZ3Mg
Zm9yIG90aGVyIHRoaW5ncyBidXQgbm90IGZvcgptaXNhbGlnbmVkIGFjY2VzcyBwcm9iaW5nPwoK
PiAKPiBDbMOpbWVudAo+IAo+ID4gCj4gPiAtIENoYXJsaWUKPiA+IAo+ID4+Cj4gPj4gQ2zDqW1l
bnQKPiA+Pgo+ID4+Pgo+ID4+PiAtIENoYXJsaWUKPiA+Pj4KPiA+Pj4+IC19Cj4gPj4+PiAtI2Vs
c2UgLyogQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9BQ0NFU1MgKi8KPiA+Pj4+IC1zdGF0
aWMgdm9pZCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2b2lk
KQo+ID4+Pj4gLXsKPiA+Pj4+IC19Cj4gPj4+PiAtI2VuZGlmCj4gPj4+PiAtCj4gPj4+PiAgI2lm
ZGVmIENPTkZJR19SSVNDVl9QUk9CRV9WRUNUT1JfVU5BTElHTkVEX0FDQ0VTUwo+ID4+Pj4gIHN0
YXRpYyB2b2lkIGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yayBfX2Fsd2F5c191bnVzZWQpCj4gPj4+PiAgewo+ID4+Pj4gQEAgLTM3MCw2ICszODAs
MTEgQEAgc3RhdGljIGludCBfX2luaXQgdmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRf
YWxsX2NwdXModm9pZCAqdW51c2VkIF9fYWx3YXkKPiA+Pj4+ICB9Cj4gPj4+PiAgI2VuZGlmCj4g
Pj4+PiAgCj4gPj4+PiArc3RhdGljIGJvb2wgY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3Nf
dGFibGUodm9pZCkKPiA+Pj4+ICt7Cj4gPj4+PiArCXJldHVybiBmYWxzZTsKPiA+Pj4+ICt9Cj4g
Pj4+PiArCj4gPj4+PiAgc3RhdGljIGludCByaXNjdl9vbmxpbmVfY3B1X3ZlYyh1bnNpZ25lZCBp
bnQgY3B1KQo+ID4+Pj4gIHsKPiA+Pj4+ICAJaWYgKCFoYXNfdmVjdG9yKCkpIHsKPiA+Pj4+IEBA
IC0zNzcsNiArMzkyLDkgQEAgc3RhdGljIGludCByaXNjdl9vbmxpbmVfY3B1X3ZlYyh1bnNpZ25l
ZCBpbnQgY3B1KQo+ID4+Pj4gIAkJcmV0dXJuIDA7Cj4gPj4+PiAgCX0KPiA+Pj4+ICAKPiA+Pj4+
ICsJaWYgKGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX3RhYmxlKCkpCj4gPj4+PiArCQly
ZXR1cm4gMDsKPiA+Pj4+ICsKPiA+Pj4+ICAjaWZkZWYgQ09ORklHX1JJU0NWX1BST0JFX1ZFQ1RP
Ul9VTkFMSUdORURfQUNDRVNTCj4gPj4+PiAgCWlmIChwZXJfY3B1KHZlY3Rvcl9taXNhbGlnbmVk
X2FjY2VzcywgY3B1KSAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1VOS05PV04p
Cj4gPj4+PiAgCQlyZXR1cm4gMDsKPiA+Pj4+IEBAIC0zOTIsMTMgKzQxMCwxNSBAQCBzdGF0aWMg
aW50IF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKHZvaWQpCj4gPj4+PiAg
ewo+ID4+Pj4gIAlpbnQgY3B1Owo+ID4+Pj4gIAo+ID4+Pj4gLQlpZiAoIWNoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKSkKPiA+Pj4+ICsJaWYgKCFjaGVja191bmFsaWdu
ZWRfYWNjZXNzX3RhYmxlKCkgJiYKPiA+Pj4+ICsJICAgICFjaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkX2FsbF9jcHVzKCkpCj4gPj4+PiAgCQljaGVja191bmFsaWduZWRfYWNjZXNzX3Nw
ZWVkX2FsbF9jcHVzKCk7Cj4gPj4+PiAgCj4gPj4+PiAgCWlmICghaGFzX3ZlY3RvcigpKSB7Cj4g
Pj4+PiAgCQlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKPiA+Pj4+ICAJCQlwZXJfY3B1KHZlY3Rv
cl9taXNhbGlnbmVkX2FjY2VzcywgY3B1KSA9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9WRUNU
T1JfVU5TVVBQT1JURUQ7Cj4gPj4+PiAtCX0gZWxzZSBpZiAoIWNoZWNrX3ZlY3Rvcl91bmFsaWdu
ZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKCkgJiYKPiA+Pj4+ICsJfSBlbHNlIGlmICghY2hl
Y2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfdGFibGUoKSAmJgo+ID4+Pj4gKwkJICAgIWNoZWNr
X3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKCkgJiYKPiA+Pj4+ICAJ
CSAgIElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX1BST0JFX1ZFQ1RPUl9VTkFMSUdORURfQUNDRVNT
KSkgewo+ID4+Pj4gIAkJa3RocmVhZF9ydW4odmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3Bl
ZWRfYWxsX2NwdXMsCj4gPj4+PiAgCQkJICAgIE5VTEwsICJ2ZWNfY2hlY2tfdW5hbGlnbmVkX2Fj
Y2Vzc19zcGVlZF9hbGxfY3B1cyIpOwo+ID4+Pgo+ID4+Pj4KPiA+Pj4+IFJlZ2FyZGluZyB5b3Vy
IHRhYmxlLCBpdCBmZWVscyBsaWtlIGEgYml0IGdvaW5nIGJhY2sgdG8gb2xkIGhhcmRjb2RlZAo+
ID4+Pj4gcGxhdGZvcm0gZGVzY3JpcHRpb24gOykuIEkgdGhpbmsgc29tZSBraW5kIG9mIGF1dG8t
ZGV0ZWN0aW9uIG9mIHNwZWVkCj4gPj4+PiAobm90IGJ1aWx0aW4gdGhlIGtlcm5lbCkgZm9yIHBs
YXRmb3JtcyBjb3VsZCBiZSBnb29kIGFzIHdlbGwgdG8gc2tpcAo+ID4+Pj4gcHJvYmluZy4KPiA+
Pj4+Cj4gPj4+PiBBIERUIHByb3BlcnR5IGFsc28gc2VlbXMgb2sgdG8gbWUgc2luY2UgdGhlIGdv
YWwgaXMgdG8gZGVzY3JpYmUKPiA+Pj4+IGhhcmR3YXJlLiBXb3VsZCBhIGNvbW1vbiBEVC9BQ1BJ
IHByb3BlcnR5IGJlIGFwcHJvcHJpYXRlID8gVGhlCj4gPj4+PiBkZXZpY2VfcHJvcGVydHkgQVBJ
IHVuaWZpZWQgYm90aCBzbyBpZiB3ZSB1c2VkIHNvbWUgY29tbW9uIHByb3BlcnR5IHRvCj4gPj4+
PiBkZXNjcmliZSB0aGUgbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgKGJvdGggaW4gRFQgY3B1IG5v
ZGUvIEFDUEkgQ1BVCj4gPj4+PiBkZXZpY2UgcGFja2FnZSksIHdlIGNvdWxkIGtlZXAgYSBzaW5n
bGUgcGFyc2luZyBtZXRob2QuIEJ1dCBJJ20gbm8gQUNQSQo+ID4+Pj4gZXhwZXJ0IHNvIEkgZG9u
J3Qga25vdyBpZiB0aGF0IHJlYWxseSBtYWtlIHNlbnNlLgo+ID4+Pj4KPiA+Pj4+IFRoYW5rcywK
PiA+Pj4+Cj4gPj4+PiBDbMOpbWVudAo+ID4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IFRoYW5rcywKPiA+
Pj4+PiBkcmV3Cj4gPj4+Pgo+ID4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
