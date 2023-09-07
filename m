Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216D4EB8FDE
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9fzm31bcNISqgKIpu+3r8ud1swp12iG7rI5zTjF7II=; b=rXsTKJlM5XkVdo
	/4O+pWa+8ueluowc1kOIrwLbgKRyAg1x2R3NVZGfjY87vXicA2teNN7moCB2Pk50SKN5+yVI1Z+6G
	DsWckwNQG8TQW/tmcbUO/jW3JqNXobqge1cMVCKCQIMEhFC+4rAxr3FbE1EoCrUu4SdMM0K63eMJ9
	zQ4OZRgCZDbJhHpaPkgbRpVJq66Ff6sFZwwEYXl8T+SMaTzcE9B5OAP18ZQAOQ5wvtZz/A+zkpn1M
	XcQ/uipPqavx6dxaCK6lw43FaHzxXu9whWb6YMtD8FtnhfN4Jf6Z78T4I2cF2PVmv4MDDmA9hDty+
	XcDVpjH20k02Gzk3BOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDvV-00C4S5-04;
	Thu, 07 Sep 2023 12:16:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDvR-00C4Qz-1V
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 12:15:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31aeee69de0so847427f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 05:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694088952; x=1694693752; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpIRckm+wlKPG4865Y0AKN4K9nVyXpI6Pdl7EWBzfrE=;
        b=H502eNxp7xByPq7zRdX7pYb49u8Us3A71AS1w1lnP7+Y/l0RmRw+gVT6y7SrMyvhHp
         rEQIogiyfRol3TLAjQPg1F1JKRWAP2hvQ4MHAiFBnKsLVCWRSGP6BpVfceMGgFfZ3qNF
         KLxaioCXOPav8QTnhRDuEIwXI5Z49xvf7whlOy+kT7LVVs4dcCzeTTXtQMrx/Cr+3Njv
         NMg9hyB+olgS77JrfjJ19zfA9RFbibkODFWVIrm0TBVAzxT3i/w/R/yDpuMLfEuXjQVC
         v4ndW/Dle2KH4K5E1kVXy6dhE3EZL8wsPOJ4jQRHMdxODFhfRRv1wS53XJXlhhZGqVzZ
         2X6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694088952; x=1694693752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpIRckm+wlKPG4865Y0AKN4K9nVyXpI6Pdl7EWBzfrE=;
        b=iymI0ZFMOHURbYapoUB8mnL4qLxaWE56rcBVTQyK4WcKO81rl/enGlMNL40z6nvokr
         Wnv0nEg5BKiQNkjGRzvMMFKdEtbvEW+l+8u6Sx3ADgevG3XZ6DLzBy7Yt+yh9XcdUL+/
         oLhxW0OkTQzJ/c9HmYIfSx75LABHxcvYoBGY91b8eOZ7jaZQjFmJ6/dd7VEGGpBiQZah
         zTfR7ejQfGukw7NruZZ9N3oicTeAEtXzEDDW5uXr9NikexwPoRySbd57YyagzKrXr6vw
         AS3nQHCmZYj0R1ENZ3KmgOnj4/0i8Uy7pobydyZ3NY46d7i5dWqljS1LctogSJ7+j5S+
         xy+g==
X-Gm-Message-State: AOJu0YwUN1OzYGb8d/gYV+lTlJpZ7dCMGMFwnLP6kX6JOVkf4kemcZwK
	oCdIEY6tjLjTf2H2UJxEOjUcsdfWwK+Yr330NtYhCg==
X-Google-Smtp-Source: AGHT+IFmLWgZp5Q2SDD27ttHJ6ry0qaiGdpravXN90uYPS+vLCslFsUFRRI6GqJeGd4wBCjPav+DjkI12vLXHAZSa+Y=
X-Received: by 2002:a5d:43d0:0:b0:319:82c9:8e7d with SMTP id
 v16-20020a5d43d0000000b0031982c98e7dmr4700503wrr.31.1694088951761; Thu, 07
 Sep 2023 05:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXFZren0Q19DimwQaETCLz64D4bZQC5B2N=i3SAWHygkTQ@mail.gmail.com>
 <mhng-b66b085a-eb15-4c9b-b2aa-93ddf16ec7aa@palmer-ri-x1c9a>
 <CAP6exYKwZG=_47r0jAUFYNL5-P-SS==k6vWdKiMJ9nB0upH5Zw@mail.gmail.com>
 <20230707-attach-conjuror-306d967347ce@wendy> <ZKfsSsdiso0W8mW6@sunil-laptop>
 <CAN3iYbMhQU5Ng4r6_rQDnLmit1GCmheC5T49rsUP5NgHFEXsHA@mail.gmail.com>
 <ZKgLKvBoWKSxzm6r@sunil-laptop> <CAN3iYbOe+i4jVhz0sSQwVQ2PMB7UvaTPyN_sLtZj0uiOD2emDA@mail.gmail.com>
 <20230707-gargle-enjoyable-f9f7f87fc7ea@spud> <DBAPR08MB5783AED8329E38D840B7015D9C2DA@DBAPR08MB5783.eurprd08.prod.outlook.com>
 <CAMj1kXEkL0gF8uGcy2AjJvD-yZHmyLX9jiVVDtR+uBAYf+BfUg@mail.gmail.com> <CAN3iYbMsUNMH27kdtwPwLeBSUfH0gTvyqjZ8ExZaoGcuv8CBdA@mail.gmail.com>
