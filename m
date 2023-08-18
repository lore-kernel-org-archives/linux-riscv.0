Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B867EC678DC
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 00:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FWv0gtZj89wgBYIyB/JbThRfBs5zuFG9tjW6f51/qoc=; b=qscWMntGl0Ut/LTg5srbjb34G8
	/kWl/OYMuXTla3TQe8LYuGWkE8p8i3/0zD5BZTsLAqAbLz4NxoRwFSQHuu7HpZKtI8am7Tznj/FzH
	6F/AT8w7kY6J8joI+R5pY4f0ZgJY2kBIR9T6JWr8CE9hLsY9YE1lNsdmh6BWIkMaZN+01bwi/Nw5i
	jxBdf0+K+aamt4DZxTcAz+rOGmAuQYxm34H+t/rZLDFmD8FI1Doz2/BZWlnnbRvPrD9wRftP7LtZH
	M79IeZobUIJsy4hOU4RFAIZ9K0PINbLNlD2ZlieLMxWajw6298yrFU+TIjD0jq/hcKmuOWG8JSkz/
	gBTwMphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWn2w-007OJo-2o;
	Fri, 18 Aug 2023 00:08:58 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWn2u-007OHX-1I
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 00:08:57 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-58c8b2d6784so4402197b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 17:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692317333; x=1692922133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mE3f+VMf8SgNE6cCbkcfMUP8Hiy9b4N5xYpI+7a+l+E=;
        b=2oU9BIaw0ILeiNHyHsZk7TDIJto4bfSl6FpDcbZRzJHFWDHvsw1Tpz4Q9Z++SpwVVm
         JmUyxEgAq2LjZzc+OkhyeF0ADm+bu03vFWElhLKmVcXuodsBknHK0n2IWaJQr+FjH/Z4
         ly63wavRjg8vLggYRlwWHybAT9gNxWq5j3pZ0p0w2xXzXTZlhASOY+NoRS2/AtMtjhTQ
         nTZWu9PlR/5rleTIvIDNYwbMF6iZSL/aHkUyyZqrHDOanbSxez20kKr5PC6Ct3iYGtdC
         ypG1bXEpsnYr9lf8V1DpKfNV0BYeA2in/OciIOL0bd/uD0xPHtdS27L3UXNyt2X2G1Wi
         /49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692317333; x=1692922133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mE3f+VMf8SgNE6cCbkcfMUP8Hiy9b4N5xYpI+7a+l+E=;
        b=F01Yx3f9zX+o71shZdArHSMr/Xb4KnihXTZmu81kwqzXP0SQmsU8/WP5ylbWnZLlFp
         JIl7OQjJs9JOFPXfvZ1O6a07EXn+TUOQ6UwIOCjLOFSPIq/Eft0+KR250cuNF9xU3iY+
         u5aJs7E92TRPn/Lx/MekykqspBnfsziVIdafbHtjuK9xlt4YoLaUttlTW3b19M6qmdRG
         iIlm9bgxHypAwibVRXT1giNm5X3tKtaA68/ILPchIu1FlawTmfjE43w2wUXBykbGiggd
         m3r9z+b+zP4IrrpFI+O0VC0i3tc0YIE/WxzLaW2k6t46p1rJc7KMwKGrJ0FU6eXMr1dY
         2nrw==
X-Gm-Message-State: AOJu0YzQEFRP039gpnG1yjAry3xqylCdBN7eJolOiU/lhq7yNBGLcl9V
	Fq4g+uxTdZUTrvXpkr95ISmRVrxO+wA=
X-Google-Smtp-Source: AGHT+IGvQyAfQmNzh/hNJU4kHU1VAazzXRBOVugeRSHej1YWD5+faOfCNQeeq5lvAq2y2Br8ZKMaZLXhQjo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:4113:0:b0:d4b:99ce:5e51 with SMTP id
 o19-20020a254113000000b00d4b99ce5e51mr13582yba.6.1692317333678; Thu, 17 Aug
 2023 17:08:53 -0700 (PDT)
Date: Thu, 17 Aug 2023 17:08:36 -0700
In-Reply-To: <20230729004144.1054885-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230729004144.1054885-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
Message-ID: <169229683179.1234886.15097906251075154792.b4-ty@google.com>
Subject: Re: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yu Zhao <yuzhao@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_170856_444796_A91E7A97 
X-CRM114-Status: UNSURE (   8.23  )
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

On Fri, 28 Jul 2023 17:41:44 -0700, Sean Christopherson wrote:
> Wrap kvm_{gfn,hva}_range.pte in a union so that future notifier events can
> pass event specific information up and down the stack without needing to
> constantly expand and churn the APIs.  Lockless aging of SPTEs will pass
> around a bitmap, and support for memory attributes will pass around the
> new attributes for the range.
> 
> Add a "KVM_NO_ARG" placeholder to simplify handling events without an
> argument (creating a dummy union variable is midly annoying).
> 
> [...]

Applied to kvm-x86 generic, with KVM_MMU_NOTIFIER_NO_ARG as suggested by Oliver.

[1/1] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
      https://github.com/kvm-x86/linux/commit/3e1efe2b67d3

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
