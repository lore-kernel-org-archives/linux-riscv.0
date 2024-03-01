Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5611CC5478C
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 04:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLYP8u3/k2V3OxGJCI2t6IsgVPXsWVLeIsZB81u5FKA=; b=KKQr88dwkO3smK
	dy+u6ETf4Ytb/NHIeLZBlHikm8hdy+U3C6s2dorC0Dxx0R5eErpl+JQT7FgQ/dQTkhI3qD/Ec1pII
	p+2MSUCFD/8UC05E8j1lI9uFk48oXyu86yE5TnAcI5DxNvSVpEt2AGwR8B7HlZ72qtm1jOQac0qk8
	wkPBo2jcEjL6CbRxFKGyHSu7LukiGIeTfmgfw71mUfJM3/KpGuVBlAPr/OKvZGLj7wTsHWs99alDf
	EH7sOG6MMiRAI6q1umwLIVNtlrqf0elayJMzlYtpCd0JSTs9mNID6l74FgKjzUFuMzRvRnB4xRc+q
	2seGJljx5xSKjAj3vEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfukN-0000000GJla-3Wg7;
	Fri, 01 Mar 2024 04:43:47 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfukK-0000000GJkI-1mLq
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 04:43:45 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3652731b2b7so6637125ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 20:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1709268223; x=1709873023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyczRoc8zwOC9hsxzaj2db9K2Y/ZvntkudwAJJn92Yc=;
        b=0NdxnihoSJHK5+bss5M36ex3fABxDutC4ojpmCpdpSrcAf4xRaay/If8Vxlq60D+j0
         uQrB56tRVveleS7isH1paZ12kTKHrFWmG+MjgPFPSfILxurfaXQeWRUkKGGn1hN1CZWG
         A5mdwbYdU4995+Psh6HwA9PKhlZdar4a3r0gsYicCMlyPkHsSWDOgLLm/i3zjwb80VdR
         L/BnQxzMSzJpwh3EWBANoYDd0P1BQPYh6uYni0YDQuG6sJsRKolWwUoCnLZQvQn2KXov
         iB/EnYMxPxxxYYaiq/X14pFBmmX++SQr+y2Q1qLChu3s3CkKv1ft+wxap0FqkMSXgGy4
         Kehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709268223; x=1709873023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyczRoc8zwOC9hsxzaj2db9K2Y/ZvntkudwAJJn92Yc=;
        b=Hh634MWdRlP/6lDVpSP1EOsq6dbxOZ/IRrNUtbjbzeF99JEfQJeD/s2u7BBCEXaQxu
         jlEG1k6lfr6MJszu110denI07wFHjhDZxxhzWvUb4gr7LaTUCt7XGp6eTRNT8bpZApVF
         wWhTVFedy9uw1KKPVvh7BH8XPpaw/NRHnv07jonO81HSas08nrplx0fqarZgKQTrRvrw
         t6JJiNLumzF/bXvNogW9f/kNowuw0GlunVw+JS9SN5tb0jCw46WtPRm9dGJFmqh85j9Q
         UuwH3EvBxGn9zXWuQGHz1kDbZjiRl0gEKpVRAZ8VZ2gRj5jwr6BrgCuLKyL1WrbUcic8
         hjXA==
X-Forwarded-Encrypted: i=1; AJvYcCV6wSGyw2O+Y43s+DcmZbU89mZMwxPcl+YjgjqpPzn/Lf65KAdWzg20jX2pBFQehgtuFmOv0nSaM+o6xcLhE0XdEZUo9pOEJErN/EpzcHu3
X-Gm-Message-State: AOJu0YwivG9+LD5zWVe6gtNvx2iNEz3jeGF7JuzulrAELKFVyBCoukzx
	4aaeIZSWye0/Z3+euC9BJYkMuVCv5Dgb0ahkwK20ogo24SUSFzSEE48L1rQGS9jqRUeyVCSBopr
	q+xhsPh2l41djL0vbV3RG2xf5bx+L7oABwDoUow==
X-Google-Smtp-Source: AGHT+IG5k0AX4t9auWvUQGZiAPhOmG+SFKwOcgiizsw7rn22vzkIfMNNM5wDrv0r5mB1hHq5kIOCmv2BDDZ7Ocf6jq8=
X-Received: by 2002:a05:6e02:190f:b0:365:10dd:d1aa with SMTP id
 w15-20020a056e02190f00b0036510ddd1aamr868808ilu.16.1709268223495; Thu, 29 Feb
 2024 20:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20240229010130.1380926-1-atishp@rivosinc.com> <20240229010130.1380926-13-atishp@rivosinc.com>
