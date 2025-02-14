Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C88C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqN0ZN2HkjJcu99h7q97CBrVm6egnC6lYY30TlDzKEU=; b=mAtdsAmMwZP4FZ
	1Iyprz53p65KkFzc5qvZHel4sae1VsJ/U6mXmCBlCmTqywHEzR/K7X1byx7Nx7Njgt/yHOS2EKlfC
	0b4mfYhfugn0gdWoUyukIYGtxZnR0oGAVMU7PkvxHNrUQWNu9SeV22xWQnPGZP0h/EP/vdhpp5Ytw
	A6ssPwpMPv9XPUEOIGVSUoN4M8Yecri+wXKi26enYSYIaz1SCpsWiuGLlZl12fMvGF/chKdcVBjz3
	6MSNsjFUqnuwVtILhfsU4YjhOCWQpFvAlDBJ0ihVx2VjdRy5EJf72/cfx738NXxxDDKUTBU1hiaLe
	imNldGQTR7nJqqncHffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuzO-0000000ErLq-3uVX;
	Fri, 14 Feb 2025 12:40:14 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuzM-0000000ErJt-2RiP
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 12:40:13 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5ded1395213so2869652a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 04:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739536810; x=1740141610; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36JVfaYsMA1yjpWbwombcPibEH3++Dm1p834NYi7GjY=;
        b=iokgK/uUYgxYATkIGjqyf/bOCjCssIUdlTJu9E3Yb/opZeIy46eI9KaTXUygpohKFo
         IB/ZvXp/pYW90jB5l+GK+W3NJHH1z6eub5WKeCzoabwBH5F0+zL1L18lsA0sKTptNugo
         gCvLeJo/G2Y9xqsSUrKKmp+FJZyX+YKRBC5ahuZyDJbVi5SUK20YADFIWsNu1lIhWIs4
         oNH3A6fan0FYKkZfH7NA/Gw92kRog4aZJNo816yhSKQVPdG0/c4tJdtDPMQfni+cR8aT
         YMpOIQW9cl4H3vwnQoNPaQ+9w674OewZ3ZLjWWkV4ouOa6Bt4pjtp4uvFLaziM3ZiOHL
         3/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739536810; x=1740141610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36JVfaYsMA1yjpWbwombcPibEH3++Dm1p834NYi7GjY=;
        b=bG7X2GrL40kRJBG3vqICBTcQzkeSAEky+TNCpSWtdJEmdfDHw7F2cuQ+IARw80L5TU
         sStaGKR1j7+TTpVtImLf09ZeWARt8wc+hAjMgCTCVwC60iQbZQLXnoVf3uwXMWeqQSg4
         7BBv6YDDUz0RmLd580p8xNZDWRZcD/nEfWb23jN+hN1ZC6WGPjSoukBnYtBI6TcjezZu
         U8kZxnR7ypWAK+xz63AqehduU73CTKIIk7BmFdJiZUC7UD7poFQFffemtRyzKO4CDq5p
         0i2HMNKAZT+7CTogzCdzugjubb9H3XjlI0bd4K2VlnlhFOoHJWULhkl5suaJ/HCTwPpm
         iRRg==
X-Forwarded-Encrypted: i=1; AJvYcCWhRiJrdsYjzPPsthO76pGei9Rlcdr9gLbcE9fgaeDplWBiLsP0WEXJ95fbLHNtijXr6NsM5PfV8xh8Vw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yza+XGVTx9b/kSP8G0lB2VBwAlTT/pbA9uWDScPoTz4HmlSvghr
	OwbOe74Cl1QrK1qOvxSCCx+BI+HBdDzb644yZgJ+s9M/8hnqIL5dp31n6eZb/eVGD7m4zBByE3X
	wWS6DDGZt+QGae53O6pJlk5UxbXDKQsdAneKSaA==
X-Gm-Gg: ASbGnctMABlGSea3/f8zOlaNzW66q2YQJBVjNK94QnrPtOQHNl0TGo7lFFuluvUehqp
	X9CHLl4ACYTqnmRlIDfct6hVKiJZ15TR7G/jgYS5/dA6gtPNCs7H72pBb3uZINJo3tZgQoz0Ir7
	cKghpWKeEhecsj1TJIxWmZZ5RdpzdtEg==
