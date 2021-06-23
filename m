Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5014C4743C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 12:46:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B361E6108E
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 12:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B361E6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QCCpfdnWRsPmhVxsYcsYroqrTBctgaLpxFXfUig0hqk=; b=UU4ajinZ9pVmDq
	HBc2NFV0hiDvhiH4y091dv3xdpPVapA7AWG/jcJm+0qimkEUtfg/q2n4EmOV3lNFjJnsNM2GgloOK
	waTvyOsNuSJ+4NSa/hXwP6IERZzBWjTMosrYheDzXT4BRko1ttQWDH1FlOXbf8Kb6a7pZCcIEYuu4
	HuO9FrDcIC2o49w+KNHDysCU8A/L4vzpS8/70ptvXb6+Z+AAecUjMeZ6RLm0yi3nyJAwT8kAk6zst
	SgIBdIXVXzMcli89xgnlnisQqBgi46+RcUFZRXFbni7QGT7/ltyfaJoltyU/Gz7StZi5gYpFm/OCJ
	XEC3Vz9Mb/QRHQLYHPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw2GW-00Af47-UB; Wed, 23 Jun 2021 12:46:00 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw2GU-00Af2j-89
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 12:45:59 +0000
Received: by mail-pg1-x529.google.com with SMTP id t9so1694230pgn.4
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jun 2021 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=6XzMiumB4ycSFXZaaWbXgxSbMB9qisO++ZHH1gQyycU=;
 b=Jz6P4EU9EXNmpLjKYwCZp9M2cd+kZ72FWsG1SwC5ormTx4R3EYJVD9L6rfjDOrlTH7
 4XKjCObQUEpmP6HigR6L61a72M+i28bHpuVm85mRBQ/sYetlCXmjX+kEZk+Nvj2DHLJv
 Du4JvqTe+w9LUlnTtzIUcBYpFEBiVHg5iT1B8PMrDBDGAvny7+dnGz5U5LLHFFWbPI+a
 8/7RbzVFxFLENUZmzYBvhUiDSuQjOS1Bl1MWiU7jFDu6oxB2x+5bcrtvjWqT2Y+ANkTN
 vl9S5ZFAOd4rjOcvfR8LThbWmLCur6me4BD16O8B9nJ4dTrAWFK67RmKKA10/Xk7wSVs
 XT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=6XzMiumB4ycSFXZaaWbXgxSbMB9qisO++ZHH1gQyycU=;
 b=nVxbEJc0a7r/5l84u+RIM5Znf4UQg4ysQypyqBL3dN46/zSSbo0CBfabic+LAX/uxZ
 xQ95H9OY8GjhWb1lCdSF2uUz5KtC2tfMSGMC1Jk1BPoa4xiol2JwWdXgiuCNxS/pg/o3
 hUV8mbm1MLsA8mpFJ3wm6LzHa58HJkmwaArszCgh5rIbqVZeH9S1l6snxlHlzONXSvFV
 fwzha5SO1o0Dnrr8VxgvWJGyI8OX6/d5Jnh61Rll148SuqAmwg+44a+6xPbBgWRR0QOa
 04B+A18I44lwSlCNxun3mFFH07q06E2lTlHszN1DMA9m77tMw86lmYzuQh2mxiRyqYHM
 ilnw==
X-Gm-Message-State: AOAM530iW6RpfpAR1nQp0JZmhyXO/z8pdyZ7MQwyMo4SgxvQXwa0VDVf
 XrYHd/HGcaOcD5Az7ROl5Z8=
X-Google-Smtp-Source: ABdhPJzIJqgPpZPk64KsRvH0sKjyRMzsLaT0sQhf1I1v7XTqCKQ3/5sslagC9RJi5Iu+e/HEVhgbew==
X-Received: by 2002:a63:e309:: with SMTP id f9mr3719049pgh.443.1624452357089; 
 Wed, 23 Jun 2021 05:45:57 -0700 (PDT)
Received: from [192.168.1.153] (163.128.178.217.shared.user.transix.jp.
 [217.178.128.163])
 by smtp.gmail.com with ESMTPSA id j19sm22777753pgm.44.2021.06.23.05.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 05:45:56 -0700 (PDT)
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Subject: [RFC PATCH 0/1] Adding jh7100 SoC to defconfig
Message-ID: <f22f6d7e-97ab-85db-5448-c2bcef0ea0e7@gmail.com>
Date: Wed, 23 Jun 2021 21:45:52 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_054558_361904_451551CE 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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


Would like to have comments for adding jh7100 SoC to defconfig.

To make the upstream friendly, try to add as minimum as possible in
arch/riscv/configs/defconfig required for beaglev-beta against the
upstream defconfig. I might have added too much configs.

Then the distro vendors could use:
make defconfig beablev-fedora.config
or
make defconfig beablev-debian.config

while distro vendors keeping beablev-fedora.config and
beablev-debian.config in their own repositories to make one binary kernel
which boots for all riscv boards.

Probably, it is not good practice to add a different defconfig file under
arch/riscv/configs/ when each new riscv board comes out.

Akira Tsukamoto (1):
  config: Enable jh7100 SoC

 arch/riscv/configs/defconfig | 105 +++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
