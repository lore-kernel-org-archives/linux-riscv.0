Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C953FC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 11:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHwYost24zcrHxe0nIuZmhb3VpvTSq22YkQKWu56RcQ=; b=GG1wrzAwrEMY76
	9taV/C7OLmjbBNibW2s2Llym24cvh7d3vy/3ub0klNh7aNNdUAwEoqd1jAW6zHPk0DivWpEpGgpIF
	DAcXqOJtkM/f0FAsCxvshBPoTaCjdOs60M8B6MAnvbz9d5JqSrNEtxWA3aAMI+dCj+Ec2Spqi1vJV
	gWteQjXXftCrHOqXap6VVMey3pbystqfAI/xgocr9z+mlz3sVmIDbGkWynFPRPUh+0alDHB2ApEZ0
	EnEUJft2oxwQ3mlsfRmX+UMHMvI0yoN1DQbSxhzb2esV2f2mcF7qj3itMPvL7gtBzXrtr29MvNEeV
	ecKXD8jjCOzOMuG4aqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmRi-0000000GUYo-2vdO;
	Tue, 30 Jan 2024 11:38:31 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmRT-0000000GUOu-1s2v
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 11:38:16 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-603e370790cso17193467b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706614693; x=1707219493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMem4Wnyl/FAVyRvXWDBiw17T/CYF02xtBqauVXYuOA=;
        b=uO7weFqMM5eRvy+cxvPmFlvm22rIZF2M+l69u+EVBEFX/+P+E17Wik9ahGGx5HPPEz
         a7kuOucTQmgstosnCXZRFR16fkbvu/KTl+sDHWf5KPBtoKJIZzOXD+fxLoQ4SbhMFJR1
         H5n3RWNjLdjprEHVgVneksG9w5zmQG+Z1R7tVA3wR/TsNrC+joWMP/nirR0sIbYl+JXm
         L+fNufvw4bD2ryWShRbjsbGBDf5XZWtx6hZT/CsoFadkPwSwIlF84KAUB+IWOBO+PDi1
         8FNySLuI+Xgfp1nmg9S7v3SWrAclp/LH+9SEvSwg4ZgD8aFLd668Y0n9EBKja6ijun8V
         1oNw==
X-Gm-Message-State: AOJu0Yx9LnWfRD0FQIP9rCR7pFQjM2mMn6OLU6V+kSdDbwy1A0zLLvTm
	JSwu/DlnobZekBkkUlASg4E545aDzjzMcdK/+q3W97kDE/R1GfWl/ls5nmeu1Mc=
X-Google-Smtp-Source: AGHT+IGcXiGYI26ukGwx29Kd3PyGL3LlyHSkn2vM6Fo/iB4BqtoQsuXlGhj5VriGf875xr02oHVwhA==
X-Received: by 2002:a81:af4f:0:b0:5d7:a3f:fce3 with SMTP id x15-20020a81af4f000000b005d70a3ffce3mr5940000ywj.8.1706614693351;
        Tue, 30 Jan 2024 03:38:13 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id gt19-20020a05690c451300b005ff7a3cc04dsm3114935ywb.129.2024.01.30.03.38.12
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 03:38:12 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6039716f285so29778197b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:38:12 -0800 (PST)
X-Received: by 2002:a05:6902:14e:b0:dc2:35c1:7d9c with SMTP id
 p14-20020a056902014e00b00dc235c17d9cmr4871757ybh.60.1706614692403; Tue, 30
 Jan 2024 03:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240129151618.90922-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240129151618.90922-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 12:38:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7Q4kMv1pFVNBf5oYF=_W_snp=5GKLpr9+OxeqxywhBw@mail.gmail.com>
Message-ID: <CAMuHMdV7Q4kMv1pFVNBf5oYF=_W_snp=5GKLpr9+OxeqxywhBw@mail.gmail.com>
Subject: Re: [PATCH 2/5] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_033815_603815_B7176410 
X-CRM114-Status: GOOD (  27.99  )
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

