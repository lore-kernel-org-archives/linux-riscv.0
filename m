Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA59C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 07:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3rLVhBL+TkueDJK3zv6RG8cr7Ir63yNZTDhDaCDkeQ=; b=yFC0uWHoc7VK9F
	9Gc/OmjZF7U1aG4HssyysL9SD/4+PcyW4e5S+mVvEe1XvMVpt7bZw5bt4aqa6uGDYpnyoKkA195wh
	5L5FpqLZaHiGEbsD3G0u3XL5gYJpr/P9fLhFfVxxd+uNEOxZA+krZ5qjp90Z9eYZO9IYFAkwgyeWO
	KpcZbn+j7HpOt2KmDgbjnyrkV54B1bh5IMav5xhoixhhcK/hlP0i8zErhtsPUYywCv2Z3wOzetPRI
	N/kRFFh9KQxhqRACaM2f7okBtVtXB2cX6WR5GwDLvTGvlWMYuVThbRQBmVUrqsd++rihPx6T6NiOh
	wii0Yt0lKSjbqDhcB6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3X01-009ULG-1g;
	Mon, 29 May 2023 07:09:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Wzy-009UIy-1w
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 07:08:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f603ff9c02so18980945e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 May 2023 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685344133; x=1687936133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J9yQZI29FBb5uk90C946uFQGVpaFZWwP+axkfkJPRmA=;
        b=OGzmkwym+ds5lNbK7+lHCLxUguUfy0QTJ/UI2yLcw74+JBxqixt+zmx3lNyihLZ/qW
         Rrl7u4zd2ZxT7qCL27Mau576RJoJ1CiSa0kWXOUmjHxKhQMPTfGNSIi0byquj1Nki8n7
         cCB+xb/M+P51G/dtVskzHEkGHBRc60UcS6xABlKWzdN9VqozEbcdLXxh/0kiL9B4u4h8
         S557VMaZShp76FvJQOnFzyQD/SYCQVb+/87pTopt7EtnK3a3prWQRrU/9gyxDitIX4ea
         07jX2bKWoC2ai9FXbUtUjmVHAPupvol8Q7kZEcQ8Ii51pvvXXPZUzSPTvb6/hRgb3eYL
         SuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685344133; x=1687936133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9yQZI29FBb5uk90C946uFQGVpaFZWwP+axkfkJPRmA=;
        b=la4HZbQA4h1hVLcb0TB2dWzDaGYowFkPF3dpgv3iSamzpwIB1s09VZ+ghtThwJIBZ8
         8TUnOuS/2qtkDuzbZL9gxNWPsMoy8J9nC8GdLKC0CUf0HX+HKxQG8B/PL8bCcC/O5Ffu
         WhQyZU+S0L/xOzC4u2N+17LGHjoUsflSNjNSl1nyyXwPCTIUdt0nXuw20QCnoBzKSlEI
         Vcg/mvydnmGInHblLwCRzd3NOkjQsBP+FiohhuMlShUxs2W/V33BGw3eZVWcpFR35nqR
         Mh8BxtQwQ/d6iyvN8g8WYvQr+UbppNXPqP0xb9hisRSFiaEAFQsB5HdfF9RGAVxwl1rl
         6zSQ==
X-Gm-Message-State: AC+VfDwYp4dFuVvgASb4yHmUbwF2qdk3ZsBvFEuGspgqutO6lqphRXfs
	MdFVvKnP4KcfXdwHszEf/8eimg==
X-Google-Smtp-Source: ACHHUZ73LyzFhpd/6+sfi011A/EFvj9Fd34HsRwL8GCzpeQu6/GsXCR3FkDg7Ni/nfr2tAz4KOAc6A==
X-Received: by 2002:a1c:f616:0:b0:3f6:82a:5d1b with SMTP id w22-20020a1cf616000000b003f6082a5d1bmr9377055wmc.34.1685344132851;
        Mon, 29 May 2023 00:08:52 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m17-20020a056000009100b0030ae973c2e7sm3092863wrx.83.2023.05.29.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 00:08:52 -0700 (PDT)
Date: Mon, 29 May 2023 09:08:51 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 11/11] KVM: riscv: selftests: Add get-reg-list test
Message-ID: <20230529-7b3e41e6aca55f9e90dd6cd3@orel>
References: <cover.1684999824.git.haibo1.xu@intel.com>
 <da390e6200e838fce320a2a43b2f87951b4e0bbb.1684999824.git.haibo1.xu@intel.com>
 <20230525-2bab5376987792eab73507ac@orel>
 <CAJve8o=5ji5D-S8k+GaGd7sH7KXNWxDaWhD3jyxtHizKSMtjbA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8o=5ji5D-S8k+GaGd7sH7KXNWxDaWhD3jyxtHizKSMtjbA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_000858_678913_F453E23A 
X-CRM114-Status: GOOD (  15.57  )
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

