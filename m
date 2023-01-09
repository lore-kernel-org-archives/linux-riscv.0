Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F27C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oULdYX+ysasPXCMim8nPULPJ2JuuYgDcbUcvzLcOdMs=; b=Zz66tr/btxcOG9
	7uWJjPnuLY1S/VME/mKaJ9feKAmfg9HKbZyTk/NUGcdVYs6Qnbs5CqF6dhs3rB38R0ZXHnOVkuMdR
	JnizdD2A9iz4UnWXD+6cG5muY65M05b+04Hq5rcnnx+tLoPZQzKMYWDSp+qGo+MEmSuo9SFar/1HU
	vmAhnFZOBs5hvaufJA/ugRVBVL4SY/CVQ5JTfk2DZvDp9rI5pChgIAJuoYGUk4ovWmoxumV68Hwb/
	nSQJ09wxX6iLimbxbpAf4nk6zQPbEpXOejdy1Cd+1GCHzpiyqad1sWluzML6FSqCim83bQfBiCw3Y
	Q5+MJ1pmXspatv4pOXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEpTU-000q1d-4Y; Mon, 09 Jan 2023 10:33:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEpTJ-000pyh-OA
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 10:33:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id ja17so5909755wmb.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 02:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T79FbY9H4ufVE5lf85k9rQWEXlJQ1wG2LIuD/3X7FUo=;
        b=C6G2Q80EGeEAEZb2W873E6wsLt/rZHXf+5hMD2G/3VWaTHx+WJJLRKfjsLXY1YsaSi
         u3Grkk4iuWUbkkrm7FbXIQg8XlTv0Lq/ch/HrIE0lLfTDwbIf6qLAE8/fCDs5ITURqol
         iPyTQHGrd9Ap1XEcX6wTIHIYM6SIRFgvxjvOac8ijSabH0Y0Kr0zETyZk6pqSChm/77w
         X4ZXmk+ro4j1tEba5H4jKhCfBL3CmCvARwQErWlh6JxtpBqAqpf6LKrAwYQfniSrlYtT
         c5wseAEyZmoPIbHBHkpQ/1qnmKxYPES0VnPLb3lBJD57jpzxzu9SW2lK9WusAHPFfCA2
         CuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T79FbY9H4ufVE5lf85k9rQWEXlJQ1wG2LIuD/3X7FUo=;
        b=wr0zMZALKOIME+fCuJYZzlciIxgQA0MLkKsxkeSUEPaHhyjImKoT57aoc/UYqBvAWD
         9HqDarcMHrDKGFr2pJUGe24fWwmSIdbv8g/Ely4JIlDeEGR9CPatsTBz3Ud1m1jOjD3k
         GPhE6j8gWU4iQmjaq2wiqOWUKKtyJZeA8/3oc/8QSm6C+5jNaNglWlR8uYaQ1ZJLd4tS
         e91ZjFgwYAF0PmtCda+8UFqrf9WhY5Bi4FOw+m3xPEQ4OtiZ2aljcf63bDhek/UySCJ8
         /2j78Yr43T5TL2Rzud8LLDKtMnabHvM0Y9KuXwYTS9IL91167eMWI4lOgo6O6U/OZfH4
         Gxzg==
X-Gm-Message-State: AFqh2kqHGmpQTIK8Ddrr8GZVvP3NCCRkpmhsVcS/7rrZqjRNsZAcc9ee
	Tb86/0GbkKx4M+xuHf3Zj+XSmQ==
X-Google-Smtp-Source: AMrXdXua+1Lhzp/I9Tu0d5DgItRFuX80xFs5y0aclbcbHnfqBBAljjnxB8kGsAgurViEZButP2p/bg==
X-Received: by 2002:a05:600c:3d91:b0:3d9:103d:9078 with SMTP id bi17-20020a05600c3d9100b003d9103d9078mr44824860wmb.22.1673260418018;
        Mon, 09 Jan 2023 02:33:38 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p15-20020a1c544f000000b003b4fe03c881sm15215395wmi.48.2023.01.09.02.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 02:33:37 -0800 (PST)
Date: Mon, 9 Jan 2023 11:33:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/3] Remove toolchain dependencies for Zicbom
Message-ID: <20230109103336.jy766gqcwfe45574@orel>
References: <20230108163356.3063839-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230108163356.3063839-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_023341_807757_75F25B64 
X-CRM114-Status: GOOD (  16.45  )
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

On Sun, Jan 08, 2023 at 04:33:53PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> 
> I've yoinked patch 1 from Drew's series adding support for Zicboz &
> attached two more patches here that remove the need for, and then drop
> the toolchain support checks for Zicbom. The goal is to remove the need
> for checking the presence of toolchain Zicbom support in the work being
> done to support non instruction based CMOs [1].
> 
> I've tested compliation on a number of different configurations with
> the Zicbom config option enabled. The important ones to call out I
> guess are:
> - clang/llvm 14 w/ LLVM=1 which doesn't support Zicbom atm.
> - gcc 11 w/ binutils 2.37 which doesn't support Zicbom atm either.
> - clang/llvm 15 w/ LLVM=1 BUT with binutils 2.37's ld. This is the
>   configuration that prompted adding the LD checks as cc/as supports
>   Zicbom, but ld doesn't [2].
> - gcc 12 w/ binutils 2.39 & clang 15 w/ LLVM=1, both of these supported
>   Zicbom before and still do.
> 
> I also checked building the THEAD errata etc with
> CONFIG_RISCV_ISA_ZICBOM disabled, and there were no build issues there
> either.
> 
> Drew - I took the liberty of dropping the cbo.zero addition from your
> patch.

Thanks, LGTM.

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
