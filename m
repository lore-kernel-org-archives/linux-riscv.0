Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E897CC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:20:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7C620792
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kRIhbzYc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="mImzrEAl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC7C620792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=QnnWBz/r/bboJdKPV3bzddSuHChkO4Nmn+Sj5eVsk4Y=; b=kRIhbzYcTXwufdqYaDniVmhB7
	HW4EPOTIVWZiscq87U8lfARDAhlU1yigKwaykkNHX+FY0zkT4ovRmpjaeW2OI6E3ycrYwyw5VF81j
	bItXxEhsRbOAJluk11UCymLLY3a/Tk0MXopaaduq5aM89JIExMbB0ukJoVUkhxlXDbDGqN/ovdFXA
	ljWnYa22YUo/kte6lEzL+R00e+54ongVLEO4bqV5qKNAbrwiy7AVfhyf+NPZk++5dRbIeceuBeeUu
	lDaVNgtcHGBlLicXCJRMwdswb9YIODGiBvcJK3r8LsSylS0Zvh7X9X3s9m+3PeUJ6ozgb6y3CDZuN
	Kok4B2/ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k392J-0001dk-Em; Wed, 05 Aug 2020 02:20:11 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k392G-0001dB-KA
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 02:20:09 +0000
Received: by mail-pl1-x644.google.com with SMTP id d1so24408249plr.8
 for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2020 19:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=01MxYpKFXDZaXCcX+RooTiv/T8V3zULRixPU7jN/r44=;
 b=mImzrEAl0d6G/+6l8JJFXutcAF+pXD6CTUNLi9RPwj9e2tKa9TUK80JAu1WHnV5yBW
 RuwBsp8YYqdgi2IEqeS+lCkvkEe4YlVfelQe9AOa/Czl8Cu3vYTzrmPB0fJZGQ4O33eA
 P1q6ixfFAlVA1xzkpocndvzWTSh2e1J+VqbGA/R84QHadggRQ1PugQqLyiNx5n92DPqp
 jqhgnuYwFWk+smjVTIS5/9YaU6v1p3Ub7hCuBQZL6xuxJV6oCbOjx+eFKe0c4AW8vozQ
 CrP4ymyoAYHrzo0s1skjUfgRL26M+Z6JuSLN9+gcCGaHZIOCYjoE3QG62oHl0blm55b3
 hkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=01MxYpKFXDZaXCcX+RooTiv/T8V3zULRixPU7jN/r44=;
 b=dy5XPiQjeYpAE2fkKuaSGhQbgzIZOxASgmzyRtkWrw5LlXnyn62rih9F9lLIYCK/Wy
 EGV4AHs8BnINjJev5RDIJsb6vZImt8zHXFTNWoRYjPSqb6YP10W2j4XqzzLkMfEuCjhD
 uhamHPpQxnSdABNPnwqGqyUupxbcJjCGqNmqodcWs0pfQrKka3jX2QHs35ixGMPMOyqE
 0JH5k/3mIiV4viuVUCA0lo94AUk4IZwfg2q6CHdMXj93GEHq2zdOt/CWTs7dEZjZj6iv
 xg8uSW6CSbQ+pUVXdP4DsWZjsR5mYHlbxjbL3sLo8NpvgnQcIipyCnDVYCaZgFpH6VAa
 kWGQ==
X-Gm-Message-State: AOAM531pkoHDRMOvazUMJYgOEFW6FealNfaBtpAVGsProfw4g6BYM5dB
 LtRP1yehSD3ksmdOlaSEvq9wag==
X-Google-Smtp-Source: ABdhPJyEtXmvM6xJHC6ANpTYfrSoC3v9n1iu0e+qTUYSwlXsTq02/bh0EUkORzHX/tsNdyc24vBIXg==
X-Received: by 2002:a17:902:a40f:: with SMTP id
 p15mr1012253plq.221.1596594006023; 
 Tue, 04 Aug 2020 19:20:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d17sm582843pjr.40.2020.08.04.19.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 19:20:05 -0700 (PDT)
Date: Tue, 04 Aug 2020 19:20:05 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Aug 2020 19:20:03 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: ptrace: Use the correct API for `fcsr' access
In-Reply-To: <20200805020745.GL1236603@ZenIV.linux.org.uk>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: viro@zeniv.linux.org.uk
Message-ID: <mhng-cd1ff2e9-7d34-4d56-8d79-b2d02a239290@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_222008_825597_D8527281 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, macro@wdc.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Aug 2020 19:07:45 PDT (-0700), viro@zeniv.linux.org.uk wrote:
> On Tue, Aug 04, 2020 at 07:01:01PM -0700, Palmer Dabbelt wrote:
>
>> > We currently have @start_pos fixed at 0 across all calls, which works as
>> > a result of the implementation, in particular because we have no padding
>> > between the FP general registers and the FP control and status register,
>> > but appears not to have been the intent of the API and is not what other
>> > ports do, requiring one to study the copy handlers to understand what is
>> > going on here.
>
> start_pos *is* fixed at 0 and it's going to go away, along with the
> sodding user_regset_copyout() very shortly.  ->get() is simply a bad API.
> See vfs.git#work.regset for replacement.  And ->put() is also going to be
> taken out and shot (next cycle, most likely).

I'm not sure I understand what you're saying, but given that branch replaces
all of this I guess it's best to just do nothing on our end here?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
