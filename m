Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EE8C02181
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJ8OukONa2TGHsaR2IBSqdKm0xA61pyvEXzlhbfKzaU=; b=qOI3gq8rrRPRD9
	9SHGCx1Thm+nCOK1qRzZkQyHVTUIx4/K0MlwOIeJ5kQiIuOcDeWxkq70bHzLLfsgnf+w4RaDmDxpo
	eDtmMR+OgdDTQvO/gsJ5wzwRBzFLVOE5GZBn7C7B9t/23iYmqdb2gc/MjJQowQ9jDgcH7/15rCkdx
	4vb6Mn6GJV7l5W/wMepF2zMcTKpkXTZQAOPzLZBe5pGWF9Dz2TFaQNxvOjgHYpsiCJ3qhGv76f2dX
	xr+C/CeTwjtMlY3edM2juvpjEmjoeyKD1Cuf2P24490JNBvM55LqbMRLb3H2Fq10Yj0jLOra7h4BF
	KD1QftMy+JMcY/lTAZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqUX-00000005V7W-3hUm;
	Mon, 20 Jan 2025 12:02:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqTZ-00000005UtC-1Vj7
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 12:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737374511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SYKfxNFYxhC5tp+ktcnepFGyB0OkMabGlnwkvsEEmFw=;
	b=K2PEmxiCdeGns8wIPrO3DTuy2taCT5/Lrnd4jITsK53B1DyVnOG6HTFi+T6u9mGYugTSrw
	uQB8vI0/DpvkACPGldiEykdTfa2YbqPzrZ0lHo6Z/RQskpt5QTFDkQgCOtnDJBCuVebZS1
	V+ATiVbpaNsPxydgrBsi6pOnonZt4aU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-49e2_Bv5OgmMV_bvZG129Q-1; Mon, 20 Jan 2025 07:01:50 -0500
X-MC-Unique: 49e2_Bv5OgmMV_bvZG129Q-1
X-Mimecast-MFC-AGG-ID: 49e2_Bv5OgmMV_bvZG129Q
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2eebfd6d065so12424436a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jan 2025 04:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737374509; x=1737979309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYKfxNFYxhC5tp+ktcnepFGyB0OkMabGlnwkvsEEmFw=;
        b=NJi//KtX/2VAsv+IpNfTL6SOF8n7MX8XsUDLlgu01+hxWg66cICR28g0jSP4euT1Bi
         81GnAIWolxf7+JdEqzLgxPX3urURYdxrxKAlRLBFVSw07pVlbaeZkgWFygH0xKQHPqZo
         T8CsZI0lCBc0nfKVsa73s6QpbIdG/Uv9J1OcP8f09E+6UVUZsA/6dN/H0zR08KdIagJW
         2u9T5Fzsb3DvoNj/IZhXc/OQuu0MrrqozTeLPCSkVN/val8aJ1CDVOgHtaeoE931BWEp
         hScKvEaOm1J+tUWifoo25TB09a/5eLllih1q13FPmKNzKIUc7RLiTurvxf1K6wjvSgtr
         AMbA==
X-Forwarded-Encrypted: i=1; AJvYcCV4AcI9vuTR0lF+8QDoDd5c12NQ5/SMsB90OlUdu8WVJrsPOt/TRUY1KqNbtE8FOUTZJMVHnH1UQrtQHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUxvep84rvgaMmsSE2MH0tWTfontwUwS62YoEgbXstbp5cR5X4
	44sndMEwzOZmeCnV1Ie1zZtiB0DmY/wkSNrc4tr6nh779Pfb/5IAkU7Ut29b6P2WzvouT0JDPJh
	SJcXuJ2ycV4QwxW+KynTtFZqPgAXPmERXt7xpiqdVjLKo+3zxhoRhwRnQtEXQN7Hhp/W8/igpT3
	fsz69r8NR4TPeTBmWhlaVuc1Izt+H1vkDv9NVGkIov
X-Gm-Gg: ASbGncvBDJTa0nRox/xCC28aeEy3ZAbfurzkgy/DrWS64Whktw5p9rimYB6lRP4T559
	/YTv15jEt2Giu2lwQtDY71YmtZW2ivni9BZPVukSqlSeg4lJ/1Ar9
X-Received: by 2002:a17:90b:2cc3:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2f782c628ddmr20773373a91.7.1737374509052;
        Mon, 20 Jan 2025 04:01:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1LRLBhFZRWB2znAXBn4FAGacB6x+A2zIQjytthY1v4NzuLkQgTJ16dSmn9MOSylm4ule4XauLDBusH8m7pTM=
X-Received: by 2002:a17:90b:2cc3:b0:2ee:d193:f3d5 with SMTP id
 98e67ed59e1d1-2f782c628ddmr20773345a91.7.1737374508813; Mon, 20 Jan 2025
 04:01:48 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy1ekLq08nByCh9E-ZZsMcm7rCpkA+FyAPwvQctEgjwFZA@mail.gmail.com>
In-Reply-To: <CAAhSdy1ekLq08nByCh9E-ZZsMcm7rCpkA+FyAPwvQctEgjwFZA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 20 Jan 2025 13:01:35 +0100
X-Gm-Features: AbW1kvbcdodU2ZG1R0TokIdouSIf64beyJoIpVpvZuIpYKLq0Y8X83srGMtTqWM
Message-ID: <CABgObfZr6txxPVKB=tDvhFbFORCbP4rHmuQJUjVJ6hi2c9kMsQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.14
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WIo7dVDxYO4YQHeQfXV-66_ZgAfbRzBFrvTU96HLdj0_1737374509
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_040153_473692_443D1D3B 
X-CRM114-Status: UNSURE (   6.52  )
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

T24gRnJpLCBKYW4gMTcsIDIwMjUgYXQgODowNuKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
S1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2LjE0Ogo+IDEpIFN2dnB0YywgWmFiaGEsIGFuZCBaaWNj
cnNlIGV4dGVuc2lvbiBzdXBwb3J0Cj4gMikgVmlydHVhbGl6ZSBTQkkgc3lzdGVtIHN1c3BlbmQg
ZXh0ZW5zaW9uCj4gMykgVHJhcCByZWxhdGVkIGV4aXQgc3RhdGlzdGljcyBhcyBTQkkgUE1VIGZp
cm13YXJlIGNvdW50ZXJzCgpQdWxsZWQsIHRoYW5rcy4KClBhb2xvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
