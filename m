Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7450BC61CE7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 18:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=t+Cs68s/+iAnQFKrf3FgG65YlvhKT0pYj0QzyZvdQAE=; b=zoTh8s9ogdRV6dkH3vhqopLYjx
	T8qzM9k+ZO7nymQonGsEQ9VbfR/JfFwY5/+zAadBaxW33g5D9laongjzum/fKDarlCyzggwQlgLjM
	saPiNNe7+tdf0Apwk0tc0laJdgsjxGRtdZiDPCRjmpU8m84jtZb+dvvDrgdxPkUlYXjAhwhVm+pg9
	UlCqG8KwZNUKFnSkOVB1MGdizdovawS6UsZLUZVpFDRAUoMT1PPxGghZvKhhQEw6VBEdeiZPugSJy
	rcKBEZMY4VV/vhH1gFyxtPmTG/YAbslFLgJxs0O+F5WG4ruU3gM0XXL4spjq2H0HZZYT2rXFzSpoy
	BWOdCInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbi0-00000000nMO-3vI7;
	Fri, 06 Jun 2025 18:22:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbhw-00000000nLg-05QK
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 18:22:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-234d366e5f2so29103725ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749234143; x=1749838943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZrMvaEHkl3yooXaY3MSFj8fFjzuxvYEiXVTkirVIzk=;
        b=O3gZyIS4ai6JYEaF8GvVa90L05+M9piWHZLxFKpFuD1Dm+gFM1T9cqc9tPjTKn8qUm
         X2RV0pZkoYaBrx592oROWFYFfy2jppWn2z9tptRfcDn1hbMIE3Wt8Andne2pDgZkr+zl
         H+269NVMggNWd+KoeO9/4L6DRxcOwhWK61a2GI5ccyXZvOZoz5KN8KQ0FO//YVAMs01W
         FbCh9XKVCqKH/g3/Tde3rqCSgzrgF12oVTHTG1Lk0+MVCNoF41vP2eS+ZLWr8a8VUoI8
         nFBQSbNw3L9cdQgCXAiXQX4nXSHsOWYZs58QhlXiQFxwZ+n21phcZmjp92BiLIdFNS3R
         ThbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749234143; x=1749838943;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZrMvaEHkl3yooXaY3MSFj8fFjzuxvYEiXVTkirVIzk=;
        b=K68lKJgMevGmvpoM0FLas/NmagMIz2l3F3XBm7nKAs2UysVSBsOCwNIP+2iS/5LkYC
         BahDnt0gc0JM6F0kwTTiYvLa+yJ67xi+T9CxWidSzawjxHmQJ+9cge8QhoQw9Rh+2xDq
         +pmkdT9DtLLdkBNdFkhxvGfCY08R/tzrqIJAfPLje4zptdYzj2nopstnIXwsohrlqsE1
         PkiebbKkG0MUjIqf2/veUpOErCNsdcLzrbh2EoiPtsAiTdzHexkF4Wjv04gxUjjA2w/Y
         TOEDf7sSetkP2oYi3i43H8JJ/KrnpTt0SQ+5X5cZJaqCQDmrl0YiMHK7SCB46IFwO3uA
         18lw==
X-Forwarded-Encrypted: i=1; AJvYcCVZYQQSKdsiBqYxPtjXXXxU5v8jiH7MhKewcyj6dt8/CChYk0RPYF4Y3QS63lCW/CpBmV0ZIoF7qk9yvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvn5bGowe4cbXPOd5SveQb0AW06M50RFTz/sqmEL3pVr9Ey9C/
	fzmEXnRFEiVRLoY+DU+xVwCqMYWKW9WiYb2YuyuM5ONgnIh28IcCZVFWVCRIOVJZkgA=
