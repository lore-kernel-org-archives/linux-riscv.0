Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBBFEE14D3
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwhgUzhA1ynt9tDCEnY+zETA/zgc4W+EhkFbrHO8qi4=; b=b+V8G2dIBwx6c9
	MD0a7ZvduUrFvEV4S5ityQHeLxZjVctx66CJzbeN2yHHHSXYllO+gDZmoOPFf/hau7gd1/MioDH3n
	68V6EggvzouYgUIZm0XcDzT6/mclpGE/4CTzMgzjYodYWSnipsF3dW2ZKWGViLaaaZtX0fcujcf8l
	KNmGYR+fNbrqvuft0ZA/Q8QMPzKIzYL90efDJo+3rAQFwtJ69PVH0O9+Mh/ojflQ0jBSTwTrmV3f9
	2VYHdpwJl4MPiDmwt2rFYJHqwnzKtxBDGzXp3l25ndir0QSnhCWwAbAMyepFWzrsYlrEoqU8f9/oY
	zO30PiOzcJ5VFyeYJpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAtb-00BdMk-1p;
	Thu, 07 Sep 2023 09:01:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAtX-00BdLJ-2A
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 09:01:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401bdff4cb4so7865515e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694077304; x=1694682104; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SUKo+1CllhDiFuk8e5kRvChp7TbG5sdYIOTqTfNiyNA=;
        b=I0ZKiHAsLvK1vztkXhF0HfhkwTTTIamZa3zTviwyujnU0lXrYSiMYB3o4eyBdq5Qyo
         3NBO2SBCWO0+0TABthaj9BJ61Vj+TSo1vBEa+NU1ygl7uxYIrIUTdIEiNh35U2LAPq9o
         +vBAgMY8j6gcfwDUYq01aZobOho1cYHxK+pSD0mS52ye/GsQb/KgK//S8yfwMfxWazSg
         m0nh/r/0STENE9cWN8DnUqs7UPAgGZcX+xObFDLHrCT5Ue2BNZF+PxuuJgj1pUIdRf7w
         i6wxNW667tqKPdvwtc6BSkRoeGWCY98PyDgkhVDkdjMkjZ9tq14E+LYk1Kww1+52bSI9
         /yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694077304; x=1694682104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUKo+1CllhDiFuk8e5kRvChp7TbG5sdYIOTqTfNiyNA=;
        b=kL/oUc3g/3sZZ/bEo5uWPQq98otfGuYIe3IZwLZIxjo8HtLTE1XIsvj/unRjBHRb2o
         gllPVbGe/wM5WNibRTgATA8Uesu422TZG8QjjOpAWhaIWz24otJeZ5KxrpN4QcCNO2Yb
         0VEop/eujfkZFJeGKj4EgArEsf2U/hlcLNAxIx+rcze3JQJ7vUWk9zQ9WiItrmhb2UOG
         vEFKAw2lIRKO2CJxwBg1k7UprbMyjFfmQj1iHSMVeRRUxvgNcGcut6A4ADimZg9WsU+h
         ki8ttZ0+q7Q7DVby6veZRXE/EPJHRvlHraPcOOVhw8F7iSYgm6TOIBuojOZg3bbXDzB/
         MM3w==
X-Gm-Message-State: AOJu0YyCUJGyXQn7QNJI8ULyOhN4GncFjvrWW6jaeuiSxtDplmbTXugs
	cRkoCyQOXOosUMN0uA/VHblXIA==
X-Google-Smtp-Source: AGHT+IFpt5OHjqn8E5AQWQ3lRTTwlRHl603sQrss7nLMvcblN8lMTU9C4YqIhqBmSU5t7umjGBWQQA==
X-Received: by 2002:a7b:c414:0:b0:3fe:f74c:b4f6 with SMTP id k20-20020a7bc414000000b003fef74cb4f6mr4055831wmi.17.1694077304089;
        Thu, 07 Sep 2023 02:01:44 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s13-20020a7bc38d000000b003fe24441e23sm1882132wmj.24.2023.09.07.02.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:01:43 -0700 (PDT)
Date: Thu, 7 Sep 2023 11:01:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wchen <waylingii@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Jim Mattson <jmattson@google.com>, Lei Wang <lei4.wang@intel.com>, 
	Vipin Sharma <vipinsh@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Like Xu <likexu@tencent.com>, Peter Gonda <pgonda@google.com>, Thomas Huth <thuth@redhat.com>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, David Woodhouse <dwmw@amazon.co.uk>, 
	Michal Luczaj <mhal@rbox.co>, Paul Durrant <paul@xen.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 7/8] KVM: riscv: selftest: Change vcpu_has_ext to a
 common function
Message-ID: <20230907-bde62d037a3aaeedfe31f964@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <b6ef1b031e3a581f481cf19a26623388163444b4.1693659382.git.haibo1.xu@intel.com>
 <20230904-aa8b0d8d23d391586686038a@orel>
 <CAJve8ok5cU+h1K+WJ+aDpB+u+PBo8XosUyyVbMGy-xR0XiWFdw@mail.gmail.com>
 <CAJve8om+dLcG+4trDfG1yx8vhj52RhPZrJoF-emWDX+OPM088A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8om+dLcG+4trDfG1yx8vhj52RhPZrJoF-emWDX+OPM088A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_020147_712162_4E137E13 
X-CRM114-Status: GOOD (  22.69  )
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

