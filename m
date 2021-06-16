Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59237C48BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 09:12:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 280C761055
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 09:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 280C761055
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+sNTB8IHnRSKZ91Ut74jROvbBGxbJ5IFJGa4LPjwb0=; b=QUFZLK1rN+Kvcc
	MhT1RTge5LFkr3RO3X5QxE+wsOrHzoBOZ4IIh+apr6fxSPvwwK924hYtvBoyx3bOZgiuRk7PEEMf/
	g6Krkjpa8pI5S2EcdY5sjkOeazexDUpxMSpAnb2poCorsbOrl/1OZpLOEPMGbDqAVG+p3wTsA1g0s
	kb1lFhWZOBFPepIFVkYaysenNWmY5/hFXWVevfY1dGBSEVFDwp/SbzVFtiuf0CJ9MhqqBIT/JtW6o
	XhPmF8vTB/X14D4Py5qLe75LkrxKM6SCHTStQ5YkWDCHaCypyulsoQ/3s/P6+ASRTYHlrBdWfzsWJ
	dWyRLu7NhByhM4+RmAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltRaw-005Wl2-TF; Wed, 16 Jun 2021 09:12:22 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltRaj-005WfK-5g
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 09:12:10 +0000
Received: by mail-oo1-xc36.google.com with SMTP id
 128-20020a4a11860000b029024b19a4d98eso169362ooc.5
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zwXeE/T9A/OrTylBMfS7m9SAT845lCEQygKVQTKDO1g=;
 b=RElzJ2hc7LrZCUP88cqmIT5SmDkbzIOCj/FtUDQinBJda4kLAvYUFxtOc+bR7clliV
 WlIsUs4vcuoeAie5wl4aqs1VbotnGDvk9niC8fflUf7H0yyqbQ4FoGFYl+eQaYf/Jm5N
 GHcbH10qGL5iabgOzIJ0o2h9Cuk4+h0Lh3oeHoFxJuv8oSUIbBmljuMxXvYveUmhwFFS
 fq8stEa4IlssAoQmWl7xNloVppaAYhFGZBiKAbNPL8yD+rQ8XcH3ZKJYJDO5FOBJ0Pa0
 JE11w1jFJQU9bnJ9cvleB79kkB5wexOBGyTGOIk4XLihR690/YFYPnJn9n9CK1OSItGz
 KOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zwXeE/T9A/OrTylBMfS7m9SAT845lCEQygKVQTKDO1g=;
 b=JeQr5OAPcXA7dN0I4aX8mZXKtMHOokPKJu0s5l3KJd3XLihskodV5UdAmM2Ar9FQPY
 Luwdu+J/rZRVD94Ns98Ra+zMDapws6ZhTYJ66v270a4q655jf2UZNjFuDYOfNkIRyodU
 CKJiHJ/kHeU6PcyeeztRfXHPF0TV0kCJ1si0/v9PV5LqaduQViKKEE7kCOelNWxP7Fud
 HeLJi1O5b9qrnI6Fosf268gTQGNyNjzfXgRTd5VK7o7wQ1csLawqv2n8FVYgzPOFLnHZ
 F6pe549uUgxn8N5W+UcYBvmJ9sikjmABTKNvpVoRP9dMp0x6ZHQD+xf/AK9YRyqsbLd0
 qX6g==
X-Gm-Message-State: AOAM533TKz0Ip858Nlf85bb5LcjZrDwM/3zIxdjT4KVF9X77h0pCmtjN
 wsBCP0Pn+Mjo2h9FSz/4VUvGWm+89EzS8+JC/K0KVw==
X-Google-Smtp-Source: ABdhPJwqsOZips+plZIgDSkdTPzgqj+93in/a1mqiJLmW6JftBHWGo3F8b2WvrzrNofwz/qjWGg4WsBG0IpZtFr3ICQ=
X-Received: by 2002:a4a:6049:: with SMTP id t9mr3118549oof.14.1623834725852;
 Wed, 16 Jun 2021 02:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210615030734.2465923-1-liushixin2@huawei.com>
In-Reply-To: <20210615030734.2465923-1-liushixin2@huawei.com>
From: Marco Elver <elver@google.com>
Date: Wed, 16 Jun 2021 11:11:53 +0200
Message-ID: <CANpmjNMh9ef30N6LfTrKaAVFR5iKPt_pkKr9p4Ly=-BD7GbTQQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] riscv: Enable KFENCE for riscv64
To: Liu Shixin <liushixin2@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-riscv@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_021209_308581_35A8B09D 
X-CRM114-Status: GOOD (  10.57  )
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

On Tue, 15 Jun 2021 at 04:35, Liu Shixin <liushixin2@huawei.com> wrote:
> Add architecture specific implementation details for KFENCE and enable
> KFENCE for the riscv64 architecture. In particular, this implements the
> required interface in <asm/kfence.h>.
>
> KFENCE requires that attributes for pages from its memory pool can
> individually be set. Therefore, force the kfence pool to be mapped at
> page granularity.
>
> Testing this patch using the testcases in kfence_test.c and all passed.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> Acked-by: Marco Elver <elver@google.com>
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

I can't see this in -next yet. It would be nice if riscv64 could get
KFENCE support.

Thanks,
-- Marco

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
