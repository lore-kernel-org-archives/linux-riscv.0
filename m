Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2A0ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 08:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72dytJ05CmsFvTUZ42+3VwoPvmZhwiWs0tjQOPO7pqg=; b=3QyJk+PAKxkZhW+y7qi1KIfTe9
	zPwSGa04lQ5mEabQ4r8Vcvlwu10z10VBkxPJ0exADWu6skD+Mg5BaJMOxoq+WHXw28jfSy92ZqAQZ
	NCK9HGObgXjeFGgQMZtiYCesJ9VDm8P0sVlgaaUAhioCIg9+Ay3UuXEkxngPdRXZ00ORtBc/s4fPS
	Fsop9heWLU70n069PH3S75s4/hsunEZs8qgQd6qE8ImhXIK2R8vnCGbzXcWGjtc3WLZYql35qfYcx
	67j6vl/Hdvy7mgIRsf9x8CN1fbJ9G7o4jH3225klxpUS3BcBUGXTfeNuRcRbBBNHpcIIRx/E5kbbe
	cFJLGmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwB3-00F09K-0w; Tue, 30 Aug 2022 08:00:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwA2-00Ezcb-B8
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 07:59:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id bs25so13075497wrb.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 00:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=PfTHcNNyHIJD+nGjOH2sD5OMJ9tlsi2wR693y33YW1M=;
        b=AL1GR7DB8kFqACkXykURW0f4VRsZOJ0CwBb6F4d0wHJYAKDeJNc4fKpViJM2j1VNqL
         heOeufIjj7dspTgrPxOLLX5ZSxk6BnLuYBWkwEMrWWj9izy8yyQXlSOSylmuFLAPNcAy
         Gf/cx+Qjs9EKPriQvTJKBFJXVNV1DfSYP8NP3A9VqL6oA6kQXytiX5HS3c0bjzw5FuUA
         fZONx/YlfxVPd+hJp6sjRpepn3asJYXcGdPWAZkcNDa5MbRvZGxVLuk3gHkLoEAcxvjb
         AB8Y82d68kJBpf6HGGewDsTeMLgoeSSzTaQtNpQWQy6DSMH/WSLFIPLO0WX1PN8odIcL
         EnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=PfTHcNNyHIJD+nGjOH2sD5OMJ9tlsi2wR693y33YW1M=;
        b=RkBiK/LAHeBfPUJfmZeq/XqFu1Jub7sitMJqf8DOydOv7DMfrzJPOFTOQNWjk3KuTC
         +eK58yeCKKsGyLbC2WSpLibIzpaV+dklFzyImLl/75Qd+V00rEnWJnQRVZlNEw7IYKsq
         Hm7Xc7BYfebnuYxecU8dgdBzC903/4VxO+AWc+RXKOmwsMSnu+IuZxZg3Z37L5aqKMpg
         Tb0QcT5fQUBlEJwVmiwMQ1slM1Av65yfqNpMFcRa1RT+oVfS+u9kWQleGwI7IwWYsGW+
         rHA3KR4EBUdpW25QTUTU4+3j2mNAH7ftIQfo37OFke/3kjHbVGbg23kbb0ivhpQLnX7G
         C34g==
X-Gm-Message-State: ACgBeo0wp4Cy5a3S1UDclF03FQZcObyudJ8t80hkLGrtFtepAhK683J2
	3+RTofL78spYHJh55vsvrhwHuA==
X-Google-Smtp-Source: AA6agR5S6blYHlG/ZQ3FKm6/GupuDMufIbUfhIkh+6zlULEaWM1DuSdjLLD/+HMPKGYT5Pndi9k2KQ==
X-Received: by 2002:a5d:4301:0:b0:21b:8af6:4a21 with SMTP id h1-20020a5d4301000000b0021b8af64a21mr8543497wrq.296.1661846385373;
        Tue, 30 Aug 2022 00:59:45 -0700 (PDT)
Received: from [10.35.5.6] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id b8-20020a5d4d88000000b002253d865715sm5875817wru.87.2022.08.30.00.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:59:45 -0700 (PDT)
Message-ID: <a0425472-00ed-81dc-e98d-fbccc1e95575@sifive.com>
Date: Tue, 30 Aug 2022 08:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.1
Subject: Re: [PATCH 0/3] Rename sifive L2 cache to sifive CCACHE
Content-Language: en-GB
To: Zong Li <zong.li@sifive.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, greentime.hu@sifive.com,
 conor.dooley@microchip.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220829062202.3287-1-zong.li@sifive.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <20220829062202.3287-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_005950_502730_CABA56EE 
X-CRM114-Status: GOOD (  14.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 29/08/2022 07:21, Zong Li wrote:
> Since composible cache may be L3 cache if private L2 cache exists, we
> should use its original name "composible cache" to prevent confusion.
> 
> This patchset contains the modification which is related to ccache, such
> as DT binding and EDAC driver.
> 
> Greentime Hu (1):
>    soc: sifive: l2 cache: Rename SiFive L2 cache to composible cache.
> 
> Zong Li (2):
>    dt-bindings: sifive-ccache: rename SiFive L2 cache to composible cache
>    EDAC/sifive: use sifive_ccache instead of sifive_l2
> 
>   ...ifive-l2-cache.yaml => sifive-ccache.yaml} |   6 +-
>   drivers/edac/Kconfig                          |   2 +-
>   drivers/edac/sifive_edac.c                    |  12 +-
>   drivers/soc/sifive/Kconfig                    |   7 +-
>   drivers/soc/sifive/Makefile                   |   2 +-
>   drivers/soc/sifive/sifive_ccache.c            | 221 ++++++++++++++++
>   drivers/soc/sifive/sifive_l2_cache.c          | 237 ------------------
>   include/soc/sifive/sifive_ccache.h            |  16 ++
>   include/soc/sifive/sifive_l2_cache.h          |  16 --
>   9 files changed, 253 insertions(+), 266 deletions(-)
>   rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml} (92%)
>   create mode 100644 drivers/soc/sifive/sifive_ccache.c
>   delete mode 100644 drivers/soc/sifive/sifive_l2_cache.c
>   create mode 100644 include/soc/sifive/sifive_ccache.h
>   delete mode 100644 include/soc/sifive/sifive_l2_cache.h

Is this series available on a git branch anywhere, I have at least
one other cleanup I was doing in a similar move to rename and make
it usable as the l3 cache.

I gave the series a quick review and did not find any issues so far.

-- 
Ben



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
