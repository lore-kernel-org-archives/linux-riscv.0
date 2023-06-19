Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05A1EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Bre8iGMWEyTzng0Uv8/D009dkJBHFegDWuHFiTf2qk=; b=wQa7aYwR8T3rK+
	8ZFRJYPy1d8AwDrSfZoyomTosNEAmdhRWVvJ1nwv0vXF66qtyfeua4CK+TEa2HO/Qa9z9uqPnjG/+
	d0B94YuNKPIdsk0dU4vqnb6nTxT4vL6OTlWc9EqQYVy76t1Jf32SzjZ25KY+JxTf79q2PygotFmQj
	wKWHAijQeR/3k4LneG2lNWggHN46wmUvpRG+G3Ak2N8GTr6e2CrMZNtXL5zTqKnFFowc9zbZqcvCn
	KdrCybFoKnjY9Uyx4BWE3wP1tB7iOvb2lF877Dm1iAdVioevmyWncA2Vhsoz0HULTrNP/0/ut0YNz
	2qb3NCiCKPx+tfYODDvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBFYs-008cDh-0y;
	Mon, 19 Jun 2023 14:08:54 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBFYp-008cCr-0F
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 14:08:52 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b46d4e1b0aso26422191fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687183728; x=1689775728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qxdbmd0dtQii5u90bRB5V0bWnJ9bzdUnyOROyNZnIhw=;
        b=E3mHbkSB27JCa80iuDg8Vr+HPDpn+9g2v80cy0b4U+fdHCR+jd4kcf1ocbg4WgNaYt
         vrmWCsbpqDVHCAkR1SRvsl6ap3KOgtCw0JSPkVc6MP/ngJygwhyMsmcmRgkX5sWlDeja
         qTJWuzfcpL13UNrhKtDV8VcRNoxMpxMkF/KCKV1jmmUmQCrJpwXBa7jKxtj8xN79xgYR
         p6laC0fZfvdKXJGyo2pJQs8jZONjf3M0PNwHpDkGMI5ygX8gfg5mZdnZwduuK85UmUWl
         ponUXKguiyioB0ID9zWl6K+WQ65AcC7zNbe1DbSer4WwfaZl0ivwKtjfkllPBDzt0eVk
         IjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687183728; x=1689775728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qxdbmd0dtQii5u90bRB5V0bWnJ9bzdUnyOROyNZnIhw=;
        b=RG8SMcYEVv3JqJjXn8oc+b/ZNpKlk1uJFnEf7kx5s75qon9pe+Ni6rOkIGb0P8R3Z1
         VebVcNxRUcDVKhsPiCGrG3sHCcIBfnDm7a3MdiX8383z3J+BNmzIPkB5reyxZwLl3w+H
         j65nNpd7u5GUnwhp575A/Q8dBnra7AR/4qKrc7C+ZYRVhfRu9FezvTDKXkoGbkZ+NHLd
         4ixqxPlVA7Zi21BoXBZ5Ie9k+KwQhenZHZIZF71VrMmS0Rt7CQNHGTbpld7bkxwU68xs
         aCaeabZvbuvnONspUhjnZUKv1PdKNjNnk+WFXnYM8X95B7c4XEhMVl4KLKQ5drSn8CfN
         1D5A==
X-Gm-Message-State: AC+VfDyLQSWQ40E93IDtEnkjHCLoCW2W0OrybVx/RkafrW8N6wVPDLKL
	GK2Hkn6Mp/VygE312muBrD03eU2OG6bbql0/DfECaA==
X-Google-Smtp-Source: ACHHUZ6sBGquxiFX0iVmiiTRyL/rAw03oe2SEkpL3A2oHs32rfSEJaiZC/HS7yWdWNL8sYG4PLshha23OYZRPARCmMw=
X-Received: by 2002:a2e:7003:0:b0:2b4:70b1:af01 with SMTP id
 l3-20020a2e7003000000b002b470b1af01mr2643840ljc.20.1687183728524; Mon, 19 Jun
 2023 07:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-3-eric.lin@sifive.com>
 <ae77d0ce-9a54-d779-daa2-c429631c8bb7@wanadoo.fr>
In-Reply-To: <ae77d0ce-9a54-d779-daa2-c429631c8bb7@wanadoo.fr>
From: Eric Lin <eric.lin@sifive.com>
Date: Mon, 19 Jun 2023 22:08:36 +0800
Message-ID: <CAPqJEFrX=ayJY-S+41Uk4TvEDAta_whSEq-P=Ef1Y4NsTzd8CA@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: sifive: Add SiFive private L2 cache PMU driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, maz@kernel.org, will@kernel.org, 
	nnac123@linux.ibm.com, pierre.gondois@arm.com, jgross@suse.com, 
	chao.gao@intel.com, maobibo@loongson.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dslin1010@gmail.com, 
	Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_070851_145176_21679F53 
X-CRM114-Status: GOOD (  17.53  )
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

