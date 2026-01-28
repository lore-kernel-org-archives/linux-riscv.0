Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA29D46BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 18:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqxweN5WXQFtv7QQt47FBeaqPVAtwPb5DL2gW01LfxE=; b=mdcqtQ0rOydZ8x
	UPIATi13fJF+Cs61As3RPdmMkklM2SxP9bWDDfb2K7Tj0BxPVI5UbZBfbhWrNU6v1/k1In7mddfZV
	aSHUtCJk5sZFqPgfO5dZfofBdYv6U9QwAIDDnpW0SJGzPE69Lrd3yW38mhnRlk3aflB6aAjWPWTYD
	Ct2ap2CnYPfj/cOMa8bwbMwo2bMSKuQypMTHbeFPSQ4Iw2+EEPv/LVlyiXklLbkq52SefLuPsYG0t
	2z4XKzHgnhfpPALOm9XWdkbxEikkKBOT+3Y2gwU3PeZh5H4tQSqbUlEy8weiLvuUPAayqNNmpmU8A
	7Sdzx9fCpgo557Fav6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAkw-0000000Gel1-3jRh;
	Wed, 28 Jan 2026 18:59:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAku-0000000GekF-2rjK
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 18:59:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee0291921so1334485e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 10:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769626747; x=1770231547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JamM64RSSSNUgknQxElRWBW/Tc9C5G8ZEIUqJTiS1t4=;
        b=jmvqq5r6+QkT+Kb3WNgs4Mn6xzkMcCxwcfjJTdKQbWtyKPTxzfdKbbCEIra7cMQj6+
         bKKoH2YT0nhyS+Um6cBhUxW213v5FtLtYJrXC8uqE+Y+/L42uMdNkUxy5dFvLIEOps0x
         59aMHxWFJFh7RbxrGNyJawY/JxqVQPAjDQpZOu0UKopJQhAhfBBObBksIdy5o91KNKai
         3a8H7BnW/E/87+exx+0+ocW4ZFu/P9ca/niEd1bWctyL2Yoqoz5Yqwiz7SwUkWljSoPy
         HBvrTBZyO7efH4biW7lSH2yqZubZX/e/o/2O1NQvboqUw12B6XdYFYd2XUi+ZuY1yiNx
         eikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769626747; x=1770231547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JamM64RSSSNUgknQxElRWBW/Tc9C5G8ZEIUqJTiS1t4=;
        b=MRBHrvu85O1E+kYwZ5jH4/9kb4nBbxtItOgVOr1httvbkKpIMyfywnAop3+dYyd9eo
         fm4cx2qoslyIZPrrjj0bhD7e8FtjNk6uMwfIdFk6v0P3huVsinr+4b/6KZeFCQOj+nWP
         1jih9ynPaTzEEbV1rt7i01Eq77XYAUA/fqBGJqUoKZ5vdsWhO1UU74BjOPG5szZkS4CZ
         XPEpdufAvvMB3Bp6StOv9TAfBQJoIdt19+hBGfxEubAPRvgJMKxAp456ashMM/rv7OTH
         G8RQU2EmCfh4nLf6gzkZCTZHxh14wNiB9FGj+YXLJmvvV0i5tNg3UucuZ66xPOiEYFbi
         RFTw==
X-Forwarded-Encrypted: i=1; AJvYcCVzR6wjFrjuQYIt3++0gdDIJRzabwpTvIfudbz66zEjfcjwJzSAWmeUtuggBYWmVuYM81O71p2rmhYgzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwefwRNk7KOcrXdvMnBJVVJLNrlluzp+bsDFksTGbAKuaWjaleR
	FGM13ubpWabrt9lq/1rZZ+0hdPalKBDKvO7cf9jE0EzwfF2G6QUTLhoC
