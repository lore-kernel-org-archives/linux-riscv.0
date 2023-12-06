Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339F9C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 17:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=c3KgodDam7nMp98c1Y4JFfLPkMWJoJ2Q3Pbq7h1m2Jo=; b=xbNvJHkx0eR4QBEntKVP7RmOaR
	iZkpOmhx9+opP8RYioepymabEoFiRzU19CnJySNkMiEJToRqGIW457uLjUeX6bTdYI/+xTCi5aMXp
	Hsae+zUqWVgMwv6rRhuYHZa7ThPHBNCropJmaEWGTy4qKXC5eF65bKMkEoHAGFd7LPyrWbZL+WNJE
	RsFKY+2dGX1trFxkLM0f1utaWVKCBasDk+By1Xf/TIkPQ6WOTKkgjA8v8cb/P3yo5acfaEaMmMjq1
	rcgIE0EYy0kOsvJxVq+I6vxNQHiZWF8EOxAoyeMuWr4dzrQPQQQXXsQwuvWOwiZBfF1bDFCEFfKEs
	cRi4HixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAw8D-00AypY-0a;
	Wed, 06 Dec 2023 17:56:21 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAw89-00AyoS-23
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 17:56:19 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6d9a3c035b3so15779a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 09:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1701885376; x=1702490176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzmOds210uOLMoqUxUrCLSQtsPcHifLKozmBM1oKPoo=;
        b=w+SSKOsBfWwrZR2uw3hLUOJf05jypTyrSmFKgBeIRte0eB8bo+PNCYOSP7BX0M/e1L
         n3nZWG6zfqaJhHdIzF8cOqV1DK7J6wd87+EHcsu5QTCtvrC1X4Ehe0bERDPoAIIIWIeb
         Idi5LyVqCTuJNVigbpPdwgTuIWs2knxWI53ceVwgJ1VCadWLYR/TRhDVnSY2pWJw8zTh
         aCUKuD5juQFfgwpubzEPoxYG41C0LM9LDasdQln6hNz7gB1htiRevtoHiFMhA6WG3kk1
         53GCzk7WhlTuCg78Bkpafoc0pmOK66ELCPC9T+3BlGL01/nvauvnpIsAC3I/YqwLQxh4
         cr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701885376; x=1702490176;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzmOds210uOLMoqUxUrCLSQtsPcHifLKozmBM1oKPoo=;
        b=RS/d/WFPxcI3raLVtoMJzypahM1OAtELNZAOVke/VtcqpAxhVHgGIXgm0GDenvIZgp
         UsgYVRVmpSgnDArOxeBJtqTnZd3iMenpkLBSSsxpz69sW1k2BmHSfUcqCsrx2pc0Y6dZ
         8Q8le43iYjtMfj7GxzcGpvFkCpNx0WIiyLfUwVirIWS1bDTk8bCYI+1ctGPdl11SznIj
         N1hDA7gfKBpoEs+tI9EUtXRhRkkKx95NUUDcfyzPsw6utyHqOOPSC5veEAz7/q54l6Y5
         xlxWqDnLpAjQxpkqosnDfalRVHQdPQI3iTyVMlydlMP7uAvW4Ze8nWhRqGfyC2NkEWrt
         I15Q==
X-Gm-Message-State: AOJu0Yx8j1bs4XrrFsvxazYgLXBxcVSRcmK7SlslQMLM+Lr69LXfAjt+
	x29MfAGyda1DPTwmVZanSREgcwM8hVR5kzEWpmQ=
X-Google-Smtp-Source: AGHT+IGuLe3uXFDTYJvCW1TreYHsP4rbqmaZqL0yKN+0sgi7VOo/WQy0nBuEdy5xTo8VjXoiNfBFSQ==
X-Received: by 2002:a05:6830:1e69:b0:6d8:74e2:a3d3 with SMTP id m9-20020a0568301e6900b006d874e2a3d3mr1377709otr.47.1701885376195;
        Wed, 06 Dec 2023 09:56:16 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id l11-20020a0568301d6b00b006d81e704023sm52207oti.2.2023.12.06.09.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 09:56:15 -0800 (PST)
Date: Wed, 06 Dec 2023 09:56:15 -0800 (PST)
X-Google-Original-Date: Wed, 06 Dec 2023 09:56:13 PST (-0800)
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
In-Reply-To: <ZXCylOEXSbEMGB96@andrea>
CC: mathieu.desnoyers@efficios.com, paulmck@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
  charlie@rivosinc.com, rehn@rivosinc.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: parri.andrea@gmail.com
Message-ID: <mhng-5a4880f5-926c-4087-8bb9-b6c09fd4e288@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_095617_877609_98EA8E08 
X-CRM114-Status: GOOD (  14.78  )
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

On Wed, 06 Dec 2023 09:42:44 PST (-0800), parri.andrea@gmail.com wrote:
>> > The final version of this fix will likely depend on some machinery/code
>> > introduced by 3ccfebedd8cf54 ("powerpc, membarrier: Skip memory barrier
>> > in switch_mm()"); but, yes, nothing we can't safely adjust I think.
>>
>> Ya, I guess we'll have to look to know for sure but hopefully it's
>> manageable.
>
> Absolutely.  One approach would be to follow what PowerPC did: AFAIU, before
> 3ccfebedd8cf54 membarrier/powerpc used to hard code the required barrier in
> in finish_task_switch(), "masking" it as an smp_mb__after_unlock_lock(); riscv
> could use a similar approach (though with a different/new mask function).

IIRC we patterned our MMIOWB/after-spinlock barriers after PPC, so 
that's probably a good place to start here as well.

> Alternatively, we could maybe keep the barrier in switch_mm().
>
> But let me complete and send out v2 with the fix at stake...  this should give
> us a more concrete basis to discuss about these matters.
>
>   Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
