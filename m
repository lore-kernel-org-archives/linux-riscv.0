Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BCEEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/fBx13yDuxYKrauZ1XwzssnHrj/a2GXjkaZW2yCGPC4=; b=qMflmajn9d8rmjSH/TL73/oUwF
	NZkQKRNHiNt1EWiy0a7i7io+hKrCil+ConzqJ6UtEbWd9Ln/rgGvo/pc0tJO1cJFtbmIbXkhSkTwO
	lxWMeYPE8S5PY6XXOUXRdVXI6s8jxpAUbULM63Uld5fwG36iiMqmTl7CBdI+DfkVXhj+gjGoWcPx9
	GxY3gtIik4uOaI2oDwifWZg1WS7oVd5FOI+GnX6WMg1qhxALeLIT/dkeVgl4F/CoQu6jRivp5ttpu
	IcOTMagjPzPgA4+HefdNExiM39hoyOYuPYS5IHFDHGOR/wBHMExPCWFS7VSLQWMaYNvephVG9Azj3
	rZmW7RPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIAl6-007Xmf-2e;
	Sat, 08 Jul 2023 16:26:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIAl3-007XmE-3C
	for linux-riscv@lists.infradead.org;
	Sat, 08 Jul 2023 16:26:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b8b2b60731so12493625ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Jul 2023 09:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688833564; x=1691425564;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n81lmkpIohF/iUaSujpw1NRiU2XjmhYlsAoXp3Ij8w0=;
        b=XoJYhRowRtKqhr6yAj3k3G47roVPlfesolIYJyVSQ5jmBRDNulN4MnX0TSgOHGE0sI
         eEfdbomyMeP3Vd+jM2tWEfFJXsFvzdk4ccig325fpQHhxp1pQjaOshrWNSVD5NQkDWTx
         s/SnHLirC7MuftFSinmcvvxsv8Jm7dPm2PXsjLJtd/QSTSkkOwPvmq5DAv0eVR4blSN7
         0ahQfSf1mjWdfPSTGzi2BrhKqh6qP681w6TjLGTBva8TQjhGORiQprYdLAgGx5xf+lTB
         uVyeR+Tk74WTeozdvUtGIXPS9Xje10Nm01Jty2IJdsKY2Yhy/syZm2ijhUY/iRA2F5mo
         RUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688833564; x=1691425564;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n81lmkpIohF/iUaSujpw1NRiU2XjmhYlsAoXp3Ij8w0=;
        b=WRBrNPAmWJsxJC5WpqHdZlEPE517dYRo2b6OkI1DmdpItIceO0PPBAxL6wBoSTAd/n
         2+4QtE6ixB8B1cqbVd0mqPol1IjECi42xh9RB3/oxiFy6euTcF/Wm2emilDubXr1BMtO
         2K7WkiWOKUR5jk/otYLsR6DPXl+cJxhXbsdA6L1mXawwwP9JVojhoYqPv6zELDUom/yB
         eeDa+xsdZvU3Dgleb7vstzWcBEM7D5GHFyZ07LB3iw2npN6WVCxEhHTNheK2b7I7T3py
         E1USAu6HWgbh1I6whVDLiGSIU25rWAxdnSTVXNFiHSvWwc/tFxZssYUPyj3g3FipNyme
         hBYg==
X-Gm-Message-State: ABy/qLZgcT/aObnoLu5wD3FbCH/aViTAuG8vTOERQafZBI1VgNyCzyR+
	lw6Z/4B8roosWODA39plFK1pfw==
X-Google-Smtp-Source: APBJJlHXpNokdQddu2gwij/B247jXEox4H02oR5fN5aljXmnnk6OpDbx1BH42oQu7t47hSMyA/Yf1A==
X-Received: by 2002:a17:902:b118:b0:1b3:c3ca:1513 with SMTP id q24-20020a170902b11800b001b3c3ca1513mr5118192plr.65.1688833563858;
        Sat, 08 Jul 2023 09:26:03 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id ju19-20020a170903429300b001aadd0d7364sm5142121plb.83.2023.07.08.09.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 09:26:03 -0700 (PDT)
