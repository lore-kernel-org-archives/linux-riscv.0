Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E789C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 21:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFm00YETaLLmIdpAwEbrXCmIR4x84DowYhWWJtqn35E=; b=rMN2Be5y8bGXak
	nfMlAWeT8akGkgt7aMHOTsBz/B8oW3TBj66FOeTEwReuIepjCgAiAW3VibpkD1NfTGkJbjWho8XoZ
	rCmmbAgBvePWR0+U3t1Pqa8b524BKi/+CiARbBvILuJrInIpicr77lKSgpjzc0CQCRfo4Tch5fGdr
	sLzCLESUd90Zdk0EPBv7JsAkPg+UZVS5x9HdLVKnh7RsQVhSL3UKyhDAj4JCSHWqT1GDo6KpJRViU
	E3yj5Ibe51GW2UsUqNj/8ClTLKPEdLKUU3BQKzGkgJePPXWvJe+1GUYJpaBa5PN3cpaKT7t3BawC8
	1Q8pbIKRsATm+FvNI9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1DC0-001JD3-GI; Fri, 02 Dec 2022 21:03:32 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1DBx-001JCY-6h
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 21:03:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id jn7so5695503plb.13
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 13:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKNPL0gFXJWzgjoUQUUlKaMR1OadcdNig+zrCqluUos=;
        b=KYJAgnLoMBpwFobGI4tq+NzE5ExvyBMduQqBVu/Lb98EtbdGuHmyCO8NQXu3CZHW0R
         0V6DueE2dXyQtt8hm+mEiouw0qItMJ7nj9s+QUM75fk8gk2jcOf3VUOHz7jSrEAq1jp5
         ez5m02ladx1OxheZEOznd79clQks4O/+SK28vMorHyg6G9aKNIuJORxZeGkr0qTbp5b/
         3G0jL+qZ5pr5o4VEcvIQfPzTV4x1ebR2nfay15mMG6fA5CXsLp3S5ffKDzaKTd7pyTNA
         3Lh7ITyGI4ulywkcfvVwsNNa7AfGRwlpj8oxnnhvcfnpHD+nelMv0jG4timCLDBeWbQr
         /tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKNPL0gFXJWzgjoUQUUlKaMR1OadcdNig+zrCqluUos=;
        b=xlkPEbpoOwMOoT0a/UhT/ObrdBMcnKv8t7A79XyOSVq2lAdi/P3qv+4OyUzr3fhDCe
         YYJt2yP2DVtNLn/y5tuQWswOzNGXZXw+EKgzixYlnUN4NNjGY5mz2WrxVGCNKLys69J2
         E6QX5XYlUfZWNaBstsbRncj5BqyR0oofGZYBjj7XoSM/CVilzqYDXHgfvEPtGAoxbNpX
         kTsOjMmMavzCRxIPiOrjpBXah94zSa78AyA5JZmfQ594n6Y8AVU80bjttj9m0lso+hX3
         HtNJK5uAWyXaYs1OdSGHDlp8DvSg8MQdShz02Uwj0cjhwmMsR3tDKZzAqkX3J2I1vpcj
         G6/A==
X-Gm-Message-State: ANoB5pnW3e+M9S4JKGhdz3MXTrgXRdCmv2U9OVFYLy0foY2rPmLQ6A8U
	DKvfjHhc1lN5eJ0fa8xFnVf65w==
X-Google-Smtp-Source: AA0mqf5dA+RuYdi4h3k9FHaZsXm3v3kMmx7jTBqXxze55tfyneQvhH6wbRdXpIyFAOlEfATCfwR7eA==
X-Received: by 2002:a17:903:2290:b0:189:93bf:b5d5 with SMTP id b16-20020a170903229000b0018993bfb5d5mr23593776plh.145.1670015007023;
        Fri, 02 Dec 2022 13:03:27 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id k60-20020a17090a14c200b00219220edf0dsm5102107pja.48.2022.12.02.13.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 13:03:26 -0800 (PST)
In-Reply-To: <20221024094725.3054311-1-tongtiangen@huawei.com>
References: <20221024094725.3054311-1-tongtiangen@huawei.com>
Subject: Re: [PATCH -next 0/2]riscv/mm: two modifications on hugepage
Message-Id: <167001498712.10811.4574922810264344403.b4-ty@rivosinc.com>
Date: Fri, 02 Dec 2022 13:03:07 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  wangkefeng.wang@huawei.com, Guohanjun <guohanjun@huawei.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Tong Tiangen <tongtiangen@huawei.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_130329_452319_3907E0F2 
X-CRM114-Status: UNSURE (   6.73  )
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

On Mon, 24 Oct 2022 09:47:23 +0000, Tong Tiangen wrote:
> Tong Tiangen (2):
>   riscv/mm: hugepage's PG_dcache_clean flag is only set in head page
>   riscv/mm: add arch hook arch_clear_hugepage_flags
> 
> arch/riscv/include/asm/cacheflush.h | 7 +++++++
>  arch/riscv/include/asm/hugetlb.h    | 6 ++++++
>  arch/riscv/mm/cacheflush.c          | 7 +++++++
>  3 files changed, 20 insertions(+)
> 
> [...]

Applied, thanks!

[1/2] riscv/mm: hugepage's PG_dcache_clean flag is only set in head page
      https://git.kernel.org/palmer/c/d33deda095d3
[2/2] riscv/mm: add arch hook arch_clear_hugepage_flags
      https://git.kernel.org/palmer/c/d8bf77a1dc30

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
