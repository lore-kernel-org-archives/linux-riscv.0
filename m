Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BE1D43369
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 03:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvxrhBRJ+EnZP0PlLAzJypVvYXqGG1aCk8Ub51txZBU=; b=B85Dy9rJYxlDP4
	dOLSKe2GvW+7H4MZA+N2yfE/PtSxBICcDTEutDQIBlYnOq06fM0VH3xq1QkdNYITp7iIfzz08fAfj
	+Pxd3gvFpf/H+7pKz1ycPQM43gRGG2Gg7GPFy05MN0VSrNgg+9KQz222SJZ7M9MnE/mV/Jye95LmE
	bGd3OaRJ1GVufTg9C9O8REofPgZu3JTE0NYQ/tDncVjvHHUQMSmjZ+IIOvyYlYCAgB9mS74VmpskX
	hVjvdYDrxHMn8j/5LcDf8aZ/4HV06Mzml86GJO0bscLwZm/oeawA2Iqeqd+i9bHt782SVCZXYvjF6
	IzSPR+NNRTQOYruo9Orw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtXd-0000000HaA7-3zD3;
	Fri, 12 Dec 2025 03:10:01 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtXZ-0000000Ha8P-3Bte
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 03:10:00 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6597cf49101so476845eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Dec 2025 19:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765508992; x=1766113792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htlgSQTH253RGZOf4q7z2W7H7mWQ7XMZ2k1zpUcQBpY=;
        b=gggkSJskDd+yHwU3cNOF5KPy+6uv1CO/iIfVNT3CI7Y8RhRm3vdZH9PuFanyBH2mf6
         8TB/bgCDUPMJCRFWbicvTjHMA+xlXujys6Xw0Gt9riRdoT9/+WZ1u8s7AeL7fcJHXhEz
         LNQ48XzRt/CX9HYVIwBo92dkUHu6jxq+7weF8rx53W2wN0zKJwpSdYstNR/cv6tTMCml
         Zz3QnCF6uOjDi6oPa3t01riFElM94hhtkYxvS4o2tl8OPWgXMIgxM/FbpSuOmSWzaWQo
         Rxfu6FEQDj3gUIuNHdl3vJ0Rh+piStjGFqW16+dE7QWqokZ5i1U+P50pF1qZ8+hgwExf
         3oAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765508992; x=1766113792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htlgSQTH253RGZOf4q7z2W7H7mWQ7XMZ2k1zpUcQBpY=;
        b=DdtcdT34uQ6ON9MJrP/supC8UsZoY71/77DvSUa+tpHGzJfN19HpWCny7yfG68jhYT
         L2x24RQo3AXsqFisrg9QgmX66g0xkOuC9kqQ+OAwaZmOlkXCHCOEAU3yR8QgjldgpofR
         c4spDwlJUkoCxf0j8tdtWFGOoBtXAanp8cTmIwaQIp62NEskh+cC93Rvh8SB6yVcTS0x
         QL443d4Q5zZGVplNlStq+tIMOJGiCFnsp1k7yxzspJr2zLYx8RICgXd/lEkw67DVFPAb
         QoWOXmVhJ8TkwNBSMiv4m3oTpkDMg40ZpUOE4kxfxubPeHnOR44xjxa6w0Y7ac7lu8/U
         aOEg==
X-Forwarded-Encrypted: i=1; AJvYcCXNXB1PgtcETeKAItDVgJvC+6oEu8AbXFs9eo3z6KfRspa1gZDxNLxA26kKL9reuxw4KQl8QAVRpRWkkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1kjyJm5IQYbf1atu/0NSSmtpdJeBkJ2iXXfewyYi7lPHah3EM
	bc95QYo7tazt/zOF3Yf+NqlMfJjUyUHBz3a0Mp2pVdcUU2D5iaVjNGXKEOHICKmHcTA1UdBzi2I
	wv2rdIjYXcJ9RbdmDH+lU8D9z2gBtBhiqdnyuFYPLLQ==
