Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B977CC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 20:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ysDs1bSs3UzBOV3syHFG987USll33h8QDUEZV8HnfLw=; b=l3aLZOdIZpC6/HZzVQJsB53AUe
	TvjywTthgR6pzuFzTedPgbEtXBQ2VceBF6Qi56vH35y7WBjATw2MiNPb2Xx0rlUuj7gFvDl4AxS3X
	IiDk6T9O8S3Y+lWUw4iYL2iTwisl2xQJhN0gdR8rApW7xoKlazugARk4frfyNDnN6JfeFOtWyMYRu
	qdWdVik0sshwJKMilylE5GvI1NtEU7YfQ+hXwPahbxBdPbyUiY/QwZc0RYEjfu95vFBnk6i7wB7ZO
	Ca7tWGeqUKbxAUkOwL9fNbCHY66kTqMvgBv10znnL+HAK1cGWi9G94r5OsBxv6+M5SP1jtCeRBE6C
	kPU580sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ojP-004qCx-1m;
	Thu, 01 Jun 2023 20:17:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ojM-004qBj-2v
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 20:17:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b01dac1a82so7803455ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jun 2023 13:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1685650625; x=1688242625;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjlZZ6nKS4GkUYpJEs75tROJCn6U9CxfxsCk2Sp4Rbc=;
        b=aDdbymcrnaNTB9sTEUjXxYlQF+34yd3gmVLW6y8qN+ciqLDdoDsbstFhfyDrM/PY1n
         MW92kPQsCXs4+aBKxg7nAQiIZq+bW6/D7HMmgrWx9Tykz6gDlLL/Ga8Y4kqeD+TAlF01
         Ii/8HV4B/epZ0php7mruuRMTndTIxxgGVyBoNPqVgf6I3dDyo3YlxqNAYnvPBVaga9mz
         FjyvLsYICnFuX3gVpaFiVzbZ5KfiTNcuUVgmamBCMLG7VgDqsWRLE2SVuhfOUJGs//p+
         txUuP/BJrP8NczFjOq8sXTsFELlWkXEaXMzu2x3pTdHHBhYtT36wSR0Uzkh47WvYo71u
         r93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685650625; x=1688242625;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjlZZ6nKS4GkUYpJEs75tROJCn6U9CxfxsCk2Sp4Rbc=;
        b=he1R+boW9UJM/nx5SZrI86rkjD1tLWXxj4seUB4IuAzTz4gMw0oa6Drml9PFOd50O1
         99Ra4wuCYm15ARewRleBadEaV35/Gs0IAadIBQExmFurw9VTzszOtzc+pqcExe7P1Gpd
         cao6PcFav73rc4IIYjvC/CbGQq88+wGIJzVz3Emw+lnxwjfqIQbHJHuocG8Nybfusmik
         7ixIxXnmcoWrzmiPURoM3K0LIK7d5g3mOqAZWDYddyGxqJArnkCRXCVVB2wr0pA17ByZ
         i7Kjmf57LHGBpBlyzeAqA4tgdyKvtID3QS66WkWpkpjiiEczzCVagOOUSfMWkf3hSDIL
         b26A==
X-Gm-Message-State: AC+VfDwl1c502HXeLv3uFVvAP8qaKjDpcWoHTla+WS6kfmbM4Pjkoi6Y
	4vzlKltaBlG9mM19I/24dbPFBQ==
X-Google-Smtp-Source: ACHHUZ4BpDHb2NTKUdlUUm/HUFHW89maI9BAsHQKu1v+LeQFvchawM0FVdmNZjlMPVk4Trl80MDxJg==
X-Received: by 2002:a17:902:f801:b0:1ae:8b4b:327d with SMTP id ix1-20020a170902f80100b001ae8b4b327dmr335375plb.42.1685650624848;
        Thu, 01 Jun 2023 13:17:04 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id im16-20020a170902bb1000b001a95c7742bbsm3979313plb.9.2023.06.01.13.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 13:17:03 -0700 (PDT)
Date: Thu, 01 Jun 2023 13:17:03 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Jun 2023 13:16:34 PDT (-0700)
Subject: Re: [PATCH v2] riscv/purgatory: Do not use fortified string functions
In-Reply-To: <168564402237.2891605.1600418987887898293.b4-ty@chromium.org>
CC: keescook@chromium.org, Paul Walmsley <paul.walmsley@sifive.com>,
  ndesaulniers@google.com, linux-kernel@vger.kernel.org, gustavoars@kernel.org, linux@leemhuis.info,
  heiko.stuebner@vrull.eu, linux-hardening@vger.kernel.org, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, joanbrugueram@gmail.com, masahiroy@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com, hi@alyssa.is
From: Palmer Dabbelt <palmer@dabbelt.com>
To: keescook@chromium.org
Message-ID: <mhng-8c6309b5-4ba9-4276-a8e6-2864426e77f0@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_131709_161703_F1E70BAC 
X-CRM114-Status: GOOD (  11.87  )
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

On Thu, 01 Jun 2023 11:27:03 PDT (-0700), keescook@chromium.org wrote:
> On Thu, 1 Jun 2023 09:00:28 -0700, Kees Cook wrote:
>> With the addition of -fstrict-flex-arrays=3, struct sha256_state's
>> trailing array is no longer ignored by CONFIG_FORTIFY_SOURCE:
>>
>> struct sha256_state {
>>         u32 state[SHA256_DIGEST_SIZE / 4];
>>         u64 count;
>>         u8 buf[SHA256_BLOCK_SIZE];
>> };
>>
>> [...]
>
> Applied to for-next/hardening, thanks!
>
> [1/1] riscv/purgatory: Do not use fortified string functions
>       https://git.kernel.org/kees/c/ca2ca08f479d

Sorry, I'd just applied this to riscv/fixes as well.  I can drop it if 
you want?  I was going to send a PR tomorrow, just LMK.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
