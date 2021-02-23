Return-Path: <SRS0=jBL8=HZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A884AC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 01:52:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A82B64E12
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 01:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A82B64E12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=NRwwAJ5oLeVfQgy/QPuIOvotieMc1wjrxoBk0eYNs1w=; b=NlAgxKY8p7IjREBUi8yino0fL
	edTyrJk7yyZijYaJu99i2zgtAJxLqn2MvmM+pWFVq4A1yMulrEjKqDNhuxnv8/gBrzxfoo8+R3nD7
	ULH1UAw+k6Q+1CJzFIhgC0u/Xs46u9ImNxFaPCXoSV1xPZ+wEot3S3R2H3zx3sv030nZzR9n2WQk5
	t+strn2pKuQBB58YNyFrw+VJ6SFDtbV+FJ1yQ/sTz2V0LCUnj8rnlDNC1lgRFbbH8RukviHiMUWOU
	nO1SKJ+d22yRl0WVmGV3aYSYIEtowMPFN4g20lbpvyRgHp2BB/cC4gKAyoG5/vR7yB5ZTPy/1IS7J
	3OK6H1lWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEMs3-00032w-Pd; Tue, 23 Feb 2021 01:52:15 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEMs1-00032R-DJ
 for linux-riscv@lists.infradead.org; Tue, 23 Feb 2021 01:52:14 +0000
Received: by mail-pf1-x42f.google.com with SMTP id u26so1835990pfn.6
 for <linux-riscv@lists.infradead.org>; Mon, 22 Feb 2021 17:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=i03OoVFIoCd9d7mopy6n9KNFtMtnvCU0u6uw787955A=;
 b=y6VAALqKDBuGX6IlrZ6Nxk+kGeorrzo+X840afRJZXc36kALZMxvq25W1uOf3vcyeK
 aGjJDgjLp0vu+hqBwxDoNR5Gw4JU7+uB31BBFnl0+DJ006zij7hjSi4KKwbELPmeg/dY
 SXuh7OaX/zHR066X7NOoJvDuOjAfcSCcR9nojEOmSbvQE5I4eeOlZKMenre2LHkehA9J
 pxeTL0a98YI8ZoO6Mywqv5B1E/s0XhCdR0aYyJUaj8wdVpIH0tBENZRTees2OVXoddzF
 g1meurMTUdjeLPVSxHw/Fjr7PGYv4yY0uHQYOTY4dOyt4zddrysLW9qiQE24s4P0pxGk
 HzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=i03OoVFIoCd9d7mopy6n9KNFtMtnvCU0u6uw787955A=;
 b=OILX1xL5lmOD1OgEl474Utt4Ir30WmttJFNXdqU5vDqnd2hlNuGbVoXls0CyGQc0Vj
 ncQiaGDO+b+IldjnyCgxtf4jCW/qahE6ekFTstdwuFvQrdB2a1NMFGuMYpmFPH3rdZM0
 a0mv8KfZRm55uR12i4ENy0e2MJcJAq1U8wKa+4ExmktBOOWWoTZ+hVEoJecAwqL1fo7M
 +h8w36w9SBHngDAipJn9JeQxO20AlXwA1Npq1OzoKSKnLDZCZYpPjEG+VNYDCpxIwtn7
 8U542S0DG1O8xPcvm9K8oAIH4XMVdfA9h7QBBdK6JrG/9dCX6eClN0C7GClvDLho0Rrm
 wPNQ==
X-Gm-Message-State: AOAM530YFqYa69s69b8g3PX9S24Zl248TA44pIqOt7ukqi2w+wxD7JXN
 JLVm3YROCELukqhslxVibYSMhg==
X-Google-Smtp-Source: ABdhPJwLc46PcHoUqhXBD+1kYH3vYipBu33FF1lWqHnjM7n9MCHjVhWU/v6owMLGkW3Jzy3CNTRWAQ==
X-Received: by 2002:a62:5e02:0:b029:1ed:8bee:6132 with SMTP id
 s2-20020a625e020000b02901ed8bee6132mr10401303pfb.48.1614045129277; 
 Mon, 22 Feb 2021 17:52:09 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id br2sm757366pjb.40.2021.02.22.17.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 17:52:08 -0800 (PST)
Date: Mon, 22 Feb 2021 17:52:08 -0800 (PST)
X-Google-Original-Date: Mon, 22 Feb 2021 17:52:03 PST (-0800)
Subject: Re: [PATCH] RISC-V: Add a non-void return for sbi v02 functions
In-Reply-To: <CAOnJCUJq4Gfd_YvJz5K2yFwmsSiB3LDM6rSQ2d+O+jV8b0z_wg@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-96a8d981-5dff-488d-af25-b3c40815b643@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_205213_618803_635FB896 
X-CRM114-Status: GOOD (  23.03  )
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
Cc: wangkefeng.wang@huawei.com, aou@eecs.berkeley.edu,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linux@roeck-us.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 22 Feb 2021 14:38:28 PST (-0800), atishp@atishpatra.org wrote:
> On Mon, Feb 22, 2021 at 12:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Wed, Feb 03, 2021 at 09:26:43PM -0800, Atish Patra wrote:
>> > SBI v0.2 functions can return an error code from SBI implementation.
>> > We are already processing the SBI error code and coverts it to the Linux
>> > error code.
>> >
>> > Propagate to the error code to the caller as well. As of now, kvm is the
>> > only user of these error codes.
>> >
>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > ---
>> ...
>> >  #else /* CONFIG_RISCV_SBI */
>> > -static inline void sbi_remote_fence_i(const unsigned long *hart_mask) {}
>> > +static inline int sbi_remote_fence_i(const unsigned long *hart_mask) {}
>>
>> Error log:
>> In file included from arch/riscv/kernel/setup.c:29:
>> arch/riscv/include/asm/sbi.h: In function 'sbi_remote_fence_i':
>> arch/riscv/include/asm/sbi.h:150:1: error: no return statement in function returning non-void
>>
>
> Sorry for the oversight. The return statement is missing.
>
> @Palmer Dabbelt : Can you fix it in for-next or should I send a v2 ?

I just fixed it up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
