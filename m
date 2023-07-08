Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36274EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 12:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=grifMOI1obZSdrvNf638XQdFyqW1mHDllvQ4lfbzZrc=; b=DJsCmXQCIplD/T
	Yo0qhYmLCh4IbVTpktJEifBjXjOxWVSEMhwM7pwj9dlRsEieqjGsGByJ7ZpOJM3t7Y8rLAf4J3rpl
	VE3xtZvYONqbQsOH9iuevNoc+LeyYPi9j8VNlnjMmZcO56vX83oIaRKZMxgTFbkyDo7xePmfbG5RB
	duQ+BVegwSfwcCUv9acqnt5cYAyMTsGojHzGDzl3QpA8ByiBs9X9Xaf39BUPTEwlwlbya2Sq/+RKO
	QR+2w1Fhvr37Z8+zX6enMhIYbkHkpJ6pbkUfq8qTNJHeN5M//8fgxE7cxNJdO6cbyAgYF4MZJOUC9
	RMDVtwNVrQw+p5biIecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qI6ei-007Crv-26;
	Sat, 08 Jul 2023 12:03:16 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qI6ef-007CrU-1g
	for linux-riscv@lists.infradead.org;
	Sat, 08 Jul 2023 12:03:15 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-55ba5bb0bf3so1845769a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 08 Jul 2023 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688817792; x=1691409792;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pmW+hS9M/nuHr1o+UJdiTC8iEB1m1jPftzrxBZrYbqo=;
        b=Cgx32CzVjbgsu10mxr5sIU/3c+N6ldXoy6BzzWOBMTIGC9t2Mg4tZtwqFYZ2z7JZpL
         EeGF6w355DMuzE85qokbs18VK9Gvqqm2Qorj24pqu8E84cO2bG2p11UShZMr3wpsCF0k
         1WR8q8vC68MrUMmUOdtnQh2Hsi+dYU7MJIOLJA8DgGA4JjGPMFVCeKsBkySaQKPLKwsL
         MKzDPTuDc5dgc4qLxIxAm89ois4f+C3c+M5Qb4NoYh29nDvjF0Dn8AOBYIUSm07sxQ/j
         RESBR25MqbVD+tva7z63hUlEXq0GZAoFS8HgWibdOnNJp2FYh6N2Fqlk4HC+8qaTcGw5
         nByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688817792; x=1691409792;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmW+hS9M/nuHr1o+UJdiTC8iEB1m1jPftzrxBZrYbqo=;
        b=Q/FaUckxWA0qjfwOnW6pR4Wn/AlwoCk6rLWchV+Xqr6FtRHjetADtAWHWznC1bUlf7
         ZKUrON+offfQfqb+/tBgcbWlkEHYLFGsAlCe/YVhzGdxEnZQtBZC3yJ9o3wJL+1XoN+H
         PRCFAvoiNEM+m+pc+6nEYM91NzHI22SRIuX8Wof8Wgk6OU8W8kSJGzVYyexT84Uj9eln
         951UmAelL66UvwHUNvk/IPWfaOLuPsX/9apROmpEz2elVrMpW9JpoRpYaX4KB+qdwEf3
         bU68lAwTF/dee8NlCYzBF8hwJkF1A2byJb0xcinRzFPCCEOrOOYvJzhRd/hWOQhBJzTS
         bGEw==
X-Gm-Message-State: ABy/qLaHt8IwEGWsdFj2AvEJ0hiML7s8UhH6KxGxRK/MjXLRW3IU6zln
	H0iz1FQ1VFOEGMSTSJQWLv+ecA==
X-Google-Smtp-Source: APBJJlFRc9kwODiRcw6uSg+iVQe/4Kk5wsuH2F52nIAIw5ZGfOzMcKcldwdMs7dd4MdwFE3W7lBf7w==
X-Received: by 2002:a17:90b:357:b0:262:ec04:4ff7 with SMTP id fh23-20020a17090b035700b00262ec044ff7mr16375949pjb.16.1688817791704;
        Sat, 08 Jul 2023 05:03:11 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id v2-20020a17090a960200b00262e9fbd5fbsm2932101pjo.32.2023.07.08.05.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 05:03:11 -0700 (PDT)
