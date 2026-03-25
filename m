Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F4F108B91E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 01:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VrQVlN4eIzWJRLtoSbTOEXcioF2dAIsRDiJvFFtO+zE=; b=4gNoBMXgZJbLQJ
	WIQNhBmaHFX1xQFzxF+ajXkzJ2f/iXveBuSRRASmwEIz+2Wf8LUkqV3MQogYVzixZHFDxVhhOgvR4
	xQgmH3021rTipv+A3cGpgSsuz2qLRfLa5QMrOmSsjclpzuiH3QP4icseCMctyGbXLA4i0hsQorjkk
	A8OboxQ+QQhYJK501A+s39cppmB0HaYbIZq7SiFFpgVgb4KDEYPBlmcRopo8tW24zhH3cknHJ3V2f
	jsgXOU4KJoPRPkgKTE+Uq00iHbyJZ3MLEwPG3+RIZ+vcUJVqbw0yssgXquc3q4bdwqGeZ7xBlfRgL
	k2k8s5twDu7L/lkVyrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5DHG-00000002Scn-209i;
	Wed, 25 Mar 2026 01:43:22 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5DHD-00000002ScQ-3ql5
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 01:43:21 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-463f00cda04so1131936b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 18:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774402998; cv=none;
        d=google.com; s=arc-20240605;
        b=h5ZP1d37UH6igxKbrcOXUa30ohAlJbLSvRtp7F90oA3fxuvsZwcHZw5G4jlh0pvDEe
         hTJcFfn17T/l64/KbINTFBMzxyMf7/Kiy4fmeGCJxvQd20IS/HNZKf5clcHIH5um+MyM
         f1mOqIDMKWcRff1wEKyh+gcBFgPepXkpWgE9ymZiGvnNwinpcUmfZjqzVNYbVFbWEZuD
         aIf/HYFJIujGKw+7IOuwG195bm03RkymGQI3cL4YTIPUe/wVKEyO6kyiWErr6L/NQBH0
         qixx1jK1fxpagOAAvVSTr8puG0+7Ru5hp7qKRl/KxHroaCUh2aDoxhn/a+93wrLe0OVZ
         zOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BVjPu0rHHBy1UzY463CDPxiXdA8El4sI25AORgmrANA=;
        fh=OE//mVY3vVkSOTUx+65bMrzLOI+7Y0V0lC4ZThwq8tE=;
        b=Rux//Ou6ub3llgymqduCHfVZf2cU8agB9C6xjAAMdSzYWJJNVgGZhzD90nExGxFa6b
         S+qvAAZMw23YF+AW0JkmJ+pZM0aT4BXw7AKcJkxy3Yaso/ROi2uvpVOokcXjco7uLf+S
         BfLxY4mUV4ejuSWVTkeo54MjhbRB91NNkhBSCCMooIiDlhDIlzUCs3fLrqvFggZ41bh3
         8OQ4Aq68+i9+7LS9z2BxRupbaLA7n1NBp8ygJ1Sq06KUEtfIrzeM1zRLDSVUZr3u39CL
         cgJt9pfHvUSEsG9u9D+8Kqx523K4RqfczyrdZuxTwg0+7w16oMNR1cn3VXEFsHdGHoxS
         Jg8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1774402998; x=1775007798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVjPu0rHHBy1UzY463CDPxiXdA8El4sI25AORgmrANA=;
        b=D2UsjUumXJR8PeqaCjGWSCMRXDla2nedCndaCboQg41XzC8Tr37EzIRJolLRa4F+ga
         LrL+sXQArojDhlv5ntJYkDoUmcsmjs8Fv1VuHU66vneBY9rCNhGAq2EC9KID8H2V0GCz
         2H9G7J5nQSQ4GtTujEuDLl5cHBvUW7zc9hgwVYZJEy9nR2h7YccOu3nk9BQ1M58dJxgw
         MoEVIfjwfVNie91MeFWVmNyrGVjm3ikW8nGoIURzLOSOSHBf1GxMs/XsjCB7co4zp1Qn
         oYu2efIteAhnKMl/87KWHZRFwQOfUwk6ClkOBlLFIIjGsDGuYHMApOQKgI2y5Jd41wd/
         YJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774402998; x=1775007798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BVjPu0rHHBy1UzY463CDPxiXdA8El4sI25AORgmrANA=;
        b=QbYnm9FQgmjdrAcfojG2H4MsTYIqYIFs30NgucfKmMYbvdvpRo1f3zKDACUDc6Eskk
         pTDGo+MSHVHlZov3nKktb1kRQ2oxl1n5rQagWYKPOThv/nGFUp7WXkfsFeH9LOdXsbtW
         g9gFvdvxLFnHAv0DXpQjPPlegELK6fEP1sZa89gKGsNPV9Fuh/9uMNrH2l08cCtbEFmO
         9xTBb5Ap6JcTsUEBH6EMcWaC5QFvk7pwPLoBH1iD4gkfGmkk5WkgMre3aCizvuWlbsXV
         8tRj80i85c6/DsjPdcYveGZnY7sctujt/IfDOwiT7Rqqo98k4Ypi5XT3zQu0FRR1gunu
         Jpwg==
