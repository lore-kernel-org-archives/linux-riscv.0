Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B409FE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuFR+i8U1nodQXZ3zsXLXp4MZA45lC8NAz9B/G2wS3g=; b=m068D+EA5aeRJ2
	qE/xwvDaXl5Pgd6Y40B+5N78IPoK+2CGcnfpaKLMunXhxvkAGuTKXWbWvngOArUAU5G5Hfl0x0bJs
	dJpXEZOIXAAqgntyoTMyOd2vJflYZ8/1wl4nnzHRat+diVbqG8uFpcKY3h6ULNXmyGsstOCXhr4p+
	2f8vQnTrUNzYYHjMr3umsl8XBF1eWcTexXoy6aWyVCDjLLys60v+4Y1BzrRyQiBWpSkYxq2l0GMhk
	ziTZbb0fwts7dqNHksgdq3wLGpeQq+/MWc7IAINBStnFzRxcO8i43zI/lUnFzNWtznxeoGu1c/l/l
	iHkCAm5jLZn5NxPiXCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOewq-00000005K18-392R;
	Fri, 20 Dec 2024 15:29:52 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOewn-00000005K0O-1p08
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:29:50 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa6aad76beeso312407366b.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734708587; x=1735313387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=05YAc0164tw9JVplzvpWjTBOHLBHQDYsgb3ajbpcIzA=;
        b=B5kECdyYkBbgXXh+esWj5T+LefXf9gkq/J9AWEsxHtNZYumAZG3RCCzKTv7/hAFvNx
         6oxA2tWnA9ImS/JbGSE7ld4roiZSUbYygDBuiHhHatWgE7CpJ3uLNLRylIEmtbgx0xwc
         AnxN1Lhlm3IzFvmxx2jfyd5OUSWiNJKc7GHlR32YH25yOL+JN/B5WBpBr7qKJh0GwlJL
         euPjAMrKL7hrX2SfjcGlrmZBpb9Tp+p7P34RaI5hjMdduvj+WJMVt1c/1/KLIrGf2oJ3
         8IlEykGEWvXOU4R00HPKsNiH7IOurSwEBTHWkwiJ/vmkEOUuj/awwHSsTHjvhDFPisbH
         /d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734708587; x=1735313387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05YAc0164tw9JVplzvpWjTBOHLBHQDYsgb3ajbpcIzA=;
        b=k2e6wrFhQHJlyG9YVrHFcafc+P4sejEirBQrNz6S9eUjHpqmVochvW1CwS5jheoxvJ
         MKIQjqgaiFqbSuYsznLbkYNJg4xjeIWYPidrY4YxBh6qEZcBsctwZBpXBPRGsTehlViB
         BTEmCxtHIypd5nWLk2xo6vfivePZMgiZx9PoZpYUMPLLXfwfeuFjUf0l9wcbk0sCQiS0
         9jHQz0UUkjCPvKSdbDAyC2TMMlVPXko3c+N/UxcnD/EU8rH9VGYxh+1OeBE4dCGYiW9d
         fqHyzcvy2pL+QOOR6ExuaGfysdt9eDOe1kbjB5xU3fBqqw5CdwNPv0g3vKzuXWrXZg9E
         4q7A==
X-Forwarded-Encrypted: i=1; AJvYcCUZRYFk8s6SuiezZ+CkM9fSHsMj/Yp3c2KUj1ldsMoOxAzsmlVYdGPDgxotiJGaXhwrB9iV1p2zDej00g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywryr5K8EHzcphrKrgUGQ+IE3+3GMcR3ZSt3CLRn2UTHfaJhD4L
	q95R/g10NTmu33n/yOUye4IAfSbZk/dNZr6uNwjh8tSNla7rruFb11Y2/3rHuPU=
X-Gm-Gg: ASbGncumYLAr7CGwGK2s4xj1FgkTlhwgF6k69+Azz2LlgIEFVU/idrLmmZcYMM0oOLW
	bySldH8S2ejxrJDylP3Wfswr1jZm7wJLLPEEVbfMJEqRyS3zelc439ZyMm9Gag7nhYBKCmeXV/o
	EhIjMXtM1MPYx7igzR0UrYi7KnuoK2G/p90JyGTBYOOrAeKUFsPoNIAu272Pcmd48QPG8KWL6Z0
	OmMomARXpmAUoLQNTMYB5qAJ47Bcu0/FJWDudFTrX0Ub1/ai0tg9VKERYIPcPkhTYjRkyZ2kqLY
	yPLzoP4mtV/UKjgJyGLoC6j9FvbsAymjOqe6q6N4tQ==
X-Google-Smtp-Source: AGHT+IEZMoavpWXkCDitRk4/ItU/bKhH5jQ7fnch6DumD+R+te4XLnU5UkkcQtK0y5cwevkmXN8Sww==
X-Received: by 2002:a17:907:94c9:b0:aa5:225f:47d9 with SMTP id a640c23a62f3a-aac2d0479dcmr344199266b.29.1734708586955;
        Fri, 20 Dec 2024 07:29:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae71desm185507366b.89.2024.12.20.07.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 07:29:46 -0800 (PST)
Date: Fri, 20 Dec 2024 16:29:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	andybnac@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 0/2] selftest: fix riscv/vector tests
Message-ID: <20241220-c289fbb5af69417dcc623bf2@orel>
References: <20241220091730.28006-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241220091730.28006-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_072949_471856_21B18622 
X-CRM114-Status: GOOD (  10.03  )
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

On Fri, Dec 20, 2024 at 05:17:25PM +0800, Yong-Xuan Wang wrote:
> Add test counts and pass message to remove warning of riscv/vector tests.
> 
> Yong-Xuan Wang (2):
>   tools: selftests: riscv: Add pass message for v_initval_nolibc
>   tools: selftests: riscv: Add test count for vstate_prctl
> 
>  tools/testing/selftests/riscv/vector/v_initval_nolibc.c | 4 ++++
>  tools/testing/selftests/riscv/vector/vstate_prctl.c     | 2 ++
>  2 files changed, 6 insertions(+)
> 
> -- 
> 2.17.1
>

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
