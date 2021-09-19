Return-Path: <SRS0=UXoG=OJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC3CC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Sep 2021 22:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C47D60F5B
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Sep 2021 22:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C47D60F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A39r+GSZLaNacCOHDqXoEbPVsWdIAjPRYpNrm00T/v4=; b=pqJjHHFTwmnG7B
	x26KNXo5X7TokvWbWpSIPl82Lc9CXi2Pl2hNo5J9r3hQIfy2rx31AXVb12fkubP+HKjJ4aYllbm8p
	+zWVgJ6EdWpddoTfRC57gzDqPbTIRm+2vE8j/fs/cLzuapyuEKCK40oicaUBM7ke0u9MkhewnFMRn
	E3tp8PP8zf0co61CJS9lEwXHWFGEqdPQeNekiSEc94r+gysYRNKKrohSXD7lMQiSw2b+g4pDObjxn
	FcUOviPBK7Q/YnndHqe0P5EItrE4uZXfJGiP0tb8yMLhgRUkX/XHH3LVZ6U7t41Yt3DeDG7b0UFM5
	w2FTEdfQTSPygVgMX0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS4sQ-000I8N-Su; Sun, 19 Sep 2021 22:01:34 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS4sM-000I7l-TH
 for linux-riscv@lists.infradead.org; Sun, 19 Sep 2021 22:01:32 +0000
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1DF0C20B6C55
 for <linux-riscv@lists.infradead.org>; Sun, 19 Sep 2021 15:01:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1DF0C20B6C55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1632088889;
 bh=xYWIsntM1FgbDegCQy3unFGC9gPydIe+qrJh0Z0Vtc4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TdAxIFP5QfRLlJBI4QFgRkgDe+6pmn4sD7ppVh2lsIAiDdZPpVel4ZDBcIH6ql6OB
 xlkvtkDYOs0VnYCcs8aq0wtGUW5zpkl8Xu4KJPdkcDvauCt+0dQUQneKW3qmCUlvxa
 UB/t4ASQqrwK/1h5/NdUPpMEQTDDiIMIjXquRWAA=
Received: by mail-pj1-f53.google.com with SMTP id
 f3-20020a17090a638300b00199097ddf1aso13842323pjj.0
 for <linux-riscv@lists.infradead.org>; Sun, 19 Sep 2021 15:01:29 -0700 (PDT)
X-Gm-Message-State: AOAM533Ck/LIYZq1SsdlX7VcVD6Z9/nOwApQJRuKAIdrENJF6pAQXAiI
 Nn7xb56ERJ4pOaxtR50OJeFfLI1hgFCjXaeDpEY=
X-Google-Smtp-Source: ABdhPJxAHHGLWy2uUvoOGz80IPccXw+Xczr2/1TCm0MbT3xDF9E6xQ7DemEpQaObkix7rBXkffoeXugGB0CHi3exzQo=
X-Received: by 2002:a17:90b:254:: with SMTP id
 fz20mr34711278pjb.20.1632088888584; 
 Sun, 19 Sep 2021 15:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210919192104.98592-1-mcroce@linux.microsoft.com>
In-Reply-To: <20210919192104.98592-1-mcroce@linux.microsoft.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Mon, 20 Sep 2021 00:00:52 +0200
X-Gmail-Original-Message-ID: <CAFnufp2CvmwRMotzkoq-ZKCMCh6vCmRFR19aQ3JwHECZznVN6A@mail.gmail.com>
Message-ID: <CAFnufp2CvmwRMotzkoq-ZKCMCh6vCmRFR19aQ3JwHECZznVN6A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] riscv: optimized mem* functions
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, 
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>, 
 Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_150131_074931_E2E5DBC7 
X-CRM114-Status: GOOD (  12.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Sep 19, 2021 at 9:21 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> From: Matteo Croce <mcroce@microsoft.com>
>
> Replace the assembly mem{cpy,move,set} with C equivalent.
>
> Try to access RAM with the largest bit width possible, but without
> doing unaligned accesses.
>
> A further improvement could be to use multiple read and writes as the
> assembly version was trying to do.
>
> Tested on a BeagleV Starlight with a SiFive U74 core, where the
> improvement is noticeable.
>
> v3 -> v4:
> - incorporate changes from proposed generic version:
>   https://lore.kernel.org/lkml/20210617152754.17960-1-mcroce@linux.microsoft.com/
>

Sorry, the correct link is:

https://lore.kernel.org/lkml/20210702123153.14093-1-mcroce@linux.microsoft.com/

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