In-Reply-To: <CAN3iYbMsUNMH27kdtwPwLeBSUfH0gTvyqjZ8ExZaoGcuv8CBdA@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 7 Sep 2023 20:15:40 +0800
Message-ID: <CAEEQ3w=N+Ey++XWPkseSZTc-GiD6bRXAotw-XyF5iDCWPBkpLg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from FFI
To: =?UTF-8?B?6JGb5aOr5bu6?= <geshijian@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_051557_612466_8ABE165D 
X-CRM114-Status: GOOD (  30.99  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, "kernel@esmil.dk" <kernel@esmil.dk>, "rafael@kernel.org" <rafael@kernel.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Ard Biesheuvel <ardb@kernel.org>, "allen-kh.cheng@mediatek.com" <allen-kh.cheng@mediatek.com>, Dong Wei <Dong.Wei@arm.com>, "tinghan.shen@mediatek.com" <tinghan.shen@mediatek.com>, "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, Paul Walmsley <paul.walmsley@sifive.com>, "jrtc27@jrtc27.com" <jrtc27@jrtc27.com>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "weidong.wd@bytedance.com" <weidong.wd@bytedance.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, ron minnich <rminnich@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, "yc.hung@mediatek.com" <yc.hung@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsCgoKT24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMTI6MDPigK9BTSDokZvlo6vlu7og
PGdlc2hpamlhbkBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgSnVsIDgsIDIwMjMg
YXQgNDo0NeKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIEZyaSwgNyBKdWwgMjAyMyBhdCAxODoyMSwgRG9uZyBXZWkgPERvbmcuV2VpQGFybS5j
b20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBBcm0gc3lzdGVtcyB0b2RheSwgdGhlIEFDUEkgUlNE
UCBpcyBmb3VuZCB1c2luZyB0aGUgVUVGSSBDb25maWd1cmF0aW9uIFRhYmxlLiBUaGlzIGlzIHRy
dWUgZm9yIGFsbCBBcm0gU3lzdGVtUmVhZHkgY29tcGxpYW50IHN5c3RlbXM6IDEpIFN5c3RlbVJl
YWR5IExTOiBMQkJSdjEgaXMgdXNpbmcgYSBtaW5pbWFsIFVFRkkgRlcgdG8gbG9hZCBMaW51eEJv
b3QsIHRoYXQgbWluaW1hbCBVRUZJIEZXIGlzIHByb2R1Y2luZyB0aGUgVUVGSSBDb25maWd1cmF0
aW9uIFRhYmxlLiBXZSBhcmUgd29ya2luZyBvbiBMQkJSdjIuIExCQlJ2MiBpcyBiYXNlZCBvbiBD
b3JlYm9vdCBsb2FkaW5nIExpbnV4Qm9vdC4gQnV0IHdlIGRvIG5vdCBoYXZlIGEgd2F5IHRvZGF5
IHRvIGdldCBDb3JlQm9vdCB0byBwcm9kdWNlIHRoaXMgcG9pbnRlciB0byBBQ1BJIFJTRFAuIEFy
bSBkb2VzIG5vdCBzdXBwb3J0IHg4NiBFODIwIEJJT1MgaW50ZXJmYWNlLiAyKSBTeXN0ZW1SZWFk
eSBJUjogdGhpcyBzb2x1dGlvbiB1c2VzIERUIHJhdGhlciB0aGFuIEFDUEkuIDMpIFN5c3RlbVJl
YWR5IEVTOiB0aGlzIHNvbHV0aW9uIGNhbiB1c2UgVUJvb3Qgb3IgRURLMiwgYW5kIGl0IHJlcXVp
cmVzIEFDUEkuIFNpbmNlIGJvdGggVUJvb3QgYW5kIEVESzIgc3VwcG9ydCBVRUZJIG5vdywgc28g
QUNQSSBSU0RQIGNhbiBiZSBmb3VuZCB1c2luZyB0aGUgVUVGSSBDb25maWd1cmF0aW9uIFRhYmxl
LiA0KSBTeXN0ZW1SZWFkeSBTUjogdGhpcyBzb2x1dGlvbiB0eXBpY2FsbHkgdXNlcyBFREsyIGFu
ZCByZXF1aXJlcyBBQ1BJLCBzbyBubyBpc3N1ZSBmaW5kaW5nIFJTRFAgdmlhIFVFRkkgQ29uZmln
dXJhdGlvbiBUYWJsZS4KPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gU28gdGhlIEFDUEkgUlNEUCBp
c3N1ZSBvbmx5IGV4aXN0IGlmIHdlIHdhbnQgdG8gcmVtb3ZlIHRoZSBtaW5pbXVtIFVFRkkgRlcg
YW5kIGdvIHRvIENvcmVCb290IGNvbXBsZXRlbHkgdG8gbG9hZCBMaW51eEJvb3QuIFdlIGFyZSBj
dXJyZW50bHkgZXhwbG9yaW5nIGhvdyB0byBzb2x2ZSB0aGF0IGlzc3Vl4oCmCj4gPiA+Cj4gPgo+
ID4gSGVsbG8gRG9uZywKPiA+Cj4gPiBUaGlzIGZpeGVzIHRoZSBSU0RQIGlzc3VlIHBlcmhhcHMs
IGJ1dCB0aGF0IGlzIG5vdCB0aGUgb25seSBwcm9ibGVtLiBJCj4gPiBoYXZlIG1lbnRpb25lZCB0
aGlzIG1hbnkgdGltZXMgYWxyZWFkeSwgYnV0IGxldCBtZSBtZW50aW9uIGl0IGFnYWluCj4gPiBm
b3IgY29tcGxldGVuZXNzOgo+ID4KPiA+IEFDUEkgZG9lcyBub3QgaGF2ZSBhIG1lbW9yeSBtYXAs
IGFuZCBBUk0gaXMgbXVjaCBtb3JlIGZpbmlja3kgYWJvdXQKPiA+IG1hcHBpbmcgbWVtb3J5IHJl
Z2lvbnMgd2l0aCB0aGUgcmlnaHQgYXR0cmlidXRlcywgZ2l2ZW4gdGhhdCB1bmNhY2hlZAo+ID4g
YWNjZXNzZXMgZG9uJ3Qgc25vb3AgdGhlIGNhY2hlcyBsaWtlIHRoZXkgZG8gb24geDg2LiBUaGlz
IG1lYW5zIGl0IGlzCj4gPiBlc3NlbnRpYWwgdGhhdCBtZW1vcnkgbWFwcGluZ3MgY29uc3RydWN0
ZWQgZnJvbSBBTUwgY29kZSAod2hpY2gKPiA+IGRvZXNuJ3QgcHJvdmlkZSBhbnkgY29udGV4dCBw
ZXJ0YWluaW5nIHRvIHRoZSBtZW1vcnkgdHlwZSBlaXRoZXIpIGFyZQo+ID4gY3JlYXRlZCB3aXRo
IHRoZSByaWdodCBtZW1vcnkgdHlwZS4KPiA+Cj4gPiBDdXJyZW50bHksIHRoZSBMaW51eC9hcm02
NCBnbHVlIGNvZGUgZm9yIHRoZSBBQ1BJIGNvcmUKPiA+IGNyb3NzLXJlZmVyZW5jZXMgZXZlcnkg
bWVtb3J5IG1hcHBpbmcgY3JlYXRlZCBmcm9tIGEgU3lzdGVtTWVtb3J5Cj4gPiBPcFJlZ2lvbiBi
eSBBTUwgY29kZSBhZ2FpbnN0IHRoZSBFRkkgbWVtb3J5IG1hcCwgYW5kIHVzZXMgdGhlIEVGSQo+
ID4gbWVtb3J5IHR5cGUgYW5kIGF0dHJpYnV0ZXMgdG8gaW5mZXIgdGhlIG1lbW9yeSB0eXBlIHRv
IHByb2dyYW0gaW50bwo+ID4gdGhlIHBhZ2UgdGFibGVzLiBTbyBzaW1wbHkgcHJvdmlkaW5nIHRo
ZSBSU0RQIGlzICpub3QqIHN1ZmZpY2llbnQ6IG9uCj4gPiBhcm02NCwgbW9yZSB3b3JrIGlzIG5l
ZWRlZCBhbmQgY3VycmVudGx5LCBib290aW5nIEFDUEkgd2l0aG91dCBhIEVGSQo+ID4gbWVtb3J5
IG1hcCByZXN1bHRzIGluIFN5c3RlbU1lbW9yeSBPcFJlZ2lvbnMgbm90IHdvcmtpbmcgYXQgYWxs
Lgo+ID4KPiA+IE9mIGNvdXJzZSwgd2UgbWlnaHQgYmUgYWJsZSB0byB3b3JrIGFyb3VuZCB0aGF0
IGJ5IHByb3ZpZGluZyBhCj4gPiAnY29yZWJvb3QnIG1lbW9yeSBtYXAgZm9yIGRvaW5nIEFDUEkg
b24gYXJtNjQsIGJ1dCB0aGF0IHJlc3VsdHMgaW4KPiA+IG1vcmUgZnJhZ21lbnRhdGlvbiBhbmQg
YW4gaW5mbGF0ZWQgdmFsaWRhdGlvbiBtYXRyaXgsIHdoaWNoIHB1dHMgdGhlCj4gPiBidXJkZW4g
b24gdGhlIExpbnV4IHN1YnN5c3RlbSBtYWludGFpbmVycyB0byBtYWtlIHN1cmUgdGhhdCBhbGwg
dGhlc2UKPiA+IGRpZmZlcmVudCBjb21iaW5hdGlvbnMgcmVtYWluIHN1cHBvcnRlZC4KPiA+Cj4g
PiBBSVVJLCB0aGlzIG1lbW9yeSB0eXBlIGlzc3VlIGRvZXMgbm90IGV4aXN0IGZvciBSSVNDLVYg
dG9kYXksIGJ1dCBJJ2QKPiA+IHN1Z2dlc3QgdG8gdGhlIFJJU0MtViBtYWludGFpbmVycyB0byB0
YWtlIGEgY2FyZWZ1bCBsb29rIGF0IGFybTY0J3MKPiA+IGFjcGlfb3NfaW9yZW1hcCgpIGltcGxl
bWVudGF0aW9uIGFuZCBkZWNpZGUgd2hldGhlciBvciBub3QgUklTQy1WCj4gPiBuZWVkcyBzaW1p
bGFyIGxvZ2ljLgo+Cj4gVGhhbmtzIEFyZCBhbmQgU3VuaWwsCj4KPiBZb3UgYXJlIHJpZ2h0LCB3
ZSBuZWVkIHRvIHdvcmsgb3V0IGEgY29yZWJvb3QgbWVtb3J5IG1hcCBmb3IgZG9pbmcKPiBBQ1BJ
IG9uIEFSTTY0Lgo+IEJUVywgSSBkb24ndCBzdWdnZXN0IGJpbmRpbmcgQUNQSSBhbmQgVUVGSSB0
b2dldGhlci4gT24gUklTQy1WLCAgdGhlCj4gY3VycmVudCBzb2x1dGlvbiB3b3JrcyB3ZWxsIGJh
c2VkIG9uIG91ciBleHBlcmllbmNlLCBhbnl3YXksIHdlIHdpbGwKPiBzdHVkeSBtZW1vcnkgd2l0
aCBEVFMgYW5kIHVwZGF0ZSBsYXRlci4KPgo+IFRoYW5rcywKPiAtTmlsbAoKTGV0J3MgbW92ZSBv
biB0byB0aGlzIHBhdGNoc2V0LApSZWdhcmRpbmcgdGhlIHNvLWNhbGxlZCByaXNjLXYgc3BlYwoo
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXBsYXRmb3JtLXNwZWNzL2Jsb2IvbWFpbi9y
aXNjdi1wbGF0Zm9ybS1zcGVjLmFkb2MjMzItYm9vdC1wcm9jZXNzKQp0aGF0IHdlIGRpc2N1c3Nl
ZCBiZWZvcmUsIGl0IGlzIG91dGRhdGVkICwgdGhlIHBhdGNoc2V0IGlzIG5vdApjb25zdHJhaW5l
ZCBieSB0aGUgc3BlYy4KU2VlOgpodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtcGxhdGZv
cm0tc3BlY3MvcHVsbC85MSNpc3N1ZWNvbW1lbnQtMTcwOTA0NDIxNQoKU28gcGxlYXNlIGhlbHAg
dG8gcmV2aWV3IHRoaXMgcGF0Y2hzZXQsIHRoYW5rIHlvdSEKCgpUaGFua3MsCll1bmh1aQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
