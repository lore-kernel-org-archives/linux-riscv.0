Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9806CC5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 05:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0L9IbOGpVPIxjMknmg52S3SKA8zPU860lL811JFKBQ=; b=rDIrJ7+MRNovLA
	cscGz2Op+gzUgrwrw6wxZT5sBm+v8BnNvDqCGM1k6uUWjH1Oqpt6GWmR+8EznBgpDghr0iIhKJLht
	kpknsAt/JRXbbc+v7nFjcELEKfhXEACszfSFEaUIQUzJa+4PfQDfATtOMIdB1Cs0bHw8g3sZbzlSF
	LK/jFbSKPWg/kiOKJsHb9SrMv21JrCobNqtJMO3j3VRgKRA3iLw5uGZ9W7YZxf1cEndno8ljz8dbR
	Y6OTCPhwEdx/3dlQUopMKTGgBWN/NUuKC9IHQbdrmwPubrW5WnTapg9nnuQurZleuLTrk2UD1TsZC
	eiyw5kYsCsjU9DlTi98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvpUd-00000005QEb-36e1;
	Mon, 17 Aug 2026 05:02:39 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvpUZ-00000005QE6-208m
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 05:02:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1819855f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 16 Aug 2026 22:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786942953; cv=none;
        d=google.com; s=arc-20260327;
        b=lN8eGOcxenF8lpbZEoyLNq4PUIzpmLKYKfm0Ywji1j3a2D6k5JPVrZDYyd0p5lk+EU
         xzxJsMdZmSgN2PKy0V3mfX7b4YboftlsuDU7M2NiqN9lfFauM69nj+acxIMqhhCymB2n
         IJ7ctx3UN+cIIwB/qBEmR07BhJm5tF/gOSyq1cHLigEW2OqmcqtfjDqXIScvTIrSamqW
         YE9GXO+VX8/QwTP5ZMyMUBcfpWGWumjnbg9GfR1fYeL1Kc8dsxV3tOFqDBWSlkfg6E2t
         0iyvhML5HhHcgDZX6i2rPf/X+XY0jcVk4GoVrDQoPPgUGY1b1bihQIhTYH091eE+sa3/
         eMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qoYi18RDSR4LawRHK5O3loQLaPLqT9tLcA3hUir4WQY=;
        fh=iTABoZzn5LIeb/mEOgvhXaFDe06gKkRYEf3hloBeYDc=;
        b=I2j/Qy1fJIixKDX0Ske95YNc0r2LiUcGqL6W4UbpmKxKngf1CTxn3S9jyLL+Tx4Qg7
         s3Bw3vLJ119lEf3hNVeDsRNf/FUzZDXKdNSXOBVTt1ChbIdgo6Lp7mNVV84NY/m5ng8Q
         eQ+W53ic3ZT1dx7JX8M4cyokIQfHv+5obANwGL7mTThynO9Svlei9WCulrSGAQYi0MUK
         UFHlg2MfXA/qn9joeJ5z6RmjoF+nOKHgv13zDhHFndyEFjHJKZkF5Tj9zHk0doEwR+Zq
         R1rZLakCgBoffUnmbfpGk2RlJUeS45iiz2+c03hweIs2Lt9TyvMedMuz0jkSwGJWAI+3
         RpOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786942953; x=1787547753; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qoYi18RDSR4LawRHK5O3loQLaPLqT9tLcA3hUir4WQY=;
        b=LqmWFC6RDXUL8y+vE3GVaqlIEu6R05hbe3WJpR6hEk8BgdGkQU+NdO2+qE+VYDJ19L
         YN0qFKvyS19xMW74p+kpEYBABA8N1J7p8sUP9aiC18EwDrVrSjVlrh0LkMMdcxxAUinR
         qK7O2Na8Re4XeIWjlE4b67kQ6c/l+KE3gD0NCUBDfiVEDAWo52Y0IJM8KW98DarApOGl
         EI6cGOXVshEqxyDD4h+DAuRGS8ejvucj8vJ3Vgh6U3Nf239nFRD1eU6xb6YbPUOeo3Jb
         6ZTo+0hZKcEeU03jBOWKiCtMnU5dKmskLcF05rcVavvw8sMnu7/coj/5wibkGSvQl+0m
         VICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942953; x=1787547753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoYi18RDSR4LawRHK5O3loQLaPLqT9tLcA3hUir4WQY=;
        b=BgnH2g+LkPByZXgsn++4U5uskg5Ml+okF6waWeL8m6iqHBY/HHicVc4p4hmmeCBAe6
         pukafoXUilznBqBKXfSvHcbNhxmEVwoewM6GV1vhsrDSVLVALRjSMDXsSbSCVJEvfnc6
         ROCmDuF46+hka+7MrJRO3BnW8NoR1Pawye1zge4d2imPU2k1eSR6KLc3N6ZRuiaptbnZ
         vdX1SDiGyFxfBQSW7abPzJOvIUNUb3lm3tzr6LM0w/IjAL5g1ellq9Q5VZpni1EDkEHO
         C1DPj51dT0HwBrkMPKyNfMO0MAJjrUYYzbAgJcaCr3R5LLKHfCxXhjrrzogioOPDNKbI
         bOfQ==
