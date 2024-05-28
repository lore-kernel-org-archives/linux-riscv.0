Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09687C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X995tx4IhZXgMkAMxgqlD1+/6Nv1n57ysqn/HCJrWv0=; b=dNqHfVShrtnloh
	rZcjWSyJfzJ4sSt70EOAhVBZUptFMQqPd091l//PAhjKNLaOuv/E1gl9cGuhak90RTj+f7BzZujK3
	ByoNJo496/CRMT1L+kgucp2P7xevtbr0kze9ubAzjRfFeJgaKx3cgIYAcQSuRos5TokTF87ehPVMK
	9JwKXXW67TvrWWaxrxTI46+5n481sGo4AgYdyIFzXTDR78uUqHC8QW+UIxtReTGeL0vSSyzQIzkQN
	jktFcnvlUXRG+Mn6tCsEx6DQmG2GGwYgELHncHmpUijfHkYETixPGnoaiFnBAnbr3fbEFn8OFr2vE
	8CcKF2WK8ZRdlgwZI6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC17m-00000001cF5-0Vfs;
	Tue, 28 May 2024 18:00:38 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC17j-00000001cEW-1mmS
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 18:00:36 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a6302bdb54aso169624966b.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 11:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716919232; x=1717524032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/eecjvGqvQVC6ZWS6Qar373HjapbDvtdOZ42+zPeWi0=;
        b=d9RFy8AyPLvxiZrqEbIGyviPbXasohy1wdXaPy+0V1zruhelkv+KsP2NghWXP7NNw2
         xLwS/HHyKjAKdkmqEkZaETvqFsvXQ+8+BFBvrp8aU+fvKpV6riN2Sia90xWZ6unvjWvM
         GgKBuM3wjtjc9DugnEHAr4QKS7WPVCjwIUZvdRt6vVUrn8kARerfOSGeWYxHfRDOJv+Z
         G5Ul6hBvv0ZNexOkCwrTIXlnciPLb6CAkZ/penVO3ibgFh33iM29hBjc+7j+MCRTW+1K
         5mbr2KXuhnV0nyxNvA3pu05LzrlB8l6p9vj9XHKf5wU9DhfaThzFQoWGkSBVNyHuJYa7
         E0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716919232; x=1717524032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eecjvGqvQVC6ZWS6Qar373HjapbDvtdOZ42+zPeWi0=;
        b=XNKqCdW9FCdStsW/xbojBqxUtiP83I8WqqpHsiemQhwjTUEiWLlqmrvEkUeTDqNOFL
         iTvNqDtzrd9a2UrX60q7u9X0nn+atAAYWtpoDdDqzKzvH3HWCzzl6wIny2bttge9/Qmf
         H5UZcZyhLhtap8mXY3LZGkauuyqTUs6KjTm9Rch0iB+WcTXEXzagvStGqU0iV4uJWhYe
         gTkfsji2b4y+YJQh+0axLuo/w4pkBmD7z9TqONONMzxgj2rCWnjPABm4lvdOKiPiJxc1
         3s4Sc4fqo0tSQllLLHy0f4+dwLQX+bjk48lmDFHuvcShkgWbD+5N7bVSAJ26eZ2F3o/5
         /drw==
X-Forwarded-Encrypted: i=1; AJvYcCXXMAxtJ4L0Kb0FXyAlmwOKuT091AKztijTwT3F1kVRLSexMTWGbauj4+fpdK8acKRCCAYk7fp0YOX67L2rh7OPT5MLbQ4fHpDxezpmK/wB
X-Gm-Message-State: AOJu0YyK9nuP6d4Fz2OV23YIy30oLIVBlBnsjiX2Eo/Vsl2GoJbcaYph
	gHF1LSmwzk2CXIvWJi7viByFVJvLuKklL65tFTeTNZr8nbFVuduR
X-Google-Smtp-Source: AGHT+IEO4l+HTjYGVCjXbbD0O8/ek58vjia6UWCUjps9g02FYVlxFnqF5M3Q6IdqFSApclX99EyMUA==
X-Received: by 2002:a17:906:c20e:b0:a5a:1871:e2a1 with SMTP id a640c23a62f3a-a62649bcfebmr930552566b.33.1716919232133;
        Tue, 28 May 2024 11:00:32 -0700 (PDT)
Received: from andrea ([151.76.32.59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a639ef1da1csm13068566b.147.2024.05.28.11.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 11:00:31 -0700 (PDT)
Date: Tue, 28 May 2024 20:00:26 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 4/7] riscv: Implement xchg8/16() using Zabha
Message-ID: <ZlYbupL5XgzgA0MX@andrea>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528151052.313031-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_110035_483287_ADE85F25 
X-CRM114-Status: UNSURE (   6.98  )
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

> -#define __arch_xchg_masked(prepend, append, r, p, n)			\
> +#define __arch_xchg_masked(swap_sfx, prepend, append, r, p, n)		\

This actually indicates a problem in the current (aka, no Zabha)
implementation: without your series, xchg16() gets mapped to

  lr.w     a2,(a3)
  and      a1,a2,a5
  or       a1,a1,a4
  sc.w     a1,a1,(a3)
  bnez     a1,43c <.L0^B1>

which is clearly wrong... (other "fully-ordered LR/SC sequences"
instead follow the mapping

  lr.w     a2,(a3)
  and      a1,a2,a5
  or       a1,a1,a4
  sc.w.rl  a1,a1,(a3)
  bnez     a1,43c <.L0^B1>
  fence    rw,rw  )

A similar consideration for xchg8().

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
