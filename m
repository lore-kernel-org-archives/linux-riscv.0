Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD7AD637A8
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d90Q0/MhD1eayMU2uxiKq/YMoKuq6JYJJPgeiFlPhMY=; b=jt2ST187ES5X4o
	FHKJSo/wKb6iJ6n/VhtRGkYn2K7ZidIYYg81AwjyNcwTrIMDP/YAjXqFi8tu9XdHHzYryedrrHSeE
	yEQFqtH+5MYSVQQoZWJGpqgyOIIrFg64toB1lrIjjkEH6ZK5r03hMnBjN16I3f9f0dvDQTwTsE7U4
	CB2/ofelvvBFCooeTVMXgF4YpHxNFd2i7C5YkWAYeCwbaMJGORtMU+/7sMYZbfSThwgBu6QIhtcUB
	OFyvZRBN2ZXrV+sMuyQkS42dYy/HIhDSKcq2GLBhqKjgvFcyKQMqt6VYJHAeolWBynHFLaMqsZdhA
	gIVbaFd9JZ1DELdeTXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIpf-00000007pFP-0KRx;
	Wed, 13 Nov 2024 19:15:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIpc-00000007pDv-1Jom
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 19:15:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d495d217bso6469689f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 11:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731525309; x=1732130109; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bwvBzeYB+oFxjO9ZzJuAzZ7MatGQO+jvmS1Q9roOjfU=;
        b=X/dAp49s9w0CbQKOSpnJbwO9LJpoS7kBCzs3nKRlGiMJZ3egsLLGnk63JoaYS1kqA1
         4JZY6KEzTlHy4z7RICdkgQB4Q4oDndc4BJ/8rZedsYVjSGRjfMStWs0JJKnEpr6ikmhc
         whyl2BYX4rP6ohKgUYFXIFNrBun3MTA0ExTeKHKFaFQSLVEWLH2GOw4/+BWfvr6bCQe+
         3H0e9bUAs68dzK3YD2Ns3vL6A/kIsenf5Mml+Y/oIrBKovzGuXauGrjKW5Pxqk7xKLUl
         7TTGyP1hvgok+/6oq3pjB2dLgfVxxWGpSh+fbCC+RmU1kNaqHPXEEpxd3Obbgy07LTzI
         2NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731525309; x=1732130109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwvBzeYB+oFxjO9ZzJuAzZ7MatGQO+jvmS1Q9roOjfU=;
        b=tpQR93Jrx/A80KWRTw372sdAZvKHZzSDgDa/km/QmFjoIw18xXPiQ2tu4axddHBCMt
         zNvXWqkxDfs7lfE2i1qK26yuPU6+OmINae8SSSVjo6Ocep2Tjwk55WOMQdoNxLGy6FON
         Y54Dh52/xOP9qTQUCxT63fMLsXayR8rBLSYyKnQrOs2rgpDc0DZSMVMJ+fYAOiIozyMS
         1erz6a9HU33FDwRZRDV6GzazpSK4AN6tOJ1dvTyF7v3l02n6nXejzRsdvzvH0xAs62jv
         TtMPjl1r8n87nO+qBQOhmJUdArpigKSF+yxDbgm90Ic/U/j3iQn+WeeJUwDJLmpAr7b9
         dWCA==
X-Forwarded-Encrypted: i=1; AJvYcCVTJRJHGPtfL5r/678LKC2GmpnqpwVxXzEaQQavZcjmg0XNacanPRipSBywClw2zXHGnf+IWkQXXBBUuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIvf0yaXPuomHsp0JgwRpLIbKa3SMUEEnGzW3/CV+8d1YBifs6
	+rVwLgbAbPH3oyi20772CsrQQEKYwQU3/R66ImjTY1H5i1b8snJn
X-Google-Smtp-Source: AGHT+IG9YnyQTAIodllD21sJzkhAMlb2xsCN0UYEwAkowMrqzjiuQrmEfcdhs78UPAo1rz5q9FNP4w==
X-Received: by 2002:a5d:6d89:0:b0:37e:f4a1:2b58 with SMTP id ffacd0b85a97d-381f186bd22mr23835979f8f.16.1731525309341;
        Wed, 13 Nov 2024 11:15:09 -0800 (PST)
Received: from andrea ([149.62.244.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97ce1bsm19004945f8f.36.2024.11.13.11.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:15:08 -0800 (PST)
Date: Wed, 13 Nov 2024 21:15:05 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: palmer@dabbelt.com, jimw@sifive.com, guoren@kernel.org,
	dlustig@nvidia.com, boqun.feng@gmail.com, peterz@infradead.org,
	will@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/futex: Optimize atomic cmpxchg
Message-ID: <ZzT6uRDpkuEu5GH-@andrea>
References: <20241113183321.491113-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113183321.491113-1-dave@stgolabs.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_111512_376900_BE1B29AD 
X-CRM114-Status: GOOD (  12.20  )
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

On Wed, Nov 13, 2024 at 10:33:21AM -0800, Davidlohr Bueso wrote:
> Remove redundant release/acquire barriers, optimizing the lr/sc sequence
> to provide conditional RCsc synchronization, per the RVWMO.
> 
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> ---
>  arch/riscv/include/asm/futex.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> index fc8130f995c1..72be100afa23 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -85,7 +85,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>  
>  	__enable_user_access();
>  	__asm__ __volatile__ (
> -	"1:	lr.w.aqrl %[v],%[u]			\n"
> +	"1:	lr.w %[v],%[u]			        \n"
>  	"	bne %[v],%z[ov],3f			\n"
>  	"2:	sc.w.aqrl %[t],%z[nv],%[u]		\n"
>  	"	bnez %[t],1b				\n"

atomic_cmpxchg() uses yet another scheme, but this does also look good
to me: FWIW,

Reviewed-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
