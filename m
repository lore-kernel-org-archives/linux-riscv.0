Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A62FED2F9
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByB/3ZrLoP3bZLxawVh1v9Yx8IX3LNo9qEbEpDRt4Ts=; b=vGISe46VnkdWgV
	WQz+XOXq+NPkic5sZmO7q4xKcr0MsSHalLK4mDWx5o5AOOAYCa4f+/UVTf9AiMGlAByCsVMsTuTEb
	AMBZ6/ZSg0nQgKbMgnncEG+EVJFE0E+dQBtzz+5WztsENqvRKUoIGY8+cafM+ZAxPgheuMem/asAV
	tRbd0Du/Z881sFLaN1mAQO7FbWv8CEhsZVD7mbBWQDZxo2F/+2RO0tYVapX+7uUA9SEW5lFipe7SY
	Xtz9btJnltTvlDQnzpyB5oBwdUs79Cmd46oA6Nu+BTvxbg8y+tgfEL3/3D9R3t2lxCaGs8Yh+OmfK
	weMB6ojcuGEeQ2LxUETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cVU-0000000DnCH-11Oi;
	Thu, 12 Mar 2026 09:39:04 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cVR-0000000DnBo-1ObX
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 09:39:02 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-79827d28fc4so7445087b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Mar 2026 02:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773308339; cv=none;
        d=google.com; s=arc-20240605;
        b=XKOGV3BcJM5++vcl/M+rqmJEOqC1M97IlYBORUNLUsxWxga+am7reEn4V70UWX64u6
         +NbJMPwbDlgydEneFKHDXwYBCkIEYcZZ89OTzyDpNi7q1c27hMRycxFQPYusNUInifRC
         g4H1OgIo5Tmbkp4RcV65nXemyFEPLTun35Tr1PgTb3iuDjWisLPIy5N4fpVzE8g5aGGb
         s2P3WSkdCXh2hVnKYSWvXOANBMDuBPPOd4gxjva+b15Gzbi4peVPGUTpt1DkFIUhSc2F
         F4XngPz2rvs9QTtYfJtIfUiwo/g9e65PsuyDbMZrbotgVsRVwZ3Kw/PiiNNM8zUbLDoy
         cYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d645qq1RHXY2ZEXrCIAd8Z57nQOQnqeihh5RHWfjYUk=;
        fh=0npcRRWnkbuMsyyb8ciVHEhCpe0E9tUKC1mMgIriql4=;
        b=UqpQs9wxsNV4f8WZfkL2G3K8tuPVuc/cF5OY+wbvlHSZvbIZGHsRT3AZd1xM3o8xrm
         T/YNEkhIyAseH9n+gmLopNUFvJqjNczxngLAHLv3TN9nMNpabKjvdGjZutrLwM4OzoEE
         ppoZmr9bh/ztSYC9/nkCf58GTorvem6mbMhahsBPXy1UKvjepQ9IXnTkCyX+k50T+Wa4
         Pk+ENcsSpXaz+b70XpiJbb1iI7Jzo6cIGLHtp1mL4W4W14GBcPoHSJuNpehoatg0wnIm
         yP6/QAg4w3H+VMlgNAjqDbsuVWNt4WL/cCPBtrzYr7CVHJJC/S35KPuFh0hfn5HqIrDW
         1BrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773308339; x=1773913139; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d645qq1RHXY2ZEXrCIAd8Z57nQOQnqeihh5RHWfjYUk=;
        b=L+uQoHeF/W4TPIs6MP3590PbMV7qzpq2uSv8grLF2g34w9PrstCH1TvH5WlnUMi0+F
         pZllZ4kLUjInnRQbXGw3Uav+ksaJ5a1WwWQ5KOU9s/Pwup4WIsg4gtiIG+oVT0Vq8vHA
         7dVRXa3r8VftH4kCHMNr9NzRk0wF1hYRxB/ruZ4GnJddeA0gKZee+25l0qT9sVmcK1c8
         Gr3gk0n5JZAZD5wtHvJMdZtwzAFZa+BFbOGBEomRbLfJTY7x8Kgiam3jcStl435m23lQ
         pj0KoJRCMLB9OgfefP5l79731C1JonHqtbVBaxmnOP0TcXqt1gqX+ak8kq70WZVPWDDE
         UeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773308339; x=1773913139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d645qq1RHXY2ZEXrCIAd8Z57nQOQnqeihh5RHWfjYUk=;
        b=bTdcSVkAWiRkwKO02eopJdIiMPglqaWdFEEY5eJQAaLQXBCAXjH0LwNy4iyladlcr2
         LXZTIxnzipLRJpjwiIl/8e+nw7NyairsT9wICZ4BQumlKGzlFwSRMhQIqJfKf4/jGI8Y
         E1NVcfOzBqck/Qf7EqKGPl6q8pgQ7bbF1MYMHL7lIJmXauscQRMnXoMdZM5Jke7ZLb9E
         Z7TKt9+jkDdxvpXR1n03Thh3PuG6HDrCMb90Es/mFZc+MbQxCfuuGImZU/g08NEDiS0o
         kZkf0hgNZbo6HyKjpkM8TNf4aLiKLLloHiaeyTCwFASZHSV0A9Tv6VcDSYcut9nuCrTt
         /nYw==
