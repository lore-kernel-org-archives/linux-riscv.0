Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C761CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iaehavi38N2lMMMOEq4cyNYei1Y1ShwlTW6F5PaRj90=; b=2xYLGzzpKKoW0L
	O69GarPVKaSP3H3ffowDl7qR2+H3Y45oDlnLUiSHlzLo5kmQMSrDKihOi7QREgFjpSpBwom6ItiGo
	dR8CF26rHJScNe4EzhbK71DwL9A0Bo+pbo67C5du0lB9Hitp550l0l5ITlMTncctaS5gvWWyvtAr3
	y0xutmvbOxSsQiDdVpA/93fhvDXb+nB8vxU4APkmEluaDaaL59c7PHP6hxHci0vwqjKhW9Ob0QX/j
	04a9DAVHU+1JnmLFTbvpAdP70sinpcUTyNYv9y/I1MZW7EN/+zZlO1bRRM1PN+CSM/z4H9RVYXAzH
	N0oZtfYN3NIESWcY4X4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dr3-009qoc-Bc; Mon, 12 Dec 2022 08:08:05 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dr0-009qmk-Cb
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 08:08:03 +0000
Received: by mail-ej1-x636.google.com with SMTP id u19so7371847ejm.8
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 00:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekXziY4Wt/mX0IKwVbM9YBHrnYCPflW/0beXxe506/w=;
        b=W237P41NlxmYIPksWB6CDxlOQqYhW0hcIxtxkwoMPwKeGjQ7dkEVahAqmIt7M+Vb2h
         zl5zg10uRn1hjwpfRWBhstCAjSUscaY+h+KKZLDWLWlajG4nb0eTW7V5Df0R5YD7BN+c
         oJXi/Pl5plIwgTOe/RC32B/n+6TVfwUKdNwCPUs+xhVk31bd9XaFyQUMVKuqHqdSY68E
         lGK2tIBWYC6MgU6NsiH4OHcuAssygFQF2XhaD7UVVPyA6gvXRQmOv7/eIWhHdTzfjkwj
         l6wf9kaT1NnMwJAzs55tDMuAOvJ07SthmIZXU9yapYTo6l2lPEuWRt3NU2ZfzdjFzGuN
         Rwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekXziY4Wt/mX0IKwVbM9YBHrnYCPflW/0beXxe506/w=;
        b=c3h5EoWjkmzjjkkUIZwDbTvA3zUQakzjq+aXxMd2c5LXQ/bwj94omBL9RC96sR2vcS
         bkiK+YtbwX2yGJY+p/6Oi/6KWWF35zdEHSw6SIWsgcYpWnzsjO1M4f/y0ioIWqVf/hu9
         YTaE9rjUPm8JG3mT9BSGYhq7xvhQ4H9RlurC23Jiu0kEpNlryeSFYj8kFujcBLVQprp3
         p0HqC5Z7PiOziEzB8NXO+m5L3HqVCv3mL++cBrMhdgpXTaZh7RxaFJD07EeuJDTFmJC5
         UHgkHMzYjJkc+XCq6Y81PvvNNDLMVLER4emXFtLoscG9KHj51E4P61LzLUOVmbx+QbjL
         gsNQ==
X-Gm-Message-State: ANoB5pk3xQMG8PuwSuILDQNvVOlQ3a6XRXHvCI29vgDKTVgG7pa6f+UY
	EDgNoxYa8b40jHj/daQ/mfQdkQ==
X-Google-Smtp-Source: AA0mqf6zKB4lfXPA8P4EWE5T0qflUOT2MuSCrSrosmSjp6iM6T0s0uuQYVCcAsLaZ71Ql/JdUuIKRw==
X-Received: by 2002:a17:906:cc4d:b0:7c0:e23f:17ca with SMTP id mm13-20020a170906cc4d00b007c0e23f17camr13778587ejb.34.1670832480678;
        Mon, 12 Dec 2022 00:08:00 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709063e4d00b007933047f923sm2945335eji.118.2022.12.12.00.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 00:08:00 -0800 (PST)
Date: Mon, 12 Dec 2022 09:07:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org
Subject: Re: [PATCH RESEND v10 0/3] riscv, mm: detect svnapot cpu support at
 runtime
Message-ID: <20221212080759.h6zfibqq4es2hijl@kamzik>
References: <20221212075223.806705-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221212075223.806705-1-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_000802_451214_D49348B2 
X-CRM114-Status: GOOD (  22.56  )
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

Hi Qinglin,

This is actually v11, not a v10 resend. And please don't send new versions
minutes after sending previous versions. v10 is still under review and
discussion.

Thanks,
drew

On Mon, Dec 12, 2022 at 03:52:20PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> page. This patch set is for using Svnapot in hugetlb fs and huge vmap.
> 
> This patchset adds a Kconfig item for using Svnapot in
> "Platform type"->"SVNAPOT extension support". Its default value is on,
> and people can set it off if they don't allow kernel to detect Svnapot
> hardware support and leverage it.
> 
> Tested on:
>   - qemu rv64 with "Svnapot support" off and svnapot=true.
>   - qemu rv64 with "Svnapot support" on and svnapot=true.
>   - qemu rv64 with "Svnapot support" off and svnapot=false.
>   - qemu rv64 with "Svnapot support" on and svnapot=false.
> 
> 
> Changes in v2:
>   - detect Svnapot hardware support at boot time.
> Changes in v3:
>   - do linear mapping again if has_svnapot
> Changes in v4:
>   - fix some errors/warns reported by checkpatch.pl, thanks @Conor
> Changes in v5:
>   - modify code according to @Conor and @Heiko
> Changes in v6:
>   - use static key insead of alternative errata
> Changes in v7:
>   - add napot_cont_order for possible more napot order in the future
>   - remove linear mapping related code from this patchset to another patch
>   - refactor hugetlb code for svnapot according to thanks @Andrew @Conor
>   - use tools/testing/selftests/vm/map_hugetlb as hugetlb testing program
>   - support svnapot in huge vmap on newer for-next branch
> Changes in v8:
>   - fix compilation errors in rv32_defconfig
>   - insert some lines of whitespace according to @Conor's suggestion
> Changes in v9:
>   - use alternative to avoid using static branches inside heavily used
>     inline functions
>   - change napot_cont_mask definition
>   - post test_vmalloc modification about testing vmalloc_huge
> Changes in v10:
>   - fix some nits caught by @Andrew
>   - collect Reviewed-by/Acked-by
>   - add memory leak warning in KConfig text
>   - replace test_vmalloc patch link with the standard one
> 
> 
> Qinglin Pan (3):
>   riscv: mm: modify pte format for Svnapot
>   riscv: mm: support Svnapot in hugetlb page
>   riscv: mm: support Svnapot in huge vmap
> 
>  arch/riscv/Kconfig                   |  21 +-
>  arch/riscv/include/asm/errata_list.h |  15 +-
>  arch/riscv/include/asm/hugetlb.h     |  34 ++-
>  arch/riscv/include/asm/hwcap.h       |   2 +-
>  arch/riscv/include/asm/page.h        |   5 -
>  arch/riscv/include/asm/pgtable-64.h  |  34 +++
>  arch/riscv/include/asm/pgtable.h     |  43 +++-
>  arch/riscv/include/asm/vmalloc.h     |  61 +++++-
>  arch/riscv/kernel/cpu.c              |   1 +
>  arch/riscv/kernel/cpufeature.c       |  15 ++
>  arch/riscv/mm/hugetlbpage.c          | 301 +++++++++++++++++++++++++++
>  11 files changed, 519 insertions(+), 13 deletions(-)
> 
> -- 
> 2.37.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
