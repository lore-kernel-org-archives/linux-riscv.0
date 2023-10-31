Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6657C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 02:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPrd04Lsf9Ku13R9FyX6B8/Dk/TN/P/Ve5EiXeZO1f4=; b=mcKVQJbb+GZUT9
	vPRK0VAxnzqRbJkI3FtRWaVGRTHNCgybcIGQ0hOkr8D7psQahOEVdnDKFhscRLjnIUVFlrU9ujUDK
	eCtcG/SC8xyOb6s18+TPCmPgGo9V6ZBKkZ1JfNZVHqqFzph8Ims+fdnUefPtDtnPkgW7XJ9nMG0bU
	bGoxuh2AX5bQE75g5JoDEnVdQMoiSJLkYbP3uM5XLmt3SwDa0+rHPBQjIcHH7PeNHY4oyFiJnY9Ja
	POEKdPGqIE/V5L0ciAKgtgWVzfNKixgadpVbVud9FJsItN8Rm8aeX6jtEnBXR+M+7aAau49psP45B
	FOYlESljuPp09uDD/ltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxeJm-004Pcv-33;
	Tue, 31 Oct 2023 02:17:22 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxeJk-004PcY-12
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 02:17:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-28094a3b760so655728a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 19:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698718639; x=1699323439; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FYXELKOgFv1uqwcp59pbFz1ZZ95RxWQk/gFtrN2AhA=;
        b=MoBMmC7Ca9GJbFhHUhiNDMnc7tp8274Q0mb0sk1spc6q0dp71JYjNXvmherxEOCxYx
         Wi9F7D1UMz0rtBjtOCn2DtpAcgs03BxbYVZT3gVjx3qow/LiO78548lAqwZEAqFLQ5Lg
         Ke5TASFQgTMAoZdKc3XItfT4F4YLB+7LK0vNaP0Hge5NRC/nUc+0jzRKXm6eBhW/SUN3
         ti3MkZDO0cF+PABdYS52p3l4qsNYvsiNMXDD9oh9S8gxOaJkbainy+EdrhXIScya2dx4
         4LxhD5Zx6ssOrp7b/4OYwWB/iedxs8EIyrEVvjo5xMcrdlwhYww4PWizwC+176L708gw
         0Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698718639; x=1699323439;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FYXELKOgFv1uqwcp59pbFz1ZZ95RxWQk/gFtrN2AhA=;
        b=RKA6Tg2XOUC6+qO2+ejQGD5fVMsFEzZaoMSxiS4U/5kBnkSXty4sTvAVWnH+RwbBZj
         U5ed6ncG+UuMHfB0Ms5yDMwmirrSaeD7yIaAbGsCZackFOlPW515zetgcBVtDjshPxBg
         lbKquMvAwUROlCP57o8Y5BmCDIo22jTQNKoXBfrpOodC6XPkTLOLM6JhqIQs5ta/ofGJ
         0SIspuaTNxyqmu2Lj4B3C4joN2y0ccKMiujbQQ9B6gCdwGozEfyH/Ca0DDWw8p/rF8xA
         F6N9/9CX/Ab15bUeCwsiGPw/HMGSW/0fqBIyJD5rZZnr5Pl0pX57RDBmO9aRlU7PjH56
         G74w==
X-Gm-Message-State: AOJu0YyijsIEhwPvL9i0inhE6BCZPbbXLjBVyEMq/n6hVVwNm48VLZcP
	rLHZXMQrmAgMMSIg3tJbZcODzEoNOnO9uhdRTyJIIA==
X-Google-Smtp-Source: AGHT+IGJ28lY1cTChUE7onXf43JzC58/5Bp1fU+0G9i9fxk6B9LmIgoCIzVyIkzsla7jJzZ+dWFUiw==
X-Received: by 2002:a17:90a:7:b0:27c:fdc6:c52 with SMTP id 7-20020a17090a000700b0027cfdc60c52mr8199049pja.30.1698718638711;
        Mon, 30 Oct 2023 19:17:18 -0700 (PDT)
Received: from ?IPv6:2402:7500:5d5:c8ac:c44a:458:311d:fb2c? ([2402:7500:5d5:c8ac:c44a:458:311d:fb2c])
        by smtp.gmail.com with ESMTPSA id gq9-20020a17090b104900b002609cadc56esm133548pjb.11.2023.10.30.19.17.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Oct 2023 19:17:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231006194741.GA68531@google.com>
Date: Tue, 31 Oct 2023 10:17:11 +0800
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>,
 palmer@dabbelt.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 christoph.muellner@vrull.eu,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Message-Id: <AB98E114-A8DE-492E-B078-7394EE4FA83E@sifive.com>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230914001144.GA924@sol.localdomain> <ZQJdnCwf99Glggin@ghost>
 <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
 <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com>
 <20231006194741.GA68531@google.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_191720_402727_D3CA8414 
X-CRM114-Status: GOOD (  16.69  )
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
Reply-To: 20231006194741.GA68531@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Oct 7, 2023, at 03:47, Eric Biggers <ebiggers@kernel.org> wrote:
> On Fri, Sep 15, 2023 at 11:21:28AM +0800, Jerry Shih wrote:
>> On Sep 15, 2023, at 09:48, He-Jie Shih <bignose1007@gmail.com> wrote:
>> 
>> The OpenSSL PR is at [1].
>> And we are from SiFive.
>> 
>> -Jerry
>> 
>> [1]
>> https://github.com/openssl/openssl/pull/21923
> 
> Hi Jerry, I'm wondering if you have an update on this?  Do you need any help?

The RISC-V vector crypto OpenSSL pr[1] is merged.
And we also sent the vector-crypto patch based on Heiko's and OpenSSL
works.
Here is the link:
https://lore.kernel.org/all/20231025183644.8735-1-jerry.shih@sifive.com/

[1]
https://github.com/openssl/openssl/pull/21923

> I'm also wondering about riscv.pm and the choice of generating the crypto
> instructions from .words instead of using the assembler.  It makes it
> significantly harder to review the code, IMO.  Can we depend on assembler
> support for these instructions, or is that just not ready yet?
> 
> - Eric

There is no public assembler supports the vector-crypto asm mnemonics.
We should still use `opcode` for vector-crypto instructions. But we might
use asm for standard rvv parts.
In order to reuse the codes in OpenSSL as much as possible,  we still use
the `riscv.pm` for all standard rvv and vector-crypto instructions. If the asm
mnemonic is still a better approach,  I will `rewrite` all standard rvv parts
with asm mnemonics in next patch.

-Jerry



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
