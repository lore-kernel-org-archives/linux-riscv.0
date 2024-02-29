Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF54C5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 00:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUeNfEUEU8tH6dYgWMSKxcuSdohHiLK6BRdJwQyINJI=; b=LeXg9eJ+dmoK3g
	A8jJRtVzch76FR2I+AEjpQ97YuG6rlyoXlXfOHYNFxAcAFr33W6F5Wl7ia2tffkSYvUn6HbeCxpOV
	HXfhEfAndiqzfIgD3WsM7I1kWXG0vKdkIrHnT1Gcc0UobzVT8EsADzOkeK+KXialMpYxEjaZh3hlt
	pspDTO3RVPOe43zFDhad4CHYB8UnN7q/Xm8oQbvPaoYSFwGKOxP9lFXVZrvQus/yY8EEzLtXc84mP
	MEvSjmgrpvrnSfJTRYAj2ghEfHtPqxQmuFzdB7rHulq+oqdjCn9iXxAk4vwFEIkdi5vprUj1Iu3lI
	CD33frLOw3BOBfrP9zUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfU7L-0000000BNOY-25CZ;
	Thu, 29 Feb 2024 00:17:43 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfU7H-0000000BNMB-2WFf
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 00:17:41 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a3f3d0d2787so51513566b.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 16:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709165857; x=1709770657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r8rCAw2z9zs66RJeYr65+ZavbW8aat8OfjJwJ3rblxo=;
        b=UpD+m43Jzeex3d3iqW0OlC88HsQC/d0VQo9x4Ok/HZzDzlRXTqcrAHU57jpUtPYVq3
         I/0XFut6+AqLqi23J5M7KTUBwLAQqELNt158mMxZHbidylXjqq8BSuiSuv4iVIqZNU7h
         xcy8TSw00VxkExqg18NfCUJZ3bIg/f7LTtc2Aq8BlFiRLJyxBND7GgV/7QldAn8TIpdr
         PF6nXigdF86paUzRnAZRbeiHqYnddZ3Nhe8GmjgffH5kJ6J4dzIH2IVBcPJ0gJ+/IHgx
         vCdlJVFrytHXgzGBFpvFiPCjq17bO5Fv+xAVWRG7K5NhfvqNFVJc/MyXSVtvKquA2og0
         vyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709165857; x=1709770657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8rCAw2z9zs66RJeYr65+ZavbW8aat8OfjJwJ3rblxo=;
        b=SVDV+05IebTHNntqRwSPp8jC7BAWt6M4VTd12D163VwPDISPsJvGhkVJ9afuN7Ry2J
         1/IjspkE9mRrfOfT4FShY4Y/IfOL6/esWwMAjbw8dgQCXK8ldEcOmIbKvDwwPHwVPN/f
         NSasceFVBWxSANB5W2gqhiUNWk8hEl/y0tK5K3yFLaCJn6Pkh4B6HkWlhlAvPUZHgN4O
         xLVtRPfsOXt7IvRbSsQ5tOK8G6R/bQ3Xxqg2u+cCJq4wv0Vs9N/hWphLQNcNY1BJY/xD
         1t1TlxYRDVH5EtNSO9LCnwjE+3YfAdXlY86DQ+HiduGzU89s3roADTDGJw8DD4eALfiz
         qPhA==
X-Forwarded-Encrypted: i=1; AJvYcCXIcsePmD/LmBPZ/eDeXL/CDjMpbA5GpIg5K4g8SGolO0Fub3zrsLjv1G9DLo2bwyqymhwZaE+DUVHKops1Wgwgr8JwUp9SKZfUp+FOeCNX
X-Gm-Message-State: AOJu0YyBkYPZsWQhKn2bBY4T0KakYg3eJlry61Bq8DvVFHNV0cd2XiHE
	wGN5D/qpllouFPMFnrZYDfQCOux+b0OzlTKIXrNIfgQK6i8Z7EIx
X-Google-Smtp-Source: AGHT+IEz4pXkzI7v7mnnRyh2MjDkBgjqqrHxiELiDYhG8SJx+250Pq7fVPqhPfscjqy2xoAEZQfv2g==
X-Received: by 2002:a17:906:7ad0:b0:a43:9857:8112 with SMTP id k16-20020a1709067ad000b00a4398578112mr312730ejo.20.1709165856356;
        Wed, 28 Feb 2024 16:17:36 -0800 (PST)
Received: from andrea ([31.189.122.3])
        by smtp.gmail.com with ESMTPSA id ce18-20020a170906b25200b00a3f2dcdf18dsm69575ejb.33.2024.02.28.16.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 16:17:35 -0800 (PST)
Date: Thu, 29 Feb 2024 01:17:31 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <andrea@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: Remove superfluous smp_mb()
Message-ID: <Zd/NG9IveQpamdDc@andrea>
References: <20240228175149.162646-1-alexghiti@rivosinc.com>
 <20240228175149.162646-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240228175149.162646-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_161739_663731_B818070A 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

On Wed, Feb 28, 2024 at 06:51:48PM +0100, Alexandre Ghiti wrote:
> This memory barrier is not needed and not documented so simply remove
> it.
> 
> Suggested-by: Andrea Parri <andrea@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
