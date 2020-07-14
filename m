Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076D2C433E8
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 21:37:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6FE320656
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 21:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aH9GIuui";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="qTx730Tf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6FE320656
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5adZLmO6joGWJ8D7FJsbbgvi/mFN9rnF/LvILHJguYY=; b=aH9GIuuiidRVSPUZevm4N3faN
	+RcPhg+LoomcoeDq59MRgTPdQ0MewLcefPgcXzZZidhYIVEiAifUXasOikM3yN3rbwyiMY2odWGwE
	SDzKcozy/Ofuxg4csl42W2Pza+FBOObd9a2SobEPbPyLByWV4eqDafCC9Po0NvrOhx8ElovwmWjXj
	L/eST66cPPvFWHpNCDBQbwLXCpeWUn34JeWA9DPEApLlx/sqBzGBW+Eg1KApyfZErUdSrcwkW7Deu
	OHs7JD40I3dr90NjvtZlhvnGpHHBHHw/xlsii5FH8AWQcCH3a8GhmhfFPPXOSpt0HOk7nWI3EH2xn
	SdqIyg0uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvScG-000869-8A; Tue, 14 Jul 2020 21:37:32 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvScD-00084l-7b
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 21:37:30 +0000
Received: by mail-pg1-x543.google.com with SMTP id s189so3283391pgc.13
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 14:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=C54nHXHsUM0Qzrx7nhavmp50YQVhcvTqM8Ua357T2Pw=;
 b=qTx730TfxP3JHwMdHeZOqrmvpY7Mg6iX9sEkXdL9theGEKszlTww7DhX3BJm36q918
 zqkrmNinmRP0OWR8vQ+dteXXFN3heC0Zk6aLTGhLgYlQx8qir3daIHA0nKHfV19fWrde
 UZNClH+UUrV/mWjU3Z9ygCqLiTTVgVIajCcGFI7JO3fhS3GcDA4FtbW6UX0b7a4VoXsq
 NxQPa+/HLOFE44obe2NHXwG0YNiCa124MgFjl8SpXx4fgBZkpHgsA7XyjDJ23hMyenA8
 dnOQM0J8JRSTe2fUS8TTDoV2Apo3GqvTNGTSMI/1Yr098hWPBXcpuxlS0fCjWczIlXzD
 n2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=C54nHXHsUM0Qzrx7nhavmp50YQVhcvTqM8Ua357T2Pw=;
 b=Ru0rT/Ja5El3IKxLcu5pKCG/Kr2tMlYe3fqZrx+yx2aMG05Jl1ODDrSLmTIBtygqFC
 Xeiw9Yqm9Woisfnb/TTI7bn84CM3m676iDKJOOFuycpm832Lc2qpsL36dJCNfR+j/sNO
 DDaqvHVLmqL3eF+LvkCqyWqYNJ7THSGWUc1EZECuXp0amJZjB8TsMWS/ApKFL32JEM/o
 VVpctUXsAPm+Cd9uPRaZdwXxh0uHlg+Kfto72zlEKihxfeuH5dyuFj48lu6A6ixQZxnM
 RRDOKCQ2Xpie8eEht1w7mgBAKBvP9eW2fxmeANeQDBJRrynpTw20FKaE2yGe9WDy7nGY
 pBeA==
X-Gm-Message-State: AOAM5310U1DXQPp6MSysUotFxSzUAkiE8COB7rTaYCAw2f4YdnrM6kvG
 rPW7xVaP+7iAvl8VUWZ9kZj/tw==
X-Google-Smtp-Source: ABdhPJxbt04MjtWU9INStQlDLZYpgWBPOi6Ww+voTCMPjUB55b48eu35Lsfm+KBmADjDJ1Q6aZ6f4g==
X-Received: by 2002:a62:140e:: with SMTP id 14mr5745202pfu.196.1594762647015; 
 Tue, 14 Jul 2020 14:37:27 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 141sm121736pfw.72.2020.07.14.14.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 14:37:26 -0700 (PDT)
Date: Tue, 14 Jul 2020 14:37:26 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Jul 2020 14:23:52 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Double the stack size on rv64
In-Reply-To: <87v9iq4q6d.fsf@igel.home>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: schwab@suse.de, Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-c3f9f747-5069-4688-ab68-9e43f413d4fa@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_173729_286173_C7E8C6C2 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: colin.king@canonical.com, linux-riscv@lists.infradead.org,
 stable@vger.kernel.org, dvyukov@google.com, david.abdurachmanov@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 22:32:42 PDT (-0700), schwab@suse.de wrote:
> On Jul 13 2020, Palmer Dabbelt wrote:
>
>> This was suggested in the syzkaller thread as a fix for a bunch of issues.  It
>> seems in line with what other architectures are doing, and while I haven't
>> personally figured out how to reproduce the issues they seem believable enough
>> to just change it.
>>
>> Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> ---
>> I've put this on fixes as I don't see a patch from anyone on that thread, and
>> it seems straight-forward enough to just do it.  If there's any issues I'm
>> happy to listen, otherwise this is going up later this week.
>
> See
> <https://lore.kernel.org/linux-riscv/20200708145625.GA438@infradead.org/T/>.

Sorry, for some reason that didn't make my inbox.  I'm taking it instead (with
Anup's review and the stable stuff).  It's on fixes.

Christoph: Some sort of CONFIG_IRQSTACKS seems reasonable, as I'm assuming that
very small systems may want to try and save memory.  That seems like too
invasive of a change for rc6, and given this fixes some concrete issues I think
it's better to just take it for now and do the better version later.

I'll add it to my TODO list, though that's pretty long so if someone else wants
to take a look they're more than welcome to.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
