Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAB9C83000
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jun 2025 01:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeRET+TQXXjs2L8uBnUHtroxNT9aZr5tVKMNdp5R5hk=; b=Ywz9wkFAzMNVly
	06HQv94y7Lhtc93saA5zaHQpULCJesMissWVUkirV928rkwp1OatJ7g6X8IkGOf48f3mTVI5pe9MY
	2mkRgQ+oXhSu9GuWuQ+pElyiClYluZXeeTCH/Fys7x/qHa8LxRBdkoxusMDZsCGm+aJ0ic3LodqGp
	p43cA64st0oHkFt1rjgXWZFAg663sxvzv5897v6mEs/Kwr6ZUfRHjPelMIbwS5yhXBO8+cAdiDlQS
	J8WVrdabHAnDvwu4GMQJuypBYoOwqVerkN3iTPVPdAs9Uzew4DHXJei//S1ojXGotzzV5nLeFaJKp
	Ox45K3Z+Kp579Z98t0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVh9L-0000000HRUv-1Sag;
	Sun, 29 Jun 2025 01:48:07 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVh9J-0000000HRUH-2kgB
	for linux-riscv@lists.infradead.org;
	Sun, 29 Jun 2025 01:48:06 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e8187601f85so2761966276.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jun 2025 18:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751161684; x=1751766484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lDT3P9jNXthcT/eRpPSOP1p81uBOui1vV+1BgbEUh2o=;
        b=ORYLBoQ99ENn2jvPd1DMtY3UzxqgEevxGlMCnMXNkK7R2hQwj0v7wu70avQnzHB1fA
         6XuIRG93Tqg0lv73pClYdcOigG1SKK6PUjzN/V5QydhuFAn9iOgz4TSb5JroGI3tlhgx
         aqh/zXtoaITFuHubAHqz+10/neMhsrjHJ83oWCrnBIkQlbnVUWCrYgiKSd7aewx8kfdM
         HwQcKFyy8mAO3+L0vCEDhVy8AOCbIC6CvNHinRjAlLRTqt4cfeTIjHoOv3bqpEskDRZR
         URLKmlRQqd9R4Z49IyZlFUt++eazZSVejJvHfYPZhTjnWFKjppvjDwZkbOllaDWAdaa0
         yybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751161684; x=1751766484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDT3P9jNXthcT/eRpPSOP1p81uBOui1vV+1BgbEUh2o=;
        b=X74jYwqGDvzyL/Zctm1ghYy0f20qfFIdQPLGPAZMxDw+vPxqs3b0djPYPEoRtjljlS
         /J9HqQ4xfrRkdO3lFMIL+GJRxy7bYFm/LHkktSflHqUmkd1jQIQiryCR1lbSBU73iPMY
         thXcdLIE9FPzHqH9pKn4+M6xXYQHgIzO/ANAgCfqpWAcKm5hf9brYVAXaxJG7fqpJ/DQ
         sz62XjG2cR7F/Q+dQYSbwVh+k0TYU8mN/kGPxmfxASVpXVd0ep8SGUEcavbaIxSxBVqL
         ftQMuqlxDdhfRO+uz4uT+1EdecJL3c8OrcnXSzugIDMz8vQW8hGe1KXjCNLmyr26WiwJ
         RRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/cHTTplt6EMc7czOjex7vlkt6tvPxdgzpt9UG6AG+puLF/P70Gm1G+UFg2AwwL7eGF/X5CELXzH4Jow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLNUJ76Qy2wss3E40Ycb6whUecb1JyPoVXgZNdSZpn5U67hlr7
	vKb/qWsAPCntG4txoxxJFX6gifJBkdyQaTxAp4FIGuBQc5wEjwZE2p7P
