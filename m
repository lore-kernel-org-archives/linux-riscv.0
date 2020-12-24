Return-Path: <SRS0=/9Zu=F4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7B6C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 02:59:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D10A224B1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 02:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D10A224B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=iUx2uyapqjldk4S97n+6x7R/VkDpsPb9mlsLcltBT9U=; b=rIV8qP0m5tpS23DpuZB5OP6FT
	yT2pdyO5tRXFzyZ51PKX87U/d1d8WmT3sHcbuiTbDOqpQuQ0Ab+D723PS10F/wS4Z5pj6OZI1QfTB
	yzfeNjga3BEJKQcS54nBFE7JuTbnk3XdlBfI6xMf5z77fGhZFnlnyL0u3tXNVFFmUWlD+bM4MUkLq
	Eojd17V8j/Wm4XEb+SUGWSC+iSDKIHAxarCYKWThrFTkQfmvPAf4BXhnXOastuzM03I/VrU1w4/vd
	atynkjJSPqrp0fkTc8DDsIo8w06Z3qS7sAQ/t5+QIuMjGso5wlxkF/WqpyYjwjbK3q7xpHRcfhsVm
	W8Gc1NQFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksGqq-000586-9D; Thu, 24 Dec 2020 02:59:40 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksGqn-000577-Cz
 for linux-riscv@lists.infradead.org; Thu, 24 Dec 2020 02:59:38 +0000
Received: by mail-pj1-x1033.google.com with SMTP id v1so413677pjr.2
 for <linux-riscv@lists.infradead.org>; Wed, 23 Dec 2020 18:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3274995OIrIodYLZAPXVphdO1nymbyMxfaEx20SaZ6w=;
 b=gifmByTYbZN/rFI3tzj68H9m91uBP0jKQ2MF3LyG9P6gD/Uf3yh63hkjv4NpX5XWV8
 BnFSn2bCpwG+4x1StJeKR+KqX90+2KF8/lpHRYIwcilVPTdRRoe2IZrRdZg5+k6VOgKJ
 2ZPuJyz0Pzro7uRE/DkqVcYz8mqlzvcB15laSgiMVLpT7PMoyAlzEqCJeEMJmeR9JF0D
 FXPVsiAgKUHOWYEPUs5Wdq4PoW+jaP8x7m8DV4v1Goxa8kfhEC4xTFjq0O9ADx9Lh5AS
 fRxH3SWdiZ9IWK6qJzepU4QPl+arxCsJCvYTIjX1j9Su6hVmgvZTLcyBoGXCMitnIBXi
 ATGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3274995OIrIodYLZAPXVphdO1nymbyMxfaEx20SaZ6w=;
 b=jjxHSyYFPNABZerf0b2eoONg7O8RqcUhHqiY7Zn3p3RPDWHZHwLm6dXzD/hpsVwF2N
 yKL3u9u8sy89bgdyWte3IeFy7qNZzYS1MxoY2DcSjk2xOOTPkkjR+fmldUnp40++xlpW
 iHn7N/HUrr7ZWXEuELu12uMuR926+y4qeVaGy4H+b0u4sDfMV/fykxaXj9Bx/hJdhfOU
 /22nJBf8CSHRTB5fm6vcefOYnlzRRBJcjCjJhBhLw3krBLvw+S/7eEGvyDQglhxJur+7
 zW420+tNgmUJ9ZgyDPZMRjW/Zj4kEvxrRU3SUXI3D/KwhUm1VrUdpt9uKd9OXkPbordi
 EkQg==
X-Gm-Message-State: AOAM5317XE4Aa5alWKdAOAtYldQd2ZpXffC+87hJV3e7mpryEN1gUd8e
 Ml4tE9eYgOcF3fzHnYaN7VHuFe1A19oyFg==
X-Google-Smtp-Source: ABdhPJxwB4tNgytYCMMsgD4gR55Q+C/CjqGPeEkValNyYJrOZvu+lWvom1FTWhdXPxOoRUiAYJDLYA==
X-Received: by 2002:a17:90b:4396:: with SMTP id
 in22mr2335613pjb.63.1608778775082; 
 Wed, 23 Dec 2020 18:59:35 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t22sm24996732pgm.18.2020.12.23.18.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 18:59:34 -0800 (PST)
Date: Wed, 23 Dec 2020 18:59:34 -0800 (PST)
X-Google-Original-Date: Wed, 23 Dec 2020 18:59:32 PST (-0800)
Subject: Re: [PATCH] clocksource: clint: Avoid remove __iomem in
 get_cycles_hi()
In-Reply-To: <20201223082330.GA24581@infradead.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-b2cf0325-66e1-4e3c-bfbb-b393963fbb3f@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_215937_800780_3D82974A 
X-CRM114-Status: GOOD (  17.70  )
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
Cc: lkp@intel.com, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel-team@android.com, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Dec 2020 00:23:30 PST (-0800), Christoph Hellwig wrote:
> On Mon, Dec 21, 2020 at 09:32:30PM -0800, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> This cast loses the __iomem qualifier from clint_timer_val, which
>> triggers an sparse warning.
>
> I'm not a native speaker, but the subject line sounds strange to me.
> Shouldn't this be:
>
> 	"don't cast away the __iommu annotation"
>
> or something similar?

The title is also nonsense, I was probably trying to do two things at once when
I wrote this.  I'll send another one.

> Also this adds an overly long line.  Otherwise it looks fine.

Aren't we OK with lines longer than 80 characters now?  Or was that some other
project?  checkpatch doesn't complain, which I guess is why I didn't notice, so
hopefully that means I'm not crazy (though I guess the commit message and title
don't provide the best argument there... ;)).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