In-Reply-To: <20240229010130.1380926-13-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 1 Mar 2024 10:13:33 +0530
Message-ID: <CAAhSdy3U7Ut5yhth0nArsSaBNT2SHdUE8mgAyRdtkzsYqF7cXw@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] KVM: riscv: selftests: Add SBI PMU extension definitions
To: Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_204344_491230_C87E22F6 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgMjksIDIwMjQgYXQgNjozMuKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBTQkkgUE1VIGV4dGVuc2lvbiBkZWZpbml0aW9uIGlz
IHJlcXVpcmVkIGZvciB1cGNvbWluZyBTQkkgUE1VCj4gc2VsZnRlc3RzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0t
LQo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oICAgfCA2NyAr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3Yv
cHJvY2Vzc29yLmggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9w
cm9jZXNzb3IuaAo+IGluZGV4IGY3NWMzODFmYTM1YS4uYTQ5YTM5YzhlOGQ0IDEwMDY0NAo+IC0t
LSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5o
Cj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vz
c29yLmgKPiBAQCAtMTY5LDE3ICsxNjksODQgQEAgdm9pZCB2bV9pbnN0YWxsX2V4Y2VwdGlvbl9o
YW5kbGVyKHN0cnVjdCBrdm1fdm0gKnZtLCBpbnQgdmVjdG9yLCBleGNlcHRpb25faGFuZGwKPiAg
ZW51bSBzYmlfZXh0X2lkIHsKPiAgICAgICAgIFNCSV9FWFRfQkFTRSA9IDB4MTAsCj4gICAgICAg
ICBTQklfRVhUX1NUQSA9IDB4NTM1NDQxLAo+ICsgICAgICAgU0JJX0VYVF9QTVUgPSAweDUwNEQ1
NSwKPiAgfTsKPgo+ICBlbnVtIHNiaV9leHRfYmFzZV9maWQgewo+ICAgICAgICAgU0JJX0VYVF9C
QVNFX1BST0JFX0VYVCA9IDMsCj4gIH07Cj4KPiArZW51bSBzYmlfZXh0X3BtdV9maWQgewo+ICsg
ICAgICAgU0JJX0VYVF9QTVVfTlVNX0NPVU5URVJTID0gMCwKPiArICAgICAgIFNCSV9FWFRfUE1V
X0NPVU5URVJfR0VUX0lORk8sCj4gKyAgICAgICBTQklfRVhUX1BNVV9DT1VOVEVSX0NGR19NQVRD
SCwKPiArICAgICAgIFNCSV9FWFRfUE1VX0NPVU5URVJfU1RBUlQsCj4gKyAgICAgICBTQklfRVhU
X1BNVV9DT1VOVEVSX1NUT1AsCj4gKyAgICAgICBTQklfRVhUX1BNVV9DT1VOVEVSX0ZXX1JFQUQs
Cj4gKyAgICAgICBTQklfRVhUX1BNVV9DT1VOVEVSX0ZXX1JFQURfSEksCj4gKyAgICAgICBTQklf
RVhUX1BNVV9TTkFQU0hPVF9TRVRfU0hNRU0sCj4gK307Cj4gKwo+ICt1bmlvbiBzYmlfcG11X2N0
cl9pbmZvIHsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsdWU7Cj4gKyAgICAgICBzdHJ1Y3Qg
ewo+ICsgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGNzcjoxMjsKPiArICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyB3aWR0aDo2Owo+ICsjaWYgX19yaXNjdl94bGVuID09IDMyCj4gKyAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmVzZXJ2ZWQ6MTM7Cj4gKyNlbHNlCj4gKyAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmVzZXJ2ZWQ6NDU7Cj4gKyNlbmRpZgo+ICsgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIHR5cGU6MTsKPiArICAgICAgIH07Cj4gK307Cj4gKwo+ICBz
dHJ1Y3Qgc2JpcmV0IHsKPiAgICAgICAgIGxvbmcgZXJyb3I7Cj4gICAgICAgICBsb25nIHZhbHVl
Owo+ICB9Owo+Cj4gKy8qKiBHZW5lcmFsIHBtdSBldmVudCBjb2RlcyBzcGVjaWZpZWQgaW4gU0JJ
IFBNVSBleHRlbnNpb24gKi8KPiArZW51bSBzYmlfcG11X2h3X2dlbmVyaWNfZXZlbnRzX3Qgewo+
ICsgICAgICAgU0JJX1BNVV9IV19OT19FVkVOVCAgICAgICAgICAgICAgICAgICAgID0gMCwKPiAr
ICAgICAgIFNCSV9QTVVfSFdfQ1BVX0NZQ0xFUyAgICAgICAgICAgICAgICAgICA9IDEsCj4gKyAg
ICAgICBTQklfUE1VX0hXX0lOU1RSVUNUSU9OUyAgICAgICAgICAgICAgICAgPSAyLAo+ICsgICAg
ICAgU0JJX1BNVV9IV19DQUNIRV9SRUZFUkVOQ0VTICAgICAgICAgICAgID0gMywKPiArICAgICAg
IFNCSV9QTVVfSFdfQ0FDSEVfTUlTU0VTICAgICAgICAgICAgICAgICA9IDQsCj4gKyAgICAgICBT
QklfUE1VX0hXX0JSQU5DSF9JTlNUUlVDVElPTlMgICAgICAgICAgPSA1LAo+ICsgICAgICAgU0JJ
X1BNVV9IV19CUkFOQ0hfTUlTU0VTICAgICAgICAgICAgICAgID0gNiwKPiArICAgICAgIFNCSV9Q
TVVfSFdfQlVTX0NZQ0xFUyAgICAgICAgICAgICAgICAgICA9IDcsCj4gKyAgICAgICBTQklfUE1V
X0hXX1NUQUxMRURfQ1lDTEVTX0ZST05URU5EICAgICAgPSA4LAo+ICsgICAgICAgU0JJX1BNVV9I
V19TVEFMTEVEX0NZQ0xFU19CQUNLRU5EICAgICAgID0gOSwKPiArICAgICAgIFNCSV9QTVVfSFdf
UkVGX0NQVV9DWUNMRVMgICAgICAgICAgICAgICA9IDEwLAo+ICsKPiArICAgICAgIFNCSV9QTVVf
SFdfR0VORVJBTF9NQVgsCj4gK307Cj4gKwo+ICsvKiBTQkkgUE1VIGNvdW50ZXIgdHlwZXMgKi8K
PiArZW51bSBzYmlfcG11X2N0cl90eXBlIHsKPiArICAgICAgIFNCSV9QTVVfQ1RSX1RZUEVfSFcg
PSAweDAsCj4gKyAgICAgICBTQklfUE1VX0NUUl9UWVBFX0ZXLAo+ICt9Owo+ICsKPiArLyogRmxh
Z3MgZGVmaW5lZCBmb3IgY29uZmlnIG1hdGNoaW5nIGZ1bmN0aW9uICovCj4gKyNkZWZpbmUgU0JJ
X1BNVV9DRkdfRkxBR19TS0lQX01BVENIICAgICgxIDw8IDApCj4gKyNkZWZpbmUgU0JJX1BNVV9D
RkdfRkxBR19DTEVBUl9WQUxVRSAgICgxIDw8IDEpCj4gKyNkZWZpbmUgU0JJX1BNVV9DRkdfRkxB
R19BVVRPX1NUQVJUICAgICgxIDw8IDIpCj4gKyNkZWZpbmUgU0JJX1BNVV9DRkdfRkxBR19TRVRf
VlVJTkggICAgICgxIDw8IDMpCj4gKyNkZWZpbmUgU0JJX1BNVV9DRkdfRkxBR19TRVRfVlNJTkgg
ICAgICgxIDw8IDQpCj4gKyNkZWZpbmUgU0JJX1BNVV9DRkdfRkxBR19TRVRfVUlOSCAgICAgICgx
IDw8IDUpCj4gKyNkZWZpbmUgU0JJX1BNVV9DRkdfRkxBR19TRVRfU0lOSCAgICAgICgxIDw8IDYp
Cj4gKyNkZWZpbmUgU0JJX1BNVV9DRkdfRkxBR19TRVRfTUlOSCAgICAgICgxIDw8IDcpCj4gKwo+
ICsvKiBGbGFncyBkZWZpbmVkIGZvciBjb3VudGVyIHN0YXJ0IGZ1bmN0aW9uICovCj4gKyNkZWZp
bmUgU0JJX1BNVV9TVEFSVF9GTEFHX1NFVF9JTklUX1ZBTFVFICgxIDw8IDApCj4gKyNkZWZpbmUg
U0JJX1BNVV9TVEFSVF9GTEFHX0lOSVRfRlJPTV9TTkFQU0hPVCBCSVQoMSkKPiArCj4gKy8qIEZs
YWdzIGRlZmluZWQgZm9yIGNvdW50ZXIgc3RvcCBmdW5jdGlvbiAqLwo+ICsjZGVmaW5lIFNCSV9Q
TVVfU1RPUF9GTEFHX1JFU0VUICgxIDw8IDApCj4gKyNkZWZpbmUgU0JJX1BNVV9TVE9QX0ZMQUdf
VEFLRV9TTkFQU0hPVCBCSVQoMSkKPiArCj4gIHN0cnVjdCBzYmlyZXQgc2JpX2VjYWxsKGludCBl
eHQsIGludCBmaWQsIHVuc2lnbmVkIGxvbmcgYXJnMCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGFyZzEsIHVuc2lnbmVkIGxvbmcgYXJnMiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzMsIHVuc2lnbmVkIGxvbmcgYXJnNCwKPiAtLQo+
IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