Date: Sat, 08 Jul 2023 09:26:03 -0700 (PDT)
X-Google-Original-Date: Sat, 08 Jul 2023 09:26:01 PDT (-0700)
Subject: Re: [External] Re: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from FFI
In-Reply-To: <CAMj1kXEkL0gF8uGcy2AjJvD-yZHmyLX9jiVVDtR+uBAYf+BfUg@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <mhng-d4a8b5de-5500-43ec-867a-972d873a0759@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230708_092606_264778_EB2A30E8 
X-CRM114-Status: GOOD (  31.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, geshijian@bytedance.com, rafael@kernel.org, lpieralisi@kernel.org, cuiyunhui@bytedance.com, Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, allen-kh.cheng@mediatek.com, Dong.Wei@arm.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, jdelvare@suse.com, kernel@esmil.dk, Paul Walmsley <paul.walmsley@sifive.com>, jrtc27@jrtc27.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, rminnich@gmail.com, yc.hung@mediatek.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAwOCBKdWwgMjAyMyAwMTo0NToyNyBQRFQgKC0wNzAwKSwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4gT24gRnJpLCA3IEp1bCAyMDIzIGF0IDE4OjIxLCBEb25nIFdlaSA8RG9uZy5XZWlA
YXJtLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIEFybSBzeXN0ZW1zIHRvZGF5LCB0aGUgQUNQSSBSU0RQ
IGlzIGZvdW5kIHVzaW5nIHRoZSBVRUZJIENvbmZpZ3VyYXRpb24gVGFibGUuIFRoaXMgaXMgdHJ1
ZSBmb3IgYWxsIEFybSBTeXN0ZW1SZWFkeSBjb21wbGlhbnQgc3lzdGVtczogMSkgU3lzdGVtUmVh
ZHkgTFM6IExCQlJ2MSBpcyB1c2luZyBhIG1pbmltYWwgVUVGSSBGVyB0byBsb2FkIExpbnV4Qm9v
dCwgdGhhdCBtaW5pbWFsIFVFRkkgRlcgaXMgcHJvZHVjaW5nIHRoZSBVRUZJIENvbmZpZ3VyYXRp
b24gVGFibGUuIFdlIGFyZSB3b3JraW5nIG9uIExCQlJ2Mi4gTEJCUnYyIGlzIGJhc2VkIG9uIENv
cmVib290IGxvYWRpbmcgTGludXhCb290LiBCdXQgd2UgZG8gbm90IGhhdmUgYSB3YXkgdG9kYXkg
dG8gZ2V0IENvcmVCb290IHRvIHByb2R1Y2UgdGhpcyBwb2ludGVyIHRvIEFDUEkgUlNEUC4gQXJt
IGRvZXMgbm90IHN1cHBvcnQgeDg2IEU4MjAgQklPUyBpbnRlcmZhY2UuIDIpIFN5c3RlbVJlYWR5
IElSOiB0aGlzIHNvbHV0aW9uIHVzZXMgRFQgcmF0aGVyIHRoYW4gQUNQSS4gMykgU3lzdGVtUmVh
ZHkgRVM6IHRoaXMgc29sdXRpb24gY2FuIHVzZSBVQm9vdCBvciBFREsyLCBhbmQgaXQgcmVxdWly
ZXMgQUNQSS4gU2luY2UgYm90aCBVQm9vdCBhbmQgRURLMiBzdXBwb3J0IFVFRkkgbm93LCBzbyBB
Q1BJIFJTRFAgY2FuIGJlIGZvdW5kIHVzaW5nIHRoZSBVRUZJIENvbmZpZ3VyYXRpb24gVGFibGUu
IDQpIFN5c3RlbVJlYWR5IFNSOiB0aGlzIHNvbHV0aW9uIHR5cGljYWxseSB1c2VzIEVESzIgYW5k
IHJlcXVpcmVzIEFDUEksIHNvIG5vIGlzc3VlIGZpbmRpbmcgUlNEUCB2aWEgVUVGSSBDb25maWd1
cmF0aW9uIFRhYmxlLgo+Pgo+Pgo+Pgo+PiBTbyB0aGUgQUNQSSBSU0RQIGlzc3VlIG9ubHkgZXhp
c3QgaWYgd2Ugd2FudCB0byByZW1vdmUgdGhlIG1pbmltdW0gVUVGSSBGVyBhbmQgZ28gdG8gQ29y
ZUJvb3QgY29tcGxldGVseSB0byBsb2FkIExpbnV4Qm9vdC4gV2UgYXJlIGN1cnJlbnRseSBleHBs
b3JpbmcgaG93IHRvIHNvbHZlIHRoYXQgaXNzdWXigKYKPj4KPgo+IEhlbGxvIERvbmcsCj4KPiBU
aGlzIGZpeGVzIHRoZSBSU0RQIGlzc3VlIHBlcmhhcHMsIGJ1dCB0aGF0IGlzIG5vdCB0aGUgb25s
eSBwcm9ibGVtLiBJCj4gaGF2ZSBtZW50aW9uZWQgdGhpcyBtYW55IHRpbWVzIGFscmVhZHksIGJ1
dCBsZXQgbWUgbWVudGlvbiBpdCBhZ2Fpbgo+IGZvciBjb21wbGV0ZW5lc3M6Cj4KPiBBQ1BJIGRv
ZXMgbm90IGhhdmUgYSBtZW1vcnkgbWFwLCBhbmQgQVJNIGlzIG11Y2ggbW9yZSBmaW5pY2t5IGFi
b3V0Cj4gbWFwcGluZyBtZW1vcnkgcmVnaW9ucyB3aXRoIHRoZSByaWdodCBhdHRyaWJ1dGVzLCBn
aXZlbiB0aGF0IHVuY2FjaGVkCj4gYWNjZXNzZXMgZG9uJ3Qgc25vb3AgdGhlIGNhY2hlcyBsaWtl
IHRoZXkgZG8gb24geDg2LiBUaGlzIG1lYW5zIGl0IGlzCj4gZXNzZW50aWFsIHRoYXQgbWVtb3J5
IG1hcHBpbmdzIGNvbnN0cnVjdGVkIGZyb20gQU1MIGNvZGUgKHdoaWNoCj4gZG9lc24ndCBwcm92
aWRlIGFueSBjb250ZXh0IHBlcnRhaW5pbmcgdG8gdGhlIG1lbW9yeSB0eXBlIGVpdGhlcikgYXJl
Cj4gY3JlYXRlZCB3aXRoIHRoZSByaWdodCBtZW1vcnkgdHlwZS4KPgo+IEN1cnJlbnRseSwgdGhl
IExpbnV4L2FybTY0IGdsdWUgY29kZSBmb3IgdGhlIEFDUEkgY29yZQo+IGNyb3NzLXJlZmVyZW5j
ZXMgZXZlcnkgbWVtb3J5IG1hcHBpbmcgY3JlYXRlZCBmcm9tIGEgU3lzdGVtTWVtb3J5Cj4gT3BS
ZWdpb24gYnkgQU1MIGNvZGUgYWdhaW5zdCB0aGUgRUZJIG1lbW9yeSBtYXAsIGFuZCB1c2VzIHRo
ZSBFRkkKPiBtZW1vcnkgdHlwZSBhbmQgYXR0cmlidXRlcyB0byBpbmZlciB0aGUgbWVtb3J5IHR5
cGUgdG8gcHJvZ3JhbSBpbnRvCj4gdGhlIHBhZ2UgdGFibGVzLiBTbyBzaW1wbHkgcHJvdmlkaW5n
IHRoZSBSU0RQIGlzICpub3QqIHN1ZmZpY2llbnQ6IG9uCj4gYXJtNjQsIG1vcmUgd29yayBpcyBu
ZWVkZWQgYW5kIGN1cnJlbnRseSwgYm9vdGluZyBBQ1BJIHdpdGhvdXQgYSBFRkkKPiBtZW1vcnkg
bWFwIHJlc3VsdHMgaW4gU3lzdGVtTWVtb3J5IE9wUmVnaW9ucyBub3Qgd29ya2luZyBhdCBhbGwu
Cj4KPiBPZiBjb3Vyc2UsIHdlIG1pZ2h0IGJlIGFibGUgdG8gd29yayBhcm91bmQgdGhhdCBieSBw
cm92aWRpbmcgYQo+ICdjb3JlYm9vdCcgbWVtb3J5IG1hcCBmb3IgZG9pbmcgQUNQSSBvbiBhcm02
NCwgYnV0IHRoYXQgcmVzdWx0cyBpbgo+IG1vcmUgZnJhZ21lbnRhdGlvbiBhbmQgYW4gaW5mbGF0
ZWQgdmFsaWRhdGlvbiBtYXRyaXgsIHdoaWNoIHB1dHMgdGhlCj4gYnVyZGVuIG9uIHRoZSBMaW51
eCBzdWJzeXN0ZW0gbWFpbnRhaW5lcnMgdG8gbWFrZSBzdXJlIHRoYXQgYWxsIHRoZXNlCj4gZGlm
ZmVyZW50IGNvbWJpbmF0aW9ucyByZW1haW4gc3VwcG9ydGVkLgo+Cj4gQUlVSSwgdGhpcyBtZW1v
cnkgdHlwZSBpc3N1ZSBkb2VzIG5vdCBleGlzdCBmb3IgUklTQy1WIHRvZGF5LCBidXQgSSdkCj4g
c3VnZ2VzdCB0byB0aGUgUklTQy1WIG1haW50YWluZXJzIHRvIHRha2UgYSBjYXJlZnVsIGxvb2sg
YXQgYXJtNjQncwo+IGFjcGlfb3NfaW9yZW1hcCgpIGltcGxlbWVudGF0aW9uIGFuZCBkZWNpZGUg
d2hldGhlciBvciBub3QgUklTQy1WCj4gbmVlZHMgc2ltaWxhciBsb2dpYy4KCldlJ3ZlIGdvdCBh
IGhhbmRmdWwgb2YgbWVzc2VzIGFyb3VuZCB0aGlzIGluIFJJU0MtViBhbHJlYWR5LCBJJ2QgYmUg
CnN1cnByaXNlZCBpZiB3ZSBkb24ndCBuZWVkIGFueXRoaW5nIGZvciBBQ1BJLiAgSXQncyBwcm9i
YWJseSBub3QgZ29pbmcgCnRvIHNob3cgdXAgdW50aWwgd2UncmUgcnVubmluZyBvbiByZWFsIHBs
YXRmb3JtcywgdGhvdWdoLCBhbmQgd2UncmUgCmdvaW5nIHRvIG5lZWQgc29tZSBNLW1vZGUgaW50
ZXJmYWNlIHRvIGdldCBpdCByaWdodCBpbiB0aGUgbG9uZyBydW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
