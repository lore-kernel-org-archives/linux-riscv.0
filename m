Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BBCCD5BC9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 01:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+iwHwt9rmLo1MaExXs67wK2m5pJBehycR4lBvLReFc=; b=2LYboS23PS0pcj
	JXXO3f7nj58GFWH/s41NcwymFlR3GVe1VtnQoAnY+EpxkEmzsxw670/Fq/fuZiAxGv/BQ+oKB1Vrt
	ruRMqDLRdrdVONqBZwJDaCeVWnPO/mmYPvaU+BV84B9+WJXmuRoSXjDTENmrVvfLVHEaEWTEEQzE2
	ozKs7wiLcAm+607SZsOjTp+mVuxkUleXLP7wunKthtQrqbJS1a2xxzLQumUC6xbWc5WBO9TzyyJPb
	plITaL1LjvHS0QpPRQhtANGnR463iCIfh9KQDsD5LWuxOx2HjYPimuaNu8HfW+kriAgWwGBFgRH4M
	n1LJ1Alaq1L5tt3KKIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPYO-00000004wPZ-1sIf;
	Thu, 28 May 2026 01:28:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPYL-00000004wOz-0oE8
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 01:28:55 +0000
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 51C6B3F4EE
	for <linux-riscv@lists.infradead.org>; Thu, 28 May 2026 01:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779931729;
	bh=UCnKVaHQJJh/ARo0G2c2/7dFzxB5grxc7vN4qZbuDYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=JFXn0udXhhfuFi7NQE4AOWzreKltw177zuWGSw9f4Se3j4EwUpZjP21389CHdCSAL
	 lFgnILX43ZKVz1XwzZBsqX4Rswto5sVnWI57fuevMTLP34xG3Y5yIU/sFB159RjKMK
	 awk61QeS4qvkJm8Q3ozNNZ4bJh88JNysvD498JL1aUTzrZhHuKC8SG7Q29frvJbcOW
	 OFdTBCKILVJUl9vF9WxIE/+HqsbtjOBdiblld1zt7TYnMANI0PH1XbuQCkgkaQ8tdj
	 1MyqBoJK6rVkHHNEpGCJ7PV2g+IoQqrAL4Y4efS1ufVFX4Ojnpz3NR7bJwOX0mereM
	 A+zhOrOSNyOUPHS72pjh+UBm6rPiIuAIpYNxqLjR2Up3yP0FY4abrFF2WxJTnkELGx
	 81naMtCnpuGGA0G1i2QrK4y5sE+HVcRR6UR60Sb0xVFciPp6WRbsYYsC1mVSxOcESh
	 fO6Yup5ex+WJnQcRQ/ArZCZdVHDR5qYbmOH7mpY4908WfW9Lfoa/E0luxRuwHE/81G
	 U7HOAELLlICwf3DFHldq/Hlcnl9DLbPjHK2USUA98HyutYB6gKcEC2ZqssApw9Pruq
	 TGL7r22aVnpp3PDhc2zdJhM5dAdERZnZU3DLKkiU5g69ObTKzXqo2i8lqGOpca5wmV
	 bjqKz1JAp7SrglBW7G8fGSWI=
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso4669325a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 18:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779931727; x=1780536527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCnKVaHQJJh/ARo0G2c2/7dFzxB5grxc7vN4qZbuDYc=;
        b=BSn4+m+m2Id8Dq9VVlK9YD8F6/aQSYSVcaCujG3AvXa9Z+OZw0IZEB1I5mAQLx4mCI
         EF3NxT4FoiCoFcyl6euJKl4DuFsqu5QzsRlt1PLTB75p+tkjFo6YMEQmMVKhG7Stcx8v
         ti3gOrkT/zHkDYXTBVqxictqrLSF9afk5Rulb+fwHPjt53hHMsrUA6VoDrLC0bWFmgFp
         58apcPSCu7JJDYlfqDFqezoWQQ3MvVLJSYuDsl8NwPqr6Lgw6kgnoNqb41b6yitIzEoJ
         tbeeMDoXloBku4jR8yGAvY0/W3hCUcSCh+rxe+tKO/D05cHcMqLH9N+Mgg2dZmV1Zvqi
         JvWQ==