X-Forwarded-Encrypted: i=1; AJvYcCWDGWd2b+VenJvnKTCtqQwTVVKJerkVh6N0lhB3OVqvgRQAli9YHOLOz2TyBLdolvwvw57sLl8+tSmTXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYy2Qh2w2uXoPyNuaSeSCCXNIQ4EU9UGf5Kzz05GEo36NQLxcs
	w+63dmsRB6Lgly5m9YfU1V8GJDDeu+O4LQDoY9AI5EgeZf+yIlHXbv819WKEWeS+Eng486qgch0
	dnhscumk9jLavUM7DdnTPbaYWInvCQCR63hcIX963FA==
X-Gm-Gg: ATEYQzxTe8Ri5MQbQno7TfkhtV7h/oBjw/7EyRDtj8OwCO/QLOeJEE17rkBrevP5KkY
	J6WGvp+i2lHuzPbLABHXx2ANC6KJdvmrsSKnRmHB8FG0oVfwa3pLmoRT3/85vEnHS6VBdDRfczw
	+fHLo1EnKEh02NtPVsKmnuizfO4IVQ8mzoIELTbyA44iI/mHsv0NBn1Ic5XEjWcXm/OxsWiF/I5
	01A93OroQ+O2AyLFx4Sg5/8K89z1NbdYgaosw0Vzp8BrZ9KWaCKdND+8ZNGob3kQ03EunfhobDu
	4CWQ6XWE+qDMtg==
X-Received: by 2002:a05:6808:c222:b0:467:26e4:728e with SMTP id
 5614622812f47-46a5c7a4ecbmr851588b6e.49.1774402998286; Tue, 24 Mar 2026
 18:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org> <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 25 Mar 2026 09:43:07 +0800
X-Gm-Features: AaiRm519bl_Rt9ja-VV8uGqhbXi9qjWu8MIOxUSwOQfzA4YoBDggIUB3VQtcL08
Message-ID: <CAEEQ3wm4vGcOChkj+z58nP3mjG8hvQmAhQLcLxqxwdvoo_8q6Q@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 14/17] include: acpi: actbl2: Add
 structs for RQSC table
