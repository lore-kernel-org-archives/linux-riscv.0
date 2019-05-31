Return-Path: <SRS0=cwjh=T7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2ECC28CC3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 May 2019 07:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 667FE26501
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 May 2019 07:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lkdxG031";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=netronome-com.20150623.gappssmtp.com header.i=@netronome-com.20150623.gappssmtp.com header.b="eeJoMp9B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 667FE26501
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ghT/u1UnxEFO3UpOQH0YgTADio27iVsx0atgRlt1GxM=; b=lkdxG031o46KyyVnbU9X4JkDOC
	udkN0Jw0qGvhKCUCZXwpsQVV8wZV++0+pde7WktnIVXwL7eAWHJ934IcZO4oJ9b2SoMubyzX7u8Vy
	UJCz8QMJyxGTufbHBAA57PjzYWRi8s8AT1DRDy+Xz/e5S4is7lupWaZPF/txB4pVmEBntH8iZI5ei
	5Vm5/+HDtm3CzEr/Jkh/0AAght1pTqc15t8GLeVBVeR5odGL7PzRcYyv/VEZyfj87Rg91Bxqy69jO
	HVEIg8AWd6/jU6/+6cg0cnIe8ITtSuLcn2fcrIX3oZtNM4L4L+UyuehZQlUafzIGHxJdAnK/ke9kP
	/oWH6OWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWbsO-0003oU-6Q; Fri, 31 May 2019 07:22:56 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWbsK-0003o1-Mt
 for linux-riscv@lists.infradead.org; Fri, 31 May 2019 07:22:54 +0000
Received: by mail-wm1-x341.google.com with SMTP id v19so7052094wmh.0
 for <linux-riscv@lists.infradead.org>; Fri, 31 May 2019 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=FU04xAR/6h4GqcGgE+2NWUuxq5FrKtSed1UqhDep54o=;
 b=eeJoMp9B+3CUiDjzCQewpNM5ilfXaCzT/ghPtaG5Ck6HrGBJV9s9ZczKJw/NtzJPdO
 7S1gIefCcFM4pZPgMB6f82Tvc/mF1tKoe5uQI+OZ2UETFek+Gk7KiNEDbh6cfSdUQ0v4
 guUzuTpUsUHhBs5iSjQavC6RwG/JxRX/5+dsSAv7VZQlWWA+ubIca8ZlwbGGNrG3NSUM
 8nSWcOhABep4I6s0gPveUTmp1yYvLflDZ84droGjHq/a5gLcZ5GEMaVjlg0MLAjNEEaq
 dCtVG0GgEnJzOKR3BFm1g40CdC6X6JcTwxV4+1PcUU7k+IbpYFBDTw8Tni4aVoIczFgc
 AzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=FU04xAR/6h4GqcGgE+2NWUuxq5FrKtSed1UqhDep54o=;
 b=gMDOCykoACcmr3mI+RuscyGcqDGWiL14rF9Pqq3ab8qh/BXTLof4odwCWU8n9IoPhm
 QESmbL0Ujbw2HGwCJ2U3FPKAdBqQciv9Oh0GDOeOrGpZvH/BTrw5Ho+dFILJyTjVrB6J
 OUIbHar0WXXQhW/5VaY//fw8rpXuIIlx9EOlAvgK9QuqHkP6U6XD9zy7b7WsnwYbWWcx
 Z76/etT/S6Re2yLqS7c4UtipyljwG6sUoeiA936N/y2qMhG6bKtTN595WdEWGWNkxiPK
 0qmASQwWxzuVwhorgasqrjs0yS1qW3a8WdSNByGwrXw6iansMJdbDTtd9S8SwwCOiBxL
 p2OQ==
X-Gm-Message-State: APjAAAVqw2rT553P4K7IEE7hIIG6xuDWG2VHmZQDloxHKX0CbDTVwLRr
 p19wf8EWsFH3zNelrJCzRGRcjA==
X-Google-Smtp-Source: APXvYqxPIRDWAk2ZHGMiEu7JvqNMZ/P1bKU8W5EPs76o972GvPxxd8Idq7dd+N0zwckXYzWuOdy59Q==
X-Received: by 2002:a1c:2358:: with SMTP id j85mr4678026wmj.46.1559287371059; 
 Fri, 31 May 2019 00:22:51 -0700 (PDT)
Received: from LAPTOP-V3S7NLPL (cpc1-cmbg19-2-0-cust104.5-4.cable.virginm.net.
 [82.27.180.105])
 by smtp.gmail.com with ESMTPSA id z65sm7566691wme.37.2019.05.31.00.22.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 May 2019 00:22:50 -0700 (PDT)
References: <20190530190800.7633-1-luke.r.nels@gmail.com>
 <CAPhsuW4kMBSjpATqHrEhTmuqje=XZNGOrMyNur8f6K0RNQP=yw@mail.gmail.com>
 <CAB-e3NSidgz8gLRTL796A0DyRVePPjVDpSC6=gSA4hH8q6VqvQ@mail.gmail.com>
 <CAPhsuW7rOzyJTac7d9PPHeWW39Hu5pV6Mk0xJr8jyr0HH=-W2A@mail.gmail.com>
User-agent: mu4e 0.9.18; emacs 25.2.2
From: Jiong Wang <jiong.wang@netronome.com>
To: Luke Nelson <luke.r.nels@gmail.com>, Song Liu <liu.song.a23@gmail.com>
Subject: Re: [PATCH 1/2] bpf, riscv: fix bugs in JIT for 32-bit ALU operations
In-reply-to: <CAPhsuW7rOzyJTac7d9PPHeWW39Hu5pV6Mk0xJr8jyr0HH=-W2A@mail.gmail.com>
Date: Fri, 31 May 2019 08:22:45 +0100
Message-ID: <87d0jzgkai.fsf@netronome.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190531_002252_798664_99E90F1A 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>, linux-riscv@lists.infradead.org,
 Martin KaFai Lau <kafai@fb.com>, Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


Song Liu writes:

> On Thu, May 30, 2019 at 3:34 PM Luke Nelson <luke.r.nels@gmail.com> wrote:
>>
>> On Thu, May 30, 2019 at 1:53 PM Song Liu <liu.song.a23@gmail.com> wrote:
>> >
>> > This is a little messy. How about we introduce some helper function
>> > like:
>> >
>> > /* please find a better name... */
>> > emit_32_or_64(bool is64, const u32 insn_32, const u32 inst_64, struct
>> > rv_jit_context *ctx)
>> > {
>> >        if (is64)
>> >             emit(insn_64, ctx);
>> >        else {
>> >             emit(insn_32, ctx);
>> >            rd = xxxx;
>> >            emit_zext_32(rd, ctx);
>> >        }
>> > }
>>
>> This same check is used throughout the file, maybe clean it up in a
>> separate patch?

We also need to enable the recent 32-bit opt (on bpf-next) on these missing
insns, like what has been done at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=66d0d5a854a6625974e7de4b874e7934988b0ef8

Perhaps the best way is to wait this patch merged back to bpf-next, then we
do two patches, the first one to enable the opt, the second one then do the
re-factor. I guess this could avoid some code conflict.

Regards,
Jiong

>
> Yes, let's do follow up patch.
>
> Thanks,
> Song


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
