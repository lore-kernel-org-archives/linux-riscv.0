Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58283C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NnitNC+9ZpzTugWBE3kZhItzH7GJ8j11Q41vy7edx8=; b=mpZO2B7SMAt9VD
	uPk6xVo7+Xt0dgDwkJOh73cOWRMXvD+QawEohBIWnazcy2uoreLAtyrFgLlBnDvvhT9BGJ4czZHhF
	bZvS3K8DEnilVTT1DnVVjFRVQZSbo0rtHt5/LZk0CDVCJPYjaNxUQYt8o9GlWyyfcKcRYbtR5+NxM
	laum8sa3XC19DE4I6l5YQj0rGShuYD74oMQUzKxA3S5Voq3UfebD5CSMQIb5NdA5aScglLnBB80YL
	Sor4LZdzd3rC916p7dtjDbNJl+EB3Yzm608crMOC4jBtCKmmo216qMXjyn/vto4gGP0QGXH5RCOK6
	nKlhnY4tKCCJslS2LrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4n0v-004amp-1Q;
	Thu, 01 Jun 2023 18:27:09 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4n0t-004alR-0W
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 18:27:08 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-54290603887so152525a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jun 2023 11:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685644025; x=1688236025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ctf1HD9q2IXAlWGZe0D1mEr62PaUnWG7sqP8wEigDAM=;
        b=oQgl78QYG5Oj68tYfu28Af11McToK99Xc7cFV/WH2ogHroD1GdfvX22wD/gSmA8aMP
         xqCFWhpZwhyN0YrqAvcKjFZdTkBLYFqwpi+GrPRnAe1zzZL0DZpvRCHlUNlpG4wyJSzO
         KPRVn/di/BWJKYn3/rifCxelC2KwvxVw4Wrx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685644025; x=1688236025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ctf1HD9q2IXAlWGZe0D1mEr62PaUnWG7sqP8wEigDAM=;
        b=Zdy9tXzx1IXlNPPeMiDhzE0fcX1b9e7bDzz7oeWPb+hKYIthNAr2+FBu6LcdGM5WRF
         JoBSsOoHaKlq/Q7W/lBdNEp/j/kxwSz9CHFQM2j5+nz6pmXPh+kZH+wSjOBtc9SVHYjU
         fvpSO3qzR1Ygv+itSh1CuXmWQBDB0iB/sXEb/wsEXcfL9tbidhTI45JgJD2wunccOd2c
         bNUn9Wmada9wvxQMAs/DO7AnSfw7uCWeGdvjx1b9V1GqmWcnAyvEhhALFYXVGFYC3POE
         aeWpIYqZhMJ9qucGUhfugkIg5lSh99ES2WysKju22SJQB63rGeQbXeVhyz+ilzd9Ffxs
         Vl2g==
X-Gm-Message-State: AC+VfDzZFWmb7r4wgGubzq1h9WFG0MRPDCtjDED7haCh6pfsUtTHYe6v
	tku0VNV6VISViqrwMCCd9i6APw==
X-Google-Smtp-Source: ACHHUZ7tPlL1ll6KCGCyuy9FbrvkGPsvnW5z4XOtzglH+OZASYBlfmRDsuL8K30dabeFU2fpmQaSgw==
X-Received: by 2002:a17:902:a710:b0:1b1:af8e:d31d with SMTP id w16-20020a170902a71000b001b1af8ed31dmr151235plq.40.1685644025042;
        Thu, 01 Jun 2023 11:27:05 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902e74500b001a505f04a06sm3797670plf.190.2023.06.01.11.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 11:27:04 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: keescook@chromium.org,
	paul.walmsley@sifive.com
Cc: ndesaulniers@google.com,
	linux-kernel@vger.kernel.org,
	gustavoars@kernel.org,
	linux@leemhuis.info,
	heiko.stuebner@vrull.eu,
	linux-hardening@vger.kernel.org,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	joanbrugueram@gmail.com,
	masahiroy@kernel.org,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	hi@alyssa.is,
	palmer@dabbelt.com
Subject: Re: [PATCH v2] riscv/purgatory: Do not use fortified string functions
Date: Thu,  1 Jun 2023 11:27:03 -0700
Message-Id: <168564402237.2891605.1600418987887898293.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601160025.gonna.868-kees@kernel.org>
References: <20230601160025.gonna.868-kees@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_112707_199274_48FE11E2 
X-CRM114-Status: UNSURE (   8.09  )
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

On Thu, 1 Jun 2023 09:00:28 -0700, Kees Cook wrote:
> With the addition of -fstrict-flex-arrays=3, struct sha256_state's
> trailing array is no longer ignored by CONFIG_FORTIFY_SOURCE:
> 
> struct sha256_state {
>         u32 state[SHA256_DIGEST_SIZE / 4];
>         u64 count;
>         u8 buf[SHA256_BLOCK_SIZE];
> };
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] riscv/purgatory: Do not use fortified string functions
      https://git.kernel.org/kees/c/ca2ca08f479d

-- 
Kees Cook


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
