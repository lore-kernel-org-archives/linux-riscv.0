Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89D0CE8E9B
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5+T5GubrAsUPXowzYU6/X9xOA6Frzo0P9krIq3lmMMs=; b=u480BM+iqmLvllSKCO5cPkzQRI
	WERR9MRzeJkzuepK7ejwj/hO0vRzg+ZoubSLgXfeGL7C/I1+pUlDtGlvu2Mg2vTPhWrq4jBOQDjg+
	nRvt1gJILP5ggtdyfwV9CZbfpBXHv3O/X/gSAf7qvCOnNi7E68cyrd2GogWHCUvYbethLBsf85v8h
	UqiBkrUCMYik2cRpv/VQNskY3szb5N+r0GWNUPVl2MFnKpJ4Ge3MPq3q+HGtw+CQzs2zvrSPHw+wz
	zq/vILleWKQaVltw70HANIuOe8TyXkWEbFCwnl+mGbefX1CyCowyrBL3fZdcKOM7SeVWa0fugr1DD
	E2P/voQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42G3-00000001Pjq-1TY0;
	Thu, 24 Oct 2024 18:08:27 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t428f-00000001OJd-17N9
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 18:00:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e2e2d09decso1627179a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2024 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1729792848; x=1730397648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKFTwGg9t3aAI0dYQJFy+Q5hfy/zjV2LsgAZPzWGPLI=;
        b=usyxAW97BLDThuvPgctsCGw7rq0JSmRKXcP+sOmZwjgNJVoGk8prnso3ujQGBOrk/k
         c31WiI7++YKG5nGa01bOdn32iTlBTJJinqJoLWtM0RaK0+ISRA4hUitoGAzM4lYR+lyl
         7tu277LhXpgEJnMZ3wVFzuIuSJIj9bhI2D+ykENg2JOYkfOJWvqDrwHtZKolQgDl8jYB
         Bkk8p001+L8BBTsFdM6M1k9hW9HqXaTtpsG/dxEsJ50dfypKiuZ0pCUnOu8qjoPmH0z+
         zFt1stAgpTLqq0tg/lQ48ri1EP0lcRBMFXSrApNZQDFYIQgV8TMZLDo3QLrfK701CcWf
         rz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729792848; x=1730397648;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKFTwGg9t3aAI0dYQJFy+Q5hfy/zjV2LsgAZPzWGPLI=;
        b=CwJ6TiR09nl+lVo/h+RGBKhUpFeaF9aAnc2h6srXW8tMUVqHk/RMS1OVowbY+ClBGo
         HiffRmDy/gzZW5vrnP7AnjYnL+8FmpT0Mb1XMUhRHWFJRdcT640CDl2t5NA/Qa6Byt8C
         xyihzuWFWb4sMXf+++x1RY88NtXgvt6pQIqtnYI96t6xhoFifOWj1+g6pgynTtikGuiX
         6aAriO1sJOL9eRXZBUB2Ian39TIkPA1pLw5OD0GQ99bzpQMlilXXWnW5+sZ9Ce3unhEk
         dBNhmsSIcTJigSGtpB9Z8HUxqwDXDlhagmZg2LULuiO2/ecG4GPmk+kMRpMQutJOZlIy
         xjNw==
X-Forwarded-Encrypted: i=1; AJvYcCUuq0KsuguW3KZshkrplh11xTeDLzckEhSM/ien734xwRR3CoDCc0hl01QCVsdZsp9FQ1jyb+a4rpmfiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzajWEkUVqfTcD7KCQLP921MtwL+8poicYWcwaVjoKRLOMKydnH
	rKgDvX7+3S//7yoQDelkY90zrirI1N3txKsSH1H55HmpL3G+3OUE9xg75bVdZdc=
X-Google-Smtp-Source: AGHT+IGiCgZKgSuJv93hUr5hChCUjQsiSQq3PX+NDu60a4swnVwA7uAJkOhnlQF4ihAdw8OcHOqkVg==
X-Received: by 2002:a17:90b:3b91:b0:2e2:85b8:14e with SMTP id 98e67ed59e1d1-2e77e7dca22mr4650526a91.15.1729792848304;
        Thu, 24 Oct 2024 11:00:48 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5df40bf66sm4706770a91.0.2024.10.24.11.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:00:47 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:00:47 -0700 (PDT)
X-Google-Original-Date: Thu, 24 Oct 2024 11:00:13 PDT (-0700)
Subject: Re: [PATCH V2 0/4] A few fixes for RISC-V
In-Reply-To: <20241008094141.549248-1-zhangchunyan@iscas.ac.cn>
CC: akpm@linux-foundation.org, shuah@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, alex@ghiti.fr, Charlie Jenkins <charlie@rivosinc.com>, linux-mm@kvack.org,
  linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-539e6cce-55db-4170-b3d6-cb63e7ec0a25@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_110049_334854_FF57F045 
X-CRM114-Status: GOOD (  12.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Oct 2024 02:41:37 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> These patches are all simple fixes with no strong dependency though,
> I hope that making them a patchset will be more convenient for merge.

It doesn't: there's two RISC-V fixes and two MM cleanups, which makes 
stuff likely to get lost.  I'll take the first two, but you might need 
to resend the others.

> The patchset are based on v6.12-rc2.
>
> Chunyan Zhang (4):
>   riscv: Remove unused GENERATING_ASM_OFFSETS
>   riscv: Remove duplicated GET_RM
>   selftest/mm: Fix typo in virtual_address_range
>   selftests/mm: skip virtual_address_range tests on riscv
>
>  arch/riscv/kernel/asm-offsets.c                    |  2 --
>  arch/riscv/kernel/traps_misaligned.c               |  2 --
>  tools/testing/selftests/mm/Makefile                |  2 ++
>  tools/testing/selftests/mm/run_vmtests.sh          | 10 ++++++----
>  tools/testing/selftests/mm/virtual_address_range.c |  4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
