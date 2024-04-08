Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F27C67861
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nfzxdB2gS9ux365HBLsUw7qATShZWrK28ngyZ+3g4Q=; b=pi8flixxN5oIch
	ulMQwwqNU6agTRJaljBT29FxSOQZV9iLItkysstXqn7YGqpaA4dDtypie9mYPyBV7kHk0VHw5PBrp
	3T/ksfzscHdq/ZjXGXI2o1Ys8htyeVCodCx69/p/lIf/BenQ6sfkj8IdgTcQlb4Ov981G4hFHmmCc
	Pgol0T1Buj3TTcpKu9JMgBJVZE8XThhGBv7QqjqwJBFBC8nRN3n1dZ5e0LLKLXjB1ltDlzrhkOtPR
	U10f22Oka64c835WimDOtPEJasM6+Rh5Jabhrz6vUJ4P6NEsoOdMMFCBOPqH9DKhYbV6gfPa82g7M
	dpstYv4bnknTiPb0u+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtpUO-0000000FnBS-2Uhv;
	Mon, 08 Apr 2024 13:56:48 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtpUF-0000000Fn5Z-3VBs
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 13:56:46 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-56e6282dd72so1085409a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712584591; x=1713189391; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HouYfKm/vbFF+MRwsN8TGC5IOl3e3LWdHM07dIc/WTc=;
        b=AmXzHaMXjZ/0hTuheTc0rS5w8giOalMLrhL6YGEWjG57YXupcSAdEjkfYOmTiuPvIT
         QCkvAP65o0kbmJsaynbs6YdZuE7isZZps65+J5mphRxVRWVyObraZbuT8i2HT0/JhBdO
         VIoYPar8YRQYMbjxAZh2a2nLIhXQRyzrUahsvY4S/btTWY5lP/ZJg+dU+mcTmAAVzkHB
         pbDSW2NSduGTsYz+HH6jAF8yP1YW/VeEJJWhcdcFqq3SNjiN6ZuC+ET4XGxwWEGVP+Jb
         Ev0lhRWMvUVBDt/tbnMWVk8uq5s+CX1vZQdtaJiz8zCKL/5kc2J/9UrnzrxIHyrNUQeH
         5h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712584591; x=1713189391;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HouYfKm/vbFF+MRwsN8TGC5IOl3e3LWdHM07dIc/WTc=;
        b=O+aeLJpA3hO18klXh1AUNzuT6hF5+3vrtpCKNgpiTNuUDlF+F3unSWfJBrL2Cqq/fJ
         p3JFPZi5uRNAIHTwBDs23UNS8KNVApiyA5dI1HwuT+HQOupVEaCwmNkzkEWy50lz6s70
         dsMjL0ErMW0zV4HvOejvscVuG2DnV24miT9Gj49HZF/+SWgZl8B76/j4sMAj0SPYJ4Gd
         Zlh9xCtbjKvUrd2PpjMkMeqNSlFOmzJTbmYLbAEHkyD82UXqRn+Keuwx+hhgakkMx/lk
         H7E1gwm8aVsg3OfI1CIRPLDswnFZLcZtAC6TkavpVqsEABvtCndkKlOYTbzeVH5fh/Aa
         28Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWx1ZszwrXO2S5geJvpPuhXbttqwXFQF3HycPPgESyed/l6Whj1J8G5lQdhSc8q1HnCw10Kd9qLLfmTZ9qSKmycWhzi0rAlgRO1fZSW9aM0
X-Gm-Message-State: AOJu0Yxztsyo0bnc/LGDgtVoMlp3gYCZWQEi592eaww8VoeovWbF+i2u
	MJbi2L96phLfRNBTFRkn5uxxUyF7AD8LJcqtV76xZpzA29MRBLIkXLR1Rf7jVV8=
