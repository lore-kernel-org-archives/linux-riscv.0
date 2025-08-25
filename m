Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458D7CA0FED
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dk5P3tnZH7FTrCvWTF9YfPEATVISC7PMaZaAFOI3vTA=; b=G15xa1boLxj88F
	YcmIyke/00uiqm8fcIlkA7SL3awO1xyZ88g6uVddTO4i1QNMKAVxQq0/zhYIy54XLkynEmMm+Xo5a
	V3z+swKNz/TmdCzt8vS7Hs9jTavtlIVkvVQuKHOMF7egZyFzZaSq8JEchHnbfXOtx2ctnybQoXWWJ
	5uce11POFD7zY8b7cmaxzike4dvnSR9NFJnr2oVgsa3lojOy9BovJ4xA4i90Jm+0HrQZL0GAIcjCF
	ykJCwoT+2pc822/zQqQiRB3yZEZSgJP82M1ijoHtHrdumwfWYIJE4dGW/Xmb+X+weoXsYsQJkJEsF
	BJaS37J82+EkUgPyPl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWj6-00000007zqf-0jXM;
	Mon, 25 Aug 2025 12:55:08 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqUyG-00000007hgb-3Uyt
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 11:02:41 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7e87030df79so477830385a.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756119759; x=1756724559; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1KrFoOnuL5GMtaq0YKgHhpMxoakpxp6Ykplg7n1PuXc=;
        b=LfNrPM1uRyx/mtn03lz3iqE5UtXEsXd0YBziotMpHQ6LShJEzDl4hVVYMfs5vDxzgI
         xynp3zGCTh1uHDH5/r2mhpMCfgK/5dHUFZzvtXkdM/ldHX8D5Zi9iHZkHs71RLI2SQ0w
         SAQaXMxvaxeFAN7qoRwwbAA/gz31HEmKdGl5XuLyFxaASUNerE3NYOe4fNE/xMshEn/I
         cO96sh05Cj6mfcezKpbsRj/JildZqEvnqI3rBn1EtL+Op9pUsTCtxc5Vf1RFS6/hizAM
         4GCqcngovGuFfXAwrl2W1zA9RVKfZs/gtvP8efgNhVZq983scU0/TYzuKfPuekiUIFun
         M2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756119759; x=1756724559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KrFoOnuL5GMtaq0YKgHhpMxoakpxp6Ykplg7n1PuXc=;
        b=un3mH8AD5cJRXTjw348bJ1TarlehAKe4ywg5uWQQecTHH8N7oRhDNXeF7YAtvQwszY
         6Ve4CLMe4vETsYTwDuIcdoT22a5zpzqfjfXg1yZXdgF5XG3TrHuhwb/dFbivjauZLivX
         UG4Up93TTSn/uAqzW3+lcKRqa5FQW5cfndxA+FE/4T5x9GY1818lKqS8zaoAbw6NJnvd
         etwd4EPJ5ueNSsH92542nrhEfgHC8jrrHKxQ3HiM4KYQr9P5XVsIediKYvUt8+gqdcDR
         pbV35qqlMhcdtsQmM6CMCuCoyooyEqG+AOlppVgvrB2Qzo3Hz24/YV56kJiNygnvyylt
         2nXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSbyRB2qpyQRMEINp8T4TqFrnH/3yqF2XZM8Kv1OQetwXlvJ2iV0Ws6W5m01ahMTdXJFR/VU1TtmxcQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEnxEC2c1LCekbEQX1Us7P8u4TJhbdJsXqyTc+fow7SIlCENHr
	lHVQ1AV33u4rfBixd6uRuVoetRm59TfuDS4EKnw79AyNS13WklE7qwolVumC2jYpbLQ=
X-Gm-Gg: ASbGnctm9Rz7ncUw7VWFtxwfnkaH+bb97lhwSTek9D4XeNPgG3HYI8SWJdbp0iB866E
	GRt0AvBQgbUCnY/SuqXrglUAE0/ky3HwY1CuSdNxPUJxf/hldyR8tK1s/nRhB7q/JvQmczwPHPG
	LkkGT2zZskt/vgyG9kUvaGfxSg8DZnam8rZ9+u3CkDFuQurcyiYC3ceOrp9+s91AhwAR6ecHt30
	LFdUZeQMapDtqMIEVZXtSnRwUCjg9iul9V/5H62BPn5rfYOed3sV8JfY3p79IwAoQJb1YwzqT9S
	Y/JQfVuSViOvKmdgdj/hGkgWaxB3cCGcgsWs0+d1MJ+A2EvxM5D6t4DBTVMYyD9wALOXQ/YMWoT
	IqPG9Hhl2dANGeSP+AKF1ibIqWg==
X-Google-Smtp-Source: AGHT+IF+Xp2kSkiYMs9XH9xufQw3bih7peJ51tO8RYHjQC3ESxBEZ2qFaKuTNArd2lSB1l4CzhQLSQ==
X-Received: by 2002:a05:620a:1a98:b0:7e9:f820:2b46 with SMTP id af79cd13be357-7ea11082af5mr1233715085a.82.1756119759186;
        Mon, 25 Aug 2025 04:02:39 -0700 (PDT)
Received: from localhost ([138.199.100.237])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebf3bb4e4bsm463662185a.60.2025.08.25.04.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 04:02:38 -0700 (PDT)
Date: Mon, 25 Aug 2025 06:02:37 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 6/6] KVM: riscv: selftests: Add SBI FWFT to
 get-reg-list test
Message-ID: <20250825-5f0ede7adacb9fcc102d6cca@orel>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
 <20250823155947.1354229-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250823155947.1354229-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_040240_863727_3BFAC595 
X-CRM114-Status: UNSURE (   9.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Aug 23, 2025 at 09:29:47PM +0530, Anup Patel wrote:
> KVM RISC-V now supports SBI FWFT, so add it to the get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
