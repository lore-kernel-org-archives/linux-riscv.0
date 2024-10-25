Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51737D149DB
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 18:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2NcyojXyoNgbf5347apjqX3k0CRPKbiwX0xCwHz+TQ=; b=SuNNtzdPp5i7/s
	QftwSnkEHzmYidcAXEmhxvn0gtlUYGS9symPblSLuhON3dkTnikXq+6dj8Vl8++PBpSYlN2mQCxC4
	4edw2XXsiiWJAdu1C4WwbDwJGd7zZKlXC29m/rqUfhf4XNgm4+pNjE0USXBgdYkPek/fGphakxPsB
	j5MynPnR9jij3chnUrF/kgOPylHv5Dbf5Iu6dQBXXt65q/LI3Qjp3oKZ5hqqYKhRfpFOylXsF7Mb5
	EzvitHxv7KkbIoOkGNxjkBSVhaCOQUVS/DxgJkJMTfRZyLp4WK7t5v6GN87T3IyYhAJpyJ+AvaKpT
	J5WrMclm2fOHMAWv7C4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4P03-00000004nJp-1K7G;
	Fri, 25 Oct 2024 18:25:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OLK-00000004f7x-26mA
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 17:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729878201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
	b=VTKYDOHnwdN5Y1mfCOqx9bAdAlEkk9T5caVvsnbh6pWT/v6SlGXa5CovkVbYUfFioFLZjO
	SS194wfWPZNWwVVDLJxDEzOS2i9m5ot2GxppkTUtbROszmsCnMAMKw2w/GT6xybzNOavVp
	/sGzGkUml0R6ueqRhmAyWa/087I536g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-kQ2juDf2MPSVhKO1oKiVSQ-1; Fri, 25 Oct 2024 13:41:59 -0400
X-MC-Unique: kQ2juDf2MPSVhKO1oKiVSQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4316300bb15so15917445e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 10:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729878118; x=1730482918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
        b=ZQqA0fi7x4RtwzXcN/CdIjJpg5f7ILHjdW+mnxC4aCJghjifBuMxG7n1I49nOu/0Vj
         90S/wzTWeAXu4EXC+HLjIvhHURzwPWnRdv71Q+BUrqi9jnr9fbO9fCtBt6bhpSuv9jlf
         9FUEx6lOW1Z3g27dBmysmrqc688S2EfSSaVr5c3ZKd+BLqPXy/QJH8S2jCSndAQ5CLdO
         95+AYq+H0UUKrXmsoZPtCbDIvaj1OJFjNKk4dJDX2jQI8zSFPx2keql5TshxGttRa47d
         zC4ROlP1oX1LYMnrks2VGyQA2u1TjQFyLHeZLjcm7Ak9Ye3NnSaGwlo3l3FPyZJotHQc
         /JsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXdqt5G7679AGVSc1SE5om0NHzeuslKUjunPPwrnqOtxVsJKk/Be4W1AhVcnSW/1S5c5+e661I8Ir/+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8f5tfs252+QIYo0+95p2CORb+6AA3gVCnCUD324Mo6ON63DH5
	4ZAkzxEORYEXJrRvibUwM9mBkfW7UDOUAObZuykZtj722wOYbx0sviO+i4ahgSesJayQ1ZhUu4W
	8+rJEm9D9BVVa9BgYJk1pAOP2mxUUIh/MnqlMY6xogvXxy8iaas2PlXSzH9A+yfduRWlEnP8yHK
	cdbDbDobyBZQocLazt0tIAfXXtmgJXX+BfqIf+RwQT
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id ffacd0b85a97d-3806113a07emr163663f8f.13.1729878118149;
        Fri, 25 Oct 2024 10:41:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJirsSaLOjUEz6kn7HmxOjIyhE9ZfBrB9GAGHgNcgNSBUFOeNbcRoyDDrANp8n6mxM4gCIddwEWDqpYot15qQ=
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id
 ffacd0b85a97d-3806113a07emr163639f8f.13.1729878117761; Fri, 25 Oct 2024
 10:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
 <Zxbw9XcFCHYR1Ald@google.com>
In-Reply-To: <Zxbw9XcFCHYR1Ald@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 25 Oct 2024 19:41:45 +0200
Message-ID: <CABgObfayH1x3qFjOiM=rQjxiui5tXJXObgR_qOGV5Hn_2QLEJQ@mail.gmail.com>
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Yan Zhao <yan.y.zhao@intel.com>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_104322_626087_AA2D8268 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBPY3QgMjIsIDIwMjQgYXQgMjoyNeKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiA+IExvb2tzIGdvb2QgdG8gbWUsIHRoYW5rcyBhbmQg
Y29uZ3JhdHVsYXRpb25zISEgU2hvdWxkIHdlIG1lcmdlIGl0IGluCj4gPiBrdm0vbmV4dCBhc2Fw
Pwo+Cj4gVGhhdCBoYXMgbXkgdm90ZSwgdGhvdWdoIEknbSBvYnZpb3VzIGV4dHJlbWVseSBiaWFz
ZWQgOi0pCgpZb3VyIHdpc2ggaXMgbXkgY29tbWFuZC4uLiBNZXJnZWQuCgpQYW9sbwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
