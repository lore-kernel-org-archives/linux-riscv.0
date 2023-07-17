Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223A4EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 06:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/CgzoDvsAVUleqOEB2ypJ5qpBqab3rnzXJXcasy1uE=; b=Jdh2mLbLvWqe+3
	/LHxG4CRiOQNdBVRodbe87P4xVaPawDS9OtEWQ1jNgEGw4vMoYR/bN87aSVdWmZUrdOqu33/FLXiO
	eBYsWsWtUTwvIm0ixMo+AKpwI4gnNwQIjk9SuIP+l4aCGSMe6Dgat9Vj2PmDVjjl9PHxWSJ3FcEpV
	rub9jiyw1yHt0xhmUOZpu42xX++vskbs0AnCg0h1KjxQ8fBSvR4s4bHxywrMOCfYcxW6itTfiYc34
	XBbP72aIiUgXI+taTcn9NfOwANufIhwikfDnNQ+ycOLIlMy2wCrK42ebRRKxjWX09waK+NP7Wf44S
	+BUJUQcpYGRnnvi9tkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLHsV-003Dg6-10;
	Mon, 17 Jul 2023 06:38:39 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLHsS-003Deo-0F
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 06:38:37 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-55b22f82ac8so3280336a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jul 2023 23:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689575914; x=1692167914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybENJY+zvZqFFXyYlFQfNam1MA92ybnOKuGRXBpZTAw=;
        b=QCmRcSURDxmA7WAhnDAKs9KEtswbEiK+GDi2sGhgm2sF4oVeEPotJXy7bchD52ZewX
         V+kcimAqmBH81vVGQUvF9N+/QkMu66QmZpsSJqzuSolr9jj11KNH+B9n/XLswhDmqr1W
         h+yKQdOrfglUzYqvAHSRLwmymEn0JqOJXy0z/W5jM8yFnFgBwZqITWakuLV8d6R9VPEn
         +ryLVL1/KZ/ZX4TrTBwOKhVQHHrFOYNVXWNQKK2Fs+41QOnlSpd08CNS9r7pd/g58L1v
         4QXgJUhL7ZhA9X2yFhij4AZvoLDWt/Ttk2qNY22rYETOOnEVzc51NwUn8wrSK3golu6e
         t9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689575914; x=1692167914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybENJY+zvZqFFXyYlFQfNam1MA92ybnOKuGRXBpZTAw=;
        b=S5y79SWVuOBI5Tvp3rqPJR1WWO/BM9Omgj/1NJQNV4X6tf/lEHYEpPymzCY8nuKx0a
         pR/35jCMGDxxtWuAbXtCmWtjZZGRbsb3tZN+E1WFLjjbSId2cwcNZIliH8vXoOw2Sn4b
         rtpopm64ywzQglh7W7Juxau61rf3DEJN6A+pEEaXxT5sn5a9+zouuZZOsE70B620EAWN
         1pSs3qCVDV78oVO0txj0/i7vGzp4ocpI3MNVhg5nWi6P9RVdleT2Y1Pkg4VJ470I1GLx
         dql6Kao8r1bXiZ2zoenU2NpKVvLAcWSDywXX3Z/uXQvGjV9/qZhPkg/5zfaa2bKSkVQC
         2/ZQ==
X-Gm-Message-State: ABy/qLYl7FrIZkqfuH73fxLPAuFq4DQwaekHi4c2LsvJXpkih+j1clR5
	wfUe2+9v9Qez2bZAaQK3MZT/c95DGPjUqpx017AsFw==
X-Google-Smtp-Source: APBJJlEv1WbE1YzG1GrFziFQaVz86XQN0MmrqrUH+8TtyVeujBILdt3jjwOTGy2HvXry3v6SfFxMZzl3/LByxr8nmn4=
X-Received: by 2002:a17:90b:3143:b0:263:e299:dff9 with SMTP id
 ip3-20020a17090b314300b00263e299dff9mr11555957pjb.23.1689575913782; Sun, 16
 Jul 2023 23:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
 <20230710094321.1378351-3-apatel@ventanamicro.com> <20230711-df9211fcae3b67948896b77f@orel>
