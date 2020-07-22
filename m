Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CA2C433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 03:29:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E8E206D7
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 03:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IU3/ZoZ3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Ef1yT7HO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E8E206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=vLhvn3ToQuilozZRjnV5wGQBSen7M0OhVkhM2vZsKZo=; b=IU3/ZoZ3x0eiH8uhuLp8XLw69
	kdTOdNpflUg7hir70A0186e+Fh9+hwoigOPLPaAKnaqm+FOwmcEPLw4ecD7fzr/SMYIpgmfiTEsV4
	nRWaQ4I2abCP/7YTcm5kqMIunsTVfgz8c1iKcpxc7EynqC4EHrJlOlIQyXwrSs/6oiU9IoM2gp8w0
	DXkz4JoQt+p4nrvDsIsPSSmxJDrGFNABn8obEzaand62IB/Q+BuMwbbBeYLQmY9FBp6SNbMhWbCfR
	R/DUC9cl0JcU7t4IDH7qKGcSQNhhDOuaAKY9kwrrwCyF583r99h80AYa2ImrY/4XO6MjMBm4fIImt
	5t/DUEIuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy5Ri-0005nt-NI; Wed, 22 Jul 2020 03:29:30 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy5Rg-0005nY-Ew
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 03:29:29 +0000
Received: by mail-pj1-x1043.google.com with SMTP id k5so442205pjg.3
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 20:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BtuBGK4t/FRFS+JgAekun0SML2az4OmXyKU6ZI8gNZg=;
 b=Ef1yT7HOSIyfdHphlAeHPa8Dt7+28NzF/D74RHSureRr5KDZYFOeIngq2sq1Z5QhsA
 GiA0QnWzeCkAHVvPEN7FCT29Rfs0LWIMvkquJw+u/KpGVmXxOR3opj/fkh0CSa+7M1bg
 6YhvWj1TrPadHvIjdcFuyCHaKQO0mTnUEu6Hf1edfQCYuvk/KIgKJIBd0fdOStfhqBQo
 NxJ0qMM86BqQzfb53XFV7GgzIKgYz3VB/qrmdpThNIuprtyG3ZvDiH1FeTHXW80zWMBq
 x/uFLBOO8DtKU/MuPTJljG1hJ0qZADINe8RF92cHdDUwQCONgyrQ4g032nx7gfFf4e9S
 knJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BtuBGK4t/FRFS+JgAekun0SML2az4OmXyKU6ZI8gNZg=;
 b=sAzxMt+Tk1lX3/fBN6VmHdrdtzsUMVKncXbwC3fXrAEWceThBEGrJj8LIUMf+rJNPa
 Favucupp8ZTjhoQKHOQ6SJ4y0R9wh4YSCL+oPPrhydEzjKiUfqzq2d0bA1XOEa/WufC2
 qoBgWWs+xk2dlYmJ3N4fwtFbZOEQQHKHmjL88QOvc+AgbTbpfUwvDirVjmQ5twJSLwly
 vb5gfc2yuBfw5WWKJ0PPe9xT3pQNvxBMUa8r/v6i8Sd60OLcx3KTT58IG6iaKQAecY+c
 dEgWGQA1m16N0telbhyVWHkDuNCQ+Ruonsv+VvoiHGWbx4kFvDpnIJIOMJehdnHldeza
 f4Sw==
X-Gm-Message-State: AOAM5315XWt+rWvCcry81X1MUClk2KaWJHXYVS4rBgtEk0AH4gBCev2Y
 mUu/KSR1C9Y4D5ZX9alU54SLtQ==
X-Google-Smtp-Source: ABdhPJzgoJQz8ruIf6+m/8Ju1Kfv15+n4PqoJoax44ao40xxXmsbByEBvfDpklAgxMVVkhA2UdXnyw==
X-Received: by 2002:a17:90a:e981:: with SMTP id
 v1mr7759910pjy.130.1595388566029; 
 Tue, 21 Jul 2020 20:29:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z20sm3802961pjr.43.2020.07.21.20.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 20:29:25 -0700 (PDT)
Date: Tue, 21 Jul 2020 20:29:25 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 20:24:19 PDT (-0700)
Subject: Re: [PATCH v2 1/2] mm: pgtable: Make generic pgprot_* macros
 available for no-MMU
In-Reply-To: <CAOJsxLGm0B15nsyRNTCOYWUXLbjRSc-CTtv-Mv-OLq2k3ZjMvQ@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: penberg@gmail.com
Message-ID: <mhng-de42568c-1963-4b45-8ad2-be5ac849be2f@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_232928_563476_D98F41D6 
X-CRM114-Status: GOOD (  12.75  )
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
Cc: thomas.lendacky@amd.com, rppt@linux.ibm.com, linux-mm@kvack.org,
 rientjes@google.com, akpm@linux-foundation.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 16 Jul 2020 23:14:10 PDT (-0700), penberg@gmail.com wrote:
> On Wed, 15 Jul 2020, Pekka Enberg wrote:
>> > From: Pekka Enberg <penberg@kernel.org>
>> >
>> > The <linux/pgtable.h> header defines some generic pgprot_*
>> > implementations, but they are only available when CONFIG_MMU is enabled.
>> > The RISC-V architecture, for example, therefore defines some of these
>> > pgprot_* macros for !NOMMU.
>> >
>> > Let's make the pgprot_* generic available even for !NOMMU so we can
>> > remove the RISC-V specific definitions.
>> >
>> > Compile-tested with x86 defconfig, and riscv defconfig and !MMU defconfig.
>> >
>> > Suggested-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> > Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
>> > Cc: Tom Lendacky <thomas.lendacky@amd.com>
>> > Signed-off-by: Pekka Enberg <penberg@kernel.org>
>
> On Wed, Jul 15, 2020 at 8:39 PM David Rientjes <rientjes@google.com> wrote:
>> Acked-by: David Rientjes <rientjes@google.com>
>
> Palmer, will you pick up these patches in the riscv tree, or should I
> ask Andrew to queue them in -mm?

I just put them on for-next.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
