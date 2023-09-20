Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4873CE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 04:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+x4Gh7h06nUon5B8G0aKOhEfsIu1RgJig1gDXjDsFw=; b=jMlUET6I+LXYWa
	5VDAhErnrGM76DUU5S3piAtvGHWfoMTgUKleAZVIFTwBqnPJ4Fy2mgevZiR5ddVk1+DpDPHlFClwR
	c1SuW6BPsq5U69HNBLoVOufr+M3/fSe2jUoo4AFsm0ebrtGIH0qIlZ2n1MxOmbA8DBll+5hEEeIJq
	wXWvKvC20Yyj3cqjFvImPwIyjGChHqBe0Ru5595oAPbwEfipFTuNypQkakQfMWqBS1TnF5Iw+fobj
	+Y9tEFGWyGVAoiLUoALdh15aYubFjsYelXzaYPo5m3tiSQEg07O+mmLaZV3XsWHXd0R/gNM+xTKHK
	K8FjqTGjI0Gy9Axke6dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qip8U-001rAr-1P;
	Wed, 20 Sep 2023 04:48:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qip8R-001r7s-2E
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 04:48:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4051f8e1ba0so5708315e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 21:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695185293; x=1695790093; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m1zNdUzVc6Pr4pcVKMskltzftfT89TOksGte9XFhwTk=;
        b=MCwsB3Q5SlYQQKeCUJhDu4GfMP9hMh1wh+4BUTf+ETwbYxRm6x+z1KoHiJ4Zo65z2L
         KMgbGp7IKEr91RrBgeDXXXYyC1bo95WwzfviYyMoy/9yMqQW10hWoMMIavDcC5APRYaB
         DTVFf3VRi/QlUo7yHX2Gx7ZQW6GQvlSyZ52da+k6FUy5mkFVhl0/fNCdtNSJpm4PXtrP
         greU7o3Ra8eLJxW1+Wfnh3GbrVYR6JDLhqryYIHTCodQY2H7ob5DPiiSZpyxWbt3We1m
         bXKAaTnuPkbIxVuSFJHbZYAhAuhmh6RKqTI4UrA9pbQHjb2+iMSkTT/kojxyfhFYOrOg
         X1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695185293; x=1695790093;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1zNdUzVc6Pr4pcVKMskltzftfT89TOksGte9XFhwTk=;
        b=sUtMPj+PjJbxqZJK5l4oThRWFXxdZ1CYZyORimW/YEmKeXCBWU5GdNVR0LzX4CV0NM
         iyEnkS8glyMQy8aacCL0BSBZ3U34cRQGXOTT2g4RtfvAK5b6uPPfFnsSHpdJv1JuFsjK
         5SOfbSPnD5uePNMfkcgNdizwwOnWtPfezibvmhB2CK81sOv+r26dGUfJELKKIJPAb6Rv
         65/KFyZ6gbIgh/LMtrscZr25o04kXSnc54phth16GJUWeHD+mkFJyK1KLBxd9YEshdej
         l+Y1L2y7R0fIpd32GEBWKap3zFgj4s7L9MmtC8Q0CjDC/zmM32aj/Q821641PrV+vjBu
         rO3Q==
X-Gm-Message-State: AOJu0Yx8y90QURyI48NMi/VF9S1zCSLltogN1gjTd3PikyWOnWorhkmU
	mxuCxH54CBRepHf+Tlfg9eEbEQ==
X-Google-Smtp-Source: AGHT+IHNTj0/2lmbfWYjEmf3kCedBQ4IVwJ4KHiViE5ekRfu5L22Fq6enMo4axMx60gYT7DGOhz9tg==
X-Received: by 2002:a7b:cd8c:0:b0:401:d2cb:e6f3 with SMTP id y12-20020a7bcd8c000000b00401d2cbe6f3mr1247667wmj.1.1695185293390;
        Tue, 19 Sep 2023 21:48:13 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 15-20020a05600c020f00b00401d8810c8bsm805326wmi.15.2023.09.19.21.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 21:48:12 -0700 (PDT)
Date: Wed, 20 Sep 2023 06:48:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA
 registers
Message-ID: <20230920-bc0e3956d144be651727e252@orel>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-5-apatel@ventanamicro.com>
 <CAOnJCU+h-Y_i=HkCf194SLWp-7bqzMhRLC31q0xxQDMuLppapA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCU+h-Y_i=HkCf194SLWp-7bqzMhRLC31q0xxQDMuLppapA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_214823_732311_35540CB6 
X-CRM114-Status: GOOD (  22.42  )
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

