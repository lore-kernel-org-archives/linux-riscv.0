Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713C3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 01:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GS9KEjBRfYFbAn4/Leslj5nzWX5TN3mzDMXSC5rUuqU=; b=RQk38KOZq7XQcTTzWnJIVHkYZp
	tRjzNFhymTra5gjrYXla7OAItU9VazJu833A8P6ymGNQUE5DfgK8w1JXU63je0X5DYQVK7T45hJpk
	bs+5B7beaXDC/gArRiSlptBtnUohyJSjzJ29DI2hkH5gvR7YMZUtsva/NUrLV2K4YzcsXSRhDFFHB
	6vTKFjyrUM9nEP5Nbnf90XVIANkPVG7KW4EAvFp2JkVmouVS6TZI28RiGN/VALF4vtMf0KVeJJrti
	wT+gP4TyQCAX7EFOkR88dp236IdXLFset8kxPMWRWsmI7ZnLYkjxgtdwWsdjiOWy08FmFKWls6697
	xI0eqDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHbXz-00FtOs-UM; Wed, 09 Feb 2022 01:13:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHbXw-00FtO2-Ps
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 01:13:26 +0000
Received: by mail-pl1-x630.google.com with SMTP id x4so851527plb.4
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 17:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=t5FgH2YJXOPf/xxPjv6QRrKmo/4kA2ug0zb3e+u3Xao=;
 b=zIbTskggTwuJ8Cs4sq0rq+triPMJ73QwqJeAJl8rQPFbTgi9R6UFxKykUlvi2LoERU
 JfrHtLoOEo2RSK7qLDy3j0ClM1pKefSYA/drHmfx4QjoQzLJnW2Km/A5MIhKulJwl9Qv
 jhkGIKcGThJzb+5tYP9Iyh0pn5HgLF/ba+Q9AR8Q3k9b3cKxTwZbWZ9D4aKYsijihkOe
 lpZM1ZR+9/hhfA3fWhGbyfHdzF9Pi3vGiDrlGNkkacJ/7zITVO8irSIW3xVovn540T2p
 +QWlc3FWZdjDBSBgODptqPqPSjLdv3glClBxbuSCWJv0QMkMZrnl266Jo4je6sRoA4q1
 igCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=t5FgH2YJXOPf/xxPjv6QRrKmo/4kA2ug0zb3e+u3Xao=;
 b=GessLnvr3ClwltuuCzgb2cQOYpirAkgBuyi1HLqhSQRybhrNiOHZbQUQrEJ7pTkZMS
 k9Z4d9hJ5oDd5oPdA6Tv41QaCAyreXkYLTi9GXs3vuwOhF39zzGsDSWZ9QHPVtFx+9FP
 36zryKIfUmkRmRCRWLakhXsxuszmndGR+48DlHMsXaeoO0YTQSQXU2LwBrzmuS3R1bJx
 Awl3SYfWoAd07lriY819hbeWhW2pTsaWyBPKd2XWVh+BCGwC1dEB5sQ9KfG4iE2udN+y
 Gvlg4XbrCD1chpM0fQItQl8kaTGE5zY7UW7xrjDCD7ytAWadG51ChkSBSsyJ0vO3hltx
 32Wg==
X-Gm-Message-State: AOAM530PfXet7WJEiwi5MoB2WARN5YijVcgwOnk+6uAXkY5aH3xMBdlP
 ymcWOU3cEueLHo5Z5Nzx/asvKAN0/1y/mQ==
X-Google-Smtp-Source: ABdhPJyMzXTZUWesPmKCROa5Vq0xkIcpEaIdsXW7yw+ZtlpYv491NFu63mbL/Q0o7cNRpbRns9anbg==
X-Received: by 2002:a17:903:228c:: with SMTP id
 b12mr6801223plh.36.1644369203436; 
 Tue, 08 Feb 2022 17:13:23 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id pg2sm4559295pjb.54.2022.02.08.17.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 17:13:22 -0800 (PST)
Date: Tue, 08 Feb 2022 17:13:22 -0800 (PST)
X-Google-Original-Date: Tue, 08 Feb 2022 17:12:33 PST (-0800)
Subject: Re: [PATCH] riscv: extable: fix err reg writing in dedicated uaccess
 handler
In-Reply-To: <20220123090417.630-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 mchitale@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-1843aa8a-4e63-4366-9b70-42448c3d37b8@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_171324_862274_41388C4C 
X-CRM114-Status: GOOD (  22.84  )
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

On Sun, 23 Jan 2022 01:04:17 PST (-0800), jszhang@kernel.org wrote:
> Mayuresh reported commit 20802d8d477d ("riscv: extable: add a dedicated
> uaccess handler") breaks the writev02 test case in LTP. This is due to
> the err reg isn't correctly set with the errno(-EFAULT in writev02
> case). First of all, the err and zero regs are reg numbers rather than
> reg offsets in struct pt_regs; Secondly, regs_set_gpr() should write
> the regs when offset isn't zero(zero means epc)
>
> Fix it by correcting regs_set_gpr() logic and passing the correct reg
> offset to it.
>
> Reported-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Fixes: 20802d8d477d ("riscv: extable: add a dedicated uaccess handler")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/mm/extable.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
> index 05978f78579f..35484d830fd6 100644
> --- a/arch/riscv/mm/extable.c
> +++ b/arch/riscv/mm/extable.c
> @@ -33,7 +33,7 @@ static inline void regs_set_gpr(struct pt_regs *regs, unsigned int offset,
>  	if (unlikely(offset > MAX_REG_OFFSET))
>  		return;
>
> -	if (!offset)
> +	if (offset)
>  		*(unsigned long *)((unsigned long)regs + offset) = val;
>  }
>
> @@ -43,8 +43,8 @@ static bool ex_handler_uaccess_err_zero(const struct exception_table_entry *ex,
>  	int reg_err = FIELD_GET(EX_DATA_REG_ERR, ex->data);
>  	int reg_zero = FIELD_GET(EX_DATA_REG_ZERO, ex->data);
>
> -	regs_set_gpr(regs, reg_err, -EFAULT);
> -	regs_set_gpr(regs, reg_zero, 0);
> +	regs_set_gpr(regs, reg_err * sizeof(unsigned long), -EFAULT);
> +	regs_set_gpr(regs, reg_zero * sizeof(unsigned long), 0);
>
>  	regs->epc = get_ex_fixup(ex);
>  	return true;

Thanks, this is on fixes.  I'm not sure if it's saner to have these be 
register numbers rather than offsets, but regs_get_register is this way 
so it's probably better to have them match.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