In-Reply-To: <20230711-df9211fcae3b67948896b77f@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 17 Jul 2023 12:08:21 +0530
Message-ID: <CAK9=C2W0ck_YaZ8MT9W_0Gx4fYRLq_engKCJn9X1hh5s_VrEQw@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] irqchip/riscv-intc: Add support for RISC-V AIA
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_233836_156529_66285322 
X-CRM114-Status: GOOD (  30.23  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgNzo0MuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgMDM6MTM6
MTRQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFRoZSBSSVNDLVYgYWR2YW5jZWQgaW50
ZXJydXB0IGFyY2hpdGVjdHVyZSAoQUlBKSBleHRlbmRzIHRoZSBwZXItSEFSVAo+ID4gbG9jYWwg
aW50ZXJydXB0cyBpbiBmb2xsb3dpbmcgd2F5czoKPiA+IDEuIE1pbmltdW0gNjQgbG9jYWwgaW50
ZXJydXB0cyBmb3IgYm90aCBSVjMyIGFuZCBSVjY0Cj4gPiAyLiBBYmlsaXR5IHRvIHByb2Nlc3Mg
bXVsdGlwbGUgcGVuZGluZyBsb2NhbCBpbnRlcnJ1cHRzIGluIHNhbWUKPiA+ICAgIGludGVycnVw
dCBoYW5kbGVyCj4gPiAzLiBQcmlvcml0eSBjb25maWd1cmF0aW9uIGZvciBlYWNoIGxvY2FsIGlu
dGVycnVwdHMKPiA+IDQuIFNwZWNpYWwgQ1NScyB0byBjb25maWd1cmUvYWNjZXNzIHRoZSBwZXIt
SEFSVCBNU0kgY29udHJvbGxlcgo+Cj4gYWZhaWN0LCB3ZSdyZSBvbmx5IGRvaW5nICgxKSBhbmQg
KDIpIGZyb20gdGhpcyBsaXN0IGluIHRoaXMgcGF0Y2guCgpPa2F5LCBJIHdpbGwgdXBkYXRlIHRo
ZSBjb21taXQgZGVzY3JpcHRpb24uCgo+Cj4gPgo+ID4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQg
Zm9yIFJJU0MtViBBSUEgaW4gdGhlIFJJU0MtViBpbnRjIGRyaXZlci4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIHwgMzYgKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1pbnRjLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ID4gaW5kZXggNGFk
ZWVlMWJjMzkxLi5lMjM1YmYxNzA4YTQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWludGMuYwo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRj
LmMKPiA+IEBAIC0xNyw2ICsxNyw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+
ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9zbXAuaD4KPiA+
ICsjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+Cj4gPgo+ID4gIHN0YXRpYyBzdHJ1Y3QgaXJxX2RvbWFp
biAqaW50Y19kb21haW47Cj4gPgo+ID4gQEAgLTMwLDYgKzMxLDE1IEBAIHN0YXRpYyBhc21saW5r
YWdlIHZvaWQgcmlzY3ZfaW50Y19pcnEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAgICAgICBn
ZW5lcmljX2hhbmRsZV9kb21haW5faXJxKGludGNfZG9tYWluLCBjYXVzZSk7Cj4gPiAgfQo+ID4K
PiA+ICtzdGF0aWMgYXNtbGlua2FnZSB2b2lkIHJpc2N2X2ludGNfYWlhX2lycShzdHJ1Y3QgcHRf
cmVncyAqcmVncykKPiA+ICt7Cj4gPiArICAgICB1bnNpZ25lZCBsb25nIHRvcGk7Cj4gPiArCj4g
PiArICAgICB3aGlsZSAoKHRvcGkgPSBjc3JfcmVhZChDU1JfVE9QSSkpKQo+ID4gKyAgICAgICAg
ICAgICBnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKGludGNfZG9tYWluLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRvcGkgPj4gVE9QSV9JSURfU0hJRlQpOwo+
ID4gK30KPiA+ICsKPiA+ICAvKgo+ID4gICAqIE9uIFJJU0MtViBzeXN0ZW1zIGxvY2FsIGludGVy
cnVwdHMgYXJlIG1hc2tlZCBvciB1bm1hc2tlZCBieSB3cml0aW5nCj4gPiAgICogdGhlIFNJRSAo
U3VwZXJ2aXNvciBJbnRlcnJ1cHQgRW5hYmxlKSBDU1IuICBBcyBDU1JzIGNhbiBvbmx5IGJlIHdy
aXR0ZW4KPiA+IEBAIC0zOSwxMiArNDksMTggQEAgc3RhdGljIGFzbWxpbmthZ2Ugdm9pZCByaXNj
dl9pbnRjX2lycShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+Cj4gPiAgc3RhdGljIHZvaWQgcmlz
Y3ZfaW50Y19pcnFfbWFzayhzdHJ1Y3QgaXJxX2RhdGEgKmQpCj4gPiAgewo+ID4gLSAgICAgY3Ny
X2NsZWFyKENTUl9JRSwgQklUKGQtPmh3aXJxKSk7Cj4gPiArICAgICBpZiAoZC0+aHdpcnEgPCBC
SVRTX1BFUl9MT05HKQo+ID4gKyAgICAgICAgICAgICBjc3JfY2xlYXIoQ1NSX0lFLCBCSVQoZC0+
aHdpcnEpKTsKPiA+ICsgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgY3NyX2NsZWFyKENTUl9J
RUgsIEJJVChkLT5od2lycSAtIEJJVFNfUEVSX0xPTkcpKTsKPgo+IFdlIGNhbiBvcHRpbWl6ZSBy
djY0IGJ5IGFsbG93aW5nIHRoZSBjb21waWxlciB0byByZW1vdmUgdGhlIGJyYW5jaAo+Cj4gIGlm
IChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkgJiYgZC0+aHdpcnEgPj0gMzIpCj4gICAgIGNzcl9j
bGVhcihDU1JfSUVILCBCSVQoZC0+aHdpcnEgLSAzMikpOwo+ICBlbHNlCj4gICAgIGNzcl9jbGVh
cihDU1JfSUUsIEJJVChkLT5od2lycSkpOwo+CgpNYWtlcyBzZW5zZSwgSSB3aWxsIHVwZGF0ZS4K
Cj4KPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIHJpc2N2X2ludGNfaXJxX3VubWFzayhzdHJ1
Y3QgaXJxX2RhdGEgKmQpCj4gPiAgewo+ID4gLSAgICAgY3NyX3NldChDU1JfSUUsIEJJVChkLT5o
d2lycSkpOwo+ID4gKyAgICAgaWYgKGQtPmh3aXJxIDwgQklUU19QRVJfTE9ORykKPiA+ICsgICAg
ICAgICAgICAgY3NyX3NldChDU1JfSUUsIEJJVChkLT5od2lycSkpOwo+ID4gKyAgICAgZWxzZQo+
ID4gKyAgICAgICAgICAgICBjc3Jfc2V0KENTUl9JRUgsIEJJVChkLT5od2lycSAtIEJJVFNfUEVS
X0xPTkcpKTsKPgo+IFNhbWUgY29tbWVudCBhcyBhYm92ZS4KCk9rYXksIEkgd2lsbCB1cGRhdGUu
Cgo+Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9pZCByaXNjdl9pbnRjX2lycV9lb2koc3RydWN0
IGlycV9kYXRhICpkKQo+ID4gQEAgLTExNSwxNiArMTMxLDIyIEBAIHN0YXRpYyBzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqcmlzY3ZfaW50Y19od25vZGUodm9pZCkKPiA+Cj4gPiAgc3RhdGljIGludCBf
X2luaXQgcmlzY3ZfaW50Y19pbml0X2NvbW1vbihzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZm4pCj4g
PiAgewo+ID4gLSAgICAgaW50IHJjOwo+ID4gKyAgICAgaW50IHJjLCBucl9pcnFzID0gQklUU19Q
RVJfTE9ORzsKPiA+ICsKPiA+ICsgICAgIGlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJs
ZShOVUxMLCBTeEFJQSkgJiYgQklUU19QRVJfTE9ORyA9PSAzMikKPiA+ICsgICAgICAgICAgICAg
bnJfaXJxcyA9IG5yX2lycXMgKiAyOwo+Cj4gVGhlIEFJQSBzcGVjIHN0YXRlcyBzaWUgYW5kIHNp
cCBhcmUgZXhwbGljaXRseSA2NCwgc28gaG93IGFib3V0IHdyaXRpbmcKPiB0aGlzIGFzCj4KPiAg
aW50IHJjLCBucl9pcnFzID0gQklUU19QRVJfTE9ORzsKPgo+ICBpZiAocmlzY3ZfaXNhX2V4dGVu
c2lvbl9hdmFpbGFibGUoTlVMTCwgU3hBSUEpKQo+ICAgICAgbnJfaXJxcyA9IDY0OwoKT2theSwg
SSB3aWxsIHVwZGF0ZS4KCj4KPiA+Cj4gPiAtICAgICBpbnRjX2RvbWFpbiA9IGlycV9kb21haW5f
Y3JlYXRlX2xpbmVhcihmbiwgQklUU19QRVJfTE9ORywKPiA+ICsgICAgIGludGNfZG9tYWluID0g
aXJxX2RvbWFpbl9jcmVhdGVfbGluZWFyKGZuLCBucl9pcnFzLAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnJpc2N2X2ludGNfZG9tYWluX29wcywgTlVM
TCk7Cj4gPiAgICAgICBpZiAoIWludGNfZG9tYWluKSB7Cj4gPiAgICAgICAgICAgICAgIHByX2Vy
cigidW5hYmxlIHRvIGFkZCBJUlEgZG9tYWluXG4iKTsKPiA+ICAgICAgICAgICAgICAgcmV0dXJu
IC1FTlhJTzsKPiA+ICAgICAgIH0KPiA+Cj4gPiAtICAgICByYyA9IHNldF9oYW5kbGVfaXJxKCZy
aXNjdl9pbnRjX2lycSk7Cj4gPiArICAgICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFi
bGUoTlVMTCwgU3hBSUEpKQo+ID4gKyAgICAgICAgICAgICByYyA9IHNldF9oYW5kbGVfaXJxKCZy
aXNjdl9pbnRjX2FpYV9pcnEpOwo+ID4gKyAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICByYyA9
IHNldF9oYW5kbGVfaXJxKCZyaXNjdl9pbnRjX2lycSk7Cj4KPiBuaXQ6IGJsYW5rIGxpbmUgaGVy
ZQoKSSBwcmVmZXIgbm8gYmxhbmsgbGluZSBoZXJlIGJlY2F1c2UgdGhlICJpZiAocmMpIiBiZWxv
dwpjaGVja3MgZm9yIGVycm9ycyBmb3IgdGhlIGFib3ZlIGNhbGxzLgoKPgo+ID4gICAgICAgaWYg
KHJjKSB7Cj4gPiAgICAgICAgICAgICAgIHByX2VycigiZmFpbGVkIHRvIHNldCBpcnEgaGFuZGxl
clxuIik7Cj4gPiAgICAgICAgICAgICAgIHJldHVybiByYzsKPiA+IEBAIC0xMzIsNyArMTU0LDkg
QEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19pbml0X2NvbW1vbihzdHJ1Y3QgZndub2Rl
X2hhbmRsZSAqZm4pCj4gPgo+ID4gICAgICAgcmlzY3Zfc2V0X2ludGNfaHdub2RlX2ZuKHJpc2N2
X2ludGNfaHdub2RlKTsKPiA+Cj4gPiAtICAgICBwcl9pbmZvKCIlZCBsb2NhbCBpbnRlcnJ1cHRz
IG1hcHBlZFxuIiwgQklUU19QRVJfTE9ORyk7Cj4gPiArICAgICBwcl9pbmZvKCIlZCBsb2NhbCBp
bnRlcnJ1cHRzIG1hcHBlZCVzXG4iLAo+ID4gKyAgICAgICAgICAgICBucl9pcnFzLCAocmlzY3Zf
aXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgU3hBSUEpKSA/Cj4KPiBuaXQ6IHVubmVjZXNz
YXJ5ICgpCgpPa2F5LCBJIHdpbGwgdXBkYXRlLgoKPgo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAiIHVzaW5nIEFJQSIgOiAiIik7Cj4gPgo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4g
LS0KPiA+IDIuMzQuMQo+ID4KPgo+IFRoYW5rcywKPiBkcmV3CgpSZWdhcmRzLApBbnVwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