T24gVGh1LCBTZXAgMDcsIDIwMjMgYXQgMTE6NTc6MDBBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCA2OjEw4oCvUE0gSGFpYm8gWHUgPHhpYW9ibzU1eEBn
bWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgU2VwIDQsIDIwMjMgYXQgMTA6MDTigK9Q
TSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gU2F0LCBTZXAgMDIsIDIwMjMgYXQgMDg6NTk6MjlQTSArMDgwMCwgSGFpYm8gWHUgd3Jv
dGU6Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNj
di9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQt
cmVnLWxpc3QuYwo+ID4gPiA+IGluZGV4IGQ4ZWNhY2QwM2VjZi4uYzQwMjhiZjMyZTNmIDEwMDY0
NAo+ID4gPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVn
LWxpc3QuYwo+ID4gPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9n
ZXQtcmVnLWxpc3QuYwo+ID4gPiA+IEBAIC00NCwyMCArNDQsNiBAQCBib29sIGNoZWNrX3JlamVj
dF9zZXQoaW50IGVycikKPiA+ID4gPiAgICAgICByZXR1cm4gZXJyID09IEVJTlZBTDsKPiA+ID4g
PiAgfQo+ID4gPiA+Cj4gPiA+ID4gLXN0YXRpYyBpbmxpbmUgYm9vbCB2Y3B1X2hhc19leHQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgZXh0KQo+ID4gPiA+IC17Cj4gPiA+ID4gLSAgICAgaW50
IHJldDsKPiA+ID4gPiAtICAgICB1bnNpZ25lZCBsb25nIHZhbHVlOwo+ID4gPiA+IC0KPiA+ID4g
PiAtICAgICByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9JU0FfRVhUX1JFRyhleHQp
LCAmdmFsdWUpOwo+ID4gPiA+IC0gICAgIGlmIChyZXQpIHsKPiA+ID4gPiAtICAgICAgICAgICAg
IHByaW50ZigiRmFpbGVkIHRvIGdldCBleHQgJWQiLCBleHQpOwo+ID4gPiA+IC0gICAgICAgICAg
ICAgcmV0dXJuIGZhbHNlOwo+ID4gPiA+IC0gICAgIH0KPiA+ID4gPiAtCj4gPiA+ID4gLSAgICAg
cmV0dXJuICEhdmFsdWU7Cj4gPiA+Cj4gPiA+IGdldC1yZWctbGlzdCB3aWxsIG5vdyBhc3NlcnQg
b24gZ2V0LXJlZyB3aGVuIGFuIGV4dGVuc2lvbiBpc24ndCBwcmVzZW50LAo+ID4gPiByYXRoZXIg
dGhhbiBmYWlsaW5nIHRoZSBfX1RFU1RfUkVRVUlSRSgpLCB3aGljaCB3b3VsZCBkbyBhIHNraXAg
aW5zdGVhZC4KPiA+ID4gV2UgbmVlZCBib3RoIHRoZSByZXR1cm4gZmFsc2UgdmVyc2lvbiBhbmQg
dGhlIGFzc2VydCB2ZXJzaW9uLgo+ID4gPgo+ID4KPiA+IE9rLCBXaWxsIGtlZXAgdGhpcyBvbmUg
Zm9yIGdldC1yZWctbGlzdCBhbmQgYWRkIGFub3RoZXIgb25lIGZvcgo+ID4gYXJjaC10aW1lciBz
cGVjaWZpYyB1c2FnZS4KPiA+Cj4gCj4gSnVzdCB0aG91Z2h0IGFib3V0IGl0IGFnYWluLCBtYXli
ZSB3ZSBvbmx5IG5lZWQgdGhlICJyZXR1cm4gZmFsc2UiCj4gdmVyc2lvbiBmb3IgYm90aCBnZXQt
cmVnLWxpc3QKPiBhbmQgYXJjaC10aW1lciB0ZXN0cyBzaW5jZSBpZiBhbiBleHRlbnNpb24gd2Fz
IG5vdCBhdmFpbGFibGUsIHRoZSB0ZXN0Cj4gY2FuIGJlIHNraXBwZWQgd2l0aCBhIG1lc3NhZ2Uu
Cj4gCj4gYm9vbCB2Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgZXh0KQo+
IHsKPiAgICAgICAgdW5zaWduZWQgbG9uZyB2YWx1ZSA9IDA7Cj4gCj4gICAgICAgIF9fdmNwdV9n
ZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKGV4dCksICZ2YWx1ZSk7Cj4gCj4gICAgICAg
IHJldHVybiAhIXZhbHVlOwo+IH0KCll1cCwgSSBoYWQgYWN0dWFsbHkgc2VlbiB0aGF0IHdoZW4g
cmV2aWV3aW5nIGEgbGF0ZXIgcGF0Y2ggaW4gdGhpcyBzZXJpZXMsCmJ1dCBJIHdhc24ndCBjb25j
ZXJuZWQgaWYgd2UgYWRkZWQgdGhlIGFzc2VydCB0eXBlIGFueXdheSwgc2luY2Ugd2UKZnJlcXVl
bnRseSBlbmQgdXAgd2l0aCB0aGUgdHdvIGZ1bmN0aW9uIHR5cGVzIGZvciBLVk0gcXVlcmllcy4g
SWYgd2UgZG9uJ3QKaGF2ZSBhIG5lZWQgZm9yIGFuIGFzc2VydCB0eXBlIHlldCwgdGhlbiB3ZSBk
b24ndCBuZWVkIHRvIGludHJvZHVjZSBpdC4KSG93ZXZlciwgd2Ugc2hvdWxkIGludHJvZHVjZSB0
aGUgbm9uLWFzc2VydCB0eXBlIGFzIF9fdmNwdV9oYXNfZXh0KCksCnJlc2VydmluZyB0aGUgdmNw
dV9oYXNfZXh0KCkgbmFtZSBmb3IgdGhlIGFzc2VydCB0eXBlLCBwZXIgdGhlIGt2bQpzZWxmdGVz
dHMgbmFtaW5nIGNvbnZlbnRpb24uCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
