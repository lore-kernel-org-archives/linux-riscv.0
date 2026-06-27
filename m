Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F398C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 04:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7lVZV3dCWlh+1e53NkCmqeJwArv9tyWFTMJCI7B9+Q=; b=JX+dSnlWe7mWEg
	1VNkiYU2zYm9my4JZaPHugVJwWtQ8q22hf6z7gl6wWxkDrzrSxwMj6MNcYLMmhHSzxMWDypNGDGcf
	9bQEIWDDMpV/f9IkXW7rBEqRfyXSjBBQyg5nwX/7pgCICEyGBnXVdagKlmXmRgbb8OJkdnZorDr3S
	n9aHUFIkSJZx8Jt+43QAsUuOTnG5IAIAULgsx2YFNth2wjCucMg0R6JOqJYpXgIIft6uh+/+qAlG7
	OABFJ1ldZfFGJ4CyOcYc9p1AHKGdzdNHwT8vTokFSXtYo8UfOny0Mpqrivq6y8yqEhORakHLstle2
	ryIIbo+9sUQKjnKGhrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdKYA-0000000C8G0-1L24;
	Sat, 27 Jun 2026 04:21:50 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdKY8-0000000C8Fd-1Wzp
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 04:21:49 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-13986d61b4fso2312096c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 21:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782534107; x=1783138907; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr3PFaTd/nDXhKeEw2n8nUQiVST0MxAy9zKbi62iLqU=;
        b=d4HWjV0ZBuHP7OhYfWXRQ7CCc6crZ6lp0ZUDymwyU/VCD19kYk9X4bk7qlpeW50vkn
         SJKuBzoS6mtMyqi+Z4xsRRxqSd04lF9cvqZ7d4P52MvIAeH1WoP68+JtbqjpqnyEffav
         LXjwBbKWVvymnVZNM1Ya9zmdqBgcsgcYraPSOt9DVi9Q3inJNc23xrc5KRl1bmPYcPgu
         pztQX5pStECbPA1XFM/k65xUjNR/sHHOVO4VQaPkzN4+yacT8lDSzp1hSKcN/c50dlrL
         5ZrEMgyJbhUE2uw0xvz59FeOqUlWAFK4aAsk4xnCFluNBEn7bi+orL9vfmWgapJeU8rD
         icNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782534107; x=1783138907;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mr3PFaTd/nDXhKeEw2n8nUQiVST0MxAy9zKbi62iLqU=;
        b=hQD5MTmHcv5jq/E5jzcrWxuQwgvzMZxMb7MmzSXabHiM8+c1GKx4xWnFnFswlvrlrr
         78KQQVoj1G7PYWERrVNwXeZXD5CkEI0ZvwmGW459xj6AHwCJv7/tCJU9pnwrPYfDQjWC
         LqIbNS7gcVALqw0r+jAF3feE/nKlSSqkAMZv8cc+fT8hXtGUpPRyN/G6g/WSwCiuQ3Pe
         fjU4+pYN5ToiapZdFy2MsEZLlwQIGv2fqTmQfqwWXLA3a799LHKc+kHy2OxccIQEpNiA
         xJ7+RcbmfSidqJcHsoBQsP2yZtZ9Sp6To7uEwZ1fnGKdyTrRquQPH/TfAaVE7HaxWDOe
         jKQw==
X-Forwarded-Encrypted: i=1; AFNElJ+XC7PhkEJBOs9BwQM1SuTRmEC3IfzNWYhqvo7BNbsKYYQgNvUc5FxczKQkUu/pWVAC+7u6NjeH7JpPUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSbgojSQHz9TL73Wjq4z47yH3ICMJhgfdqf1zMYyl9jKSgY1EC
	QaPVUlFOaIpEI5MJS4j2LxqZsahwad7BfMlImsdApu/SPApGKpohgZD9
X-Gm-Gg: AfdE7ckdxree2RzdJrX7AnwndxXr7vsuiXqEwtn+hIg7qQk7IAByMaRR95nFJjdc0LM
	fLp2SIApYeQFysUcNSnquwNn6lDSHrInZvYuUmqZLHXPMFuoo+Fm928zAPX2wjtjgnl2/BHqq2S
	43XLpqt/hlalbOJ2DdY5TQE53SdXSYFpogiHV36oalGqtIv0iUPI30nB802N3Km/v4LA+GmL48w
	L/qgepJ6gTsmMsru0dy1l7AoyVNGuJKG0b3GrHp6gVi0R+BPBBhTjoxEnr4H9lIFbPv8K6c2ttb
	mD5Gzp8GXMOeh0GnjyLg32KLvgEhMz1GoZf4xqPSJeJASkk/PKjslTk0nBZV55n8z3ZkhKA3T3k
	PmAimTlb1a3xfhnOOt+hU4t3EPto2qizBBtq+BaQZsgw0nqfBdKSPVqYCaCnlBn1pkq9SimleMu
	z7YtBj/pI=
X-Received: by 2002:a05:7022:e14:b0:139:ed5c:7692 with SMTP id a92af1059eb24-139ed5c88dfmr2027442c88.43.1782534106826;
        Fri, 26 Jun 2026 21:21:46 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d91006afsm28730439c88.12.2026.06.26.21.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 21:21:46 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v4] riscv: probes: simulate c.jal instruction
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 namcao@linutronix.de, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260627001939.3847-1-xiaofengmian@163.com>
References: <20260627001939.3847-1-xiaofengmian@163.com>
Date: Fri, 26 Jun 2026 21:21:36 -0700
Message-Id: <178253409654.105999.9483335947060007692.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782534105; l=804;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=OgiTpN3S6QiD22ePY29LOWmRDwT4nWXWhK2UCjhYTjk=;
 b=fdwxMBFfPKLwO0IfmTq8Mid0vEOt7312/UOpFwtzhpVWh9tM+XinOqDJ+iQAxi7x0JuYcCuVS
 6n/wEMdNc3IDbqZ95MAiaVHQdwJMazHKn6cYXuaw0Ui4juPKja+ilZi
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_212148_449318_52BD2854 
X-CRM114-Status: UNSURE (   9.05  )
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

On Sat, 27 Jun 2026 00:19:39 +0000, Xiaofeng Yuan <xiaofengmian@163.com> wrote:
> The c.jal instruction is currently marked REJECTED in kprobes
> instruction decoding, but it should be SIMULATED like other
> compressed jump instructions.
> 
> Add simulate_c_jal() which saves the return address to RA and
> sets the program counter to the target offset, reusing
> simulate_c_j for the common jump logic.

I was looking at this recently trying to figure out why this hadn't been
implemented and couldn't determine why this one was special, it might be
because it is 32-bit only. Since it is 32-bit only, can you put ifdefs
around it for riscv32 (#if __riscv_xlen == 32) ?

Can you also add a test case to:
arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S?

- Charlie

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