X-Gm-Gg: AY/fxX49fyXrp0cBhYA17vn2zHOcnZKmoeIJ3XeVhHMvD9Y9zQ3Bx01Bwd0LD631FBF
	ank/MNFbhkwbdavggMZ1BnkzogLGW0T+o1/58YOzhhQPSBBmARpV4zPTZUfyESApEWeQrGbNBFt
	o5zVwQnwU2FEx8bkm6LY0OM42W2oyuwM+mmxfh96j2rmULknZcbBwJgx0o8QkxtK7mwXQT3ogId
	Q2/EISoBki0v1UFJVOwaNdi5B/eVtQgNoPVlecauRBzLHbzclHNlEgPohSE4TiDud/tUz7KUw==
X-Google-Smtp-Source: AGHT+IFVkrMw+28f7TODH4JvGZsNBLmGs+M2MEYxCg+3VtEPM0ROFv0R1vaHJEkPE4yan/fqdRQg74XhYgNULD2II7M=
X-Received: by 2002:a05:6820:a05:b0:659:9a49:8eab with SMTP id
 006d021491bc7-65b4523b519mr283704eaf.47.1765508992017; Thu, 11 Dec 2025
 19:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com> <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
 <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com>
 <DEPGLFUVHA0O.XSZVD2T1ENLD@ventanamicro.com> <CAEEQ3wngwxjiytt7g6XY0bC1PL4A1NEmirML7FiqXMA4_K0irw@mail.gmail.com>
 <DEULRAM55E2G.1464D4JSWL3SZ@ventanamicro.com>
In-Reply-To: <DEULRAM55E2G.1464D4JSWL3SZ@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 12 Dec 2025 11:09:40 +0800
X-Gm-Features: AQt7F2r04q4KyXTdxf6PPEz-PTJYjAYHJDLZcMkvacVGv4tRIIhxTLFECsm6mkU
Message-ID: <CAEEQ3wmEVVHC=S795dFsQ9iM5Xkz-KOBe_CxXbvzyDBUo3wU6A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, luxu.kernel@bytedance.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	jassisinghbrar@gmail.com, conor.dooley@microchip.com, 
	valentina.fernandezalanis@microchip.com, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org, 
	arnd@arndb.de, kees@kernel.org, tglx@linutronix.de, viresh.kumar@linaro.org, 
	boqun.feng@gmail.com, linux-arm-kernel@lists.infradead.org, 
	cleger@rivosinc.com, atishp@rivosinc.com, ajones@ventanamicro.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_190958_146469_ADC96B21 
X-CRM114-Status: GOOD (  30.31  )
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

