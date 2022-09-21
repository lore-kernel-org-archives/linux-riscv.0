Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E665DC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 05:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G+U3BT/N4zNvirrHlSyiJiF1ZyWokRJNbHbKBEjz+/Y=; b=KqyNEEpOLCrnJRpyr1iL11NBoB
	nbK3MuPPB4HYB/ikMpjC4DJU1MGGVcDDGaIa9c7jWSqHV0UbCrIO8QPHGa06DBTmZLBtqQ858y2qV
	AQiF7y2L27j7t5moQMm4kk9dZNCNYLqV4YsruUrtzF+4lrU1TtsJQvCMpNM6A6utVj76xxVhMgjEW
	hZFMIrtrCLhowDQzH+Xm7eSXKG5VVcyh2H02qhzQR2z8mIYCSfb87saR/dOEkEIWj3rrwEuOBZwib
	Mq34i+tjoHprJ6sVxrmuCInNotAV5Zhnlsa0mKX7+E+YIno7QPuU7LJZlWMYsGCPaglu9+YdEPBTI
	EYtbTkrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oarzA-008z9i-8g; Wed, 21 Sep 2022 05:09:24 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oarz7-008z7m-98
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 05:09:22 +0000
Received: by mail-lj1-x235.google.com with SMTP id a14so5569322ljj.8
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 22:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=TgTQReumepLDe4ov6CDHPrQQsIPWNDax0l8u9Rzrs0M=;
        b=FNR4DfsImI34Tdj1kbATrXg+qWoJ2JGx2IvHCZwimcpkwPVtI+exf/w3P+sQiU4kRY
         5x+aqYP5WCJlBUKUJzLq2GNaC0ZMWcL3rjTlBFT51m//vs15UHg8EhIKgKrr3WhLktZh
         sQf8VKiiQFN+KuZ+UW5fL1h8m5SO42WnXuwM3K0e3JfVqjI5qLaY6gik5p9xs4cEK4cK
         iFjnSkomxmOc4LiOSnKurQLLW+wRjyF5jZd+bPCZ/XTsuaey+bEqWnCBdpTFb+asFN9r
         txZGautSqkGqoejgYOYGPhIo/pUbGwFIJboHg4uoi8u7wEYxOAiAb18FN6nGX0S+abzm
         vDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TgTQReumepLDe4ov6CDHPrQQsIPWNDax0l8u9Rzrs0M=;
        b=NhIVqWdK+G8G4rpfRM1dYas6jMcRpjDIP1lpH7yAvyn9LkNbX/Ml40H70JBmxn1Fs6
         +3APHJ6cmcRi/3/NztZvU9Q+oHHIvkHzI8pCVoOl1yeI/fRETr2wVbbfAP2flPst9bGw
         cBRG0eKF42ynldfBxG6Rnc8CRjCrcM29yCgNE7sv2/TxfjH0nhtaGMUe/5Kpst1qe6Wl
         wJdahp+DuTFd6hyf6jD0jx+Js9AHaA/+ysm8cJYFe2VF77zUp1rwPkPlkWySswBX55mv
         h77jvsB3weEi7L4zQvoXjh5abN0rZDnN1rg83YJyyiK/LTIG/HncIRHXBJ3j1DWcR/9k
         020Q==
X-Gm-Message-State: ACrzQf3CPPFgiJbRaIlsRMXXQs/kkV1dM8AIBtYR8zGw1khsgApf5uAN
	DHT7o31mxVJs7UBs4dpujzVDDdCvmg4dgtSi3z4FJg==
X-Google-Smtp-Source: AMsMyM47NWYvjKJ/EBMRKSFdl0fTC0zOjyszTcSGJVSYFzud/66lHqmfYE77sEvbGyG3ANNIXiYNTN89bIxFqKpBLk0=
X-Received: by 2002:a05:651c:1611:b0:261:e11c:c2ef with SMTP id
 f17-20020a05651c161100b00261e11cc2efmr7794318ljq.340.1663736955640; Tue, 20
 Sep 2022 22:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220913061817.22564-1-zong.li@sifive.com>
In-Reply-To: <20220913061817.22564-1-zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 21 Sep 2022 13:09:04 +0800
Message-ID: <CANXhq0qG-aEEHxWbtRgC+RO-wC36MtPUfu+eMpX89wOtqGJL0w@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Use composable cache instead of L2 cache
To: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Greentime Hu <greentime.hu@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Dooks <ben.dooks@sifive.com>, bp@alien8.de, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-edac@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_220921_376803_4647DCF0 
X-CRM114-Status: GOOD (  23.95  )
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

On Tue, Sep 13, 2022 at 2:18 PM Zong Li <zong.li@sifive.com> wrote:
>
> Since composable cache may be L3 cache if private L2 cache exists, we
> should use its original name "composable cache" to prevent confusion.
>
> This patchset contains the modification which is related to ccache, such
> as DT binding and EDAC driver.
>
> The DT binding is based on top of Conor's patch, it has got ready for
> merging, and it looks that it would be taken into the next few 6.0-rc
> version. If there is any change, the next version of this series will be
> posted as well.
> https://lore.kernel.org/linux-riscv/20220825180417.1259360-2-mail@conchuod.ie/
>
> Change log in v5:
>  - Add a patch to modify aux vector for sysconf
>
> Change log in v4:
>  - Change the return value from from ENODEV to ENOENT
>  - Apply pr_fmt refinement to all pr_err
>
> Change log in v3:
>  - Merged the EDAC patch into L2 rename patch
>  - Define the macro for register shift and refine the relative code
>  - Fix some indent issues
>
> Change log in v2:
>  - Separate the rename and diff to different patches
>  - Rebase the dt-bindings based on Conor's modification
>  - Include the patches of Ben for refinement of printing message
>
> Ben Dooks (2):
>   soc: sifive: ccache: reduce printing on init
>   soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes
>
> Greentime Hu (2):
>   soc: sifive: ccache: Rename SiFive L2 cache to Composable cache.
>   riscv: Add cache information in AUX vector
>
> Zong Li (3):
>   dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
>   soc: sifive: ccache: determine the cache level from dts
>   soc: sifive: ccache: define the macro for the register shifts
>
>  ...five-l2-cache.yaml => sifive,ccache0.yaml} |  28 ++-
>  arch/riscv/include/asm/elf.h                  |   4 +
>  arch/riscv/include/uapi/asm/auxvec.h          |   4 +-
>  drivers/edac/Kconfig                          |   2 +-
>  drivers/edac/sifive_edac.c                    |  12 +-
>  drivers/soc/sifive/Kconfig                    |   6 +-
>  drivers/soc/sifive/Makefile                   |   2 +-
>  .../{sifive_l2_cache.c => sifive_ccache.c}    | 200 ++++++++++--------
>  .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
>  9 files changed, 158 insertions(+), 116 deletions(-)
>  rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
>  rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (31%)
>  rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)
>
> --
> 2.17.1
>

Hi Palmer,
I was wondering if this series looks good to you, and could you please
help us to take it into riscv-tree?
Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
