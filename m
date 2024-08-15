Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF10C52D7D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzqSdF197W3PBUKQyFoT/zjXkbfqdOJCwRCCCoOg9u4=; b=i53Pc3pcMi/4Vq
	uXd6Y0fXmy+gROqrDTEOiFgymTxZM1vu+EKa45j1SShnUrccVrjqn6oLzgqQo/Hl5MIgaVIVZHU2H
	d0OJilZnaOeLWq2B11vSM3P0ZwQATMvH+jGp/7ZMS1PWv1J1123Z2cYbpbCYvK3cg8qVPZpn0ACV4
	+DKcsd/Z56XifmrjCj3/cwj74BzLjmRAJLR1+pXaWou/HBje4Q80XOmXAm101Y/x0prK2fLFKQHeD
	oNlKFHhqx6jKEX/TxUhcBiVV7pK8aDvQGuCt7AzL7QiKwPQaUAO0dLj6p3mi9NFCFS+VPcT2Hgmop
	KWGKdlJ6MUQ97I5no3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seWGi-00000009Qyu-45BA;
	Thu, 15 Aug 2024 08:55:41 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seWGf-00000009QyF-1ydr
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 08:55:38 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3db14cc9066so449561b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723712135; x=1724316935; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0vnLL3kbPXvkotUPyNMjX8bBOkSvxIBHQZGgdMJco+g=;
        b=PQS6oL3bxq3YDwlucIeG4BYnFofPkJ7VUouLC/KtUSHwBW967NFl6YxrV9ajvek6Ud
         3oSyr1Scm3YqzgRO8ev1HnfTRWdzdrfT1CSVE68Bdz57uUJJjnJmvp612lhtaLaPaYU3
         BX3mADrv+PCCeUH3f8PlXIEUX6isw4YWTpQdvhrbd7hKEyp/RO5a49ps4dTeAK83cYat
         saUQiMI0I6w0ZbtKL6tayis3ibsoO5oNVqVhRVQfxsslCTluMX2Pvnj9vRHeKsYLllIH
         LBqaF5++XvmSI0ypUQXlhwGlLcSKJc7OvL/GEuLtATiDF9lb210aP18YrbpRXWKRFl94
         tTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723712135; x=1724316935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vnLL3kbPXvkotUPyNMjX8bBOkSvxIBHQZGgdMJco+g=;
        b=gPM+mtm7DStjTcdv73eMMGHNC9R8o92SUHubXX8j9LTxmrjg01LqW5ZJ+6XLaqEzIi
         abnfOQ9rKQMHN8ThNtXTxcdmDgFG41BAxfLRRxy1ey6c8MRHs8t1OlPRGQc2ilDLjeTt
         9lmN9D+aM1Wg3qqqCweASUAQkAA3DHppLec8jYxCnkn9O1Ahl9oPfwkX5N7oqYJkMgCt
         Iz37pY4XkkL+xWnVPPI2OGwZvS40vwOzSnt2rNZE8WCeT8oPV7ELd/ips/kh2yP9oRjl
         OKEfxmnrPg/CACn5PveDV9svL42BgRFnHLb26aJcX5hPZd/cQN4sg8O3KH5+JgVCX5mQ
         P0CA==
X-Forwarded-Encrypted: i=1; AJvYcCWofT8h7BCHhCRsiUUWtxzZti5bFg845KxfC7FEfm3/4OAzjHHijPI+V6UnyQwZghHxRPIMlqlqKP3zip4phXI9zCVoba7SogJ9AVti3VWu
X-Gm-Message-State: AOJu0YwwK4ceBtHA0epkXwlt1yXsoAE6DguaQ6adjcSdx2SeNTnmluXZ
	42Wf7TgToQClfG9JVaOUmFhJM8nC6CUCNPO3MY7IeVsPn3GvIc0fHoKKM89EAhxO9MSnTTxtudO
	k6dm6Ov4J/ute79tzuI6dA3oxMJg=
X-Google-Smtp-Source: AGHT+IEMsGuvOnnlVvDqfxlTE6uF1abrIIwQj2PNoQyRCmB0mY4VFRR18hxk76HzLAnSmCaeb4Q1JX6ZLkjaTvS93Rk=
X-Received: by 2002:a05:6808:1706:b0:3d5:60fa:d717 with SMTP id
 5614622812f47-3dd2997e006mr6082073b6e.41.1723712135319; Thu, 15 Aug 2024
 01:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240815030403.832489-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20240815030403.832489-1-zhangchunyan@iscas.ac.cn>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 15 Aug 2024 16:54:59 +0800
Message-ID: <CAAfSe-tDw03TNn7jRWxZfcxyEL=efUURAU6gsWzoanXHAtTLEw@mail.gmail.com>
Subject: Re: [PATCH V4 0/3] riscv: mm: Add soft-dirty and uffd-wp support
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_015537_531574_942ADC61 
X-CRM114-Status: GOOD (  18.31  )
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

On Thu, 15 Aug 2024 at 11:04, Chunyan Zhang <zhangchunyan@iscas.ac.cn> wrote:
>
> This patchset adds soft dirty and userfaultfd write protect tracking support
> for RISC-V.
>
> As described in the patches, we are trying to utilize only one free PTE
> bit(9) to support three kernel features (devmap, soft-dirty, uffd-wp).
> Users cannot have them supported at the same time (have to select
> one when building the kernel).
>
> This patchset has been tested with:
> 1) The kselftest mm suite in which soft-dirty, madv_populate, test_unmerge_uffd_wp,
> and uffd-unit-tests run and pass, and no regressions are observed in any of the
> other tests.
>
> 2) CRIU:
> - 'criu check --feature mem_dirty_track' returns supported;
> - incremental_dumps[1] and simple_loop [2] dump and restores work fine;
> - zdtm test suite can run under host mode.
>
> V4:
> - Added bit(4) descriptions into "Format of swap PTE".
>
> V3:
> - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
>
> V1 -> V2:
> - Add uffd-wp supported;
> - Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
> - Add test results of CRIU in the cover-letter.
>
> [1] https://www.criu.org/Incremental_dumps
> [2] https://asciinema.org/a/232445
>
> Chunyan Zhang (3):
>   riscv: mm: Prepare for reusing PTE RSW bit(9)
>   riscv: mm: Add soft-dirty page tracking support
>   riscv: mm: Add uffd write-protect support
>
>  arch/riscv/Kconfig                    |  34 ++++++-
>  arch/riscv/include/asm/pgtable-64.h   |   2 +-
>  arch/riscv/include/asm/pgtable-bits.h |  31 ++++++
>  arch/riscv/include/asm/pgtable.h      | 133 +++++++++++++++++++++++++-
>  4 files changed, 197 insertions(+), 3 deletions(-)
>

This patchset applies on top of v6.11-rc1.

> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
