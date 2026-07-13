Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751CBC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkr7gIqtXXo+vqR1HFBxE4u/ktUCvyxuilIvv0aZGFs=; b=1wHHXUOVKFrc+c
	t5o9WB2ohlXKA5xlq+7wULKiB3YKi+jgS8pi+9IrVeRgvJMG96bj9DdtNz5J0zdZtmm3YXpMPxixS
	GmLr4VF9ZJpKwajAzGbeOgMs66D/Rp1ArTURGfoER9N6sIaZaogQeX5qSzdc5TMx6rhD29ayGUuFT
	tlcV4YauDiD+5vQ5wxwZo8StuatsNK0tEdV+ZweCgqd8bC/DktzblhMeA4wN4v5Ju+REeacWp1cKx
	OYnp/flnnMdYEYCc7XMe3rBCeXo7fx3irbMhubWssXsNigvIcmsuSbgOst21LBnmxxk6ZgdKjk8zd
	01eBAquCOJxGg2/sBtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5uR-00000007wgy-0ERh;
	Mon, 13 Jul 2026 01:56:39 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj5uN-00000007wg6-3k5Q
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:56:37 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5b014810feeso250682e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783907793; cv=none;
        d=google.com; s=arc-20260327;
        b=Tx0qK2mEnE3TKQx2Q+UKi3e+XujgunlV8OdZH43i3y1eaxgMIacheRJS3EJvO0GaI8
         pXMQgqVI7vPMdyC2hIr50C2Hxu5K48hLPSdcUtEs3NwWZKqiQcPITfu/uiSUD9jEj/Le
         wcHSimILTTQ5qOGB6kn7APVU2435s++MhbvaHDFuVcDxuBgERlprXe0c27C271XTZeHL
         DiAjUqHD/qWRoE+MlbTeo+y/JXFBatNnZhYl5zaQ9CRARMbdCwd7pG0QexBEjLHEZkz6
         fRNujg4LGqkaod7JrWruMnMwHxwLapoFPRiIb4S+6S4raLJ+Al1HNPWhOh53DYXi8X/v
         ji1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TUItlZ1U8huwaHjPN09ycPTspoOfanWPZUQOpXtc2EQ=;
        fh=p2KxcM3A7fI+so6dHJdSjE+oCwXD5cKaUwoEYPCLtXs=;
        b=CReuNUObfhvK191HpGt3RMo7VrLKMG6tC6cNeg7y8AUCLQMCumiFSnC+YF6J7aTuhk
         f5MfX4xT55zPsDzMKA28nGt+Fr29dsI0PAJvRrt/WkBXozCNqNWA4o2Eh9UObePWSgUT
         Gu4PXd2XqN2gnksVwAF+1UEFYD6CuN0nj6g3SxiFLdMP+i1pTNGNUvQSiql+F/nH9FTw
         6ZEDz+0690XWU3qh7APcrW4l9LYmru23psfeUKrlPNXpl9TgIXlOsh1G4K5iWGw5Du3A
         Y8DJNmjz5tz0p0eba0zgHCyuq02l+dhIhkpj/AtquLjPU0zqLY53MZgakPSjk/6HI/UK
         rtlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783907793; x=1784512593; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TUItlZ1U8huwaHjPN09ycPTspoOfanWPZUQOpXtc2EQ=;
        b=XurYf0TN61AevXBkhJhYtef+EHOXc1PeTT/EEhjVgY1cY0SjMbh7/09b5eePV9N4xV
         UQH6Km9z6/9ia95xwk3IM6ZrHiq2jTXGvorktsoaAzgtUa36F+2KnR7kY5CF9mn/lBQW
         H+2PdfxIUQLLCRVwA4VlRCkPSdkQq0ZMNu8Kyh+dVr/l8n7Khz0d5f5En/03VnuZ6DCd
         ujwMkKdKXOQL+uqlg1tHEfZ1305L52p1DVl1HQ0GEWkS9U+6C3ymyjkjzcVcCVNIf0Er
         3aT7eJkRKAwqmvlhrTkCmZDNVH3XdfEXHgpMHmceawK8b6E05eWcJxL7TrRWJ7VTpPmA
         T9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783907793; x=1784512593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUItlZ1U8huwaHjPN09ycPTspoOfanWPZUQOpXtc2EQ=;
        b=MZoLz4B1oLzlXGRLq6cbTlILVHGQkjmctm0zwW9oHNySoaStNPdgJ+d7bPB43V9lJI
         fZ3PNv3z2hCdFHJGpOybQlU+eU7NFD40nH1LWEPYH4bFXBcO+MlcsGHEPEHS5w9yMenI
         3OqMBzQA1WBj0IkLtAAUxYK+WYzKPftKk9YAYtjoqmVrukNozFwVTZbs5jyvqFicRPVK
         dZD1+2ao9lfqcJBd0m+EM/1HFTIhL6Yjlktgfu0EuK/TntHjpjmEMPwclJfDPPHeO+qL
         4eh21yjDw2QWMDUEGNO+JZdjzp85wWtkmJ+L7n1XQ0EQwNDtvLKjX7qVO6CWLVI6PrTw
         Rr8w==
