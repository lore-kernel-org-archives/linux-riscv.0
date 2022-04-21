Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8E7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=l/Rv4aWVVx/nUomevy6FBrvtVnk6DTFFS2+Jmo0bmos=; b=BTJy7X9hz6yPeFE7EM/uB8d8d5
	BgsE/DLg4Y3XV/F/XoQkvLS71Mvi7/WHvxrF02nQph1I5lv6NVit3QXngeixD0UF3AHzLDsuzdtlH
	ZH3rb84cyWo20Gw4TO9Ae2DiydmJg8jigmHFdcmrzWIqOthrvxUWsPHMxuLBT1g7wAdRnZB/AENB+
	8Y4M1h+exSEzuJlEoOpt1gRcG9K812mbQpIWwNcv8P013wuk+4PyMaBWiN0fhKsVacaypTcECzBU0
	rtK93zaUbk9STSDg8637AGzQhMnnWd+OyydqgS/Y2yf8WWSiUXXwzVVUhZJBjFwGBx5BeD3wsW4/V
	/v8GAOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhfk2-00FJUe-Cg; Thu, 21 Apr 2022 22:57:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhfjz-00FJTr-Pi
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 22:57:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id j8so6912491pll.11
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 15:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gXdf8YCenSephMaGE+Pw4ZkYPY5B5Dcbo0Qnie2IYRw=;
 b=oocSnwYWXZ12d5+KsaAG7tMGLltiGjNCX3GUW4Buxv4a44rlIlD+JyfJTaN2i16wzi
 DQJpyQH/Fyr7/EP1CamW9rX0RIPSEA0cxKmSxykjImnMmzh0Q7NSJ1jl0rxS+7hdJ/mT
 5RtnbaldCtFUVGRIxiz/IAPwFcacutqBrwJ0QtumBMSVhOUk0pTXX0JPGceRStSBSWfH
 wdw3aoGM4UIdtAh8A2IK1yNkPvTOTUYwqyZN/8tv4Y4rU3ZNK3aAZs1YVBWF8walvIiI
 uZACqsAM4Dr/E4XOMVdBaHJmJe1VtsstQSKgaeDJuwttP3ETvob8f4SRgYIdYLDvkrDS
 sKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gXdf8YCenSephMaGE+Pw4ZkYPY5B5Dcbo0Qnie2IYRw=;
 b=xBPUj+O6W9cIQ9tCz+BIgojBTIBD9eVTlXXXF6rwDrXHFdxOkkLU07tNlc4HTHh3AB
 hINlFGN5B9zDaVQVgPTKJDYiGqkwrnfhjHK7Ld8pkDUgYSYxBB4n3rBc/qP4J+7ZJIEi
 gwx68OpjJt42ZR6ekfE39zPA1vBnSP5Xn0PhO2SueJzhn1Mpm7CmtNtuy0Mhh6hsfogA
 BaG5QBq2/eO1vzdzlMJgUWLIMgoRV8HxRi+VShedqSxB8BqqPUoQ05CBQWibaYBGdAUx
 0GNAAvisafOb44CpwZ9b1Psg+hn1rmWDy8w6fLC47ql2IrHHLgAvupaBBRmTCt4whknd
 R32w==
X-Gm-Message-State: AOAM532eb1ac42cTwYS58My4vIkdzrxh9BGeQGA+Zp1MbyuLImdxe/O3
 JkymUG0ZRMoUI5bA3nWf6i1LoRO5nkWksQ==
X-Google-Smtp-Source: ABdhPJxJBuALK/SqNleXIYawl1It00JHlUS6Es7ewWUN0ha6JAxxRNS4Jcouy8GhGRAAR2Wa2e9SwQ==
X-Received: by 2002:a17:90b:3b46:b0:1c7:9ca8:a19e with SMTP id
 ot6-20020a17090b3b4600b001c79ca8a19emr12651102pjb.245.1650581853813; 
 Thu, 21 Apr 2022 15:57:33 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 k11-20020a056a00168b00b004f7e1555538sm155664pfc.190.2022.04.21.15.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:57:32 -0700 (PDT)
Date: Thu, 21 Apr 2022 15:57:32 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Apr 2022 15:57:23 PDT (-0700)
Subject: Re: [PATCH V3] riscv: patch_text: Fixup last cpu should be master
In-Reply-To: <20220406141649.728971-1-guoren@kernel.org>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 guoren@linux.alibaba.com, mhiramat@kernel.org, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-320b7f4f-08bf-4ee8-938e-4bf687760468@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_155735_875449_49F52D73 
X-CRM114-Status: GOOD (  20.43  )
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

On Wed, 06 Apr 2022 07:16:49 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> These patch_text implementations are using stop_machine_cpuslocked
> infrastructure with atomic cpu_count. The original idea: When the
> master CPU patch_text, the others should wait for it. But current
> implementation is using the first CPU as master, which couldn't
> guarantee the remaining CPUs are waiting. This patch changes the
> last CPU as the master to solve the potential risk.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: <stable@vger.kernel.org>
> ---
>  arch/riscv/kernel/patch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 0b552873a577..765004b60513 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -104,7 +104,7 @@ static int patch_text_cb(void *data)
>  	struct patch_insn *patch = data;
>  	int ret = 0;
>
> -	if (atomic_inc_return(&patch->cpu_count) == 1) {
> +	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
>  		ret =
>  		    patch_text_nosync(patch->addr, &patch->insn,
>  					    GET_INSN_LENGTH(patch->insn));

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
