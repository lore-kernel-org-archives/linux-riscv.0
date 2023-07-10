Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F4DEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lsg1LnOvwqQ87fZWWPtNLYlAWBfVIQ9WdhrZUNbc6gY=; b=ySaLjNc52JqoqE
	GsmHLIbo0WWevdsxKBZHBvf2fSCuz2Q7LZdtiM5a5fxqncckm390XDRXRTrl2DWdeG5zYdr6KW/UJ
	89sDUVSCZruOSgxfR7wPPo9l7t2XPHUJFJRV0M6N6tYNx/M1uvCX96uaJbS2TCy/90b/rYUyBjxhf
	NXU6zKXIdjFhiK27zV0GLeNJlhxsyyAJtNbppS99DIACIAQ/9/TQH20q5NodJYAcDO1yOsyU3+6X+
	3td9whnsjhIS7LecOEiVfrBMwyUkpcLZ4xxgNTnOEEAg3xA7LORA5cKpVb4DDfxmxUw8V6svL7Dzo
	08iwLksVPMK5IhUzYSFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIrWX-00BpT1-22;
	Mon, 10 Jul 2023 14:05:57 +0000
Received: from mail-yb1-f180.google.com ([209.85.219.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIrWV-00BpSI-1z
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 14:05:57 +0000
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-c5e67d75e0cso5898005276.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 07:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688997953; x=1691589953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=synEb8i0PbvXljWfEAZgODayCcLrTZV/b7Ul2k51+yA=;
        b=QZxj5lg/bTvX9nzQCZd2mo+cN+lrZW/tR/BLUWUeQC/h2RYmGvF64LY5KbDcN4pQk1
         Pi5rsj7lJtznibOrBfUGQu3+nChD4SyBJKFnK5LWBO/j5Sa3bJJlgNbzqnkaB4o48k/j
         asHyCF1el3/o88kh/QFeFQx8sce48ubjj3qhLa7JiBeq5vo1Aojxap3v14nLBFZCFQTZ
         3ygTEBL1jIrNOnGsfodr3IS6zXtDJpdVNjGcvc8Y8pbHItr0QF63R+y7Pv9Rl4TCUfJ+
         RSDLGdAuOXkdh+zoiZ8T1q3xjvhR6of4uKWvou9m18skG7w9K5PrG7bPz+B1KLJuzrIX
         ob0g==
X-Gm-Message-State: ABy/qLZAbQ6wTLrM+NzOqcASADi9pPIQNb0V25SN9CxDADLtpISWcMLT
	xu9eORl3sgh7H2hy1bveh/EoPKJUt+tlFQ==
X-Google-Smtp-Source: APBJJlHk1mrHAFGvAZovdHciITD2CLV01cvFyZ8FmzvJalufgPdnktSDLgPRDxUmMc7NpNiLnAsCCQ==
X-Received: by 2002:a25:1456:0:b0:c39:9e09:2c71 with SMTP id 83-20020a251456000000b00c399e092c71mr8854740ybu.41.1688997953048;
        Mon, 10 Jul 2023 07:05:53 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id v43-20020a25abae000000b00c5f4d06fb1asm2645401ybi.59.2023.07.10.07.05.52
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 07:05:52 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-c5e67d75e0cso5897988276.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 07:05:52 -0700 (PDT)
X-Received: by 2002:a25:d8c3:0:b0:c67:ebf3:b1fa with SMTP id
 p186-20020a25d8c3000000b00c67ebf3b1famr11128212ybg.31.1688997952651; Mon, 10
 Jul 2023 07:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2023 16:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6_Q+GDG=MRTkaH4O=un-owzkN_B-aCbKdo_F1=B1sTw@mail.gmail.com>
Message-ID: <CAMuHMdV6_Q+GDG=MRTkaH4O=un-owzkN_B-aCbKdo_F1=B1sTw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing pins for RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_070555_655171_4083E68B 
X-CRM114-Status: GOOD (  16.08  )
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

SGkgUHJhYmhha2FyLAoKT24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgMjowNOKAr1BNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFRoaXMgcGF0
Y2ggc2VyaWVzIGludGVuZHMgdG8gaW5jb3Jwb3JhdGUgdGhlIGFic2VudCBwb3J0IHBpbnMgUDE5
IHRvIFAyOCwKPiB3aGljaCBhcmUgZXhjbHVzaXZlbHkgYXZhaWxhYmxlIG9uIHRoZSBSWi9GaXZl
IFNvQy4KCkFyZSB5b3Ugc3VyZSB0aGVzZSBhcmUgbm90IGF2YWlsYWJsZSBvbiBSWi9HMlVMPwpJ
IHRob3VnaHQgUlovRml2ZSBhbmQgUlovRzJVTCB3ZXJlIGlkZW50aWNhbCwgZXhjZXB0IGZvciB0
aGUgQVJNCnZzLiBSSVNDLVYgQ1BVIGNvcmUgKCsgc3VwcG9ydCk/CgpHcntvZXRqZSxlZXRpbmd9
cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
