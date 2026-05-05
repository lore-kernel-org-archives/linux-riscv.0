Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0A9FF8855
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 23:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgCFuu94yXlWkrOPFUaYSBpOW1o7xQHGxXBzqIZ5o3s=; b=L/fAMTmduB14hj
	5gcXOomqDjv8fGR34YQ7ZBmIdbD1hQEefuQzR+Qz8o+SkKogu3AJlVWeRkRVCBPTbNsty+Fk18Byj
	0grQGdc9+oyeEJ7J1ADdamjrLZJ3L2+riNQhKJ1X3RqPSSSNej65Gk5nB8yBLKpi7ptHRsKy7TqBe
	ogb5Pdo5RyLIGxMEB4PVskhhsBnRRDdx2S8eYdPQuhHI5fdagFWBT5B1aPCG6ap82ZQ+NhbW4bR9X
	D6nLdNkkqcUyzfxTW7eTJuGFJuZ1bddqVZu19ANHrP+Pmb1XRA2SDSkRgY+qUD4MfjASE9BKe2Vwz
	Vx8JNRVOIe1LPdylcsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKP13-000000008FQ-4ByK;
	Tue, 05 May 2026 23:17:26 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKP0z-000000008Eu-3HsV
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 23:17:23 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6948ed7139eso3188954eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 16:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778023040; cv=none;
        d=google.com; s=arc-20240605;
        b=D5PprGXyQ8XKsvudTZ3JWi1b2juAJGl9IJ97tHnadahbaZAwki2l93VlFFOGjchgm/
         6X+Y7NS+WE6jJgmWaHu/bhr/5WlB3Wl0MUuzMl7d6nlJoPLP/F42ZhwrAeT2cPRqx+Vb
         eKHdqmPmpQj1sY9K3EogdlpZSrSgZTdIAjzz70nGN9n03HRdSR73tH7eYB/J967Wm3Ni
         9A7x5ABipJtK4ZQP6M437MK72KZvM+ygqc9feQlrFTSaaBba+AFIhCb3/sBGI8+kbt0i
         9xISO6fH7LY1tYIhen28VzGpTpByfy01FC2xX6ddYmtLoRV9qdk3NoF6r7YXQWtCmzrk
         D3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mghS3H/aJ6lQNilWcJZ+hFDXZYtt6jkOPJMbybX0bw=;
        fh=8GXFCRyjPeJphk91ApflIsns8wddhV6LscLX6173yLE=;
        b=IKKTnYjTS6mUJfrygoLF/MfqR6jBytZFBZJ7ViXTHysAA1PTSMRAkLqdkZakMuh20+
         rGM3o++O3+CKowanm4Rh2hDBnEqq7aWAGx/gR9wBhUmvKeg9FRna5KYFv/+8cr+Mjvgp
         yMCJgW7gB/d8+hthM/Zv6Q5aD/sjMedZBlWxYUDIQROfU8/Pgp9JyHt4kTAn5SIgWqCv
         hG0pApWNAKOkl9PHgXd4uxIZvYPC1XbeDXavkeVzJI/uAcG0fHqjNMTVLqwBSriqH7Z2
         3753b/XXf9e0f6mHDBWWULZg/inGCRb7KbUzVoQTbgfT93VF0BLsbdLtQSfU+H+h2kDA
         E4Ng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1778023040; x=1778627840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mghS3H/aJ6lQNilWcJZ+hFDXZYtt6jkOPJMbybX0bw=;
        b=C0q+NsGVpES0sgQB3ta2psbkifmq1BZB/NFsFY2KcRBW7E21tIhyV5WPk0lyBVrf5b
         7cvrAV4YhF3bFVulPshw+6HUVrpoXpbWLf5YAn8jUgF23hEnW2ofmTFvOPthR5XEveXL
         LIY2AH4+1xt+R+Thd1nDR3jlIn5sA5H4cZ1oCraJecyf0PPv9vvwy+t4tFLONZjOvL7l
         a3PO7O8G2EbCLKgiaAlY5EguPeKc7TNfd7DWhtO0x5dFB4A3e8HoUyJpYtkRDr4KzTJM
         Iad301zJdtJuBuL1plmacgKhEN6oDPCgJpY8ePahq266dLPESvVlqNceoFcqu6YGXF9h
         fb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778023040; x=1778627840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4mghS3H/aJ6lQNilWcJZ+hFDXZYtt6jkOPJMbybX0bw=;
        b=ObUvs3VnCeJMzKtnB6EhsD17/bi5Ao3gBscv8KjNZAvr3jEgVKf08WkpSUJqWulAdG
         C0/z48Q+z8mmhq+TLQu9gE9At/1ORZZgX9fVi7HsyV6fcLYrjIVlPHkDFGNXid8DDzF/
         OjulXPx/tfk1fN5o7AOCSJ2hN0zUEGYfGX7esZYqq4xKSL+95+vHWcmksdTEAIJe8Dqp
         BKma8FgaA6wXKcwbHC8T5+leJs/tE4ncNfnpNHQc7HR2mZyutHvcLj5bOCykuqigJC8x
         bwbkSdi8bxfYSR8hioD+MxvIADEp//mrZOBhJS95FfFUiCIGIqLh2SOXyTL+fAJG3qlV
         HZFw==
