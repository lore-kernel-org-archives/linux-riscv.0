Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D3DCD4849
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WW8UpB6KZwQV1vhiTvbe73v++JTcq/NrGaw+OFPisSc=; b=pqUTqRsPUkE+5d
	jt9ka2A01DU81HR1e20ZfcjGBPB+MhqQtMnCi5YCP0kKAKGLk040izK392dgyTl/pLWHktIoEcmCg
	RaCjpDtfMkqVoNHXNwXb9ArL7vLunyuF6Tj48dAZ6iFMitr+Vlu2SrvnxAgnNv6M9rLVHjInw+vtP
	0rbLSAPO0ex8UZk0b413hLVWiL8S63Wpj9FE4B0C0u/p611gHHPoZdUAqXSjuI1kpc+5+0+yu2Eq+
	iGL6v7YgeXzmmt6vnYY9btnzKxBJBLwFHUgQsT4liDSTCc34r2zasHuhJHyg1mXaYiSDrWQunotTZ
	hoRxo1tc3G433MOpmS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sloyO-00000004Kyl-3ALD;
	Wed, 04 Sep 2024 12:18:56 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slox8-00000004Kdz-2AfZ
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 12:17:56 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-533de5a88f8so6691868e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 05:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1725452256; x=1726057056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlAAsB7SoUZZgOYwhXzTNmhBITwqQOW3TbtLYgYnb60=;
        b=RxWobTwHHeuiKqd/nUu2FmMIdPa6VXbDgew/XqxA2DxZOwWDibe7PMiYEtJeZ5ZOS+
         3J0V1e3EhxvcINwVorBMuGEZKSTHCjAzT9PPD34dzA46+Zzvizr1UkCmwVbXzVDLK8f2
         +HPWsnpn906Bd64lIRlm4q8JXn5qacHb2hjKkcKh0ntLx3dbYL/9oQMgSgK9zNeAfj7X
         dbGhnrKO2wSn/odYhJCZfk3OpJg0A0+Aj4zp0gGd+EJ0qY2ykqFICiQnCknOLQ+4ZRsl
         SSsoNi4CgPTw1y/+BXB893UW1iMX/aZMXN1O08f7jgnmHsbPgNWncJYRmFervkkuPp47
         3mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725452256; x=1726057056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlAAsB7SoUZZgOYwhXzTNmhBITwqQOW3TbtLYgYnb60=;
        b=ZkUy44LziVYjlzoZm215cyiEkaAp6g8hzzs91geqMOpAZcb2zWKN3wqR4DXskhmEsy
         CnxKlRwaGOCfa4v8JWdEZrJ3m9wVpGVvXrkeZLB7XZHJHQU5q9m4z3ipH1B24udPMqfP
         cqRqnZEhCkUFcSn78+cIT0fo4753wn23KeKrlbx+MjCi60f/rmDF9koSl8NU+FdoBiZK
         vhuIGtr0BZd0yTrbcLK5+t/dQ2CfUMmi7i/DuNYnkyWqEm88dHRrh0ZDtImDpyNOk0PL
         GfUUevpJziBarMJlflluL2dnB0wy5g3usPbcxaaEbod5M/zfQVBtdLGYzkNra0Mw8hjj
         42Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWOFCSwMLPABAVgPcYlGqCWNA0jPCRAAKuMX80UgWsRqb3gx1j4fIT0pi2OqlaRxHk8s8JRSB5oUNYXTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4l8iTGOwmjr+MZwqVN5nkfDK0dDu+eTjwc+2/tAiNQ7bpUs4B
	vTBNY3TLxkfEUWpCY4nXqABiu/VG+YZ9QawxCPkESpM0cUOx5znC/w39T36OxXbPlmV7imGmcBA
	4TY00AodZZKCfSUatnBQUB2cfKbISw7WBzV5kJ8bo8lhnaaceMUo=
X-Google-Smtp-Source: AGHT+IHONA2kh/9cuUHglAMjIqImf7K09nF2SZfCubD5ZSJYCibfpv2CbmuIEnueZFBXb2pJWbIKdkcALwOvnjG7oMU=
X-Received: by 2002:a05:6512:2211:b0:534:3cdc:dbef with SMTP id
 2adb3069b0e04-53546b8d6d5mr11049948e87.43.1725452254963; Wed, 04 Sep 2024
 05:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240829010151.2813377-1-samuel.holland@sifive.com> <20240829010151.2813377-10-samuel.holland@sifive.com>
In-Reply-To: <20240829010151.2813377-10-samuel.holland@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 4 Sep 2024 17:47:24 +0530
Message-ID: <CAK9=C2WjraWjuQCeU2Y4Jhr-gKkOcP42Sza7wVp0FgeGaD923g@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions
 for guests
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, 
	Atish Patra <atishp@atishpatra.org>, Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_051738_583963_17964FEA 
X-CRM114-Status: GOOD (  20.98  )
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