X-Gm-Gg: ASbGncvaHOd5Pdop1GgJzSmp14AKmPg97+zoxXp52vvoYKxypElOchHtSWTljkGZHj6
	KNgyWFvtJh4zraYPVMX2a8cqX7DiyQVLzAc34uSxDy72NON0cjWMpQkqLtJuWDqzevbuOAzs+U6
	X00vPxqlIb8ifUgSiUJSB4F0dMH2Ch3mu3r4fYNYud0Os5TwisO7809mnyxGmddZx9uuC9bAMIp
	e9Td4JGaXSvD3GB8lnFfR3ZQhbsZydtbuJXZpW4S0XQ6fi7Su+eiWVHkLAgxImcy9f8w8o1XcZp
	fh5qj/ilUqq4dvxbidlRwOjmvE52+5Vw0CMfPJkjnRs5a2OAnjyJ7i4=
X-Google-Smtp-Source: AGHT+IGMlluHec06cdDvnE+fsfsOP8CEZrDoNNmjzyHDnUqsJgq7fMhrAUqDcdxh0pOY9mNBmLtDoA==
X-Received: by 2002:a17:902:d483:b0:235:e1d6:4e29 with SMTP id d9443c01a7336-23601dc0136mr70329185ad.36.1749234143099;
        Fri, 06 Jun 2025 11:22:23 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:2724])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-236030788a1sm15357385ad.16.2025.06.06.11.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:22:22 -0700 (PDT)