To: Drew Fustini <fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_184319_975828_BF63A188 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRHJldywKCk9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBBZGQgc3RydWN0cyBmb3IgdGhlIFJRU0Mg
dGFibGUgd2hpY2ggZGVzY3JpYmVzIHRoZSBwcm9wZXJ0aWVzIG9mIHRoZQo+IFJJU0MtViBRb1Mg
Y29udHJvbGxlcnMgKENCUVJJKSBpbiB0aGUgc3lzdGVtLiBUaGUgdGFibGUgYWxzbyBkZXNjcmli
ZXMKPiB0aGUgdG9wb2xvZ2ljYWwgYXJyYW5nZW1lbnQgb2YgdGhlIFFvUyBjb250cm9sbGVycyBh
bmQgcmVzb3VyY2VzIGluIHRoZQo+IHN5c3RlbS4gVGhlIHRvcG9sb2d5IGlzIGV4cHJlc3NlZCBp
biB0ZXJtcyBvZiB0aGUgbG9jYXRpb24gb2YgdGhlCj4gcmVzb3VyY2VzIHdpdGhpbiB0aGUgc3lz
dGVtIGFuZCB0aGUgcmVsYXRpb24gYmV0d2VlbiB0aGUgUW9TIENvbnRyb2xsZXIKPiBhbmQgdGhl
IHJlc291cmNlIGl0IG1hbmFnZXMuCj4KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yt
bm9uLWlzYS9yaXNjdi1jYnFyaS9yZWxlYXNlcy90YWcvdjEuMAo+IExpbms6IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXJxc2MvYmxvYi9tYWluL3NyYy9jaGFwdGVyMi5h
ZG9jCj4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+Cj4g
LS0tCj4gIGluY2x1ZGUvYWNwaS9hY3RibDIuaCB8IDkyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOTIgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYWNwaS9hY3RibDIuaCBiL2luY2x1ZGUv
YWNwaS9hY3RibDIuaAo+IGluZGV4IGY3MjZiY2UzZWI4NC4uNzM2Nzk5MDM0OWVlIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvYWNwaS9hY3RibDIuaAo+ICsrKyBiL2luY2x1ZGUvYWNwaS9hY3RibDIu
aAo+IEBAIC01Myw2ICs1Myw3IEBACj4gICNkZWZpbmUgQUNQSV9TSUdfUkdSVCAgICAgICAgICAg
IlJHUlQiIC8qIFJlZ3VsYXRvcnkgR3JhcGhpY3MgUmVzb3VyY2UgVGFibGUgKi8KPiAgI2RlZmlu
ZSBBQ1BJX1NJR19SSENUICAgICAgICAgICAiUkhDVCIgLyogUklTQy1WIEhhcnQgQ2FwYWJpbGl0
aWVzIFRhYmxlICovCj4gICNkZWZpbmUgQUNQSV9TSUdfUklNVCAgICAgICAgICAgIlJJTVQiIC8q
IFJJU0MtViBJTyBNYXBwaW5nIFRhYmxlICovCj4gKyNkZWZpbmUgQUNQSV9TSUdfUlFTQyAgICAg
ICAgICAgIlJRU0MiIC8qIFJJU0MtViBSSVNDLVYgUXVhbGl0eSBvZiBTZXJ2aWNlIENvbnRyb2xs
ZXIgKi8KPiAgI2RlZmluZSBBQ1BJX1NJR19TQlNUICAgICAgICAgICAiU0JTVCIgLyogU21hcnQg
QmF0dGVyeSBTcGVjaWZpY2F0aW9uIFRhYmxlICovCj4gICNkZWZpbmUgQUNQSV9TSUdfU0RFSSAg
ICAgICAgICAgIlNERUkiIC8qIFNvZnR3YXJlIERlbGVnYXRlZCBFeGNlcHRpb24gSW50ZXJmYWNl
IFRhYmxlICovCj4gICNkZWZpbmUgQUNQSV9TSUdfU0RFViAgICAgICAgICAgIlNERVYiIC8qIFNl
Y3VyZSBEZXZpY2VzIHRhYmxlICovCj4gQEAgLTMxNjUsNiArMzE2Niw5NyBAQCBlbnVtIGFjcGlf
cmdydF9pbWFnZV90eXBlIHsKPiAgICAgICAgIEFDUElfUkdSVF9UWVBFX1JFU0VSVkVEID0gMiAg
ICAgLyogMiBhbmQgZ3JlYXRlciBhcmUgcmVzZXJ2ZWQgKi8KPiAgfTsKPgo+ICsvKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKgo+ICsgKgo+ICsgKiBSUVNDIC0gUklTQy1WIFF1YWxpdHkgb2YgU2Vydmlj
ZSBDb250cm9sbGVyCj4gKyAqICAgICAgICBWZXJzaW9uIDEKPiArICoKPiArICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKi8KPiArCj4gK3N0cnVjdCBhY3BpX3RhYmxlX3Jxc2NfZmllbGRzX3JlcyB7Cj4g
KyAgICAgICB1OCB0eXBlOyAgICAgICAgLy8gMQo+ICsgICAgICAgdTggcmVzdjsgICAgICAgIC8v
IDEKPiArICAgICAgIHUxNiBsZW5ndGg7ICAgICAvLyAyCj4gKyAgICAgICB1MTYgZmxhZ3M7ICAg
ICAgLy8gMgo+ICsgICAgICAgdTggcmVzdjI7ICAgICAgIC8vIDEKPiArICAgICAgIHU4IGlkX3R5
cGU7ICAgICAvLyAxCj4gKyAgICAgICB1NjQgaWQxOyAgICAgICAgLy8gOAo+ICsgICAgICAgdTMy
IGlkMjsgICAgICAgIC8vIDQKPiArfTsKPiArCj4gK3N0cnVjdCBhY3BpX3RhYmxlX3Jxc2NfZmll
bGRzIHsKPiArICAgICAgIHU4IHR5cGU7ICAgICAgICAvLyAgMQo+ICsgICAgICAgdTggcmVzdjsg
ICAgICAgIC8vICAxCj4gKyAgICAgICB1MTYgbGVuZ3RoOyAgICAgLy8gIDIKPiArICAgICAgIHUz
MiByZWdbM107ICAgICAvLyAxMgo+ICsgICAgICAgdTMyIHJjaWQ7ICAgICAgIC8vICA0Cj4gKyAg
ICAgICB1MzIgbWNpZDsgICAgICAgLy8gIDQKPiArICAgICAgIHUxNiBmbGFnczsgICAgICAvLyAg
Mgo+ICsgICAgICAgdTE2IG5yZXM7ICAgICAgIC8vICAyCj4gKyAgICAgICBzdHJ1Y3QgYWNwaV90
YWJsZV9ycXNjX2ZpZWxkc19yZXMgcmVzOyAvLyAyMAo+ICt9Owo+ICsKPiArc3RydWN0IGFjcGlf
dGFibGVfcnFzYyB7Cj4gKyAgICAgICBzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIgaGVhZGVyOyAg
ICAgICAgLyogQ29tbW9uIEFDUEkgdGFibGUgaGVhZGVyICovCj4gKyAgICAgICB1MzIgbnVtOwo+
ICsgICAgICAgc3RydWN0IGFjcGlfdGFibGVfcnFzY19maWVsZHMgZls2XTsKCklzIGEgZml4ZWQg
YXJyYXkgZls2XSBhcHByb3ByaWF0ZSBoZXJlID8KCj4gK307Cj4gKwo+ICsvKiBSUVNDIEZsYWdz
ICovCj4gKyNkZWZpbmUgQUNQSV9SUVNDX1RJTUVSX0NBTk5PVF9XQUtFVVBfQ1BVICAgICAgICgx
KQo+ICsKPiArLyoKPiArICogUlFTQyBzdWJ0YWJsZXMKPiArICovCj4gK3N0cnVjdCBhY3BpX3Jx
c2Nfbm9kZV9oZWFkZXIgewo+ICsgICAgICAgdTE2IHR5cGU7Cj4gKyAgICAgICB1MTYgbGVuZ3Ro
Owo+ICsgICAgICAgdTE2IHJldmlzaW9uOwo+ICt9Owo+ICsKPiArLyogVmFsdWVzIGZvciBSUVND
IHN1YnRhYmxlIFR5cGUgYWJvdmUgKi8KPiArZW51bSBhY3BpX3Jxc2Nfbm9kZV90eXBlIHsKPiAr
ICAgICAgIEFDUElfUlFTQ19OT0RFX1RZUEVfSVNBX1NUUklORyA9IDB4MDAwMCwKPiArICAgICAg
IEFDUElfUlFTQ19OT0RFX1RZUEVfQ01PID0gMHgwMDAxLAo+ICsgICAgICAgQUNQSV9SUVNDX05P
REVfVFlQRV9NTVUgPSAweDAwMDIsCj4gKyAgICAgICBBQ1BJX1JRU0NfTk9ERV9UWVBFX1JFU0VS
VkVEID0gMHgwMDAzLAo+ICsgICAgICAgQUNQSV9SUVNDX05PREVfVFlQRV9IQVJUX0lORk8gPSAw
eEZGRkYsCj4gK307Cj4gKwo+ICsvKgo+ICsgKiBSUVNDIG5vZGUgc3BlY2lmaWMgc3VidGFibGVz
Cj4gKyAqLwo+ICsKPiArLyogSVNBIHN0cmluZyBub2RlIHN0cnVjdHVyZSAqLwo+ICtzdHJ1Y3Qg
YWNwaV9ycXNjX2lzYV9zdHJpbmcgewo+ICsgICAgICAgdTE2IGlzYV9sZW5ndGg7Cj4gKyAgICAg
ICBjaGFyIGlzYVtdOwo+ICt9Owo+ICsKPiArc3RydWN0IGFjcGlfcnFzY19jbW9fbm9kZSB7Cj4g
KyAgICAgICB1OCByZXNlcnZlZDsgICAgICAgICAgICAvKiBNdXN0IGJlIHplcm8gKi8KPiArICAg
ICAgIHU4IGNib21fc2l6ZTsgICAgICAgICAgIC8qIENCT00gc2l6ZSBpbiBwb3dlcm9mIDIgKi8K
PiArICAgICAgIHU4IGNib3Bfc2l6ZTsgICAgICAgICAgIC8qIENCT1Agc2l6ZSBpbiBwb3dlcm9m
IDIgKi8KPiArICAgICAgIHU4IGNib3pfc2l6ZTsgICAgICAgICAgIC8qIENCT1ogc2l6ZSBpbiBw
b3dlcm9mIDIgKi8KPiArfTsKPiArCj4gK3N0cnVjdCBhY3BpX3Jxc2NfbW11X25vZGUgewo+ICsg
ICAgICAgdTggcmVzZXJ2ZWQ7ICAgICAgICAgICAgLyogTXVzdCBiZSB6ZXJvICovCj4gKyAgICAg
ICB1OCBtbXVfdHlwZTsgICAgICAgICAgICAvKiBWaXJ0dWFsIEFkZHJlc3MgU2NoZW1lICovCj4g
K307Cj4gKwo+ICtlbnVtIGFjcGlfcnFzY19tbXVfdHlwZSB7Cj4gKyAgICAgICBBQ1BJX1JRU0Nf
TU1VX1RZUEVfU1YzOSA9IDAsCj4gKyAgICAgICBBQ1BJX1JRU0NfTU1VX1RZUEVfU1Y0OCA9IDEs
Cj4gKyAgICAgICBBQ1BJX19NTVVfVFlQRV9TVjU3ID0gMgoKQUNQSV9SUVNDX01NVV9UWVBFX1NW
NTcgPSAyICA/Cgo+ICt9Owo+ICsKPiArLyogSGFydCBJbmZvIG5vZGUgc3RydWN0dXJlICovCj4g
K3N0cnVjdCBhY3BpX3Jxc2NfaGFydF9pbmZvIHsKPiArICAgICAgIHUxNiBudW1fb2Zmc2V0czsK
PiArICAgICAgIHUzMiB1aWQ7ICAgICAgICAgICAgICAgIC8qIEFDUEkgcHJvY2Vzc29yIFVJRCAq
Lwo+ICt9Owo+ICsKPiAgLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAgICoKPiAgICogUkhDVCAt
IFJJU0MtViBIYXJ0IENhcGFiaWxpdGllcyBUYWJsZQo+Cj4gLS0KPiAyLjQzLjAKPgoKVGhhbmtz
LApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