X-Gm-Gg: AZuq6aKT/0WmlX/z5qVMoILPfVPzNZo7PEGh9/IkfE1+H7DFWT9esn9qhXzizjfpxgd
	rk1+KyUOhf2YyULmeP05QtbW2PhYlDToOTfAnIU6/fL7wuKdbJo0MtlX0ZsVLUu8BCAUGGIIrUw
	g0vVjFsbPFJJL6TlTvc1TEkEjKF4kdPlgAynE+8vfK3CtXHNZ8OEiG6m0lt52Ci1SbngHtjOVGO
	T1ldZZgLgU602RG3MpLMUPzEitGiLN7ah4OACwkmmJNLNZpOG77UxyZkJSbHSv3eSpXuSp0ioTS
	pVlXWGc3BCd4o4KmZUGZ6CSYXL4v2D1jU3wIVFHQPhXkz+/ML5zpzuPV4FuzhMvKg+aW60nNjBb
	uzbGj/ZRs0TLmXGGHpbz03xMwhI3r9c28n0BgN2ufV2pojCzGM+NSU8Dv4dDYzFjFwOgdoU9I12
	CVZ6HRHf91uSwx9+iOB6CWx5kydYSbqXWrUYWKt3LOr7ELJLFzU5GA
X-Received: by 2002:a05:600c:608f:b0:480:68ed:1e73 with SMTP id 5b1f17b1804b1-48069cbf2bdmr64592595e9.36.1769626746306;
        Wed, 28 Jan 2026 10:59:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56490sm75659735e9.12.2026.01.28.10.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 10:59:05 -0800 (PST)
Date: Wed, 28 Jan 2026 18:59:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Feng Jiang <jiangfeng@kylinos.cn>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
 charlie@rivosinc.com, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: lib: optimize strlen loop efficiency
Message-ID: <20260128185904.5ec5c24e@pumpkin>
In-Reply-To: <20260115184619.574f1b36@pumpkin>
References: <20251218032614.57356-1-jiangfeng@kylinos.cn>
	<d356705a-843c-06dc-38a3-77eae7d2ef59@kernel.org>
	<20260115111947.54929ed0@pumpkin>
	<20260115184619.574f1b36@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_105908_765458_E020375B 
X-CRM114-Status: GOOD (  14.78  )
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

On Thu, 15 Jan 2026 18:46:19 +0000
David Laight <david.laight.linux@gmail.com> wrote:

... 
> While I suspect the per-byte cost is 'two bytes/clock' on x86-64
> the fixed cost may move the break-even point above the length of the
> average strlen() in the kernel.
> Of course, x86 probably falls back to 'rep scasb' at (maybe)
> (40 + 2n) clocks for 'n' bytes.
> A carefully written slightly unrolled asm loop might manage one
> byte per clock!
> I could spend weeks benchmarking different versions.

I've spent a quick half-hour...

On my zen-5 in userspace:

glibc's strlen() is showing the same fixed cost (50 clocks including overhead)
for sizes below (about) 100 bytes, for big buffers add 1 clock for ~50 bytes.
It must be using some simd instructions.

A simple:
	len = 0; while (s[len]) len++; return len;
loop is about 1 byte/clock, overhead ~25 clocks (probably the mostly one 'rdpmc'
instruction).
(Needs a barrier() to stop gcc converting it to a libc call.)

Unrolling the loop once:
	for (len = 0; s[len]; len += 2)
		if (!s[len + 1] return len + 1;
	return len;
actually runs twice as fast - so 2 bytes/clock.

Unrolling 4 times doesn't help, suddenly goes somewhat slower somewhere
between 128 and 256 bytes (to 1.5 bytes/clock).

The C 'longs' loop has an overhead of ~45 clocks and does 6 bytes/clock.
So the is better for buffers longer than 64 bytes.

The 'elephant in the room' is 'repne scasb'.
The fixed cost is some 150 clocks and the cost 3 clocks/byte.

I don't think any of the Intel cpu I have will do a 'one clock loop'.
I certainly failed to get one in the past when there was a data-dependency
between the iterations.

But I don't have anything modern (newest is an i7-7xxx) and I don't have
any old amd ones.
I needs to get a zen-1 (or 1a) and one of the Intel system that should be
cheap because they won't run win-11.

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