Date: Fri, 06 Jun 2025 11:22:22 -0700 (PDT)
X-Google-Original-Date: Fri, 06 Jun 2025 11:22:16 PDT (-0700)
Subject: Re: [PATCH v8] riscv: mm: Add support for Svinval extension
In-Reply-To: <CAN37VV4ohoi48BAM1-OTdSGe9yD=2Eh84pKsHLsWQSaRadJ7tw@mail.gmail.com>
CC: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  alexghiti@rivosinc.com, samuel.holland@sifive.com, ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mchitale@ventanamicro.com
Message-ID: <mhng-BE91CAF1-2E4D-45A2-A21A-FD613551610D@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_112224_065668_31AF2C69 
X-CRM114-Status: GOOD (  42.48  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMiBNYXkgMjAyNSAwODoxMTowOSBQRFQgKC0wNzAwKSwgbWNoaXRhbGVAdmVudGFu
YW1pY3JvLmNvbSB3cm90ZToKPiBIaSBBbGV4LAo+Cj4gT24gVHVlLCBNYXkgMjAsIDIwMjUgYXQg
MTA6MjXigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Pgo+PiBI
aSBNYXl1cmVzaCEKPj4KPj4gT24gNy8zMC8yNCAxMDo0MywgTWF5dXJlc2ggQ2hpdGFsZSB3cm90
ZToKPj4gPiBPbiBXZWQsIEp1bCAyNCwgMjAyNCBhdCA4OjIw4oCvUE0gUGFsbWVyIERhYmJlbHQg
PHBhbG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4+ID4+IE9uIFR1ZSwgMDIgSnVsIDIwMjQgMDM6
MjY6MzcgUERUICgtMDcwMCksIG1jaGl0YWxlQHZlbnRhbmFtaWNyby5jb20gd3JvdGU6Cj4+ID4+
PiBUaGUgU3ZpbnZhbCBleHRlbnNpb24gc3BsaXRzIFNGRU5DRS5WTUEgaW5zdHJ1Y3Rpb24gaW50
byBmaW5lci1ncmFpbmVkCj4+ID4+PiBpbnZhbGlkYXRpb24gYW5kIG9yZGVyaW5nIG9wZXJhdGlv
bnMgYW5kIGlzIG1hbmRhdG9yeSBmb3IgUlZBMjNTNjQgcHJvZmlsZS4KPj4gPj4+IFdoZW4gU3Zp
bnZhbCBpcyBlbmFibGVkIHRoZSBsb2NhbF9mbHVzaF90bGJfcmFuZ2VfdGhyZXNob2xkX2FzaWQg
ZnVuY3Rpb24KPj4gPj4+IHNob3VsZCB1c2UgdGhlIGZvbGxvd2luZyBzZXF1ZW5jZSB0byBvcHRp
bWl6ZSB0aGUgdGxiIGZsdXNoZXMgaW5zdGVhZCBvZgo+PiA+PiBEbyB5b3UgaGF2ZSBhbnkgcGVy
Zm9ybWFuY2UgbnVtYmVycyBmb3IgdGhlIG9wdGltaXphdGlvbj8gIEFzIHBlciBoZXJlCj4+ID4+
IDxodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvbWhuZy1mNzk5YmQyYi03ZjIyLTRjMDMtYmRi
Mi05MDNmYTNiNWQ1MDhAcGFsbWVyLXJpLXgxYzlhLz4uCj4+ID4gTm8sIGN1cnJlbnRseSB0aGVy
ZSBhcmUgbm8gbnVtYmVycyBhdmFpbGFibGUgZm9yIGNvbXBhcmlzb24gYnV0IHRoZQo+PiA+IHJh
dGlvbmFsZSBmb3IgdGhlIG9wdGltaXphdGlvbiBpcyBkZXNjcmliZWQgaW4gdGhlIHNwZWMuIFRo
ZSBleHRlbnNpb24KPj4gPiBpcyBtYW5kYXRvcnkgZm9yIHRoZSBSVkEyM1M2NCBwcm9maWxlIGJ1
dCBhbnkgcGxhdGZvcm0gdGhhdCBkb2Vzbid0Cj4+ID4gc3VwcG9ydCB0aGlzIGV4dGVuc2lvbiB3
aWxsIG5vdCBiZSBpbXBhY3RlZCBhcyB0aGUgY29kZSBleGVjdXRlcyBvbmx5Cj4+ID4gaWYgdGhl
IHN2aW52YWwgZXh0ZW5zaW9uIGlzIGVuYWJsZWQgYXQgdGhlIGJvb3QgdXAuCgpJIHNlZW0gdG8g
cmVtZW1iZXIgd3JpdGluZyBzb21ldGhpbmcgbGlrZSB0aGlzIHVwIGF0IHNvbWUgcG9pbnQsIGJ1
dCBJIApkaWRuJ3Qgc2VlIGl0IHNvIEkgZmlndXJlZCBJJ2QganVzdCB3cml0ZSBpdCB1cCBhZ2Fp
biBpbiBjYXNlIGFueW9uZSdzIApsb29raW5nIGluIHRoZSBmdXR1cmUuLi4KCk15IGNvcmUgd29y
cnkgaGVyZSAgaXMgdGhhdCB0aGVyZSdzIHR3byB3YXlzIHRvIHR1c2UgdGhlIFN2aW52YWwgCmV4
dGVuc2lvbjoKCiogVGhpcywgd2hpY2gganVzdCByZXBsYWNlcyB0aGUgc2ZlbmNlLnZtYSB3aXRo
IGEgbG9vcCBvZiBTdmludmFsIAogIGluc3RydWN0aW9ucy4gIFRoaXMga2VlcHMgdGhlIFN2aW52
YWwgaW5zdHJ1Y3Rpb25zIGNsb3NlIHRvIGVhY2ggCiAgb3RoZXIuCiogU29tZSBtb3JlIGV4dGVu
c2l2ZSBtb2RpZmljYXRpb25zIHRvIG1vdmUgdGhlIFN2aW52YWwgaW5zdHJ1Y3Rpb25zIAogIGZh
cnRoZXIgYXBhcnQgZnJvbSBlYWNoIG90aGVyLgoKV2hpY2ggYXBwcm9hY2ggaXMgYmV0dGVyIGlz
IGdvaW5nIHRvIGRlcGVuZCBvbiB3aGF0IHRoZW0gbWljcm9hcmNoaWN0dXJlIAppbXBsZW1lbnRz
OiBkb2VzIGl0IHdhbnQgdGhlIFN2aW52YWwgaW5zdHJ1Y3Rpb25zIGNsb3NlIHRvIGVhY2ggb3Ro
ZXIgc28gCml0IGNhbiBwYXR0ZXJuIG1hdGNoIHRoZW0sIG9yIGRvZXMgaXQgd2FudCB0aGVtIGZh
ciBhcGFydCBzbyB0aGUgCm9yZGVyaW5nIGluc3RydWN0aW9ucyBzdGFsbCBsZXNzLiAgSXQncyBl
bnRpcmVseSBwb3NzaWJsZSB0aGF0IHRoZSB3cm9uZyAKZmxhdm9yIG9mIFN2aW52YWwgd2lsbCBh
Y3R1YWxseSBkZWNyZWFzZSBwZXJmb3JtYW5jZSBvbiBzeXN0ZW1zIHRoYXQgCndlcmUgYnVpbHQg
YXJvdW5kIHRoZSBvdGhlciBmbGF2b3IsIGFuZCB3ZSBkb24ndCBrbm93IHdoaWNoIGZsYXZvciBp
cyAKZ2V0dGluZyBpbXBsZW1lbnRlZC4KClNvIGl0J3Mgbm90IG9uZSBvZiB0aGVzZSBleHRlbnNp
b25zIHdoZXJlIHdlIGNhbiBqdXN0IHNheSAidGhlc2UgYXJlIApvbmx5IHVzZWQgb24gc3lzdGVt
cyB0aGF0IGltcGxlbWVudCB0aGUgZXh0ZW5zaW9ucywgc28gaXQncyBvYnZpb3VzbHkgCmZhc3Rl
ciIuICBXZSByZWFsbHkgbmVlZCBzb21lIG51bWJlcnMgdG8gZGVtb25zdHJhdGUgdGhpcyBmbGF2
b3IgaXMgCmFjdHVhbGx5IGZhc3Rlci4uLgoKPj4gU28gSSBmaW5hbGx5IGhhdmUgc29tZSBudW1i
ZXJzISBJIHRlc3RlZCB0aGlzIHBhdGNoc2V0IG9uIHRoZSBCYW5hbmFQaToKPj4gSSBtZWFzdXJl
ZCB0aGUgbnVtYmVyIG9mIGN5Y2xlcyB3aGVuIGZsdXNoaW5nIDY0IGVudHJpZXMgKHdoaWNoIGlz
IG91cgo+PiBjdXJyZW50IHRocmVzaG9sZCkgYW5kIEkgbWFkZSBzdXJlIHRvIHRvdWNoIHRoZSBl
bnRyaWVzIGJlZm9yZWhhbmQuCj4+Cj4+IEhlcmUgdGhleSBhcmU6Cj4+Cj4+ICogc3ZpbnZhbDoK
Pj4KPj4gI2N5Y2xlczogMzY0OTIwCj4+ICNjeWNsZXM6IDM2NTg1Ngo+PiAjY3ljbGVzOiAzNjc5
OTMKPj4KPj4gKiAhc3ZpbnZhbDoKPj4KPj4gI2N5Y2xlczogNjYzNTg1Cj4+ICNjeWNsZXM6IDY2
MzEwNQo+PiAjY3ljbGVzOiA2NjQwNzMKPj4KPgo+IFRoYXQncyBhd2Vzb21lICEhIFRoYW5rIHlv
dSBzbyBtdWNoIGZvciBnZXR0aW5nIHRoZSBkYXRhLgoKU28gSSB0aGluayB0aGF0J3MgZ29vZCBl
bm91Z2ggdG8gc3RhcnQsIHNvIGl0J3MgZ29pbmcgdXAgdG8gTGludXMgYW5kIApob3BlZnVsbHkg
aXQgbGFuZHMgKHRoZXJlJ3MgYmVlbiBhIGJpdCBvZiBjaGFvcywgYnV0IGhvcGVmdWxseSB0aGF0
J3MgCmFsbCBzb3J0ZWQgb3V0KS4KCj4+IFNvIHRoYXQncyByb3VnaGx5IC8yIHVzaW5nIHN2aW52
YWwuIFRvIG1lIHRoYXQncyBnb29kIGVub3VnaCB0byBtZXJnZQo+PiB0aGF0IGZvciA2LjE2IDop
CgpZYSwgYnV0IHByb2JhYmx5IGxvdyBlbm91Z2ggdGhhdCB3ZSdyZSBnb2luZyB0byB3YW50IGEg
bG93ZXIgdGhyZXNob2xkIAp0b28gLS0gaWYgdGhlIHN2aW52YWwgbG9vcCBpcyBvbmx5IGEgZmFj
dG9yIG9mIDIgZmFzdGVyIGZvciA2NCBlbnRyaWVzLCAKaXQncyBwcm9iYWJseSBnb2luZyB0byBl
bmQgdXAgc2xvd2VyIGF0IHNvbWUgcG9pbnQuLi4KCk9uIHRoZSBmbGlwIHNpZGUsIGl0J3MgYSBi
aWcgZW5vdWdoIGNoYW5nZSB0aGF0IHdlIHByb2JhYmx5IHdhbnQgdG8gCnJlLWV2YWx1YXRlIHRs
Yl9mbHVzaF9hbGxfdGhyZXNob2xkLCB0b28uCgo+PiBTb3JyeSBmb3IgdGhlIHZlcnkgdmVyeSBs
b25nIGRlbGF5IGFuZCB0aGFua3MgYWdhaW4gZm9yIHRoZSBtdWx0aXBsZQo+PiByZXZpc2lvbnMh
Cj4+Cj4+IEFsZXgKPj4KPj4KPj4gPj4+IGEgc2ltcGxlIHNmZW5jZS52bWE6Cj4+ID4+Pgo+PiA+
Pj4gc2ZlbmNlLncuaW52YWwKPj4gPj4+IHN2aW52YWwudm1hCj4+ID4+PiAgICAuCj4+ID4+PiAg
ICAuCj4+ID4+PiBzdmludmFsLnZtYQo+PiA+Pj4gc2ZlbmNlLmludmFsLmlyCj4+ID4+Pgo+PiA+
Pj4gVGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbnNlY3V0aXZlIHN2aW52YWwudm1hIGluc3RydWN0
aW9ucyB0aGF0Cj4+ID4+PiBjYW4gYmUgZXhlY3V0ZWQgaW4gbG9jYWxfZmx1c2hfdGxiX3Jhbmdl
X3RocmVzaG9sZF9hc2lkIGZ1bmN0aW9uCj4+ID4+PiBpcyBsaW1pdGVkIHRvIDY0LiBUaGlzIGlz
IHJlcXVpcmVkIHRvIGF2b2lkIHNvZnQgbG9ja3VwcyBhbmQgdGhlCj4+ID4+PiBhcHByb2FjaCBp
cyBzaW1pbGFyIHRvIHRoYXQgdXNlZCBpbiBhcm02NC4KPj4gPj4+Cj4+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBNYXl1cmVzaCBDaGl0YWxlIDxtY2hpdGFsZUB2ZW50YW5hbWljcm8uY29tPgo+PiA+Pj4g
UmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4+ID4+
PiAtLS0KPj4gPj4+IENoYW5nZXMgaW4gdjg6Cj4+ID4+PiAtIEZpeCBsaW5lIHdyYXAKPj4gPj4+
IC0gQWRkIFJCIHRhZwo+PiA+Pj4KPj4gPj4+IENoYW5nZXMgaW4gdjc6Cj4+ID4+PiAtIFVzZSBl
eGlzdGluZyBzdmludmFsIG1hY3JvcyBpbiB0aGUgaW5zbi1kZWYuaAo+PiA+Pj4gLSBSZW5hbWUg
bG9jYWxfc2ludmFsX3ZtYV9hc2lkIHRvIGxvY2FsX3NpbnZhbF92bWEKPj4gPj4+Cj4+ID4+PiBD
aGFuZ2VzIGluIHY2Ogo+PiA+Pj4gLSBSZWJhc2Ugb24gbGF0ZXN0IHRvcnZhbGRzL21hc3Rlcgo+
PiA+Pj4KPj4gPj4+IENoYW5nZXMgaW4gdjU6Cj4+ID4+PiAtIFJlZHVjZSB0bGIgZmx1c2ggdGhy
ZXNob2xkIHRvIDY0Cj4+ID4+PiAtIEltcHJvdmUgaW1wbGVtZW50YXRpb24gb2YgbG9jYWxfZmx1
c2hfdGxiKiBmdW5jdGlvbnMKPj4gPj4+Cj4+ID4+PiBDaGFuZ2VzIGluIHY0Ogo+PiA+Pj4gLSBS
ZWJhc2UgYW5kIHJlZmFjdG9yIGFzIHBlciBsYXRlc3QgY2hhbmdlcyBvbiB0b3J2YWxkcy9tYXN0
ZXIKPj4gPj4+IC0gRHJvcCBwYXRjaCAxIGluIHRoZSBzZXJpZXMKPj4gPj4+Cj4+ID4+PiBDaGFu
Z2VzIGluIHYzOgo+PiA+Pj4gLSBGaXggaW5jb3JyZWN0IHZtYSB1c2VkIGZvciBzaW52YWwgaW5z
dHJ1Y3Rpb25zCj4+ID4+PiAtIFVzZSB1bmlmaWVkIHN0YXRpYyBrZXkgbWVjaGFuaXNtIGZvciBz
dmludmFsCj4+ID4+PiAtIFJlYmFzZWQgb24gdG9ydmFsZHMvbWFzdGVyCj4+ID4+Pgo+PiA+Pj4g
Q2hhbmdlcyBpbiB2MjoKPj4gPj4+IC0gUmViYXNlZCBvbiA1LjE4LXJjMwo+PiA+Pj4gLSB1cGRh
dGUgcmlzY3ZfZmlsbF9od2NhcCB0byBwcm9iZSBTdmludmFsIGV4dGVuc2lvbgo+PiA+Pj4KPj4g
Pj4+ICAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPj4g
Pj4+Cj4+ID4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9y
aXNjdi9tbS90bGJmbHVzaC5jCj4+ID4+PiBpbmRleCA5YjZlODZjZTM4NjcuLjc4MjE0N2E2M2Yz
YiAxMDA2NDQKPj4gPj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+PiA+Pj4gKysr
IGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4+ID4+PiBAQCAtNiw2ICs2LDI3IEBACj4+ID4+
PiAgICNpbmNsdWRlIDxsaW51eC9odWdldGxiLmg+Cj4+ID4+PiAgICNpbmNsdWRlIDxhc20vc2Jp
Lmg+Cj4+ID4+PiAgICNpbmNsdWRlIDxhc20vbW11X2NvbnRleHQuaD4KPj4gPj4+ICsjaW5jbHVk
ZSA8YXNtL2NwdWZlYXR1cmUuaD4KPj4gPj4+ICsKPj4gPj4+ICsjZGVmaW5lIGhhc19zdmludmFs
KCkgICAgICAgIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TVklO
VkFMKQo+PiA+Pj4gKwo+PiA+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9zZmVuY2VfaW52
YWxfaXIodm9pZCkKPj4gPj4+ICt7Cj4+ID4+PiArICAgICBhc20gdm9sYXRpbGUoU0ZFTkNFX0lO
VkFMX0lSKCkgOjo6ICJtZW1vcnkiKTsKPj4gPj4+ICt9Cj4+ID4+PiArCj4+ID4+PiArc3RhdGlj
IGlubGluZSB2b2lkIGxvY2FsX3NmZW5jZV93X2ludmFsKHZvaWQpCj4+ID4+PiArewo+PiA+Pj4g
KyAgICAgYXNtIHZvbGF0aWxlKFNGRU5DRV9XX0lOVkFMKCkgOjo6ICJtZW1vcnkiKTsKPj4gPj4+
ICt9Cj4+ID4+PiArCj4+ID4+PiArc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX3NpbnZhbF92bWEo
dW5zaWduZWQgbG9uZyB2bWEsIHVuc2lnbmVkIGxvbmcgYXNpZCkKPj4gPj4+ICt7Cj4+ID4+PiAr
ICAgICBpZiAoYXNpZCAhPSBGTFVTSF9UTEJfTk9fQVNJRCkKPj4gPj4+ICsgICAgICAgICAgICAg
YXNtIHZvbGF0aWxlKFNJTlZBTF9WTUEoJTAsICUxKSA6IDogInIiICh2bWEpLCAiciIgKGFzaWQp
IDogIm1lbW9yeSIpOwo+PiA+Pj4gKyAgICAgZWxzZQo+PiA+Pj4gKyAgICAgICAgICAgICBhc20g
dm9sYXRpbGUoU0lOVkFMX1ZNQSglMCwgemVybykgOiA6ICJyIiAodm1hKSA6ICJtZW1vcnkiKTsK
Pj4gPj4+ICt9Cj4+ID4+Pgo+PiA+Pj4gICAvKgo+PiA+Pj4gICAgKiBGbHVzaCBlbnRpcmUgVExC
IGlmIG51bWJlciBvZiBlbnRyaWVzIHRvIGJlIGZsdXNoZWQgaXMgZ3JlYXRlcgo+PiA+Pj4gQEAg
LTI2LDYgKzQ3LDE2IEBAIHN0YXRpYyB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV90aHJlc2hv
bGRfYXNpZCh1bnNpZ25lZCBsb25nIHN0YXJ0LAo+PiA+Pj4gICAgICAgICAgICAgICAgcmV0dXJu
Owo+PiA+Pj4gICAgICAgIH0KPj4gPj4+Cj4+ID4+PiArICAgICBpZiAoaGFzX3N2aW52YWwoKSkg
ewo+PiA+Pj4gKyAgICAgICAgICAgICBsb2NhbF9zZmVuY2Vfd19pbnZhbCgpOwo+PiA+Pj4gKyAg
ICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnJfcHRlc19pbl9yYW5nZTsgKytpKSB7Cj4+ID4+
PiArICAgICAgICAgICAgICAgICAgICAgbG9jYWxfc2ludmFsX3ZtYShzdGFydCwgYXNpZCk7Cj4+
ID4+PiArICAgICAgICAgICAgICAgICAgICAgc3RhcnQgKz0gc3RyaWRlOwo+PiA+Pj4gKyAgICAg
ICAgICAgICB9Cj4+ID4+PiArICAgICAgICAgICAgIGxvY2FsX3NmZW5jZV9pbnZhbF9pcigpOwo+
PiA+Pj4gKyAgICAgICAgICAgICByZXR1cm47Cj4+ID4+PiArICAgICB9Cj4+ID4+PiArCj4+ID4+
PiAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX3B0ZXNfaW5fcmFuZ2U7ICsraSkgewo+PiA+Pj4g
ICAgICAgICAgICAgICAgbG9jYWxfZmx1c2hfdGxiX3BhZ2VfYXNpZChzdGFydCwgYXNpZCk7Cj4+
ID4+PiAgICAgICAgICAgICAgICBzdGFydCArPSBzdHJpZGU7Cj4+ID4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+ID4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