X-Forwarded-Encrypted: i=1; AHgh+Rox61L4aT8y9u76znyINJWrgOP8hoPrwqajycp/ln/0E2IYa5ICj39zXJ29C1RRRdJhXT0yStto2sSIUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLFHBoyM126+sZZcxKhmfWD2vfvHDgsVJlxZuuvojH7ZQzzSxa
	JQrxd1m2b6mqShagmk9jrQVs+oIvGOySwXa8hYUtYKeYCoDhmgXsMe56WzNI4EvYLeyCY33Kkrb
	eEfbsKi1/zNmi7gCTSf/FoG/d9yjTM/8=
X-Gm-Gg: AfdE7cnuCl1FTTRB53G40RFl980qxRpQvqPTfsJ2d+1mDuVNV9UuxOo191083gPs2Co
	eka2VvbGnuAHlFQ8gTpKQZzLyIuOepIP/uhgFsY8YgqQ5CFHIftyJnvLYdS/vnsaFn+uvP46qzf
	9I9RgPUqJmA8WAWkiiZuKOZgwKOB966v5rpi5QTWI301UdZ8pZNx0FtxMIZyevku0P9lHLzqpnd
	ehlsznkUCjTGUu5xA4BjFE8V2QoarxkYHTz9gHGYWxGGZjC3RlxhkMht7gInkqFJyTVuuoamDSe
	VqpVF2GvV947Ur8TwiXpkwhr+4G+BpMOy1ytkb2X59l4A2FZM72TyRI=
X-Received: by 2002:a05:6512:6690:20b0:5b0:312:21ca with SMTP id
 2adb3069b0e04-5b0235618d0mr532700e87.2.1783907793142; Sun, 12 Jul 2026
 18:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260710075917.159969-1-chenyou910331@gmail.com>
 <20260710075917.159969-3-chenyou910331@gmail.com> <alQ3mqUPItCP2CVT@inochi.infowork>
In-Reply-To: <alQ3mqUPItCP2CVT@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 13 Jul 2026 09:56:21 +0800
X-Gm-Features: AVVi8Cc9hd60uzXZYaT-84HPNgylmi-obZShd-I5Pge22kY3ToKnXYlACPAQfyQ
Message-ID: <CAKspUhLzgYPAxTTnUPsPyoa0Pp3519qFpXxmjXEwCAOHkihFEA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_185635_960796_B505F2E8 
X-CRM114-Status: GOOD (  18.37  )
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

