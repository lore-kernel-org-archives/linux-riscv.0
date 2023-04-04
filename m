Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602E3C76188
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8u6/htdr4BNsO1hnRVTGsR7ZdJFZD2pz2Ve3jp/qyYA=; b=GW0jeD8nx+0kUF
	44L4aj1cKejJuQPYY2sj+IgAgc2wE2g3/o1BVS0D7ixXiDIr8T+VEPIj2bdHj2BB6kFB6Nlw/L5bM
	B9WcZlFhCRRFoKdi7ip428ooHCbv6hOlNkS0GqOeJF7ZdvdGX26mk+5QkJcdIbajlcgoSG+xzwfg0
	QHKoiFQXzQVaC8wOj2PzO0O21wrLGbgCRhq0aUkj+5t5BJjDUAHNydrMTOEKNin31Sbjzi0xz2cqc
	gZTTlMeL+sEiZIeImPc6DI7hZKblH9Mt6ezpTjnEA6A5mIfD2Jx4OBmeUIWzsmHTzuyeWZxrAxlUP
	pmKcts89vFQpa85AfgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjUxX-00HJVM-1g;
	Tue, 04 Apr 2023 00:55:39 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjUxU-00HJU2-2k
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 00:55:38 +0000
Received: by mail-pj1-x102e.google.com with SMTP id q102so28910469pjq.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 17:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1680569736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEwFn2uGtRQsO9awpxhbGL1a6vuoUJbo7CO/eXVUsqU=;
        b=GlpqQK7gy6EApv3Sc/UyYohp7NSneizSCpJAnaXbNX6wCClkpgyJnLXyoMNDrW0RGH
         JJEQKA9KWSJNgUIUptDwwSILqYkCwPvnun5nD3pXLNO8COXds4JF0GpTCPTp9auKuGpU
         LBLyWsgS0ktm5oNiK4gpXJsqfGNODIRAU0vjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680569736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEwFn2uGtRQsO9awpxhbGL1a6vuoUJbo7CO/eXVUsqU=;
        b=dGlaBfuOO4AU1CkV4v1OKxnRyqCMhlWnt0cfqDernSWNnhyuDx19W8FWCzLTvUr+dL
         Ap/dIRuFHeUH9Rk7InYCM2OH+E+c2PU4byRvCTm2PLIfcZJQJEBYFPrU209uAMDPZGgu
         7biEdh63727m+uzh/eI3lL6pol4qn+Pw6++JfJYC+lMUM/QvSOQvRDt8b1cpSakZx27q
         pJ1nraWLIwA9mddBmLLwjCFlGlb4lfTcRbf8znydURcJSVJfehKod7BXj6amvE2sUiRQ
         Po/RgT+Agzvt0HNyR2sUnlwP43KoNJexV7JME7EdCN3qZ8YkRMmqDmC+B8PN3v9IHVYl
         6QiA==
X-Gm-Message-State: AAQBX9dTuTT6NJu/9uWim9Yj6HlIjnKPPO4YXdrCmFLHiI5/bdh+JuV/
	sa6g9HoHAb/NBkfDTdcmqLOB5FYVJaWacJ2ud/3f
X-Google-Smtp-Source: AKy350ZP5YKZ16+SpnppyXfLhSLP7eL7PHbUb9z1R22CcfULzFD0TQxOxSFi+54XPufaTj35Mh5p0Ksk4QPQw3rgrxI=
X-Received: by 2002:a17:902:b60e:b0:1a1:f6d9:2c27 with SMTP id
 b14-20020a170902b60e00b001a1f6d92c27mr337392pls.5.1680569736077; Mon, 03 Apr
 2023 17:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230403093310.2271142-1-apatel@ventanamicro.com> <20230403093310.2271142-7-apatel@ventanamicro.com>