X-Forwarded-Encrypted: i=1; AJvYcCW+xy69bJ60J4r1YMUdFZCmnMMyFNlEnWMRQeD9ra0JrZZXvTFnN1lwXHtfaIynzzr40x41Kd2RM7L86Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj9MpH0dZusd6TH87Qs+LNqfr0m1O7S7lneFaauqnQbllQDNH7
	HVMfVrmj53H9FNTa7TU+4wgfuMDTq0z9O6dY1y3Fyu2vPnGGR3cmitw+q60aUNEaBeo9aLXN4FT
	tAsa129QYQvb/6s7Tjd1pazXokJ9BLuU=
X-Gm-Gg: ATEYQzxPPSI6ZMX7MMrY0hqIqzyEfSj2ksPoTYv5ZxvBh7mNmVVH9B+bryi6nrB4RaB
	QmQh/+nZ0+Une0gmHRgJdW4KgSWCjMLiN0tQtSR7KbpGR+P+keAeGPFDMmON1PE3zxwFN7wtQgV
	ufJU5f3z8jS6iUfwfIH03Z6aJO88whY4hluY9OdhZ58JW97iUCem5SiHvXPQQ4h0A1kcdvuOoB1
	DftsKcfidovOCisnSrSvEng+HrQj7HVjV+8ls3215/XU3TiIgt4NZp/QCaniOyN2nq7lbR0PA6N
	Wer+XGM=
X-Received: by 2002:a05:690c:6d82:b0:799:1af1:6c69 with SMTP id
 00721157ae682-7991af16fbamr45243437b3.26.1773308339300; Thu, 12 Mar 2026
 02:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-2-5bb2b574df5d@gmail.com> <20260309132219-GKE302167@kernel.org>
In-Reply-To: <20260309132219-GKE302167@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 12 Mar 2026 10:38:48 +0100
X-Gm-Features: AaiRm52BiCFPbC8nIFwrdrDzkLisJX7YfgLkKCTQywgdqQlIVQj3SZM1LgN_fKc
Message-ID: <CABdCQ=PpA4u+pY-pZgggHPNnDMJUVmgqofMf7O6YMrB+2aDkww@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
To: Yixun Lan <dlan@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_023901_385856_8E61B182 
X-CRM114-Status: GOOD (  25.29  )
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

