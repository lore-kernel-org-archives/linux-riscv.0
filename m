Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E81CC433E6
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 11:49:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF042073A
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 11:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gie8lEdF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="nDMU+vQz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BF042073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sv6XUiDllwOGnbhkTZIP14VBWgaWxXJZtq2tqx0LcCk=; b=Gie8lEdFgDGOfLjOPDTOmpad/
	YA+S2Alus0imzX7FISa72KKS3c7Wujw7Lzb7Bo+jm03Sje/CoZiiWX2pDuiFU6yZ8l9dBV77RSGbI
	eYXmtfcDwL0p78yhk6jF4+3aTrZtvlQXByzjEz8dIyTM5JPNAP/+lGJgHaeL8EMFf0ZdCYY8uItGG
	LNo1KoZ05dYT9Heg3ohgqQ0HWDhWH+IN7l6X3/J3XCSb2BuIVmNHLQXxcG6c5BQOI6owX7y5Htx2t
	UypGk19zWQZr93pBaOJQDtj397Fvy8LZs3AohgDpqZUuL51Tj8EOtbvnDjsWW8dFAdHlzXBicPn8R
	AC5ic2j9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxqlq-00057r-AF; Tue, 21 Jul 2020 11:49:18 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxqlo-00057A-68
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 11:49:16 +0000
Received: by mail-wr1-x442.google.com with SMTP id f7so20913487wrw.1
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 04:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YhhhVF8z1SLInJUZAiDAnUC6bgocyhhgqr0w45WOgKE=;
 b=nDMU+vQzOjCBxZoK6uTXWTLLlkjbn/xqdnt0a9+YzT7k59y3jQCMaQAe+lzs4f1Las
 XDwKkAOt7VTkpqUppn/Ui+XJtYhVaSXB0vyxysiL4kRDOisE/ROVpZ3AoIZdTplZBmqu
 Lhhk9rAkBsz8ok9kvWiUTc+PNvZ6t5yWrw5aJ+Kwzrc6DEqD1Bdq5gpDmnH2flD+V2/1
 Xt+HuqKywm++0CeGmTJDxv9g4hdcRFwvkolInSoU/r0RMWb2MXaDyVkcFHyvNA6zKHZs
 GR6cOef7oKX74v1/UyuvC3SjbMs+8wP7Q7TBvDEbEOm6e2vukNUll5XyaWU/AaSnmzXX
 cFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YhhhVF8z1SLInJUZAiDAnUC6bgocyhhgqr0w45WOgKE=;
 b=dYGqCIJoYaimxjFjEjHzabAMV65vwj7uemewA5zWx4Hlxi9dU9fCYU6rUIkN6JMzKb
 lzgIBYfw19YWVYxZKl366WNe60RpZRpLHyjP179+auTHSr6iByNizzXWzWtI87KhN2od
 Pc+AFcEWPZTnuV+t3oCN1xMrOWmpZH91m/vbuxGjLfkJKHWRZ9A/Cu7Om0ijCsJBAF+w
 bkncd0+wgxZ2SBianOlup1kQOwIjedqwP0zeaFoDME62maEhrHUdsnADrxVzC3OdCm99
 Y0xIDoNv1Uxef3eAVlVKxpe/RGVrlpkCEK+rUxSPvR80f5TNgGQ1Lw1Eq5Pv3foKrXtA
 9sUw==
X-Gm-Message-State: AOAM531JT2x8yHtM7FuZanHxLQGlwQHFXmvwAf3ceoyXrLVzOGjMcENj
 054MpepBcy87hCZSqijHB1MXMTW+kEwGOZbZ2N4ftg==
X-Google-Smtp-Source: ABdhPJwnJ+R0C8R5YU7vymVo3liRSIKqHF7p4MjG+BEHOSmembqsmAxdRbwISiIAZG5h1Pdnx0zrtLa0KOAKAefsGPE=
X-Received: by 2002:adf:9203:: with SMTP id 3mr9713351wrj.144.1595332154204;
 Tue, 21 Jul 2020 04:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200717075101.263332-1-anup.patel@wdc.com>
 <20200717075101.263332-3-anup.patel@wdc.com>
 <63f65ddd-b7c4-b8fd-151c-a77e8c87efed@linaro.org>
