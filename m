Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD94C7619A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNF2gKAfNqe9Gr0QPNN5FpJ7vrnicBIsnMK0GlmI+Bk=; b=ngmNs3rXrLtOWN
	GMcxcjg+aur0ALuBFiOKkE7jdi+zNNXNELDxQpu+NmW1IBVizSHfSYC5iNlVQKKEhQ4JrZ+t8PNFe
	7aC2+k6J8sKDDreCD/JpydqcPdCMN1Uh3GL5NOFyO2CYjTdj6BfmHWUOiEarEtKrp6X/If306gamV
	PidBrXancatfKAsvRkVA338c46ffgpLM/hyya+WjbgSF1wHkUSXKYW9epH1z28B0Qy6q5SwPy3KjI
	DZqpsaSalg6stvBe2ovBkID0sKBn7EF0TOZ+VSRhaLssg0hlZI6Ky/bovsON4mwMXwFgYkDtZFU6W
	FSl4M8IxRaooZraaryRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmff-00B4wU-2I;
	Mon, 27 Mar 2023 13:13:59 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmfd-00B4vF-1T
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 13:13:58 +0000
Received: by mail-ed1-x52d.google.com with SMTP id ek18so36022285edb.6
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679922835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hTLfCHt4q1rmIa0nF5oelebRxyIA5+sHLWWs1PYjXM=;
        b=CuQjz2FLPaS4vlw1Cb7tuPhMrkpvuMTQJ193c2HarNDo/8AcWJ/H8jP7gwPvFG+PyZ
         JUIZbcLr0R3rvf46XBeKK00CC9sgi96Z4eSkzXZlWZxqM+0c4EjImQb0ris2cHY9FOh2
         Ca+OptDswIpIj5oYBXBJUKXLhpiYF3w3ttdyIuc/yBWYGU7kGNlFhjxRPOzNtef3MGhe
         I//xb+rgC7AX8kWn9z5Bg5J0Bc6fuosxrbFcWJEvFzv1pYhfnbEiI6x3F330lAV0cCUx
         SAfxGdnT32ZwLwAIg4MM/xiDbaZBF0/YTvsJnBWC427ixT3I/fYfGidFpALbzHAILz9m
         fU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679922835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hTLfCHt4q1rmIa0nF5oelebRxyIA5+sHLWWs1PYjXM=;
        b=f81QFnBtZ0/aqJXRX2jFVnQcnCgfunbXzhNwKyhKzsFCJ92oJkOZskQcp1+h3D5Nk2
         ryhB19Aa2tKH6beXW/o3GUAJfrrmFtN+VmRL8tqT7ZfJj5aTBXcRuK5GUjrq/TxAN7uH
         0LBvigcRgLdku+bkRC5iER8n6ec3J1/aGo1hZi1NNsQxpIlrzhzFSw6kTmj1f5/54ZDR
         ttYFYpDadZ2TM2D3UEliH6vb9VkIcS5b6zrMLDsjIsXs9b1htw7fMf9BendBaRduevyT
         SVd7UlTV/BgJnkgcWbnvZ4/hagUKwNNL/BcIfvyOco6Xt7qgXGaB9VtWFsC32Wjiq8zE
         RRfQ==
X-Gm-Message-State: AAQBX9eURzPG9JWtHcYMAtR3NUSc921t2nWtu0N3uT7G79W8morKZ1Fc
	UEXUYlfdZPskHE1U+Xh6AIRo3NgBVj08UaTqx1A=
X-Google-Smtp-Source: AKy350aDa+84QM+pYQ87GYnDIhdrXIpsIiIZhOXfntgDTSSl36wpDNmujFVf2xBx2x86Pd1USa34ZA==
X-Received: by 2002:a17:906:d051:b0:928:d4f6:6f77 with SMTP id bo17-20020a170906d05100b00928d4f66f77mr13042642ejb.29.1679922834804;
        Mon, 27 Mar 2023 06:13:54 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906248700b0093408d33875sm11267280ejb.49.2023.03.27.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:13:54 -0700 (PDT)
Date: Mon, 27 Mar 2023 15:13:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
Subject: Re: [PATCH v7 0/4] RISC-V Hibernation Support
Message-ID: <20230327131353.6gzjjppfy2o5456x@orel>
References: <20230323045604.536099-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323045604.536099-1-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_061357_491577_B4F8BEA0 
X-CRM114-Status: GOOD (  21.55  )
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

On Thu, Mar 23, 2023 at 12:56:00PM +0800, Sia Jee Heng wrote:
> This series adds RISC-V Hibernation/suspend to disk support.
> Low level Arch functions were created to support hibernation.
> swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> cpu state onto the stack, then calling swsusp_save() to save the memory
> image.
> 
> Arch specific hibernation header is implemented and is utilized by the
> arch_hibernation_header_restore() and arch_hibernation_header_save()
> functions. The arch specific hibernation header consists of satp, hartid,
> and the cpu_resume address. The kernel built version is also need to be
> saved into the hibernation image header to making sure only the same
> kernel is restore when resume.
> 
> swsusp_arch_resume() creates a temporary page table that covering only
> the linear map. It copies the restore code to a 'safe' page, then start to
> restore the memory image. Once completed, it restores the original
> kernel's page table. It then calls into __hibernate_cpu_resume()
> to restore the CPU context. Finally, it follows the normal hibernation
> path back to the hibernation core.
> 
> To enable hibernation/suspend to disk into RISCV, the below config
> need to be enabled:
> - CONFIG_ARCH_HIBERNATION_HEADER
> - CONFIG_ARCH_HIBERNATION_POSSIBLE
> 
> At high-level, this series includes the following changes:
> 1) Change suspend_save_csrs() and suspend_restore_csrs()
>    to public function as these functions are common to
>    suspend/hibernation. (patch 1)
> 2) Refactor the common code in the __cpu_resume_enter() function and
>    __hibernate_cpu_resume() function. The common code are used by
>    hibernation and suspend. (patch 2)
> 3) Enhance kernel_page_present() function to support huge page. (patch 3)
> 4) Add arch/riscv low level functions to support
>    hibernation/suspend to disk. (patch 4)
> 
> The above patches are based on kernel v6.3-rc3 and are tested on
> StarFive VF2 SBC board and Qemu. 
> ACPI platform mode is not supported in this series.
>

I tested this on QEMU, but, FYI, I had to use a raw backing file for
the swap disk, rather than a qcow2 backing file, otherwise it didn't
resume. It's probably worth looking into why that is.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
