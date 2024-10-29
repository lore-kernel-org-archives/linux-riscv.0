Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23E9D3A66B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxSAm6wPLljdoXYChvbi7cQ4g3ilDYXQ1MLFALt7M3w=; b=zSGF5T8kmLZCnE
	fU1eAgsVLdGQKNLv8MPgxApN0BQUoQaeX8g3QEDGpi61x2lNDidi1NXrPIP0HjM2EPl8aYbJxC5a+
	vcLcThMJREl9hC/OWReA1Fv1GDw930VeFVNo1uFLdHG0sZuLWOTgNmE8jB9CFQ+dQ9A4NubviaGuv
	Vg2k3bAD8AOGj+ynW7mhm9OjomlVKpREe8b9jkJyRnzc6uvkxDiuSRaY0yuuvWwG6H2/o97SqwTss
	sf+6Vd5YaFWc3Di1ImAvIgTZEkVh7BtXCBRq8DY40PITOboOxYi0mWeu4J8kMNcXhxPovqvAYQ8mf
	mNUR8vynMB4gitRRzITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nnF-0000000EokF-3uN7;
	Tue, 29 Oct 2024 15:06:01 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nUM-0000000ElvM-2f71
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 14:48:30 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2884e6ed0daso2097020fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730213188; x=1730817988; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=viF9DWPGP0x+avfXcbm09pdd+ClEJSj7G9turC6IKW8=;
        b=eLTO4Gb5kPUN3wuNZT30uj4EVEMXX4H5xnPHJ62+OUjVXH7FWtGELkRIDbrTAMs4dk
         vtwUnAaIsU5wdAzC6cEVIy8LAhEQmWN14+QxZq7utQC8kpTa+RyrCc5AZGptEaPiVm9k
         rN+yXaY4LTxxoiDdRM/+xf/RTeb0edRPvI4oJyn94sas9AYghPmnF+ChmJwEnOPsh1dp
         XzWFg+yDtG+yEVhWtdBIcWvQDA4UJAFbOTXCP1Ht4TojzyElDxm2ceaG6zbVWbboPP1v
         GFCRoL0HAoWN4AFaCEsZ/DmcTxyY3l4JHAn5dwGho8aBIBxf5pZmnnemtdkmcGJxw2MI
         F6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730213188; x=1730817988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viF9DWPGP0x+avfXcbm09pdd+ClEJSj7G9turC6IKW8=;
        b=r/UXhEkpH5vo1blsszNGXhfvFIvs06PIRncPSbNGJPlz/RV6k16fOCSaatzapupwyY
         2H+NX3gZuOxipzjNfkVgM0fjsD6Lm43YKMGD5OMgV5LSiKeaHF1RSaqCknwqBByHfhmA
         aOSpmkj/WWr7zl3dklrXpWSjL+HQZM5Toq3V/zqFJt9E8n/3bSbmgRZaxYEzwin02StG
         Vxlg7mAbzlLM0XsceNeppKyE5uCvSotnBLnWq+JYX1WI0vMVFnh0ORF+ACQ5ovQtc2G6
         L8J/4jsCv4GyIMndiZNqdzEqLRf60JwgPPmDHX7C7PYPz/dKRsHq1nN94vHuRlgjseje
         3FWg==
X-Gm-Message-State: AOJu0YzL690fM4AUF2UWCuVwU/CAohIIGI/tbFdOpuOWJ40ltlvR7kFG
	YuV4K58Xv5quMOIPA0nEkPlpzX1Frgi0MKaaLMaBkKP/1yIiqrl6aajlLFsoBYXPEZTzWGmyQqF
	wKwsCifIo2KCr6mEeJNgIxME9Faw=
X-Google-Smtp-Source: AGHT+IE1g/sg5zM58Sn60mdYZ37eljIg2WGxD4k7uRrYCo5ArBFN9rkVIkohMQZgP2W9lLEJTbpmdHQSHCxmjV1ImV4=
X-Received: by 2002:a05:6870:9625:b0:288:6cea:ba8c with SMTP id
 586e51a60fabf-29051de7981mr11265267fac.44.1730213185385; Tue, 29 Oct 2024
 07:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <mvm5xq44bqh.fsf@suse.de>
In-Reply-To: <mvm5xq44bqh.fsf@suse.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 29 Oct 2024 20:16:08 +0530
Message-ID: <CANAwSgRWGemK_Q3FeeXt7sZYYpi+87jKGs4m8O7VDS-FJ=XM_g@mail.gmail.com>
Subject: Re: [PATCH] tools: add forwarding header for arch/riscv/include/asm/fence.h
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_074630_693319_34EC210F 
X-CRM114-Status: GOOD (  16.95  )
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

Hi Andreas,

On Tue, 8 Oct 2024 at 05:29, Andreas Schwab <schwab@suse.de> wrote:
>
> This is needed so that <asm/barrier.h> can find <asm/fence.h> on riscv.
>
> Fixes: 6d74d178fe6e ("tools: Add riscv barrier implementation")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  tools/include/asm/fence.h | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 tools/include/asm/fence.h
>
> diff --git a/tools/include/asm/fence.h b/tools/include/asm/fence.h
> new file mode 100644
> index 000000000000..917a173059a4
> --- /dev/null
> +++ b/tools/include/asm/fence.h
> @@ -0,0 +1,3 @@
> +#if defined(__riscv)
> +#include "../../arch/riscv/include/asm/fence.h"
> +#endif
> --
Thanks for this Fix.

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

> 2.46.2
>
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