In-Reply-To: <63f65ddd-b7c4-b8fd-151c-a77e8c87efed@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Jul 2020 17:19:02 +0530
Message-ID: <CAAhSdy2oGAk6A6=SwgCgZ+trmzCMRPOCiB6ibDTL2A_1sUu1og@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] clocksource/drivers: Add CLINT timer driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_074916_241020_FF120B1F 
X-CRM114-Status: GOOD (  25.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berhing <kernel@esmil.dk>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgNDozMiBQTSBEYW5pZWwgTGV6Y2Fubwo8ZGFuaWVsLmxl
emNhbm9AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNy8wNy8yMDIwIDA5OjUwLCBBbnVwIFBh
dGVsIHdyb3RlOgo+ID4gV2UgYWRkIGEgc2VwYXJhdGUgQ0xJTlQgdGltZXIgZHJpdmVyIGZvciBM
aW51eCBSSVNDLVYgTS1tb2RlIChpLmUuCj4gPiBSSVNDLVYgTm9NTVUga2VybmVsKS4KPiA+Cj4g
PiBUaGUgQ0xJTlQgTU1JTyBkZXZpY2UgcHJvdmlkZXMgdGhyZWUgdGhpbmdzOgo+ID4gMS4gNjRi
aXQgZnJlZSBydW5uaW5nIGNvdW50ZXIgcmVnaXN0ZXIKPiA+IDIuIDY0Yml0IHBlci1DUFUgdGlt
ZSBjb21wYXJlIHJlZ2lzdGVycwo+ID4gMy4gMzJiaXQgcGVyLUNQVSBpbnRlci1wcm9jZXNzb3Ig
aW50ZXJydXB0IHJlZ2lzdGVycwo+ID4KPiA+IFVubGlrZSBvdGhlciB0aW1lciBkZXZpY2VzLCBD
TElOVCBwcm92aWRlcyBJUEkgcmVnaXN0ZXJzIGFsb25nIHdpdGgKPiA+IHRpbWVyIHJlZ2lzdGVy
cy4gVG8gdXNlIENMSU5UIElQSSByZWdpc3RlcnMsIHRoZSBDTElOVCB0aW1lciBkcml2ZXIKPiA+
IHByb3ZpZGVzIElQSSByZWxhdGVkIGNhbGxiYWNrcyB0byBhcmNoL3Jpc2N2Lgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAd2RjLmNvbT4KPiA+IFRlc3RlZC1i
eTogRW1pbCBSZW5uZXIgQmVyaGluZyA8a2VybmVsQGVzbWlsLmRrPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy9jbG9ja3NvdXJjZS9LY29uZmlnICAgICAgIHwgICA5ICsrCj4gPiAgZHJpdmVycy9jbG9j
a3NvdXJjZS9NYWtlZmlsZSAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLWNsaW50LmMgfCAyMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgaW5j
bHVkZS9saW51eC9jcHVob3RwbHVnLmggICAgICAgIHwgICAxICsKPiA+ICA0IGZpbGVzIGNoYW5n
ZWQsIDI0MiBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xv
Y2tzb3VyY2UvdGltZXItY2xpbnQuYwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nr
c291cmNlL0tjb25maWcgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcKPiA+IGluZGV4IDkx
NDE4MzgxZmNkNC4uZTFjZTBkNTEwYTAzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9jbG9ja3Nv
dXJjZS9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcKPiA+IEBA
IC02NTgsNiArNjU4LDE1IEBAIGNvbmZpZyBSSVNDVl9USU1FUgo+ID4gICAgICAgICBpcyBhY2Nl
c3NlZCB2aWEgYm90aCB0aGUgU0JJIGFuZCB0aGUgcmRjeWNsZSBpbnN0cnVjdGlvbi4gIFRoaXMg
aXMKPiA+ICAgICAgICAgcmVxdWlyZWQgZm9yIGFsbCBSSVNDLVYgc3lzdGVtcy4KPiA+Cj4gPiAr
Y29uZmlnIENMSU5UX1RJTUVSCj4gPiArICAgICBib29sICJUaW1lciBmb3IgdGhlIFJJU0MtViBw
bGF0Zm9ybSIKPiA+ICsgICAgIGRlcGVuZHMgb24gR0VORVJJQ19TQ0hFRF9DTE9DSyAmJiBSSVND
Vl9NX01PREUKPiA+ICsgICAgIHNlbGVjdCBUSU1FUl9QUk9CRQo+ID4gKyAgICAgc2VsZWN0IFRJ
TUVSX09GCj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhl
IENMSU5UIHRpbWVyIGZvciBSSVNDLVYgc3lzdGVtcy4gVGhlIENMSU5UCj4gPiArICAgICAgIGRy
aXZlciBpcyB1c3VhbGx5IHVzZWQgZm9yIE5vTU1VIFJJU0MtViBzeXN0ZW1zLgo+Cj4gVjMgaGFz
IGEgY29tbWVudCBhYm91dCBmaXhpbmcgdGhlIEtjb25maWcgb3B0aW9uLgoKSSBoYXZlIHJlbW92
ZWQgImRlZmF1bHQgeSIgZnJvbSB0aGUgS2NvbmZpZyBvcHRpb24gYXMtcGVyIHlvdXIgc3VnZ2Vz
dGlvbnMuCgpJIGxvb2tlZCBhdCBvdGhlciBUaW1lciBLY29uZmlnIG9wdGlvbnMuIE1vc3Qgb2Yg
dGhlbSBoYXZlIG1lbnVjb25maWcgbmFtZS4KQWxzbywgd2UgY2FuIGNlcnRhaW5seSBoYXZlIGRp
ZmZlcmVudCB0aW1lciBNTUlPIHRpbWVyIGRyaXZlcnMgaW4gZnV0dXJlLiBEbwp5b3Ugc3RpbGwg
aW5zaXN0IG9uIG1ha2luZyB0aGlzIGtjb25maWcgb3B0aW9uIHRvdGFsbHkgc2lsZW50ID8/Cgo+
Cj4gWyAuLi4gXQo+Cj4gPiArewo+ID4gKyAgICAgYm9vbCAqcmVnaXN0ZXJlZCA9IHBlcl9jcHVf
cHRyKCZjbGludF9jbG9ja19ldmVudF9yZWdpc3RlcmVkLCBjcHUpOwo+ID4gKyAgICAgc3RydWN0
IGNsb2NrX2V2ZW50X2RldmljZSAqY2UgPSBwZXJfY3B1X3B0cigmY2xpbnRfY2xvY2tfZXZlbnQs
IGNwdSk7Cj4gPiArCj4gPiArICAgICBpZiAoISgqcmVnaXN0ZXJlZCkpIHsKPiA+ICsgICAgICAg
ICAgICAgY2UtPmNwdW1hc2sgPSBjcHVtYXNrX29mKGNwdSk7Cj4gPiArICAgICAgICAgICAgIGNs
b2NrZXZlbnRzX2NvbmZpZ19hbmRfcmVnaXN0ZXIoY2UsIGNsaW50X3RpbWVyX2ZyZXEsIDIwMCwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVUxPTkdf
TUFYKTsKPiA+ICsgICAgICAgICAgICAgKnJlZ2lzdGVyZWQgPSB0cnVlOwo+ID4gKyAgICAgfQo+
Cj4KPiBJIHdhcyB1bnN1cmUgYWJvdXQgdGhlIGNsb2NrZXZlbnRzX2NvbmZpZ19hbmRfcmVnaXN0
ZXIoKSBtdWx0aXBsZSBjYWxscwo+IHdoZW4gZG9pbmcgdGhlIGNvbW1lbnQuIEl0IHNlZW1zIGxp
a2UgaXQgaXMgZmluZSB0byBjYWxsIGl0IHNldmVyYWwKPiB0aW1lcyBhbmQgdGhhdCBpcyBkb25l
IGluIHNldmVyYWwgcGxhY2VzIGxpa2UgcmlzY3Ygb3IgYXJjaF9hcm1fdGltZXIuCj4KPiBJdCBp
cyBwcm9iYWJseSBzYWZlIHRvIGRyb3AgdGhlICdyZWdpc3RlcmVkJyBjb2RlIGhlcmUsIHNvcnJ5
IGZvciB0aGUKPiBjb25mdXNpb24uCgpPa2F5LCB3aWxsIHJldmVydCB0aGVzZSBjaGFuZ2VzLgoK
Pgo+ID4gKyAgICAgZW5hYmxlX3BlcmNwdV9pcnEoY2xpbnRfdGltZXJfaXJxLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaXJxX2dldF90cmlnZ2VyX3R5cGUoY2xpbnRfdGltZXJfaXJxKSk7
Cj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4KPiBbIC4uLiBdCj4KPgo+IC0tCj4g
PGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBUk0gU29Dcwo+Cj4gRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29r
LmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPiA8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xp
bmFyb29yZz4gVHdpdHRlciB8Cj4gPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+
IEJsb2cKClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
