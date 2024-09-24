Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06082CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXICNo7B8h0iNGsHdCBewZCetWcKYigrhMs0Mh3ueho=; b=zPj16hvhHm93Sl
	gGSLdmpwfBwaVDNCe5KgiLjNBYrSIt4mocqLki6gno2/PhWgdlfCsytEvXbOW4CK3kaxGskxkgfTR
	9bW61KfWakagUZDDeby7HUCk2GzPjPEMH1QtWR5ldGy8HvkMBA2oNmbEXDjX0rS+jMUgfgTZ9J/OA
	MErGOstYNlzJU/s8BxHn1x0SQU7+Bq0dqfV480iyXvX/iKkEK7tPUPaQUKwRtuqi4xUAZNa6c0MUe
	xsKfyILVbx0w1L6hMV/OtTHhEt9Hqq5l6w6zvD7Dw/toTjAEO6GfmyiF9A6WdPD7qaBu4LnfviIfJ
	IJ6ARIu1Uio/P4Z9aSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st75W-00000002cC2-09TQ;
	Tue, 24 Sep 2024 15:04:26 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st74P-00000002c3s-2lHq
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 15:03:19 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ddcd0b4c59so51703717b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Sep 2024 08:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190196; x=1727794996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLHaqLf/EY8f3/+vMPI/5pqaC2tKGbDSsFyNM4RtvRM=;
        b=eZ+kZmi6T+nMSb5/7TbME9K1IYpKsUmB8mEdaeQgb5HoWqkcsh+eCyXhKh7PlPTQA3
         qJp0mw6pVNuUXYx6Vf7kODt4Z2mXQVeTznP576z+4O1NYhkju5VVruY3vgupjTyldI+R
         fHzxn7DF2HTPC/UXhWn3qAaLDQZJNFy7sqrPKFzXn6qWoB5L6o6aQp9o4l0MMPAjDHul
         I2OGBik83EBueyIykOgYOnFaKlZy8s/nLXOwSXEUFIF+Yv00Sk4+XqKa+QMvamc8LSzs
         BA3xkGdCAGVxPtNMLgIKJGEnLKR4XaAyM9xMyKNgitDvRN3xPd3pvY9UejTNHR9YEcuA
         ddpg==
X-Forwarded-Encrypted: i=1; AJvYcCX79nK0zLO/h+8qcGCdDZauFUEk6uRmB5K1UIiAbJ7y+W6i8nsFom/y6kJgLAhWrhU3O/B5RgZz05pfWg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5SMMspMIFY/szJgMPoG1PH5fnAyFQxpZy6phT2u1QIrTuf4SX
	kchEIusDrGaQgDmFYnqL4GbpD553qbOHw5cVi0FjOfASZ5PJb55+T5WjLOxT
X-Google-Smtp-Source: AGHT+IEusNvm/AmZ2PvZwMQNU9UTAcopaDsQTYRQ/5+JOMKhd/jpdG7FaVmrO5pQk7MHLpsG1WAhEQ==
X-Received: by 2002:a05:690c:3484:b0:6be:523:af4d with SMTP id 00721157ae682-6dfeed4577fmr92881597b3.11.1727190195483;
        Tue, 24 Sep 2024 08:03:15 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e20cffddadsm2693887b3.5.2024.09.24.08.03.15
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 08:03:15 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e201f146cc8so5194665276.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Sep 2024 08:03:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8lDWrmWlJreYdXjGtzSnUhY9/BpW/fQttX7tRnNUBa5invCqxyqUWf0PmBBRdwXJeEg0N4uiQdLoTiQ==@lists.infradead.org
X-Received: by 2002:a05:690c:a84:b0:6ac:d0ac:f74d with SMTP id
 00721157ae682-6dfeeda3f93mr145411787b3.26.1727190194663; Tue, 24 Sep 2024
 08:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240917131936.18980-1-palmer@rivosinc.com>
In-Reply-To: <20240917131936.18980-1-palmer@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Sep 2024 17:03:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHPMSP6NteQHsK=kwmBknL0dDex5q3YaHBMj3gei62wQ@mail.gmail.com>
Message-ID: <CAMuHMdUHPMSP6NteQHsK=kwmBknL0dDex5q3YaHBMj3gei62wQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: defconfig: Remove ARCH_RENESAS
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: prabhakar.csengg@gmail.com, geert+renesas@glider.be, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_080317_719583_D1B2565C 
X-CRM114-Status: GOOD (  20.17  )
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

SGkgUGFsbWVyLAoKT24gVHVlLCBTZXAgMTcsIDIwMjQgYXQgMzoyMOKAr1BNIFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPiBUaGUgUlovRml2ZSBpcyBnYXRlZCBi
ZWhpbmQgQ09ORklHX05PTlBPUlRBQkxFIGJlY2F1c2Ugb2YgdGhlIERNQSBwb29sCj4gaXNzdWUu
ICBlMzZkZGYzMjI2ODYgKCJyaXNjdjogZGVmY29uZmlnOiBEaXNhYmxlIFJaL0ZpdmUgcGVyaXBo
ZXJhbAo+IHN1cHBvcnQiKSByZW1vdmVzIHRoZSBkcml2ZXJzLCBzbyBsZXQncyByZW1vdmUgdGhl
IHJlc3Qgb2YgdGhlIHZlbmRvcgo+IHN1cHBvcnQgYXMgd2VsbCAtLSB1c2VycyBvZiB0aGVzZSB3
aWxsIGFscmVhZHkgaGF2ZSB0byBwbGF5IGFydW9uZCB3aXRoCj4ga2VybmVsIGNvbmZpZ3MsIHNv
IHRoaXMgc2hvdWxkbid0IGJlIG11Y2ggb2YgYSBidXJkZW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBQ
YWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KClRoYW5rcyBmb3IgeW91ciBwYXRj
aCEKCj4gLS0tIGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+ICsrKyBiL2FyY2gvcmlz
Y3YvY29uZmlncy9kZWZjb25maWcKPiBAQCAtMjcsNyArMjcsNiBAQCBDT05GSUdfRVhQRVJUPXkK
PiAgIyBDT05GSUdfU1lTRlNfU1lTQ0FMTCBpcyBub3Qgc2V0Cj4gIENPTkZJR19QUk9GSUxJTkc9
eQo+ICBDT05GSUdfQVJDSF9NSUNST0NISVA9eQo+IC1DT05GSUdfQVJDSF9SRU5FU0FTPXkKPiAg
Q09ORklHX0FSQ0hfU0lGSVZFPXkKPiAgQ09ORklHX0FSQ0hfU09QSEdPPXkKPiAgQ09ORklHX1NP
Q19TVEFSRklWRT15CgpJIGhhZCBwbGFubmVkIHRvIHNlbmQgYSB2MiBvZiB0aGUgYWZvcmVtZW50
aW9uZWQgY29tbWl0LCBpbmNsdWRpbmcgdGhlCmFib3ZlLCBidXQgZGlkbid0IGdldCB0byB0aGF0
LiBTb3JyeS4uLgoKV2l0aCBDT05GSUdfQVJDSF9SRU5FU0FTPXksIHlvdSBjYW4gYWxzbyBkcm9w
IHRoZSBmb2xsb3dpbmcKbGluZToKCiAgICAjIENPTkZJR19VU0JfWEhDSV9SQ0FSIGlzIG5vdCBz
ZXQKCihVU0JfWEhDSV9SQ0FSIGRlcGVuZHMgb24gYW5kIGRlZmF1bHRzIHRvIEFSQ0hfUkVORVNB
UykKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0t
IApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
