Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CFBD4660D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 18:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQtJCqvPUlMvfW9Yujqv9kHYII6KLHLKGbFyjTrD2vk=; b=dLFsotwUlju7vg
	xPQOp7lZukuu8I+HuegB/4u8kRJLHOWZ8R9GHdtW947Cfb/SpZEaMtWUKkWyAEDoMoolt2Qzk4DIs
	ZqiNtSqHMtFcfb0sKEXJMdlRS9zzw3Lgs/Oc/1SE/HwvTRwyoQBQkm2pvXAics0JiwXVPsHj6wUmW
	J+43r0skofTrzmI2xO+gNSAnfet69lQXAfzSHg+NIUkd9O9Mn2zlpKwSvWO8uzxn6+YhlGLFgDlbv
	Yw1Wcs9mltoEV4o2978R7VmocO0msyUzIskHdBeDAXep3LdM1tl9XlnDkKmyLa9AWMDKC1JeY+LDg
	dNZM0nzpss525BScQRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSMW-0000000CztJ-1RKD;
	Thu, 15 Jan 2026 18:46:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSMR-0000000CzsO-12is
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 18:46:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42fbc305914so824450f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 10:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768502781; x=1769107581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y01hcEYTZNFeQclPQMnDmXUrt0mXOtnGHL4WtYQ+0+U=;
        b=U9tve7EEXdvHLfJCxF5+OEi6hbqLpDTTA/x1far5UickilGqpF+kmwaAIuvtlsPxCj
         m57mKffshF+to8TH7R1jld9/LenAQLetuBo+x9frsrojxP2JZ1N1NiRFo6jrKmGHuKFt
         EZGlw1ezHsvqbNGW6i17+ouM2wIBGxpy7hyK5R/KpwahhQHu6yGi1476rfu0FJJrYZeI
         u4qAvhUBhnWEVPt6I1xL9a1mT2Bo5WCX4n/cpYAk+aPECA1Y1N8jzsJqhdySjne8fG9B
         ca+JZbYVzJUr3uQ/k5vp99pqkLdHoFRrFwA6QPl8YKZKnluNdorR2qzQ1FqUX4u3HpED
         aL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502781; x=1769107581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y01hcEYTZNFeQclPQMnDmXUrt0mXOtnGHL4WtYQ+0+U=;
        b=NUcsd5jxYY5KqO6tn2cj/+Anxz8/7cFzZUVRpdo6TM0UxijninZ1JRDFqhAKz55cfa
         9IKq/G/+LLw0oRZCdVi6xrGxvwqisYMQzp+jz9P3EZ+0Q5NcnqP1Z0v4K1Wd0Wef4s1X
         InRpgVWll+lgYMTBwK29cTuawFbHoqT/WxDeV6aX3L8abFU4McnRPep30RkEN7SPymsV
         i3d3e2RqkE9QJ01OFhpJLufNOy3Lfng0Jg4yGppZlU99PkjuAG1Bpj9lbbwOpcT+WaXD
         S+12efHgVJuXS4j0TgeE9PkP+UNnuS1clBFg7FaL+F7Xlsb1EtQL1fWUmTZyUSoSjKVR
         TBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVghyIgP8xCZjLReUyV1Ovq9bS6LPJSUbkDBoRSYYIWJS1mW4xpv0jWUsfHkEBETDrPglFwY+LF6aPMwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlOUSljVJ4yattjl7SkkZo49tMW9+6yBUh6jwNU3I15uTvQtYZ
	hVJdbIOiPe3XP9lQWyL84IWAfPYncx1z2XlnNpGf2j5fZ1ESLjWvw6Vc
X-Gm-Gg: AY/fxX6RhXbE6ByaPm7OXVMhUoQ/w9hG0r9KckSG48i5z6RL9Ik1O1N8ycQBe5FHkaf
	GEPvTaMGWMVYPZxCgFyNGrSw/5rJQaMvRPMtPzvxKJWl++CaLdMeS1Z3iR/pSmjNzTEZwAPGF9N
	G/HfvwJlTUAnG0Cj9oi0QayQQELdcRPeHajXS0PpSkoa72VMZeoQvav2ng4UAt4oMS5J7mHAKM+
	j6cxt8khMYbdsgPp0VwfuQWh47Z2gk04zMj/PsjImVOp696/yIqQzs/qdaEQbRL8SDwyplHaT5o
	17WFlV71EBBFrs86Hs3cnrYla6xF7kS4MXjPVnFyG9+O+ABg97FcIZW9ysu/8fwj4tFbObef7zO
	NmCQH6+X8Xiw+nhymRBkU7tgkqUaS51HOSmCmW3DY1ULY81mkPaf2WpDyS2+F6M9gt4aT28xAuI
	VwSCsvJMfHJWDMT3PMZX2DmTsdLOOimwykelbz5ubOmnEv08RFw6qP
