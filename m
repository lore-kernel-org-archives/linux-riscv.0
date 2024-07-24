Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56D3C3DA61
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 22:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AGUuQ7zuwXTg2Z6dUu4SYzDDk2gMNWiZ9TzNep7oXaw=; b=tcyrvHpGN+3I8RcwWsewwaZyY9
	5Oud2hhU9+xvMiZQ/qp885nXftTHLLK1Vsq/+gpZvZUcSX69cTB0vtI2AjuszTXKia75rogFv1M1z
	J0fsBG+1GS8Uyiv+fi5ghvdk7bAnKx6awM3bB97Wx3tGHaFpa9DUW4tBszU6Dum5siVe2R2VTdosD
	ISJ4oTqyZzVonCjfcljJlkULXmE2pJYqtWxQV0+f/Q0UBnUBbLZt0qX8R1ymRuM07U7Zg0WvqDUBr
	MvDTCnfb/g5HBcawW3A9hP1/AGA6tNA+qn99NE1y7+nfC8GI92Q0K14hHDQpnZTYeUcY9EgLtDbNh
	hpR0GYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWkvN-0000000GkRK-16In;
	Wed, 24 Jul 2024 22:57:33 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWkvK-0000000GkQm-1JSs
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 22:57:32 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7a1be7b5d70so276261a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 15:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1721861849; x=1722466649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rr1h/r+N+ufJ9+U33AteJIVm6hb/RZis0D0b6S7S1NM=;
        b=pnHv45jhMZBnOfp13jlTlc8Au09s7u58bsT0lkv6RWL4TK41sw63W9yZTMB5qbDEuX
         wcDIYjVPrK+zKONwkT45KUJ2UOlH6ATobzcJth3vXd2rNcrPAC+F9dH13eC2lB5P5lAz
         vJWKQsj90Tw0E2oo/Q2ZkTxaVJc+TBnYTH1RU3SF3lA2Gu8JpnufUYj488jekOeTliDY
         97Vqq6UJf8yw8sjMt6jr5vmmJELPKehTh5iPQZ7O4RrpvfXMBisC3Q1ppYkLK9PY/yk8
         Ag81e756rQDv5UNjnsnGZPMnbK6Nq3+5p1aBGzv9NXkjgaogt++dfTXinNasTzg0oYu/
         nP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721861849; x=1722466649;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr1h/r+N+ufJ9+U33AteJIVm6hb/RZis0D0b6S7S1NM=;
        b=P2LlpuPNq4lq31uek+2zQ+Y3OuSflg6S7ZtJ9qYb6PglpRFSZ6An+xfPgE5zfd1Oi7
         wULUggKXmCgiAjL85Er9G6ovNagTm1RID+fkkHswb7OqGcnZ96/IrGoKH8yI1ggU6p3+
         zcEU3/zxp47eTHbeBo4X5Nd9S0s84WvPf8sJaHsyD6d5ga1tSOPlB8jmj/7ZWOqP0QgT
         3N5JF5vHFV6lUg4lT8f5RyPw/lX3twVzRsDXvBGp+GMsnYiObS8vxDbG6XJOUtrJFbk9
         1uRjmJVFOnW4jqEg+87+P6rV6q8Fm6T9IRMfQ45oXJNdN//sTL2OC6Nj+JLHu20h+WLx
         28Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWy6ZObAXGZUGx1OyvzcKWkJ39aHNKXWxSdjlcT71z/Hr1kW0sIajj75DnnfNG7+CFY4qxIo95pu0YCUK8UOsumLUX2aJ6UKbIaf6fLpXZI
X-Gm-Message-State: AOJu0YyzGWxFCPxua0vHa+qMK3rbYbI6LJVzqAWxXeEbl5UqYJcULI/a
	/9XZNHu/IjEJI/KwQFKcw04WcxES8xm9tBxgZXVa+KdHbenJTHF+aoO4y3zyZX+GD5bGyJj8gMw
	8
X-Google-Smtp-Source: AGHT+IHO8d+O1Lem7hkeVGDAoLyDNU4rTjPilFRpWZGu3CWZTfO0Uw/Inp8SpFUBcx7HiWwSk3eKJQ==
X-Received: by 2002:a17:90a:4e0e:b0:2c9:6abd:ca64 with SMTP id 98e67ed59e1d1-2cf21547c29mr1799160a91.9.1721861848765;
        Wed, 24 Jul 2024 15:57:28 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73885b2sm2263541a91.9.2024.07.24.15.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 15:57:28 -0700 (PDT)
Date: Wed, 24 Jul 2024 15:57:28 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Jul 2024 15:57:26 PDT (-0700)
Subject: Re: [PATCH 0/4] riscv: uaccess: optimizations
In-Reply-To: <20240625040500.1788-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-de264348-59f7-46b4-9f6c-cecee67f2eda@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_155730_529701_DEFB46D5 
X-CRM114-Status: GOOD (  15.90  )
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

On Mon, 24 Jun 2024 21:04:56 PDT (-0700), jszhang@kernel.org wrote:
> This series tries to optimize riscv uaccess in the following way:
>
> patch1 implement the user_access_begin and families, I.E the unsafe
> accessors. when a function like strncpy_from_user() is called,
> the userspace access protection is disabled and enabled for every
> word read. After patch1, the protection is disabled at the beginning
> of the copy and enabled at the end.
>
> patch2 is a simple clean up
>
> patch3 uses 'asm goto' for put_user()
> patch4 uses 'asm goto output' for get_user()
>
> Both patch3 and patch4 are based on the fact -- 'asm goto' and
> 'asm goto output'generates noticeably better code since we don't need
> to test the error etc, the exception just jumps to the error handling
> directly.
>
>
> Jisheng Zhang (4):
>   riscv: implement user_access_begin and families
>   riscv: uaccess: use input constraints for ptr of __put_user
>   riscv: uaccess: use 'asm goto' for put_user()
>   riscv: uaccess: use 'asm goto output' for get_user
>
>  arch/riscv/include/asm/uaccess.h | 201 +++++++++++++++++++++++--------
>  1 file changed, 149 insertions(+), 52 deletions(-)

This genreally looks good to me, but there's some failures reported by 
the LKP tester and I don't think they're spurious.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