X-Gm-Gg: ASbGncu9aWXZpV7ImnELuHziMZBJX95RNn6S644SIEBG5XMJ1yIdBTi4wsujMm/5Avz
	1f9rS9wjG21cnTM5HPRrqIwV4+C8XZOXv3BqW6F7ApdK5Q2YngPPsHwYmYuXvQPxmc4owMfwoZR
	eL3jbSYTsCwoc1jypQfZXcMyIvyVZwxe6kPvY14DAC7mWDtQEO1/Q1x8rZEUheP9l1LdGi7jD7o
	+ZtitRM4Bg1VdZKAY/CFNLFJkY2kja7GP/dtgkvH1OqiB+IJjtDnx5quLToQW6rxiTkMTCqnbTk
	RxdMEFQLo22pI0iwm1MJcMj2eB/npxtk+oDf6C1m1D5kCqlfmuUr/9CC32Fex1b32Q4jf4JGhrb
	YjEsfepZAHPFTPN1pjfRtjA==
X-Google-Smtp-Source: AGHT+IH4TLdAYIsHiepvr2Og34KFXHu8F1zJHY5NzzLF3EuhS8CAS2k0zjoVIZ1RY0JMNPJ8L2smrQ==
X-Received: by 2002:a05:690c:3506:b0:70e:404:85e5 with SMTP id 00721157ae682-71517160c96mr155811537b3.11.1751161683934;
        Sat, 28 Jun 2025 18:48:03 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515c90f5asm10244537b3.57.2025.06.28.18.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 18:48:03 -0700 (PDT)
Date: Sat, 28 Jun 2025 21:48:02 -0400
From: Yury Norov <yury.norov@gmail.com>
To: cp0613@linux.alibaba.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, arnd@arndb.de,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux@rasmusvillemoes.dk,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb
 extension
Message-ID: <aGCbRguHwFY372Ut@yury>
References: <aFWKX4rpuNCDBP67@yury>
 <20250628111357.1627-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250628111357.1627-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_184805_692066_E34EF554 
X-CRM114-Status: GOOD (  19.02  )
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

On Sat, Jun 28, 2025 at 07:13:57PM +0800, cp0613@linux.alibaba.com wrote:
> On Fri, 20 Jun 2025 12:20:47 -0400, yury.norov@gmail.com wrote:
> 
> > Can you add a comment about what is happening here? Are you sure it's
> > optimized out in case of the 'legacy' alternative?
> 
> Thank you for your review. Yes, I referred to the existing variable__fls()
> implementation, which should be fine.

No, it's not fine. Because you trimmed your original email completely,
so there's no way to understand what I'm asking about; and because you
didn't answer my question. So I'll ask again: what exactly you are doing
in the line you've trimmed out? 
 
> > Here you wire ror/rol() to the variable_ror/rol() unconditionally, and
> > that breaks compile-time rotation if the parameter is known at compile
> > time.
> > 
> > I believe, generic implementation will allow compiler to handle this
> > case better. Can you do a similar thing to what fls() does in the same
> > file?
> 
> I did consider it, but I did not find any toolchain that provides an
> implementation similar to __builtin_ror or __builtin_rol. If there is one,
> please help point it out.

This is the example of the toolchain you're looking for:

  /**
   * rol64 - rotate a 64-bit value left
   * @word: value to rotate
   * @shift: bits to roll
   */
  static inline __u64 rol64(__u64 word, unsigned int shift)
  {
          return (word << (shift & 63)) | (word >> ((-shift) & 63));
  }

What I'm asking is: please show me that compile-time rol/ror is still
calculated at compile time, i.e. ror64(1234, 12) is evaluated at
compile time. 

> In addition, I did not consider it carefully before. If the rotate function
> is to be genericized, all archneed to include <asm-generic/bitops/rotate.h>.
> I missed this step.

Sorry, I'm lost here about what you've considered and what not. I'm OK
about accelerating ror/rol, but I want to make sure that;

1. The most trivial compile-case is actually evaluated at compile time; and
2. Any arch-specific code is well explained; and
3. legacy case optimized just as well as non-legacy.

Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