X-Gm-Message-State: AOJu0YxKs392piGscEoW6WfdVTIC45X0puDD41XuVJ0sw3o8VjH5wBhl
	UUntYdjN9p4XeT46NpkpZGT2D1/L4Py/aC2q11pilkcqBYKlzwL1/PpmZ0lSNL/XceqNv9wtJTu
	gW4qEfatjWw4U8qXhxeu8v3HHeQHj2WPZ8t7LwmerJA==
X-Gm-Gg: AR+sD12yI5MtVqssedAVDvgeypct1cftMP735rUyjoGSR14ExjlDfjBlZ1GRepJRLLy
	lzwYW//j+o3OfugknwBnBeFZ0I9BnRmRFwGnZAIqZK/NXegNtG3xHtKaLuGJET81jK8RIl0sYXo
	HV45uyvSWvjsln6kBUsgah2adR+0J5BlAsZABc9ueuVTcdeDfY/VgPeewNt0RQQA/g/0id/FcQw
	eYj33QNUDWeZM/SmEkkZk2KTpSUpgwx0CvVgzeXLLTC5xI9n5UqmtF7tXLkxSa3R5CxWKiBYdoJ
	JcYTumPBevtyyyS2tMAOId43o/yrqeRsEiRjAsK0o9UWgaI7NmqOn0T7dgRsBOJkoel0shBbEiT
	v/C76YTICiihTTgq7hwBNJc8nPG+EkbBmfD8nlchC7Azy7k4TQHgZP34YlDu0uKk=
X-Received: by 2002:a05:6000:2588:b0:47f:97f6:d39a with SMTP id
 ffacd0b85a97d-48160799ccemr36697191f8f.17.1786942952631; Sun, 16 Aug 2026
 22:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com> <20260513084325.2176952-9-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260513084325.2176952-9-himanshu.chauhan@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Aug 2026 10:32:21 +0530
X-Gm-Features: AcwNN1WIHMlsMJLB7hUwYKC927a3ggaJ6kZFcGlSqz813vIhEHmZTD8KTFxo-cU
Message-ID: <CAAhSdy2LkwC_FBFWP3M66X-mY8WwpSHiOCOKf=e4Fri=gkt27Q@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] riscv: Introduce HEST SSE notification handlers
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	lenb@kernel.org, james.morse@arm.com, tony.luck@intel.com, ardb@kernel.org, 
	conor@kernel.org, cleger@rivosinc.com, robert.moore@intel.com, 
	sunilvl@oss.qualcomm.com, anup.patel@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_220235_591954_62FAC2EC 