T24gVHVlLCBTZXAgMTksIDIwMjMgYXQgMDE6MTI6NDdQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTE6MDfigK9BTSBBbnVwIFBhdGVsIDxhcGF0
ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ3VycmVudGx5IHRoZSBBSUEgT05F
X1JFRyByZWdpc3RlcnMgYXJlIHJlcG9ydGVkIGJ5IGdldC1yZWctbGlzdAo+ID4gYXMgbmV3IHJl
Z2lzdGVycyBmb3IgdmFyaW91cyB2Y3B1X3JlZ19saXN0IGNvbmZpZ3Mgd2hlbmV2ZXIgU3NhaWEK
PiA+IGlzIGF2YWlsYWJsZSBvbiB0aGUgaG9zdCBiZWNhdXNlIFNzYWlhIGV4dGVuc2lvbiBjYW4g
b25seSBiZQo+ID4gZGlzYWJsZWQgYnkgU21zdGF0ZWVuIGV4dGVuc2lvbiB3aGljaCBpcyBub3Qg
YWx3YXlzIGF2YWlsYWJsZS4KPiA+Cj4gPiBUbyB0YWNrbGUgdGhpcywgd2Ugc2hvdWxkIGZpbHRl
ci1vdXQgQUlBIE9ORV9SRUcgcmVnaXN0ZXJzIG9ubHkKPiA+IHdoZW4gU3NhaWEgY2FuJ3QgYmUg
ZGlzYWJsZWQgZm9yIGEgVkNQVS4KPiA+Cj4gPiBGaXhlczogNDc3MDY5Mzk4ZWQ2ICgiS1ZNOiBy
aXNjdjogc2VsZnRlc3RzOiBBZGQgZ2V0LXJlZy1saXN0IHRlc3QiKQo+ID4gU2lnbmVkLW9mZi1i
eTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICAuLi4v
c2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCAyMyArKysrKysrKysr
KysrKysrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9y
aXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9n
ZXQtcmVnLWxpc3QuYwo+ID4gaW5kZXggNzZjMGFkMTFlNDIzLi44NTkwN2M4NmI4MzUgMTAwNjQ0
Cj4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0
LmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxp
c3QuYwo+ID4gQEAgLTEyLDYgKzEyLDggQEAKPiA+Cj4gPiAgI2RlZmluZSBSRUdfTUFTSyAoS1ZN
X1JFR19BUkNIX01BU0sgfCBLVk1fUkVHX1NJWkVfTUFTSykKPiA+Cj4gPiArc3RhdGljIGJvb2wg
aXNhX2V4dF9jYW50X2Rpc2FibGVbS1ZNX1JJU0NWX0lTQV9FWFRfTUFYXTsKPiA+ICsKPiA+ICBi
b29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQo+ID4gIHsKPiA+ICAgICAgICAgc3dpdGNoIChyZWcg
JiB+UkVHX01BU0spIHsKPiA+IEBAIC00OCw2ICs1MCwxNSBAQCBib29sIGZpbHRlcl9yZWcoX191
NjQgcmVnKQo+ID4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVND
Vl9JU0FfRVhUX1pJRkVOQ0VJOgo+ID4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VY
VCB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJSFBNOgo+ID4gICAgICAgICAgICAgICAgIHJldHVybiB0
cnVlOwo+ID4gKyAgICAgICAvKiBBSUEgcmVnaXN0ZXJzIGFyZSBhbHdheXMgYXZhaWxhYmxlIHdo
ZW4gU3NhaWEgY2FuJ3QgYmUgZGlzYWJsZWQgKi8KPiA+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJ
U0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQSB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQV9S
RUcoc2lzZWxlY3QpOgo+ID4gKyAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JF
R19SSVNDVl9DU1JfQUlBIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JFRyhpcHJpbzEpOgo+ID4g
KyAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwg
S1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JFRyhpcHJpbzIpOgo+ID4gKyAgICAgICBjYXNlIEtWTV9S
RUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwgS1ZNX1JFR19SSVNDVl9DU1Jf
QUlBX1JFRyhzaWVoKToKPiA+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9S
RUdfUklTQ1ZfQ1NSX0FJQSB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQV9SRUcoc2lwaCk6Cj4gPiAr
ICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUEgfCBL
Vk1fUkVHX1JJU0NWX0NTUl9BSUFfUkVHKGlwcmlvMWgpOgo+ID4gKyAgICAgICBjYXNlIEtWTV9S
RUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwgS1ZNX1JFR19SSVNDVl9DU1Jf
QUlBX1JFRyhpcHJpbzJoKToKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gaXNhX2V4dF9jYW50
X2Rpc2FibGVbS1ZNX1JJU0NWX0lTQV9FWFRfU1NBSUFdID8gdHJ1ZSA6IGZhbHNlOwo+IAo+IEFo
aCBJIGd1ZXNzLiB5b3UgZG8gbmVlZCB0aGUgc3dpdGNoIGNhc2UgZm9yIEFJQSBDU1JzIGJ1dCBm
b3IgSVNBCj4gZXh0ZW5zaW9ucyBjYW4gYmUgYXZvaWRlZCBhcyBpdCBpcyBjb250aWd1b3VzLgoK
SSBndWVzcyB3ZSBjb3VsZCBzbyBzb21ldGhpbmcgbGlrZQoKY2FzZSBLVk1fUkVHX1JJU0NWX0lT
QV9FWFQgLi4uIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX01BWDoK
CmZvciB0aGUgSVNBIGV4dGVuc2lvbnMuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
