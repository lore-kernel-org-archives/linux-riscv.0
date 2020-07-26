Return-Path: <SRS0=UGSk=BF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A8CC433E4
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2020 18:37:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B14BF20714
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2020 18:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/K5/+Io";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="nG3iBDXv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B14BF20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zsZALJZS8uJ0bpJIkmz/3R/B0OG7eFYi4xyFhZJ8chg=; b=T/K5/+IoGV++t6DmjaJ0ighgL
	++dEZIH8g3Bok7rIL2Im3p10QhqsJ6iSt+SmMG6myCARMmnqAgRYV7VrPOtdm2wWiEEpMwQwwzX0a
	Vs4YjLUgY1rCSvvWQ6xVyIj+wd40Mc250RZZTeuU2Qjxh+LlbU5yZAZqkOfCUczgz9FzoHgWYlQvy
	NJV0M73840c99S4ryA1Kh86tNwtiO4yaDNr45KKMvupT8/KHILbanbXsJhxiF++M0F6KYLXOcQ8qc
	Uv0uEaKFZmVd4MKrKPSKvBQ4T2ztr/Y2n3b4JOq32Tu2iIzpZAYJdUbazfoOM5BbIwWVdFnwWd08k
	dlesZcfDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzlWF-0007qo-Qc; Sun, 26 Jul 2020 18:37:07 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzlWC-0007pb-4a
 for linux-riscv@lists.infradead.org; Sun, 26 Jul 2020 18:37:04 +0000
Received: by mail-pj1-x1042.google.com with SMTP id lw1so368765pjb.1
 for <linux-riscv@lists.infradead.org>; Sun, 26 Jul 2020 11:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=JnUU93WKUKWrXbn9kgNlLm9JHar+29seJwT67nss/Ow=;
 b=nG3iBDXv6+813nvKzqFi/7D1yujtCUMoArCy+DcXTmZ4I+ju4cUuNU7FW7uA5qY49Z
 ahZqNfeUh/0ve0ztq5LULa1EdAVrpXYDBPr6fNriCImZTYtzcyey4UvcFxtlbUZhf6K+
 dBMM/A/8iLFwllKgkA9vjtMBbEawjuQICs3wmlYinNGG/5h0dW1M5DxVk99vKXZn0XVy
 ANwa+nPHlWm3+6Hw/FXfkx2MdNSxPUaAHqWd8lwl6ZvyE3dpmGdtRQ3AODmaQRqLyPtY
 6lPlKthvNWbkEmlUgXvS6Y34a9+GTfX+QnlxmES6i6gOxi4ETMgasw0oEqkeVJZv4+jy
 7hgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JnUU93WKUKWrXbn9kgNlLm9JHar+29seJwT67nss/Ow=;
 b=DjfooxM6jdQlrH8HZBSt7mz17BIXG5arNbcNHHclJYmVDlUnVz5B+7ytvHCz0TeppS
 BeZvK6gLcqF09jxOhidTn5+EnJA5YRK6ABpU66Qdftwv8s7kBTynMtW2oqXdYA8y2Um3
 4C37FfMKRaqGH4QrdiOKoshzjz9fuzeS7O7iVp3rbwq3jnuZdHEEHMACVR8pXKNMPUyx
 lJSJ+5HuryliIw+aPQm95I9STMENXiQzEDJov3whyekEsuUP6CkAFHwCOdq+TWlxCFaD
 yxaboSn66SUi5lvX5rf+Yh9U9Qbc741aQmF3Z2ygm8NM0WxrEzboaF2mtNTmPKGpASwj
 yhCQ==
X-Gm-Message-State: AOAM532cNBKXXb0JMK/0/uF0bWkK86+dr+SHmFz2ktGaVFj499B4gSBL
 QvZU1X727xw0qcLE8o0Lz/XbCA==
X-Google-Smtp-Source: ABdhPJx6qjIBH11BxaatM2ew4upUkR6JBUEegthI6NcPTsjsf+zkeU/A6V44/q74Th3YbWdN+FdGdQ==
X-Received: by 2002:a17:90a:bf04:: with SMTP id
 c4mr2738242pjs.149.1595788619210; 
 Sun, 26 Jul 2020 11:36:59 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c125sm11977747pfa.119.2020.07.26.11.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 11:36:58 -0700 (PDT)
Date: Sun, 26 Jul 2020 11:36:58 -0700 (PDT)
X-Google-Original-Date: Sun, 26 Jul 2020 10:59:11 PDT (-0700)
Subject: Re: [PATCH AUTOSEL 4.19 18/19] RISC-V: Upgrade
 smp_mb__after_spinlock() to iorw, iorw
In-Reply-To: <20200720213851.407715-18-sashal@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: sashal@kernel.org
Message-ID: <mhng-5bf9e67f-f6f9-4c9b-9d56-afd0a6e21cd6@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_143704_241789_9A8B2215 
X-CRM114-Status: GOOD (  19.97  )
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
Cc: sashal@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 20 Jul 2020 14:38:49 PDT (-0700), sashal@kernel.org wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> [ Upstream commit 38b7c2a3ffb1fce8358ddc6006cfe5c038ff9963 ]
>
> While digging through the recent mmiowb preemption issue it came up that
> we aren't actually preventing IO from crossing a scheduling boundary.
> While it's a bit ugly to overload smp_mb__after_spinlock() with this
> behavior, it's what PowerPC is doing so there's some precedent.
>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/riscv/include/asm/barrier.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
> index d4628e4b3a5ea..f4c92c91aa047 100644
> --- a/arch/riscv/include/asm/barrier.h
> +++ b/arch/riscv/include/asm/barrier.h
> @@ -69,8 +69,16 @@ do {									\
>   * The AQ/RL pair provides a RCpc critical section, but there's not really any
>   * way we can take advantage of that here because the ordering is only enforced
>   * on that one lock.  Thus, we're just doing a full fence.
> + *
> + * Since we allow writeX to be called from preemptive regions we need at least
> + * an "o" in the predecessor set to ensure device writes are visible before the
> + * task is marked as available for scheduling on a new hart.  While I don't see
> + * any concrete reason we need a full IO fence, it seems safer to just upgrade
> + * this in order to avoid any IO crossing a scheduling boundary.  In both
> + * instances the scheduler pairs this with an mb(), so nothing is necessary on
> + * the new hart.
>   */
> -#define smp_mb__after_spinlock()	RISCV_FENCE(rw,rw)
> +#define smp_mb__after_spinlock()	RISCV_FENCE(iorw,iorw)
>
>  #include <asm-generic/barrier.h>

While I don't think it hurts to have this, IIRC we didn't have the generic
mmiowb spinlock stuff back then so it doesn't really fix the problem.  That
said, I'm pretty sure 4.19 doesn't make it to userspace so backports are really
an academic discussion at this point.  Whatever's less work for everyone is
fine on my end for 4.19.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