T24gVGh1LCBBdWcgMjksIDIwMjQgYXQgNjozMuKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoZSBpbnRlcmZhY2UgZm9yIGNvbnRyb2xs
aW5nIHBvaW50ZXIgbWFza2luZyBpbiBWUy1tb2RlIGlzIGhlbnZjZmcuUE1NLAo+IHdoaWNoIGlz
IHBhcnQgb2YgdGhlIFNzbnBtIGV4dGVuc2lvbiwgZXZlbiB0aG91Z2ggcG9pbnRlciBtYXNraW5n
IGluCj4gSFMtbW9kZSBpcyBwcm92aWRlZCBieSB0aGUgU21ucG0gZXh0ZW5zaW9uLiBBcyBhIHJl
c3VsdCwgZW11bGF0aW5nIFNtbnBtCj4gaW4gdGhlIGd1ZXN0IHJlcXVpcmVzIChvbmx5KSBTc25w
bSBvbiB0aGUgaG9zdC4KPgo+IFNpbmNlIHRoZSBndWVzdCBjb25maWd1cmVzIFNtbnBtIHRocm91
Z2ggdGhlIFNCSSBGaXJtd2FyZSBGZWF0dXJlcwo+IGludGVyZmFjZSwgdGhlIGV4dGVuc2lvbiBj
YW4gYmUgZGlzYWJsZWQgYnkgZmFpbGluZyB0aGUgU0JJIGNhbGwuIFNzbnBtCj4gY2Fubm90IGJl
IGRpc2FibGVkIHdpdGhvdXQgaW50ZXJjZXB0aW5nIHdyaXRlcyB0byB0aGUgc2VudmNmZyBDU1Iu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZl
LmNvbT4KPiAtLS0KPgo+IChubyBjaGFuZ2VzIHNpbmNlIHYyKQo+Cj4gQ2hhbmdlcyBpbiB2MjoK
PiAgLSBOZXcgcGF0Y2ggZm9yIHYyCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oIHwgMiArKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCAzICsrKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9rdm0uaAo+IGluZGV4IGU5N2RiMzI5NjQ1Ni4uNGYyNDIwMTM3NmIxIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaAo+IEBAIC0xNzUsNiArMTc1LDggQEAgZW51bSBLVk1fUklTQ1Zf
SVNBX0VYVF9JRCB7Cj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0YsCj4gICAgICAgICBL
Vk1fUklTQ1ZfSVNBX0VYVF9aQ01PUCwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pBV1JT
LAo+ICsgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfU01OUE0sCj4gKyAgICAgICBLVk1fUklTQ1Zf
SVNBX0VYVF9TU05QTSwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX01BWCwKPiAgfTsKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9vbmVyZWcuYwo+IGluZGV4IGIzMTljNGMxM2M1NC4uNmY4MzNlYzIzNDRhIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1X29uZXJlZy5jCj4gQEAgLTM0LDkgKzM0LDExIEBAIHN0YXRpYyBjb25zdCB1bnNp
Z25lZCBsb25nIGt2bV9pc2FfZXh0X2FycltdID0gewo+ICAgICAgICAgW0tWTV9SSVNDVl9JU0Ff
RVhUX01dID0gUklTQ1ZfSVNBX0VYVF9tLAo+ICAgICAgICAgW0tWTV9SSVNDVl9JU0FfRVhUX1Zd
ID0gUklTQ1ZfSVNBX0VYVF92LAo+ICAgICAgICAgLyogTXVsdGkgbGV0dGVyIGV4dGVuc2lvbnMg
KGFscGhhYmV0aWNhbGx5IHNvcnRlZCkgKi8KPiArICAgICAgIFtLVk1fUklTQ1ZfSVNBX0VYVF9T
TU5QTV0gPSBSSVNDVl9JU0FfRVhUX1NTTlBNLAoKV2h5IG5vdCB1c2UgS1ZNX0lTQV9FWFRfQVJS
KCkgbWFjcm8gaGVyZSA/Cgo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNNU1RBVEVFTiksCj4g
ICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1NBSUEpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJS
KFNTQ09GUE1GKSwKPiArICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU05QTSksCj4gICAgICAgICBL
Vk1fSVNBX0VYVF9BUlIoU1NUQyksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCks
Cj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZOQVBPVCksCj4gQEAgLTEyOSw2ICsxMzEsNyBA
QCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2FfZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVk
IGxvbmcgZXh0KQo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9NOgo+ICAgICAgICAg
LyogVGhlcmUgaXMgbm90IGFyY2hpdGVjdHVyYWwgY29uZmlnIGJpdCB0byBkaXNhYmxlIHNzY29m
cG1mIGNvbXBsZXRlbHkgKi8KPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1NDT0ZQ
TUY6Cj4gKyAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NTTlBNOgoKV2h5IG5vdCBhZGQg
S1ZNX1JJU0NWX0lTQV9FWFRfU01OUE0gaGVyZSA/CgpEaXNhYmxpbmcgU21ucG0gZnJvbSBLVk0g
dXNlciBzcGFjZSBpcyB2ZXJ5IGRpZmZlcmVudCBmcm9tCmRpc2FibGluZyBTbW5wbSBmcm9tIEd1
ZXN0IHVzaW5nIFNCSSBGV0ZUIGV4dGVuc2lvbi4KClRoZSBLVk0gdXNlciBzcGFjZSBzaG91bGQg
YWx3YXlzIGFkZCBTbW5wbSBpbiB0aGUKR3Vlc3QgSVNBIHN0cmluZyB3aGVuZXZlciB0aGUgSG9z
dCBJU0Egc3RyaW5nIGhhcyBpdC4KClRoZSBHdWVzdCBtdXN0IGV4cGxpY2l0bHkgdXNlIFNCSSBG
V0ZUIHRvIGVuYWJsZQpTbW5wbSBvbmx5IGFmdGVyIGl0IHNlZXMgU21ucG0gaW4gSVNBIHN0cmlu
Zy4KCj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NTVEM6Cj4gICAgICAgICBjYXNl
IEtWTV9SSVNDVl9JU0FfRVhUX1NWSU5WQUw6Cj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0Ff
RVhUX1NWTkFQT1Q6Cj4gLS0KPiAyLjQ1LjEKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
