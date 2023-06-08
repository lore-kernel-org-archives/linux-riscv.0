Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC08C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 09:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nydLsLX//iCtJZoARRipdhwxJtIpQb+rbCrF0GeI9Pw=; b=ZzYEByH5RIuJtE
	gAO4aO8vMuHAcZg8aJhCrz/FVyDd01PMVCwlxZa+yZdsf/yt6YFcmaMIFrz3MeL7FY8LOi112bgGN
	WR4ubb/iP56DgDIClC+F/o6mtLl1MvaUzH5md29IK+9ovYbpxD5LE60c4rJOkBPuVMBGM78M5Y4fy
	Sv8xd1vTTZ1ahe0MReXQo8ENKKlbYVezMzbzLXTAz40bK6d4KalnZ227YfUXKdKqM4vbOwVgQ4MSh
	fMFrPvojIUPkH2r05he1RM2r70b+Fnx6MXtcpAQzQSZDiSeACttsrN/9cN0uItr5nSiVgBkw5FFKG
	y74pFzOFIiX2k8P5ex2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7CD5-008jUC-0j;
	Thu, 08 Jun 2023 09:45:39 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7CD2-008jRt-0E;
	Thu, 08 Jun 2023 09:45:37 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-19f268b1d83so334795fac.1;
        Thu, 08 Jun 2023 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686217533; x=1688809533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWfXcI9qpNRXyZ49c1qVkzQX/sqIlGyUNHOIKGAzDQA=;
        b=OoOYd2Yl2fvO4CeoY9SXHmrdO/GnjLe13sWCrJ7lGe1yhDuyXVDlqo0aUAKF0FKt9F
         uEbaKxjDxSqxqK3VGqMeVp/mo6E9VAG1KNWCB0Y1+PWB/moUVnUjS1NHX3MLj8gLWZ6z
         SsE9OQSfsUMJoyg9sQB2EtUigZho4LxaKSjdF4sCvz6wVdlD4AGj9a0TH/W8c5cYCVQP
         4kTNx9yq3tD7FM3+jK+lGWxjLs98WKyMsVCvksXQYHXH/ArNdQ0oQUlPlOSpbl04LXv5
         8Urqn++vTFktCKLCVxhFq0WA7NQuJmzpA31w40ViBGkfOQ8lMcSiN/BxLM8WpSOTLZL5
         6DiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686217533; x=1688809533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWfXcI9qpNRXyZ49c1qVkzQX/sqIlGyUNHOIKGAzDQA=;
        b=k3GBtAG3iBrZcsHC2nWowAiawHG85rP9XHEGExF7J/dKl63lM54oRHFRXacUTmW4Ru
         VBEvjX/yz7587e3gIjIdD1LyMoqkd3avCftMoorRZA6Jc5P9SXA9T3uPRnDofeNL5KAT
         PyM+GhpcwyFnjwMWIVVOpMEk3HRMeAvehunM3OzMCIW8H9EdB0YbN/QNwKb8iVeRLXWN
         5BIHvw85RXTogyQ5PhJHPZO4WEqAeDNILC5iTma2+0rMlymvo5WwJ2tNzXMnZHG1ycj7
         Cho6sqVjmvy8qRvbAAUSGWi+qcW8jbppJbAIu/13YYdJ1K2zS8cBZ3kbi1UgCVak8M+Z
         b0Eg==
X-Gm-Message-State: AC+VfDwHs/NKajENZeo+yfvwn9Fkz56DYXg7d4OvR01MlQlk9N7J66Pu
	fwk0geS9v+8/aDUcgylnHo5g0IoIsLqTG6ik5lw=
X-Google-Smtp-Source: ACHHUZ5IWgmj+LEHtiTJyB5L+4nONSN43H9fR9QcrJW/5jde8UjA7NnpuuS9XpaB5O5YV3svfxnb3boBreWg1R1DcOk=
X-Received: by 2002:a05:6808:315:b0:39a:62f7:9463 with SMTP id
 i21-20020a056808031500b0039a62f79463mr4776127oie.41.1686217532902; Thu, 08
 Jun 2023 02:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684999824.git.haibo1.xu@intel.com> <da390e6200e838fce320a2a43b2f87951b4e0bbb.1684999824.git.haibo1.xu@intel.com>
 <20230525-2bab5376987792eab73507ac@orel>
