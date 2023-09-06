Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAFFEB8FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 07:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ek56M8i66IffPK3xZM5gQX6NtF5/9hZsQmVI4b3XC1M=; b=cOk0jIi7Gd/zHf
	NjvD1A9OGrFiA6OiAUyPT+x+OVtbexImdWW8Vk3inleW2FP/L91NXR+pXGwxfqzqPSKNkyh1FVThx
	sUeCr+y35SJgD4yevQNet70WjX3eGGEEVyw31SBMBxdkiI6gT89rWaQ8r7cMbFBwFqcir7RpVLYBl
	DicNh1UumTJjiGLjyZ14aboIJw18vdQzkApFq6/Nxpj4bDXkocgwdwGt5c3bVzXnQDGund+7HF5Ye
	jC97vx7GNBJEbyuSGTgBw3ryw9xR8iHJzjC2wScGE5vMro1xHdVBPdNVkUc2Pg7sH2kWg2i8OAVtW
	56hXUa/dcz5PhLExpmXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmY4-007QoM-1e;
	Wed, 06 Sep 2023 07:02:00 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmY1-007Qmm-0S
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 07:01:58 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31c93d2a24fso2596050f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 00:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693983714; x=1694588514; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7a/rYlLL01jELhspFfU/LX4lJTwK+IpYr9KpIjgxodg=;
        b=K8kW5HDpQHvtXoSPWcbc/qPUe0yz85LczBMDOJSeHklihtVJU0Joj8muXXwJmXooSF
         knOBxs63GD+SYdBwQz6D+azRuusaPG98srgSQ0cs4dlg8DUpIDuHm3mPwZpIYQfY6lnI
         Xl9e12yvAhdAgMGkqC4cjiUwTYAijtQVsRt+q7jzlmuvRhVh894xQQ/SklIFKicwgfG8
         pp5Hc53bftzss3FVq/fYvOMdfs6g+0VhlrAMrn+GaNMe63ztNBAay8VOpJXcqmy4Vniz
         Dk4AXOLP/h6+hoEPHuh/uofHffm62/UShFJHl34zo0ri2pRbEPNwu5M71NypFivaiJBc
         aN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693983714; x=1694588514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7a/rYlLL01jELhspFfU/LX4lJTwK+IpYr9KpIjgxodg=;
        b=bHV6DjBwAvNMach/evYJ/0chJ6NuGNvGbZ8WiInuhc0Z5Uq2ay14JwgL+P4QZB11fl
         Q8UCYLuUkJrYL3xoVSc5OgVoW+R1KD2kzgRi+ojenyud5RHdms9FR+OKOshVw+42H5Zi
         6E2NwxJuOtrb5up3KBCMPdGjDwkWspopbhGVnjkD+YxLvaUvDh7m/vO22I/qphFhK8tx
         sUR+OQKdGOerZclnDeZsVFzi/SceW7W56CHRLr7oMt4R5PQgbNuX7BPSqpH41INhn4ks
         TNKDqpyLXPdR7zmeZ2XWfaBgoN7k7FNot/fyR+4rC4T99Dyj0Wca+2QkGkhrLMVY2ahv
         p/kA==
X-Gm-Message-State: AOJu0Yww5+kYVpjg3uBBvIxEZHnfMQ8ypH9jF7dTI6nHR2OksRPXMF1q
	RvA+j0QMExdMK+qJ2M2NQ9PX1g==
X-Google-Smtp-Source: AGHT+IH5D+U+nZV7Ok6E7RGjtfz50olmDnpckxh8umsRSqUfH3ZIM1q14NQMvG0C714ykQWhmjyeJw==
X-Received: by 2002:adf:e7d0:0:b0:31c:8151:86a9 with SMTP id e16-20020adfe7d0000000b0031c815186a9mr1273125wrn.67.1693983713483;
        Wed, 06 Sep 2023 00:01:53 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d4805000000b003197c7d08ddsm19530729wrq.71.2023.09.06.00.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 00:01:52 -0700 (PDT)
Date: Wed, 6 Sep 2023 09:01:51 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Sean Christopherson <seanjc@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, David Matlack <dmatlack@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Lei Wang <lei4.wang@intel.com>, Like Xu <likexu@tencent.com>, Peter Gonda <pgonda@google.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, David Woodhouse <dwmw@amazon.co.uk>, 
	Michal Luczaj <mhal@rbox.co>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/8] KVM: arm64: selftest: Split arch_timer test code
