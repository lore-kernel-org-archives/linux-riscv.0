Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C61C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 04:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIkrXaTUIjiwJYADj5LHdhGtx+6dxnUtEo85ocg5Gcs=; b=f8Sllu+9kNuQWH
	ccYC9FwVUCSSzKP/EcrYywHHkaGbAtumNIrcdFExGcGXDIK35g4t5ijapKhgL7mzIVLcqJo98Yx/G
	8SPRdfWo1wNnyFlzf6Q8rz5CDX8Wo0wfSGebzeQ0xWcpm9unEsEVfcocLa039dnj320cKINHh4jLR
	xkd8szjOdlI1nHuveqTKV12iGZlERdy1swo+Cp9Lcg/CiBYQBZ3v7mPedg2ioZTMd8oj1xWomObzQ
	lzvNNuC705Ol07oFv+pkz8yuwRLLSfgjcSt+v26F9J+TLH7Qgqpq5HznCkK72morhkXoCcODJleCs
	4g/KhPrJqKfK2lxNyNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjBkf-00E7P0-0b;
	Mon, 03 Apr 2023 04:25:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjBkb-00E7Ni-1N
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 04:25:02 +0000
Received: by mail-pg1-x52d.google.com with SMTP id s19so16706344pgi.0
        for <linux-riscv@lists.infradead.org>; Sun, 02 Apr 2023 21:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1680495899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DUWV9ktqlDY/BbjAabfUWG15IVJ8NNADNU0tp46NqU=;
        b=ecCTgHwD+RX5VqoH89r+CLiINbWmHhR+Doo+KG6KQPo5T9RpBIFceUdzn8stTHl1KY
         qwvrNkD1b36X3KW4mXOefj+7llceiyqvhRV0ro1ZZ8VvAtwv71Zq1/iQ6cZQOwJrQdCs
         TTzpCj8DU44ITnJXab5cryMIo9/P277vU029M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680495899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DUWV9ktqlDY/BbjAabfUWG15IVJ8NNADNU0tp46NqU=;
        b=Pjp6hEhsj+U2NLia7EpFXxeQSM9h/+MSuf5EXQCrkODbUgrOPYytTII66uqbLYV9Mz
         KygoT3dCeooQ5JiuoQUdw5G2UCJrdY4DDo5JbU3lyvrL4xAiRpaDmbZiKI45ZU5Z8oVS
         xN400uMr/JtxwMH6Ysl8Gx6Q8WdzMj1RRmT6P5Xaa+N6XSJjuhalrtUdr0unxATAOWRz
         yi9Jm5CaxOeQpQ2A7bowPJMwcUWadPHFoVxdeoi73EuwglVYNGxdm2bP76zIJNmkg/+/
         6xD5X7uOggdzD6PBz8/pCmY9natbGBnSX+tSAVfFd+vrWvHz8EkhiLaNhTpmuQ0jS3AU
         VU/A==
X-Gm-Message-State: AAQBX9c6+tdtp81LzlJpyJfhuHazsCF1FHvHG5CQLY9Y9mbgiJT110SE
	uuDFvI2TG6GKeOwJXEKRvZZUQK8Phq2jg5uDrLMXaXSL7lJtUrI=
X-Google-Smtp-Source: AKy350buPR6+d9jPTSOjsqUWE4vPnoVCi1WyVz7aXHC5S1Qdm0BMiGAb7aL0Tx+OP3pzy3gzY6/7lWFNCwWLO5eD3gs=
X-Received: by 2002:a05:6a00:130c:b0:623:129f:6269 with SMTP id
 j12-20020a056a00130c00b00623129f6269mr16947692pfu.1.1680495899232; Sun, 02
 Apr 2023 21:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230401112730.2105240-1-apatel@ventanamicro.com>
In-Reply-To: <20230401112730.2105240-1-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 3 Apr 2023 09:54:47 +0530
Message-ID: <CAOnJCUJ9zgEjMDVo+rBuhzfaBWY1iaCL6Dy0Og+-QU3x4+GSmA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Allow Zbb extension for Guest/VM
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_212501_637138_6C170183 
X-CRM114-Status: GOOD (  13.81  )
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

T24gU2F0LCBBcHIgMSwgMjAyMyBhdCA0OjU34oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2UgZXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBP
TkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBLVk0KPiB1c2VyIHNwYWNlIHRvIGRldGVjdCBhbmQg
ZW5hYmxlIFpiYiBleHRlbnNpb24gZm9yIEd1ZXN0L1ZNLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51
cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAg
ICAgICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXggZDhlYWQ1OTUyZWQ5Li40N2E3YzM5NTgyMjkg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gQEAgLTEwNiw2ICsxMDYsNyBAQCBl
bnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1NW
SU5WQUwsCj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSwKPiAgICAgICAg
IEtWTV9SSVNDVl9JU0FfRVhUX1pJQ0JPTSwKPiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pC
QiwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX01BWCwKPiAgfTsKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBpbmRleCAz
MTEyNjk3Y2IxMmQuLjAyYjQ5Y2I5NDU2MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBAQCAtNjEsNiArNjEsNyBAQCBz
dGF0aWMgY29uc3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9hcnJbXSA9IHsKPiAgICAgICAg
IEtWTV9JU0FfRVhUX0FSUihTU1RDKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVklOVkFM
KSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVlBCTVQpLAo+ICsgICAgICAgS1ZNX0lTQV9F
WFRfQVJSKFpCQiksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWklISU5UUEFVU0UpLAo+ICAg
ICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJQ0JPTSksCj4gIH07Cj4gQEAgLTk5LDYgKzEwMCw3IEBA
IHN0YXRpYyBib29sIGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQodW5zaWduZWQg
bG9uZyBleHQpCj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NTVEM6Cj4gICAgICAg
ICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NWSU5WQUw6Cj4gICAgICAgICBjYXNlIEtWTV9SSVND
Vl9JU0FfRVhUX1pJSElOVFBBVVNFOgo+ICsgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9a
QkI6Cj4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgICAgICAgIGRlZmF1bHQ6Cj4g
ICAgICAgICAgICAgICAgIGJyZWFrOwo+IC0tCj4gMi4zNC4xCj4KClJldmlld2VkLWJ5OiBBdGlz
aCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