RWwgbHVuLCA5IG1hciAyMDI2IGEgbGFzIDE0OjIyLCBZaXh1biBMYW4gKDxkbGFuQGtlcm5lbC5v
cmc+KSBlc2NyaWJpw7M6Cj4KPiBIaSBJa2VyLAo+Cj4gT24gMTI6NDAgTW9uIDA5IE1hciAgICAg
LCBJa2VyIFBlZHJvc2Egd3JvdGU6Cj4gPiBBZGQgdm9sdGFnZSBzd2l0Y2hpbmcgaW5mcmFzdHJ1
Y3R1cmUgZm9yIFVIUy1JIG1vZGVzIGJ5IGludGVncmF0aW5nIGJvdGgKPiA+IHJlZ3VsYXRvciBm
cmFtZXdvcmsgKGZvciBzdXBwbHkgdm9sdGFnZSBjb250cm9sKSBhbmQgcGluY3RybCBzdGF0ZQo+
ID4gc3dpdGNoaW5nIChmb3IgcGluIGRyaXZlIHN0cmVuZ3RoIG9wdGltaXphdGlvbikuCj4gPgo+
ID4gLSBBZGQgcmVndWxhdG9yIHN1cHBseSBwYXJzaW5nIGFuZCB2b2x0YWdlIHN3aXRjaGluZyBj
YWxsYmFjawo+ID4gLSBBZGQgb3B0aW9uYWwgcGluY3RybCBzdGF0ZSBzd2l0Y2hpbmcgYmV0d2Vl
biAiZGVmYXVsdCIgKDMuM1YpIGFuZAo+ID4gICAic3RhdGVfdWhzIiAoMS44VikgY29uZmlndXJh
dGlvbnMKPiA+IC0gRW5hYmxlIGNvb3JkaW5hdGVkIHZvbHRhZ2UgYW5kIHBpbiBjb25maWd1cmF0
aW9uIGNoYW5nZXMgZm9yIFVIUyBtb2Rlcwo+ID4KPiA+IFRoaXMgcHJvdmlkZXMgY29tcGxldGUg
dm9sdGFnZSBzd2l0Y2hpbmcgc3VwcG9ydCB3aGlsZSBtYWludGFpbmluZwo+ID4gYmFja3dhcmQg
Y29tcGF0aWJpbGl0eSB3aGVuIHBpbmN0cmwgc3RhdGVzIGFyZSBub3QgZGVmaW5lZC4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBJa2VyIFBlZHJvc2EgPGlrZXJwZWRyb3NhbUBnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMgfCA1OSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTkg
aW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNp
LW9mLWsxLmMgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMKPiA+IGluZGV4IDU4NWM3
ZWNhNmViZjI1M2FhYzQ2NmRkMzdjZWYwMjlkZWI2M2Y2OTIuLjhhZjExN2E4ZTI3MWMwNGE4MGQ4
ZGM3YmI1Y2UxMjA3NTY1MmRkN2EgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3Nk
aGNpLW9mLWsxLmMKPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYwo+ID4g
QEAgLTE1LDYgKzE1LDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ID4g
KyNpbmNsdWRlIDxsaW51eC9waW5jdHJsL2NvbnN1bWVyLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4
L3BsYXRmb3JtX2RldmljZS5oPgo+ID4KPiA+ICAjaW5jbHVkZSAic2RoY2kuaCIKPiA+IEBAIC03
MCw2ICs3MSw5IEBACj4gPiAgc3RydWN0IHNwYWNlbWl0X3NkaGNpX2hvc3Qgewo+ID4gICAgICAg
c3RydWN0IGNsayAqY2xrX2NvcmU7Cj4gPiAgICAgICBzdHJ1Y3QgY2xrICpjbGtfaW87Cj4gPiAr
ICAgICBzdHJ1Y3QgcGluY3RybCAqcGluY3RybDsKPiA+ICsgICAgIHN0cnVjdCBwaW5jdHJsX3N0
YXRlICpwaW5jdHJsX2RlZmF1bHQ7Cj4gPiArICAgICBzdHJ1Y3QgcGluY3RybF9zdGF0ZSAqcGlu
Y3RybF91aHM7Cj4gPiAgfTsKPiA+Cj4gPiAgLyogQWxsIGhlbHBlciBmdW5jdGlvbnMgd2lsbCB1
cGRhdGUgY2xyL3NldCB3aGlsZSBwcmVzZXJ2ZSByZXN0IGJpdHMgKi8KPiA+IEBAIC0yMTgsNiAr
MjIyLDQyIEBAIHN0YXRpYyB2b2lkIHNwYWNlbWl0X3NkaGNpX3ByZV9oczQwMF90b19oczIwMChz
dHJ1Y3QgbW1jX2hvc3QgKm1tYykKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1BB
Q0VNSVRfU0RIQ19QSFlfQ1RSTF9SRUcpOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHZvaWQgc3Bh
Y2VtaXRfc2RoY2lfdm9sdGFnZV9zd2l0Y2goc3RydWN0IHNkaGNpX2hvc3QgKmhvc3QpCj4gPiAr
ewo+ID4gKyAgICAgc3RydWN0IHNkaGNpX3BsdGZtX2hvc3QgKnBsdGZtX2hvc3QgPSBzZGhjaV9w
cml2KGhvc3QpOwo+ID4gKyAgICAgc3RydWN0IHNwYWNlbWl0X3NkaGNpX2hvc3QgKnNkaHN0ID0g
c2RoY2lfcGx0Zm1fcHJpdihwbHRmbV9ob3N0KTsKPiA+ICsgICAgIHN0cnVjdCBtbWNfaW9zICpp
b3MgPSAmaG9zdC0+bW1jLT5pb3M7Cj4gPiArICAgICBzdHJ1Y3QgcGluY3RybF9zdGF0ZSAqc3Rh
dGU7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgLyogU2VsZWN0IGFwcHJvcHJp
YXRlIHBpbmN0cmwgc3RhdGUgYmFzZWQgb24gc2lnbmFsIHZvbHRhZ2UgKi8KPiA+ICsgICAgIGlm
IChzZGhzdC0+cGluY3RybCkgewo+IGRvIGEgc2FuaXR5IGNoZWNrLCB0aGVuIGFib3J0IGl0IGVh
cmx5LCB0aGUgYWR2YW50YWdlIGlzIHRoYXQgeW91IGNhbiBnZXQgcmlkIG9mCj4gb25lIGluZGV0
YXRpb24gZm9yIG5leHQgY29kZS4uCj4KPiAgICAgICAgIGlmICghc2Roc3QtPnBpbmN0cmwpCj4g
ICAgICAgICAgICAgICAgIHJldHVybjsKPgoKTWFrZXMgc2Vuc2UuIEknbGwgZ2V0IGl0IHJlYWR5
IGZvciB0aGUgbmV4dCB2ZXJzaW9uLgoKPgo+ID4gKyAgICAgICAgICAgICBzd2l0Y2ggKGlvcy0+
c2lnbmFsX3ZvbHRhZ2UpIHsKPiA+ICsgICAgICAgICAgICAgY2FzZSBNTUNfU0lHTkFMX1ZPTFRB
R0VfMzMwOgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHN0YXRlID0gc2Roc3QtPnBpbmN0cmxf
ZGVmYXVsdDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgICAg
ICAgY2FzZSBNTUNfU0lHTkFMX1ZPTFRBR0VfMTgwOgo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHN0YXRlID0gc2Roc3QtPnBpbmN0cmxfdWhzOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ID4gKyAgICAgICAgICAgICBkZWZhdWx0Ogo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IGRldl93YXJuKG1tY19kZXYoaG9zdC0+bW1jKSwgInVuc3VwcG9ydGVkIHZvbHRhZ2UgJWRcbiIs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW9zLT5zaWduYWxfdm9sdGFnZSk7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgICAgICAgICB9Cj4g
PiArCj4gPiArICAgICAgICAgICAgIGlmIChzdGF0ZSkgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIHJldCA9IHBpbmN0cmxfc2VsZWN0X3N0YXRlKHNkaHN0LT5waW5jdHJsLCBzdGF0ZSk7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGV2X3dhcm4obW1jX2Rldihob3N0LT5tbWMpLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgImZhaWxlZCB0byBzZWxlY3QgcGluY3RybCBzdGF0
ZTogJWRcbiIsIHJldCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRl
dl9kYmcobW1jX2Rldihob3N0LT5tbWMpLCAic3dpdGNoZWQgdG8gJXMgcGluY3RybCBzdGF0ZVxu
IiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvcy0+c2lnbmFsX3ZvbHRhZ2Ug
PT0gTU1DX1NJR05BTF9WT0xUQUdFXzE4MCA/ICJVSFMiIDogImRlZmF1bHQiKTsKPiA+ICsgICAg
ICAgICAgICAgfQo+ID4gKyAgICAgfQo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgaW5saW5lIGlu
dCBzcGFjZW1pdF9zZGhjaV9nZXRfY2xvY2tzKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzZGhjaV9wbHRmbV9o
b3N0ICpwbHRmbV9ob3N0KQo+ID4gIHsKPiA+IEBAIC0yNDIsNiArMjgyLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzZGhjaV9vcHMgc3BhY2VtaXRfc2RoY2lfb3BzID0gewo+ID4gICAgICAgLnNl
dF9idXNfd2lkdGggICAgICAgICAgPSBzZGhjaV9zZXRfYnVzX3dpZHRoLAo+ID4gICAgICAgLnNl
dF9jbG9jayAgICAgICAgICAgICAgPSBzcGFjZW1pdF9zZGhjaV9zZXRfY2xvY2ssCj4gPiAgICAg
ICAuc2V0X3Voc19zaWduYWxpbmcgICAgICA9IHNwYWNlbWl0X3NkaGNpX3NldF91aHNfc2lnbmFs
aW5nLAo+ID4gKyAgICAgLnZvbHRhZ2Vfc3dpdGNoICAgICAgICAgPSBzcGFjZW1pdF9zZGhjaV92
b2x0YWdlX3N3aXRjaCwKPiA+ICB9Owo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNkaGNp
X3BsdGZtX2RhdGEgc3BhY2VtaXRfc2RoY2lfazFfcGRhdGEgPSB7Cj4gPiBAQCAtMjkzLDYgKzMz
NCwyNCBAQCBzdGF0aWMgaW50IHNwYWNlbWl0X3NkaGNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gPgo+ID4gICAgICAgaG9zdC0+bW1jLT5jYXBzIHw9IE1NQ19DQVBfTkVF
RF9SU1BfQlVTWTsKPiA+Cj4gPiArICAgICBzZGhzdCA9IHNkaGNpX3BsdGZtX3ByaXYocGx0Zm1f
aG9zdCk7Cj4gLi4KPiA+ICsgICAgIHNkaHN0LT5waW5jdHJsID0gZGV2bV9waW5jdHJsX2dldChk
ZXYpOwo+ID4gKyAgICAgaWYgKCFJU19FUlIoc2Roc3QtPnBpbmN0cmwpKSB7Cj4gPiArICAgICAg
ICAgICAgIHNkaHN0LT5waW5jdHJsX2RlZmF1bHQgPSBwaW5jdHJsX2xvb2t1cF9zdGF0ZShzZGhz
dC0+cGluY3RybCwgImRlZmF1bHQiKTsKPiA+ICsgICAgICAgICAgICAgaWYgKElTX0VSUihzZGhz
dC0+cGluY3RybF9kZWZhdWx0KSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzZGhzdC0+cGlu
Y3RybF9kZWZhdWx0ID0gTlVMTDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgc2Roc3QtPnBpbmN0
cmxfdWhzID0gcGluY3RybF9sb29rdXBfc3RhdGUoc2Roc3QtPnBpbmN0cmwsICJzdGF0ZV91aHMi
KTsKPiA+ICsgICAgICAgICAgICAgaWYgKElTX0VSUihzZGhzdC0+cGluY3RybF91aHMpKQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIHNkaHN0LT5waW5jdHJsX3VocyA9IE5VTEw7Cj4gPiArCj4g
PiArICAgICAgICAgICAgIGRldl9kYmcoZGV2LCAicGluY3RybCBzZXR1cDogZGVmYXVsdD0lcCwg
dWhzPSVwXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHNkaHN0LT5waW5jdHJsX2RlZmF1
bHQsIHNkaHN0LT5waW5jdHJsX3Vocyk7Cj4gPiArICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAg
ICAgICBzZGhzdC0+cGluY3RybCA9IE5VTEw7Cj4gPiArICAgICAgICAgICAgIGRldl9kYmcoZGV2
LCAicGluY3RybCBub3QgYXZhaWxhYmxlLCB2b2x0YWdlIHN3aXRjaGluZyB3aWxsIHdvcmsgd2l0
aG91dCBpdFxuIik7Cj4gPiArICAgICB9Cj4gPiArCj4gaG93IGFib3V0IGNyZWF0aW5nIGEgZnVu
Y3Rpb24gc3BhY2VtaXRfc2RoY2lfZ2V0X3BpbnMoKT8gc2ltaWxhciBhcyBnZXQKPiByZXNvdXJj
ZSBmb3IgY2xvY2ssIHdpbGwgbW9yZSByZWFkYWJsZS4KClllcywgSSdsbCBkbyB0aGF0LiBUaGFu
ayB5b3UgZm9yIHRoZSBmZWVkYmFjay4KCj4KPiA+ICAgICAgIHJldCA9IHNwYWNlbWl0X3NkaGNp
X2dldF9jbG9ja3MoZGV2LCBwbHRmbV9ob3N0KTsKPiA+ICAgICAgIGlmIChyZXQpCj4gPiAgICAg
ICAgICAgICAgIGdvdG8gZXJyX3BsdGZtOwo+ID4KPiA+IC0tCj4gPiAyLjUzLjAKPiA+Cj4KPiAt
LQo+IFlpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
