Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611E7E7719A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 02:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOhsqOr5AwJFC+jZjYJZw6kL2y3bw+EdG2oszsCAq1A=; b=ozrgrqJj17ZHSu
	oXNflTVxIGQC4ZJgbkwJmPGVd46uXK2cxWTr/YSFzARYkHViFD/wH4WG3nXGPVcM0HVnzOMUkczIq
	Sl1iLuybtR7liHypM/t3QMRyseeseVTtixvAVUBiQ8ehGl5U1P2ukLrqB/57F29okkRkkH2OmDPTW
	UeSc9KXijE+rK6gJC6eHpkSPYz9vGQaQvGZu7IWBRRDoTy9wZ6uoi7A/OPZg5T+AvlFGbZiU8KbP4
	Rv8ZObliZnn/1kwf3Tc9FmiDyK/vZiLiiHBLSDZRbbdzRrpRoIlVWSuTb3kT4Z0CdSAlxrmOcRqEZ
	w4b0cKSfCLuHI8N7hjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW4w0-0000000DqjH-1U1N;
	Fri, 10 Jan 2025 02:39:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW4vw-0000000Dqik-3EvX
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 02:39:38 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso2095081a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 18:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736476776; x=1737081576; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mr2zl9tokZEmJRNbwSPk2x5ju4GlaTGsmKHBRm106nw=;
        b=iTsvxYk7OmPJGchH7oPWjqZMiQ+LJoQ0ShKULUS5c0wwdFhpVN4yBBhWmhk/M2U2Sj
         d8VklaBAcltbnR738GkIBJKPAjXN5RRDOcufmWe/mt8s09t7Gtxhz3bg621J8DNMJUMb
         IyOywPWrDHnDVoRhpcZS4O8hEnPtWOL1SPV6DDKL2jd+0yVTVLH9mfe3CyXsAudOF1Pj
         pD2tOUqO+gvGtXw/OaIC8n0pdmSisdCX2JkY5ePrHDBLdBQnG7om9lNAhI5Uv/+mcUzL
         08KMT8v4LLWC2SqB9y6UrztokusOuIxRzEgyUUGSGNQ1ynakrLpDYafIFfoe4unYKvlx
         pzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736476776; x=1737081576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr2zl9tokZEmJRNbwSPk2x5ju4GlaTGsmKHBRm106nw=;
        b=EfyG+mlb/zBhoOPrtraeUhulGmJi+WkscnZ1UbzVp5c5QdaSIw7vZB5mXZd64rR9e+
         6vXdmdgc4ozCaTstBoHWlt0dWzl0jf1n9/1jjUlJZDucxqaZDkNE1/aA/KJg3dDdH0MP
         D1B1Hezs26V1OH/0ITsa96pbMSILt9lr379p3qOetQivUNXxUNDiHGE1YcrEBsFCeT1w
         y3Nhbv+CEYT/qfDTet8bu76YZgoqt+T13nrY9ofsXzzmzOW2Lm2brlFGFNeLufybtAvv
         OBM3kmeSuo7NeZT1QrMYI4jO7KH6tg3c/ArAr+XFLUn7ouEkrRlXPl+tQiP7EHEkYo/l
         3d+g==
X-Forwarded-Encrypted: i=1; AJvYcCUXhjTl4TBbpEL2HoFD6chIgRnSvmr2/tn1dZPZvnYO6z4iGdcmKo53ykudJsGiwiC1rSd83rJP6KNYmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIWqYzl3g9dtNSyF+o6IsDWllFG/U71QOCl7+jDFDHMxu52f33
	Pu92x1GgJNjCZVcGofnIVUThzl9bP5m3nd5dsDQF+wJs38Uezu59pxwDIdacNdM=
X-Gm-Gg: ASbGncuPU45wZoW/EzLdJ3Q0Fp2tDRwJhVd0DynGHyAU0lAFFLIfmhUij7eHcNo65Lh
	MqffDu9lEeXnjdJoe9HMFJGVUyI/hun/PQ12neQu/Uu6JdVQE+POitSB1dXmaLq45cvFGahjE/F
	TeQmtHxYmHdNS2nEN5k5YF6eEFZkbnjXMsnVQDuOLHqwL0p8Q7e+/X0Ii048pju982+9EeRcBvF
	fLcRPS/JqG2F5oHwxVkj+XxB2b1a/WJvLm+bUDmzE2RoLjNi2Zf
X-Google-Smtp-Source: AGHT+IEELWBKHxdbrUGocMcdse//zbn0a7mfhRS+t2cLR4rGWCWkHhICwizRk/m67LS+t2LFMSJfyw==
X-Received: by 2002:a17:90a:e18c:b0:2ea:8fee:508d with SMTP id 98e67ed59e1d1-2f548f45fb4mr13311438a91.30.1736476775943;
        Thu, 09 Jan 2025 18:39:35 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f233836sm4473465ad.207.2025.01.09.18.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 18:39:35 -0800 (PST)
Date: Thu, 9 Jan 2025 18:39:33 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: cp0613@linux.alibaba.com
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] Documentation: riscv: Remove KPROBES_ON_FTRACE
Message-ID: <Z4CIZSpbbUATs8TN@ghost>
References: <20250108020342.4172-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250108020342.4172-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_183936_814633_B273BE3D 
X-CRM114-Status: GOOD (  18.08  )
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

On Wed, Jan 08, 2025 at 10:03:42AM +0800, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> Since commit 7caa9765465f60 ("ftrace: riscv: move from REGS to ARGS"),
> kprobe on ftrace is not supported by riscv.
> 
> And commit 3308172276db5d ("trace: riscv: Remove deprecated kprobe on
> ftrace support") removed the relevant code, but left out the
> documentation, so fix that.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Perhaps this should have a fixes tag for the commit that removed the
support?

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 3308172276db5d ("trace: riscv: Remove deprecated kprobe on ftrace support")

> ---
>  Documentation/features/debug/kprobes-on-ftrace/arch-support.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> index 02febc883..d937b7a03 100644
> --- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> +++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> @@ -20,7 +20,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: |  ok  |
> +    |       riscv: | TODO |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