Date: Sat, 8 Jul 2023 17:33:01 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Dong Wei <Dong.Wei@arm.com>, Conor Dooley <conor@kernel.org>,
	=?utf-8?B?6JGb5aOr5bu6?= <geshijian@bytedance.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	ron minnich <rminnich@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"cuiyunhui@bytedance.com" <cuiyunhui@bytedance.com>,
	"jrtc27@jrtc27.com" <jrtc27@jrtc27.com>,
	"kernel@esmil.dk" <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Mark Rutland <Mark.Rutland@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>,
	"jdelvare@suse.com" <jdelvare@suse.com>,
	"yc.hung@mediatek.com" <yc.hung@mediatek.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"allen-kh.cheng@mediatek.com" <allen-kh.cheng@mediatek.com>,
	"pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
	"tinghan.shen@mediatek.com" <tinghan.shen@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"weidong.wd@bytedance.com" <weidong.wd@bytedance.com>
Subject: Re: [External] Re: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from
 FFI
Message-ID: <ZKlQdXnPVTrYIUzb@sunil-laptop>
References: <mhng-b66b085a-eb15-4c9b-b2aa-93ddf16ec7aa@palmer-ri-x1c9a>
 <CAP6exYKwZG=_47r0jAUFYNL5-P-SS==k6vWdKiMJ9nB0upH5Zw@mail.gmail.com>
 <20230707-attach-conjuror-306d967347ce@wendy>
 <ZKfsSsdiso0W8mW6@sunil-laptop>
 <CAN3iYbMhQU5Ng4r6_rQDnLmit1GCmheC5T49rsUP5NgHFEXsHA@mail.gmail.com>
 <ZKgLKvBoWKSxzm6r@sunil-laptop>
 <CAN3iYbOe+i4jVhz0sSQwVQ2PMB7UvaTPyN_sLtZj0uiOD2emDA@mail.gmail.com>
 <20230707-gargle-enjoyable-f9f7f87fc7ea@spud>
 <DBAPR08MB5783AED8329E38D840B7015D9C2DA@DBAPR08MB5783.eurprd08.prod.outlook.com>
 <CAMj1kXEkL0gF8uGcy2AjJvD-yZHmyLX9jiVVDtR+uBAYf+BfUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXEkL0gF8uGcy2AjJvD-yZHmyLX9jiVVDtR+uBAYf+BfUg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230708_050313_566487_A9134B3B 
X-CRM114-Status: GOOD (  28.98  )
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

