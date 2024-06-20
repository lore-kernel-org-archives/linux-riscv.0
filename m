Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A856DC2BA1A
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 01:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFiumOABgf9IYVbucHIDj/Fjyuiyf5A9/Avf2lCPZDI=; b=XnCNGJG/7TBaCa
	ULaiPc7rAXgRP/X1Lhpg4uc3/D1nZ3/XS93ZjoYSiPIXCHA4gC2XwGP9xelh9OHo2QOZj00h7Y6NH
	t5xaWdSpGgBYOKiIBu+qW4KJ6Xy4vS49pGiH2oFvtBtgQKtAoZMjJoCQpqHxYqRDis+TQJIBS20Sa
	dSsexPFz80yFbCIwEUyTv6xSEmaUjgwjAebL8kQQM6aoKP8rU0letDtsBLFniwD6Q16ZfiiZ/yB3z
	mKVde08q9nA0/j/4MZ9Ys0elixh9eoGJZRWCtMy2hNGVjsYgGz4BH37X+On4pLEIl1q5wu7s8lrNf
	Mk0+9x1TnjVYnIiYDXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK6bO-00000003Flc-1Df0;
	Thu, 20 Jun 2024 01:28:38 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK6bH-00000003Fhz-43F9
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 01:28:37 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-25cae7464f5so246348fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 18:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718846909; x=1719451709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/ekbBeZLQlbT2zg5ACeIcCnuktUUqjjWBwu4AREAPo=;
        b=h0SAY6+Ye8087JQhjnR8mVHxBKXmnYHnPQ7TwztGxQHGu8042rjU2S6qj4hPfxVWtb
         DCinlSx/7mypwKzWDiv1JUN3BYBqpOcp1ZrqzO9sY3T+yVrQFQ/D/IcYtRreo8UzZUr0
         Y9HgE8Pogn7RMqUIq+Ef0Z2qvGGziNVguImpBLuLR7iho7x1MlSUMDyex1gLu2IsYdtu
         m/sJ6Sx5TenALuyZIEvxVKMwcmvKW10L4QqYzCws6b6eLRqKjolDjRnywnagan3/yeUA
         QWtyiBfRnfbUdCzwRA0mQzIjBQ+7f8qEBovVz7v94kkdQ1byeECkOER6HzBaEUVXlyPB
         N2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718846909; x=1719451709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/ekbBeZLQlbT2zg5ACeIcCnuktUUqjjWBwu4AREAPo=;
        b=O3h5F6wEfDzFJEnU4Ux76IFw2cIeNF7UNyEHuerswSBfbEWgU6Naps7zltcGT8F8Kl
         qLCsZyLZbs3YcSjSqsIkv3a8mBQXh9TX72bDtQ0TxfXxhFTh1S9vF/Tjy27rb6+ErFfM
         Ia2lCU+wtTDLzBeQFbNc2RRjeopfBuNIbXY99MCbxDnqNZ6ov8pXpgzxA0tQ4gpzU+6n
         xXbPDL58xcuQsSliqAQkDOPjFPmEYcWnXCvINC2cltZYD1PDic8VA/4C6fk31BF0jgki
         eN1+w4JMmKU1CO+JFOVENDDHNIjLJzVV1OTrV304LXLx89k3m9+v4NM7I+VgRy+dtcUP
         BIXg==
X-Forwarded-Encrypted: i=1; AJvYcCVDuFwH5twzfEwmbeddK2pKdwZ4gJG3fonM+dOuAKg/kKzo/tTbtRYDMKuHr2CXNTAoPSHxFg7TS1qyGxgnyS4c4vEyDzdJ3edSCMSb+bam
X-Gm-Message-State: AOJu0YwK66RZ08EPFPZ++JKfn4mflUC9YVQmYVXtVqc1eMaC1lzYdwSP
	ORYO0FnHnioMrd2TOmZvtomiXZJLzQekyHIYWc+hAgPdIazPYyjEdrWR3UqkyNxpEBalRkiFTXa
	saNIdezJvX1pq4Z1ED4La+P88aj+XN3Vot32Y5g==