In-Reply-To: <20230403093310.2271142-7-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 4 Apr 2023 06:25:24 +0530
Message-ID: <CAOnJCU+4Qd=KBc98p-dN5+y8LCGY0x12rZP-RC0d7UsiN+7tiA@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_175536_888991_3AFF3490 
X-CRM114-Status: GOOD (  15.77  )
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

T24gTW9uLCBBcHIgMywgMjAyMyBhdCAzOjAz4oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2UgaW1wbGVtZW50IE9ORV9SRUcgaW50ZXJmYWNlIGZv
ciBBSUEgQ1NScyBhcyBhIHNlcGFyYXRlIHN1YnR5cGUKPiB1bmRlciB0aGUgQ1NSIE9ORV9SRUcg
aW50ZXJmYWNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFt
aWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCB8IDgg
KysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgIHwgOCArKysrKysr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmgKPiBpbmRleCAxODIwMjNkYzlhNTEuLmNiYzNlNzRmYTY3MCAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBAQCAtNzksNiArNzksMTAgQEAgc3RydWN0IGt2bV9y
aXNjdl9jc3Igewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzY291bnRlcmVuOwo+ICB9Owo+Cj4g
Ky8qIEFJQSBDU1IgcmVnaXN0ZXJzIGZvciBLVk1fR0VUX09ORV9SRUcgYW5kIEtWTV9TRVRfT05F
X1JFRyAqLwo+ICtzdHJ1Y3Qga3ZtX3Jpc2N2X2FpYV9jc3Igewo+ICt9Owo+ICsKPiAgLyogVElN
RVIgcmVnaXN0ZXJzIGZvciBLVk1fR0VUX09ORV9SRUcgYW5kIEtWTV9TRVRfT05FX1JFRyAqLwo+
ICBzdHJ1Y3Qga3ZtX3Jpc2N2X3RpbWVyIHsKPiAgICAgICAgIF9fdTY0IGZyZXF1ZW5jeTsKPiBA
QCAtMTA3LDYgKzExMSw3IEBAIGVudW0gS1ZNX1JJU0NWX0lTQV9FWFRfSUQgewo+ICAgICAgICAg
S1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UsCj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VY
VF9aSUNCT00sCj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aQkIsCj4gKyAgICAgICBLVk1f
UklTQ1ZfSVNBX0VYVF9TU0FJQSwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX01BWCwKPiAg
fTsKPgo+IEBAIC0xNTMsOCArMTU4LDExIEBAIGVudW0gS1ZNX1JJU0NWX1NCSV9FWFRfSUQgewo+
ICAvKiBDb250cm9sIGFuZCBzdGF0dXMgcmVnaXN0ZXJzIGFyZSBtYXBwZWQgYXMgdHlwZSAzICov
Cj4gICNkZWZpbmUgS1ZNX1JFR19SSVNDVl9DU1IgICAgICAgICAgICAgICgweDAzIDw8IEtWTV9S
RUdfUklTQ1ZfVFlQRV9TSElGVCkKPiAgI2RlZmluZSBLVk1fUkVHX1JJU0NWX0NTUl9HRU5FUkFM
ICAgICAgKDB4MCA8PCBLVk1fUkVHX1JJU0NWX1NVQlRZUEVfU0hJRlQpCj4gKyNkZWZpbmUgS1ZN
X1JFR19SSVNDVl9DU1JfQUlBICAgICAgICAgICgweDEgPDwgS1ZNX1JFR19SSVNDVl9TVUJUWVBF
X1NISUZUKQo+ICAjZGVmaW5lIEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhuYW1lKSAgICBcCj4gICAg
ICAgICAgICAgICAgIChvZmZzZXRvZihzdHJ1Y3Qga3ZtX3Jpc2N2X2NzciwgbmFtZSkgLyBzaXpl
b2YodW5zaWduZWQgbG9uZykpCj4gKyNkZWZpbmUgS1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JFRyhu
YW1lKSAgICAgICAgXAo+ICsgICAgICAgKG9mZnNldG9mKHN0cnVjdCBrdm1fcmlzY3ZfYWlhX2Nz
ciwgbmFtZSkgLyBzaXplb2YodW5zaWduZWQgbG9uZykpCj4KPiAgLyogVGltZXIgcmVnaXN0ZXJz
IGFyZSBtYXBwZWQgYXMgdHlwZSA0ICovCj4gICNkZWZpbmUgS1ZNX1JFR19SSVNDVl9USU1FUiAg
ICAgICAgICAgICgweDA0IDw8IEtWTV9SRUdfUklTQ1ZfVFlQRV9TSElGVCkKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXgg
YWNhNmI0ZmI3NTE5Li4xNTUwN2NkM2E1OTUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTU4LDYgKzU4LDcgQEAg
c3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10gPSB7Cj4gICAgICAg
ICBbS1ZNX1JJU0NWX0lTQV9FWFRfSV0gPSBSSVNDVl9JU0FfRVhUX2ksCj4gICAgICAgICBbS1ZN
X1JJU0NWX0lTQV9FWFRfTV0gPSBSSVNDVl9JU0FfRVhUX20sCj4KPiArICAgICAgIEtWTV9JU0Ff
RVhUX0FSUihTU0FJQSksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1NUQyksCj4gICAgICAg
ICBLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZQ
Qk1UKSwKPiBAQCAtOTcsNiArOTgsNyBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2Ff
ZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQo+ICAgICAgICAgY2FzZSBLVk1fUklT
Q1ZfSVNBX0VYVF9DOgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9JOgo+ICAgICAg
ICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9NOgo+ICsgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNB
X0VYVF9TU0FJQToKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1NUQzoKPiAgICAg
ICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZJTlZBTDoKPiAgICAgICAgIGNhc2UgS1ZNX1JJ
U0NWX0lTQV9FWFRfWklISU5UUEFVU0U6Cj4gQEAgLTUyMCw2ICs1MjIsOSBAQCBzdGF0aWMgaW50
IGt2bV9yaXNjdl92Y3B1X2dldF9yZWdfY3NyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAg
ICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9DU1JfR0VORVJBTDoKPiAgICAgICAgICAgICAgICAgcmMg
PSBrdm1fcmlzY3ZfdmNwdV9nZW5lcmFsX2dldF9jc3IodmNwdSwgcmVnX251bSwgJnJlZ192YWwp
Owo+ICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9D
U1JfQUlBOgo+ICsgICAgICAgICAgICAgICByYyA9IGt2bV9yaXNjdl92Y3B1X2FpYV9nZXRfY3Ny
KHZjcHUsIHJlZ19udW0sICZyZWdfdmFsKTsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAg
ICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7Cj4gICAgICAgICAg
ICAgICAgIGJyZWFrOwo+IEBAIC01NTYsNiArNTYxLDkgQEAgc3RhdGljIGludCBrdm1fcmlzY3Zf
dmNwdV9zZXRfcmVnX2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICBjYXNlIEtW
TV9SRUdfUklTQ1ZfQ1NSX0dFTkVSQUw6Cj4gICAgICAgICAgICAgICAgIHJjID0ga3ZtX3Jpc2N2
X3ZjcHVfZ2VuZXJhbF9zZXRfY3NyKHZjcHUsIHJlZ19udW0sIHJlZ192YWwpOwo+ICAgICAgICAg
ICAgICAgICBicmVhazsKPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9DU1JfQUlBOgo+ICsg
ICAgICAgICAgICAgICByYyA9IGt2bV9yaXNjdl92Y3B1X2FpYV9zZXRfY3NyKHZjcHUsIHJlZ19u
dW0sIHJlZ192YWwpOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGRlZmF1bHQ6
Cj4gICAgICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPiAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gLS0KPiAyLjM0LjEKPgoKClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9z
aW5jLmNvbT4KLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
