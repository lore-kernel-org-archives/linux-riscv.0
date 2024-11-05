Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F0AD1CA37
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 06:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cALq5Tk8INXC8cDwKis6Ntx4aUe5iKQs05fbR1epJOc=; b=EcViMNOMYIWTjk
	E/JWEkv9rNbTgS2wovUeIWp8+7Gv6fIPTCYkjx3G4BFodXQBlpRPlg14N98sHREf6zSu+k1QaRckC
	o3j/jN5wfKVRJoie/XngrslZhNKS88QqVyNGampAOd258kgdT6fPKF1KHoi2mVuM6HdB64brevHZu
	6d9gG61UZimp0Ogjs7dW20JwgmjdYFSblcu4uLsSA6po4FnUIMlXKWsPLqbY3fxpfD9Rm/EMw/8d6
	grS075TKmgboXFaIxvNxwIJERnJx8/OhOglpUjLol6ROzFAUsPEj0lGm/1JSP1rYvooBECxGuQ3gZ
	bBkvH3Seiit4DM65svMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8D3q-0000000G30V-0sPT;
	Tue, 05 Nov 2024 06:29:06 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8D3n-0000000G2zi-0c3k
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 06:29:04 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a3f8543f5eso16728455ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 22:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1730788142; x=1731392942; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQtOen+NbViJr+rRV0Q5OmCOzg2wep+9ZhzpypOP/Zc=;
        b=qz+8AzMr0oKPmDN1t0+C5jI36owyi0brqg1PGPhYm+fGo3YQH/+2jbOhISLAG8rsPu
         /pkeFhHkIsf4M6CwoQgVx9UvW1qTKHdHhsUrhlXSpb0vB87S7x1Cs3luP3JV2TK4ruXr
         hYBjinURu57b1fqOZo9kiUAbP1ZzosGWgRVy99zQbdc7i+3jC8xtnt6xxjwhraAYagHs
         NxtnIk3xvoJ6PI3fRHiWPgC1slCPDj0fxGgLwFf+UODWEfqnw0rvqQt2g/aobYEsFtAf
         DdeVYGGjQQlMt/4Gbfc6xavomZtz3caRSHl+B/nd4ppmbTpbkjVv+uoia3afYVJaqDTy
         7OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730788142; x=1731392942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQtOen+NbViJr+rRV0Q5OmCOzg2wep+9ZhzpypOP/Zc=;
        b=NgaZATk4CHT5XowoB9oqpU+MY8thde0pELCkIwshShHnnuelMiNM/ycl6wTXWmDgMS
         qbM7zz39qC8T5ViagGtXB1A7PfT0PPk4xq4Ex7fJvPiuYYgfYlg4eWzhFerdXCdmdK9z
         siiF3cgbqZIeivsMvoG3RQGc2XK6IMVEBZCg3TjqzCsTs1Qh95QCqcbI8svb6HH9N6+T
         BBa9M0lAZRxJVQ5ENo9jDjl0gaLerO/ksb/Trlf4Od1udPjsqjL+OOyAdzlhpGHk2uza
         HIObQO6NNe2QUxLXo4Rn+/iOwYzijJaHtU5/knmsF9uXJ6y58K8EsGNFOivKAvYr7N7R
         FRpw==
X-Forwarded-Encrypted: i=1; AJvYcCUX6L5oCM2O0E4LgZ1YT3l1otiViT3fNWD6ksHDFIdwd+i1tVvu5t3YnfUKjWu/2pPLIudIVLO9j4rzvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlptnrgsDm0yHrg7BqVoIcFiFBAUfGtxPW88HIZZf9yzy9FZeF
	HE4ar6RyKk/pRvi04DSqzyBRLHOXcHE524uI0UP8xlj2ei63IXopZudSn5vcks6cwmgdMr/DDEW
	JoBQoPm/umJrOWYKVIxj5xiTUxkreE/FsE4V34w==
X-Google-Smtp-Source: AGHT+IHHjcyYFeTdVr47ib7/5t83JULMux12GPFjUaiweiWwMJfEa28WXKusTfsFvdHf6JwmvF7uMFZhMwNn7TEdrTo=
X-Received: by 2002:a05:6e02:111:b0:3a3:637f:1012 with SMTP id
 e9e14a558f8ab-3a6aff71b31mr120478795ab.12.1730788141919; Mon, 04 Nov 2024
 22:29:01 -0800 (PST)
MIME-Version: 1.0
References: <20241104191503.74725-1-bjorn@kernel.org>
In-Reply-To: <20241104191503.74725-1-bjorn@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Nov 2024 11:58:51 +0530
Message-ID: <CAAhSdy1Z93TyYrFCYw+qOHh05q0FaEPRJ=ZHf4UztUEKXuphYg@mail.gmail.com>
Subject: Re: [PATCH] riscv: kvm: Fix out-of-bounds array access
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_222903_474277_84C70288 
X-CRM114-Status: GOOD (  19.93  )
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

