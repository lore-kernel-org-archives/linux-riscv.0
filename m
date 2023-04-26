Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CD3C77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOMjKOvlPm4DLvGw2Vh9bqg/0AJHUP3siz5RoQBkzH4=; b=1DVR53lZFiEboM
	ygUdtphly6V9nP+OhsJGL0Mtao+K/AT7c4sL1Qscvt/AAPLSHmu9AwY3LtjDScq58iJn8NOtFps5F
	71HBYHzcy3YhOybb4kzzu8fafbBHNGnClQbUIpgVGeeW67knmol4ZSPvyBVC8HlwLiuF8kKDG5uUn
	DHPcMJMDs3PxuFAsCAiKI5pdhZuFn2wOs/GDgyHRsywkow57uNVSAU2xquJvM+9BKlJbLeXXGYgOg
	dLmiS8LJTs5RM3XL5YWpWcNozpGWeWqQG54pKzy9xI8HSt7cCVuOgJC3wgnrNcMB5DsX5A0MT6452
	bfzNdlqJhwl3CPyWIdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prf9H-0044Vp-2B;
	Wed, 26 Apr 2023 13:25:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prf9E-0044U8-1p
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 13:25:29 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-2f95231618aso4526404f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682515525; x=1685107525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZR9L391ZZ1i3CUI64HooJraQbWqG1Z0kiKXyYBnLV8=;
        b=IgScv77IOmeBuDg7MO27c+W89ZsJjG2/mQdRspcZALfMHkzKgctDWDadfZGRCOAykh
         v0jw3z8VIZ0Gqe3sPz2uEz5lt5+XltjpPT5eLnqCvpKBTzmtCRSQIfXSvUc9D45aMvR/
         VHieQzz+Oso2FLbDsXtSaSNZN30YL11XQZff6eJc1AgFeVQLGKs2xS65VvYSMpeTRurr
         ecMgRF8OqngVkMDctVMx6acqgrCU/tsRajLc4GrK5aa5tSfIiESlesWdH+Nq1UCChOHJ
         Ly62ZLm/8HzwzvMirHA13DDn2TySBF0ZZa4C1Ir3C3BROkv8CQZu6ev+ncl38fXEJ5tY
         0QBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682515525; x=1685107525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZR9L391ZZ1i3CUI64HooJraQbWqG1Z0kiKXyYBnLV8=;
        b=eY3CaB1hSbBkPKXUjWrKr4certPnzFthfkqN0dZUoBzhHKCsPDEpN033iSlXsur1iK
         Xgvr3Y1fD18FNQGickGA/AYuieaZTf6gY4OEpoMDFOX5g76siCKZ8DELpdBp0GDTlNoK
         4bMBGgNRtydV71lKkR8Tq8UYDXYs9stiG4q+nWh0GHXhjRXVob2JiidNgG9NFhgu7Fz6
         fSY3lbZJz/MyFqCIbbBGjwyO4TT/eGBaT1qHVFtxxEfVyzHZxh6THqui0b+ZFmXmjwMG
         qHevtI8pk3IiR935Wrrkwl28zNjDmULVA01Jet0m7BgMcNtL/lkz0Ye4JL6tX7bTDHI8
         SFKg==
X-Gm-Message-State: AAQBX9fvrZgDAhql1YV6RYvIdGvpBjIZpcEUXbeuwEbi4QQ6sU6Mo2gT
	5mPpLMeFQ/lmhm8XH8NiN1+Uvg==
X-Google-Smtp-Source: AKy350YJruuYODuL8/CSU4Snpl13Z+MCt0qt3NCZ+fLdsBBbjWujOtb6atCud55m6xhicVClJBlw/g==
X-Received: by 2002:adf:e268:0:b0:2f5:9aa2:e5fc with SMTP id bl40-20020adfe268000000b002f59aa2e5fcmr14126507wrb.28.1682515524755;
        Wed, 26 Apr 2023 06:25:24 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id k24-20020a7bc318000000b003f16fc33fbesm18078994wmj.17.2023.04.26.06.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 06:25:24 -0700 (PDT)
Date: Wed, 26 Apr 2023 15:25:23 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] riscv: Enable perf counters user access only through
 perf
Message-ID: <3bwxedsrovutzhlmlnozeuvz4zqnr32kuef2mdzmnbniajh6vb@we6jzlwkfuof>
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <20230413161725.195417-5-alexghiti@rivosinc.com>
 <kwvrls2m6swp443brn27jwcsdhovtc4kxrkqustxpqgf7zqltw@xlhsrndkf4om>
 <CAHVXubh_y9Uw2xsgsQrVZEcb9bCLBLUCo74GOm-czsSawHxk4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubh_y9Uw2xsgsQrVZEcb9bCLBLUCo74GOm-czsSawHxk4g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_062528_606150_DC3907B8 