X-Gm-Message-State: AOJu0YylfDR8Jkmioyg/PE2w6VzlIzLYYr1F9bqxPyY5UDTMoAIce0NH
	1DeE2+jhxhtmBH+fLmv0Tt/Qq1ZanBPBvxfPcHd6SGXeTApqSH6O9sDI5fTXMVOS96cVCqS88qM
	heTcin5neuQj5noOiCS4SONm20law6bkp0Yhr4AlYf9kDJPGZpo+9yA7TH/3QKcE4W+cmPqb4zs
	Pl3uto2awMIQ==
X-Gm-Gg: Acq92OHfJCFaUSCf095VGmNalYpXk8v8BMMKQ43NxJtNvndWFQ1t9VMokv1YvAOL/kk
	R7Yp0X/1nDnqVf+wgz5x3veZcqURtSPf9sWRg2dUcAq1O5fz9HRgblYhzDO9AHnjzOYHznEUhFU
	I+VjyrgB3XXx8deVwSNwjP6RDFnUKlfJJTNQL1q9rmO8xxx+/UIr906AWXLdxBo2W1Wr5YCLEAG
	Rr+XVKaTXfnW4u0OnbOIpfkab/XEAB7xj2tjXs5lcHJQ2bEnOnfCgkG3wNUxHLLlaVXnSZ1W/qY
	HTjyHcwuOS9s6JHHdDncrLmmHn3zNzZVXeHkLAMIMao32Q/7MN/qi2pq1A4vU1g1wO8ipdCQhVs
	pYOpFEsXib4n0yChXnMhno8BP77BdfKEGm7W767X0Z/vnXOh2YF9p/fmkPfJXqWtcUqdbr5Zm1C
	KX4xDI1+0y41g=
X-Received: by 2002:a05:6a00:bc8d:b0:838:127d:a16a with SMTP id d2e1a72fcca58-8415f331df4mr24709798b3a.19.1779931727428;
        Wed, 27 May 2026 18:28:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc8d:b0:838:127d:a16a with SMTP id d2e1a72fcca58-8415f331df4mr24709778b3a.19.1779931726966;
        Wed, 27 May 2026 18:28:46 -0700 (PDT)
Received: from ?IPV6:2409:8a00:48c4:9120:7fb6:5466:f3e6:e2bd? ([2409:8a00:48c4:9120:7fb6:5466:f3e6:e2bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6eae727sm4437404b3a.19.2026.05.27.18.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 18:28:46 -0700 (PDT)
Message-ID: <44661430-2daf-42bb-8a83-eb8607f8df25@canonical.com>
Date: Thu, 28 May 2026 09:28:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: kgdb: Fix a missing irq restore issue on an
 early-return path
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, vincent.chen@sifive.com,
 stable@vger.kernel.org
References: <20260526113829.115007-1-hui.wang@canonical.com>
 <994d9b89-b1d9-e642-0ef0-66a8cad538d5@kernel.org>
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <994d9b89-b1d9-e642-0ef0-66a8cad538d5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_182853_514265_B912EE52 
X-CRM114-Status: GOOD (  11.32  )
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


On 5/28/26 08:20, Paul Walmsley wrote:
> Hi,
>
> On Tue, 26 May 2026, Hui Wang wrote:
>
>> If kgdb_handle_exception() fails, the local_irq_restore() is not
>> called and the function returns to the caller with interrupts still
>> disabled. To fix it, add the missing irq restore here.
>>
>> Fixes: fe89bd2be866 ("riscv: Add KGDB support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> Was this found using an LLM or some other static analysis tool?  If so,
> please add an Assisted-by: tag, according to the directions documented
> here:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n637
>
> and here:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-assistants.rst

Thanks for the reminder. This was found by myself, not by AI or other 
static analysis tool.

Thanks,

Hui.

>
> - Paul
>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
