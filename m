Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86947D3409B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 16:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUtDMndVXRfVxQIX/qAduQSIhUSdOtXvrYxuMz0d0qY=; b=fr0stxPxObW1Wf
	hDOIP9xGuNnVNRp0rY8/IY+vA/6CztDhNxaBjSeM7z24virmWJ39B8ImbZULwhMe6a1HAIR/K6tzk
	yBl+VQNie33e0wWX5zDwMEXqJA5+gVjBDtJhu7hPZvm4olgxgWd+25KI6pXiJKw5ypB1Ez3FLkMSO
	tfJp8A7EoMiq6lYCtADztjiE6z9A7r1MrKTqrfhou+vP5MM4LzCXKKfTta61uZy61jMTQCXgZGxQd
	uW63kbe82JmXhvSXZh0RY4oUT5hXuvKzf0c3gMkggXd2vJzWS40Hl0ny4EqOwUmNLaMZ+ntXF4/If
	e7xrFs4asMhSiK/anC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklfF-0000000EdIv-1Cua;
	Tue, 27 Jan 2026 16:11:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklfC-0000000EdI5-0vv8
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 16:11:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a1462573caso77865ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 08:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769530293; cv=none;
        d=google.com; s=arc-20240605;
        b=g1Imit7oO0vWRsaJNQopW6I4TKWsWp4qi8qPHOF2v9KybHT1VBEXtxTxckn+cKn1bs
         5/sYocjo9+4nK2TCbZ9YPGBPZD9FxdPDHSCVlZLLGcSPEzmQ6KPQSw5Bb6tZYbv5G0Q8
         81Xe5YfWNQTXbyDug5F6gZDqhAQhmMjWQRa/00oSm/vGrlgeqia/VqkauDxjRz6qXEjf
         xMg6EEImNI2HL83BN26DHw73Ka9K1iRnIjPGms2MYTmjNO53/VF65IlEQ6IZ8SPd09xj
         ISPpWPl6aVcLnEJxsNvQSs2QInmbLJIlpZn28ZHSsHPTSg1SEDjGXsFmwNc/gigeE7vO
         6Sww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A/mleTy9B4/UIaLOH3Gao4Wnx4rcDBQf6oq8eOX91jQ=;
        fh=Ub21IuBatT2kCmjI4hmcqzR1R5ahKhH65YU8n8NH3Sw=;
        b=EN98dPYdQbc9FChT0DHANI79Vv2oHUm91MxfDKzrN3pskRWC9gtPYoBbtwN0uWZx59
         dLbSS5bwvVZxuITcFZtrRct/Nm+uBPn1IvGvbVYp/fU8XGzvaMHdW3yNQMmQfloaivOy
         r0mqGsi+UligIBU//6g4j+t05P6phYKj/YIBz5m2Ag6JWhQjl9za+DX7DOwmz61KuaMG
         BCz2HxZjbLAwTXxjbzdKEC25JZaEwFioncqNvots/BVCqPGKEtz2DfAI4C0TwTVzCDqS
         qNmhJ+Koqe/3WI2NMUPBZks1vMWOvS+vFrYDClt2FMKe4ZearSVlBfum1W5c/D9NwJsp
         6sng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769530293; x=1770135093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/mleTy9B4/UIaLOH3Gao4Wnx4rcDBQf6oq8eOX91jQ=;
        b=sSRz3/M3JNxXB1ieXEXxfzZC7vd596TH4lTHn/ClIk51zlGkN0rkocAaRqVkueWqcA
         V78o4C6HsJetIdXILMvqXJZ1tHfojCJSCSTcFhWySsLbeOQorX64W5x353dCx1MkH8mi
         aTYzy1YTQhsYoY1bTzMlnZF9XBTqqVRNhlByPoPT+F6bPnpbhHb02R21EOobRFpvAR3T
         DCgJVryXwlZWpVtA8ewKbNXKmgaNFzJaxJ8994jY0cdxH1DHIzS4sFQCJec58XZ6GLM1
         jK2oG2Wcx4oODyND6jmfi1k4DhJEbdq4e4zdOeTbX9Aku6iZ9vRJzqBfjDCIVKOpvz7i
         AXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769530293; x=1770135093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/mleTy9B4/UIaLOH3Gao4Wnx4rcDBQf6oq8eOX91jQ=;
        b=wAEQApSiQxxf3aBFbWj16RrU6rWyXTzKH+y85k0mhsG+es9p2PkSz/rVpBR8PzBv5h
         DI4sOwwkx4JrEm+rzUfCvn2252GrprqiYVuo2t/pD99lTAoNPPMF3sVZwkmdWHju2GDQ
         K9friAAqZ9C+fs73CzW5sCoNTQTU3ozyTbdvkmYpvI4mrvbxxCYK659R/z6UdAcik0Q8
         k1dVKco6YDGPtquvGR2ixHXdVWQBcEm2KpiUi3IkVZe3HvJdtdlvdb/RzcmVlCBs2Un/
         eZaTfVzzJxRpN1XyvwrgOaIlldLqJYRe1lwz6p5Qs4vNMczr0p6n4UovzDS+HXYoR0tw
         K7PA==