X-Google-Smtp-Source: AGHT+IFCR6IVjnRfqcicpDUul4U3E/WyEXX7mJYk1JMhoPOsAD3BJiAacEb6ue8OHNcClunSa9X47g==
X-Received: by 2002:a50:d7dd:0:b0:56e:368c:b09d with SMTP id m29-20020a50d7dd000000b0056e368cb09dmr5287787edj.24.1712584591268;
        Mon, 08 Apr 2024 06:56:31 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id de26-20020a056402309a00b0056c1cca33bfsm4104247edb.6.2024.04.08.06.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 06:56:30 -0700 (PDT)
Date: Mon, 8 Apr 2024 15:56:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/5] Add parsing for Zimop ISA extension
Message-ID: <20240408-8d245caaaeddc6a23e39d6dd@orel>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
 <20240405-091c6c174f023d74b434059d@orel>
 <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
 <ddc5555a-3ae8-42e5-a08a-ca5ceaf0bf28@rivosinc.com>
 <20240408-6c93f3f50b55234f3825ca33@orel>
 <89d4a24c-db24-487b-8c5c-bdc1fa2d42b4@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89d4a24c-db24-487b-8c5c-bdc1fa2d42b4@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_065639_992169_EC6D3BB8 
X-CRM114-Status: GOOD (  35.58  )
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

