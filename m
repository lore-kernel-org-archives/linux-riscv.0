Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966CDC433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 14:25:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2ADC22472
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 14:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2ADC22472
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=epigenesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uNvs9a6DA01h0blbhQmWeM1iU9x0zAjXgIw3uviZq1Y=; b=JLLc3hLiAj1lCHqHGMP+Qywgn
	6RBaFpsejIw+CvobTl/459mG+Ypkw5C+tNwFsi9FIm5T+OMvU5wwy5vcqjrAcCqWTupIBB91josKe
	91uweWIovq0FZad5WkfglEOxL62LL+M+ayfZudgREYGHSaGeJMTwKkmxjYQu5SspA7HKI0jYzcq6+
	4sKd21M7oK1PH2MesmvE1+2mmsnfisb692OBosOW7zzmyjBKSRIPlHJID/tScFQOha18RXNr2M7X8
	mSDT8ZI95KH2YJXpMZ5sq1UfKTNVog71No8HrG7CJ4uQ1G6AD49fGhmxtjiZM+OMCMIKN0RRg50YJ
	wlGAc8qrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1VSx-00070a-VD; Mon, 18 Jan 2021 14:25:11 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1VSv-0006zV-94
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 14:25:10 +0000
Received: by mail-ed1-f53.google.com with SMTP id g1so17129814edu.4
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 06:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tXeJJWsCyqK60w5Z6x+WKsWIdxKogluACLg9uk+9u/A=;
 b=E3LjxpvioUKb2yyzZA6dFh1P2ChvGHln+wPv7VyBZFeE0W0SFyWyEEc40Js9dKpmzn
 KSx6/Pmr9BvPgeKskGQgUMtCeC9++7w21HTuYP560CDlvhoUq1PzN3rmRBdpdFY5e8pm
 rPDF3eR/RfCNjpnCf26JFwflWNED2nbAsGkQUs8FQACIRVXCwbVMEDsTt7P7hqflKxnw
 Sg53UWzwy/9kgbeycF4ItHWjYhphonw3XdxrLX8lCFE6hJEwziS8Ltnu1AEtcACr0yeN
 YJLfBLIo5gBMrDBMHhp8pzpAE8dLZ3eG1oatTykYEnNzaGufVtx9q7AOtlUONJowjKyA
 gvLA==
X-Gm-Message-State: AOAM530lAwDINaqoIRDArKr8Iaz6YjeaFHWKfGzyqy5c/ZtC0XyNymfu
 CXBjty1g3X/uji4p6qFahEE=
X-Google-Smtp-Source: ABdhPJyJonQfq4dR5p6Mj5Zgx9vm+yzqSYAxG3mTaVqSAanhZ3cDMtEixcbOExsA8BXA9NDfjUMqMA==
X-Received: by 2002:aa7:dd16:: with SMTP id i22mr1534456edv.215.1610979908177; 
 Mon, 18 Jan 2021 06:25:08 -0800 (PST)
Received: from ingrassia.epigenesys.com ([2.236.81.180])
 by smtp.gmail.com with ESMTPSA id s22sm9293354ejd.106.2021.01.18.06.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 06:25:07 -0800 (PST)
Date: Mon, 18 Jan 2021 15:25:05 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: perf tools build broken for RISCV 32 bit
Message-ID: <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
 <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_092509_358993_BAAE6C95 
X-CRM114-Status: GOOD (  16.79  )
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
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Arnd,

thank you for the quick reply and support.

On Mon, Jan 18, 2021 at 12:56:11PM +0100, Arnd Bergmann wrote:
> On Mon, Jan 18, 2021 at 12:35 PM Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> > |#if __WORDSIZE == 32
> > |/* Workarounds for generic code needing to handle 64-bit time_t.
> > |...
> > |/* Fix sysdeps/nptl/lowlevellock-futex.h.  */
> > |#define __NR_futex              __NR_futex_time64
> >
> > a possible solution to fix the build of perf tool on RISCV 32 bit could
> > be the following patch to file tools/arch/riscv/include/uapi/asm/unistd.h:
> > |+
> > |+#ifndef __NR_futex
> > |+#define __NR_futex __NR_futex_time64
> > |+#endif
> >
> > What do you think about it? Could it be a correct solution?
>
> No, that would be much worse: __NR_futex must only ever point
> to the system call that takes the old timespec argument. If you define
> something like this, it breaks applications that try to do the right thing.
>
>        Arnd

OK, but what should be the right solution for RISCV 32 bit in this case?
Is it a problem in the libc implementation or in RISCV/perf implementation?

Thank you, best regards.

Emiliano

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
