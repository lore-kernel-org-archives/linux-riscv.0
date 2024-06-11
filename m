Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4089EC27C65
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 05:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ARYNcibHu2B++p6uKGhH2qMRB3kmog74ooNI76QuKE=; b=vB32Guw/CPT+yq
	Qqzie56Pwb7YXxQbSjpGNWwR5AoUytWt8ULWWOKtMW5SsMWKMiCYLEWvXrpnUbZuRIgFh6gVYttOy
	n20IVolXUIhx5BzACaHNoVsHSI7SbHZLf0lBNcHR7zpNqIDGvOxV7EVPPciAEsqJqsUZ4SevZ6Wxe
	dBNqyaEq/pHLoDWAwkPs+T8CXocIJlCe4nUluoHQYnmk9tiBEnUyA2IliYOX4rFRcEffvqFRfBKa1
	BZL1ze00SGxsNDH2FDUu7J2KGjC3uxs4n4ckIGhTveNd5AQyrqu534i0Mb5nFmew361I3X40bO1Iv
	/5hjVOref94ivtIlreRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGu9h-00000007Xxv-3l8j;
	Tue, 11 Jun 2024 05:34:49 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGu9f-00000007XwG-1DdQ
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 05:34:48 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-62ce4752da4so27036727b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 22:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718084084; x=1718688884; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cotibSR88KSJRDSISnN+uzectoJVXRRFz4iGDTSfjtY=;
        b=YnirNxGHBFDEGmFjkce/87cAr1dd4+ErvwYKPbohac5ZNNaEal9I4zJAZEsLh7dS1X
         BIvmeWns3yGx55sAA7cBvcKTQ4NP5JIT+dl1kS7jnTeHuFrFkRDaJQ0egawSbKxAzL8L
         z4uyC1BIqRqdAV0Dwjj9mZSJg4FFt/L71jjZ2HoTypShCLq0KGRx6pGffNgmz5IxsW0F
         JWDf4j93yA5oS7XUdR+V8UhxgoKGE4eNgBbq37HHvtiKQBm8bU7kHP4DPQYaej+NMxi+
         CIHsauNQSU8t1mU6N3B+tCjNHiB1RBDpCqVejT+k0feIgthoCL71kCvFfFjNLdY1e/kQ
         sYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718084084; x=1718688884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cotibSR88KSJRDSISnN+uzectoJVXRRFz4iGDTSfjtY=;
        b=Qt5A/NalpwgKb9kK2IiDZq1loa1kdsw/05F89KE37HRF+ya0zvyEbprgLAD9pe53nj
         87WoehYPt4sCRIbwf5mhTf0Xxk9Qiw+Crzcj21rmq7IN87q00pSU+sEEYTKjgusFA9nJ
         M7r7G7Ao/5EJFmwaYS2FIzYZOyWHTsugu1iJ9RlLWu+B81NWukSRHoHubaYC6cfMfZ19
         UmvauDyDg1OO8/VlA4w4dNZNMePU1i7a1yEWo/5DhOSkH2xj/qqNJQFzTkt/W75dkk79
         3ez1i/aDZAP03TdlSwRaDaKlDoQiZ3WEvtMfBtgy2YkO9r/12heASUAUlTGaOaWom7eL
         ljVA==
X-Forwarded-Encrypted: i=1; AJvYcCXwJperKX2fjR6sbDW3c5ckBdyWVV0z+uzQMHS6rLIqrhjQQreVCY3d1Ob38Aklil+hvMO1r0a44W/UCnmO/iy4e6XlPCijlIk8HOVDpgeR
X-Gm-Message-State: AOJu0YyTKYKjpnSSGGvhFK2rbv7Pj9uFMJvFcPhAruZ3Hyg7XvHu8k0X
	ZzQQ8yyc+2sT6J7L1nHwIUYprmWMwHSRW2spNLx1ZVBVepznnTYwapEcb9qwEvWKfcT58yprB/1
	1NCooDRH7pJQBWczz5D0VBTZt2HqqGEbwdivZCEylg/74y1f4sys=