X-Google-Smtp-Source: AGHT+IFINGXcloPLWY70sK+aKs3hrkvh5XEIarAY+7Qnm9+bPaz2Y4r4q5IenGXk077X8b2/k5JVm3DlphyYM3UHP04=
X-Received: by 2002:a05:6402:2788:b0:5db:f26d:fff8 with SMTP id
 4fb4d7f45d1cf-5dec9ffa08emr5908259a12.22.1739536810465; Fri, 14 Feb 2025
 04:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
 <20250127093530.19548-3-alexghiti@rivosinc.com> <Z5ePZt61CM84Hb36@casper.infradead.org>
In-Reply-To: <Z5ePZt61CM84Hb36@casper.infradead.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 14 Feb 2025 13:39:59 +0100
X-Gm-Features: AWEUYZnHz0DxGK1Ovcy4paeZs4bS-kYqEUuZDZsciI4W-HbFUkIFcKN0yQFuh38
Message-ID: <CAHVXubhf7aMwsKA0H9OvTg2Lk8U7+bwntVT9Cm-7L4o7=LM4TQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] riscv: Restore the pfn in a NAPOT pte when
 manipulated by core mm code
To: Matthew Wilcox <willy@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_044012_615483_FCAA2A15 
X-CRM114-Status: GOOD (  24.00  )
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