X-CRM114-Status: GOOD (  31.78  )
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

T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMDM6MTc6MDFQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IE9uIFdlZCwgQXByIDI2LCAyMDIzIGF0IDI6NTfigK9QTSBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEFwciAxMywg
MjAyMyBhdCAwNjoxNzoyNVBNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiA+IFdl
IHVzZWQgdG8gdW5jb25kaXRpb25uYWxseSBleHBvc2UgdGhlIGN5Y2xlIGFuZCBpbnN0cmV0IGNz
cnMgdG8KPiA+ID4gdXNlcnNwYWNlLCB3aGljaCBnaXZlcyByaXNlIHRvIHNlY3VyaXR5IGNvbmNl
cm5zLgo+ID4gPgo+ID4gPiBTbyBvbmx5IGFsbG93IGFjY2VzcyB0byBodyBjb3VudGVycyBmcm9t
IHVzZXJzcGFjZSB0aHJvdWdoIHRoZSBwZXJmCj4gPiA+IGZyYW1ld29yayB3aGljaCB3aWxsIGhh
bmRsZSBjb250ZXh0IHN3aXRjaHMsIHBlci10YXNrIGV2ZW50cy4uLmV0Yy4gQnV0Cj4gPiA+IGFz
IHdlIGNhbm5vdCBicmVhayB1c2Vyc3BhY2UsIHdlIGdpdmUgdGhlIHVzZXIgdGhlIGNob2ljZSB0
byBnbyBiYWNrIHRvCj4gPiA+IHRoZSBwcmV2aW91cyBiZWhhdmlvdXIgYnkgc2V0dGluZyB0aGUg
c3lzY3RsIHBlcmZfdXNlcl9hY2Nlc3MuCj4gPiA+Cj4gPiA+IFdlIGFsc28gaW50cm9kdWNlIGEg
bWVhbnMgdG8gZGlyZWN0bHkgbWFwIHRoZSBoYXJkd2FyZSBjb3VudGVycyB0bwo+ID4gPiB1c2Vy
c3BhY2UsIHRodXMgYXZvaWRpbmcgdGhlIG5lZWQgZm9yIHN5c2NhbGxzIHdoZW5ldmVyIGFuIGFw
cGxpY2F0aW9uCj4gPiA+IHdhbnRzIHRvIGFjY2VzcyBjb3VudGVycyB2YWx1ZXMuCj4gPiA+Cj4g
PiA+IE5vdGUgdGhhdCBhcmNoX3BlcmZfdXBkYXRlX3VzZXJwYWdlIGlzIGEgY29weSBvZiBhcm02
NCBjb2RlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9zeXNjdGwva2VybmVsLnJzdCB8ICAyMyArKystCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BlcmZfZXZlbnQuaCAgICAgICAgIHwgICAzICsKPiA+ID4gIGFyY2gvcmlzY3Yva2Vy
bmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiA+ID4gIGFyY2gvcmlzY3Yv
a2VybmVsL3BlcmZfZXZlbnQuYyAgICAgICAgICAgICAgfCAgNjUgKysrKysrKysrKysKPiA+ID4g
IGRyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYyAgICAgICAgICAgICAgICAgICAgfCAgNDIgKysrKysr
KysKPiA+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMgICAgICAgICAgICAgfCAg
MTcgKysrCj4gPiA+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jICAgICAgICAgICAgICAg
IHwgMTEzICsrKysrKysrKysrKysrKysrKy0tCj4gPiA+ICBpbmNsdWRlL2xpbnV4L3BlcmYvcmlz
Y3ZfcG11LmggICAgICAgICAgICAgIHwgICAzICsKPiA+ID4gIHRvb2xzL2xpYi9wZXJmL21tYXAu
YyAgICAgICAgICAgICAgICAgICAgICAgfCAgNjUgKysrKysrKysrKysKPiA+ID4gIDkgZmlsZXMg
Y2hhbmdlZCwgMzIyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ID4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3BlcmZfZXZlbnQuYwo+ID4gPgo+ID4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdCBi
L0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QKPiA+ID4gaW5kZXgg
NGI3YmZlYTI4Y2Q3Li4wMmIyYTQwYTM2NDcgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdAo+ID4gPiBAQCAtOTQxLDE2ICs5NDEsMzEg
QEAgZW5hYmxlZCwgb3RoZXJ3aXNlIHdyaXRpbmcgdG8gdGhpcyBmaWxlIHdpbGwgcmV0dXJuIGBg
LUVCVVNZYGAuCj4gPiA+ICBUaGUgZGVmYXVsdCB2YWx1ZSBpcyA4Lgo+ID4gPgo+ID4gPgo+ID4g
PiAtcGVyZl91c2VyX2FjY2VzcyAoYXJtNjQgb25seSkKPiA+ID4gLT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQo+ID4gPiArcGVyZl91c2VyX2FjY2VzcyAoYXJtNjQgYW5kIHJpc2N2
IG9ubHkpCj4gPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+
ID4gKwo+ID4gPiArQ29udHJvbHMgdXNlciBzcGFjZSBhY2Nlc3MgZm9yIHJlYWRpbmcgcGVyZiBl
dmVudCBjb3VudGVycy4KPiA+ID4KPiA+ID4gLUNvbnRyb2xzIHVzZXIgc3BhY2UgYWNjZXNzIGZv
ciByZWFkaW5nIHBlcmYgZXZlbnQgY291bnRlcnMuIFdoZW4gc2V0IHRvIDEsCj4gPiA+IC11c2Vy
IHNwYWNlIGNhbiByZWFkIHBlcmZvcm1hbmNlIG1vbml0b3IgY291bnRlciByZWdpc3RlcnMgZGly
ZWN0bHkuCj4gPiA+ICthcm02NAo+ID4gPiArPT09PT0KPiA+ID4KPiA+ID4gIFRoZSBkZWZhdWx0
IHZhbHVlIGlzIDAgKGFjY2VzcyBkaXNhYmxlZCkuCj4gPiA+ICtXaGVuIHNldCB0byAxLCB1c2Vy
IHNwYWNlIGNhbiByZWFkIHBlcmZvcm1hbmNlIG1vbml0b3IgY291bnRlciByZWdpc3RlcnMKPiA+
ID4gK2RpcmVjdGx5Lgo+ID4gPgo+ID4gPiAgU2VlIERvY3VtZW50YXRpb24vYXJtNjQvcGVyZi5y
c3QgZm9yIG1vcmUgaW5mb3JtYXRpb24uCj4gPiA+Cj4gPiA+ICtyaXNjdgo+ID4gPiArPT09PT0K
PiA+ID4gKwo+ID4gPiArV2hlbiBzZXQgdG8gMCwgdXNlciBhY2Nlc3MgaXMgZGlzYWJsZWQuCj4g
PiA+ICsKPiA+ID4gK1doZW4gc2V0IHRvIDEsIHVzZXIgc3BhY2UgY2FuIHJlYWQgcGVyZm9ybWFu
Y2UgbW9uaXRvciBjb3VudGVyIHJlZ2lzdGVycwo+ID4gPiArZGlyZWN0bHkgb25seSB0aHJvdWdo
IHBlcmYsIGFueSBkaXJlY3QgYWNjZXNzIHdpdGhvdXQgcGVyZiBpbnRlcnZlbnRpb24gd2lsbAo+
ID4gPiArdHJpZ2dlciBhbiBpbGxlZ2FsIGluc3RydWN0aW9uLgo+ID4gPiArCj4gPiA+ICtUaGUg
ZGVmYXVsdCB2YWx1ZSBpcyAyLCBpdCBlbmFibGVzIHRoZSBsZWdhY3kgbW9kZSwgdGhhdCBpcyB1
c2VyIHNwYWNlIGhhcwo+ID4gPiArZGlyZWN0IGFjY2VzcyB0byBjeWNsZSwgdGltZSBhbmQgaW5z
cmV0IENTUnMgb25seS4KPiA+Cj4gPiBJIHRoaW5rIHRoaXMgZGVmYXVsdCB2YWx1ZSBzaG91bGQg
YmUgYSBLY29uZmlnIHN5bWJvbCwgYWxsb3dpbmcga2VybmVscyB0bwo+ID4gYmUgYnVpbHQgd2l0
aCBhIHNlY3VyZSBkZWZhdWx0Lgo+IAo+IEFjdHVhbGx5IEkgd2FzIG1vcmUgaW4gZmF2b3Igb2Yg
aGF2aW5nIHRoZSBkZWZhdWx0IHRvIDEgKGllIHRoZSBzZWN1cmUKPiBvcHRpb24pIGFuZCBsZXQg
dGhlIGRpc3Ryb3MgZGVhbCB3aXRoIHRoZSBsZWdhY3kgbW9kZSAodmlhIGEgc3lzY3RsCj4gcGFy
YW1ldGVyIG9uIHRoZSBjb21tYW5kIGxpbmUpIGFzIGxvbmcgYXMgdXNlci1zcGFjZSBoYXMgbm90
IGJlZW4KPiBmaXhlZDogZG9lcyB0aGF0IG1ha2Ugc2Vuc2U/CgpZZXMsIEknZCBwcmVmZXIgdGhh
dCB0b28uIEkgYXNzdW1lZCB0aGUgZGVmYXVsdCB3YXMgMiBpbiB0aGlzIHBhdGNoCmJlY2F1c2Ug
d2UgY291bGRuJ3Qgc2V0IGl0IHRvIDEgZm9yIHNvbWUgcmVhc29uLgoKVGhhbmtzLApkcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