SGkgUHJhYmhha2FyLAoKT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDoxNuKAr1BNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFRoZSBJWDQ1
IGJsb2NrIGhhcyBhZGRpdGlvbmFsIG1hc2sgcmVnaXN0ZXJzIChOTVNLL0lNU0svVE1TSykgYXMg
Y29tcGFyZWQKPiB0byB0aGUgUlovRzJMIChmYW1pbHkpIFNvQy4KPgo+IEludHJvZHVjZSBtYXNr
aW5nL3VubWFza2luZyBzdXBwb3J0IGZvciBJUlEgYW5kIFRJTlQgaW50ZXJydXB0cyBpbiBJUlFD
Cj4gY29udHJvbGxlciBkcml2ZXIuIFR3byBuZXcgcmVnaXN0ZXJzLCBJTVNLIGFuZCBUTVNLLCBh
cmUgZGVmaW5lZCB0bwo+IGhhbmRsZSBtYXNraW5nIG9uIFJaL0ZpdmUgU29DLiBUaGUgaW1wbGVt
ZW50YXRpb24gdXRpbGl6ZXMgYSBuZXcgZGF0YQo+IHN0cnVjdHVyZSwgYHN0cnVjdCByemcybF9p
cnFjX2RhdGFgLCB0byBkZXRlcm1pbmUgbWFzayBzdXBwb3J0IGZvciBhCj4gc3BlY2lmaWMgY29u
dHJvbGxlciBpbnN0YW5jZS4KPgo+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJo
YWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KClRoYW5rcyBmb3IgeW91ciBwYXRj
aCEKCj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6ZzJsLmMKPiArKysgYi9k
cml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnpnMmwuYwo+IEBAIC02NiwxNSArNjgsMjUgQEAg
c3RydWN0IHJ6ZzJsX2lycWNfcmVnX2NhY2hlIHsKPiAgICAgICAgIHUzMiAgICAgdGl0c3JbMl07
Cj4gIH07Cj4KPiArLyoqCj4gKyAqIHN0cnVjdCByemcybF9pcnFjX2RhdGEgLSBPRiBkYXRhIHN0
cnVjdHVyZQo+ICsgKiBAbWFza19zdXBwb3J0ZWQ6IEluZGljYXRlcyBpZiBtYXNrIHJlZ2lzdGVy
cyBhcmUgYXZhaWxhYmxlCj4gKyAqLwo+ICtzdHJ1Y3QgcnpnMmxfaXJxY19kYXRhIHsKClRoaXMg
c3RydWN0dXJlIGhhcyB0aGUgc2FtZSBuYW1lIGFzIHRoZSBzaW5nbGUgc3RhdGljIHN0cnVjdApy
emcybF9pcnFjX3ByaXYgaW5zdGFuY2UsIHdoaWNoIGlzIGNvbmZ1c2luZy4KCj4gKyAgICAgICBi
b29sICAgIG1hc2tfc3VwcG9ydGVkOwo+ICt9Owo+ICsKPiAgLyoqCj4gICAqIHN0cnVjdCByemcy
bF9pcnFjX3ByaXYgLSBJUlEgY29udHJvbGxlciBwcml2YXRlIGRhdGEgc3RydWN0dXJlCj4gICAq
IEBiYXNlOiAgICAgIENvbnRyb2xsZXIncyBiYXNlIGFkZHJlc3MKPiArICogQGRhdGE6ICAgICAg
T0YgZGF0YSBwb2ludGVyCj4gICAqIEBmd3NwZWM6ICAgIElSUSBmaXJtd2FyZSBzcGVjaWZpYyBk
YXRhCj4gICAqIEBsb2NrOiAgICAgIExvY2sgdG8gc2VyaWFsaXplIGFjY2VzcyB0byBoYXJkd2Fy
ZSByZWdpc3RlcnMKPiAgICogQGNhY2hlOiAgICAgUmVnaXN0ZXJzIGNhY2hlIGZvciBzdXNwZW5k
L3Jlc3VtZQo+ICAgKi8KPiAgc3RhdGljIHN0cnVjdCByemcybF9pcnFjX3ByaXYgewo+ICAgICAg
ICAgdm9pZCBfX2lvbWVtICAgICAgICAgICAgICAgICAgICAqYmFzZTsKPiArICAgICAgIGNvbnN0
IHN0cnVjdCByemcybF9pcnFjX2RhdGEgICAgKmRhdGE7CgpSZXBsYWNpbmcgdGhpcyBieSBhIGJv
b2wgd291bGQgYXZvaWQgYSBwb2ludGVyIGRlcmVmZXJlbmNlIGluIGVhY2ggdXNlciwKYW5kIGFs
bG93cyB5b3UgdG8gbWFrZSByemcybF9pcnFjX2RhdGEgZXRjLiBfX2luaXRjb25zdC4KCj4gICAg
ICAgICBzdHJ1Y3QgaXJxX2Z3c3BlYyAgICAgICAgICAgICAgIGZ3c3BlY1tJUlFDX05VTV9JUlFd
Owo+ICAgICAgICAgcmF3X3NwaW5sb2NrX3QgICAgICAgICAgICAgICAgICBsb2NrOwo+ICAgICAg
ICAgc3RydWN0IHJ6ZzJsX2lycWNfcmVnX2NhY2hlICAgICBjYWNoZTsKCj4gQEAgLTM3MSw5ICs0
NzUsMjMgQEAgc3RhdGljIGludCByemcybF9pcnFjX3BhcnNlX2ludGVycnVwdHMoc3RydWN0IHJ6
ZzJsX2lycWNfcHJpdiAqcHJpdiwKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCByemcybF9pcnFjX2RhdGEgcnpmaXZlX2lycWNfZGF0YSA9IHsKPiArICAg
ICAgIC5tYXNrX3N1cHBvcnRlZCA9IHRydWUsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IHJ6ZzJsX2lycWNfZGF0YSByemcybF9pcnFjX2RlZmF1bHRfZGF0YSA9IHsKPiArICAgICAg
IC5tYXNrX3N1cHBvcnRlZCA9IGZhbHNlLAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgcnpnMmxfaXJxY19tYXRjaGVzW10gPSB7Cj4gKyAgICAgICB7IC5jb21w
YXRpYmxlID0gInJlbmVzYXMscjlhMDdnMDQzZi1pcnFjIiwgLmRhdGEgPSAmcnpmaXZlX2lycWNf
ZGF0YSB9LAo+ICsgICAgICAgeyB9Cj4gK307Cj4gKwo+ICBzdGF0aWMgaW50IHJ6ZzJsX2lycWNf
aW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50
KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgaXJxX2RvbWFpbiAqaXJxX2RvbWFpbiwgKnBhcmVudF9k
b21haW47Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaDsKPiAgICAg
ICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7Cj4gICAgICAgICBzdHJ1Y3QgcmVzZXRf
Y29udHJvbCAqcmVzZXRuOwo+ICAgICAgICAgaW50IHJldDsKPiBAQCAtMzkyLDYgKzUxMCwxMiBA
QCBzdGF0aWMgaW50IHJ6ZzJsX2lycWNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50KQo+ICAgICAgICAgaWYgKCFyemcybF9pcnFjX2RhdGEp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Cj4gKyAgICAgICBtYXRjaCA9IG9m
X21hdGNoX25vZGUocnpnMmxfaXJxY19tYXRjaGVzLCBub2RlKTsKPiArICAgICAgIGlmIChtYXRj
aCkKPiArICAgICAgICAgICAgICAgcnpnMmxfaXJxY19kYXRhLT5kYXRhID0gbWF0Y2gtPmRhdGE7
Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIHJ6ZzJsX2lycWNfZGF0YS0+ZGF0YSA9
ICZyemcybF9pcnFjX2RlZmF1bHRfZGF0YTsKCkluc3RlYWQgb2YgbWF0Y2hpbmcgYSBzZWNvbmQg
dGltZSwgSSdkIHJhdGhlciBhZGQgYSBzZWNvbmQKSVJRQ0hJUF9NQVRDSCgpIGVudHJ5IHdpdGgg
YSBkaWZmZXJlbnQgaW5pdCBmdW5jdGlvbiwgcGFzc2luZyB0aGUKYWN0dWFsIHJ6ZzJsX2lycWNf
ZGF0YSBwb2ludGVyLgoKPiArCj4gICAgICAgICByemcybF9pcnFjX2RhdGEtPmJhc2UgPSBkZXZt
X29mX2lvbWFwKCZwZGV2LT5kZXYsIHBkZXYtPmRldi5vZl9ub2RlLCAwLCBOVUxMKTsKPiAgICAg
ICAgIGlmIChJU19FUlIocnpnMmxfaXJxY19kYXRhLT5iYXNlKSkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIFBUUl9FUlIocnpnMmxfaXJxY19kYXRhLT5iYXNlKTsKCkdye29ldGplLGVldGluZ31z
LAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
