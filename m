Return-Path: <SRS0=B3U6=2N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12D9C2D0D5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2019 18:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E2172075B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2019 18:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gzy/OEA2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ZGATKd0R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E2172075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:References:
	In-Reply-To:To:Subject:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIkfNzutQK9Bj9rFooxKTKdVtXGyYz+rNewW1wA17Aw=; b=Gzy/OEA2DBmogE
	IIDN62HQuEXNXCTiLiW8q1lTgLGm7rUDxxLvbKCGxOVI9NPV83CxYD7KSEcw0R0ZSwaf7HrCofmyh
	4wDC16I3HINJsFyl+fg1UhsU4lagd0CjojExxHHoE2kCHvGP7WgKl56ur2ykOwzQVmxPoUhLQGoMZ
	BlsHRyxd6yYFFL1WAj75G5l6GvnY738bg6hO82G7WV6QAbjs6DIu7UbMcplD+4e/zDSxd0gekpVMz
	WdkDmSNagtFr7daU4dv3KrDjEI7pu15dsAkqyLtzM+/R1Ccxi8QMLvG7GJ9LsBtiE20Dszg31kK6V
	+a+478RwBm1/tAPwE3gQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijSun-0002HZ-NN; Mon, 23 Dec 2019 18:58:49 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijSul-0002Fr-6K
 for linux-riscv@lists.infradead.org; Mon, 23 Dec 2019 18:58:48 +0000
Received: by mail-pf1-x443.google.com with SMTP id 2so9579315pfg.12
 for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2019 10:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=lIkfNzutQK9Bj9rFooxKTKdVtXGyYz+rNewW1wA17Aw=;
 b=ZGATKd0RvWQI2HVDGWaXaF1TR+UcDeDd67KlLekeczpG7cwFRnGXX+CcE2QDpQbuXr
 I01VgASVpl30NQg+wOpaNyQnJLotUsIm87yQ5WQHWDzj7PInlFAtlOTFj8r6jr/QTHas
 9ONDjMD4qdj7WNTdTICNDMpBjmSUwnsDw4MmdWUFRAgSYkrjuR9so3KiNH/w6hN9AJxy
 ZW5DV3563cdYPpiDoN8IPypk0chtKfbfAXAAFoihgpO9NOSWcj2VOUrHdWndxCb7GRxG
 cVCOQpDbiOQJ3wkEsvFBiNVCfv6ezbs98a8s65hYlkVWDG+AKRc7+FwbEfzE/6GZYYnW
 JxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=lIkfNzutQK9Bj9rFooxKTKdVtXGyYz+rNewW1wA17Aw=;
 b=Dep04GGuTVsL64sLg1hpiPfE7aHSG0ljB1YhVE89gw0SVr+a5tIJPN+Ho90VYBdX92
 D1yX1yGL0FC2HURfUSIo4NtrUodDiPBeTHb3Bk+mDTBNYOtvNK2aMGlXYs5xwkuohJYc
 Q8bTZ69WIUdzuiPrbE3PNb8+qoyK986UEG4hLnWq9Jd593OXHbKOK12WCx77/1ponvYm
 0s0vZJHizsPj5cyigiASu0J6sL7mKF0CqQxhfmfdukjsbzf5U4yB1RbBYcJbqERXKuF3
 +bOLbEZb5SZ/iXl29JGSBKCAy/AsT5z4s5qPf+GuMCx5FQNy0c3Xv+gFRpup3eCEojAZ
 l8Jg==
X-Gm-Message-State: APjAAAU97a7z+vxLoRjqnh+noxu2ZpEV9AmjSkTXZnDW3G3tp63jJrGM
 OUMKHuqRrt/83ukuCbUjaS4y0Hty410=
X-Google-Smtp-Source: APXvYqy0KD1kPcm05h4K7KX8z3fMmvq6k8M8rPuQH7j0C79k0M9uYnWpV53namsUX3Ae63dG01BLwQ==
X-Received: by 2002:a62:6407:: with SMTP id y7mr34645171pfb.49.1577127525094; 
 Mon, 23 Dec 2019 10:58:45 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id p28sm23433216pgb.93.2019.12.23.10.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 10:58:44 -0800 (PST)
Date: Mon, 23 Dec 2019 10:58:44 -0800 (PST)
X-Google-Original-Date: Mon, 23 Dec 2019 10:58:16 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH bpf-next v2 8/9] riscv,
 bpf: add missing uapi header for BPF_PROG_TYPE_PERF_EVENT programs
To: Bjorn Topel <bjorn.topel@gmail.com>
In-Reply-To: <20191216091343.23260-9-bjorn.topel@gmail.com>
References: <20191216091343.23260-9-bjorn.topel@gmail.com>
 <20191216091343.23260-1-bjorn.topel@gmail.com>
Message-ID: <mhng-4cae5715-7736-45b9-911b-5281d60f576d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_105847_230482_D357C63E 
X-CRM114-Status: GOOD (  11.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: daniel@iogearbox.net, netdev@vger.kernel.org, ast@kernel.org,
 Bjorn Topel <bjorn.topel@gmail.com>, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 16 Dec 2019 01:13:42 PST (-0800), Bjorn Topel wrote:
> Add missing uapi header the BPF_PROG_TYPE_PERF_EVENT programs by
> exporting struct user_regs_struct instead of struct pt_regs which is
> in-kernel only.
>
> Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>
> ---
>  arch/riscv/include/uapi/asm/bpf_perf_event.h | 9 +++++++++
>  tools/include/uapi/asm/bpf_perf_event.h      | 2 ++
>  2 files changed, 11 insertions(+)
>  create mode 100644 arch/riscv/include/uapi/asm/bpf_perf_event.h
>
> diff --git a/arch/riscv/include/uapi/asm/bpf_perf_event.h b/arch/riscv/include/uapi/asm/bpf_perf_event.h
> new file mode 100644
> index 000000000000..6cb1c2823288
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/bpf_perf_event.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI__ASM_BPF_PERF_EVENT_H__
> +#define _UAPI__ASM_BPF_PERF_EVENT_H__
> +
> +#include <asm/ptrace.h>
> +
> +typedef struct user_regs_struct bpf_user_pt_regs_t;
> +
> +#endif /* _UAPI__ASM_BPF_PERF_EVENT_H__ */
> diff --git a/tools/include/uapi/asm/bpf_perf_event.h b/tools/include/uapi/asm/bpf_perf_event.h
> index 13a58531e6fa..39acc149d843 100644
> --- a/tools/include/uapi/asm/bpf_perf_event.h
> +++ b/tools/include/uapi/asm/bpf_perf_event.h
> @@ -2,6 +2,8 @@
>  #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.h"
>  #elif defined(__s390__)
>  #include "../../arch/s390/include/uapi/asm/bpf_perf_event.h"
> +#elif defined(__riscv)
> +#include "../../arch/riscv/include/uapi/asm/bpf_perf_event.h"
>  #else
>  #include <uapi/asm-generic/bpf_perf_event.h>
>  #endif

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