T24gTW9uLCBBcHIgMDgsIDIwMjQgYXQgMDE6MTk6MzlQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDA4LzA0LzIwMjQgMTM6MDMsIEFuZHJldyBKb25lcyB3cm90ZToK
PiA+IE9uIE1vbiwgQXByIDA4LCAyMDI0IGF0IDEwOjAxOjEyQU0gKzAyMDAsIENsw6ltZW50IEzD
qWdlciB3cm90ZToKPiA+Pgo+ID4+Cj4gPj4gT24gMDUvMDQvMjAyNCAxOTozMywgRGVlcGFrIEd1
cHRhIHdyb3RlOgo+ID4+PiBPbiBGcmksIEFwciA1LCAyMDI0IGF0IDg6MjbigK9BTSBBbmRyZXcg
Sm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBPbiBU
aHUsIEFwciAwNCwgMjAyNCBhdCAxMjozMjo0NlBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3Jv
dGU6Cj4gPj4+Pj4gVGhlIFppbW9wIElTQSBleHRlbnNpb24gd2FzIHJhdGlmaWVkIHJlY2VudGx5
LiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQKPiA+Pj4+PiBmb3IgcGFyc2luZyBpdCBmcm9tIHJp
c2N2LGlzYSwgaHdwcm9iZSBleHBvcnQgYW5kIGt2bSBzdXBwb3J0IGZvcgo+ID4+Pj4+IEd1ZXN0
L1ZNLgo+ID4+Pj4KPiA+Pj4+IEknbSBub3Qgc3VyZSB3ZSBuZWVkIHRoaXMuIFppbW9wIGJ5IGl0
c2VsZiBpc24ndCB1c2VmdWwsIHNvIEkgZG9uJ3Qga25vdwo+ID4+Pj4gaWYgd2UgbmVlZCB0byBh
ZHZlcnRpc2UgaXQgYXQgYWxsLiBXaGVuIGFuIGV4dGVuc2lvbiBjb21lcyBhbG9uZyB0aGF0Cj4g
Pj4+PiByZWRlZmluZXMgc29tZSBNT1BzLCB0aGVuIHdlJ2xsIGFkdmVydGlzZSB0aGF0IGV4dGVu
c2lvbiwgYnV0IHRoZSBmYWN0Cj4gPj4+PiBaaW1vcCBpcyB1c2VkIGZvciB0aGF0IGV4dGVuc2lv
biBpcyByZWFsbHkganVzdCBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwuCj4gPj4+Cj4gPj4+IE9u
bHkgc2l0dWF0aW9uIEkgc2VlIHRoaXMgY2FuIGJlIHVzZWZ1bCBpcyB0aGlzOi0tCj4gPj4+Cj4g
Pj4+IEFuIGltcGxlbWVudGVyLCBpbXBsZW1lbnRlZCBaaW1vcHMgaW4gQ1BVIHNvbGVseSBmb3Ig
dGhlIHB1cnBvc2UgdGhhdCB0aGV5IGNhbgo+ID4+PiBydW4gbWFpbmxpbmUgZGlzdHJvICYgcGFj
a2FnZXMgb24gdGhlaXIgaGFyZHdhcmUgYW5kIGRvbid0IHdhbnQgdG8gbGV2ZXJhZ2UgYW55Cj4g
Pj4+IGZlYXR1cmUgd2hpY2ggYXJlIGJ1aWx0IG9uIHRvcCBvZiBaaW1vcC4KPiA+Pgo+ID4+IFll
cywgdGhlIHJhdGlvbmFsZSB3YXMgdGhhdCBzb21lIGJpbmFyaWVzIHVzaW5nIGV4dGVuc2lvbnMg
dGhhdCBvdmVybG9hZAo+ID4+IE1PUHMgY291bGQgc3RpbGwgYmUgcnVuLiBXaXRoIFppbW9wIGV4
cG9zZWQsIHRoZSBsb2FkZXIgY291bGQgZGV0ZXJtaW5lCj4gPj4gaWYgdGhlIGJpbmFyeSBjYW4g
YmUgZXhlY3V0ZWQgd2l0aG91dCBwb3RlbnRpYWxseSBjcmFzaGluZy4gV2UgY291bGQKPiA+PiBh
bHNvIGxldCB0aGUgcHJvZ3JhbSBydW4gYW55d2F5IGJ1dCB0aGUgZXhlY3V0aW9uIGNvdWxkIHBv
dGVudGlhbGx5Cj4gPj4gY3Jhc2ggdW5leHBlY3RlZGx5LCB3aGljaCBJTUhPIGlzIG5vdCByZWFs
bHkgZ29vZCBmb3IgdGhlIHVzZXIKPiA+PiBleHBlcmllbmNlIG5vciBmb3IgZGVidWdnaW5nLiBJ
IGFscmVhZHkgdGhpbmsgdGhhdCB0aGUgc2VnZmF1bHRzIHdoaWNoCj4gPj4gaGFwcGVucyB3aGVu
IGV4ZWN1dGluZyBiaW5hcmllcyB0aGF0IG5lZWQgc29tZSBtaXNzaW5nIGV4dGVuc2lvbiBhcmUg
bm90Cj4gPj4gc28gZWFzeSB0byBkZWJ1Zywgc28gYmV0dGVyIGFkZCBtb3JlIGd1YXJkcy4KPiA+
IAo+ID4gT0suIEl0J3Mgb25seSBvbmUgbW9yZSBleHRlbnNpb24gb3V0IG9mIGRvemVucywgc28g
SSB3b24ndCBjb21wbGFpbiBtb3JlLAo+IAo+IE5vIHdvcnJpZXMsIHlvdXIgcG9pbnQgKmlzKiB2
YWxpZCBzaW5jZSBJJ20gbm90IHN1cmUgeWV0IHRoYXQgdGhlIGxvYWRlcgo+IHdpbGwgYWN0dWFs
bHkgZG8gdGhhdCBvbmUgZGF5Lgo+IAo+IEJUVywgYXJlIHlvdSBhd2FyZSBvZiBhbnkgZWZmb3J0
IHRvIG1ha2UgdGhlIGVsZiBkeW5hbWljIGxvYWRlcgo+ICJzbWFydGVyIiBhbmQgYWN0dWFsbHkg
Y2hlY2sgZm9yIG5lZWRlZCBleHRlbnNpb25zIHRvIGJlIHByZXNlbnQgcmF0aGVyCj4gdGhhbiBi
bGluZGx5IHJ1bm5pbmcgdGhlIGVsZiBhbmQgcG90ZW50aWFsbHkgY2F0Y2hpbmcgU0lHSUxMID8K
CkplZmYgTGF3IHRvbGQgbWUgYSBiaXQgYWJvdXQgRk1WIChmdW5jdGlvbiBtdWx0aXZlcnNpb25p
bmcpLiBJIGRvbid0IGtub3cKbXVjaCBhYm91dCB0aGlzLCBidXQsIGZyb20gd2hhdCBoZSdzIHRv
bGQgbWUsIGl0IHNvdW5kcyBsaWtlIHRoZXJlIHdpbGwgYmUKYW4gaWZ1bmMgcmVzb2x2ZXIgd2hp
Y2ggaW52b2tlcyBod3Byb2JlIHRvIGRldGVybWluZSB3aGljaCB2YXJpYW50cyBhcmUKcG9zc2li
bGUvYmVzdCB0byB1c2UsIHNvIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBhdm9pZCBTSUdJTEwg
YnkgYWx3YXlzCmhhdmluZyBhIGJhc2ljIHZhcmlhbnQuCgpUaGFua3MsCmRyZXcKCj4gCj4gVGhh
bmtzLAo+IAo+IENsw6ltZW50Cj4gCj4gPiBidXQgSSB3YXMgdGhpbmtpbmcgdGhhdCBiaW5hcmll
cyB0aGF0IHVzZSBwYXJ0aWN1bGFyIGV4dGVuc2lvbnMgd291bGQKPiA+IGNoZWNrIGZvciB0aG9z
ZSBwYXJ0aWN1bGFyIGV4dGVuc2lvbnMgKHN0ZXAgMiksIHJhdGhlciB0aGFuIFppbW9wLgo+ID4g
Cj4gPiBUaGFua3MsCj4gPiBkcmV3Cj4gPiAKPiA+Pgo+ID4+Pgo+ID4+PiBBcyBhbiBleGFtcGxl
IHppY2ZpbHAgYW5kIHppY2Zpc3MgYXJlIGRlcGVuZGVudCBvbiB6aW1vcHMuIGdsaWJjIGNhbgo+
ID4+PiBkbyBmb2xsb3dpbmcKPiA+Pj4KPiA+Pj4gMSkgY2hlY2sgZWxmIGhlYWRlciBpZiBiaW5h
cnkgd2FzIGNvbXBpbGVkIHdpdGggemljZmlzcyBhbmQgemljZmlscCwKPiA+Pj4gaWYgeWVzIGdv
dG8gc3RlcCAyLCBlbHNlIGdvdG8gc3RlcCA2Lgo+ID4+PiAyKSBjaGVjayBpZiB6aWNmaXNzL3pp
Y2ZpbHAgaXMgYXZhaWxhYmxlIGluIGh3IHZpYSBod3Byb2JlLCBpZiB5ZXMKPiA+Pj4gZ290byBz
dGVwIDUuIGVsc2UgZ290byBzdGVwIDMKPiA+Pj4gMykgY2hlY2sgaWYgemltb3AgaXMgYXZhaWxh
YmxlIHZpYSBod3Byb2JlLCBpZiB5ZXMgZ290byBzdGVwIDYsIGVsc2UgZ290byBzdGVwIDQKPiA+
Pgo+ID4+IEkgdGhpbmsgeW91IG1lYW50IHN0ZXAgNSByYXRoZXIgdGhhbiBzdGVwIDYuCj4gPj4K
PiA+PiBDbMOpbWVudAo+ID4+Cj4gPj4+IDQpIFRoaXMgYmluYXJ5IHdvbid0IGJlIGFibGUgdG8g
cnVuIHN1Y2Nlc3NmdWxseSBvbiB0aGlzIHBsYXRmb3JtLAo+ID4+PiBpc3N1ZSBleGl0IHN5c2Nh
bGwuIDwtLSB0ZXJtaW5hdGlvbgo+ID4+PiA1KSBpc3N1ZSBwcmN0bCB0byBlbmFibGUgc2hhZG93
IHN0YWNrIGFuZCBsYW5kaW5nIHBhZCBmb3IgY3VycmVudCB0YXNrCj4gPj4+IDwtLSBlbmFibGUg
ZmVhdHVyZQo+ID4+PiA2KSBsZXQgdGhlIGJpbmFyeSBydW4gPC0tIGxldCB0aGUgYmluYXJ5IHJ1
biBiZWNhdXNlIG5vIGhhcm0gY2FuIGJlIGRvbmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
