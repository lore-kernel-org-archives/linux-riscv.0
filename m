Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD31C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 21:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywTmrBg+4JSYzxCXTID1LhH8glNMLUUi1dtYbAHspPg=; b=MxrihLQTGsLYft
	oL/HJSNxuPbAxzhfn2oWRYvhe3u1f/DyXcmAGmtKWXOEUhZI/6ZlFFRR+RCAbh4LA9HR22Z2IXq+d
	iWyCfSgHu7fd4tGef0PfYfCXySK2rD6Fr32WIt7HRL3viT2nCabugDdZEqzLmxvBVw58xNOtdbQJE
	ENk4H8ogOZN2tiA9CnTal8KOMFq2JwwTksh7DHZDlssL+5LYU0FaDxpqji2NooRjI7J2vA2+XbDgx
	A1a+ZH/2hUpE22cc/bq5uS9gt9XxzZnSSCJRxi3FmdPt0muaBEbBG7YYYAa1ejWU96/SMuJSIgoiY
	1yDcr7V2/l8O6mEkqIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRgcn-00GRrh-AO; Mon, 13 Feb 2023 21:44:37 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRgcj-00GRoZ-DD
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 21:44:34 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id di14so4984325qvb.12
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 13:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4fCmzCmDsrJ2j5aedYy/G0P8hgi4osOgCMNfN8jBU5k=;
        b=inuv8RcvJwjwLO2HRK4GYTKDCCLNCSNE3pBm++f9HVfEhz/j/2CcaLiLPg8rt+LM4G
         7ZYe9P0Th159eS3PeDuF4EokCWXxL8bju8joiwuHpMnQkT1t8qgb1YulyVUBfI1yK1Hx
         3WFGU4g5uLXpja6n5SQhm58JHalZMFz+V3TkrlYGIoZrFm6v6kZulufp0GkAYJSDmCM1
         3UxsUViITOB4H03wN96Zb+1LosfGnU6adSVCX07tT0tgq6VVz6SuR9tx79d36xWpo33U
         df8gXK4rPtffNnouiO7w7N34Zn3WjDje5Kog4eRQMUL7vruvgMY7LmYheSPPr+J9SjFU
         zvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fCmzCmDsrJ2j5aedYy/G0P8hgi4osOgCMNfN8jBU5k=;
        b=OeNXi6gTM+KZ+ChHjHfpdPwtzPokN1gJAyAAgygLXjb1SJ7Hj3RBvxlrK5W1qs/jfQ
         BX0UM0Kn8ef83Sa9w0dT3NoC+/MVEPODuRUUijMTaLCjs+FYHh0iZmACv0NpIr406TAt
         kXiGEtBM/7Q8p4vM5WSMT6VaqGSOvHzYSGbSAqdOaOKFr8zCfw17t0UfpkNA4mhGYFNN
         v+0gfV7H/w+wDK8DVr3luqVFEnc+/LfOjSEAs2PAB8Xv36EWwi1wOvvnM37dbCnuFR3I
         QViz6I/wYxrW8azC6C4HbcNowN1IgcHpuo4aDoe9xR/83+rpjYlukXf4Oj7TFCJZZrEw
         8P4A==
X-Gm-Message-State: AO0yUKXCDqAC+/FKszmXDLp1n2b91TrtEGUn76twhulvM6I1q6CGC2Im
	NdfS0oKer2AA0DqGHG0tNTo=
X-Google-Smtp-Source: AK7set/W9eLxRuvUyaFiyAh7UJh0BS6EvtVuO7CO5SbwA6YfUHuB9HZvQN6PBmjN4Ae7r642ESi0fA==
X-Received: by 2002:a05:6214:623:b0:537:6529:2218 with SMTP id a3-20020a056214062300b0053765292218mr641833qvx.30.1676324670766;
        Mon, 13 Feb 2023 13:44:30 -0800 (PST)
Received: from [10.4.10.86] (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id t3-20020a379103000000b0070617deb4b7sm10502477qkd.134.2023.02.13.13.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 13:44:30 -0800 (PST)
Message-ID: <cd0faa52-fda9-7b8b-7ce1-8ad33236c430@gmail.com>
Date: Mon, 13 Feb 2023 16:44:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/3] riscv: configs: Add nommu defconfig for RV32
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
 <20230212205506.1992714-4-Mr.Bossman075@gmail.com> <Y+qUVbhFUrb289xG@spud>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <Y+qUVbhFUrb289xG@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_134433_481532_E24293EA 
X-CRM114-Status: GOOD (  17.44  )
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



On 2/13/23 14:49, Conor Dooley wrote:
> Hey Jesse,
> 
> On Sun, Feb 12, 2023 at 03:55:06PM -0500, Jesse Taube wrote:
>> 32bit risc-v can be configured to run without MMU. This patch adds
>> an example configuration for RV32 nommu virtual machine.
> 
> There's a patch on the list (I think it came in after you sent v1) that
> pointed out that the rv32_defconfig in the tree is not actually used if
> you do `make ARCH=riscv rv32_defconfig`, but instead a make target is
> used. 
Oh that's interesting. Why is it still int the tree?
How would you feel about replacing this final patch with the
> below? That way rv32_nommu_virt_defconfig would always be kept in sync
> with the rv64 version.
Sounds good! The only gripe I have is the nommu_virt_defconfig is not 
very minimal, but that's not my problem.

Thanks,
Jesse Taube
> 
> Cheers,
> Conor.
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 7123511d977c..785d438ae5fe 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -173,3 +173,7 @@ rv64_randconfig:
>   PHONY += rv32_defconfig
>   rv32_defconfig:
>   	$(Q)$(MAKE) -f $(srctree)/Makefile defconfig 32-bit.config
> +
> +PHONY += rv32_nommu_virt_defconfig
> +rv32_nommu_virt_defconfig:
> +	$(Q)$(MAKE) -f $(srctree)/Makefile nommu_virt_defconfig 32-bit.config
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