T24gU2F0LCBKdWwgMDgsIDIwMjMgYXQgMTA6NDU6MjdBTSArMDIwMCwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4gT24gRnJpLCA3IEp1bCAyMDIzIGF0IDE4OjIxLCBEb25nIFdlaSA8RG9uZy5XZWlA
YXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gQXJtIHN5c3RlbXMgdG9kYXksIHRoZSBBQ1BJIFJT
RFAgaXMgZm91bmQgdXNpbmcgdGhlIFVFRkkgQ29uZmlndXJhdGlvbiBUYWJsZS4gVGhpcyBpcyB0
cnVlIGZvciBhbGwgQXJtIFN5c3RlbVJlYWR5IGNvbXBsaWFudCBzeXN0ZW1zOiAxKSBTeXN0ZW1S
ZWFkeSBMUzogTEJCUnYxIGlzIHVzaW5nIGEgbWluaW1hbCBVRUZJIEZXIHRvIGxvYWQgTGludXhC
b290LCB0aGF0IG1pbmltYWwgVUVGSSBGVyBpcyBwcm9kdWNpbmcgdGhlIFVFRkkgQ29uZmlndXJh
dGlvbiBUYWJsZS4gV2UgYXJlIHdvcmtpbmcgb24gTEJCUnYyLiBMQkJSdjIgaXMgYmFzZWQgb24g
Q29yZWJvb3QgbG9hZGluZyBMaW51eEJvb3QuIEJ1dCB3ZSBkbyBub3QgaGF2ZSBhIHdheSB0b2Rh
eSB0byBnZXQgQ29yZUJvb3QgdG8gcHJvZHVjZSB0aGlzIHBvaW50ZXIgdG8gQUNQSSBSU0RQLiBB
cm0gZG9lcyBub3Qgc3VwcG9ydCB4ODYgRTgyMCBCSU9TIGludGVyZmFjZS4gMikgU3lzdGVtUmVh
ZHkgSVI6IHRoaXMgc29sdXRpb24gdXNlcyBEVCByYXRoZXIgdGhhbiBBQ1BJLiAzKSBTeXN0ZW1S
ZWFkeSBFUzogdGhpcyBzb2x1dGlvbiBjYW4gdXNlIFVCb290IG9yIEVESzIsIGFuZCBpdCByZXF1
aXJlcyBBQ1BJLiBTaW5jZSBib3RoIFVCb290IGFuZCBFREsyIHN1cHBvcnQgVUVGSSBub3csIHNv
IEFDUEkgUlNEUCBjYW4gYmUgZm91bmQgdXNpbmcgdGhlIFVFRkkgQ29uZmlndXJhdGlvbiBUYWJs
ZS4gNCkgU3lzdGVtUmVhZHkgU1I6IHRoaXMgc29sdXRpb24gdHlwaWNhbGx5IHVzZXMgRURLMiBh
bmQgcmVxdWlyZXMgQUNQSSwgc28gbm8gaXNzdWUgZmluZGluZyBSU0RQIHZpYSBVRUZJIENvbmZp
Z3VyYXRpb24gVGFibGUuCj4gPgo+ID4KPiA+Cj4gPiBTbyB0aGUgQUNQSSBSU0RQIGlzc3VlIG9u
bHkgZXhpc3QgaWYgd2Ugd2FudCB0byByZW1vdmUgdGhlIG1pbmltdW0gVUVGSSBGVyBhbmQgZ28g
dG8gQ29yZUJvb3QgY29tcGxldGVseSB0byBsb2FkIExpbnV4Qm9vdC4gV2UgYXJlIGN1cnJlbnRs
eSBleHBsb3JpbmcgaG93IHRvIHNvbHZlIHRoYXQgaXNzdWXigKYKPiA+Cj4gCj4gSGVsbG8gRG9u
ZywKPiAKPiBUaGlzIGZpeGVzIHRoZSBSU0RQIGlzc3VlIHBlcmhhcHMsIGJ1dCB0aGF0IGlzIG5v
dCB0aGUgb25seSBwcm9ibGVtLiBJCj4gaGF2ZSBtZW50aW9uZWQgdGhpcyBtYW55IHRpbWVzIGFs
cmVhZHksIGJ1dCBsZXQgbWUgbWVudGlvbiBpdCBhZ2Fpbgo+IGZvciBjb21wbGV0ZW5lc3M6Cj4g
Cj4gQUNQSSBkb2VzIG5vdCBoYXZlIGEgbWVtb3J5IG1hcCwgYW5kIEFSTSBpcyBtdWNoIG1vcmUg
ZmluaWNreSBhYm91dAo+IG1hcHBpbmcgbWVtb3J5IHJlZ2lvbnMgd2l0aCB0aGUgcmlnaHQgYXR0
cmlidXRlcywgZ2l2ZW4gdGhhdCB1bmNhY2hlZAo+IGFjY2Vzc2VzIGRvbid0IHNub29wIHRoZSBj
YWNoZXMgbGlrZSB0aGV5IGRvIG9uIHg4Ni4gVGhpcyBtZWFucyBpdCBpcwo+IGVzc2VudGlhbCB0
aGF0IG1lbW9yeSBtYXBwaW5ncyBjb25zdHJ1Y3RlZCBmcm9tIEFNTCBjb2RlICh3aGljaAo+IGRv
ZXNuJ3QgcHJvdmlkZSBhbnkgY29udGV4dCBwZXJ0YWluaW5nIHRvIHRoZSBtZW1vcnkgdHlwZSBl
aXRoZXIpIGFyZQo+IGNyZWF0ZWQgd2l0aCB0aGUgcmlnaHQgbWVtb3J5IHR5cGUuCj4gCj4gQ3Vy
cmVudGx5LCB0aGUgTGludXgvYXJtNjQgZ2x1ZSBjb2RlIGZvciB0aGUgQUNQSSBjb3JlCj4gY3Jv
c3MtcmVmZXJlbmNlcyBldmVyeSBtZW1vcnkgbWFwcGluZyBjcmVhdGVkIGZyb20gYSBTeXN0ZW1N
ZW1vcnkKPiBPcFJlZ2lvbiBieSBBTUwgY29kZSBhZ2FpbnN0IHRoZSBFRkkgbWVtb3J5IG1hcCwg
YW5kIHVzZXMgdGhlIEVGSQo+IG1lbW9yeSB0eXBlIGFuZCBhdHRyaWJ1dGVzIHRvIGluZmVyIHRo
ZSBtZW1vcnkgdHlwZSB0byBwcm9ncmFtIGludG8KPiB0aGUgcGFnZSB0YWJsZXMuIFNvIHNpbXBs
eSBwcm92aWRpbmcgdGhlIFJTRFAgaXMgKm5vdCogc3VmZmljaWVudDogb24KPiBhcm02NCwgbW9y
ZSB3b3JrIGlzIG5lZWRlZCBhbmQgY3VycmVudGx5LCBib290aW5nIEFDUEkgd2l0aG91dCBhIEVG
SQo+IG1lbW9yeSBtYXAgcmVzdWx0cyBpbiBTeXN0ZW1NZW1vcnkgT3BSZWdpb25zIG5vdCB3b3Jr
aW5nIGF0IGFsbC4KPiAKPiBPZiBjb3Vyc2UsIHdlIG1pZ2h0IGJlIGFibGUgdG8gd29yayBhcm91
bmQgdGhhdCBieSBwcm92aWRpbmcgYQo+ICdjb3JlYm9vdCcgbWVtb3J5IG1hcCBmb3IgZG9pbmcg
QUNQSSBvbiBhcm02NCwgYnV0IHRoYXQgcmVzdWx0cyBpbgo+IG1vcmUgZnJhZ21lbnRhdGlvbiBh
bmQgYW4gaW5mbGF0ZWQgdmFsaWRhdGlvbiBtYXRyaXgsIHdoaWNoIHB1dHMgdGhlCj4gYnVyZGVu
IG9uIHRoZSBMaW51eCBzdWJzeXN0ZW0gbWFpbnRhaW5lcnMgdG8gbWFrZSBzdXJlIHRoYXQgYWxs
IHRoZXNlCj4gZGlmZmVyZW50IGNvbWJpbmF0aW9ucyByZW1haW4gc3VwcG9ydGVkLgo+IAo+IEFJ
VUksIHRoaXMgbWVtb3J5IHR5cGUgaXNzdWUgZG9lcyBub3QgZXhpc3QgZm9yIFJJU0MtViB0b2Rh
eSwgYnV0IEknZAo+IHN1Z2dlc3QgdG8gdGhlIFJJU0MtViBtYWludGFpbmVycyB0byB0YWtlIGEg
Y2FyZWZ1bCBsb29rIGF0IGFybTY0J3MKPiBhY3BpX29zX2lvcmVtYXAoKSBpbXBsZW1lbnRhdGlv
biBhbmQgZGVjaWRlIHdoZXRoZXIgb3Igbm90IFJJU0MtVgo+IG5lZWRzIHNpbWlsYXIgbG9naWMu
CgpDdXJyZW50bHksIGJhc2ljIEFDUEkgc3VwcG9ydCBpcyBtZXJnZWQgZm9yIFJJU0MtVi4gU3Rp
bGwgbWFueSBmZWF0dXJlcwppbmNsdWRpbmcgZXh0ZXJuYWwgaW50ZXJydXB0IGNvbnRyb2xsZXIg
c3VwcG9ydCBhcmUgV0lQLiBFbmhhbmNpbmcgdGhlCmFjcGlfb3NfaW9yZW1hcCgpIHNpbWlsYXIg
dG8gYXJtNjQgdmVyc2lvbiBpcyBpbiBwbGFuIGZvciBuZXh0IHNlcmllcy4KQmpvcm4gaGFkIGFs
c28gcHJvdmlkZWQgdGhpcyBmZWVkYmFjay4KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC84
N2xlaWR0dm45LmZzZkBhbGwueW91ci5iYXNlLmFyZS5iZWxvbmcudG8udXMvCgpTbywgdGhlIGlz
c3VlIHdpbGwgYmUgYXBwbGljYWJsZSB0byBSSVNDLVYgYWxzbyBldmVuIGlmIHRoZQppbXBsZW1l
bnRhdGlvbiBtYXkgZGlmZmVyIHNsaWdodGx5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
