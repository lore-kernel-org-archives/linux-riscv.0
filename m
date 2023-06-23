Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3F0EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0X0xcyDJeboCprRa3sgH7gfwbUL7ePPCbfMzFMLZM0=; b=bbh0Jz4a1iG2m2dv8YYyNtB7JZ
	Pxr0UBz7HRyTHEYN2kxym1pYGR37gcf4cZUTDPOvYGJ/xD1MW1BPOp7+i+d/FtxFIb7HjqMYBylPE
	5F4UEAg5nuE4e87FDrhy/T+/CMi6WVMFCaUSyotLU00AgnZCHaIXPkTgbfFr/kjcFejDTT5M3Xdxg
	xOfhxu0YuN/94kYB/cFlc8MpTKV1vbzJc8oWuAOKv39mz0f8O9wFyG2bLlLQUOAmBxSlrSI51fmNX
	Bkc+1Rm01js7NRay0bCitWwjVY8YoR3KRX+xwmy5MJthcIFLXFGxwyDWnIy36WF9dEEXzEbHnDjsm
	CzDiCjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCkQ8-004BSy-2E;
	Fri, 23 Jun 2023 17:18:04 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCkQ6-004BS3-11
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 17:18:03 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6687446eaccso682801b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 10:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687540680; x=1690132680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LfbqvLK9Qfv4YF15RNhH25UogTHD/trEiy3T/djOfaI=;
        b=xOUmQpxHu7os+Nl9EESJkSZpvheHF8R0/sK0BJUwzYmbVPkrFsxgP0foSUrW6iU4aq
         UF3xAkqE/VQAdENo2u2TZQK4mAiELlsY6HtfQ43Cm8EmQg1yaSwXCM5MBtld7piogO6f
         +EhhdZef5ZKc8DVOi+seiGnsx3r8I2oEXhtM37lXnlpfMEFseJyRe83uUgPhvd+REw1j
         PJBVzSmoaqCMXKyOoBrT+HjbScoIx8Uva/BygNV9SPRldIqdXvoicmEGg06guAEaRYaC
         /P1XRwjnSw2pdUekcxWt35N5S23ReO09GHZaQGrQcOWzcAuU/4vfBkzun4QRLzoP07Ye
         bvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687540680; x=1690132680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfbqvLK9Qfv4YF15RNhH25UogTHD/trEiy3T/djOfaI=;
        b=DYMBz7LsFFYcGR4l/A/RMrUJRyY3t90Ftxq2+1qLczgYaUjeIKREA3Q3m7a9ZOySig
         ltGIT35CcQjutrsHySg00EWzJdWWbXKdjiVNlCnRL08q/uJ7H7TGn6YAp85v+DjmGizd
         QRKDUigAXaNyFMVE+b0F/4VzhOaK5OvdYhmf3NtIKcDu+WIz3oQuGiB+2MY2NKJyOC1i
         q4Zp3ucABOUj5yDSsNaLNrMi4PXm2ZeM34m5NOUHbdApzYwzMtQ/2PqXux5psB0IhOBP
         PKtNDTiR32hcE7q/u8zrofcSGuMT3mjKuxmGEUHrsRn9pmFUJOIpy6iLARA9w0yHgLjf
         T/Sg==
X-Gm-Message-State: AC+VfDzfRMynxm0JYO1iv/yO2zJyT75pVlUzfJcZePKxBMX7gssWWtO7
	UxI+rR76rNQO7IZqa2BPC1SoSg==
X-Google-Smtp-Source: ACHHUZ4lpjXjmkmvEJ7+K6VgK2zU9ROdY2N4oWlN6oIFVB3ihHYUvHLy/UW9KTFd/fdmKnI/faz0Jg==
X-Received: by 2002:a05:6a00:1989:b0:668:8b43:8ded with SMTP id d9-20020a056a00198900b006688b438dedmr15678103pfl.26.1687540680069;
        Fri, 23 Jun 2023 10:18:00 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:bcd2:2fb7:43de:322f])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b0064fd4a6b306sm6320547pfi.76.2023.06.23.10.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 10:17:59 -0700 (PDT)
Date: Fri, 23 Jun 2023 10:17:54 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, bjorn@kernel.org,
	Conor Dooley <conor@kernel.org>, jszhang@kernel.org,
	llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Message-ID: <ZJXTwqZIkXLxXaSi@google.com>
References: <20230622215327.GA1135447@dev-arch.thelio-3990X>
 <mhng-6c34765c-126d-4e6c-8904-e002d49a4336@palmer-ri-x1c9a>
 <20230622231803.GA1790165@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Ntym+K/CqqiHps72"
Content-Disposition: inline
In-Reply-To: <20230622231803.GA1790165@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_101802_360699_1DA0C436 
X-CRM114-Status: GOOD (  23.23  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--Ntym+K/CqqiHps72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 22, 2023 at 11:18:03PM +0000, Nathan Chancellor wrote:
> If you wanted to restrict it to just LD_IS_BFD in arch/riscv/Kconfig,
> that would be fine with me too.
> 
>   select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if LD_IS_BFD

Hi Jisheng, would you mind sending a v3 with the attached patch applied
on top / at the end of your series?

> 
> Nick said he would work on a report for the LLVM side, so as long as
> this issue is handled in some way to avoid regressing LLD builds until
> it is resolved, I don't think there is anything else for the kernel to
> do. We like to have breadcrumbs via issue links, not sure if the report
> will be internal to Google or on LLVM's issue tracker though;
> regardless, we will have to touch this block to add a version check
> later, at which point we can add a link to the fix in LLD.

https://github.com/ClangBuiltLinux/linux/issues/1881

--Ntym+K/CqqiHps72
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-riscv-disable-DEAD_CODE_ELIMINATION-for-LLD.patch"

From 3e5e010958ee41b9fb408cfade8fb017c2fe7169 Mon Sep 17 00:00:00 2001
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 23 Jun 2023 10:06:17 -0700
Subject: [PATCH] riscv: disable HAVE_LD_DEAD_CODE_DATA_ELIMINATION for LLD

Linking allyesconfig with ld.lld-17 with CONFIG_DEAD_CODE_ELIMINATION=y
takes hours.  Assuming this is a performance regression that can be
fixed, tentatively disable this for now so that allyesconfig builds
don't start timing out.  If and when there's a fix to ld.lld, this can
be converted to a version check instead so that users of older but still
supported versions of ld.lld don't hurt themselves by enabling
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y.

Link: https://github.com/ClangBuiltLinux/linux/issues/1881
Reported-by: Palmer Dabbelt <palmer@dabbelt.com>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Hi Jisheng, would you mind sending a v3 with this patch on top/at the
end of your patch series?

 arch/riscv/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8effe5bb7788..0573991e9b78 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -116,7 +116,8 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
-	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
+	# https://github.com/ClangBuiltLinux/linux/issues/1881
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
-- 
2.41.0.162.gfafddb0af9-goog


--Ntym+K/CqqiHps72
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--Ntym+K/CqqiHps72--

