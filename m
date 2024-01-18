Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C06BC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 02:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ryp0Q08GSJFrPYMwkpwIBXMIYWjcPN84pOCenYI3L/I=; b=v/D0r7DIv4sOcFHzaUVY7CYlkz
	AT+HOQHRAv9vTMQSAQTCYyz+UDe8tZg/+jhK4A+v21yiosg/VB2KQgxl91AL8yCEVRJqnv2r8qdkf
	qFPe5EFtY2eBpsg1kXgiicvJS9AqPHEBOvrALFa7hzMKeMjV72X2Y6Bq3adAbKlju3gzQGRu/aygk
	JIuodKQRoeVM7/v6oEm5dq0NRJ0f9hLvpYSfSYCZHL8XWJr4le5npo3RWaYu9jSYw9PX3xBMYCvYk
	YYcdkBqkPe6FN3wzGu81wF0pcLJed22ZRyu3HOGbjnooFunJDH+eak9FJwOv6TP2ZBjcOgNyDZfAh
	5R6MT6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQHsu-001NlJ-1Q;
	Thu, 18 Jan 2024 02:12:00 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQHsr-001NkF-1r
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 02:11:59 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6db0fdd2b8fso4516060b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 18:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705543911; x=1706148711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GxiD+C5XoSqxhbWjkOfmxyd0ivTIk3zxlBcPpdRnRk=;
        b=pSdJn/AsJFaRTZGzXP1Rbr4G8cT/HSJ+PHmemQRjrrfkLMlDLXwFSuDdDSDYuGe7hv
         ZQds93k1C1Y/eZ23t1kPGeiBfHrtw6dMMZjD5NaESEZgchqZke/60+zyPAczQG54wwls
         dLptFlvptKfNctYBshmsIoqm/fjpwEqWL1Gu/rBdJdwcnkBxWSd7Ifv2zG5CoxrENxvN
         nXwDBS8forOZvJaoM7gG9Y8px3oKNDVFxzhgPntw3tg5sPYupXucaAzQpASuvtUFAatZ
         WcLIFYQB3eBCgXndgoKhWLfIBR6zbYYzCUh5x9jIVVR4873ht0hEVYAzUxd7IhnVeniK
         fOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705543911; x=1706148711;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GxiD+C5XoSqxhbWjkOfmxyd0ivTIk3zxlBcPpdRnRk=;
        b=iY1z3lFkzrkxqA8UD6tCrR3vqej9/Ob09v2xKd/Ulh3e0oynzFQ4HwE2yILoug7W3M
         fonRozf/kpUKhY00QCo3nZjfAuk12qHt1PZri5QEuPydUWR4zCE6FCQi2eY1Ta20cxqm
         92TZwsHWNHMet+0wRZDhQru2Rx0ZCkScT2pV/1N1VRKaHtS0YhkhZOEx4+NN7I/GUAsm
         E5xqeY6ONboSILgS86KF/mdh28Gf4GHcqf34c1to0QIkMAVRVX72fvzGt1+ssM3ojblf
         kOD8JSxAwKlUYDVEL6S/S21YWZcdbIZPVnCikyg+/CKMcipxeeNqX/gcIptg+sdbg0Hb
         AFKw==
X-Gm-Message-State: AOJu0YzkAwiTxHB2xMxo71D906JhH+18k6QEDT2v6fXugaiA8XUIBEyi
	0N0jgmRTdVZ7Ao1xavnY9f0y1v3NmATYOVFVLw4eOzIwbMLBv9hb/6dmLWPXf9DH1/CKhSPhyjL
	B
X-Google-Smtp-Source: AGHT+IF1H7DeUCLS8hvg6twzPV4HKfmWrjCdGRY317R5hDysJa1jVFjdplvhB1jqQV12uhi7ioh8Ew==
X-Received: by 2002:a17:903:2449:b0:1d5:30fd:26b6 with SMTP id l9-20020a170903244900b001d530fd26b6mr262259pls.66.1705543911191;
        Wed, 17 Jan 2024 18:11:51 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id jx16-20020a170903139000b001d4e058284esm305758plb.89.2024.01.17.18.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 18:11:48 -0800 (PST)
Date: Wed, 17 Jan 2024 18:11:48 -0800 (PST)
X-Google-Original-Date: Wed, 17 Jan 2024 18:11:20 PST (-0800)
Subject: Re: [PATCH v2 0/3] RISC-V: Disable DWARF5 with known broken LLVM versions
In-Reply-To: <20231205-riscv-restrict-dwarf5-llvm-v2-0-aedf00a382ac@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Conor Dooley <conor@kernel.org>, maskray@google.com, ndesaulniers@google.com, linux-riscv@lists.infradead.org,
  llvm@lists.linux.dev, patches@lists.linux.dev, nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-ebd9adde-eb2d-44ea-a8cf-f811dff3f70e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_181157_842718_F00A9459 
X-CRM114-Status: GOOD (  19.53  )
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

On Tue, 05 Dec 2023 15:53:49 PST (-0800), nathan@kernel.org wrote:
> Hi all,
>
> This series disables DWARF5 for LLVM versions where it is known to be
> broken due to linker relaxation:
>
> https://github.com/llvm/llvm-project/commit/bbc0f99f3bc96f1db16f649fc21dd18e5b0918f6
>
> If I understand correctly, it sounds like GNU binutils has a similar
> issue but I am not sure of the status of the fixes and such, so I did
> not bother with checking for it but it should be easy to add if so
> desired.

Do you have any more info?  All I know is this add/sub/set mess we've 
got, but that's a cross linking problem.

I queued this up for testing, should show up on for-next soon.  Thanks!

> ---
> Changes in v2:
> - Added patch 3 with Fangrui's suggested improvements around
>   CONFIG_AS_HAS_NON_CONST_LEB128.
> - Pick up Fangrui's Reviewed-by on patch 1.
> - Link to v1: https://lore.kernel.org/r/20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org
>
> ---
> Nathan Chancellor (3):
>       riscv: Hoist linker relaxation disabling logic into Kconfig
>       riscv: Restrict DWARF5 when building with LLVM to known working versions
>       lib/Kconfig.debug: Update AS_HAS_NON_CONST_LEB128 comment and name
>
>  arch/riscv/Kconfig  | 14 ++++++++++++++
>  arch/riscv/Makefile |  4 +---
>  lib/Kconfig.debug   | 12 +++++++-----
>  3 files changed, 22 insertions(+), 8 deletions(-)
> ---
> base-commit: 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
> change-id: 20231129-riscv-restrict-dwarf5-llvm-a9824bb974cb
>
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