X-Forwarded-Encrypted: i=1; AFNElJ8tNVM30TxKIMx+uPXCXnR+RJp019rHhrTnRUao4NYw5o7KZ4ZNfU9q5Waz6loorthsWogJBGjTiRsDWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ2KaAEKCaIen9LiU2qU/0Hpc+otM7837MObcd1OLE/heR7+81
	+YS6wF4Jvrhh53fosluzg69VL9bRDxsIloO1EbSLWvTK0AzeNK//4gYHMFj+6yvS8V8hiWYwF1x
	F/sZ+Te0BiAhxSd833fzIn4OClV54PyBrl2w7pVnR6w==
X-Gm-Gg: AeBDievcT0jfnnlq9zC/28bwwbkYNH7MjwySIA1WviSenB4MeEDZiJ7jamIG02yNKCh
	AfYCmyUOw6Wh05AaJDqbIkvWj5Xpk+4UNN/GhdXqWF7n26TQJVIYoNDsjPoc8PsW2hvURx4H40J
	hLj5c/uex0A23rJDPDMgG7vJ9qUoWCVixhRjR36FKjNW8wwJIzDUOzcXqvwXvX5DxU44jUWDZlm
	S4UNW8hZUEtYNzC/UkuMetlp55TTnFqTxgDEcVoQm5hIR+bvFIxK2wAwf0cnoAcnMI/0ctpC7U+
	fRx07Js3zKZfgFVQRg==
X-Received: by 2002:a05:6820:1897:b0:694:9071:b60d with SMTP id
 006d021491bc7-69998d428f6mr514951eaf.44.1778023040589; Tue, 05 May 2026
 16:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
 <7-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com> <oe75yk2fx2c7wg73xrikppw2gxxe2e6bsvkktowbo64ftldy7p@53gjjzhu6cy5>
In-Reply-To: <oe75yk2fx2c7wg73xrikppw2gxxe2e6bsvkktowbo64ftldy7p@53gjjzhu6cy5>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 5 May 2026 16:17:09 -0700
X-Gm-Features: AVHnY4JEOw35_gt_Bdx03w1j0N_GsaZ_RjYELDTRZ0nPtLdGQ8v4coOohRfzozA
Message-ID: <CAH2o1u4-QLvc+-eCciyRsd5C-8KZfwqrra8Wv82-eOUgaX-eEA@mail.gmail.com>
Subject: Re: [PATCH 7/7] iommu/riscv: Add NAPOT range invalidation support
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Will Deacon <will@kernel.org>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_161722_025724_2D274E71 
X-CRM114-Status: GOOD (  23.84  )
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