T24gU2F0LCBNYXkgMjcsIDIwMjMgYXQgMTI6Mzk6NTdQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMToxOOKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0
IDAzOjM4OjM1UE0gKzA4MDAsIEhhaWJvIFh1IHdyb3RlOgouLi4KPiA+ID4gKyAgICAgS1ZNX1JF
R19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NPUkUgfCBLVk1fUkVH
X1JJU0NWX0NPUkVfUkVHKHJlZ3MuYTYpLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZN
X1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ09SRSB8IEtWTV9SRUdfUklTQ1ZfQ09SRV9S
RUcocmVncy5hNyksCj4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0
IHwgS1ZNX1JFR19SSVNDVl9DT1JFIHwgS1ZNX1JFR19SSVNDVl9DT1JFX1JFRyhyZWdzLnMyKSwK
PiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJ
U0NWX0NPUkUgfCBLVk1fUkVHX1JJU0NWX0NPUkVfUkVHKHJlZ3MuczMpLAo+ID4gPiArICAgICBL
Vk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ09SRSB8IEtW
TV9SRUdfUklTQ1ZfQ09SRV9SRUcocmVncy5zNCksCj4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1Yg
fCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DT1JFIHwgS1ZNX1JFR19SSVNDVl9D
T1JFX1JFRyhyZWdzLnM1KSwKPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0la
RV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NPUkUgfCBLVk1fUkVHX1JJU0NWX0NPUkVfUkVHKHJlZ3Mu
czYpLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9S
RUdfUklTQ1ZfQ09SRSB8IEtWTV9SRUdfUklTQ1ZfQ09SRV9SRUcocmVncy5zNyksCj4gPiA+ICsg
ICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DT1JF
IHwgS1ZNX1JFR19SSVNDVl9DT1JFX1JFRyhyZWdzLnM4KSwKPiA+ID4gKyAgICAgS1ZNX1JFR19S
SVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NPUkUgfCBLVk1fUkVHX1JJ
U0NWX0NPUkVfUkVHKHJlZ3MuczkpLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JF
R19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ09SRSB8IEtWTV9SRUdfUklTQ1ZfQ09SRV9SRUco
cmVncy5zMTApLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8
IEtWTV9SRUdfUklTQ1ZfQ09SRSB8IEtWTV9SRUdfUklTQ1ZfQ09SRV9SRUcocmVncy5zMTEpLAo+
ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklT
Q1ZfQ09SRSB8IEtWTV9SRUdfUklTQ1ZfQ09SRV9SRUcocmVncy50MyksCj4gPiA+ICsgICAgIEtW
TV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DT1JFIHwgS1ZN
X1JFR19SSVNDVl9DT1JFX1JFRyhyZWdzLnQ0KSwKPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8
IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NPUkUgfCBLVk1fUkVHX1JJU0NWX0NP
UkVfUkVHKHJlZ3MudDUpLAo+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpF
X1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ09SRSB8IEtWTV9SRUdfUklTQ1ZfQ09SRV9SRUcocmVncy50
NiksCj4gPgo+ID4gLi4uYWxsIHRoZSBhYm92ZSB3b3VsZCBqdXN0IGJlIGluZGljZXMgcmF0aGVy
IHRoYW4gbmFtZWQgcmVnaXN0ZXJzLiBJCj4gPiBndWVzcyB0aGF0J3MgYmV0dGVyIGZvciB0aGVz
ZSByZWdpc3RlcnMuCj4gPgo+IAo+IFlvdSBtZWFuIHRvIHNob3cgaXQgYXMgS1ZNX1JFR19SSVND
Vl9DT1JFX1JFRyhyZWdzLnJlZ3NbMF0pIC4uLgo+IEtWTV9SRUdfUklTQ1ZfQ09SRV9SRUcocmVn
cy5yZWdzWzMxXSk/Cj4KCkknbSBPSyB3aXRoIHRoZXNlIHJlZ2lzdGVycyB1c2luZyB0aGVpciBu
YW1lcyBpbiB0aGlzIGxpc3QsIGl0IGRvZXMgbG9vawpiZXR0ZXIuIEhvd2V2ZXIgdGhlIG9yaWdp
bmFsIGlkZWEgZm9yIHRoZXNlIGxpc3RzIHdhcyB0aGF0IHRoZXkgd291bGQgYmUKZ2VuZXJhdGVk
IGZyb20gcHJpbnRfcmVnKCkuIEluIHRoaXMgY2FzZSwgcHJpbnRfcmVnKCkgaXMgZ2VuZXJhdGlu
ZyB0aGVtCndpdGggdGhlaXIgbnVtYmVyIGluc3RlYWQgb2YgbmFtZS4gRWl0aGVyIHByaW50X3Jl
ZygpIGNvdWxkIGxlYXJuIGhvdyB0bwpnZW5lcmF0ZSB0aGVpciBuYW1lcyBieSBoYW5kbGluZyB0
aGUgb2Zmc2V0IHJhbmdlcyBvZiBlYWNoIHJlZ2lzdGVyIHR5cGUsCmUuZy4KCnN3aXRjaCAocmVn
X29mZikgewpjYXNlIDEwIC4uLiAxNzoKICAgc3RyZHVwX3ByaW50ZigiLi4uIEtWTV9SRUdfUklT
Q1ZfQ09SRV9SRUcocmVncy5hJWQpLCIsIHJlZ19vZmYgLSAxMCk7CgpvciB3ZSBjYW4gdXNlIHRo
ZSBudW1iZXJzIGhlcmUgaW4gdGhpcyBsaXN0LCBvciB3ZSBjYW4gbGVhdmUgaXQgYXMgeW91Cmhh
dmUgaXQgKGkuZS4gZG9uZSBtYW51YWxseSkuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