X-Received: by 2002:a05:6000:200f:b0:432:c0b8:ee58 with SMTP id ffacd0b85a97d-435699173f5mr400692f8f.0.1768502781108;
        Thu, 15 Jan 2026 10:46:21 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm488913f8f.31.2026.01.15.10.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:46:20 -0800 (PST)
Date: Thu, 15 Jan 2026 18:46:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Feng Jiang <jiangfeng@kylinos.cn>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
 charlie@rivosinc.com, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: lib: optimize strlen loop efficiency
Message-ID: <20260115184619.574f1b36@pumpkin>
In-Reply-To: <20260115111947.54929ed0@pumpkin>
References: <20251218032614.57356-1-jiangfeng@kylinos.cn>
	<d356705a-843c-06dc-38a3-77eae7d2ef59@kernel.org>
	<20260115111947.54929ed0@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_104625_353014_BDBCBD0F 
X-CRM114-Status: GOOD (  17.46  )
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

On Thu, 15 Jan 2026 11:19:47 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> For 64bit you can do a lot better (in C) by loading 64bit words and doing
> the correct 'shift and mask' sequence to detect a zero byte.
> It usually isn't worth in for 32bit.
> 
> Does need to handle a mis-aligned base - eg by masking the bits off
> the base pointer and or'ing in non-zero values to the value read from
> the base pointer.
> 
> 	David

The version below seems to work https://www.godbolt.org/z/sME3Ts6vW
It actually looks ok for x86-32, the loop is 8 instructions plus the branch
but the 'register dependency chain' is only 4 instructions.
So maybe better than byte compares for moderate to long strings.
(Especially if the cpu starts speculatively executing the next loop
iteration.)

The OPTIMIZER_HIDE_VAR() helps a lot on (eg) MIPS-64 and a bit elsewhere
since most 64bit cpu can't load 64bit immediates.

I can't get gcc and clang to reliably have a loop with a conditional
jump at the bottom, especially with an unconditional jump into the
loop (to remove the '| mask' from the loop body).

Also KASAN (or one of its friends) wont like the code reading entire
words that hold the string.

And it does need ffs/clz instructions - or a different loop bottom.
(For BE one with clzl() returning 0 will work.) 

While I suspect the per-byte cost is 'two bytes/clock' on x86-64
the fixed cost may move the break-even point above the length of the
average strlen() in the kernel.
Of course, x86 probably falls back to 'rep scasb' at (maybe)
(40 + 2n) clocks for 'n' bytes.
A carefully written slightly unrolled asm loop might manage one
byte per clock!
I could spend weeks benchmarking different versions.

	David

#define OPTIMIZER_HIDE_VAR(var)                                         \
        __asm__ ("" : "=r" (var) : "0" (var))

/* Set BE to test big-endian on little-endian.
 * For real BE either do a byteswapping read or use the BE code. */
#ifdef BE
#define SWP(x) __builtin_bswap64(x)
#define SHIFT <<
#else
#define SWP(x) (x)
#define SHIFT >>
#endif

unsigned long my_strlen(const char *s)
{
        unsigned int off = (unsigned long)s % sizeof (long);
        const unsigned long *p = (void *)(s - off);
        unsigned long val;
        unsigned long mask;
        unsigned long ones = 0x01010101;
        /* Force the compiler to generate the related constants sanely. */
        OPTIMIZER_HIDE_VAR(ones);
        ones |= ones << 16 << 16;

        mask = ((~0ul SHIFT 8) SHIFT 8 * (sizeof (long) - 1 - off));
        do {
                val = SWP(*p++) | mask;
                mask = (val - ones) & ~val & ones << 7;
        } while (!mask);

#ifdef BE
        off = __builtin_clzl(mask);
        /* Correct for "...\x01" */
        val <<= off;
        for (off /= 8; val > (~0ul >> 8); off++)
                val <<= 8;
#else
        off = (__builtin_ffsl(mask) - 1)/8;
#endif

        return (const char *)(p - 1) + off - s;
}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
