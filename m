Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8313C0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 21:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wnd08r9+E/6ku5xlJUKlQY25lUceZ8J4wuZy5ycGcgg=; b=tLKsqNpjbssJYx
	kD+btvB1y3wfH86RCwvhJCRFe9IsV8f8TjAOxVkPKh0ewsIOUKqss8TixAewlAe3u4YKVIAvWrhrD
	NgnjvLZYlCpjbf9o6u2/JTStsV6Go0/ASHv1hL0yRW8vMbNa/GmlnpPNEvKWtK70yh6MWZDrTujof
	cx7nVYIiIVsSTb6Bfxa0YPO0QhnNjk2gYKtA4KvEbgjeNKGPZEzxKV798YwW020EhWaHmGV3G8pZ8
	DbizUAqJdc86yC9L1kSG9tkWDsvxHF/Md/hR4wL5oIW7h8IxGAbFUq+UTgCqhMYKmzkTLVmsiFSRD
	QvgpHjedcYwiMfneS/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdcBq-00000009eRL-3WkL;
	Thu, 30 Jan 2025 21:35:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdcBn-00000009eQt-2YyE
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 21:35:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43624b2d453so14778865e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 13:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738272906; x=1738877706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEMYcSSn+YjMiKX35dVd3WXjXJTXr2hti4Ywwh63NGc=;
        b=XD+sYqG8rCCFOUhIKpg6UakW9NpyAZUpMzoxEK9IHPbiKBtgT9OgwAuWrXV7TyYexC
         Pbg5fSdV1QMx020YdJiFcMCbzQ4yYPDFT/elgGwrBs/kuJUBP2Rwtcy5sEd+//JKN78r
         6RnDDr6dtHMzPbOZ5MQYRYCJPPc8fqduWCTms+eRnzPOEhv6X3YConJg6z1GStsG039U
         8uJ/6y+vrfl7pGAUDiG6DE1ZvnlFb9d8yEzqwskbHT5KvXAe7EvOdGoXWiNX2Q7e5oxh
         7Oi2eoSsC+2OkyJ0VTOJB+Zz7OagHNUjddGrfEnSFg7sCCs6z7yqEMVavf+vxUMIQKgM
         EZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738272906; x=1738877706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEMYcSSn+YjMiKX35dVd3WXjXJTXr2hti4Ywwh63NGc=;
        b=r50PHjwYcCTHOIdBZbqEtct8qrwGo42GKg0DOPMfA+SMyKa1Yh+aYmIKX4wN6LsyJz
         VgkYre/H2Yx0X0K56uEjdxF6Mt9gGcrVZumpAAJZ8NpKuaCxve8nns+0ezHumnN7rJY+
         54xEIk3+vWnqh8yIdFEwje8dtzTkv2UQSDNUIwJPjucPCb8m4p3S0A2PQ1/HNxIk5AW8
         9XP+PtmKvVwK2vreiWbTfD8g5QXMV1UhY6T/Qt0Hwo9t+tPS1yEGCCDDGZDwWZCt+fdW
         Fw5mLjPJBOMGFaK2lb8dMtESUJE5FNGBlT1JUc1+IJvSVBX/OB+9jwbpck++CmiZx9w6
         dzPw==
X-Gm-Message-State: AOJu0YwU/N9wEjCxTcGtgdoS9LauHUCHHoc5Em0WYyzJFAzoN4d79gZT
	WfvZiRmPdxFGvBYFQ/k3qVKVDjzGKQEwA3udphYyWzT8apaXzGFR
X-Gm-Gg: ASbGncuth2wFif9a0TKsV5ths/WGcDVqh+KRybgTmpO9U6cTYMwkMyD3xFgNSzFQP1M
	Yl/pRom79+M4iZg+EKp+XdWt/fKsgxIWXzx8Cw7JwWuOs2xjOndAGMM90YrMEYhCnTvxD8e3o7D
	Ds67GXZEFYr59oamE8ZUCsEE4JjpFyqUxJ3okeExZzWyhHi9Kjx65wAtsfsD6zqP4HsVq/0G7t0
	5gpFaEz41eb7fX8/6903O5JLZG2JuRmKc9z85T4botSkTMkxkevadxz7vuab6R3saZ2YAHMepoN
	Ej0MKiZygFg+itChxKR+tr5u+lx+g2sF56vMnDU0JX8aCnknxOB6jg==
X-Google-Smtp-Source: AGHT+IHtGbBGp2suP1Bkv9M0iWU6qrr+nPl9rL6lFNGYg9zlX2COF0tarb8/7dEeW4qNmjIjx6s7Tg==
X-Received: by 2002:a5d:688b:0:b0:38b:ed18:3979 with SMTP id ffacd0b85a97d-38c5196ae46mr6539341f8f.31.1738272905626;
        Thu, 30 Jan 2025 13:35:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2ede0sm70986595e9.21.2025.01.30.13.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:35:05 -0800 (PST)
Date: Thu, 30 Jan 2025 21:35:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
Message-ID: <20250130213504.285b4675@pumpkin>
In-Reply-To: <mvmed0k4prh.fsf@suse.de>
References: <mvmed0k4prh.fsf@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_133507_659776_BE86B90B 
X-CRM114-Status: GOOD (  18.84  )
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

On Thu, 30 Jan 2025 10:25:38 +0100
Andreas Schwab <schwab@suse.de> wrote:

> Sign extend also an unsigned compare value to match what lr.w is doing.
> Otherwise try_cmpxchg may spuriously return true when used on a u32 value
> that has the sign bit set, as it happens often in inode_set_ctime_current.
> 
> Do this in three conversion steps.  The first conversion to long is needed
> to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
> pointer type.

Doesn't that break things by discarding the high bits of a pointer value?

	David

> Then convert to int and back to long to always sign extend
> the 32-bit value to 64-bit.
> 
> Fixes: 6c58f25e6938 ("riscv/atomic: Fix sign extension for RV64I")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 4cadc56220fe..427c41dde643 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -231,7 +231,7 @@
>  		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
>  			       sc_prepend, sc_append,			\
>  			       cas_prepend, cas_append,			\
> -			       __ret, __ptr, (long), __old, __new);	\
> +			       __ret, __ptr, (long)(int)(long), __old, __new);	\
>  		break;							\
>  	case 8:								\
>  		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
