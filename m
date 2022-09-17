Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D080C54EE9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 10:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0xTWN5eLOcF+LaGs2DJz6oS2qMgxaM1fjm9McVHFmU=; b=qzOHV/aa6Nlwu6
	xX+6MkyIBHN8y0povXCm0ZuWt6qpgsDpeaglOA3DpUjVjlXSXGHzyppNckkrNttewEi1vwhaYxIGF
	JHg7oKykyra4cZzTnuq9BOWitdH3ER+2Fteqyl9FRSBrmspDfRPWGlOabgPDwXhkeLkL7JAYog3sL
	Y3ulKQVCjMQMGay2tme2PK5eThbTUNU+8X/mIMUkLEfYOr/4sy6yiTJhfciZROdkJis6aCzoG1LCG
	oatmpZh+VNiGjGQ1aawq8AZrRuzgbyVCMLmMSiAhuRBZ6wagiJq3RB3hkgq6I86ZBbHFDYxw3KXbt
	/aGmZZt2kTdeFf4+qRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZVXh-005KJE-6t; Sat, 17 Sep 2022 10:59:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZVXW-005KFP-BB; Sat, 17 Sep 2022 10:59:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 004F7B80D35;
	Sat, 17 Sep 2022 10:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655C9C43144;
	Sat, 17 Sep 2022 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663412350;
	bh=4YhfXXVITaxyZ7ickgJk1+TK+jaPswSVW817YmzQetg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mlHCnKP0WB2uWbChrk4q6RL0Qx2r/gHQDC9oSJpxW2EbflDButPVeikbnLPDqRuAa
	 uMBNIAxUK9YP6cJ8t088PZToAtuG+fNjSjR1cCN+UFjy1NSR4Fe+vii3eIQ++5/J2t
	 G32gzhZbqibD7HIndba0d3nwaO6DhkgEj8JWwI484H7lSPNjcKiuf+lKgZzp145UKc
	 /rWyFp393Jz382lw1mp0vKr2MFARtOSXzRJp2N2/VdtnThMFXTJB+055ZPSba5Qla3
	 eNal325u2+WTwCZYezJX9gJTu2HlqZJ1v6xPyr5h7svm/gR+KopGdwkenk6Ht9hg4Y
	 p3TMKbSRfTsXg==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1279948d93dso55519465fac.10;
        Sat, 17 Sep 2022 03:59:10 -0700 (PDT)
X-Gm-Message-State: ACgBeo2+E6sNbZYScfyvqhRp3UnY+fFbfmb2t8IhVWcMpaHAqQumMkjx
	qZKlVmk6oY6zf0b5umvEWvlHmKGIq2PEcGnHh6s=
X-Google-Smtp-Source: AA6agR4sClFlGuDsJqtKaYj0hkDas61Hr4pLmOYJ+LWicDByGyz5Jc5/SoMTyBglnH1gA6Au8ZBBCEB98KwdYTTgtGU=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr10590424oao.112.1663412349408; Sat, 17
 Sep 2022 03:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220917015522.44583-1-zouyipeng@huawei.com>
In-Reply-To: <20220917015522.44583-1-zouyipeng@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 17 Sep 2022 18:58:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRDspQZUZk=KAC_P+YCr=86o4EgOGAVGcB1kdgsymhyVQ@mail.gmail.com>
Message-ID: <CAJF2gTRDspQZUZk=KAC_P+YCr=86o4EgOGAVGcB1kdgsymhyVQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] make weak attributes in {k,u}probes
To: Yipeng Zou <zouyipeng@huawei.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-s390@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@linux.ibm.com, 
	dave.hansen@linux.intel.com, hpa@zytor.com, naveen.n.rao@linux.ibm.com, 
	anil.s.keshavamurthy@intel.com, mhiramat@kernel.org, namit@vmware.com, 
	catalin.marinas@arm.com, peterz@infradead.org, mark.rutland@arm.com, 
	liaochang1@huawei.com, chris.zjh@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_035914_540430_EBA018F8 
X-CRM114-Status: GOOD (  12.08  )
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

It's a riskless cleanup.

Acked-by: Guo Ren <guoren@kernel.org>

On Sat, Sep 17, 2022 at 9:59 AM Yipeng Zou <zouyipeng@huawei.com> wrote:
>
> We have some function implementation under some arch does nothing.
> We can mark it with weak attributes to improve.
> 1. arch_init_kprobes in kprobes
> 2. arch_uprobe_exception_notify in uprobes
>
> Yipeng Zou (2):
>   kprobes: make arch_init_kprobes as weak
>   uprobes: make arch_uprobe_exception_notify as weak
>
>  arch/arm/probes/uprobes/core.c     | 6 ------
>  arch/arm64/kernel/probes/uprobes.c | 6 ------
>  arch/csky/kernel/probes/kprobes.c  | 5 -----
>  arch/csky/kernel/probes/uprobes.c  | 6 ------
>  arch/riscv/kernel/probes/kprobes.c | 5 -----
>  arch/riscv/kernel/probes/uprobes.c | 6 ------
>  arch/s390/kernel/kprobes.c         | 5 -----
>  arch/x86/kernel/kprobes/core.c     | 5 -----
>  kernel/events/uprobes.c            | 6 ++++++
>  kernel/kprobes.c                   | 5 +++++
>  10 files changed, 11 insertions(+), 44 deletions(-)
>
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