SGkgQ2hyaXN0b3BoZSwKCk9uIFNhdCwgSnVuIDE3LCAyMDIzIGF0IDM6MDXigK9BTSBDaHJpc3Rv
cGhlIEpBSUxMRVQKPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPiB3cm90ZToKPgo+IExl
IDE2LzA2LzIwMjMgw6AgMDg6MzIsIEVyaWMgTGluIGEgw6ljcml0IDoKPiA+IEZyb206IEdyZWVu
dGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gPgo+ID4gVGhpcyBhZGRzIFNpRml2
ZSBwcml2YXRlIEwyIGNhY2hlIFBNVSBkcml2ZXIuIFVzZXIKPiA+IGNhbiB1c2UgcGVyZiB0b29s
IHRvIHByb2ZpbGUgYnkgZXZlbnQgbmFtZSBhbmQgZXZlbnQgaWQuCj4gPgo+ID4gRXhhbXBsZToK
PiA+ICQgcGVyZiBzdGF0IC1DIDAgLWUgL3NpZml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxv
Y2tfYnRvdC8KPiA+ICAgICAgICAgICAgICAgICAgLWUgL3NpZml2ZV9wbDJfcG11L2lubmVyX2Fj
cXVpcmVfYmxvY2tfbnRvYi8KPiA+ICAgICAgICAgICAgICAgICAgLWUgL3NpZml2ZV9wbDJfcG11
L2lubmVyX2FjcXVpcmVfYmxvY2tfbnRvdC8gbHMKPiA+Cj4gPiAgIFBlcmZvcm1hbmNlIGNvdW50
ZXIgc3RhdHMgZm9yICdDUFUocykgMCc6Cj4gPgo+ID4gICAgICAgICAgICAgICAgIDMwMCAgICAg
IHNpZml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxvY2tfYnRvdC8KPiA+ICAgICAgICAgICAg
ICAgMTc4MDEgICAgICBzaWZpdmVfcGwyX3BtdS9pbm5lcl9hY3F1aXJlX2Jsb2NrX250b2IvCj4g
PiAgICAgICAgICAgICAgICA1MjUzICAgICAgc2lmaXZlX3BsMl9wbXUvaW5uZXJfYWNxdWlyZV9i
bG9ja19udG90Lwo+ID4KPiA+ICAgICAgICAgMC4wODg5MTczMjYgc2Vjb25kcyB0aW1lIGVsYXBz
ZWQKPiA+Cj4gPiAkIHBlcmYgc3RhdCAtQyAwIC1lIC9zaWZpdmVfcGwyX3BtdS9ldmVudD0weDEw
MDAxLwo+ID4gICAgICAgICAgICAgICAgICAtZSAvc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHg0MDAx
Lwo+ID4gICAgICAgICAgICAgICAgICAtZSAvc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHg4MDAxLyBs
cwo+ID4KPiA+ICAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3IgJ0NQVShzKSAwJzoKPiA+
Cj4gPiAgICAgICAgICAgICAgICAgMjUxICAgICAgc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHgxMDAw
MS8KPiA+ICAgICAgICAgICAgICAgIDI2MjAgICAgICBzaWZpdmVfcGwyX3BtdS9ldmVudD0weDQw
MDEvCj4gPiAgICAgICAgICAgICAgICAgNjQ0ICAgICAgc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHg4
MDAxLwo+ID4KPiA+ICAgICAgICAgMC4wOTI4MjcxMTAgc2Vjb25kcyB0aW1lIGVsYXBzZWQKPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRXJpYyBMaW4gPGVyaWMubGluQHNpZml2ZS5jb20+Cj4gPiBS
ZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6
IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+IC0tLQo+Cj4gWy4uLl0KPgo+ID4gK2lu
dCBzaWZpdmVfcGwyX3BtdV9wcm9iZShzdHJ1Y3QgZGV2aWNlX25vZGUgICpwbDJfbm9kZSwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgdm9pZCBfX2lvbWVtICpwbDJfYmFzZSwgaW50IGNwdSkK
PiA+ICt7Cj4gPiArICAgICBzdHJ1Y3Qgc2lmaXZlX3BsMl9wbXVfZXZlbnQgKnB0ciA9IHBlcl9j
cHVfcHRyKCZzaWZpdmVfcGwyX3BtdV9ldmVudCwgY3B1KTsKPiA+ICsgICAgIGludCByZXQgPSAt
RUlOVkFMOwo+Cj4gTml0OiBubyBuZWVkIHRvIGluaXQKPgoKT0ssIEkgd2lsbCBmaXggaXQgaW4g
djIuCgo+ID4gKwo+ID4gKyAgICAgLyogR2V0IGNvdW50ZXIgbnVtYmVycy4gKi8KPiA+ICsgICAg
IHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBsMl9ub2RlLCAic2lmaXZlLHBlcmZtb24tY291
bnRlcnMiLCAmcHRyLT5jb3VudGVycyk7Cj4gPiArICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAg
ICAgICAgIHByX2VycigiTm90IGZvdW5kIHNpZml2ZSxwZXJmbW9uLWNvdW50ZXJzIHByb3BlcnR5
XG4iKTsKPiA+ICsgICAgICAgICAgICAgZ290byBlYXJseV9lcnI7Cj4gPiArICAgICB9Cj4gPiAr
ICAgICBwcl9pbmZvKCJwZXJmbW9uLWNvdW50ZXJzOiAlZCBmb3IgQ1BVICVkXG4iLCBwdHItPmNv
dW50ZXJzLCBjcHUpOwo+ID4gKwo+ID4gKyAgICAgLyogQWxsb2NhdGUgcGVyZl9ldmVudC4gKi8K
PiA+ICsgICAgIHB0ci0+ZXZlbnRzID0ga2NhbGxvYyhwdHItPmNvdW50ZXJzLCBzaXplb2Yoc3Ry
dWN0IHBlcmZfZXZlbnQpLCBHRlBfS0VSTkVMKTsKPiA+ICsgICAgIGlmICghcHRyLT5ldmVudHMp
Cj4gPiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gKyAgICAgcHRyLT5l
dmVudF9zZWxlY3RfYmFzZSA9IHBsMl9iYXNlICsgU0lGSVZFX1BMMl9TRUxFQ1RfQkFTRV9PRkZT
RVQ7Cj4gPiArICAgICBwdHItPmV2ZW50X2NvdW50ZXJfYmFzZSA9IHBsMl9iYXNlICsgU0lGSVZF
X1BMMl9DT1VOVEVSX0JBU0VfT0ZGU0VUOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFwbDJwbXVfaW5p
dF9kb25lKSB7Cj4gPiArICAgICAgICAgICAgIHJldCA9IHBlcmZfcG11X3JlZ2lzdGVyKHNpZml2
ZV9wbDJfcG11LnBtdSwgc2lmaXZlX3BsMl9wbXUucG11LT5uYW1lLCAtMSk7Cj4gPiArICAgICAg
ICAgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjcHVocF9zdGF0ZV9y
ZW1vdmVfaW5zdGFuY2UoQ1BVSFBfQVBfUEVSRl9SSVNDVl9TSUZJVkVfUEwyX1BNVV9PTkxJTkUs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZz
aWZpdmVfcGwyX3BtdS5ub2RlKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwcl9lcnIoIkZh
aWxlZCB0byByZWdpc3RlciBzaWZpdmVfcGwyX3BtdS5wbXU6ICVkXG4iLCByZXQpOwo+ID4gKyAg
ICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgIHNpZml2ZV9wbDJfcG11X3BtX2luaXQoKTsK
PiA+ICsgICAgICAgICAgICAgcGwycG11X2luaXRfZG9uZSA9IHRydWU7Cj4gPiArICAgICB9Cj4g
PiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICtlYXJseV9lcnI6Cj4gPiArICAgICBy
ZXR1cm4gcmV0Owo+ID4gK30KPiA+ICsKPiA+ICtpbnQgc2lmaXZlX3BsMl9wbXVfaW5pdCh2b2lk
KQo+ID4gK3sKPiA+ICsgICAgIGludCByZXQgPSAwOwo+Cj4gTml0OiBubyBuZWVkIHRvIGluaXQK
Ck9LLCBJIHdpbGwgZml4IGl0IGluIHYyLgoKPgo+ID4gKwo+ID4gKyAgICAgcmV0ID0gY3B1aHBf
c2V0dXBfc3RhdGVfbXVsdGkoQ1BVSFBfQVBfUEVSRl9SSVNDVl9TSUZJVkVfUEwyX1BNVV9PTkxJ
TkUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicGVyZi9zaWZpdmUv
cGwycG11Om9ubGluZSIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
aWZpdmVfcGwyX3BtdV9vbmxpbmVfY3B1LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2lmaXZlX3BsMl9wbXVfb2ZmbGluZV9jcHUpOwo+ID4gKyAgICAgaWYgKHJldCkK
PiA+ICsgICAgICAgICAgICAgcHJfZXJyKCJGYWlsZWQgdG8gcmVnaXN0ZXIgQ1BVIGhvdHBsdWcg
bm90aWZpZXIgJWRcbiIsIHJldCk7Cj4gPiArCj4gPiArICAgICByZXQgPSBjcHVocF9zdGF0ZV9h
ZGRfaW5zdGFuY2UoQ1BVSFBfQVBfUEVSRl9SSVNDVl9TSUZJVkVfUEwyX1BNVV9PTkxJTkUsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnNpZml2ZV9wbDJfcG11Lm5v
ZGUpOwo+ID4gKyAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgcHJfZXJyKCJGYWlsZWQg
dG8gYWRkIGhvdHBsdWcgaW5zdGFuY2U6ICVkXG4iLCByZXQpOwo+ID4gKwo+ID4gKyAgICAgcmV0
dXJuIHJldDsKPgo+IE5pdDogcmV0dXJuIDA7CgpPSywgSSB3aWxsIGZpeCBpdCBpbiB2Mi4KClRo
YW5rcyBmb3IgeW91ciByZXZpZXcuCgpCZXN0IHJlZ2FyZHMsCkVyaWMgTGluCgo+Cj4gPiArfQo+
Cj4gWy4uLl0KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
