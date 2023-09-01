Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62346CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 11:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ky3yaWLi/3b9B84Pi8oYP14+Xu00zmFMGrehQ6hRsfs=; b=2aX+UJIKKxZFvB
	ROgNhpVdpjyn94V/erLHvxExonZD+YCmxiet/3ukYJLmf0/E9SXHrl2S8yn3az7qf1mK6D6nvnW3U
	lWCWnIJGyPkRYMfsLAmYNvCE5FvjawVfizBZDNvDCOmJcMqMba6lX0Y3KhtDaWJXsojfrq8osAln6
	9omxKeN8l3OFcNspxGGDTFRFYzaw/HHLXgw8pkZlCa66uYvNvCGuSpCrhtFl9DaLQeztqAR+MHEFe
	oVAv8VfVmab42Rbkji/pPbQwhs1SMRpYE4Kao/k/ZkBXFZysuiE98Z67TkoRFEj6JEqwz9FZNO7Jz
	AWtcOh/sWt3Ykjf9RdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc2cu-00HGsv-1U;
	Fri, 01 Sep 2023 11:47:48 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc2cr-00HGsF-14
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 11:47:46 +0000
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-58fc4eaa04fso20829347b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 04:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693568863; x=1694173663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlILCXxelUgpayFeYE8jsNyi3YxHuXk4RJqViDf9D+s=;
        b=T/T5ALK6Wj9sBRnEFG2+3htUuovAQxBvWXiPcVFbHCuDbcSUmXTqzipoYmsbtZik8V
         2YexmoIUzBQvyypBJ+Cyzl6ZIOBcLnBDivQUGVtF/VhTMGmqeIt8M0hEjTugdCytXD3Z
         hQ8YBbuqgVJ6MUIRrc1XPxSgU9X0089TjvfSbTEcfrEmmiJ0WiqmYcKLg/Za39IjLbCG
         5EmtPogHaKYqwl7Z+439ludG4gKsuLedTZdXPDu+0ZDt4KluyRrUiuLfGpWFeUpggLuW
         OJlkmFB0CnMhSvSDRgUq0Wde9V+6/2QnRgW17h8iaCufQoVpPbkSQncG7GhBqd3A/4eX
         spLQ==
X-Gm-Message-State: AOJu0YwY/D9s3+SEfddfQs0gIx93F58fEZ5z0ilCkcQfNkl26pOxhc1+
	6XG1FflgvVEx4fPY6i7bK3gJmYZ7JTjwXQ==
X-Google-Smtp-Source: AGHT+IFNnvKAyEUAS6/ZcVxlqR8gov1igVKrhhC0DBx9YzhyMdijhLSaT4tNMr6/Dywk8U0W4kHJdA==
X-Received: by 2002:a0d:ca87:0:b0:589:fc81:952e with SMTP id m129-20020a0dca87000000b00589fc81952emr2350277ywd.7.1693568863295;
        Fri, 01 Sep 2023 04:47:43 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id r20-20020a0de814000000b00589e68edac6sm1008849ywe.39.2023.09.01.04.47.42
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 04:47:42 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d77ad095f13so1396451276.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 04:47:42 -0700 (PDT)
X-Received: by 2002:a25:e0c3:0:b0:cec:81af:cf92 with SMTP id
 x186-20020a25e0c3000000b00cec81afcf92mr2613450ybg.36.1693568862448; Fri, 01
 Sep 2023 04:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Sep 2023 13:47:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYQPRMBg05HDDQq5kZvbv2Tx_kjeri5GMANRXoxTJF=Q@mail.gmail.com>
Message-ID: <CAMuHMdUYQPRMBg05HDDQq5kZvbv2Tx_kjeri5GMANRXoxTJF=Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: Kconfig.errata: Add dependency for RISCV_SBI in
 ERRATA_ANDES config
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_044745_375268_E1387FA9 
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

T24gRnJpLCBTZXAgMSwgMjAyMyBhdCAxOjAz4oCvUE0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3Nl
bmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+Cj4gQW5kZXMgZXJyYXRhIHVzZXMgc2JpX2Vj
YWxsbCgpIHdoaWNoIGlzIG9ubHkgYXZhaWxhYmxlIGlmIFJJU0NWX1NCSSBpcwo+IGVuYWJsZWQu
IFNvIGFkZCBhbiBkZXBlbmRlbmN5IGZvciBSSVNDVl9TQkkgaW4gRVJSQVRBX0FOREVTIGNvbmZp
ZyB0bwo+IGF2b2lkIGFueSBidWlsZCBmYWlsdXJlcy4KPgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL29lLWtidWlsZC1hbGwvMjAyMzA4MzExNjEwLmVjNmJtMkc4LWxrcEBpbnRlbC5jb20vCj4g
U2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJw
LnJlbmVzYXMuY29tPgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
