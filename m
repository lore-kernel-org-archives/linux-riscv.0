Return-Path: <SRS0=1zpl=3A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB017C282DD
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2020 00:20:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9208520838
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2020 00:20:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IzjNgl0e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="hJNbyZmX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9208520838
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:References:
	In-Reply-To:To:Subject:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmDl8MlBs8zMpHbzwC/Bjnzdb8+0L6MEHqUg6wui8eM=; b=IzjNgl0eQ1HrWR
	imUBXkDQmKuGXdrqweD520fgub4Iks9I48gAtcJdJzT/Rb0+y4O5FDQumCmh1TV1O2Sd5plpe27aB
	a3d10dioqX5kiZjIP2uFFzr8B8/WvE9Wzc0+M9yHjthzSlZ6U8jufnaOXHgJs4VctgDpwpCXYtcRj
	G08JYRapzfLSrlVDJLQ5eX8U8slf/qbSdqN5aC318cZDeEC8wudyE13jw8qXluC8HSaymedM9WRwr
	60f5Ccl2DiTfYlu4JFsy6RWhGATjAiPO6PWEC/Ar196wAEwjQ35OBb8c/nTvzFVmuWhKPBr2egmVo
	7GYOQ/nV4LmNJrD/XMyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iq4Vk-0007sV-4y; Sat, 11 Jan 2020 00:20:16 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iq4Vh-0007rf-87
 for linux-riscv@lists.infradead.org; Sat, 11 Jan 2020 00:20:14 +0000
Received: by mail-pf1-x442.google.com with SMTP id x6so1897714pfo.10
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2020 16:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=XmDl8MlBs8zMpHbzwC/Bjnzdb8+0L6MEHqUg6wui8eM=;
 b=hJNbyZmXObUnnNReXzLTdAuenJ0Cs9Fy3IDYZ6wmGsmrCfWO/CaC/aROMb+knJte+7
 73WWSHAFx90sYAKfkzcPgTkafMXwmE+twWaKcW+kw+tUqeTw5wGZZo53mRiIrubkGkwv
 iNBDPHrQ8xtgfzHUWhpdo0W622Z6parTE2pfypw8im/z2EUMs41ye2BuF5xxRSPyqyqx
 Pba6HoFvucvSPF8pjCuSi+eoZzeKUKRVoOwAL1TQCsbVz0IjE00F8uz7MTSOVZfwrZ1K
 ppvyJPKSmsbnhN1j+2nD0ZffWePtX7TJvQS3d5IMhgLe0PyI/BcSMkmkfq1wLsfz8EcV
 nyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=XmDl8MlBs8zMpHbzwC/Bjnzdb8+0L6MEHqUg6wui8eM=;
 b=kHYozF9AoA2gFfSX6GcV86qF980tXenTE3mdviUHPt5jeE4KeM9ik748gxokL7rtMf
 OIukdPRBc66W1SOy5vfKY7z/IoeyPnVEcciUzttd/6i6iPE/UzYWinf08N/7ww5ZJgWC
 d14Q9Vu8PDfUdoqYxDVwWrFFf7VkQQO7Sz4mpe1GjBXHQ/t75pF4zAT/d+CpRqyIB29l
 sjRxXO7KSHK6LCwQrLcxdDa/G60jnlx2YlJC/1gi12Nt9u3NLfov441gUmEggDYV8GcX
 SrqxCSxya/+M1ouBuAsqx/BKnRmfYZDuO8DwwiqbGDkQrlE61dEb9dIn/+EXm3vlJYkS
 CmNA==
X-Gm-Message-State: APjAAAXnoThfiXKpu29x+dIQ/ryvyD5yAoWgCOdzHOCDUJdlOLnA2OM0
 trOu11RPLXBjL+0I1/gu9Q9DHw==
X-Google-Smtp-Source: APXvYqzjBGpO8kkPo5gF+67AjQ5pa7PPUpyL1EIgRCN2owS8u1ATduGjhglT2mSaECpWO5gFDTOwDQ==
X-Received: by 2002:aa7:8d8f:: with SMTP id i15mr7093588pfr.220.1578702010124; 
 Fri, 10 Jan 2020 16:20:10 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id q6sm4289190pfh.127.2020.01.10.16.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 16:20:09 -0800 (PST)
Date: Fri, 10 Jan 2020 16:20:09 -0800 (PST)
X-Google-Original-Date: Fri, 10 Jan 2020 15:58:58 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] RISC-V: Typo fixes in image header and documentation.
To: corbet@lwn.net
In-Reply-To: <20200110101707.06800f3c@lwn.net>
References: <20200110101707.06800f3c@lwn.net> <20191210072947.7018340c@lwn.net>
 <4912c007ab6c19321c8c988ae2328efbfb3e582d.camel@wdc.com>
 <mhng-3a815562-1222-4737-a77c-6dab9948db79@palmerdabbelt-glaptop>
 <mhng-94b9cad5-0d14-480f-b428-8752630064d2@palmerdabbelt-glaptop>
Message-ID: <mhng-9fc36964-582a-4186-818c-e9f7efe05a38@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_162013_318420_34418A62 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: aou@eecs.berkeley.edu, mchehab+samsung@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 merker@debian.org, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jan 2020 09:17:07 PST (-0800), corbet@lwn.net wrote:
> On Thu, 09 Jan 2020 15:42:27 -0800 (PST)
> Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
>> > I was assuming it was going through the risc-v tree since it touches arch
>> > code :)  I can go ahead and apply it.
>>
>> I don't see this in 5.5-rc5.
>
> It's in docs-next; I've not pushed it through straight to 5.5.  I can do
> that, I suppose, if it seems urgent?

I just wanted to make sure it didn't get lost.  The resolution of the thread
was a bit ambiguous and sometimes that results me losing patches, so I just
want to make sure everything is clear before I drop threads from my inbox
(which is essentially my TODO list).  I was just digging myself out of a big
email hole so I figured anything still sitting around would have landed in
Linus' tree by not, but maybe I wasn't as far behind as I thought I was :)

Thanks!

>
> Thanks,
>
> jon