T24gVHVlLCBNYXkgNSwgMjAyNiBhdCAzOjQ34oCvUE0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAxMCwgMjAyNiBhdCAx
Mjo1NzowOFBNIC0wMzAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiBVc2UgdGhlIFJJU0Mt
ViBJT01NVSBBZGRyZXNzIFJhbmdlIEludmFsaWRhdGlvbiBleHRlbnNpb24KPiA+IChjYXBhYmls
aXRpZXMuUywgc3BlYyBzZWN0aW9uIDkuMykgdG8gaW52YWxpZGF0ZSBhbiBJT1ZBIHJhbmdlIHdp
dGgKPiA+IGEgc2luZ2xlIElPVElOVkFMLlZNQSBjb21tYW5kIHVzaW5nIE5BUE9ULWVuY29kZWQg
YWRkcmVzc2luZy4KPiA+Cj4gPiBPbmUgaW9tbXVfaW90bGJfZ2F0aGVyIG1hcHMgdG8gb25lIE5B
UE9UIGludmFsaWRhdGlvbiBjb21tYW5kLiBUaGUKPiA+IHNtYWxsZXN0IHBvd2VyLW9mLXR3byBh
bGlnbmVkIHJhbmdlIGNvdmVyaW5nIHRoZSBnYXRoZXIgaXMgdXNlZCBzaW5jZQo+ID4gb3Zlci1p
bnZhbGlkYXRpb24gaXMgYWx3YXlzIHNhZmUuCj4gPgo+ID4gUyBhbmQgTkwgc2VlbSB0byBiZSBv
cnRob2dvbmFsIGluIHRoZSBzcGVjLCBzbyBpZiBOTCBpcyBub3QKPiA+IHN1cHBvcnRlZCB0aGVu
IGdsb2JhbCBpbnZhbGlkYXRpb24gaXMgcHJvYmFibHkgYWx3YXlzIGdvaW5nIHRvIGhhcHBlbgo+
ID4gYXMgd2lwaW5nIGEgbGFyZ2UgcmFuZ2Ugd2l0aG91dCBhIHRhYmxlIGNoYW5nZSBpcyBub3Qg
Y29tbW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRp
YS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMuaCB8IDE3
ICsrKysrKysrKysrKysKPiA+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgICAgICB8IDQz
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1
NCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMuaCBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUt
Yml0cy5oCj4gPiBpbmRleCBmMDFiNDlhYzgxNTU4Ni4uMzJiM2FkM2FjOWFlNTkgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMuaAo+ID4gKysrIGIvZHJpdmVy
cy9pb21tdS9yaXNjdi9pb21tdS1iaXRzLmgKPiA+IEBAIC02NCw2ICs2NCw3IEBACj4gPiAgI2Rl
ZmluZSBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfUEQxNyAgICAgICAgICAgICAgICBCSVRfVUxM
KDM5KQo+ID4gICNkZWZpbmUgUklTQ1ZfSU9NTVVfQ0FQQUJJTElUSUVTX1BEMjAgICAgICAgICAg
ICAgICAgQklUX1VMTCg0MCkKPiA+ICAjZGVmaW5lIFJJU0NWX0lPTU1VX0NBUEFCSUxJVElFU19O
TCAgICAgICAgICBCSVRfVUxMKDQyKQo+ID4gKyNkZWZpbmUgUklTQ1ZfSU9NTVVfQ0FQQUJJTElU
SUVTX1MgICAgICAgICAgIEJJVF9VTEwoNDMpCj4gPgo+ID4gIC8qKgo+ID4gICAqIGVudW0gcmlz
Y3ZfaW9tbXVfaWdzX3NldHRpbmdzIC0gSW50ZXJydXB0IEdlbmVyYXRpb24gU3VwcG9ydCBTZXR0
aW5ncwo+ID4gQEAgLTQ3NSw2ICs0NzYsNyBAQCBzdHJ1Y3QgcmlzY3ZfaW9tbXVfY29tbWFuZCB7
Cj4gPiAgI2RlZmluZSBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxfR1YgICAgICAgICAgQklUX1VM
TCgzMykKPiA+ICAjZGVmaW5lIFJJU0NWX0lPTU1VX0NNRF9JT1RJTlZBTF9HU0NJRCAgICAgICAg
ICAgICAgIEdFTk1BU0tfVUxMKDU5LCA0NCkKPiA+ICAjZGVmaW5lIFJJU0NWX0lPTU1VX0NNRF9J
T1RJTlZBTF9OTCAgICAgICAgICBCSVRfVUxMKDM0KQo+ID4gKyNkZWZpbmUgUklTQ1ZfSU9NTVVf
Q01EX0lPVElOVkFMX1MgICAgICAgICAgIEJJVF9VTEwoOSkKPgo+IFdlIHNob3VsZCBhZGQgYSBj
b21tZW50IGhlcmUgdGhhdCB0aGlzIGlzIGFjdHVhbGx5IGJpdCA3MywgaS5lLgo+Cj4gI2RlZmlu
ZSBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxfUyAgICAgICAgICAgQklUX1VMTCg5KSAvKiBiaXQg
NzMgKGR3b3JkMSBiaXQgOSkgKi8KPgo+IGJlY2F1c2UuLi4KPgo+ID4gIC8qIGR3b3JkMVs2MTox
MF0gaXMgdGhlIDRLLWFsaWduZWQgcGFnZSBhZGRyZXNzICovCj4gPiAgI2RlZmluZSBSSVNDVl9J
T01NVV9DTURfSU9USU5WQUxfQUREUiAgICAgICAgICAgICAgICBHRU5NQVNLX1VMTCg2MSwgMTAp
Cj4gPgo+ID4gQEAgLTczMSw2ICs3MzMsMjEgQEAgc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X2lv
bW11X2NtZF9pbnZhbF9zZXRfbmwoc3RydWN0IHJpc2N2X2lvbW11X2NvbW1hbmQgKmNtZCkKPiA+
ICAgICAgIGNtZC0+ZHdvcmQwIHw9IFJJU0NWX0lPTU1VX0NNRF9JT1RJTlZBTF9OTDsKPiA+ICB9
Cj4gPgo+ID4gKy8qCj4gPiArICogU2V0IE5BUE9ULWVuY29kZWQgYWRkcmVzcyBmb3IgcmFuZ2Ug
aW52YWxpZGF0aW9uIChTPTEpLgo+ID4gKyAqIHN6X2xnMjogbG9nMiBvZiB0b3RhbCByYW5nZSBp
biBieXRlcywgbXVzdCBiZSA+PSAxMyAoOEtpQiwgMiBwYWdlcykuCj4gPiArICogYWRkciBtdXN0
IGJlIG5hdHVyYWxseSBhbGlnbmVkIHRvIDJec3pfbGcyLgo+ID4gKyAqLwo+ID4gK3N0YXRpYyBp
bmxpbmUgdm9pZCByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X25hcG90KAo+ID4gKyAgICAgc3Ry
dWN0IHJpc2N2X2lvbW11X2NvbW1hbmQgKmNtZCwgdTY0IGFkZHIsIHVuc2lnbmVkIGludCBzel9s
ZzIpCj4gPiArewo+ID4gKyAgICAgdTY0IHBmbiA9IGFkZHIgPj4gMTI7Cj4gPiArCj4gPiArICAg
ICBwZm4gfD0gQklUX1U2NChzel9sZzIgLSAxMykgLSAxOwo+ID4gKyAgICAgY21kLT5kd29yZDEg
PSBGSUVMRF9QUkVQKFJJU0NWX0lPTU1VX0NNRF9JT1RJTlZBTF9BRERSLCBwZm4pOwo+ID4gKyAg
ICAgY21kLT5kd29yZDAgfD0gUklTQ1ZfSU9NTVVfQ01EX0lPVElOVkFMX0FWIHwgUklTQ1ZfSU9N
TVVfQ01EX0lPVElOVkFMX1M7Cj4KPiAuLi5oZXJlIHdlJ3JlIHNldHRpbmcgdGhlIHdyb25nIGR3
b3JkLiBUaGlzIHNob3VsZCBiZQo+Cj4gICAgICAgICBjbWQtPmR3b3JkMSA9IEZJRUxEX1BSRVAo
UklTQ1ZfSU9NTVVfQ01EX0lPVElOVkFMX0FERFIsIHBmbikgfAo+ICAgICAgICAgICAgICAgICAg
ICAgICBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxfUzsKPiAgICAgICAgIGNtZC0+ZHdvcmQwIHw9
IFJJU0NWX0lPTU1VX0NNRF9JT1RJTlZBTF9BVjsKPgo+IFRoYW5rcywKPiBkcmV3CgpZZXMsIGdv
b2QgY2F0Y2guIFNpbWlsYXIgdG8gdGhlIFJGQyBjb21taXQgWzFdIC4uLgoKLSBUb21hc3oKClsx
XSBodHRwczovL2dpdGh1Yi5jb20vdGplem5hY2gvbGludXgvY29tbWl0L2VmNTFkNGJlNzUwZDJk
N2M0NDk3NDdhYjUzZmQ1YzEyZDVhNGExNzUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
