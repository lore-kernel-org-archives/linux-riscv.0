Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672D1E92722
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 00:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgdyC0vg5zZ1LNurUKST7NhvKBrCo83Kc6yJtnEY6a8=; b=bJhwYV+Eis8vHP8jaim01dudI1
	U+0gco7huDkP4jsOve20vfNGqAnuKZZKjxT9NVIfPamUK8QGf4bgBQbyzAUl52iumhucqGzIxE/9T
	2kCE0M65TZj6VrplVAYIlSukIRAUbHkBvdznjhyo6zNi8k38m1sDGioM5/fpfgc/hdx2w+xO7loyr
	fvBlhxAa6W7xZ9l1qKODMOkwalyoNrBucF78OAVzbYXBUOpTYT8d8+ktwaZmN3jIW7KPRuDD+nQra
	EoLOgiMJCIJANmcN3WUhtDuZLmy3Re51+6lkhGl9/Qf9d1IfbvJI/elEQrvPK/96lEbgCiPFDgDmV
	a8n8YpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZeqt-00000002Ite-1dW2;
	Sun, 28 Dec 2025 00:41:43 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZeqp-00000002Isz-3NGZ
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 00:41:41 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-34c1d84781bso9316058a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 27 Dec 2025 16:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1766882498; x=1767487298; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gw4MkyZJ+UJg7p/q4E1O0Sly5zd+czDle7puXTH1chs=;
        b=YU2Yeu7GzeU6CUhK3znDbdBNwPOBZs5XxvKr+hEGDr3yJV2yH0FJkE4crQ1ThfHih9
         dMgREtmFQjjd9JB+E954GYuOPo9qpI1NcnqCglmJIud1N9jC72G3UXhxTQb5WTMhQysg
         VNxjBZJNvD2O90pbZ2xrKT15AeDVoOSrCZdFRWIzysd+FbsFQczgURfEEYm++1LiG3zT
         P6QFaP7/hMVaCwTVnzzmMeamNlAjD1Bl7qV0yZWeGzcHRkqlsHKfgWTdwpl8JlYHRMBL
         c8oOiqU6pckUONEQ7hjtw2/5WZDrFHxTDM0TQXApH7JwKaDMXxXcKGD3lCiDLzJPokhi
         BORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766882498; x=1767487298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gw4MkyZJ+UJg7p/q4E1O0Sly5zd+czDle7puXTH1chs=;
        b=ByAF6QWKqJAA0zo1gLDwS7V9JgBmz1qUK3eQpGmQ+y1zOc8mvoeFv0S2Qnq9gcemPb
         UF1B88Cyp+lK3vtMyXtW2X0TNT8fPerm+/w80w3rIxEUaY8rlJMG8d6lxhIRmtngsS0w
         WNK3thZEQ+3+4AFtH8uMr51t9qB1yDMYRPBSgfx0rHRyT99o57CcP0+ACqvto+IaVoE1
         ESeyEkA0fHkgZ0xyoWL0j4BoBt4kLcipoA4FM7+PokgymQejHyd2pE4ZVzQIv/pQcNh2
         N5fVX/B1isdQ2J//DDoGBzQ/nX5RbgFOwfx77hyqPhtegqkI5iU9ZMe1mau0RJEz0M3+
         bAXw==
X-Gm-Message-State: AOJu0Yzgm6uI0ipGwE6sA5jLMTsmIVm4rOT/m64qDrHq0qzPUB11xe/j
	f2rWvJNktAgM/G6QbCkxn7tz9HivLnhBzLygs6hDaxIdyOvLSl5PBuYxxBy8ecihXsc=
X-Gm-Gg: AY/fxX5TqWWUNeBI0x9q+mptBq12hYiRQWLaiqyPx9eCyouJfzTXhCNpnAoQi5oEv1E
	f33klIWsVPsH1iT+6I9D5ZAzJLGM/fhDjSQusl65LFbwTXhaAShBsitDY2Ns9dcpK8Y2MupUsIE
	o24569Msd4o9kFEx9V9GkhaXFsmTr+ndfXl4y2y/hS8D7y2R53nSOyOvpNp+TA4I2U+EPrbu8ON
	jbaWmh6NEeLVtU9BZcC/5nL0WmuXaxv/HvLmMV0sElbRWmQp+HDyglXkmVwebngWy9vFJGccAV1
	ZSQzjHVqJkBFLwhgYlxaetnwzCSX7vHKaBccC/X9pt5GI2Z+pDJDTtE0xRQn4RhjjzJ0++4qOoA
	y+Rf/gecmCWhBk2TFI2mCD28vqqTJbTSdygZFRo4KuGfVZE1IWnDFgMpZgQf0rjrJ9b207u7S0Q
	sJE60eZv1QmjDX668vXgoO
X-Google-Smtp-Source: AGHT+IGrhcLVRql/ecClqZ2fx6pan1FBl0pOXpuVSIHvZOtyEy3By+NFkAzg0QrATL79JgxEDW8PKg==
X-Received: by 2002:a05:7022:69aa:b0:121:a01a:8e2f with SMTP id a92af1059eb24-121a01a8f2bmr8549456c88.42.1766882498226;
        Sat, 27 Dec 2025 16:41:38 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c058sm102986023c88.11.2025.12.27.16.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 16:41:37 -0800 (PST)
Date: Sat, 27 Dec 2025 16:41:36 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org,
	daniel.weber@cispa.de, michael.schwarz@cispa.de,
	marton.bognar@kuleuven.be, jo.vanbulck@kuleuven.be
Subject: Re: [PATCH 1/2] riscv: Use pointer masking to limit uaccess
 speculation
Message-ID: <aVB8wLSgmE7IRo7e@debug.ba.rivosinc.com>
References: <aUXxW3iZOClLNofi@debug.ba.rivosinc.com>
 <20251227125703.80908-1-lukas.gerlach@cispa.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227125703.80908-1-lukas.gerlach@cispa.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_164139_934348_8038E260 
X-CRM114-Status: UNSURE (   9.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Dec 27, 2025 at 01:57:03PM +0100, Lukas Gerlach wrote:
>Thanks for the review. You're right - we should only clear the sign bit
>(b38/b47/b56 depending on mode), not b63. Clearing upper bits would
>interfere with pointer masking.
>
>Here's a fix that computes the sign bit position arithmetically to avoid
>branches, this ensures the mitigation cannot be bypassed under speculation.
>This is basically the VA_BITS macro but computed in a branch-free way.
>
>In arch/riscv/include/asm/uaccess.h:
>
>  #define UACCESS_SIGN_BIT \
>      (VA_BITS_SV39 - 1 + 9*((unsigned long)pgtable_l4_enabled) + \
>       9*((unsigned long)pgtable_l5_enabled))
>
>  #define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
>  static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
>  {
>      return (void __user *)((unsigned long)ptr & ~BIT_ULL(UACCESS_SIGN_BIT));
>  }
>
>This evaluates to bit 38 for Sv39, bit 47 for Sv48, and bit 56 for Sv57.

looks good to me.
Although, I am concerned about maintainibility and bit-rotting.
I would suggest to fix VA_BITS definition instead of defining a new macro here.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