X-Google-Smtp-Source: AGHT+IFrvo12EQWYRkJlI/38/OsH77Ne92FxFgTHcxuhUmxYnBkzA+n/nTJVBal2Aef0Wvqa2QUYKpcoXkumR6u+W3c=
X-Received: by 2002:a05:690c:d95:b0:62f:206e:c056 with SMTP id
 00721157ae682-62f206ec3eemr544897b3.5.1718084083681; Mon, 10 Jun 2024
 22:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240530001733.1407654-1-samuel.holland@sifive.com> <20240530001733.1407654-4-samuel.holland@sifive.com>
In-Reply-To: <20240530001733.1407654-4-samuel.holland@sifive.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 11 Jun 2024 13:34:32 +0800
Message-ID: <CABgGipXz77=nyXv9uQ7DKqYH1HkMxxFTbK2qHE202AeXq7Mm-g@mail.gmail.com>
Subject: Re: [PATCH 3/4] riscv: entry: Do not clobber the frame pointer
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Matthew Bystrin <dev.mbstr@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_223447_535740_5FCB52F0 
X-CRM114-Status: GOOD (  21.33  )
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

SGkgU2FtdWVsLAoKT24gVGh1LCBNYXkgMzAsIDIwMjQgYXQgODoxN+KAr0FNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IHMwIGlzIHJlc2VydmVk
IGZvciB0aGUgZnJhbWUgcG9pbnRlciwgc28gaXQgc2hvdWxkIG5vdCBiZSB1c2VkIGFzIGEKPiB0
ZW1wb3JhcnkgcmVnaXN0ZXIuIENsb2JiZXJpbmcgdGhlIGZyYW1lIHBvaW50ZXIgYnJlYWtzIHN0
YWNrIHRyYWNlcy4KPgo+IC0gSW4gaGFuZGxlX2V4Y2VwdGlvbigpIGFuZCByZXRfZnJvbV9leGNl
cHRpb24oKSwgdXNlIGEyIGZvciB0aGUgc2F2ZWQKPiAgIHN0YWNrIHBvaW50ZXIuIGEyIGlzIGNo
b3NlbiBiZWNhdXNlIHIyIGlzIHRoZSBzdGFjayBwb2ludGVyIHJlZ2lzdGVyLgo+IC0gSW4gcmV0
X2Zyb21fZXhjZXB0aW9uKCksIHVzZSBzMSBmb3IgdGhlIHNhdmVkIHN0YXR1cyBDU1IgdmFsdWUu
IEF2b2lkCj4gICBjbG9iYmVyaW5nIHMxIGluIHRoZSBwcml2aWxlZ2UgbW9kZSBjaGVjayBzbyBp
dCBkb2VzIG5vdCBuZWVkIHRvIGJlCj4gICByZWxvYWRlZCBsYXRlciBpbiB0aGUgZnVuY3Rpb24u
Cj4gLSBVc2UgczEgYW5kIHMyIGluIHJldF9mcm9tX2ZvcmsoKSBpbnN0ZWFkIG9mIHMwIGFuZCBz
MS4gVGhlIGVudGlyZQo+ICAgcC0+dGhyZWFkLnMgYXJyYXkgaXMgemVyb2VkIGF0IHRoZSBiZWdp
bm5pbmcgb2YgY29weV90aHJlYWQoKSwgc28gdGhlCj4gICByZWdpc3RlcnMgZG8gbm90IG5lZWQg
dG8gYmUgemVyb2VkIHNlcGFyYXRlbHkgZm9yIGtlcm5lbCB0aHJlYWRzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4K
PiAgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgIHwgMjkgKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIHwgIDUgKystLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50
cnkuUwo+IGluZGV4IGQxM2QxYWFkNzY0OS4uYmQxYzU2MjFkZjQ1IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5T
Cj4gQEAgLTU4LDEzICs1OCwxMyBAQCBTWU1fQ09ERV9TVEFSVChoYW5kbGVfZXhjZXB0aW9uKQo+
ICAgICAgICAgICovCj4gICAgICAgICBsaSB0MCwgU1JfU1VNIHwgU1JfRlNfVlMKPgo+IC0gICAg
ICAgUkVHX0wgczAsIFRBU0tfVElfVVNFUl9TUCh0cCkKPiArICAgICAgIFJFR19MIGEyLCBUQVNL
X1RJX1VTRVJfU1AodHApCj4gICAgICAgICBjc3JyYyBzMSwgQ1NSX1NUQVRVUywgdDAKPiAgICAg
ICAgIGNzcnIgczIsIENTUl9FUEMKPiAgICAgICAgIGNzcnIgczMsIENTUl9UVkFMCj4gICAgICAg
ICBjc3JyIHM0LCBDU1JfQ0FVU0UKPiAgICAgICAgIGNzcnIgczUsIENTUl9TQ1JBVENICj4gLSAg
ICAgICBSRUdfUyBzMCwgUFRfU1Aoc3ApCj4gKyAgICAgICBSRUdfUyBhMiwgUFRfU1Aoc3ApCj4g
ICAgICAgICBSRUdfUyBzMSwgUFRfU1RBVFVTKHNwKQo+ICAgICAgICAgUkVHX1MgczIsIFBUX0VQ
QyhzcCkKPiAgICAgICAgIFJFR19TIHMzLCBQVF9CQURBRERSKHNwKQo+IEBAIC0xMjUsMTkgKzEy
NSwxOSBAQCBTWU1fQ09ERV9TVEFSVF9OT0FMSUdOKHJldF9mcm9tX2V4Y2VwdGlvbikKPiAgICAg
ICAgIGNhbGwgcmlzY3Zfdl9jb250ZXh0X25lc3RpbmdfZW5kCj4gICNlbmRpZgo+Cj4gLSAgICAg
ICBSRUdfTCBzMCwgUFRfU1RBVFVTKHNwKQo+ICsgICAgICAgUkVHX0wgczEsIFBUX1NUQVRVUyhz
cCkKPiAgI2lmZGVmIENPTkZJR19SSVNDVl9NX01PREUKPiAgICAgICAgIC8qIHRoZSBNUFAgdmFs
dWUgaXMgdG9vIGxhcmdlIHRvIGJlIHVzZWQgYXMgYW4gaW1tZWRpYXRlIGFyZyBmb3IgYWRkaSAq
Lwo+ICAgICAgICAgbGkgdDAsIFNSX01QUAo+IC0gICAgICAgYW5kIHMwLCBzMCwgdDAKPiArICAg
ICAgIGFuZCB0MCwgczEsIHQwCj4gICNlbHNlCj4gLSAgICAgICBhbmRpIHMwLCBzMCwgU1JfU1BQ
Cj4gKyAgICAgICBhbmRpIHQwLCBzMSwgU1JfU1BQCj4gICNlbmRpZgo+IC0gICAgICAgYm5leiBz
MCwgMWYKPiArICAgICAgIGJuZXogdDAsIDFmCj4KPiAgICAgICAgIC8qIFNhdmUgdW53b3VuZCBr
ZXJuZWwgc3RhY2sgcG9pbnRlciBpbiB0aHJlYWRfaW5mbyAqLwo+IC0gICAgICAgYWRkaSBzMCwg
c3AsIFBUX1NJWkVfT05fU1RBQ0sKPiAtICAgICAgIFJFR19TIHMwLCBUQVNLX1RJX0tFUk5FTF9T
UCh0cCkKPiArICAgICAgIGFkZGkgdDAsIHNwLCBQVF9TSVpFX09OX1NUQUNLCj4gKyAgICAgICBS
RUdfUyB0MCwgVEFTS19USV9LRVJORUxfU1AodHApCj4KPiAgICAgICAgIC8qIFNhdmUgdGhlIGtl
cm5lbCBzaGFkb3cgY2FsbCBzdGFjayBwb2ludGVyICovCj4gICAgICAgICBzY3Nfc2F2ZV9jdXJy
ZW50Cj4gQEAgLTE0OCw3ICsxNDgsNiBAQCBTWU1fQ09ERV9TVEFSVF9OT0FMSUdOKHJldF9mcm9t
X2V4Y2VwdGlvbikKPiAgICAgICAgICAqLwo+ICAgICAgICAgY3NydyBDU1JfU0NSQVRDSCwgdHAK
PiAgMToKPiAtICAgICAgIFJFR19MIGEwLCBQVF9TVEFUVVMoc3ApCj4gICAgICAgICAvKgo+ICAg
ICAgICAgICogVGhlIGN1cnJlbnQgbG9hZCByZXNlcnZhdGlvbiBpcyBlZmZlY3RpdmVseSBwYXJ0
IG9mIHRoZSBwcm9jZXNzb3Incwo+ICAgICAgICAgICogc3RhdGUsIGluIHRoZSBzZW5zZSB0aGF0
IGxvYWQgcmVzZXJ2YXRpb25zIGNhbm5vdCBiZSBzaGFyZWQgYmV0d2Vlbgo+IEBAIC0xNjksNyAr
MTY4LDcgQEAgU1lNX0NPREVfU1RBUlRfTk9BTElHTihyZXRfZnJvbV9leGNlcHRpb24pCj4gICAg
ICAgICBSRUdfTCAgYTIsIFBUX0VQQyhzcCkKPiAgICAgICAgIFJFR19TQyB4MCwgYTIsIFBUX0VQ
QyhzcCkKPgo+IC0gICAgICAgY3NydyBDU1JfU1RBVFVTLCBhMAo+ICsgICAgICAgY3NydyBDU1Jf
U1RBVFVTLCBzMQo+ICAgICAgICAgY3NydyBDU1JfRVBDLCBhMgo+Cj4gICAgICAgICBSRUdfTCB4
MSwgIFBUX1JBKHNwKQo+IEBAIC0yMDcsMTMgKzIwNiwxMyBAQCBTWU1fQ09ERV9TVEFSVF9MT0NB
TChoYW5kbGVfa2VybmVsX3N0YWNrX292ZXJmbG93KQo+ICAgICAgICAgUkVHX1MgeDUsICBQVF9U
MChzcCkKPiAgICAgICAgIHNhdmVfZnJvbV94Nl90b194MzEKPgo+IC0gICAgICAgUkVHX0wgczAs
IFRBU0tfVElfS0VSTkVMX1NQKHRwKQo+ICsgICAgICAgUkVHX0wgYTIsIFRBU0tfVElfS0VSTkVM
X1NQKHRwKQo+ICAgICAgICAgY3NyciBzMSwgQ1NSX1NUQVRVUwo+ICAgICAgICAgY3NyciBzMiwg
Q1NSX0VQQwo+ICAgICAgICAgY3NyciBzMywgQ1NSX1RWQUwKPiAgICAgICAgIGNzcnIgczQsIENT
Ul9DQVVTRQo+ICAgICAgICAgY3NyciBzNSwgQ1NSX1NDUkFUQ0gKPiAtICAgICAgIFJFR19TIHMw
LCBQVF9TUChzcCkKPiArICAgICAgIFJFR19TIGEyLCBQVF9TUChzcCkKPiAgICAgICAgIFJFR19T
IHMxLCBQVF9TVEFUVVMoc3ApCj4gICAgICAgICBSRUdfUyBzMiwgUFRfRVBDKHNwKQo+ICAgICAg
ICAgUkVHX1MgczMsIFBUX0JBREFERFIoc3ApCj4gQEAgLTIyNywxMCArMjI2LDEwIEBAIEFTTV9O
T0tQUk9CRShoYW5kbGVfa2VybmVsX3N0YWNrX292ZXJmbG93KQo+Cj4gIFNZTV9DT0RFX1NUQVJU
KHJldF9mcm9tX2ZvcmspCj4gICAgICAgICBjYWxsIHNjaGVkdWxlX3RhaWwKPiAtICAgICAgIGJl
cXogczAsIDFmICAgICAvKiBub3QgZnJvbSBrZXJuZWwgdGhyZWFkICovCj4gKyAgICAgICBiZXF6
IHMxLCAxZiAgICAgLyogbm90IGZyb20ga2VybmVsIHRocmVhZCAqLwo+ICAgICAgICAgLyogQ2Fs
bCBmbihhcmcpICovCj4gLSAgICAgICBtb3ZlIGEwLCBzMQo+IC0gICAgICAgamFsciBzMAo+ICsg
ICAgICAgbW92ZSBhMCwgczIKPiArICAgICAgIGphbHIgczEKPiAgMToKPiAgICAgICAgIG1vdmUg
YTAsIHNwIC8qIHB0X3JlZ3MgKi8KPiAgICAgICAgIGxhIHJhLCByZXRfZnJvbV9leGNlcHRpb24K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvcHJvY2Vzcy5jCj4gaW5kZXggZTRiYzYxYzRlNThhLi41NTEyYzMxZTEyNTYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvcHJvY2Vzcy5jCj4gQEAgLTIwOCw4ICsyMDgsOCBAQCBpbnQgY29weV90aHJlYWQoc3Ry
dWN0IHRhc2tfc3RydWN0ICpwLCBjb25zdCBzdHJ1Y3Qga2VybmVsX2Nsb25lX2FyZ3MgKmFyZ3Mp
Cj4gICAgICAgICAgICAgICAgIC8qIFN1cGVydmlzb3IvTWFjaGluZSwgaXJxcyBvbjogKi8KPiAg
ICAgICAgICAgICAgICAgY2hpbGRyZWdzLT5zdGF0dXMgPSBTUl9QUCB8IFNSX1BJRTsKPgo+IC0g
ICAgICAgICAgICAgICBwLT50aHJlYWQuc1swXSA9ICh1bnNpZ25lZCBsb25nKWFyZ3MtPmZuOwo+
IC0gICAgICAgICAgICAgICBwLT50aHJlYWQuc1sxXSA9ICh1bnNpZ25lZCBsb25nKWFyZ3MtPmZu
X2FyZzsKPiArICAgICAgICAgICAgICAgcC0+dGhyZWFkLnNbMV0gPSAodW5zaWduZWQgbG9uZylh
cmdzLT5mbjsKPiArICAgICAgICAgICAgICAgcC0+dGhyZWFkLnNbMl0gPSAodW5zaWduZWQgbG9u
ZylhcmdzLT5mbl9hcmc7Cj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICAqY2hp
bGRyZWdzID0gKihjdXJyZW50X3B0X3JlZ3MoKSk7Cj4gICAgICAgICAgICAgICAgIC8qIFR1cm4g
b2ZmIHN0YXR1cy5WUyAqLwo+IEBAIC0yMTksNyArMjE5LDYgQEAgaW50IGNvcHlfdGhyZWFkKHN0
cnVjdCB0YXNrX3N0cnVjdCAqcCwgY29uc3Qgc3RydWN0IGtlcm5lbF9jbG9uZV9hcmdzICphcmdz
KQo+ICAgICAgICAgICAgICAgICBpZiAoY2xvbmVfZmxhZ3MgJiBDTE9ORV9TRVRUTFMpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgY2hpbGRyZWdzLT50cCA9IHRsczsKPiAgICAgICAgICAgICAg
ICAgY2hpbGRyZWdzLT5hMCA9IDA7IC8qIFJldHVybiB2YWx1ZSBvZiBmb3JrKCkgKi8KPiAtICAg
ICAgICAgICAgICAgcC0+dGhyZWFkLnNbMF0gPSAwOwo+ICAgICAgICAgfQo+ICAgICAgICAgcC0+
dGhyZWFkLnJpc2N2X3ZfZmxhZ3MgPSAwOwo+ICAgICAgICAgaWYgKGhhc192ZWN0b3IoKSkKPiAt
LQo+IDIuNDQuMQo+CgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNv
bT4KCkNoZWVycywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