Message-ID: <20230906-3f0318fa20365f9211998bae@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <c87337cfd7fb135e2efed589360a78c26a402eac.1693659382.git.haibo1.xu@intel.com>
 <20230904-11e853ffe3d8e9cf9ec6079d@orel>
 <CAJve8onwjBQcbVy75qyOF3A51-T0WyBkmeCV_wOZvzaPcrBVFg@mail.gmail.com>
 <CAJve8ok-zZAG7T3t5XD-CtJn47tTE867Xaaw_YHYy1XmUL41rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8ok-zZAG7T3t5XD-CtJn47tTE867Xaaw_YHYy1XmUL41rw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_000157_182188_526A1179 
X-CRM114-Status: GOOD (  17.77  )
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

T24gV2VkLCBTZXAgMDYsIDIwMjMgYXQgMTE6NDQ6MjZBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAxMDoxNOKAr0FNIEhhaWJvIFh1IDx4aWFvYm81NXhA
Z21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIFNlcCA0LCAyMDIzIGF0IDk6MjTigK9Q
TSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKLi4uCj4gPiA+
ID4gKwo+ID4gPiA+ICtlbnVtIGd1ZXN0X3N0YWdlIHsKPiA+ID4gPiArICAgICBHVUVTVF9TVEFH
RV9WVElNRVJfQ1ZBTD0xLAo+ID4gPiA+ICsgICAgIEdVRVNUX1NUQUdFX1ZUSU1FUl9UVkFMLAo+
ID4gPiA+ICsgICAgIEdVRVNUX1NUQUdFX1BUSU1FUl9DVkFMLAo+ID4gPiA+ICsgICAgIEdVRVNU
X1NUQUdFX1BUSU1FUl9UVkFMLAo+ID4gPiA+ICsgICAgIEdVRVNUX1NUQUdFX01BWCwKPiA+ID4g
PiArfTsKPiA+ID4KPiA+ID4gVGhpcyBlbnVtIGFsc28gYmVsb25ncyBpbiBhYXJjaDY0L2FyY2hf
dGltZXIuYwo+ID4gPgo+ID4KPiA+IFllcywgaXQgc2hvdWxkIGJlIGluIGFhcmNoNjQvYXJjaF90
aW1lci5jCj4gPgo+IAo+IEFmdGVyIG1vdmluZyB0aGUgYWJvdmUgZW51bSBkZWZpbml0aW9uIHRv
IGFhcmNoNjQvYXJjaF90aW1lci5jLCB0aGUKPiBiZWxvdyBlcnJvcnMgd2FzIHJlcG9ydGVkCj4g
d2hpbGUgY29tcGlsaW5nIGt2bS9hcmNoX3RpbWVyLm8KPiAKPiBpbmNsdWRlL3RpbWVyX3Rlc3Qu
aDozNzoyNjogZXJyb3I6IGZpZWxkIOKAmGd1ZXN0X3N0YWdl4oCZIGhhcyBpbmNvbXBsZXRlIHR5
cGUKPiAgICAzNyB8ICAgICAgICAgZW51bSBndWVzdF9zdGFnZSBndWVzdF9zdGFnZTsKPiAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4K
PiAKPiBTaW5jZSBrdm0vYXJjaF90aW1lci5jIHdhcyBpbmRlcGVuZGVudCBvZiBrdm0vYWFyY2g2
NC9hcmNoX3RpbWVyLmMKPiBkdXJpbmcgT0JKIGNvbXBpbGluZywKPiBJIHRoaW5rIGl0IG1heSBi
ZSBub3QgcG9zc2libGUgdG8gbW92ZSB0aGUgZW51bSBkZWZpbml0aW9uIHRvCj4gYWFyY2g2NC9h
cmNoX3RpbWVyLmMKPiAKPiBJZiB3ZSBrZWVwIHRoZSBkZWZpbml0aW9uIGluIHRoaXMgaGVhZGVy
IGZpbGUsIHdlIGNhbiBlbmNsb3NlIGl0IHdpdGgKPiAjaWZkZWYgX19hYXJjaDY0X18gZm9yIGFh
cmNoNjQgb25seS4KPgoKTGV0J3MgY2hhbmdlIHN0cnVjdCB0ZXN0X3ZjcHVfc2hhcmVkX2RhdGEg
dG8KCiBzdHJ1Y3QgdGVzdF92Y3B1X3NoYXJlZF9kYXRhIHsKICAgICAgICBpbnQgbnJfaXRlcjsK
ICAgICAgICBpbnQgZ3Vlc3Rfc3RhZ2U7CiAgICAgICAgdWludDY0X3QgeGNudDsKIH07CgphbmQg
dGhlbiBsZXQgdGhlIGFhcmNoNjQgY29kZSB0cmVhdCBndWVzdF9zdGFnZSBhcyBhbiBlbnVtIGFu
ZCB0aGUgcmlzY3YKY29kZSBjYW4gY29tcGxldGVseSBpZ25vcmUgaXQgKG5vIG5lZWQgdG8gY3Jl
YXRlIGFuIHVudXNlZCBlbnVtKS4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
