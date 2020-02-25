Return-Path: <SRS0=Ue47=4N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59847C4BA04
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2020 22:56:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 293A720838
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2020 22:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uu4NblZq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQ/lLUfP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 293A720838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+h9xKlFLgYhEyczCaUyPJkZiCHIfoFvJ1ayPYu405TU=; b=uu4NblZqoK0Biz5E3EozEZ7V4
	TrVwAVmySIzoEfkjcrBKi/kKQxIf7sqOf9ioer4PMYy2pJMz3y2nnZTsLLcsvFJv7yFTU72kIkCOA
	IyY3vAcQhFLKMqdoqsXpPLU1h5gWXieAw32AVvEG/lTs+Bl0r3GxFhEKjKnVtuhZZyrGtNGVuQvXn
	JGDWw/zzh9p/xOnsYUPnHwXPPCdplM91HxqlVn1m8TwRLRTj/7G9DRxAyUqJkJV4Ubv0wLo5BiPfi
	nMrqFcHDJO9y6sFgPxbxv4ml4o75YZuhVtp5Tt0vYqKFgyKso+U5khyOgOAwjG5tLB03kQcMFniH4
	cnlKgN/pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6j7i-0006LN-92; Tue, 25 Feb 2020 22:56:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6j7f-0006KO-HJ
 for linux-riscv@lists.infradead.org; Tue, 25 Feb 2020 22:56:16 +0000
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E6B422464
 for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2020 22:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582671374;
 bh=+h9xKlFLgYhEyczCaUyPJkZiCHIfoFvJ1ayPYu405TU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FQ/lLUfPE3Y6iEMnJeFYI7O3bSpPJzYSqchqXbsWTptclbvzgEGni5KQIAtG/PLlV
 vpU7Ky6hZB6Ax9AP2F1g0JD8eyKcFm4h0KuGhEIFfDjJFvp782sb8WACyZP8D1iPnj
 wD+4rfre84YvKkNZ7h03gKiw8EQo3ha5dR+C+39s=
Received: by mail-lj1-f174.google.com with SMTP id d10so729257ljl.9
 for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2020 14:56:13 -0800 (PST)
X-Gm-Message-State: APjAAAV42e7YUyr/iPYCEHfFJhl79niRdswWY5EFz98L1Bwe3tL8ClOz
 EqrXdq4HcwhO9qB9EEtCr2BmVxInccUFC+Las0c=
X-Google-Smtp-Source: ADFU+vsNg2JOfLZxB3JnW3N6Gl76jJs9brnWPKuHNnRE6Lk4pMu5bmfrIitEcDFMK4trkYMgSF9pO9E3s4LLjQ3uOxA=
X-Received: by 2002:a2e:b017:: with SMTP id y23mr759482ljk.229.1582671371753; 
 Tue, 25 Feb 2020 14:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20200220041608.30289-1-lukenels@cs.washington.edu>
 <CAPhsuW6c9g9QRKZWVLXZN27SKOxMBM2tPV3F+QM5sb6mtvseow@mail.gmail.com>
 <CADasFoBoEs+UArgqwQSqesKJhmvZEJP5so9nN-u9s6a3rQEUdA@mail.gmail.com>
In-Reply-To: <CADasFoBoEs+UArgqwQSqesKJhmvZEJP5so9nN-u9s6a3rQEUdA@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Tue, 25 Feb 2020 14:56:00 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5mdL6CHSCqqwQnm3V4URONoaamPCGUD9zHSz84h3X2GA@mail.gmail.com>
Message-ID: <CAPhsuW5mdL6CHSCqqwQnm3V4URONoaamPCGUD9zHSz84h3X2GA@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next] RV32G eBPF JIT
To: Luke Nelson <lukenels@cs.washington.edu>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_145615_593890_5161A6AD 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Borkmann <daniel@iogearbox.net>, Jiong Wang <jiong.wang@netronome.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-riscv@lists.infradead.org, open list <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Networking <netdev@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Xi Wang <xi.wang@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 25, 2020 at 10:37 AM Luke Nelson <lukenels@cs.washington.edu> wrote:
>
>
> > I found a lot of common code between RV32G and RV64G. Can we move
> > these code into a header file?
>
> Certainly! I was planning on doing this in a separate patch to minimize the changes
> to the RV64 JIT. I can also do it in another revision of this patch if that seems like a better idea.

I would recommend expand this patch into two patches: one patch moves
common code
to a header, the other adds logic for RV32G.

Thanks,
Song

