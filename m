Return-Path: <SRS0=E1a4=DE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15B0C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 00:35:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43191207F7
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 00:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PByp9Hvf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="RcTE74DK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43191207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=BpJnZxSQT7RJ9/NBFC56ukNeq5YloOQh27E+lzkHGE0=; b=PByp9HvfN2eaQhXJ4T57KXH3/
	qTaIVbyPycOEua+7XLPhaOxu5t8rnJC9Aw1tCYu1ZHJNpET8ZWZmtCyxlShv15ULEgfpNmET/6yzz
	Tg1CWR5yk8Gi/pE7Zrli7J0jFRHUhjPbqeSI3QsmF2u+ZaQ5uX9nACNYFRJD+qyu5pb1JSl1SpYZZ
	eChxDhwVfBCZGFQal1JTq83aoJoV8Nq65Fv/BsJ3uXI9ZM3kWnols+rYFe52KqWb1EIU5u5K44g3l
	3OSar6QzbtzQYNrcebNHRiMgtODwUwFD2HFV8tg4WWsYNnFb13kvdqqrDuFtlIjsaGv6pyBFwpcLV
	vRdZVnf3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMKfA-0005Cr-7I; Sun, 27 Sep 2020 00:35:36 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMKf7-0005CB-6F
 for linux-riscv@lists.infradead.org; Sun, 27 Sep 2020 00:35:34 +0000
Received: by mail-pf1-x443.google.com with SMTP id x22so6258902pfo.12
 for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2020 17:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XqtqK11C6EYp3TxI68gPMvhecqGFaleQrHQDt6dRtSo=;
 b=RcTE74DKb6HWl+IWw5w/4AS2rnlo67wcmDI3OVW2aJ1IOUEQiTmRDpcGKXwstYlIYG
 GltKiOGEAMimsPCbTGKHOd8W735oQ6p/QhPWls6bcVbBQ+h3bbv29S0Ry+WxNMdqnWu5
 5pSF/CzFs4p6kGnfKs26XTQPBbI/1YndbZEWnGPlw1L/0JlY/NP2makl8ogFDZGQGcjh
 O4Qavt2XscCKNGtlWlSn5fwG82aGyLG2V05ZIgTz3mzGLjr/HAtQKhk6BkoL0IQJzAjY
 1HJq+3zBvL7qxlclndfJIP2hZvDdHxsRrncZ7sl31F8f4v1roAaRcdfILQbmFOHQxwVF
 1M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XqtqK11C6EYp3TxI68gPMvhecqGFaleQrHQDt6dRtSo=;
 b=sUQmo29AUImHNasd/y2igR6zSkwo3yJDwCR1JSI7PPaIoDxi3AaHhJvw5/t93JrzPQ
 miQSGaXGIrt8+mJ6DhXFK6v8cJIkwz6WFiGDoiIHTP+CznwC4Jx8ZcjII3sAHpsLdg4W
 TbRqXkkTX+8FrS7Aq3cqWaNxj6eKIDwaKRboNxv+4VCa0wzg8GoZ0TWFmLf21XkUhMJN
 uxB2zqCXEZ8hafLxSdCddpQLam7CDX8ln8n5JTS64D6FJczJd+8+Vfyrfrt8Wp35GcRh
 NzXJaJf10ghNjIp17aiZbWOuJA+USiQ98vvzduJO9YxNEY3YHMQZEGBs1Twm7yXjys1U
 r96A==
X-Gm-Message-State: AOAM533MBSf/CyoLfoEqczn2XAmvzIMF50q1l+G/uXNEdBVJdLcdiA+D
 Gq9t+xuSe//jMNScLK4psyX4OQ==
X-Google-Smtp-Source: ABdhPJx8AynfC3lOSrY8k59qcyqfjpr6GSeCaIP8xhW0ff6mYLWyOIrtvz4coZ8ArlPQ2ylV7L86Mw==
X-Received: by 2002:aa7:96af:0:b029:142:6a8f:c04b with SMTP id
 g15-20020aa796af0000b02901426a8fc04bmr5456120pfk.30.1601166929558; 
 Sat, 26 Sep 2020 17:35:29 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x13sm6744416pff.152.2020.09.26.17.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 17:35:28 -0700 (PDT)
Date: Sat, 26 Sep 2020 17:35:28 -0700 (PDT)
X-Google-Original-Date: Sat, 26 Sep 2020 17:35:26 PDT (-0700)
Subject: Re: [V2] riscv: fix pfn_to_virt err in do_page_fault().
In-Reply-To: <1600419358-21446-1-git-send-email-liush@allwinnertech.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liush@allwinnertech.com
Message-ID: <mhng-6b275467-464f-45b7-9ada-7c86add704f6@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_203533_378273_124EA50E 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: aou@eecs.berkeley.edu, liush@allwinnertech.com,
 linux-kernel@vger.kernel.org, peterx@redhat.com, daniel.m.jordan@oracle.com,
 rppt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 akpm@linux-foundation.org, walken@google.com, linux-riscv@lists.infradead.org,
 vbabka@suse.cz
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 18 Sep 2020 01:55:58 PDT (-0700), liush@allwinnertech.com wrote:
> The argument to pfn_to_virt() should be pfn not the value of CSR_SATP.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

> Signed-off-by: liush <liush@allwinnertech.com>

IIUC you're supposed to use an actual name.

> ---
>  arch/riscv/mm/fault.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 716d64e..3e560ec13 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -198,6 +198,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  		pmd_t *pmd, *pmd_k;
>  		pte_t *pte_k;
>  		int index;
> +		unsigned long pfn;
>
>  		/* User mode accesses just cause a SIGSEGV */
>  		if (user_mode(regs))
> @@ -212,7 +213,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  		 * of a task switch.
>  		 */
>  		index = pgd_index(addr);
> -		pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
> +		pfn = csr_read(CSR_SATP) & SATP_PPN;
> +		pgd = (pgd_t *)pfn_to_virt(pfn) + index;
>  		pgd_k = init_mm.pgd + index;
>
>  		if (!pgd_present(*pgd_k))

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
