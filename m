Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EC7C6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiQBvqOVDOfCJ2fyGTYNcfeJg3RHkJKWVCUqyHoGEiU=; b=ez+hRxCfNQfIby
	2IWbDly7P5KYXQiSzQgvyGNMDYdGjDkmV9f2VR71Htce6w4dBabncmjN9IGJjSroncIGx+hVOI8ei
	axtpDlosHGQBHaYSQU4xT9ywcRgUfJbykwDj6N05j0jP1rmHss4PkQDUFA3KlbifML3gF7vWeIa/F
	LgaNaf5NvSdLKxsfCGMs2p/3dEyp2xRxAVFD1zeSf3oJ0i7pHtV+z5DKyrs77koOrEid8RNASEKWd
	yx2ETbFDpPI6x2Tjg0Y+UQZ9C1WUIl33+S4SSu3GzT09Isek2M/5sbmcJXl32O1+ch15WkKdDKWqX
	o7TW87V6TejwaH49tMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcat-00FgD8-Cc; Mon, 13 Feb 2023 17:26:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcaq-00FgCK-2H
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:26:22 +0000
Received: by mail-wr1-x430.google.com with SMTP id k3so5405988wrv.5
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 09:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdB4bLMRqGg5/rDPrBY4SK/ZGCvV/97ci3ClbiI2Aa4=;
        b=D9XbGN5aNuVWSy3QJDkq8LUe5yMpGpmyv2WhEU62l9LahDBR5kxa7m33xmIUs3e8l0
         eOLulDSyDaGI6H35gq1aRDUHlB0x8NgxlC0HonnBLWm5pbwC2kL1YNR/FjzQTyS8Kg/o
         wVEASRy1WF96pH8Kw2BPKobF4t6+nHjdpcR/4RAaO1nvHcllnTqupIDL0pr5FFMstLyW
         BQEU+vhZVFGVeKT4jqBz6OHY4cCox6HCFxYWv+KooAQsP7dT3L8M0zL6XJyjRIL/vmwi
         9k+adAuqD6G5gHrHflBoJxTe+L52C9UdMzpLStnCz1agfz2UfBO9mUevAWsfn0jP09vZ
         Ne8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdB4bLMRqGg5/rDPrBY4SK/ZGCvV/97ci3ClbiI2Aa4=;
        b=KxZjnn7PtNHB/C8AiQlrgCheVDQMAP1o/7DbqV3wbq9FhSZ5hIzPxSDQfLrZNch6vF
         2y23M1XmRoXsg3vSk7CbqFp9rW5gQp0BsRUmqdPLeNkLXwGGS1eQuuuHXvy9YUeInctd
         /UZrEzcBk0BMyi3BBQiwfTJcWA2n7ATlLRho7A6Cm5LSe0WWWXhGMCavuaYnnn8oT+zK
         cLFnfBV/ynWzpHfKFbSRHogBVw0RCS+wv840Ne3WhxN8i3koHOj3UxpYK124Oj4dUn9D
         RnLEdpZFwzAWIA0ZTXJRb8gbDdxbBGUG2lhkoCyit1Pff4h5owmhW57NE3grF9P97ckx
         WzkQ==
X-Gm-Message-State: AO0yUKVTT1dL7Yd3r5tDSQfQR4of6rqcG01dXFALnsAZpi/o/7pj8LK8
	QdMq7v+LcXLJdPetSOYe+x/7DA==
X-Google-Smtp-Source: AK7set8A7pJic60bSGlXIm5zn5pKPq70hzhF9X3JRd41EdaworN6smzMRFHQj3f/IA7ogP26MCQIyQ==
X-Received: by 2002:a5d:63cc:0:b0:2c5:52f5:c63b with SMTP id c12-20020a5d63cc000000b002c552f5c63bmr4979603wrw.11.1676309174098;
        Mon, 13 Feb 2023 09:26:14 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id x10-20020a5d54ca000000b002bfb5ebf8cfsm10719006wrv.21.2023.02.13.09.26.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Feb 2023 09:26:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 06/24] RISC-V: ACPI: Add PCI functions to build ACPI core
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230130182225.2471414-7-sunilvl@ventanamicro.com>
Date: Mon, 13 Feb 2023 17:26:13 +0000
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Anup Patel <apatel@ventanamicro.com>,
 linux-doc@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>
Message-Id: <33DF2416-0629-414D-B50E-D99CB55A83AA@jrtc27.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-7-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_092620_180451_D0AAA956 
X-CRM114-Status: GOOD (  26.30  )
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

