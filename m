Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93175C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBfd9KS9zXY7TDp2/4rOE+fcou3oMWtA0NTDiYJefo4=; b=FZDig9HDx6Zagl
	UiKCZ4fdt3CNe9xPl5powpVt6JhwIOlsJw8zJCWZRXr/Za109s6JErzO0E3SGUn2D3DzCKuvMwD2J
	l++wuubtYDkbLGxd0UVup6H3YHyXNLk42wW2dN9WDQyxMVg40dkveTLm7Szq8nSbgu8gN+Zh74kQE
	91xaoIDbU1naPesa4PkHjESHAvTG0gBtKRC87giHsXuGryyNubuPsfFjLq16s5z1bx7m0yQPtfWAv
	QWC/v9g7BlaHghV9EMi2OdZXoiR8kjZagCabrE1NzNMQDGT0qEsE9nPC6SrF4h2j5LbBLAPJ0EUde
	KEM94lydR+fTHzfEJEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChYX-00000007gzP-3Bky;
	Thu, 30 May 2024 15:19:05 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChYU-00000007gyM-0Cj2
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 15:19:03 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52b80e5688aso1002284e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717082339; x=1717687139; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b2xnnYdgiJxiz4X+rNxIsG3HSCy59EILqUkEtjG7IdI=;
        b=YB3wT0euj2944ogJb6CZZjqJsvSDWmow7RbSt7MbBrgzp/N0mrt7NtN3h+YK/pcPrc
         41RZ0QyZgTSBmXS7RxQrqpwyvKZ2bFpnvm7YsjZE0H73JZUVLF1XNswZRM731AeXMucR
         0YK//qGwHWUcnBGButKa+BpM7SAlaFUjK/mOnOvjtvw3kwifohTFmDuXecumLAWqk8+x
         bN4gz4g5LoPcY9HDaICozZsktwHQZp6qIBuxhKXR90RarooKlnhKIcEc5bNMUYxT7LlX
         t+c9i2D4GUKVms/jq5SCTS7WJOD2YfX+E/tG5t0DKpBV7I4IJ90UmgLjtHUHySB0lM/o
         2frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717082339; x=1717687139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2xnnYdgiJxiz4X+rNxIsG3HSCy59EILqUkEtjG7IdI=;
        b=ZLmDvkfpnaebQ0IBcjCL5JmVDjTnFbH4a3JK/jcRG9dLDpMoe7Ke/x6PkGsCRauC/i
         YHoyUJ3GdWr670lP0BQ0/pB/fqzW8gfIYttt6CIJQhplmj+p+XzB62MYa7sUwUXOdpkg
         R4k0E5iEivFcNsjF6si7WPxzVKiQ3rcwPg9AWibG9k4afQBqVoGXl2wfPd53plHu3bGE
         X1Vblnd3S8Ix3IIhydcLN9fzqiG5jFgOjFcLxdLy4/12Nf+Z0Fd2eHqPKNR6c1QOrnGV
         3HOfCmADW8b6vULiP9fuWwBem1uePmugvwJTEUaUT2ag37FRAQxrmg8l4TOeDHLwCEHJ
         OAFg==
X-Forwarded-Encrypted: i=1; AJvYcCXDBXR1ULs4nwrQyFhen+YU6cn6BqKSRmGFeEQ0dDCuf1A+vqqIVzXSyrDxkAEmno47buWTOQFn7SayY+ijseza2ZlQ6cu0IPPv8o17KNfK
X-Gm-Message-State: AOJu0YyErOPG5PQSHWPWL7A8dEGt9P1mEhYO20qD/Fd0/y/8rBhP1vTX
	gHdK2H2cb2Zcs4DXTvgeOsdtBDc8Hmhl2cRRRJ5nm70ae6TVDOKD
X-Google-Smtp-Source: AGHT+IEeoqTtAM1bj93m+Z02mdAebmcf39QHPPOBBDZc/q9wDu+sWsoDXYgY8CKGyK4WseoBITbq8Q==
X-Received: by 2002:ac2:5338:0:b0:525:32aa:443e with SMTP id 2adb3069b0e04-52b7d4282demr2002523e87.17.1717082339173;
        Thu, 30 May 2024 08:18:59 -0700 (PDT)
Received: from andrea ([151.76.32.59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c93872esm834551266b.86.2024.05.30.08.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:18:58 -0700 (PDT)
Date: Thu, 30 May 2024 17:18:43 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes v2] riscv: Fix fully ordered LR/SC xchg[8|16]()
 implementations
Message-ID: <ZliY0ytpksarswi6@andrea>
References: <20240530145546.394248-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240530145546.394248-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_081902_112399_D960B5AB 
X-CRM114-Status: UNSURE (   9.83  )
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

On Thu, May 30, 2024 at 04:55:46PM +0200, Alexandre Ghiti wrote:
> The fully ordered versions of xchg[8|16]() using LR/SC lack the
> necessary memory barriers to guarantee the order.
> 
> Fix this by matching what is already implemented in the fully ordered
> versions of cmpxchg() using LR/SC.
> 
> Suggested-by: Andrea Parri <parri.andrea@gmail.com>
> Reported-by: Andrea Parri <parri.andrea@gmail.com>
> Closes: https://lore.kernel.org/linux-riscv/ZlYbupL5XgzgA0MX@andrea/T/#u
> Fixes: a8ed2b7a2c13 ("riscv/cmpxchg: Implement xchg for variables of size 1 and 2")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Andrea Parri <parri.andrea@gmail.com>

Thanks!

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