X-Forwarded-Encrypted: i=1; AJvYcCVF3B4htASQ7UAt/DEcCdccYey8AyLOoaNkZq2HQT4hCS+g6tqELjRdqHOxZkBkXF0IVJux9FZwexdipQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpDzZEs6Vr5MXkUGYPY1GAzNTJkxb1JQfvvFEBze4w9DlV9PO1
	/PI8N78wAwnrh45gTS0Lp1Vcl6+KMmEX46GXFvxYn6pXUhEQ6cmI3Htm848VLx9k6jyAay3kMXO
	kqZujbu5vf6mMv49l/BXRYYC9ht2fAJXX22nPJ7gH
X-Gm-Gg: AZuq6aIvaQObd1FRwSlr3mlGUFwiqzX+PmTZwNYlv2I+9CG3LQQuTgXMxWq2I+rPJSP
	RRMLI2Ds3RuB+jmAkmfogDY2XGD7S5SAnwJUOSuiasCnHBpYXk4PPR88YBoGSLv41zYx4FPMWnR
	AorLxt3hjLnSBsJSYUojVihtDxTkoA+1rtVYjP1PrJB+NIKaSwlKjc2mmWBaMUxKoOC7ri0qxmY
	494dL8NKvdrKIBoFq+Ul33tSK33zf4Bbh+R/XA8ztMcBA9qYge00Ot/CteCvM0OB0B1W5Yi73DZ
	1+/zu2S22GpP7ac1GU1WiB3R
X-Received: by 2002:a17:902:cecb:b0:2a1:3cdc:7720 with SMTP id
 d9443c01a7336-2a870b9a583mr2100165ad.21.1769530292678; Tue, 27 Jan 2026
 08:11:32 -0800 (PST)
MIME-Version: 1.0
References: <20260127070259.2720468-1-dapeng1.mi@linux.intel.com>
 <20260127070259.2720468-2-dapeng1.mi@linux.intel.com> <a97ff1d6-7712-4315-95ff-4079ffc752f7@linux.intel.com>
In-Reply-To: <a97ff1d6-7712-4315-95ff-4079ffc752f7@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 Jan 2026 08:11:21 -0800
X-Gm-Features: AZwV_QjW0pwOnDUxPFtiXQXGGTFi90qXyv8gN_Wjk26BamAh3tH23kY_UBLKyTk
Message-ID: <CAP-5=fXW2KiHy+wT16nRgQK4xboTzcTH3pMEe3=En7dwUNGJPQ@mail.gmail.com>
Subject: Re: [Patch v2 1/3] perf arch: Update arch headers to use relative
 UAPI paths
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zide Chen <zide.chen@intel.com>, Falcon Thomas <thomas.falcon@intel.com>, 
	Dapeng Mi <dapeng1.mi@intel.com>, Xudong Hao <xudong.hao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_081135_185058_F2F8C968 
