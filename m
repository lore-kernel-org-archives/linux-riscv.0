Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E26EC7115C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jq3nU2Bzqr7pFKJbappSV/8ZXuoCUYkE/+YYJRFqpD4=; b=3yCEposEzmZfjW
	MB1MUldijvKoK+QRUI0ulF+zPmesNIHGQ6CGSmWbnybvXQMEWvIG0kkj4yfEMeZfOkSEXKE4r7dPa
	aSw8AhZ0NbIkteqEb88ej/iF2DwCgoq6PrYCInRYM+nompKnvPPuSvp54xPQR9N54ENLzDVKGiwWX
	bDVWSo3ECTzlHH7n6R0skbg9mu4L+8sB/7SQuaJ5uTYvwNc3SboXKUp+aG8BjqCgneodaPUjQUlrl
	xBx3lrbyZcB7fe2t4Ml012oaRA4yZDNuycId/XvnmgpSFuo6Efc+EloDqE5nuSD2ssWrFx2WuEEEn
	72hVE4cPv1IIaNMo5r/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbJS-0000000Fc2N-18ae;
	Fri, 20 Jun 2025 12:57:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaTw-0000000FWtp-1hcY
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 12:04:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso290633f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750421071; x=1751025871; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XeTD7cN51Pn2KJSTE1mvF0ehQNPT1Jdjz2pWXS0RPo=;
        b=a20Vg2EpwDsTjXumuOOW2z1CYQiCqaJ+RkvE87V5OFbZ68swpjKzYSNnvP9iA/o2Ia
         vHjepT19ki3+MpDzStfa8SJdDT6IZBjAm2Axdwh6JMKvcWmGShQ68zObmahSwcoi5iCl
         AeYh5CVgExsEIlJSF8Z1co8FiYq+dXZx1YzcYs9crkW1pBEsbJeONaGEb1U90X8K70Bc
         loBtgF5ftSVsKDHQKaKfwPMeWWbDwzx+pnWf9rKDJ2BrMrzIkFGo+PyodtkgUM0UN+IN
         P5GtEhoEjMxWAfb2/Q8BWIdkb+rNZ9ibXVFGeLaFtlfxJih2OPMmuZKlsTDBFgNJ9MM5
         MnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421071; x=1751025871;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+XeTD7cN51Pn2KJSTE1mvF0ehQNPT1Jdjz2pWXS0RPo=;
        b=xQ9FXGVst7w21nhaRBNR1a/lcHPjpdn19qM9bmjiWJRVRN0PWP6DJmKzd46At9Vg2n
         WmLzmtuQfCcpGu/bKp6LPKvtZe/WNkXxWCf17rGmUQmagF7+OBn30xM+YuTMwm1ITLlH
         E+KWvRCE6NZtkpf7wtpx4aY5bFDczCNf1yLmprSxSr5uVB1Df2M2xnWLikxC1DWRAfnR
         KPpiDMeA8Asv23JNfkLplicT89R5S4CvA7kn2Ro7EcxkZTfqaK2VJMKp7rW4ZlPYyorS
         MI5WA323HX1Ndt84olfk5KXFtSICDZBRzVncpe0zdcWPJpF0KLx8VZ95vg6LmJ0KwPv4
         NwEw==
X-Forwarded-Encrypted: i=1; AJvYcCUgWyaP2liegilHWneCJlS4h0QISTHSdjNUeHhp8kVdLeL/3+n4m9xChv8FCpmXkTvSkotwenDmYv6k6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTMYoezC/hQiSBzrtVaqxiTDGxgPK+y/CS/zrxBOPqGgIDavBx
	vkeQ1NiHwZhlgHhOb12JY5zYF4Le4bWqFkHTHIhnBBN+d4QfjhzwAaRupmZUSlhdaGUPhjt+Eu9
	VC9Ehuhc=
X-Gm-Gg: ASbGnctqt9HUhXa32WMCbskHPaeUnGqNaQGMxwnrT7if0FTQGSlh5WFLPgm2eMEBzTQ
	iYAiIhUWOrVPjLs27RL69TUkMsrOG3i+bnelz+NoOHx+PMcRrEYvdBP5IHmh+2SkX4rlvx7MHdX
	KyqUosbZ24zAlXD53N4Z1PLD0txzo/7uSpMkbzF2MxOpRN6WsSdkr8CgeUbYg/yxjZjzeMoSdrH
	ft63u+1XlErckAp8eI3aRjJJcm2funOf1SjjDIKPg7raq1eMMuKGCU4b/wTQG2Q80sLBabP8Z0F
	Enx0qBeYT21bT8QlTNBGWCvvkLVtnB08ggqwJ4LhMKAa704Z86m8exKodKnoLhPkw3hy
X-Google-Smtp-Source: AGHT+IE5Nwx55CYVDH94kaBUPm5U9VYUEHy18TPg0VqIF2/T7Ln2PcZvxS2VOj8pKTt4zB2/NGi+iQ==
X-Received: by 2002:a05:600c:c087:b0:441:c1ae:3340 with SMTP id 5b1f17b1804b1-453657bf6camr6628245e9.1.1750421069056;
        Fri, 20 Jun 2025 05:04:29 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:81c5:fb37:d08e:99a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a5fsm57299655e9.34.2025.06.20.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:04:28 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 20 Jun 2025 14:04:28 +0200
Message-Id: <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Xu Lu" <luxu.kernel@bytedance.com>, <anup@brainfault.org>,
 <atish.patra@linux.dev>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250620091720.85633-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_050432_448726_D58BC6C9 
X-CRM114-Status: UNSURE (   5.94  )
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

2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
> Delegate illegal instruction fault to VS mode in default to avoid such
> exceptions being trapped to HS and redirected back to VS.
>
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> @@ -48,6 +48,7 @@
> +					 BIT(EXC_INST_ILLEGAL)    | \

You should also remove the dead code in kvm_riscv_vcpu_exit.

And why not delegate the others as well?
(EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
 EXC_STORE_ACCESS, and EXC_INST_ACCESS.)

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
