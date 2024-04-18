Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DA8C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxlf7etMqJwIOAvihD3HvKEnsksHnrdfEIkPpTOhGGo=; b=pCecZ3GaBonmj3
	TBT0HmKnMDaatXDy3HbNQT+HHxWCQ/TlYWjrt2Jvf/r4dYKH11EESHvoDHdWKWh6uMAeac2/haiJl
	vbZBiQGkG5lPRhiNNaOKXw9QFo/3DEak80SQBbp7RCh9vBOa/0m0311e5E+1RNZBE2Y5wYvb289Ls
	53w689EXZPWhB2cR5+UwH/mG0hB0Q5NxQbFiT2l09W3kgW7yGe168nA/RkHPzVL5tTtqPMntODndo
	uH872y10EngRAifk2OJ6xoy+5ji91/y3Ld+V93mZ8uXkN+sTgD2dwzBhn1mKIbpNK+v7vMDGSQZCw
	Qq5ffqJsiAPwV8zZ7gMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRgx-00000002Lw6-3iz7;
	Thu, 18 Apr 2024 13:20:43 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRgr-00000002Ls8-2gkV
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 13:20:43 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7d63a883dd4so32388939f.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713446433; x=1714051233; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gx9GnWevREtFfaeT4x816rwBBhgS4sWYP/+TT0BrELo=;
        b=EZXDK5JNmflLB8f1K6vcdTzQkOSdM3azOA74empeGv/lfkg7B1E8RS/4RInTyfECk0
         9x52OAf4Freyp8tUFkEhMsEez/jccyw3d1kyMithwGRNTDMnFVCvcBFIYkP3mg5pmSE6
         cK5rTMoArQcql7y719ebmWb+BVJV+0n0YD7q+iJHMpEzZ1IOtUEJMIrzfP5aLIh87wda
         ssCC2cqcHy9iuPp3YK0ThlS3J6SjdMVvvs4Xl/CQAxky3njn92+jNNReoxclbQwMn4Xs
         uF8+Xt+c9a6zQY2Q61eMJfJqrWeywTHEJ1VIYI0fpS400iYR0x+1nwOmZj9V+0+Iyb74
         vVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446433; x=1714051233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gx9GnWevREtFfaeT4x816rwBBhgS4sWYP/+TT0BrELo=;
        b=tJHQfeOKCRg2CYqHAog5zzpMDqTOFFMRnQxC1yvBDoo845Tw/Bu0w7Pc9V1e/uEv90
         UAs6NallBowX4XaXPzNoBUi5gHwMgICQgLFtaoZFLQULGkHzt3+Meg0yQxcIzFMPBVxb
         X4QPxCqZtrCfQXRFSOg09CkKfA1ZpfZ9Xhgbk3OHnxEiphgd1TlgoLf1vKGS80+DSSnT
         lbQX+jaHEKJuKrIG9D5Fy6gAnm02+2Q5PQJZWNjlcgYCgky6XUu7b49jSpX2iNWwJIUT
         IXUruO1755w2C0YoQH/MmPVhXf3oU/CZJJHp6H+v52eRtNG11BkIqKu3MvBNxcOhXwOT
         xYvg==
X-Forwarded-Encrypted: i=1; AJvYcCXBysPIvDqXIpbM7zh6wcJ9/4DWKLAVxw4QGtiALlOGkvIsk1J5hRMLFmpxDTYrl33D49RDmdNMGqb66yH3EzbEUGKNgik6Ca72yq+CnQZn
X-Gm-Message-State: AOJu0YwOttzmRuIYnUWl+StsizB4tnxUjT+DtjzByZXw3OxG7fOsDLHe
	JUXiDoe8M3rw/Ed/WYH263GwM6f9boy1sukGFbZyIBnqVf2+s2OpCXCP7I4EWuVXiVfraCUtRDv
	OjfEdYHKMt6S8f1cAG8j8kpUfVsEzd3SVUL2bUA==
X-Google-Smtp-Source: AGHT+IGMAebq+hy93GujthN3vp/oiNgylMXL32FxuMysUl+JA4YBKBsEzN18erjOu1anh/0QSxfZh2bW0X+CZoU6xFA=
X-Received: by 2002:a05:6e02:1d85:b0:36a:28a8:ca5 with SMTP id
 h5-20020a056e021d8500b0036a28a80ca5mr3399351ila.7.1713446433235; Thu, 18 Apr
 2024 06:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240418124300.1387978-1-cleger@rivosinc.com> <20240418124300.1387978-7-cleger@rivosinc.com>
In-Reply-To: <20240418124300.1387978-7-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2024 18:50:21 +0530
Message-ID: <CAAhSdy33=s_J=0HJ1VfbxPVkBgyTZ1rpM3G15R8rJGbnNA_zeg@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb
 extensions for Guest/VM
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_062037_836325_C728D402 
X-CRM114-Status: GOOD (  13.35  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgNjoxNOKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHRlbmQgdGhlIEtWTSBJU0EgZXh0ZW5zaW9uIE9O
RV9SRUcgaW50ZXJmYWNlIHRvIGFsbG93IEtWTSB1c2VyIHNwYWNlCj4gdG8gZGV0ZWN0IGFuZCBl
bmFibGUgWmNhLCBaY2YsIFpjZCBhbmQgWmNiIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKTEdU
TS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpBY2tlZC1i
eTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0K
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgNCArKysrCj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDggKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXgg
MzVhMTJhYTE5NTNlLi41N2RiM2ZlYTY3OWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oCj4gQEAgLTE2OCw2ICsxNjgsMTAgQEAgZW51bSBLVk1fUklTQ1ZfSVNBX0VYVF9JRCB7Cj4g
ICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aVFNPLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9F
WFRfWkFDQVMsCj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aSU1PUCwKPiArICAgICAgIEtW
TV9SSVNDVl9JU0FfRVhUX1pDQSwKPiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDQiwKPiAr
ICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDRCwKPiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhU
X1pDRiwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX01BWCwKPiAgfTsKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9v
bmVyZWcuYwo+IGluZGV4IDEyNDM2ZjZmMGQyMC4uYTI3NDdhNmRiZGI2IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X29uZXJlZy5jCj4gQEAgLTQ4LDYgKzQ4LDEwIEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBsb25n
IGt2bV9pc2FfZXh0X2FycltdID0gewo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpCS0MpLAo+
ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpCS1gpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJS
KFpCUyksCj4gKyAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkNBKSwKPiArICAgICAgIEtWTV9JU0Ff
RVhUX0FSUihaQ0IpLAo+ICsgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpDRCksCj4gKyAgICAgICBL
Vk1fSVNBX0VYVF9BUlIoWkNGKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaRkEpLAo+ICAg
ICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpGSCksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkZI
TUlOKSwKPiBAQCAtMTI4LDYgKzEzMiwxMCBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9p
c2FfZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQo+ICAgICAgICAgY2FzZSBLVk1f
UklTQ1ZfSVNBX0VYVF9aQktDOgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQktY
Ogo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQlM6Cj4gKyAgICAgICBjYXNlIEtW
TV9SSVNDVl9JU0FfRVhUX1pDQToKPiArICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNC
Ogo+ICsgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Q6Cj4gKyAgICAgICBjYXNlIEtW
TV9SSVNDVl9JU0FfRVhUX1pDRjoKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZB
Ogo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkg6Cj4gICAgICAgICBjYXNlIEtW
TV9SSVNDVl9JU0FfRVhUX1pGSE1JTjoKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
