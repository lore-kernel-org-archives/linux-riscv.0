Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA44EC3ABA2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCFdVKuAvaKUOFjgE5HhplPOiznoKAHz9tPTUO2mPQA=; b=AZrxNVCX4IJXvt
	3JAJLzmiNctrTdkEWcD5SKOOq/qfI/3wtUE5a+aq0xJ+0GPyqy5nOF7of36/xn8lkCwAU6B1tX3BK
	r1jlcDLa+kmOiNW7/65+FXvU69hr691Q9eLk6gMX+t+zmWqyXYlsNMfvzPc+Hy48pFYCNxS757Wxb
	bAABPkaQwA2M33Z4h+bm7C6NLpI8IQDCs4Hv67rDNN0wpnBZSPQh3JS/4/pOKGaHv2ZH43bdaVv3T
	fvDhwRHg+jY4UF3bldQD5QSD802idrbBnGDGmOAVg6uF6RPIFtDcPr8/SRDIRWmJP2ajH7cVvftrU
	GSITVw6aA8SbXrUFF1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqB2s-000000040w2-1P1v;
	Mon, 16 Sep 2024 12:41:34 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqB2p-000000040vG-0NWv
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 12:41:32 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so991746966b.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 05:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726490489; x=1727095289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GV6Qavvmkl6w+Qrw4EyS70WlfiOWC0YssBlS9J9YVb0=;
        b=OV1oFpS8ic0wsNi0eTb1ExShKifVCm5CJ8q1FoocRS+0OCd1G9TZiZzzEypPP0u+BU
         CcbfZGIxVFgwzxFMOCTC1uZ+h7jii2O8qq4kXEBOR4ilzae95AQKRp1wWyV8LRpJwUg4
         1N13Kzn1QmXEK0+rM9ks4n7KGSDBuXjgFcQCsmQlh5Lk4cleOvqHo2zrb1/uqn7IYzVu
         rTH+GUfTY4YTN62VJb9wQTZLijRb1T2d+UnNMiRlc6IPBu4i+s/hyFAXewvbBzIgB3T2
         kgcQMYewWgy1ny6EZIGb9f8JdtcTlqJf/sxnCzMPaPsXA1h7itie17PJLhyhs7TPFZK5
         Y2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726490489; x=1727095289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GV6Qavvmkl6w+Qrw4EyS70WlfiOWC0YssBlS9J9YVb0=;
        b=GfySwtOw8gK8VeMamxFK2cX8N78w+PJrRbRMYdO0yV2Fe9TfhZiQP8vs+0BAE8Lh0g
         3hSgf83s16ZzKyPodDchUyQS/+Ss23ABOdrsXCk4lP1bturPLFRkHRT+wXoxHVrCd4Xe
         W5BUhcFlZzHFe1IemACj0aF2Ed74GGiV56HksVa0AUQd1AN33BTPNrBDc16Zxlihlm5A
         JpgNXEP1Yjf5kOz83ESeWvIVv0RXEsL7apgWPv0EhdXVRAJx3ACggRB3e5vfFXWz5HQ9
         CmPyFS8/9TEY2xjlaDthEeLTJPwdbhppxWcwszgDyhDn44VMfTAeivcAmsLML6Q6VxgC
         1bEw==
X-Forwarded-Encrypted: i=1; AJvYcCUQXv7afFqBvBh6B7ekCcZ+8JYCRgw6iqDNcuygCXyxm2svTTsbgmCiT2djE0YEJYn9wus87r6Ip/tPEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yze1+AzcNih4Gr3IhZI19iUF89pY9mN7il/cfBN6Z1TJSmudKXk
	jifIR5qaizgMeVbHnkJMqmuIHNe0yBLDASt8axOHU346U7B0EGVOFkpnBDuy+oM=
X-Google-Smtp-Source: AGHT+IFnPigrzANCemZ9VtsGTqNDvB1a9yTdTADsvcOLtZZYeHwglJ1hZd6gPRX2GFqfyECMP2QLKQ==
X-Received: by 2002:a17:907:944b:b0:a8a:87d5:2f49 with SMTP id a640c23a62f3a-a8ffae3a20cmr2140430366b.28.1726490488745;
        Mon, 16 Sep 2024 05:41:28 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610966ccsm308905866b.45.2024.09.16.05.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 05:41:28 -0700 (PDT)
Date: Mon, 16 Sep 2024 14:41:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 2/2] riscv: KVM: add basic support for host vs guest
 profiling
Message-ID: <20240916-1d1835e5f16d58c674fdef5b@orel>
References: <cover.1726126795.git.zhouquan@iscas.ac.cn>
 <86e8f4eeb30dfc8700089cd88616e6cfb5a142ff.1726126795.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86e8f4eeb30dfc8700089cd88616e6cfb5a142ff.1726126795.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_054131_155759_8BF7A4F6 
X-CRM114-Status: GOOD (  12.60  )
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

On Thu, Sep 12, 2024 at 04:00:38PM GMT, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> For the information collected on the host side, we need to
> identify which data originates from the guest and record
> these events separately, this can be achieved by having
> KVM register perf callbacks.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/kvm_host.h | 10 ++++++++++
>  arch/riscv/kvm/Kconfig            |  1 +
>  arch/riscv/kvm/main.c             | 12 ++++++++++--
>  arch/riscv/kvm/vcpu.c             |  7 +++++++
>  4 files changed, 28 insertions(+), 2 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
