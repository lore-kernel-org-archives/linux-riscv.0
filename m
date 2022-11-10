Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6879EC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 21:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P5jnQoQ5rZQz8x8sTjVhNfJMTYoDO9I8Z4vtkRc39qA=; b=4YNDaLFtS3j9uPQFxkPj5RBXZl
	Vmpg/hQqokPhKMQvOzZeqs7S/ffGWVyyCoeabk0np3Gc93I+oq1bSHSOvUBaCHmQe0k9AbBymZ645
	F2jix8B5g8yDre68L0Yf2pJl+r0djTYmLPqHtoNKCzRqx5WIVsLtRNos4haCa9/bBAF2ik+FyvaJu
	q9+xzDp+D8DK1izoWvpZKA5Z25/eTsJyw3EDtzp5tSNbROkDMLVDCNmAPLQ/YOkEaZN1muLdTmPH9
	1U4CUDOrW1HMuvMUW1xuCX/04rLNMj1Dz6PCD76RtPWyb3K/XJvn0XPm8JH8Tf5kO2aihI7r64TXZ
	+WCpUPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otFJM-00AWTD-It; Thu, 10 Nov 2022 21:42:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otFJJ-00AWQq-Cx
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 21:42:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id k7so2648954pll.6
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 13:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSztxiJ5t6Iqa7j7QbwzknRhLr5EexaRl2lcq/yDKSw=;
        b=KoYGu5IIzOXGeXG4drNc1+CwdElhVuLMlSIl6h6O12ydrJyf4jnKTAAci0FKmlc3cD
         CFCqcSI0IR7sH97Be4G+724cCVPmUfuq1IklP/Mz0HAAQ/JGHC9E1jsHFAeNk9ap5iPH
         X8l0a8cDym+nzieJUbb0ErbioV8gI6DBsGAFtq9H+cXkpokKRbBw7dcWyCArFgJmuhmA
         pYIgByRnuTiDERvOvF0+ce6QtYY+nqszISkaZMWKuoiD+K36o/uo8MkgoNl+JjQDiOPK
         YHCcVp21lBiA2iqU1ltMC/EL2irkVChKb6Rko/vFgodMMth36AQZKJv+o/0xT9snWr9i
         Dn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSztxiJ5t6Iqa7j7QbwzknRhLr5EexaRl2lcq/yDKSw=;
        b=uwNkYS46cN6GByztBs8Bq2Nz5bqRsmhiFE7cNTxTbq0Se5f9KWA2p2rOztIPxBCNSO
         QsmkBYCEEDEXpHDvuvW71tcujXZbsCqR7vugnESC2JQn+WVmnn4nWLnqb/19WG8qPbZk
         WRCPDH1vduzE/Uvvxymxk4fFkKXO/iV0k5bOuIuLR1YwJmOsekI8l5M9Mhlua7qYbtba
         wA3j+RPlSF+bzwA8D8Q5g0LRzFXBtCVtR7f3TXeVZNLyLV3yqMmnMyerOzeLuGeK+LZ/
         9p9ewk8xDvjpB4xeRqrdOx+BeKEMHnmPAVBVui+++AZC2zlaFkO8jLgjsyxYOP793lYW
         cu1A==
X-Gm-Message-State: ACrzQf2Lrvh2lXmN6v4M8PyPiolR4lnaCYQ1zOo8ps+rlHx71waHirBd
	HgN5QRy7bIiHnNd5Qoh92NrviQ==
X-Google-Smtp-Source: AMsMyM5Ko/0Xxdd0D4wfqneZtZye8DqKSLgy8+nDpiPvljrSklrs8pt0ztzdCwt6DpTGEU0urkT+5g==
X-Received: by 2002:a17:90b:3102:b0:213:b853:5e45 with SMTP id gc2-20020a17090b310200b00213b8535e45mr2178800pjb.97.1668116524759;
        Thu, 10 Nov 2022 13:42:04 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902bd0a00b00186c5e8b1d0sm145934pls.149.2022.11.10.13.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 13:42:03 -0800 (PST)
Date: Thu, 10 Nov 2022 13:42:03 -0800 (PST)
X-Google-Original-Date: Thu, 10 Nov 2022 13:42:00 PST (-0800)
Subject: Re: [PATCH] RISC-V: Do not issue remote fences until smp is available
In-Reply-To: <CAOnJCUK5Z6i39f5MJaRFhorGjcmBR=p_MapY_TDcR1e274wtpA@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>,
  linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org, damien.lemoal@wdc.com,
  devicetree@vger.kernel.org, jszhang@kernel.org, krzysztof.kozlowski@canonical.com,
  linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-76ad1ec7-7ad6-4223-9e6f-321ac56d6dee@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_134209_673166_730E6192 
X-CRM114-Status: GOOD (  27.77  )
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

On Mon, 31 Oct 2022 12:26:05 PDT (-0700), atishp@atishpatra.org wrote:
> On Mon, Oct 31, 2022 at 12:12 PM Conor Dooley <conor@kernel.org> wrote:
>>
>> On Fri, Oct 28, 2022 at 04:19:29PM -0700, Atish Patra wrote:
>> > It is useless to issue remote fences if there is a single core
>> > available. It becomes a bottleneck for sbi based rfences where
>> > we will be making those ECALLs for no reason. Early code patching
>> > because of static calls end up in this path.
>> >
>> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>
>> Hey Atish,
>> This doesn't apply for me to either fixes or for-next. What branch does
>> it apply to?
>> Thanks,
>> Conor.
>>
>> > ---
>> >  arch/riscv/mm/cacheflush.c | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
>> > index f10cb47eac3a..7fafc8c26505 100644
>> > --- a/arch/riscv/mm/cacheflush.c
>> > +++ b/arch/riscv/mm/cacheflush.c
>> > @@ -19,6 +19,10 @@ void flush_icache_all(void)
>> >  {
>> >       local_flush_icache_all();
>> >
>> > +     /* No need to issue remote fence if only 1 cpu is online */
>> > +     if (num_online_cpus() == 1)
>> > +             return;
>> > +
>> >       if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
>> >               sbi_remote_fence_i(NULL);
>> >       else
>> > --
>> > 2.34.1
>> >
>
> Sorry I forgot to specify the dependencies for this patch. This patch
> is based on Anup's IPI series [1] as
> I assumed the IPI series would go first. I can rebase on top of the
> master if required.
> However, the issue will manifest only after Jisheng's patch[2] which
> moved the sbi_init to earlier and introduced the
> static key in the paging_init path.
>
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/20220820065446.389788-8-apatel@ventanamicro.com/
> [2] https://lore.kernel.org/lkml/20220716115059.3509-1-jszhang@kernel.org/

IMO we should just stop issuing the SBI remote fences at all, with the 
code to do IPI-based fences we're just adding complexity for the slow 
case.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
