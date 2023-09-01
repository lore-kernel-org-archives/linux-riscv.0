Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AD1CA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDzvrBE1CHukAf/kIYgHQyz3AkAcX0PbKTxmBoTyeR8=; b=FmDPo49BPC42Ku
	PUBkvRGWYrDEdinAM5VYSGvjRU6WrMANUJJpHUfYaOUT3klJXLzEHNxi5ILi3G94J+hnnS+8JA9GG
	qfi+xTsCBUb7GcS5wNgcYHKUwdD/elM5yh++zPfUfAVR1zkRiwtC73gqxWMQHBoYXNlhrC72JvrYz
	jOwXvtd3pG8ATI4LCOfD2gMEhNLTtlmmROaP95DYLhSRd6JAXewwWn/ap5eCBd1mw6wC2aT11z/MX
	lgu7fmRe1frZNaUaLUTnLLxU9u9e0sJ0junNEkcBxmyJUbE2EH1u1W3AAbDrC2iUTjyM5tUDOVKY+
	TMu2/9qnTtOmSvAJShtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc2bQ-00HGkK-0u;
	Fri, 01 Sep 2023 11:46:16 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc2bN-00HGjq-1Q
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 11:46:15 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a9c59cccd3so1228988b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 04:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693568770; x=1694173570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mmi1BI358ffCGTUdtlT0m2XgZO6RaiWjgEoPAH8B6pQ=;
        b=lk2BNFIwggoe0ebpC+vS/shn+sL7LA/PgCdbKk8tWl82RINhT0fWudRf62Ek5sbSlu
         xzH0hZ4iIl8j+MLp56zEnuOG92mhKksFGuf6PRbOJqb/sKz8F/U9j0oksVHlHK/d+hdq
         trhWSRORUSkOiisDIMvN42p041Tre3NJLQeNe0FiC9Qq/hd3ervN+6vZ1EugjuQQUtMb
         7x36nqyhJVZLkoCC818ilZtir4jEwXvxPqS4HeRRHxRuA37l/u/DvbM53Gt3uK7DJ4Xs
         f+MkqCQpyHszaunhFai+VrZDOMaHXcKzgisFdZ+4zwjS+9tCG/H26KaiTxZcIKQYsS25
         54eA==
X-Gm-Message-State: AOJu0YwAvXBkFbAGDQ2psou0HiisG16sKCzfd+yzdj7cTzcfSHdrOo/J
	lYctDHixxxjZjljt7wqwBK7e8uXazbYtcA==
X-Google-Smtp-Source: AGHT+IFg+FD3QIlLiVdz27Gat1QUMT8JgZQeT91L6fh4G/+zquNXh98JBGh4UgXLxFZ9+XAbY+nKdQ==
X-Received: by 2002:a05:6808:2221:b0:3a7:2d4c:5d4e with SMTP id bd33-20020a056808222100b003a72d4c5d4emr2788942oib.7.1693568770094;
        Fri, 01 Sep 2023 04:46:10 -0700 (PDT)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id bq11-20020a05680823cb00b003a7750aae7dsm1858677oib.0.2023.09.01.04.46.09
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 04:46:09 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-570e005c480so1142952eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 04:46:09 -0700 (PDT)
X-Received: by 2002:a05:6358:9489:b0:134:e458:688d with SMTP id
 i9-20020a056358948900b00134e458688dmr1872438rwb.15.1693568768936; Fri, 01 Sep
 2023 04:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230901105858.311745-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230901105858.311745-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Sep 2023 13:45:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXRSphh82KaY=xHTpHLuQXz0aKL2qhL0LXsNW9A42hSQ@mail.gmail.com>
Message-ID: <CAMuHMdXXRSphh82KaY=xHTpHLuQXz0aKL2qhL0LXsNW9A42hSQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Kconfig.errata: Drop dependency for MMU in
 ERRATA_ANDES_CMO config
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_044613_529454_9B383C37 
X-CRM114-Status: GOOD (  14.79  )
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

T24gRnJpLCBTZXAgMSwgMjAyMyBhdCAxMjo1OeKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IE5vdyB0aGF0IFJJU0NWX0RNQV9OT05D
T0hFUkVOVCBjb25kaXRpb25hbGx5IHNlbGVjdHMgRE1BX0RJUkVDVF9SRU1BUAo+IGllIG9ubHkg
aWYgTU1VIGlzIGVuYWJsZWQsIHdlIG5vIGxvbmdlciBuZWVkIHRoZSBNTVUgZGVwZW5kZW5jeSBp
bgo+IEVSUkFUQV9BTkRFU19DTU8gY29uZmlnLgo+Cj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJo
YWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKUmV2aWV3ZWQt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpHcntvZXRq
ZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
