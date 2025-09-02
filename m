Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82401CA1005
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFW1EFVcEJr547cpDkaDr7gBDtp25daN0sNf6JkBj8Y=; b=OsSZiNPaWpFWM1
	7BsaDyA8IyrePmTEFZd2H7qi9kHs5PPgzyX2b+oan8s38HSnRRfHKEV2ado+CG8oYHt1R4afYJQvz
	fixzO79LGzOQ5G/BeVWNRTTcNZkh1dQ0YH+zRGJuJt2U2QdBNV7CdFjdYR4+6/Hu3M89WFxci4dIx
	DoXHtUmQ3HKfBzagaYQ+fp0SdiPXa/2LfdIeePRaR+0i7OVEhq1xTPk9PIFPPzUsZCnh2QdPFfoJB
	jgx2cgYeiopMcud3sOOZ1/W2jXLa/E336D2LpOiZgzDb7DdjUH9W8RLjZrxpcVCh/ms4v1qRZsUnU
	Sw981vJ1EZWoyde8ATnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYnz-00000002D5v-2Fkh;
	Tue, 02 Sep 2025 21:44:43 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utULq-00000001555-09GO
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 16:59:23 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-afec5651966so413673366b.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Sep 2025 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756832360; x=1757437160; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtcABniGBGfe4M36DJWdff4JzQBtomJlWVOqnivR4+0=;
        b=VDul8WpznYaDCf1jsSBtaMc8ISGdyIONJaS00DDkDAy+fuCw9pecE6DV0WNwCkYzyx
         /x6FJ8pCtTO6opd4zc1MZBBw+oacRuvSrYutQilrVRMnO4hyh6AUWSTPZNiWSPFev48U
         Usu5OeQyfJZPJMm3UGTLsgjmL2BGt4LTm4noEl2ohXAwYXA0e6ylcJf/6E5Qw8d1N3uS
         z8iAYNDLPZGYt2KRbkHNX8/3hp3L/nTy9o6HCVz9u1fzaf9RwqKPVVuS3stPYbY5/phW
         F1IezWtTlTImudVjPZlGB7dOXV50tfjqdsXZn+29tPNOcB6udKF9kv4P7UDOhsXtccT/
         W9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756832360; x=1757437160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtcABniGBGfe4M36DJWdff4JzQBtomJlWVOqnivR4+0=;
        b=Ofn2eYDshsKCwq8RDMOkLlnvAiuCEQrYCAR+AZJqLGm6SJaJzaRiXQiqHUfEHdmB0I
         UZOvEf4SBLNwzkhkxt49QMkI+UfLSl/0T2mEJjE52ij+QhFzB9w8UhmY7gcRtem7HTy/
         UxTlsIFLvrAS19TCoQeKVo8l6lXqFjzy/nKn8ACo6ippjeV21mWIlDzCC2jq49+PvtFn
         t2aCSO3MyuGRZI0fBnY6B4hHQiAKwxdmR6luyCpiE2ro8S5vJ+dFjFdHTHsi8V8jzAf7
         RzuDCgfc6JSTWbx6WKsr/RUacAHJHTqL5H2SVUXQUS7UGGHIlatsHqxpG/9awIGKfLgg
         FHlA==
X-Forwarded-Encrypted: i=1; AJvYcCWLayvQamxLtW94SPID/dLhnzly0QrsyJEzAnZyyJw6lGg2QYjL2+qWYxYhFVUYX+5GZGGpMoxtJVYvww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx41emwaCNeIeedPUzEpW1/WbR5d8JflkKQb4hcUWZpPNwaoZxA
	dVgiyBkxXFWQJmn2ZybYEOGW2e+OOuCg2iYnMoQ4pAxHKlSck1FfyVzf
X-Gm-Gg: ASbGncuzcTIGjWY6d15ojX868xO5NbB8MeNulq4iNNg+OchcQVGtrSU+ZVBBniFMo/p
	leJEHzU4+segrw+sj976IE7NitAqzkWRzGlX/hS8jM3AvNoC5ToXe5V0suIUQ9MKBz5u/V2voyC
	92awTGfA5A6LB5pOp9syAi8q6SQG3X7gL/cXk0AARZ/pO/ga7/3Tp00a59daU+x5hBPZ/aJmENm
	lV8MKaK7oIds0PeXh1ffl80fFJD+bR2SF/TFdam0DN46LHr3/EvRvF//FxccBbMQsvW1Xg2XAgi
	ZRCdl4ZoSZengAPFLROjYKd/uRoFQGfIrQ9LODhMzPV8Mwbcu2MQ3qIMh2KOerahTRSUrXy6ekq
	MTxxdnyhGiRAnr608WQ==
X-Google-Smtp-Source: AGHT+IFmwKHYfonApFOOGip4uG3j2rTCt9Nr86ZM5L26iKq4gF5nLZmvoVLWR3ySUVIH9PxrFVWW8Q==
X-Received: by 2002:a17:907:1b22:b0:aff:16eb:8b09 with SMTP id a640c23a62f3a-b01d8a2639dmr1080892366b.5.1756832359853;
        Tue, 02 Sep 2025 09:59:19 -0700 (PDT)
Received: from andrea ([151.76.45.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61eaf5883b6sm3236369a12.20.2025.09.02.09.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:59:19 -0700 (PDT)
Date: Tue, 2 Sep 2025 18:59:15 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, ajones@ventanamicro.com, brs@rivosinc.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
Subject: Re: [PATCH v2 0/4] riscv: Add Zalasr ISA extension support
Message-ID: <aLciY2putG8g2P9F@andrea>
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902042432.78960-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_095922_073681_9E8DBE82 
X-CRM114-Status: GOOD (  11.10  )
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

> Xu Lu (4):
>   riscv: add ISA extension parsing for Zalasr
>   dt-bindings: riscv: Add Zalasr ISA extension description
>   riscv: Instroduce Zalasr instructions
>   riscv: Use Zalasr for smp_load_acquire/smp_store_release

Informally put, our (Linux) memory consistency model specifies that any
sequence

  spin_unlock(s);
  spin_lock(t);

behaves "as it provides at least FENCE.TSO ordering between operations
which precede the UNLOCK+LOCK sequence and operations which follow the
sequence".  Unless I missing something, the patch set in question breaks
such ordering property (on RISC-V): for example, a "release" annotation,
.RL (as in spin_unlock() -> smp_store_release(), after patch #4) paired
with an "acquire" fence, FENCE R,RW (as could be found in spin_lock() ->
atomic_try_cmpxchg_acquire()) do not provide the specified property.

I _think some solutions to the issue above include:

 a) make sure an .RL annotation is always paired with an .AQ annotation
    and viceversa an .AQ annotation is paired with an .RL annotation
    (this approach matches the current arm64 approach/implementation);

 b) on the opposite direction, always pair FENCE R,RW (or occasionally
    FENCE R,R) with FENCE RW,W (this matches the current approach/the
    current implementation within riscv);

 c) mix the previous two solutions (resp., annotations and fences), but
    make sure to "upgrade" any releases to provide (insert) a FENCE.TSO.

(a) would align RISC-V and ARM64 (which is a good thing IMO), though it
is probably the most invasive approach among the three approaches above
(requiring certain changes to arch/riscv/include/asm/{cmpxchg,atomic}.h,
which are already relatively messy due to the various ZABHA plus ZACAS
switches).  Overall, I'm not too exited at the idea of reviewing any of
those changes, but if the community opts for it, I'll almost definitely
take a closer look with due calm.  ;-)

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