PiBZb3Ugc2hvdWxkIGZvbGxvdyB0aGUgZGV2aWNlIGFkZHJlc3Mgb3JkZXIuIG5vdCBieSB0aGUg
ZGV2aWNlIG5hbWUuCgpSaWdodCwgSSBwbGFjZWQgaXQgbmV4dCB0byB0aGUgb3RoZXIgR1BJTyBu
b2RlcyBieSB0eXBlLiBXaWxsIG1vdmUgaXQKdG8gdGhlIGNvcnJlY3QgcG9zaXRpb24gYnkgdW5p
dCBhZGRyZXNzIGluIHY0LgoKSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4g5pa8
IDIwMjblubQ35pyIMTPml6XpgLHkuIAg5LiK5Y2IODo1N+Wvq+mBk++8mgo+Cj4gT24gRnJpLCBK
dWwgMTAsIDIwMjYgYXQgMDM6NTk6MTZQTSArMDgwMCwgQ2hlbi1ZdSBZZWggd3JvdGU6Cj4gPiBU
aGUgQ1YxODB4L0NWMTgxeCBmYW1pbHkgaGFzIGFuIGFkZGl0aW9uYWwgRGVzaWduV2FyZSBBUEIg
R1BJTwo+ID4gY29udHJvbGxlciAoUFdSX0dQSU8pIGxvY2F0ZWQgaW4gdGhlIGFsd2F5cy1vbiBw
b3dlciBkb21haW4gYXQKPiA+IDB4NTAyMTAwMC4gQWRkIHRoZSBub2RlIHNvIHRoYXQgYm9hcmRz
IGNhbiByZWZlcmVuY2UgR1BJT3MgaW4gdGhpcwo+ID4gYmFuaywgc3VjaCBhcyBzdGF0dXMgTEVE
cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuLVl1IFllaCA8Y2hlbnlvdTkxMDMzMUBnbWFp
bC5jb20+Cj4gPiAtLS0KPiA+IFRoZSBiYXNlIGFkZHJlc3MgYW5kIGludGVycnVwdCBudW1iZXIg
bWF0Y2ggdGhlIHZlbmRvciBTREsgZGV2aWNlCj4gPiB0cmVlIChjdjE4MXhfYmFzZV9yaXNjdi5k
dHNpOiBncGlvQDA1MDIxMDAwLCBQTElDIGludGVycnVwdCA3MCwKPiA+IGkuZS4gU09DX1BFUklQ
SEVSQUxfSVJRKDU0KSkuIFZlcmlmaWVkIG9uIE1pbGstViBEdW8gMjU2TSBoYXJkd2FyZQo+ID4g
dmlhIHRoZSBvbmJvYXJkIHN0YXR1cyBMRUQgb24gcG9ydGUgMi4KPiA+Cj4gPiAgYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kgfCAxOCArKysrKysrKysrKysrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL2N2MTgweC5kdHNpCj4gPiBpbmRleCAwNmIwY2U1YTJkYjcuLjI1YWQyYmQyNjVk
NyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgweC5kdHNp
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzaQo+ID4gQEAg
LTE2MCw2ICsxNjAsMjQgQEAgcG9ydGQ6IGdwaW8tY29udHJvbGxlckAwIHsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICB9Owo+ID4gICAgICAgICAgICAgICB9Owo+ID4KPiA+ICsgICAgICAgICAg
ICAgZ3BpbzQ6IGdwaW9ANTAyMTAwMCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJzbnBzLGR3LWFwYi1ncGlvIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZWcg
PSA8MHg1MDIxMDAwIDB4MTAwMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgcG9ydGU6IGdwaW8tY29udHJvbGxlckAw
IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic25wcyxk
dy1hcGItZ3Bpby1wb3J0IjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwaW8t
Y29udHJvbGxlcjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNncGlvLWNlbGxz
ID0gPDI+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmdwaW9zID0gPDMyPjsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwyPjsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8U09DX1BFUklQSEVSQUxfSVJRKDU0
KSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Owo+ID4g
KyAgICAgICAgICAgICB9Owo+ID4gKwo+Cj4gWW91IHNob3VsZCBmb2xsb3cgdGhlIGRldmljZSBh
ZGRyZXNzIG9yZGVyLiBub3QgYnkgdGhlIGRldmljZSBuYW1lLgo+Cj4gPiAgICAgICAgICAgICAg
IHNhcmFkYzogYWRjQDMwZjAwMDAgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAic29waGdvLGN2MTgwMGItc2FyYWRjIjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwMzBmMDAwMCAweDEwMDA+Owo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
