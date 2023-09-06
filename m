Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1854AEB8FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 11:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLTLVuOsPflx9FiYJdFtekmqgwwOloM7bUKT0e42HHM=; b=wXcPkNEE3jVHy+
	UhgcA8EashtiWveaJnpVHszCSpv9h5IIEFYN8hDlCBPr3jbjTvcAqhWfxRyNPGN1G8HlmfNQV1LC6
	oEDE21FEnSG4spxLmQav8jK7Gg6QyEotN2Uou+qJI+65J8d9OamGIWstPoEoN/0SaSEE8YVFcTMvC
	3ZEZ85GWeSL0uLuoaXKj9TMqmSeRrITrdxuBv1sC0PIkNwJItOLa9vY+GdNWA+uawhF5lhCvR41Tg
	t0r26h30br5xRfngH9Wrx5YXo6IYdcd/JrGqloivje9odFmiGBM3jXBBfp7unVjhir+kTW5jkM+dE
	Tu838NXPNnbQnpzB5bKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqWd-008bQw-10;
	Wed, 06 Sep 2023 11:16:47 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpUe-0085V8-1m;
	Wed, 06 Sep 2023 10:10:41 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bceca8a41aso53487391fa.0;
        Wed, 06 Sep 2023 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693995036; x=1694599836; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfOqaeV+KknayCO8Oeiwloxt+zMetEN9D2laP149Llc=;
        b=OtPajrnlYi4VyucajKhYuvCbOt8K5kyCu9eVrKQOixP5PgOB9HluDxf7w6hcn3ra48
         3ievlyyobCvo7U07EeqH26xBIMPpBJ7g9qdQGSyM/cqXNZdfacYKpCWaQnfe68ZOIJBg
         rNybLxDAEhGAGbrTi0C/2+8WNT8N7FZj2suZkDQIqPrKxExX17rIPm4xZBzht+WP+Vw0
         a2B4LFeqMx2Fs3L316I8YMdC+SCIrMEW7eyOPGTVH65T3WH7Tj4Egqhi6zBdoeYXE3db
         oowuZQFZ/CsvOUYdxDKnNkPO11om5wB6JKLpj3xlCxMSIDpk/GQPr/BjVsVxep0x3dXK
         /+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693995036; x=1694599836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfOqaeV+KknayCO8Oeiwloxt+zMetEN9D2laP149Llc=;
        b=cGtm8kq2tcQVfcgNmocQVAdNzRWPTjQcqYd+HJVdZahnE8r2RzGpFEygCI/FH7NmHM
         DszuFUoqkee3iM4Gd2+hd+F9r1lakHHJDLR2jM5Wrf6ro8GFDBcML+PQpURHCTXpP/sV
         ICbf4nC6X0ijdCkLTN7GAKipvPxWPOjtuDI9oCoJZDctWKVCs/oF3Mq8BM4l0NxEGYge
         v3nuk6I9wWpu75qYMkXsGW0RPT6ZloxDl3mKuN4hgRyn19dND2gRecLlMpi/DKtEx6Fo
         CgHZL/nQEbY51oY/BqLKUao+IILEhQYkx9njDkor8ZQ0bj+t1+o3zaUJZQ8ZCLLBqA5A
         8LDw==
X-Gm-Message-State: AOJu0YwvgL1zrSKT8oXm5o1ViNODGiI1O+f7Ty8WVF70eq0xT9+0kL4E
	DN2K6cH5bINoUABT4PS4W6ewNnBu2HzHja/TlcA=
X-Google-Smtp-Source: AGHT+IFgpGZUTmfvyaicrKry99f2uX/eh3DtKB8c/qKcmnkcHz7uwZYtn0qD9L1QTcGEetIJKq9wCp8WNJgZPbJB/RM=
X-Received: by 2002:a05:651c:104a:b0:2bd:180d:67b1 with SMTP id
 x10-20020a05651c104a00b002bd180d67b1mr1816321ljm.51.1693995035890; Wed, 06
 Sep 2023 03:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <b6ef1b031e3a581f481cf19a26623388163444b4.1693659382.git.haibo1.xu@intel.com>
 <20230904-aa8b0d8d23d391586686038a@orel>
