Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16D8C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 08:31:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B0664F99
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 08:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B0664F99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UEk/87XdeEkcDFt153WH0dDBTQUkVDsKs0KM0nBN6To=; b=Gn0TyuvNz9ng6I21OmvNINoGg
	F1J0aEXExIyEjT6S5Vz42TpiNsT7UYi2/AWY6WQaskE5By+LelW/ndBTy/8ehoUEg+36lPukUK2PZ
	n5xBYdgupggTSmoxKdl7zhNJoWP1pAjRI5C9i8xGDiNRHQbFp2BP3ZdTxpWiUO/jjLR1xSnaMaSsH
	IfHQ2uUdwPktZclBd+aWGOzcpjdFlBsbVKIHoQQzKJ3tjJsR5McZV7KYl/lJCQ5DPGwEY7ZDipgv6
	JIh/mSJ1JazOFzbPFCSRx10vbRQd2o2srIl2wJSv7jqDWBuY1fGkZGnIQQHcP4eEHF5CdsGbDhIBz
	R7PXwDvwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMRZw-002lL5-Il; Wed, 17 Mar 2021 08:30:56 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMRZs-002lKR-Fs
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 08:30:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id x16so884524wrn.4
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mTo2lq3PDu4WGFFq1mhOr8xSWejm9N9TQezVn74QV2U=;
 b=vAaAUsa/COHtV4cLxsSywSoISFUKa72oGocoAShP8GzMsu4VnLzLxHplR51NIem1Dt
 4SH5wo7AnV2GMfGbaQHCR2wSdM0Fz+xdBq1qkM/6JKPYo6O61hhdSsOpkxWPtfN46xIH
 JatlJMAtbZ5GARS64wj29j/RuMdVqxtZlAcMfOoJ+PVSj5i5OGcXtcKqkLJzme85c399
 RDCpdMuwOvVgxxRvYvfzFyalKDTdHZvzLD5oK5xoSmTf/YvwYTT0HXjbt1q9HoyKCxix
 r5PvnQh5x4N9X30IEXWEKMsJUHmDIXe67vjRRzz4LjrXgsgHt2NcoL2O1dq9r0W2kH2Q
 rTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mTo2lq3PDu4WGFFq1mhOr8xSWejm9N9TQezVn74QV2U=;
 b=qDmkZVyO2jyGI8czRcR5SUSi9Oopf3n0geWa5MyMEEtgQvNxNDYNmzCY3+KWlK9Dpz
 zJ0sxqx8P91vuwSoJzs5vGpEATBFLn+t18VEU0hzeDbsD4iJrl2HHV/AjFBWnypl/Uqv
 /Tdpni6zmTOSlTMAMFMAM/qfcJR1Bd29lp0LEtCvmqY1d8PCYmgfPr/rx3HUesTKsrGa
 Q3ZDLRF/HzHpwj3JqkpDy6FHxXkmmbwKp6olbZFzPyfZVTcGx+tvIopAdhJ62M2fTc9f
 7ob9yKMFYCCCfz4SAr6Y1cVtSlNa3l3Xvt7ulQ+M78FgKNZeu3o0xVTxWsu1OiD7470R
 G6fg==
X-Gm-Message-State: AOAM531I+fAmNie4inSgPEcahUvhoAIXTtLvInqtdG0hCnWtjNtPogkN
 bUAOwSLe/pj2xpwb4iArON04kp+akS4b5at/HNE6JQ==
X-Google-Smtp-Source: ABdhPJwzU0AYHnivEEGyJoYiVkM/szQNyY6KsnMWtQVOlqjVMqGpb+Z0NPlyFcZ/+koyMxsQoDwxstEXCVKvXrPtIAg=
X-Received: by 2002:adf:9544:: with SMTP id 62mr3114501wrs.128.1615969851060; 
 Wed, 17 Mar 2021 01:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210317081725.28412-1-yuzihao@ict.ac.cn>
In-Reply-To: <20210317081725.28412-1-yuzihao@ict.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Mar 2021 14:00:35 +0530
Message-ID: <CAAhSdy1wzH4N-4kFS63sOWSNdX7w9i8ZS9od6hfruMTMEOY=_g@mail.gmail.com>
Subject: Re: [PATCH] riscv,entry: fix misaligned base for excp_vect_table
To: Zihao Yu <yuzihao@ict.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_083052_658373_856731B9 
X-CRM114-Status: GOOD (  15.48  )
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

On Wed, Mar 17, 2021 at 1:48 PM Zihao Yu <yuzihao@ict.ac.cn> wrote:
>
> * In RV64, the size of each entry in excp_vect_table is 8 bytes. If the
>   base of the table is not 8-byte aligned, loading an entry in the table
>   will raise a misaligned exception. Although such exception will be
>   handled by opensbi/bbl, this still causes performance degradation.
>
> Signed-off-by: Zihao Yu <yuzihao@ict.ac.cn>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/entry.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 744f3209c..76274a4a1 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -447,6 +447,7 @@ ENDPROC(__switch_to)
>  #endif
>
>         .section ".rodata"
> +       .align LGREG
>         /* Exception vector table */
>  ENTRY(excp_vect_table)
>         RISCV_PTR do_trap_insn_misaligned
> --
> 2.20.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