SGkgTWF0dGhldywKClNvcnJ5IGZvciB0aGUgdmVyeSBsYXRlIHJlcGx5LCB0aGUgZmx1IGhpdCBt
ZSEKCk9uIE1vbiwgSmFuIDI3LCAyMDI1IGF0IDI6NTHigK9QTSBNYXR0aGV3IFdpbGNveCA8d2ls
bHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAyNywgMjAyNSBhdCAxMDoz
NToyM0FNICswMTAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiArI2lmZGVmIENPTkZJR19S
SVNDVl9JU0FfU1ZOQVBPVAo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcHRlcyhzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICBwdGVfdCAqcHRlcCwgcHRlX3QgcHRldmFsLCB1bnNpZ25lZCBpbnQgbnIpCj4gPiAr
ewo+ID4gKyAgICAgaWYgKHVubGlrZWx5KHB0ZV92YWxpZF9uYXBvdChwdGV2YWwpKSkgewo+ID4g
KyAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIgPSBpbG9nMihucik7Cj4gPiArCj4gPiAr
ICAgICAgICAgICAgIGlmICghaXNfbmFwb3Rfb3JkZXIob3JkZXIpKSB7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgKiBTb21ldGhpbmcncyB3
ZWlyZCwgd2UgYXJlIGdpdmVuIGEgTkFQT1QgcHRlIGJ1dCB0aGUKPgo+IE5vLCBub3RoaW5nIGlz
IHdlaXJkLiAgVGhpcyBjYW4gaGFwcGVuIHVuZGVyIGEgbG90IG9mIGRpZmZlcmVudAo+IGNpcmN1
bXN0YW5jZXMuICBGb3IgZXhhbXBsZSwgb25lIG1pZ2h0IG1tYXAoKSBwYXJ0IG9mIGEgZmlsZSBh
bmQgdGhlCj4gZm9saW8gY29udGFpbmluZyB0aGUgZGF0YSBpcyBvbmx5IHBhcnRpYWxseSBtYXBw
ZWQuCgpJIGRvbid0IHNlZSBob3cvd2hlbiB3ZSB3b3VsZCBtYXJrIGEgUFRFIGFzIG5hcG90IGlm
IHdlIHRyeSB0byBtbWFwIGFuCmFkZHJlc3MgdGhhdCBpcyBub3QgYWxpZ25lZCBvbiB0aGUgc2l6
ZSBvZiBhIG5hcG90IG1hcHBpbmcgb3IgZG9lcyBub3QKaGF2ZSBhIG5hcG90IG1hcHBpbmcgc2l6
ZS4KCj4gVGhlIGZpbGVzeXN0ZW0gLwo+IHBhZ2UgY2FjaGUgbWlnaHQgY2hvb3NlIHRvIHVzZSBh
IGZvbGlvIG9yZGVyIHRoYXQgaXNuJ3Qgb25lIG9mIHlvdXIKPiBtYWdpYyBoYXJkd2FyZSBvcmRl
cnMuCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgKiBzaXplIG9mIHRoZSBtYXBwaW5nIGlz
IG5vdCBhIGtub3duIE5BUE9UIG1hcHBpbmcKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgKiBz
aXplLCBzbyBjbGVhciB0aGUgTkFQT1QgYml0IGFuZCBtYXAgdGhpcyB3aXRob3V0Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICogTkFQT1Qgc3VwcG9ydDogY29yZSBtbSBvbmx5IG1hbmlwdWxh
dGVzIHB0ZSB3aXRoIHRoZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAqIHJlYWwgcGZuIHNv
IHdlIGtub3cgdGhlIHB0ZSBpcyB2YWxpZCB3aXRob3V0IHRoZSBOCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICogYml0Lgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHByX2VycigiSW5jb3JyZWN0IE5BUE9UIG1hcHBpbmcsIHJlc2V0dGlu
Zy5cbiIpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHB0ZXZhbCA9IHB0ZV9jbGVhcl9uYXBv
dChwdGV2YWwpOwo+ID4gKyAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIC8qCj4gPiArICAgICAgICAgICAgICAgICAgICAgICogTkFQT1QgcHRlcyB0aGF0IGFy
cml2ZSBoZXJlIG9ubHkgaGF2ZSB0aGUgTiBiaXQgc2V0Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICogYW5kIHRoZWlyIHBmbiBkb2VzIG5vdCBjb250YWluIHRoZSBtYXBwaW5nIHNpemUsIHNv
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICogc2V0IHRoYXQgaGVyZS4KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAgICAgICAgICAgICBwdGV2YWwgPSBwdGVf
bWtuYXBvdChwdGV2YWwsIG9yZGVyKTsKPgo+IFlvdSdyZSBhc3N1bWluZyB0aGF0IHB0ZXZhbCBp
cyBhbGlnbmVkIHRvIHRoZSBvcmRlciB0aGF0IHlvdSd2ZQo+IGNhbGN1bGF0ZWQsIGFuZCBhZ2Fp
biB0aGF0J3Mgbm90IHRydWUuICBGb3IgZXhhbXBsZSwgdGhlIHVzZXIgbWF5IGhhdmUKPiBjYWxs
ZWQgbW1hcCgpIG9uIHJhbmdlIDB4MjEwMDAtMHg0MDAwMCBvZiBhIGZpbGUgd2hpY2ggaXMgY292
ZXJlZCBieQo+IGEgMTI4a0IgZm9saW8uICBZb3UnbGwgYmUgY2FsbGVkIHdpdGggYSBwdGV2YWwg
cG9pbnRpbmcgdG8gMHgyMTAwMCBhbmQKPiBjYWxjdWxhdGUgdGhhdCB5b3UgY2FuIHB1dCBhIDY0
a0IgZW50cnkgdGhlcmUgLi4uIG5vLgoKWWVzLCBJIGFncmVlIHdpdGggdGhpcywgdGhlbiB3ZSBo
YXZlIHRvIGdvIHRocm91Z2ggdGhlIGxpc3Qgb2YgcHRlcwphbmQgY2hlY2sgaWYgaW5zaWRlIHRo
ZSByZWdpb24gd2UgYXJlIGN1cnJlbnRseSBzZXR0aW5nLCBzb21lCnN1YnJlZ2lvbnMgY29ycmVz
cG9uZCB0byBhIG5hcG90IG1hcHBpbmcuCgpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2ssCgpBbGV4
CgoKPgo+IEknZCBzdWdnZXN0IHlvdSBkbyBzb21lIHRlc3Rpbmcgd2l0aCBmc3Rlc3RzIGFuZCB4
ZnMgYXMgeW91ciB1bmRlcmx5aW5nCj4gZmlsZXN5c3RlbS4gIEl0IHNob3VsZCBjYXRjaCB0aGVz
ZSBraW5kcyBvZiBtaXN0YWtlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