In-Reply-To: <20230904-aa8b0d8d23d391586686038a@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 18:10:24 +0800
Message-ID: <CAJve8ok5cU+h1K+WJ+aDpB+u+PBo8XosUyyVbMGy-xR0XiWFdw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] KVM: riscv: selftest: Change vcpu_has_ext to a
 common function
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wchen <waylingii@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Jim Mattson <jmattson@google.com>, Lei Wang <lei4.wang@intel.com>, 
	Vipin Sharma <vipinsh@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, Like Xu <likexu@tencent.com>, 
	Peter Gonda <pgonda@google.com>, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, Paul Durrant <paul@xen.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_031040_633540_F585B8E4 
X-CRM114-Status: GOOD (  15.03  )
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

T24gTW9uLCBTZXAgNCwgMjAyMyBhdCAxMDowNOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBTZXAgMDIsIDIwMjMgYXQgMDg6NTk6
MjlQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gPiBpbmRleCBkOGVjYWNkMDNlY2YuLmM0
MDI4YmYzMmUzZiAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9y
aXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gPiBAQCAtNDQsMjAgKzQ0LDYgQEAgYm9vbCBjaGVja19y
ZWplY3Rfc2V0KGludCBlcnIpCj4gPiAgICAgICByZXR1cm4gZXJyID09IEVJTlZBTDsKPiA+ICB9
Cj4gPgo+ID4gLXN0YXRpYyBpbmxpbmUgYm9vbCB2Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBpbnQgZXh0KQo+ID4gLXsKPiA+IC0gICAgIGludCByZXQ7Cj4gPiAtICAgICB1bnNp
Z25lZCBsb25nIHZhbHVlOwo+ID4gLQo+ID4gLSAgICAgcmV0ID0gX192Y3B1X2dldF9yZWcodmNw
dSwgUklTQ1ZfSVNBX0VYVF9SRUcoZXh0KSwgJnZhbHVlKTsKPiA+IC0gICAgIGlmIChyZXQpIHsK
PiA+IC0gICAgICAgICAgICAgcHJpbnRmKCJGYWlsZWQgdG8gZ2V0IGV4dCAlZCIsIGV4dCk7Cj4g
PiAtICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+IC0gICAgIH0KPiA+IC0KPiA+IC0gICAg
IHJldHVybiAhIXZhbHVlOwo+Cj4gZ2V0LXJlZy1saXN0IHdpbGwgbm93IGFzc2VydCBvbiBnZXQt
cmVnIHdoZW4gYW4gZXh0ZW5zaW9uIGlzbid0IHByZXNlbnQsCj4gcmF0aGVyIHRoYW4gZmFpbGlu
ZyB0aGUgX19URVNUX1JFUVVJUkUoKSwgd2hpY2ggd291bGQgZG8gYSBza2lwIGluc3RlYWQuCj4g
V2UgbmVlZCBib3RoIHRoZSByZXR1cm4gZmFsc2UgdmVyc2lvbiBhbmQgdGhlIGFzc2VydCB2ZXJz
aW9uLgo+CgpPaywgV2lsbCBrZWVwIHRoaXMgb25lIGZvciBnZXQtcmVnLWxpc3QgYW5kIGFkZCBh
bm90aGVyIG9uZSBmb3IKYXJjaC10aW1lciBzcGVjaWZpYyB1c2FnZS4KCj4gPiAtfQo+ID4gLQo+
ID4gIHZvaWQgZmluYWxpemVfdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCB2Y3B1
X3JlZ19saXN0ICpjKQo+ID4gIHsKPiA+ICAgICAgIHN0cnVjdCB2Y3B1X3JlZ19zdWJsaXN0ICpz
Owo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPgo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