T24gVHVlLCBOb3YgNSwgMjAyNCBhdCAxMjo0NeKAr0FNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gSW4ga3ZtX3Jpc2N2X3ZjcHVfc2JpX2luaXQoKSB0aGUgZW50cnktPmV4dF9pZHgg
Y2FuIGNvbnRhaW4gYW4KPiBvdXQtb2YtYm91bmQgaW5kZXguIFRoaXMgaXMgdXNlZCBhcyBhIHNw
ZWNpYWwgbWFya2VyIGZvciB0aGUgYmFzZQo+IGV4dGVuc2lvbnMsIHRoYXQgY2Fubm90IGJlIGRp
c2FibGVkLiBIb3dldmVyLCB3aGVuIHRyYXZlcnNpbmcgdGhlCj4gZXh0ZW5zaW9ucywgdGhhdCBz
cGVjaWFsIG1hcmtlciBpcyBub3QgY2hlY2tlZCBwcmlvciBpbmRleGluZyB0aGUKPiBhcnJheS4K
Pgo+IEFkZCBhbiBvdXQtb2YtYm91bmRzIGNoZWNrIHRvIHRoZSBmdW5jdGlvbi4KPgo+IEZpeGVz
OiA1NmQ4YTM4NWI2MDUgKCJSSVNDLVY6IEtWTTogQWxsb3cgc29tZSBTQkkgZXh0ZW5zaW9ucyB0
byBiZSBkaXNhYmxlZCBieSBkZWZhdWx0IikKPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4gRG9uJ3Qga25vdyBpZiBpdCBtYXR0ZXJzLCBi
dXQgSSBoaXQgdGhpcyB3aGVuIHRyeWluZyBrdm10b29sLgoKTG9va3MgbGlrZSB0aGlzIHdlbnQg
dW5ub3RpY2VkLiBUaGFua3MgZm9yIGNhdGNoaW5nLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwg
PGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4xMy4K
ClRoYW5rcywKQW51cAoKPgo+Cj4gQmrDtnJuCj4gLS0tCj4gYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmkuYyB8IDExICsrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmku
YyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBpbmRleCA3ZGUxMjhiZThkYjkuLjZlNzA0
ZWQ4NmE4MyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+IEBAIC00ODYsMTkgKzQ4NiwyMiBAQCB2b2lkIGt2
bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIHN0
cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4dCAqc2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlfY29u
dGV4dDsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRy
eSAqZW50cnk7Cj4gICAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAq
ZXh0Owo+IC0gICAgICAgaW50IGk7Cj4gKyAgICAgICBpbnQgaWR4LCBpOwo+Cj4gICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzYmlfZXh0KTsgaSsrKSB7Cj4gICAgICAgICAgICAg
ICAgIGVudHJ5ID0gJnNiaV9leHRbaV07Cj4gICAgICAgICAgICAgICAgIGV4dCA9IGVudHJ5LT5l
eHRfcHRyOwo+ICsgICAgICAgICAgICAgICBpZHggPSBlbnRyeS0+ZXh0X2lkeDsKPiArCj4gKyAg
ICAgICAgICAgICAgIGlmIChpZHggPCAwIHx8IGlkeCA+PSBBUlJBWV9TSVpFKHNjb250ZXh0LT5l
eHRfc3RhdHVzKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPgo+ICAgICAg
ICAgICAgICAgICBpZiAoZXh0LT5wcm9iZSAmJiAhZXh0LT5wcm9iZSh2Y3B1KSkgewo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIHNjb250ZXh0LT5leHRfc3RhdHVzW2VudHJ5LT5leHRfaWR4XSA9
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFU
VVNfVU5BVkFJTEFCTEU7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2NvbnRleHQtPmV4dF9z
dGF0dXNbaWR4XSA9IEtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19VTkFWQUlMQUJMRTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAgICAgICAgfQo+Cj4gLSAg
ICAgICAgICAgICAgIHNjb250ZXh0LT5leHRfc3RhdHVzW2VudHJ5LT5leHRfaWR4XSA9IGV4dC0+
ZGVmYXVsdF9kaXNhYmxlZCA/Cj4gKyAgICAgICAgICAgICAgIHNjb250ZXh0LT5leHRfc3RhdHVz
W2lkeF0gPSBleHQtPmRlZmF1bHRfZGlzYWJsZWQgPwo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRElTQUJMRUQgOgo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9T
VEFUVVNfRU5BQkxFRDsKPiAgICAgICAgIH0KPgo+IGJhc2UtY29tbWl0OiA1OWI3MjNjZDJhZGJh
YzJhMzRmYzhlMTJjNzRhZTI2YWU0NWJmMjMwCj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
