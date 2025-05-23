Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AB8C54F2E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebPeTP/cWaX2fBwXCuHweUOgtpIDo5vwpWuRFRzAshc=; b=QfrB4cElNcFMzE
	BzcjsfDEmQxCMkyJvkk4VHfnV+g5SXF9GbtbHrN3LVyll7k3Fzn3iD0GHYEnVR/08U6ikU5CPtJWA
	+TkCLeeSlg9VN/uMW/vKYdfDB7c62w+c0Zo7eFrCBFr8AHK5m7/rvZrf26bW0bMuSSu2ALa5bjnKm
	2QvB1+t2tCZywdBt7W4Atl5jeQPo3d9iqbyurthetqAJdWsyYT5FaUf9m3q3hUZdiJpXuy+D3rKBq
	xgAaBWmLlw6jdmCYYw9j33mqbpZNBvlFwHSTwc31y56+oEgGEfM4+0tlcfBQazDoW+635DxJFB6q3
	wfOh6j1aKBIaf8pCd0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISMB-00000003wLL-0egu;
	Fri, 23 May 2025 13:22:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIS87-00000003uFh-12uh
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 13:08:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a367b6ad08so803155f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748005686; x=1748610486; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KARpSC0ktVs2EmfgMj89WaDgPQ701M83Nyx3KMNRgAE=;
        b=VNDsC4xvgbD6BbHVSz6LWeKGWiidBLndkaKvXUXuwayw2QAnnobCtFmrh0gWzl5eV2
         4awzhFPwIictErP/srjajt/geetLyDohejYN6gBUcM0HxX40o42PXeZf5MKJKBlxNt4x
         hN7+MbIf5fL6lbhwkuz3rme6vD4esUbHNfUch4K6V25c4KefUw/zRlHmsD4DxrsrwaTb
         jyEwIwNjgURVR20r/khSABCAtqtV4cdrqtKGm2v+uMCHTZ+kx6VT4LHz1ILgGvc+JOhE
         F6ES1ZM6ICx0nRUvS3hQyAVsSkmRtQiQSxydSHdw5VZHqMr/0RTiQz6Tu4tJmlpSRBL6
         6zcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005686; x=1748610486;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KARpSC0ktVs2EmfgMj89WaDgPQ701M83Nyx3KMNRgAE=;
        b=aaEbuuPhOziq491mmNAnyDkOHVJCZ9zNjWTzPO1KQBEQWADFPLTu7TjRsPha8l41Rg
         PDbR0LZfDHjSuExEsllf8uuf9zodUh5ojT0bm+1Z0leNB2fdvDckFRntR/NcAb6oWZZo
         8tu6nA4wt+6wJ4UXtv8RcDId7gF7+e0cY7isshN+6QzAdQmufrtDz29NlPtcki4RX6tY
         F4GOqg5IpjrDI3waKVXMt5z+Fw+9emn46XIVo5jxFHX53b4+x1NIyEWJNhP20IFh9hLE
         U4AK7L+xyHRHLiGhGKOyN9LPns2VE04wDKNMdrgKSWRjQgdmIxaJs3W7UCTFE9CIKaM3
         MsHg==
X-Forwarded-Encrypted: i=1; AJvYcCUxwUh+xpHsa2mLg4L6/+t3LQjpf4kGRxMxfFaD3BAfZIuIxQGtHAKRhnTlLlaB5UPWrZrtCmpP+Ob+Ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFlRrCbj0ArXzOcWjusZQrq/iwAG+JEYn8Oqh8sjglavGUvX1s
	AEFfBjR1kTQLWxOhYxPi61b2Y/JX+zAa0R3Ewcpz3DDQTnWPxFufKdG+o3LFaqfSP9Q=
X-Gm-Gg: ASbGncsHjAknEMqAIZcq/kAqJv868bVXvioyr9GEFT+8CdDcZKL2xELVwZ4N1KPN93y
	HdRzHpYIFUxHs3NFEinwnNjEPSPTIaTkpdvCpDq+dKdd8kv/SRTIkOsGfZC3p4UYSf5P2vD2kpJ
	9oFCfmN+iex3wmQtYkwRTx91lP33AlPPGCdRgRaXqEn/gQ2o0u0CRWplITcwZMc9+/ZNuWVKhFT
	mmIGltgZMsnTapDLOOexbqiFv2gyHf5KnOmsxHVUdTr5c9tsLdeprTfmImfDKgZG3e9DrfY6vIa
	1UGGxifO11+RdrPrBNMgi6r7ZkSu0e+zxqpP04ivxFV+BOWHAaqOmjgKZHnrO7wkY67ZkA==
X-Google-Smtp-Source: AGHT+IEQlpZ+MHYlhIdSbIKkOQ9vfMtZ42DEnpA7EqlzBwx2H4tZNz3AtELJClLMWV4vaH5ju8V/Tg==
X-Received: by 2002:a05:6000:184d:b0:39f:728:4324 with SMTP id ffacd0b85a97d-3a4c2d327a9mr972266f8f.9.1748005685763;
        Fri, 23 May 2025 06:08:05 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8874bsm26894531f8f.67.2025.05.23.06.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:08:05 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 May 2025 15:08:04 +0200
Message-Id: <DA3KATTIZQ99.2M1SWQ64M9WX8@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v8 14/14] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
Cc: "Samuel Holland" <samuel.holland@sifive.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Deepak Gupta" <debug@rivosinc.com>, "Charlie
 Jenkins" <charlie@rivosinc.com>, "Atish Patra" <atishp@rivosinc.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Anup Patel" <anup@brainfault.org>, "Atish Patra"
 <atishp@atishpatra.org>, "Shuah Khan" <shuah@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-15-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-15-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_060807_285239_E59483FA 
X-CRM114-Status: UNSURE (   4.89  )
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

MjAyNS0wNS0yM1QxMjoxOTozMSswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPjoKPiBTQklfRldGVF9NSVNBTElHTkVEX0RFTEVHIG5lZWRzIGhlZGVsZWcgdG8gYmUg
bW9kaWZpZWQgdG8gZGVsZWdhdGUKPiBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgZXhjZXB0aW9ucy4g
U2F2ZSBhbmQgcmVzdG9yZSBpdCBkdXJpbmcgQ1BVCj4gbG9hZC9wdXQuCgpIb3cgZG8geW91IHBs
YW4gdG8gYWNjZXNzIHRoZSB2YWx1ZSBvZiBoZWRlbGVnICYgTUlTX0RFTEVHIGZyb20KdXNlcnNw
YWNlPwoKKEkgdGhpbmsgdGhhdCBtb2RlbGluZyBtZWRlbGVnIGluIE9ORV9SRUcgaXMgYSBjbGVh
biBzb2x1dGlvbi4pCgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
