Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D29C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 02:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tZ9rh+hUnV4U+2xpeh99ExDh+N5yezoiBkjI0XHNlI=; b=L/ghbebpoEmqK+
	vjHkqBGtAMy/kaGdTHra1RouSLdUZ2ddYeyGkX7uHxj8qT1sGMCn6oZRy1WY+XwSCmzplfc3MiXno
	PdUhNpgWbzexEAQQOyn/+mpuWXfJzQH1ew3F7fJWSh8q4+m0U7PkPsfR9eO7H+NR7ktpYWKR2x0s9
	XYYqpiSiHtOE1RBudPNHj8QpEdsmhmib9Arr92Y2kW5zN8kz2m//rCHiXdnZ+5VvGjCnqdH35o6lc
	F2ytBjQDC3aDCssRsfvZQDCafXpvQqiXLXqE+t6cIz0LsgJxuUnx9pYrxa7NycVIQZ8LE9q5xPMnV
	gsh1DaIrFR6gpSczfCSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcGhP-00C2DY-0D;
	Wed, 15 Mar 2023 02:17:07 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcGhL-00C2Cc-2u
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 02:17:05 +0000
Received: by mail-pj1-x102f.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso381728pjs.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 19:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678846618;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwBAR+UkxMnSfUf34bmVcyrSKlfEQzQsi3AcgUhJuek=;
        b=hNro0VYbQSfFtDVDaIf8e99lkLrpi4+NJoIs5WZJa4CntRov7RB69q2mwcM42qUx5l
         g9GgiQC6B2UamSEaNjQnBU1A3FFBZDdFpmx8mz4erk7PkRwNQRmcgmOssvTL1qnsqmyo
         5jCzMA2OWQPpr/51QyzQFX9rDCchGqvjtDSM28LN+hZubaVFxHc67WnyRVAf56Ae6C3q
         YjNQsJ2XUWMSVWYbN8Zd/9UEuKDvMvcnqEBWIQ6yDIjhOm8Wdreq9gLp8B5MrKzdg4dK
         zNKyqGvMupSc/12QkDBLaMC3d9mKrJbQ/7Q/ObZD/cJ3MPo/GvqGujaSEhMfOgxpj2Jc
         pbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678846618;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwBAR+UkxMnSfUf34bmVcyrSKlfEQzQsi3AcgUhJuek=;
        b=zMddtMPlJMhwocWXhEzy4Lfv+2teSvbgVGkojzGEbC2EU3fTUl161WXpwgfgP9mMjh
         ablXHPi9agzAqYw/y3uhgmIeslPApNp1SeOncXBaTbEkjrjT8LYv7gPRxx8y8y8en4NA
         5/g85VZEQuzZV6kOZ16tJ4dl6k642Q6srt+IkNZ0vbtUA5TUz3kHhkN1KnjvDrcivuPk
         ryOoMsrjpPktrDSrQ9eTBa1tmRBX2FnrihBCK2h31aV2G4HDku3uED4RPT6NrPLvFK52
         M+/tbYmr4LYC6r4FlYUobf+OmVHMTu6FS72fUnB5SErV8iZLim3arHIV0V2zvFfLiFeK
         i9zQ==
X-Gm-Message-State: AO0yUKUfDR32D+G2vhvGT6MynQsj2dIOqTei/pAS1qj7U18KaAo0vulE
	j/MO/tA++lD8ddOZSv7wC2YXxQ==
X-Google-Smtp-Source: AK7set8jkF7aJ83Dj6iCO3ZNZNSDYLalFWoPUkQVlz72eQVIA4v6Kt12UFvxcYv2mdDdffdYMu4PiA==
X-Received: by 2002:a17:903:2844:b0:19d:74c:78e5 with SMTP id kq4-20020a170903284400b0019d074c78e5mr964618plb.50.1678846618049;
        Tue, 14 Mar 2023 19:16:58 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id kf14-20020a17090305ce00b001a064282ce5sm2331959plb.294.2023.03.14.19.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 19:16:57 -0700 (PDT)
In-Reply-To: <20230310075021.3919290-1-dylan@andestech.com>
References: <20230310075021.3919290-1-dylan@andestech.com>
Subject: Re: [RESEND PATCH v2] RISC-V: mm: Support huge page in
 vmalloc_fault()
Message-Id: <167884655832.30922.14980065995349775052.b4-ty@rivosinc.com>
Date: Tue, 14 Mar 2023 19:15:58 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: liushixin2@huawei.com, x5710999x@gmail.com, Bjorn Topel <bjorn@rivosinc.com>,
  abrestic@rivosinc.com, peterx@redhat.com, hanchuanhua@oppo.com, apopple@nvidia.com, hca@linux.ibm.com,
  aou@eecs.berkeley.edu, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
  tim609@andestech.com, peterlin@andestech.com, ycliang@andestech.com,
  Alexandre Ghiti <alexghiti@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Dylan Jhong <dylan@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_191703_999774_69A3FA1B 
X-CRM114-Status: UNSURE (   5.61  )
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


On Fri, 10 Mar 2023 15:50:21 +0800, Dylan Jhong wrote:
> Since RISC-V supports ioremap() with huge page (pud/pmd) mapping,
> However, vmalloc_fault() assumes that the vmalloc range is limited
> to pte mappings. To complete the vmalloc_fault() function by adding
> huge page support.
> 
> 

Applied, thanks!

[1/1] RISC-V: mm: Support huge page in vmalloc_fault()
      https://git.kernel.org/palmer/c/47dd902aaee9

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