X-CRM114-Status: GOOD (  24.77  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMjoxOOKAr1BNIEhpbWFuc2h1IENoYXVoYW4KPGhpbWFu
c2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBBZGQgY29uZmlnIG9wdGlv
biB0byBlbmFibGUgU1NFIGluIEFQRUkuIFdoZW4gaXQgaXMgZW5hYmxlZCwgZnVuY3Rpb25zCj4g
dG8gcmVnaXN0ZXIvdW5yZWdpc3RlciBhIGdoZXMgZW50cnkgd2l0aCBTU0UgYXJlIGF2aWxhYmxl
IGFsb25nIHdpdGgKPiBsb3cgYW5kIGhpZ2ggcHJpb3JpdHkgZXZlbnQgaGFuZGVycy4gSWYgYSBT
U0Ugbm90aWZpY2F0aW9uIHR5cGUgaXMKPiBkZXRlcm1pbmVkLCBhIGdoZXMgY29tbW9uIGhhbmRs
ZXIgdG8gaGFuZGxlIGFuIGVycm9yIGV2ZW50IGlzIHJlZ2lzdGVyZWQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBIaW1hbnNodSBDaGF1aGFuIDxoaW1hbnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvYWNwaS9hcGVpL0tjb25maWcgfCAgNSArKwo+ICBkcml2ZXJzL2Fj
cGkvYXBlaS9naGVzLmMgIHwgOTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL2FwZWkvS2NvbmZpZyBiL2RyaXZlcnMvYWNw
aS9hcGVpL0tjb25maWcKPiBpbmRleCA0Mjg0NThjNjIzZjAuLjg5NWE4NDNkMGUzNiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2FjcGkvYXBlaS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9hY3BpL2Fw
ZWkvS2NvbmZpZwo+IEBAIC00Niw2ICs0NiwxMSBAQCBjb25maWcgQUNQSV9BUEVJX1NFQQo+ICAg
ICAgICAgZGVwZW5kcyBvbiBBUk02NCAmJiBBQ1BJX0FQRUlfR0hFUwo+ICAgICAgICAgZGVmYXVs
dCB5Cj4KPiArY29uZmlnIEFDUElfQVBFSV9TU0UKPiArICAgICAgIGJvb2wKPiArICAgICAgIGRl
cGVuZHMgb24gUklTQ1YgJiYgUklTQ1ZfU0JJX1NTRSAmJiBBQ1BJX0FQRUlfR0hFUwo+ICsgICAg
ICAgZGVmYXVsdCB5Cj4gKwo+ICBjb25maWcgQUNQSV9BUEVJX01FTU9SWV9GQUlMVVJFCj4gICAg
ICAgICBib29sICJBUEVJIG1lbW9yeSBlcnJvciByZWNvdmVyaW5nIHN1cHBvcnQiCj4gICAgICAg
ICBkZXBlbmRzIG9uIEFDUElfQVBFSSAmJiBNRU1PUllfRkFJTFVSRQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2FjcGkvYXBlaS9naGVzLmMgYi9kcml2ZXJzL2FjcGkvYXBlaS9naGVzLmMKPiBpbmRl
eCA4ZWRjMmM4ZGIxYmIuLjFiYWE4ZGRkMTBlYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkv
YXBlaS9naGVzLmMKPiArKysgYi9kcml2ZXJzL2FjcGkvYXBlaS9naGVzLmMKPiBAQCAtMTcsNiAr
MTcsOCBAQAo+ICAgKiAgIEF1dGhvcjogSHVhbmcgWWluZyA8eWluZy5odWFuZ0BpbnRlbC5jb20+
Cj4gICAqLwo+Cj4gKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3Jp
c2N2X3NiaV9zc2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2FybV9zZGVpLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZXBhcmFtLmg+Cj4gQEAg
LTEwMCw2ICsxMDIsMTEgQEAKPiAgI2RlZmluZSBGSVhfQVBFSV9HSEVTX1NERUlfQ1JJVElDQUwg
ICAgX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzCj4gICNlbmRpZgo+Cj4gKyNpZm5kZWYgQ09ORklH
X1JJU0NWX1NCSV9TU0UKPiArI2RlZmluZSBGSVhfQVBFSV9HSEVTX1NTRV9MT1dfUFJJT1JJVFkg
X19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzCj4gKyNkZWZpbmUgRklYX0FQRUlfR0hFU19TU0VfSElH
SF9QUklPUklUWSAgICAgICAgX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzCj4gKyNlbmRpZgo+ICsK
PiAgc3RhdGljIEFUT01JQ19OT1RJRklFUl9IRUFEKGdoZXNfcmVwb3J0X2NoYWluKTsKPgo+ICBz
dGF0aWMgaW5saW5lIGJvb2wgaXNfaGVzdF90eXBlX2dlbmVyaWNfdjIoc3RydWN0IGdoZXMgKmdo
ZXMpCj4gQEAgLTE2NjIsNiArMTY2OSw2MyBAQCBzdGF0aWMgaW50IGFwZWlfc2RlaV91bnJlZ2lz
dGVyX2doZXMoc3RydWN0IGdoZXMgKmdoZXMpCj4gICAgICAgICByZXR1cm4gc2RlaV91bnJlZ2lz
dGVyX2doZXMoZ2hlcyk7Cj4gIH0KPgo+ICsjaWYgZGVmaW5lZChDT05GSUdfQUNQSV9BUEVJX1NT
RSkKPiArLyogU1NFIEhhbmRsZXJzICovCj4gK3N0YXRpYyBpbnQgX19naGVzX3NzZV9jYWxsYmFj
ayhzdHJ1Y3QgZ2hlcyAqZ2hlcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51
bSBmaXhlZF9hZGRyZXNzZXMgZml4bWFwX2lkeCkKPiArewo+ICsgICAgICAgaWYgKCFnaGVzX2lu
X25taV9xdWV1ZV9vbmVfZW50cnkoZ2hlcywgZml4bWFwX2lkeCkpIHsKPiArICAgICAgICAgICAg
ICAgaXJxX3dvcmtfcXVldWUoJmdoZXNfcHJvY19pcnFfd29yayk7Cj4gKwo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gMDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gLUVOT0VOVDsK
PiArfQo+ICsKPiArLyogTG93IHByaW9yaXR5ICovCj4gK3N0YXRpYyBpbnQgZ2hlc19zc2VfbG9f
Y2FsbGJhY2sodTMyIGV2ZW50X251bSwgdm9pZCAqYXJnLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiArewo+ICsgICAgICAgc3RhdGljIERFRklORV9SQVdfU1BJTkxPQ0soZ2hlc19ub3RpZnlfbG9j
a19zc2VfbG8pOwo+ICsgICAgICAgc3RydWN0IGdoZXMgKmdoZXMgPSBhcmc7Cj4gKyAgICAgICBp
bnQgZXJyOwo+ICsKPiArICAgICAgIHJhd19zcGluX2xvY2soJmdoZXNfbm90aWZ5X2xvY2tfc3Nl
X2xvKTsKPiArICAgICAgIGVyciA9IF9fZ2hlc19zc2VfY2FsbGJhY2soZ2hlcywgRklYX0FQRUlf
R0hFU19TU0VfTE9XX1BSSU9SSVRZKTsKPiArICAgICAgIHJhd19zcGluX3VubG9jaygmZ2hlc19u
b3RpZnlfbG9ja19zc2VfbG8pOwo+ICsKPiArICAgICAgIHJldHVybiBlcnI7Cj4gK30KPiArCj4g
Ky8qIEhpZ2ggcHJpb3JpdHkgKi8KPiArc3RhdGljIGludCBnaGVzX3NzZV9oaV9jYWxsYmFjayh1
MzIgZXZlbnRfbnVtLCB2b2lkICphcmcsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICt7Cj4gKyAg
ICAgICBzdGF0aWMgREVGSU5FX1JBV19TUElOTE9DSyhnaGVzX25vdGlmeV9sb2NrX3NzZV9oaSk7
Cj4gKyAgICAgICBzdHJ1Y3QgZ2hlcyAqZ2hlcyA9IGFyZzsKPiArICAgICAgIGludCBlcnI7Cj4g
Kwo+ICsgICAgICAgcmF3X3NwaW5fbG9jaygmZ2hlc19ub3RpZnlfbG9ja19zc2VfaGkpOwo+ICsg
ICAgICAgZXJyID0gX19naGVzX3NzZV9jYWxsYmFjayhnaGVzLCBGSVhfQVBFSV9HSEVTX1NTRV9I
SUdIX1BSSU9SSVRZKTsKPiArICAgICAgIHJhd19zcGluX3VubG9jaygmZ2hlc19ub3RpZnlfbG9j
a19zc2VfaGkpOwo+ICsKPiArICAgICAgIHJldHVybiBlcnI7Cj4gK30KPiArCj4gK3N0YXRpYyBp
bnQgYXBlaV9zc2VfcmVnaXN0ZXJfZ2hlcyhzdHJ1Y3QgZ2hlcyAqZ2hlcykKPiArewo+ICsgICAg
ICAgcmV0dXJuIHNzZV9yZWdpc3Rlcl9naGVzKGdoZXMsIGdoZXNfc3NlX2xvX2NhbGxiYWNrLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdoZXNfc3NlX2hpX2NhbGxiYWNrKTsK
PiArfQo+ICsKPiArc3RhdGljIGludCBhcGVpX3NzZV91bnJlZ2lzdGVyX2doZXMoc3RydWN0IGdo
ZXMgKmdoZXMpCj4gK3sKPiArICAgICAgIHJldHVybiBzc2VfdW5yZWdpc3Rlcl9naGVzKGdoZXMp
Owo+ICt9Cj4gKyNlbHNlIC8qIENPTkZJR19BQ1BJX0FQRUlfU1NFICovCj4gK3N0YXRpYyBpbnQg
YXBlaV9zc2VfcmVnaXN0ZXJfZ2hlcyhzdHJ1Y3QgZ2hlcyAqZ2hlcykgeyByZXR1cm4gLUVPUE5P
VFNVUFA7IH0KPiArc3RhdGljIGludCBhcGVpX3NzZV91bnJlZ2lzdGVyX2doZXMoc3RydWN0IGdo
ZXMgKmdoZXMpIHsgcmV0dXJuIC1FT1BOT1RTVVBQOyB9Cj4gKyNlbmRpZgo+ICsKPiAgc3RhdGlj
IGludCBnaGVzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmdoZXNfZGV2KQo+ICB7Cj4g
ICAgICAgICBzdHJ1Y3QgYWNwaV9oZXN0X2dlbmVyaWMgKmdlbmVyaWM7Cj4gQEAgLTE3MDgsNiAr
MTc3MiwxNCBAQCBzdGF0aWMgaW50IGdoZXNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
Z2hlc19kZXYpCj4gICAgICAgICAgICAgICAgIHByX3dhcm4oR0hFU19QRlggIkdlbmVyaWMgaGFy
ZHdhcmUgZXJyb3Igc291cmNlOiAlZCBub3RpZmllZCB2aWEgbG9jYWwgaW50ZXJydXB0IGlzIG5v
dCBzdXBwb3J0ZWQhXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdlbmVyaWMtPmhlYWRl
ci5zb3VyY2VfaWQpOwo+ICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiArICAgICAgIGNhc2Ug
QUNQSV9IRVNUX05PVElGWV9TU0U6Cj4gKyAgICAgICAgICAgICAgIGlmICghSVNfRU5BQkxFRChD
T05GSUdfQUNQSV9BUEVJX1NTRSkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJu
KEdIRVNfUEZYICJHZW5lcmljIGhhcmR3YXJlIGVycm9yIHNvdXJjZTogJWQgbm90aWZpZWQgdmlh
IFNTRSBpcyBub3Qgc3VwcG9ydGVkXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ2VuZXJpYy0+aGVhZGVyLnNvdXJjZV9pZCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmMgPSAtRU9QTk9UU1VQUDsKPiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiAr
ICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGRlZmF1
bHQ6Cj4gICAgICAgICAgICAgICAgIHByX3dhcm4oRldfV0FSTiBHSEVTX1BGWCAiVW5rbm93biBu
b3RpZmljYXRpb24gdHlwZTogJXUgZm9yIGdlbmVyaWMgaGFyZHdhcmUgZXJyb3Igc291cmNlOiAl
ZFxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICBnZW5lcmljLT5ub3RpZnkudHlwZSwgZ2Vu
ZXJpYy0+aGVhZGVyLnNvdXJjZV9pZCk7Cj4gQEAgLTE3NzUsNiArMTg0NywxNyBAQCBzdGF0aWMg
aW50IGdoZXNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZ2hlc19kZXYpCj4gICAgICAg
ICAgICAgICAgIGlmIChyYykKPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gKwo+ICsgICAgICAgY2FzZSBBQ1BJX0hFU1RfTk9USUZZ
X1NTRToKPiArICAgICAgICAgICAgICAgcmMgPSBhcGVpX3NzZV9yZWdpc3Rlcl9naGVzKGdoZXMp
Owo+ICsgICAgICAgICAgICAgICBpZiAocmMpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBw
cl9lcnIoR0hFU19QRlggIkZhaWxlZCB0byByZWdpc3RlciBmb3IgU1NFIG5vdGlmaWNhdGlvbiBv
biB2ZWN0b3IgJWRcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdlbmVyaWMt
Pm5vdGlmeS52ZWN0b3IpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ICsg
ICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIHByX2VycihHSEVTX1BGWCAiUmVnaXN0
ZXJlZCBTU0Ugbm90aWZpY2F0aW9uIG9uIHZlY3RvciAlZFxuIiwKPiArICAgICAgICAgICAgICAg
ICAgICAgIGdlbmVyaWMtPm5vdGlmeS52ZWN0b3IpOwoKVGhpcyBuZWVkcyB0byBiZSBwcl9pbmZv
KCkgaW5zdGVhZCBvZiBwcl9lcnIoKS4KCj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAg
ICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgQlVHKCk7Cj4gICAgICAgICB9Cj4gQEAgLTE4
MDQsNyArMTg4Nyw2IEBAIHN0YXRpYyBpbnQgZ2hlc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpnaGVzX2RldikKPgo+ICBzdGF0aWMgdm9pZCBnaGVzX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpnaGVzX2RldikKPiAgewo+IC0gICAgICAgaW50IHJjOwo+ICAgICAgICAgc3Ry
dWN0IGdoZXMgKmdoZXM7Cj4gICAgICAgICBzdHJ1Y3QgYWNwaV9oZXN0X2dlbmVyaWMgKmdlbmVy
aWM7Cj4KPiBAQCAtMTgzOCwxNiArMTkyMCwxMSBAQCBzdGF0aWMgdm9pZCBnaGVzX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpnaGVzX2RldikKPiAgICAgICAgICAgICAgICAgZ2hlc19u
bWlfcmVtb3ZlKGdoZXMpOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2Ug
QUNQSV9IRVNUX05PVElGWV9TT0ZUV0FSRV9ERUxFR0FURUQ6Cj4gLSAgICAgICAgICAgICAgIHJj
ID0gYXBlaV9zZGVpX3VucmVnaXN0ZXJfZ2hlcyhnaGVzKTsKPiAtICAgICAgICAgICAgICAgaWYg
KHJjKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgLyoKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgKiBSZXR1cm5pbmcgZWFybHkgcmVzdWx0cyBpbiBhIHJlc291cmNlIGxlYWssIGJ1dCB3
ZSdyZQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAqIG9ubHkgaGVyZSBpZiBzdG9wcGluZyB0
aGUgaGFyZHdhcmUgZmFpbGVkLgo+IC0gICAgICAgICAgICAgICAgICAgICAgICAqLwo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGRldl9lcnIoJmdoZXNfZGV2LT5kZXYsICJGYWlsZWQgdG8gdW5y
ZWdpc3RlciBnaGVzICglcGUpXG4iLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RVJSX1BUUihyYykpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiAtICAgICAg
ICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBhcGVpX3NkZWlfdW5yZWdpc3Rlcl9naGVzKGdo
ZXMpOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArCj4gKyAgICAgICBjYXNlIEFDUElfSEVT
VF9OT1RJRllfU1NFOgo+ICsgICAgICAgICAgICAgICBhcGVpX3NzZV91bnJlZ2lzdGVyX2doZXMo
Z2hlcyk7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAg
ICAgICAgICAgICAgQlVHKCk7Cj4gLS0KPiAyLjQzLjAKPgo+CgpSZWdhcmRzLApBbnVwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