In-Reply-To: <20230525-2bab5376987792eab73507ac@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 8 Jun 2023 17:45:21 +0800
Message-ID: <CAJve8okR_iH4vF9DV9zTkDaeYe25kP7KUcKQphmjG5q-iVb-KA@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] KVM: riscv: selftests: Add get-reg-list test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_024536_117015_FA8C7285 
X-CRM114-Status: GOOD (  13.00  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMToxOOKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cgo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9S
RUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NPUkUgfCBLVk1fUkVHX1JJU0NWX0NPUkVfUkVH
KG1vZGUpLAo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1f
UkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhzc3RhdHVzKSwKPiA+ICsgICAg
IEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DU1IgfCBL
Vk1fUkVHX1JJU0NWX0NTUl9SRUcoc2llKSwKPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1f
UkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9SRUco
c3R2ZWMpLAo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1f
UkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhzc2NyYXRjaCksCj4gPiArICAg
ICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ1NSIHwg
S1ZNX1JFR19SSVNDVl9DU1JfUkVHKHNlcGMpLAo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtW
TV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX1JF
RyhzY2F1c2UpLAo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBL
Vk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhzdHZhbCksCj4gPiArICAg
ICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ1NSIHwg
S1ZNX1JFR19SSVNDVl9DU1JfUkVHKHNpcCksCj4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZN
X1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfUkVH
KHNhdHApLAo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1f
UkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhzY291bnRlcmVuKSwKPiA+ICsg
ICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9USU1F
UiB8IEtWTV9SRUdfUklTQ1ZfVElNRVJfUkVHKGZyZXF1ZW5jeSksCj4gPiArICAgICBLVk1fUkVH
X1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfVElNRVIgfCBLVk1fUkVH
X1JJU0NWX1RJTUVSX1JFRyh0aW1lKSwKPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVH
X1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9USU1FUiB8IEtWTV9SRUdfUklTQ1ZfVElNRVJfUkVH
KGNvbXBhcmUpLAo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBL
Vk1fUkVHX1JJU0NWX1RJTUVSIHwgS1ZNX1JFR19SSVNDVl9USU1FUl9SRUcoc3RhdGUpLAo+ID4g
KyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0lT
QV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9BLAo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtW
TV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VY
VF9DLAo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVH
X1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9ELAo+ID4gKyAgICAgS1ZNX1JFR19S
SVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklT
Q1ZfSVNBX0VYVF9GLAo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQg
fCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9ILAo+ID4gKyAgICAg
S1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQg
fCBLVk1fUklTQ1ZfSVNBX0VYVF9JLAo+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdf
U0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9NLAo+
Cj4gSSB0aGluayBhbGwgdGhlIGFib3ZlIHNob3VsZCBoYXZlIHRoZSBzaXplIEtWTV9SRUdfU0la
RV9VTE9ORy4gUGxlYXNlIGFsc28KPiB0ZXN0IHdpdGggYSAzMi1iaXQgaG9zdC4KPgoKSGkgQW5k
cmV3LAoKSnVzdCBub3RpY2VkIHRoZSBSSVNDLVYgMzItYml0IGt2bSBzZWxmdGVzdHMgd2FzIG5v
dCBzdXBwb3J0ZWQgY3VycmVudGx5LgpFdmVuIHRob3VnaCBJIHRyaWVkIHRvIHJlbW92ZSB0aGUg
YmVsb3cgY2hlY2sgZm9yIDMyLWJpdCwgdGhlcmUgd2VyZQpzdGlsbCBtYW55IHdhcm5pbmcgYW5k
IGVycm9yIG1lc3NhZ2VzIGR1cmluZyBjb21waWxpbmcuCkl0IHNlZW1zIDMyLWJpdCBLVk0gc2Vs
ZnRlc3RzIHdhcyBub3Qgc3VwcG9ydGVkIGVpdGhlciBmb3IgQVJNL3g4Ni4gRG8Kd2UgaGF2ZSBh
IHBsYW4gdG8gc3VwcG9ydCBpdCBvbiByaXNjLXY/CgpSZWdhcmRzLApIYWlibwoKZGlmZiAtLWdp
dCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaApi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaAppbmRl
eCBhYzRhYWEyMWRlZWUuLmEzMmNjYzA2NDM1YiAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5oCisrKyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaApAQCAtMjA1LDkgKzIwNSw5IEBA
IGV4dGVybiBlbnVtIHZtX2d1ZXN0X21vZGUgdm1fbW9kZV9kZWZhdWx0OwoKICNlbGlmIGRlZmlu
ZWQoX19yaXNjdikKCi0jaWYgX19yaXNjdl94bGVuID09IDMyCi0jZXJyb3IgIlJJU0MtViAzMi1i
aXQga3ZtIHNlbGZ0ZXN0cyBub3Qgc3VwcG9ydGVkIgotI2VuZGlmCisvLyNpZiBfX3Jpc2N2X3hs
ZW4gPT0gMzIKKy8vI2Vycm9yICJSSVNDLVYgMzItYml0IGt2bSBzZWxmdGVzdHMgbm90IHN1cHBv
cnRlZCIKKy8vI2VuZGlmCgo+Cj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