SGkgUmFkaW0sCgpPbiBXZWQsIERlYyAxMCwgMjAyNSBhdCAxMDoyMuKAr1BNIFJhZGltIEtyxI1t
w6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMTItMDhUMTk6
NDA6MzkrMDg6MDAsIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPjoKPiA+IEhp
IFJhZGltLAo+ID4KPiA+IE9uIFRodSwgRGVjIDQsIDIwMjUgYXQgOToxNuKAr1BNIFJhZGltIEty
xI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Pgo+ID4+IDIwMjUt
MTItMDRUMTM6Mjg6NDUrMDg6MDAsIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29t
PjoKPiA+PiA+IEhpIFJhZGltLAo+ID4+ID4KPiA+PiA+IE9uIFRodSwgRGVjIDQsIDIwMjUgYXQg
MTI6MDfigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3Jv
dGU6Cj4gPj4gPj4KPiA+PiA+PiAyMDI1LTExLTI3VDIwOjUzOjAyKzA4OjAwLCBZdW5odWkgQ3Vp
IDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT46Cj4gPj4gPj4gPiBVc2UgTk1JIGluc3RlYWQgb2Yg
SVBJIGZvciBDUFUgc3RvcCBpZiBSSVNDLVYgU1NFIE5NSSBpcyBzdXBwb3J0ZWQuCj4gPj4gPj4g
Pgo+ID4+ID4+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Cj4gPj4gPj4gPiAtLS0KPiA+PiA+PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13
YXJlL3Jpc2N2L3Jpc2N2X3NzZV9ubWkuYyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvcmlzY3Zf
c3NlX25taS5jCj4gPj4gPj4gPiBAQCAtNTgsNiArNTgsNyBAQCBzdGF0aWMgaW50IGxvY2FsX25t
aV9oYW5kbGVyKHUzMiBldnQsIHZvaWQgKmFyZywgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPj4g
Pj4gPiAgICAgICB0eXBlID0gYXRvbWljX3JlYWQodGhpc19jcHVfcHRyKCZsb2NhbF9ubWkpKTsK
PiA+PiA+PiA+Cj4gPj4gPj4gPiAgICAgICBOTUlfSEFORExFKExPQ0FMX05NSV9DUkFTSCwgY3B1
X2NyYXNoX3N0b3AsIGNwdSwgcmVncyk7Cj4gPj4gPj4gPiArICAgICBOTUlfSEFORExFKExPQ0FM
X05NSV9TVE9QLCBjcHVfc3RvcCk7Cj4gPj4gPj4KPiA+PiA+PiBQbGVhc2UgZG9jdW1lbnQgdGhl
IGludGVuZGVkIHByZWVtcHRpb24gZGVzaWduIGZvciBhbGwgU1NFIGV2ZW50cywKPiA+PiA+PiBi
ZWNhdXNlIGl0IHdpbGwgYmUgYSBuaWdodG1hcmUgaWYgd2UgZm9yZ2V0IHNvbWUgYXNzdW1wdGlv
bnMgaW4gdGhlCj4gPj4gPj4gY29taW5nIHllYXJzLiAgKFRoYXQgaW5jbHVkZXMgdGhlIHJlbGF0
aXZlIHByaW9yaXRpZXMgb2YgUkFTL1BNVS8uLi4pCj4gPj4gPgo+ID4+ID4gQWN0dWFsbHksIExP
Q0FMX05NSV9DUkFTSCwgTE9DQUxfTk1JX1NUT1AsIExPQ0FMX05NSV9CQUNLVFJBQ0UsCj4gPj4g
PiBMT0NBTF9OTUlfS0dEQiwgLi4uIGFyZSBhbGwgaW1wbGVtZW50ZWQgdmlhIHRoZSBzaW5nbGUg
U1NFIGV2ZW50Cj4gPj4gPiBTQklfU1NFX0VWRU5UX0xPQ0FMX1NPRlRXQVJFX0lOSkVDVEVELiBQ
ZXIgdGhlIFNTRSBkZXNpZ24sIG5vCj4gPj4gPiBwcmVlbXB0aW9uIHdpbGwgb2NjdXIgYW1vbmcg
Q1JBU0gsIFNUT1AsIEJBQ0tUUkFDRSwgYW5kIEtHREIgZXZlbnRzLgo+ID4+Cj4gPj4gVGhhdCBp
cyBob3cgaXQgaXMuICBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IGl0IG11c3QgYmUgbGlrZSB0aGF0
Lgo+ID4+Cj4gPj4gRm9yIGV4YW1wbGU6IFBNVV9PVkVSRkxPVyBoYXMgbG93ZXIgZXZlbnRfaWQg
dGhhbiBTT0ZUV0FSRV9JTkpFQ1RFRCwgc28KPiA+PiBpdCB3aWxsIGN1cnJlbnRseSBpbnRlcnJ1
cHQgTk1JX0NSQVNIIGFzIHRoZXkgYm90aCBoYXZlIHByaW9yaXR5IDAsCj4gPj4gYWx0aG91Z2gg
Tk1JX0NSQVNIIHByb2JhYmx5IHNob3VsZG4ndCBiZSBtYXNrZWQgYnkgYW55dGhpbmcsIGFuZCBz
aG91bGQKPiA+PiBwcmVlbXB0IGV2ZXJ5dGhpbmcuCj4gPj4gTk1JX0JBQ0tUUkFDRSwgb24gdGhl
IG90aGVyIGhhbmQsIHByb2JhYmx5IHNob3VsZG4ndCBoYXZlIHRoYXQgaGlnaAo+ID4+IHByaW9y
aXR5IGFzIHRoZXJlIHNlZW0gbW9yZSBpbXBvcnRhbnQgZXZlbnRzIChlLmcuIFJBUyBhbmQgTk1J
X0NSQVNIKS4KPiA+Pgo+ID4+IFRoZSBpc3N1ZXMgY2FuIGJlIGF2b2lkZWQgYnkgZXZlbnQgcHJp
b3JpdGllcywgbWFza2luZywgb3IgZGVlbWVkIGFzCj4gPj4gbm9uLWlzc3VlLCBidXQgSSB0aGlu
ayBpdCB3b3VsZCBiZSBiZW5lZmljaWFsIHRvIHByb3ZpZGUgc29tZSByZWFzb25pbmcKPiA+PiBi
ZWhpbmQgdGhlIGRlc2lnbiwgYXMgdGhlIGNob2ljZXMgZG9uJ3Qgc2VlbSBvYnZpb3VzIHRvIG1l
Lgo+ID4KPiA+IEluZGVlZCwgaXQgaXMgbmVjZXNzYXJ5IHRvIGNvbnNpZGVyIHRoZSBwcmlvcml0
eSBhbW9uZyBkaWZmZXJlbnQKPiA+IGV2ZW50cy4gU2hvdWxkIGRpZmZlcmVudCBwcmlvcml0aWVz
IGFsc28gYmUgYXNzaWduZWQgdG8gTk1JX0NSQVNILAo+ID4gTk1JX0JBQ0tUUkFDRSwgTk1JX1NU
T1AsIGFuZCBOTUlfS0dEQj8KPgo+IEkgdGhpbmsgaXQgd291bGQgYmUgYmVuZWZpY2lhbCB0byBk
b2N1bWVudCB0aGUgZGVzaXJlZCBiZWhhdmlvciBldmVuIGlmCj4gd2UgY2FuJ3QgKGN1cnJlbnRs
eT8pIGltcGxlbWVudCBpdCwgYmVjYXVzZSBsaWtlIHlvdSBzYWlkLCBTU0UgY2FuJ3QKPiBkaXJl
Y3RseSBleHByZXNzIHRoZSBwcmlvcml0eSB3aGVuIG11bHRpcGxleGluZyBTT0ZUV0FSRV9JTkpF
Q1RFRC4KPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRG8gdGhl
c2Ugb3BlcmF0aW9ucyBuZWVkIHRvIGJlCj4gPiB2aXNpYmxlIHRvIHRoZSBCSU9TPwo+Cj4gQklP
UyBzaG91bGRuJ3QgY2FyZSB3aGF0IGxvd2VyIHByaXZpbGVnZSB3YW50cyB0byBkby4KPiBTQkkg
Y291bGQgZGVmaW5lIG1vcmUgZXZlbnRzIGZvciBzb2Z0d2FyZSB1c2UsIHRob3VnaC4KPgo+ID4g
ICAgICAgICAgICAgICAgICAgICAgQ291bGQgeW91IGtpbmRseSBwcm92aWRlIHNvbWUgZ29vZCBz
dWdnZXN0aW9ucz8KPgo+IEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCBwcmFjdGljZSB0byBleHBs
aWNpdGx5IHNldCBhIHVuaXF1ZSBwcmlvcml0eQo+IHdoZW4gcmVnaXN0ZXJpbmcgU1NFIGV2ZW50
cy4gIE1heWJlIHRocm91Z2ggYSBnbG9iYWwgcHJpb3JpdHkgZW51bSwgYW5kCj4gbWFrZSBzdXJl
IHRoYXQgYWxsIGV2ZW50IHJlZ2lzdHJhdGlvbnMgYXJlIHBhc3NpbmcgYSB2YWx1ZSBmcm9tIHRo
YXQKPiBlbnVtLgoKWWVzLCBlYWNoIGRpc3RpbmN0IGV2ZW50IHNob3VsZCBoYXZlIGEgcHJlc2V0
IHByaW9yaXR5LiBJIG5vdGljZWQgdGhhdApTQklfU1NFX0VWRU5UX0xPQ0FMX1BNVV9PVkVSRkxP
VyBpbiBDbMOpbWVudCdzIHBhdGNoc2V0CihodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NTExMDUwODI2MzkuMzQyOTczLTUtY2xlZ2VyQHJpdm9zaW5jLmNvbS8pCmFsc28gZG9lcyBub3Qg
ZXhwbGljaXRseSBzZXQgYSBwcmlvcml0eS4KQXMgeW91IG1lbnRpb25lZCwgYSAiZ2xvYmFsIHBy
aW9yaXR5IGVudW0iIGlzIHJlcXVpcmVkLiBJIHdpbGwgYWxzbwpyZXNwb25kIHRvIENsw6ltZW50
J3MgZW1haWwuCgo+Cj4gVGhhdCB3b3VsZCBtYWtlIHN1cmUgdGhhdCBkaWZmZXJlbnQgZXZlbnRz
IGludGVyYWN0IGxpa2Ugd2UgZXhwZWN0IHRoZW0KPiB0bywgYnV0IGl0IGRvZXNuJ3Qgc29sdmUg
dGhlIG11bHRpcGxleGluZyBpc3N1ZSBvZiBTT0ZUV0FSRV9JTkpFQ1RFRC4KPgo+IElmIHdlJ3Jl
IGZpbmUgd2l0aCBhbGwgU09GVFdBUkVfSU5KRUNURUQgc3ViLWhhbmRsZXJzIGhhdmluZyB0aGUg
bWF4aW1hbAo+IHByaW9yaXR5IChoaWdoZXIgdGhhbiBSQVMvUE1VL1VOS05PV05fTk1JLy4uLiks
IHRoZW4gd2UgY291bGQgaG9wZSB0aGF0Cj4gbG93ZXIgaW1wb3JhbmNlIGhhbmRsZXJzIChlLmcu
IEJBQ0tUUkFDRSkgd29uJ3QgaGFuZywgc28gdGhlIGhpZ2hlcgo+IGltcG9ydGFuY2UgaGFuZGxl
cnMgKGUuZy4gQ1JBU0gpIHdvdWxkIGV2ZW50dWFsbHkgcnVuLgo+IFdlJ3JlIGRlYWxpbmcgd2l0
aCBsb3ctb2NjdXJyZW5jZSBzY2VuYXJpb3MsIHNvIHRoaXMgbWlnaHQgYmUgImdvb2QKPiBlbm91
Z2ggZm9yIG5vdyIuLi4KCkN1cnJlbnRseSwgeDg2IGFsc28gaGFuZGxlcyBtdWx0aXBsZSBsb2Nh
bCBOTUkgZXZlbnRzLCBpbmNsdWRpbmcKQkFDS1RSQUNFLCB2aWEgYSBzaW5nbGUgTk1JIHZlY3Rv
ci4gV2UgbWlnaHQgYXMgd2VsbCBzZXQgdGhlIHByaW9yaXR5Cm9mIFNPRlRXQVJFX0lOSkVDVEVE
IHRvIHRoZSBoaWdoZXN0LgoKPgo+IFNpdHVhdGlvbiB3b3VsZCBnZXQgc2ltcGxlciBpZiB3ZSBj
b3VsZCBhdm9pZCBzb21lIHN1Yi1oYW5kbGVyczsKPiBhbHRlcm5hdGl2ZWx5LCBpdCB3b3VsZCBn
ZXQgbW9yZSBjb21wbGljYXRlZCBpZiBTT0ZUV0FSRV9JTkpFQ1RFRCBoYWQKPiBsb3dlciBwcmlv
cml0eSB0aGFuIHNvbWUgb3RoZXIgZXZlbnQgLS0gd2UnZCBtYWtlIENSQVNIIHBhcnRpYWxseQo+
IHJlY292ZXIgaXRzIGhpZ2ggcHJpb3JpdHkgaW1hZ2UgYnkgbWFza2luZyBvdGhlciBTU0UgZXZl
bnRzIGR1cmluZyBpdHMKPiBleGVjdXRpb24gKGFuZCB3ZSdkIG5lZWQgd2FyZGluZyBhbXVsZXRz
IGFnYWluc3QgaGFuZ3MgYW5kIHN0YXJ2YXRpb24pLgo+Cj4gVGhhbmtzLgoKVGhhbmtzLApZdW5o
dWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