X-Google-Smtp-Source: AGHT+IGBBD4sgjyzChNhQD41x5cYm6++WrkWNpZZqXfJd6go6IeSymufFhAE2wLDdg5D7Zri2qLbf+MT7kpvOJiYs18=
X-Received: by 2002:a05:6870:148d:b0:259:8b2f:8d76 with SMTP id
 586e51a60fabf-25c9498dc84mr4604434fac.20.1718846909622; Wed, 19 Jun 2024
 18:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240617131425.7526-1-cuiyunhui@bytedance.com>
 <20240617131425.7526-3-cuiyunhui@bytedance.com> <CAEEQ3wnkQsfmLbyMrG_YBvWvhHJdSTg7dG5W_mxv_wxCjatgCA@mail.gmail.com>
 <ZnLY3mNxyv9QOmGn@sunil-laptop>
In-Reply-To: <ZnLY3mNxyv9QOmGn@sunil-laptop>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 20 Jun 2024 09:28:18 +0800
Message-ID: <CAEEQ3wmarOoWWYrdpf7YNQdZG4rf_O4dHkeiO3W1cuavVh8TMQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v6 3/3] RISC-V: Select ACPI PPTT drivers
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com, 
	james.morse@arm.com, jeremy.linton@arm.com, Jonathan.Cameron@huawei.com, 
	pierre.gondois@arm.com, sudeep.holla@arm.com, tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_182832_068375_2BF1602D 
X-CRM114-Status: GOOD (  14.44  )
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

SGkgU3VuaWwsCgpPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCA5OjEx4oCvUE0gU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMTksIDIwMjQg
YXQgMDc6MzI6MThQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90ZToKPiA+IEhpIFN1bmlsLAo+ID4K
PiA+IE9uIE1vbiwgSnVuIDE3LCAyMDI0IGF0IDk6MTTigK9QTSBZdW5odWkgQ3VpIDxjdWl5dW5o
dWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFmdGVyIGFkZGluZyBBQ1BJIHN1
cHBvcnQgdG8gcG9wdWxhdGVfY2FjaGVfbGVhdmVzKCksIFJJU0MtViBjYW4gYnVpbGQKPiA+ID4g
Y2FjaGVpbmZvIHRocm91Z2ggdGhlIEFDUEkgUFBUVCB0YWJsZSwgdGh1cyBlbmFibGluZyB0aGUg
QUNQSV9QUFRUCj4gPiA+IGNvbmZpZ3VyYXRpb24uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6
IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTog
SmVyZW15IExpbnRvbiA8amVyZW15LmxpbnRvbkBhcm0uY29tPgo+ID4gPiBSZXZpZXdlZC1ieTog
U3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IFN1
bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gv
cmlzY3YvS2NvbmZpZyB8IDEgKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2
L0tjb25maWcKPiA+ID4gaW5kZXggOWYzOGE1ZWNiZWUzLi4xYjRjMzEwYTU5ZmIgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25m
aWcKPiA+ID4gQEAgLTEzLDYgKzEzLDcgQEAgY29uZmlnIDMyQklUCj4gPiA+ICBjb25maWcgUklT
Q1YKPiA+ID4gICAgICAgICBkZWZfYm9vbCB5Cj4gPiA+ICAgICAgICAgc2VsZWN0IEFDUElfR0VO
RVJJQ19HU0kgaWYgQUNQSQo+ID4gPiArICAgICAgIHNlbGVjdCBBQ1BJX1BQVFQgaWYgQUNQSQo+
ID4gPiAgICAgICAgIHNlbGVjdCBBQ1BJX1JFRFVDRURfSEFSRFdBUkVfT05MWSBpZiBBQ1BJCj4g
PiA+ICAgICAgICAgc2VsZWN0IEFSQ0hfRE1BX0RFRkFVTFRfQ09IRVJFTlQKPiA+ID4gICAgICAg
ICBzZWxlY3QgQVJDSF9FTkFCTEVfSFVHRVBBR0VfTUlHUkFUSU9OIGlmIEhVR0VUTEJfUEFHRSAm
JiBNSUdSQVRJT04KPiA+ID4gLS0KPiA+ID4gMi4yMC4xCj4gPiA+Cj4gPgo+ID4gR2VudGxlIHBp
bmcuCj4gPgo+IEFjdHVhbGx5LCBteSBSQiBpcyBzdGlsbCB2YWxpZC4gQW55d2F5LCBoZXJlIGFn
YWluLgo+Cj4gUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29t
Pgo+Cj4gVGhhbmtzLAo+IFN1bmlsCgpPa2F5LCB0aGFuayB5b3UuIEJUVywgd2hlbiB3aWxsIHRo
aXMgcGF0Y2hzZXQgYmUgcGlja2VkIHVwIHRvIGxpbnV4LW5leHQ/CgoKVGhhbmtzLApZdW5odWkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