T24gMzAgSmFuIDIwMjMsIGF0IDE4OjIyLCBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3Jv
LmNvbT4gd3JvdGU6Cj4gCj4gV2hlbiBDT05GSUdfUENJIGlzIGVuYWJsZWQsIEFDUEkgY29yZSBl
eHBlY3RzIGZldyBhcmNoCj4gZnVuY3Rpb25zIHJlbGF0ZWQgdG8gUENJLiBBZGQgdGhvc2UgZnVu
Y3Rpb25zIHNvIHRoYXQKPiBBQ1BJIGNvcmUgZ2V0cyBidWlsZC4gVGhlc2UgYXJlIGxldnJhZ2Vk
IGZyb20gYXJtNjQuCgpQcmVzdW1hYmx5IHRoaXMgaXMgcHJldHR5IGdlbmVyaWMgYW5kIGFwcGxp
ZXMgdG8gYW55dGhpbmcgd2l0aG91dCB4ODYKd2VpcmRuZXNzLiBDb3B5aW5nIGFsbCB0aGlzIHN1
cHBvc2VkbHkgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGNvZGUKdGhhdOKAmXMgcmVhbGx5IGdlbmVy
aWMgc2VlbXMgbGlrZSBiYWQgcHJhY3RpY2UgdG8gbWUgYXMgYW4gb3V0c2lkZXIuClNob3VsZCB0
aGlzIG5vdCBiZSB1bmlmeWluZyB0aGUgdHdvIGluIGEgc2hhcmVkIGxvY2F0aW9uIGFzIGhhcyBi
ZWVuCmRvbmUgZm9yIG90aGVyIHN1YnN5c3RlbXM/CgpKZXNzCgo+IFNpZ25lZC1vZmYtYnk6IFN1
bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+IGFyY2gvcmlzY3Yva2Vy
bmVsL01ha2VmaWxlIHwgICAxICsKPiBhcmNoL3Jpc2N2L2tlcm5lbC9wY2kuYyAgICB8IDE3MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gMiBmaWxlcyBjaGFuZ2VkLCAx
NzQgaW5zZXJ0aW9ucygrKQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9w
Y2kuYwo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSBiL2FyY2gv
cmlzY3Yva2VybmVsL01ha2VmaWxlCj4gaW5kZXggZjk3OWRjOGNmNDdkLi5lOWQzNzYzOTc1MWQg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9NYWtlZmlsZQo+IEBAIC05MiwzICs5Miw0IEBAIG9iai0kKENPTkZJR19DT01Q
QVQpCQkrPSBjb21wYXRfc2lnbmFsLm8KPiBvYmotJChDT05GSUdfQ09NUEFUKQkJKz0gY29tcGF0
X3Zkc28vCj4gCj4gb2JqLSQoQ09ORklHX0FDUEkpICAgICAgICAgICAgICArPSBhY3BpLm8KPiAr
b2JqLSQoQ09ORklHX1BDSSkgICAgICAgICAgICAgICArPSBwY2kubwo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9wY2kuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BjaS5jCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjMzODhhZjNhNjdhMAo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wY2kuYwo+IEBAIC0wLDAgKzEsMTcz
IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiArLyoKPiAr
ICogQ29kZSBib3Jyb3dlZCBmcm9tIEFSTTY0Cj4gKyAqCj4gKyAqIENvcHlyaWdodCAoQykgMjAw
MyBBbnRvbiBCbGFuY2hhcmQgPGFudG9uQGF1LmlibS5jb20+LCBJQk0KPiArICogQ29weXJpZ2h0
IChDKSAyMDE0IEFSTSBMdGQuCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMi0yMDIzIFZlbnRhbmEg
TWljcm8gU3lzdGVtIEluYy4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvYWNwaS5oPgo+
ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW0uaD4KPiArI2luY2x1
ZGUgPGxpbnV4L3BjaS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGNpLWFjcGkuaD4KPiArI2luY2x1
ZGUgPGxpbnV4L3BjaS1lY2FtLmg+Cj4gKwo+ICsjaWZkZWYgQ09ORklHX0FDUEkKPiArCj4gKy8q
Cj4gKyAqIHJhd19wY2lfcmVhZC93cml0ZSAtIFBsYXRmb3JtLXNwZWNpZmljIFBDSSBjb25maWcg
c3BhY2UgYWNjZXNzLgo+ICsgKi8KPiAraW50IHJhd19wY2lfcmVhZCh1bnNpZ25lZCBpbnQgZG9t
YWluLCB1bnNpZ25lZCBpbnQgYnVzLAo+ICsJCSAgdW5zaWduZWQgaW50IGRldmZuLCBpbnQgcmVn
LCBpbnQgbGVuLCB1MzIgKnZhbCkKPiArewo+ICsJc3RydWN0IHBjaV9idXMgKmIgPSBwY2lfZmlu
ZF9idXMoZG9tYWluLCBidXMpOwo+ICsKPiArCWlmICghYikKPiArCQlyZXR1cm4gUENJQklPU19E
RVZJQ0VfTk9UX0ZPVU5EOwo+ICsJcmV0dXJuIGItPm9wcy0+cmVhZChiLCBkZXZmbiwgcmVnLCBs
ZW4sIHZhbCk7Cj4gK30KPiArCj4gK2ludCByYXdfcGNpX3dyaXRlKHVuc2lnbmVkIGludCBkb21h
aW4sIHVuc2lnbmVkIGludCBidXMsCj4gKwkJdW5zaWduZWQgaW50IGRldmZuLCBpbnQgcmVnLCBp
bnQgbGVuLCB1MzIgdmFsKQo+ICt7Cj4gKwlzdHJ1Y3QgcGNpX2J1cyAqYiA9IHBjaV9maW5kX2J1
cyhkb21haW4sIGJ1cyk7Cj4gKwo+ICsJaWYgKCFiKQo+ICsJCXJldHVybiBQQ0lCSU9TX0RFVklD
RV9OT1RfRk9VTkQ7Cj4gKwlyZXR1cm4gYi0+b3BzLT53cml0ZShiLCBkZXZmbiwgcmVnLCBsZW4s
IHZhbCk7Cj4gK30KPiArCj4gKwo+ICtzdHJ1Y3QgYWNwaV9wY2lfZ2VuZXJpY19yb290X2luZm8g
ewo+ICsJc3RydWN0IGFjcGlfcGNpX3Jvb3RfaW5mbwljb21tb247Cj4gKwlzdHJ1Y3QgcGNpX2Nv
bmZpZ193aW5kb3cJKmNmZzsJLyogY29uZmlnIHNwYWNlIG1hcHBpbmcgKi8KPiArfTsKPiArCj4g
K2ludCBhY3BpX3BjaV9idXNfZmluZF9kb21haW5fbnIoc3RydWN0IHBjaV9idXMgKmJ1cykKPiAr
ewo+ICsJc3RydWN0IHBjaV9jb25maWdfd2luZG93ICpjZmcgPSBidXMtPnN5c2RhdGE7Cj4gKwlz
dHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYgPSB0b19hY3BpX2RldmljZShjZmctPnBhcmVudCk7Cj4g
KwlzdHJ1Y3QgYWNwaV9wY2lfcm9vdCAqcm9vdCA9IGFjcGlfZHJpdmVyX2RhdGEoYWRldik7Cj4g
Kwo+ICsJcmV0dXJuIHJvb3QtPnNlZ21lbnQ7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgcGNpX2Fj
cGlfcm9vdF9wcmVwYXJlX3Jlc291cmNlcyhzdHJ1Y3QgYWNwaV9wY2lfcm9vdF9pbmZvICpjaSkK
PiArewo+ICsJc3RydWN0IHJlc291cmNlX2VudHJ5ICplbnRyeSwgKnRtcDsKPiArCWludCBzdGF0
dXM7Cj4gKwo+ICsJc3RhdHVzID0gYWNwaV9wY2lfcHJvYmVfcm9vdF9yZXNvdXJjZXMoY2kpOwo+
ICsJcmVzb3VyY2VfbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGVudHJ5LCB0bXAsICZjaS0+cmVz
b3VyY2VzKSB7Cj4gKwkJaWYgKCEoZW50cnktPnJlcy0+ZmxhZ3MgJiBJT1JFU09VUkNFX1dJTkRP
VykpCj4gKwkJCXJlc291cmNlX2xpc3RfZGVzdHJveV9lbnRyeShlbnRyeSk7Cj4gKwl9Cj4gKwly
ZXR1cm4gc3RhdHVzOwo+ICt9Cj4gKwo+ICsvKgo+ICsgKiBMb29rdXAgdGhlIGJ1cyByYW5nZSBm
b3IgdGhlIGRvbWFpbiBpbiBNQ0ZHLCBhbmQgc2V0IHVwIGNvbmZpZyBzcGFjZQo+ICsgKiBtYXBw
aW5nLgo+ICsgKi8KPiArc3RhdGljIHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyAqCj4gK3BjaV9h
Y3BpX3NldHVwX2VjYW1fbWFwcGluZyhzdHJ1Y3QgYWNwaV9wY2lfcm9vdCAqcm9vdCkKPiArewo+
ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnJvb3QtPmRldmljZS0+ZGV2Owo+ICsJc3RydWN0IHJl
c291cmNlICpidXNfcmVzID0gJnJvb3QtPnNlY29uZGFyeTsKPiArCXUxNiBzZWcgPSByb290LT5z
ZWdtZW50Owo+ICsJY29uc3Qgc3RydWN0IHBjaV9lY2FtX29wcyAqZWNhbV9vcHM7Cj4gKwlzdHJ1
Y3QgcmVzb3VyY2UgY2ZncmVzOwo+ICsJc3RydWN0IGFjcGlfZGV2aWNlICphZGV2Owo+ICsJc3Ry
dWN0IHBjaV9jb25maWdfd2luZG93ICpjZmc7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCXJldCA9IHBj
aV9tY2ZnX2xvb2t1cChyb290LCAmY2ZncmVzLCAmZWNhbV9vcHMpOwo+ICsJaWYgKHJldCkgewo+
ICsJCWRldl9lcnIoZGV2LCAiJTA0eDolcFIgRUNBTSByZWdpb24gbm90IGZvdW5kXG4iLCBzZWcs
IGJ1c19yZXMpOwo+ICsJCXJldHVybiBOVUxMOwo+ICsJfQo+ICsKPiArCWFkZXYgPSBhY3BpX3Jl
c291cmNlX2NvbnN1bWVyKCZjZmdyZXMpOwo+ICsJaWYgKGFkZXYpCj4gKwkJZGV2X2luZm8oZGV2
LCAiRUNBTSBhcmVhICVwUiByZXNlcnZlZCBieSAlc1xuIiwgJmNmZ3JlcywKPiArCQkJIGRldl9u
YW1lKCZhZGV2LT5kZXYpKTsKPiArCWVsc2UKPiArCQlkZXZfd2FybihkZXYsIEZXX0JVRyAiRUNB
TSBhcmVhICVwUiBub3QgcmVzZXJ2ZWQgaW4gQUNQSSBuYW1lc3BhY2VcbiIsCj4gKwkJCSAmY2Zn
cmVzKTsKPiArCj4gKwljZmcgPSBwY2lfZWNhbV9jcmVhdGUoZGV2LCAmY2ZncmVzLCBidXNfcmVz
LCBlY2FtX29wcyk7Cj4gKwlpZiAoSVNfRVJSKGNmZykpIHsKPiArCQlkZXZfZXJyKGRldiwgIiUw
NHg6JXBSIGVycm9yICVsZCBtYXBwaW5nIEVDQU1cbiIsIHNlZywgYnVzX3JlcywKPiArCQkJUFRS
X0VSUihjZmcpKTsKPiArCQlyZXR1cm4gTlVMTDsKPiArCX0KPiArCj4gKwlyZXR1cm4gY2ZnOwo+
ICt9Cj4gKwo+ICsvKiByZWxlYXNlX2luZm86IGZyZWUgcmVzb3VyY2VzIGFsbG9jYXRlZCBieSBp
bml0X2luZm8gKi8KPiArc3RhdGljIHZvaWQgcGNpX2FjcGlfZ2VuZXJpY19yZWxlYXNlX2luZm8o
c3RydWN0IGFjcGlfcGNpX3Jvb3RfaW5mbyAqY2kpCj4gK3sKPiArCXN0cnVjdCBhY3BpX3BjaV9n
ZW5lcmljX3Jvb3RfaW5mbyAqcmk7Cj4gKwo+ICsJcmkgPSBjb250YWluZXJfb2YoY2ksIHN0cnVj
dCBhY3BpX3BjaV9nZW5lcmljX3Jvb3RfaW5mbywgY29tbW9uKTsKPiArCXBjaV9lY2FtX2ZyZWUo
cmktPmNmZyk7Cj4gKwlrZnJlZShjaS0+b3BzKTsKPiArCWtmcmVlKHJpKTsKPiArfQo+ICsKPiAr
Cj4gKy8qIEludGVyZmFjZSBjYWxsZWQgZnJvbSBBQ1BJIGNvZGUgdG8gc2V0dXAgUENJIGhvc3Qg
Y29udHJvbGxlciAqLwo+ICtzdHJ1Y3QgcGNpX2J1cyAqcGNpX2FjcGlfc2Nhbl9yb290KHN0cnVj
dCBhY3BpX3BjaV9yb290ICpyb290KQo+ICt7Cj4gKwlzdHJ1Y3QgYWNwaV9wY2lfZ2VuZXJpY19y
b290X2luZm8gKnJpOwo+ICsJc3RydWN0IHBjaV9idXMgKmJ1cywgKmNoaWxkOwo+ICsJc3RydWN0
IGFjcGlfcGNpX3Jvb3Rfb3BzICpyb290X29wczsKPiArCXN0cnVjdCBwY2lfaG9zdF9icmlkZ2Ug
Kmhvc3Q7Cj4gKwo+ICsJcmkgPSBremFsbG9jKHNpemVvZigqcmkpLCBHRlBfS0VSTkVMKTsKPiAr
CWlmICghcmkpCj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwo+ICsJcm9vdF9vcHMgPSBremFsbG9jKHNp
emVvZigqcm9vdF9vcHMpLCBHRlBfS0VSTkVMKTsKPiArCWlmICghcm9vdF9vcHMpIHsKPiArCQlr
ZnJlZShyaSk7Cj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwl9Cj4gKwo+ICsJcmktPmNmZyA9IHBjaV9h
Y3BpX3NldHVwX2VjYW1fbWFwcGluZyhyb290KTsKPiArCWlmICghcmktPmNmZykgewo+ICsJCWtm
cmVlKHJpKTsKPiArCQlrZnJlZShyb290X29wcyk7Cj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwl9Cj4g
Kwo+ICsJcm9vdF9vcHMtPnJlbGVhc2VfaW5mbyA9IHBjaV9hY3BpX2dlbmVyaWNfcmVsZWFzZV9p
bmZvOwo+ICsJcm9vdF9vcHMtPnByZXBhcmVfcmVzb3VyY2VzID0gcGNpX2FjcGlfcm9vdF9wcmVw
YXJlX3Jlc291cmNlczsKPiArCXJvb3Rfb3BzLT5wY2lfb3BzID0gKHN0cnVjdCBwY2lfb3BzICop
JnJpLT5jZmctPm9wcy0+cGNpX29wczsKPiArCWJ1cyA9IGFjcGlfcGNpX3Jvb3RfY3JlYXRlKHJv
b3QsIHJvb3Rfb3BzLCAmcmktPmNvbW1vbiwgcmktPmNmZyk7Cj4gKwlpZiAoIWJ1cykKPiArCQly
ZXR1cm4gTlVMTDsKPiArCj4gKwkvKiBJZiB3ZSBtdXN0IHByZXNlcnZlIHRoZSByZXNvdXJjZSBj
b25maWd1cmF0aW9uLCBjbGFpbSBub3cgKi8KPiArCWhvc3QgPSBwY2lfZmluZF9ob3N0X2JyaWRn
ZShidXMpOwo+ICsJaWYgKGhvc3QtPnByZXNlcnZlX2NvbmZpZykKPiArCQlwY2lfYnVzX2NsYWlt
X3Jlc291cmNlcyhidXMpOwo+ICsKPiArCS8qCj4gKwkgKiBBc3NpZ24gd2hhdGV2ZXIgd2FzIGxl
ZnQgdW5hc3NpZ25lZC4gSWYgd2UgZGlkbid0IGNsYWltIGFib3ZlLAo+ICsJICogdGhpcyB3aWxs
IHJlYXNzaWduIGV2ZXJ5dGhpbmcuCj4gKwkgKi8KPiArCXBjaV9hc3NpZ25fdW5hc3NpZ25lZF9y
b290X2J1c19yZXNvdXJjZXMoYnVzKTsKPiArCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGNoaWxk
LCAmYnVzLT5jaGlsZHJlbiwgbm9kZSkKPiArCQlwY2llX2J1c19jb25maWd1cmVfc2V0dGluZ3Mo
Y2hpbGQpOwo+ICsKPiArCXJldHVybiBidXM7Cj4gK30KPiArCj4gKyNlbmRpZgo+IC0tIAo+IDIu
MzguMAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