X-CRM114-Status: GOOD (  19.29  )
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

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgNDozOOKAr0FNIE1pLCBEYXBlbmcgPGRhcGVuZzEubWlA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+Cj4gT24gMS8yNy8yMDI2IDM6MDIgUE0sIERhcGVu
ZyBNaSB3cm90ZToKPiA+IFRoZSBhcmNoaXRlY3R1cmFsIHNwZWNpZmljIGhlYWRlcnMgcGVyZl9y
ZWdzLmggY3VycmVudGx5IHJlbHkgb24gdGhlCj4gPiBob3N0IGFyY2hpdGVjdHVyZSdzICdhc20v
cGVyZl9yZWdzLmgnLiBUaGlzIGNhbiBsZWFkIHRvIGNvbXBpbGF0aW9uCj4gPiBpbmNvbnNpc3Rl
bmNpZXMgb3IgZmFpbHVyZXMgd2hlbiBpbmNsdWRpbmcgYW5kIGJ1aWxkaW5nIHBlcmYgZm9yIGEK
PiA+IHRhcmdldCBhcmNoaXRlY3R1cmUgdGhhdCBkaWZmZXJzIGZyb20gdGhlIGhvc3QncyBhcmNo
aXRlY3R1cmUuCj4gPgo+ID4gRXhwbGljaXRseSBwb2ludCB0byB0aGUgVUFQSSBoZWFkZXJzIHdp
dGhpbiB0aGUgdG9vbHMgc291cmNlIHRyZWUgdXNpbmcKPiA+IHJlbGF0aXZlIHBhdGhzLiBUaGlz
IGVuc3VyZXMgdGhhdCBwZXJmIGlzIGFsd2F5cyBidWlsdCBhZ2FpbnN0IHRoZQo+ID4gaW50ZW5k
ZWQgYXJjaGl0ZWN0dXJlLgo+ID4KPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBhcmUgaW50ZW5k
ZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFwZW5nIE1pIDxkYXBlbmcxLm1pQGxpbnV4Lmlu
dGVsLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3BlcmYvYXJjaC9hcm0vaW5jbHVkZS9wZXJmX3Jl
Z3MuaCAgICAgICB8IDIgKy0KPiA+ICB0b29scy9wZXJmL2FyY2gvYXJtNjQvaW5jbHVkZS9wZXJm
X3JlZ3MuaCAgICAgfCAyICstCj4gPiAgdG9vbHMvcGVyZi9hcmNoL2Nza3kvaW5jbHVkZS9wZXJm
X3JlZ3MuaCAgICAgIHwgMSArCj4gPiAgdG9vbHMvcGVyZi9hcmNoL2xvb25nYXJjaC9pbmNsdWRl
L3BlcmZfcmVncy5oIHwgMiArLQo+ID4gIHRvb2xzL3BlcmYvYXJjaC9taXBzL2luY2x1ZGUvcGVy
Zl9yZWdzLmggICAgICB8IDIgKy0KPiA+ICB0b29scy9wZXJmL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L3BlcmZfcmVncy5oICAgfCAyICstCj4gPiAgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L2luY2x1ZGUv
cGVyZl9yZWdzLmggICAgIHwgMiArLQo+ID4gIHRvb2xzL3BlcmYvYXJjaC9zMzkwL2luY2x1ZGUv
cGVyZl9yZWdzLmggICAgICB8IDIgKy0KPiA+ICB0b29scy9wZXJmL2FyY2gveDg2L2luY2x1ZGUv
cGVyZl9yZWdzLmggICAgICAgfCAyICstCj4gPiAgOSBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYXJj
aC9hcm0vaW5jbHVkZS9wZXJmX3JlZ3MuaCBiL3Rvb2xzL3BlcmYvYXJjaC9hcm0vaW5jbHVkZS9w
ZXJmX3JlZ3MuaAo+ID4gaW5kZXggNzVjZTFjMzcwMTE0Li4yMGM1NDc2NmUzYTAgMTAwNjQ0Cj4g
PiAtLS0gYS90b29scy9wZXJmL2FyY2gvYXJtL2luY2x1ZGUvcGVyZl9yZWdzLmgKPiA+ICsrKyBi
L3Rvb2xzL3BlcmYvYXJjaC9hcm0vaW5jbHVkZS9wZXJmX3JlZ3MuaAo+ID4gQEAgLTQsNyArNCw3
IEBACj4gPgo+ID4gICNpbmNsdWRlIDxzdGRsaWIuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvdHlw
ZXMuaD4KPiA+IC0jaW5jbHVkZSA8YXNtL3BlcmZfcmVncy5oPgo+ID4gKyNpbmNsdWRlICIuLi8u
Li8uLi8uLi9hcmNoL2FybS9pbmNsdWRlL3VhcGkvYXNtL3BlcmZfcmVncy5oIgo+ID4KPiA+ICB2
b2lkIHBlcmZfcmVnc19sb2FkKHU2NCAqcmVncyk7Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3BlcmYvYXJjaC9hcm02NC9pbmNsdWRlL3BlcmZfcmVncy5oIGIvdG9vbHMvcGVyZi9hcmNoL2Fy
bTY0L2luY2x1ZGUvcGVyZl9yZWdzLmgKPiA+IGluZGV4IDU4NjM5ZWU5ZjdlYS4uMzcyZjI1NjVh
OWRkIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL2FybTY0L2luY2x1ZGUvcGVyZl9y
ZWdzLmgKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvYXJjaC9hcm02NC9pbmNsdWRlL3BlcmZfcmVncy5o
Cj4gPiBAQCAtNSw3ICs1LDcgQEAKPiA+ICAjaW5jbHVkZSA8c3RkbGliLmg+Cj4gPiAgI2luY2x1
ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gPiAgI2RlZmluZSBwZXJmX2V2ZW50X2FybV9yZWdzIHBlcmZf
ZXZlbnRfYXJtNjRfcmVncwo+ID4gLSNpbmNsdWRlIDxhc20vcGVyZl9yZWdzLmg+Cj4gPiArI2lu
Y2x1ZGUgIi4uLy4uLy4uLy4uL2FyY2gvYXJtNjQvaW5jbHVkZS91YXBpL2FzbS9wZXJmX3JlZ3Mu
aCIKPiA+ICAjdW5kZWYgcGVyZl9ldmVudF9hcm1fcmVncwo+ID4KPiA+ICB2b2lkIHBlcmZfcmVn
c19sb2FkKHU2NCAqcmVncyk7Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL2Nza3kv
aW5jbHVkZS9wZXJmX3JlZ3MuaCBiL3Rvb2xzL3BlcmYvYXJjaC9jc2t5L2luY2x1ZGUvcGVyZl9y
ZWdzLmgKPiA+IGluZGV4IDA3NmM3NzQ2YzhhMi4uOTUyMGU2YWEzMTllIDEwMDY0NAo+ID4gLS0t
IGEvdG9vbHMvcGVyZi9hcmNoL2Nza3kvaW5jbHVkZS9wZXJmX3JlZ3MuaAo+ID4gKysrIGIvdG9v
bHMvcGVyZi9hcmNoL2Nza3kvaW5jbHVkZS9wZXJmX3JlZ3MuaAo+ID4gQEAgLTcsNiArNyw3IEBA
Cj4gPiAgI2luY2x1ZGUgPHN0ZGxpYi5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+
ID4gICNpbmNsdWRlIDxhc20vcGVyZl9yZWdzLmg+Cj4KPiBPb3BzLCB0aGUgYWJvdmUgbGluZSB3
YXMgbm90IHJlbW92ZWQuIFdvdWxkIHJlbW92ZSBpdCBpbiBuZXh0IHZlcnNpb24uCgpBc2lkZSBm
cm9tIHRoaXM6ClJldmlld2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+CgpU
aGFua3MsCklhbgoKPiA+ICsjaW5jbHVkZSAiLi4vLi4vLi4vLi4vYXJjaC9jc2t5L2luY2x1ZGUv
dWFwaS9hc20vcGVyZl9yZWdzLmgiCj4gPgo+ID4gICNkZWZpbmUgUEVSRl9SRUdTX01BU0sgICAg
ICAgKCgxVUxMIDw8IFBFUkZfUkVHX0NTS1lfTUFYKSAtIDEpCj4gPiAgI2RlZmluZSBQRVJGX1JF
R1NfTUFYICAgICAgICBQRVJGX1JFR19DU0tZX01BWAo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Bl
cmYvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9wZXJmX3JlZ3MuaCBiL3Rvb2xzL3BlcmYvYXJjaC9s
b29uZ2FyY2gvaW5jbHVkZS9wZXJmX3JlZ3MuaAo+ID4gaW5kZXggNDVjNzk5ZmE1MzMwLi5iODYw
NzhhNTVlOTAgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9wZXJmL2FyY2gvbG9vbmdhcmNoL2luY2x1
ZGUvcGVyZl9yZWdzLmgKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvYXJjaC9sb29uZ2FyY2gvaW5jbHVk
ZS9wZXJmX3JlZ3MuaAo+ID4gQEAgLTQsNyArNCw3IEBACj4gPgo+ID4gICNpbmNsdWRlIDxzdGRs
aWIuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+IC0jaW5jbHVkZSA8YXNtL3Bl
cmZfcmVncy5oPgo+ID4gKyNpbmNsdWRlICIuLi8uLi8uLi8uLi9hcmNoL2xvb25nYXJjaC9pbmNs
dWRlL3VhcGkvYXNtL3BlcmZfcmVncy5oIgo+ID4KPiA+ICAjZGVmaW5lIFBFUkZfUkVHU19NQVgg
UEVSRl9SRUdfTE9PTkdBUkNIX01BWAo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL2Fy
Y2gvbWlwcy9pbmNsdWRlL3BlcmZfcmVncy5oIGIvdG9vbHMvcGVyZi9hcmNoL21pcHMvaW5jbHVk
ZS9wZXJmX3JlZ3MuaAo+ID4gaW5kZXggNzA4MmU5MWUwZWQxLi42NjY1NWYwYzRmZWEgMTAwNjQ0
Cj4gPiAtLS0gYS90b29scy9wZXJmL2FyY2gvbWlwcy9pbmNsdWRlL3BlcmZfcmVncy5oCj4gPiAr
KysgYi90b29scy9wZXJmL2FyY2gvbWlwcy9pbmNsdWRlL3BlcmZfcmVncy5oCj4gPiBAQCAtNCw3
ICs0LDcgQEAKPiA+Cj4gPiAgI2luY2x1ZGUgPHN0ZGxpYi5oPgo+ID4gICNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPgo+ID4gLSNpbmNsdWRlIDxhc20vcGVyZl9yZWdzLmg+Cj4gPiArI2luY2x1ZGUg
Ii4uLy4uLy4uLy4uL2FyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL3BlcmZfcmVncy5oIgo+ID4K
PiA+ICAjZGVmaW5lIFBFUkZfUkVHU19NQVggUEVSRl9SRUdfTUlQU19NQVgKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9wZXJmX3JlZ3MuaCBiL3Rv
b2xzL3BlcmYvYXJjaC9wb3dlcnBjL2luY2x1ZGUvcGVyZl9yZWdzLmgKPiA+IGluZGV4IDFjNjZm
NmJhNjc3My4uMjJiNDkyYTNkZDU4IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9wZXJmX3JlZ3MuaAo+ID4gKysrIGIvdG9vbHMvcGVyZi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9wZXJmX3JlZ3MuaAo+ID4gQEAgLTQsNyArNCw3IEBACj4gPgo+ID4gICNpbmNs
dWRlIDxzdGRsaWIuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+IC0jaW5jbHVk
ZSA8YXNtL3BlcmZfcmVncy5oPgo+ID4gKyNpbmNsdWRlICIuLi8uLi8uLi8uLi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS91YXBpL2FzbS9wZXJmX3JlZ3MuaCIKPiA+Cj4gPiAgdm9pZCBwZXJmX3JlZ3Nf
bG9hZCh1NjQgKnJlZ3MpOwo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL2FyY2gvcmlz
Y3YvaW5jbHVkZS9wZXJmX3JlZ3MuaCBiL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi9pbmNsdWRlL3Bl
cmZfcmVncy5oCj4gPiBpbmRleCBkNDgyZWRiNDEzZTUuLjg5ZDViYmI4ZDJiOCAxMDA2NDQKPiA+
IC0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi9pbmNsdWRlL3BlcmZfcmVncy5oCj4gPiArKysg
Yi90b29scy9wZXJmL2FyY2gvcmlzY3YvaW5jbHVkZS9wZXJmX3JlZ3MuaAo+ID4gQEAgLTYsNyAr
Niw3IEBACj4gPgo+ID4gICNpbmNsdWRlIDxzdGRsaWIuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgv
dHlwZXMuaD4KPiA+IC0jaW5jbHVkZSA8YXNtL3BlcmZfcmVncy5oPgo+ID4gKyNpbmNsdWRlICIu
Li8uLi8uLi8uLi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcGVyZl9yZWdzLmgiCj4gPgo+
ID4gICNkZWZpbmUgUEVSRl9SRUdTX01BU0sgICAgICAgKCgxVUxMIDw8IFBFUkZfUkVHX1JJU0NW
X01BWCkgLSAxKQo+ID4gICNkZWZpbmUgUEVSRl9SRUdTX01BWCAgICAgICAgUEVSRl9SRUdfUklT
Q1ZfTUFYCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL3MzOTAvaW5jbHVkZS9wZXJm
X3JlZ3MuaCBiL3Rvb2xzL3BlcmYvYXJjaC9zMzkwL2luY2x1ZGUvcGVyZl9yZWdzLmgKPiA+IGlu
ZGV4IDEzMGRmYWQyYjk2YS4uOWM5NTU4OTk2NWZlIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvcGVy
Zi9hcmNoL3MzOTAvaW5jbHVkZS9wZXJmX3JlZ3MuaAo+ID4gKysrIGIvdG9vbHMvcGVyZi9hcmNo
L3MzOTAvaW5jbHVkZS9wZXJmX3JlZ3MuaAo+ID4gQEAgLTMsNyArMyw3IEBACj4gPgo+ID4gICNp
bmNsdWRlIDxzdGRsaWIuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+IC0jaW5j
bHVkZSA8YXNtL3BlcmZfcmVncy5oPgo+ID4gKyNpbmNsdWRlICIuLi8uLi8uLi8uLi9hcmNoL3Mz
OTAvaW5jbHVkZS91YXBpL2FzbS9wZXJmX3JlZ3MuaCIKPiA+Cj4gPiAgdm9pZCBwZXJmX3JlZ3Nf
bG9hZCh1NjQgKnJlZ3MpOwo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL2FyY2gveDg2
L2luY2x1ZGUvcGVyZl9yZWdzLmggYi90b29scy9wZXJmL2FyY2gveDg2L2luY2x1ZGUvcGVyZl9y
ZWdzLmgKPiA+IGluZGV4IGYyMDljZTJjMWRkOS4uNTQ5NWU1Y2E3Y2RjIDEwMDY0NAo+ID4gLS0t
IGEvdG9vbHMvcGVyZi9hcmNoL3g4Ni9pbmNsdWRlL3BlcmZfcmVncy5oCj4gPiArKysgYi90b29s
cy9wZXJmL2FyY2gveDg2L2luY2x1ZGUvcGVyZl9yZWdzLmgKPiA+IEBAIC00LDcgKzQsNyBAQAo+
ID4KPiA+ICAjaW5jbHVkZSA8c3RkbGliLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
Cj4gPiAtI2luY2x1ZGUgPGFzbS9wZXJmX3JlZ3MuaD4KPiA+ICsjaW5jbHVkZSAiLi4vLi4vLi4v
Li4vYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9wZXJmX3JlZ3MuaCIKPiA+Cj4gPiAgdm9pZCBw
ZXJmX3JlZ3NfbG9hZCh1NjQgKnJlZ3MpOwo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
