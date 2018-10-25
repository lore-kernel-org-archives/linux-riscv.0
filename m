Return-Path: <SRS0=o0tQ=NF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D91DECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 03:05:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AAA22054F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 03:05:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AsGXelNW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OtsmISix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AAA22054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HFJksH8QUmYhYIJpO8IDQSc9C1r22QqH7GLhOAz755g=; b=AsGXelNWVjLsZBGZMWNdnwium
	DNaEHjRbvH9OKfv+siEgO260iP7lBW0T8GV+8FIDaEQYc5kV5jjNRj6OsJqCYOVe0jAX+DcLWubdV
	bfjEvjWDPzaEwIy49dDEWGUTgf972QaRSVdLiy2hKgVwDyjV21qja8HLsz9aAKCo70LCMrsU0/60i
	FJfIxHvdEfy/fstzg4F9GRsQgcPB1RsaRLZy+rfGXQoc3DMhXf0/JTJcLxMtIoraaMkZzUfiPJDku
	XpCsjo1ZgIcPTdxDfjlkvpiv3PWEuqtZLd+aL/Cdi4DjlvHv/L+pSG1yXMkx+jLQnsKHzDiCg5g12
	ROQbL249A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFVxB-0003H3-Rg; Thu, 25 Oct 2018 03:04:57 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFVx8-0002ub-3E
 for linux-riscv@lists.infradead.org; Thu, 25 Oct 2018 03:04:56 +0000
Received: by mail-wr1-x444.google.com with SMTP id u1-v6so7641374wrn.0
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 20:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=6NPv5QjWWus9pUnlPdS3qtSpHexH5jRP307o1ux2mLs=;
 b=OtsmISixPQ091sgFcJcghdZg6sFwuWcaQ487uX3z2FervZNjMq+yb7D7M60M3DmbbC
 TpkkEvf28eBNNv2Wedy4zKWlAl5SpnrhcbLFeonGzd7rIF39NAneipdSl9KvoEq7Yhb8
 6m3zMwKiZaaDI27LIYqJh/XigjiVAXQES+cHN/VWapWiANOFZhrlDw94LCudXa7wejIW
 8cuza/x3ZaI+AI8Vl3hNfgMRb8q9weaVLcYF6qtxhIROXk3WZrxLW1001VOpJYvF4akj
 WawwqdMxCz4coSsHxWAtSfzDkdhGtaU4J78QAedYtDnMICIVJO6Bt8QkJYrLW2t0Dz6p
 l/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6NPv5QjWWus9pUnlPdS3qtSpHexH5jRP307o1ux2mLs=;
 b=oumbFNARuzZMHHgDO6nsmSACNY/OKtDcLNagfAOb+WjfIIatnlmnwpujRiof6kibNK
 TZdvcv510BvP4QkOLSnkkhPtHwqKBoy8T0MWQc8Emc04Z5Zj0UHRFQ5t7J5wgUGGQwH0
 ew9GT4ltXspPYWpfEIGgWnjEdlfurCfUHvbD1fiVdPzNlMorwmuP0hVU6HzIK0ndRNab
 rH7tfqXSIU6VNT2fXyuAzjwaN+GrAO+hXkr0pTfjV8Mnqq48cEGYHWKAIOdAION8mkiI
 7KlxBx3zGHrjSMzo78IQziAFd+Tmtl5qW8BYz2F8vmFUJlCWbaf/Geau2RuCj7PDqBkM
 my5g==
X-Gm-Message-State: AGRZ1gJI8TMPRHKAdd92bhkI/hmsVLTAXc7IPXhP9zL72tPSSk5XPHCQ
 UWFrUy4eojeffLmQmjYHjVRHZfMqk/U=
X-Google-Smtp-Source: AJdET5dLCAQkZ0VenOlCcwHS9DWX8Y/pArcolqFoztSmftkulcdyY+w22pPBC/tagKK5SvCzBSPhJg==
X-Received: by 2002:adf:a706:: with SMTP id c6-v6mr2431979wrd.56.1540436681483; 
 Wed, 24 Oct 2018 20:04:41 -0700 (PDT)
Received: from [10.1.6.225] ([185.15.205.146])
 by smtp.gmail.com with ESMTPSA id l125-v6sm1326341wmb.1.2018.10.24.20.04.40
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 20:04:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] Move EM_RISCV into elf-em.h
To: linux-riscv@lists.infradead.org
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-2-palmer@sifive.com>
From: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <af60156f-0608-adba-5077-9958c72d3726@sifive.com>
Date: Wed, 24 Oct 2018 20:04:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181024204036.8799-2-palmer@sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_200454_296700_3F198E49 
X-CRM114-Status: GOOD (  15.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181025030439.LmIypH5j6gmymZ8L7FRS_-WKYBfaRXyYG692A5qYn_Y@z>


On 10/24/18 1:40 PM, Palmer Dabbelt wrote:
> This should never have been inside our arch port to begin with, it's
> just a relic from when we were maintaining out of tree patches.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>   arch/riscv/include/asm/elf.h | 3 ---
>   include/uapi/linux/elf-em.h  | 1 +
>   2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index a1ef503d616e..697fc23b0d5a 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -16,9 +16,6 @@
>   #include <asm/auxvec.h>
>   #include <asm/byteorder.h>
>   
> -/* TODO: Move definition into include/uapi/linux/elf-em.h */
> -#define EM_RISCV	0xF3
> -
>   /*
>    * These are used to set parameters in the core dumps.
>    */
> diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
> index 31aa10178335..93722e60204c 100644
> --- a/include/uapi/linux/elf-em.h
> +++ b/include/uapi/linux/elf-em.h
> @@ -41,6 +41,7 @@
>   #define EM_TILEPRO	188	/* Tilera TILEPro */
>   #define EM_MICROBLAZE	189	/* Xilinx MicroBlaze */
>   #define EM_TILEGX	191	/* Tilera TILE-Gx */
> +#define EM_RISCV	243	/* RISC-V */
>   #define EM_BPF		247	/* Linux BPF - in-kernel virtual machine */
>   #define EM_FRV		0x5441	/* Fujitsu FR-V */
>   


Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
