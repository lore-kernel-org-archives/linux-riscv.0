Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4326C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 23:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FwlN7krWfyQsb/6nGc5l7gPMkacqXTHUIri7prJsPk4=; b=lbILc0jjlmLLRhME6Z2d8sPnwu
	2Jge08q73Zkt6VyKrjbuozAJsYsn4J/mwuwy3b1VLV771AWB+7CcgwV5ASxEQ2PP1W1p3Xk7O2y9G
	5CFBiLSeNBe4bAaE0qeDz5XeQp2N3uX10Ags9NMRv1kPga1gYd2yjQ7u+3GxgwGvoBCRSBXXO7YVt
	bFEEtHaBugIKb1zP1FdoAdwok2WQf0gs/PIF99VwUcPVlsKDrVLXsodzWHcPbP/oS1l26NN1wPo2/
	1L1aNjnQRgG0wOSDtr3O0GkIIrVa/H8j9LN21b49qzI4OhCpqKRJho4NgIT+++wNs4e/ELRRKZY3W
	roWnIjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZKdB-00FWW0-M4; Mon, 06 Mar 2023 23:52:37 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZKd4-00FWUm-4d
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 23:52:32 +0000
Received: by mail-pf1-x433.google.com with SMTP id b20so6993965pfo.6
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 15:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678146748;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jz3wFNkjF7LXABjUJBcGMj80WDbOlcRgJbsy9urZHOw=;
        b=b1slkWsL9CSBhAfpckVrfNeYXsMtkTaqz4NO52rXSH/OP72Zd9YF6vN6QxjzWEoo43
         1gGnFa3ahKVbaoxaseTz8kdfyHxT7P5tQa0/omoVpyarcWQJ0z40/mzu+pkkVfnTMpDr
         RlB/IoWSLQqWc1cEpUJHMjb7sNkDYANC/z1VLcCJufzfDrsmrKrg+jLU005bRYNOtCd7
         DpxdeYsKH32GMKLePVxbRzdxKIfNJRIyGVXbZBpjKoU1sE6U0QrE4NCAOa/HYjE712BE
         L4Ciz1Nk193bQsfXPTzgkGS410MxUixGISg/9ldxVB1itm+iyHiAZ4k36ueB++IToWfc
         JqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678146748;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jz3wFNkjF7LXABjUJBcGMj80WDbOlcRgJbsy9urZHOw=;
        b=xRheh2682DC89BXcIBYjBkzqo/nxMpMB2cPc6NRibcZMYRiSz9qVzI9NC9KOAk5DtQ
         wBMXVYMWtWZiS79zexrS9BQuVYP57as0ZGIRkjMCKkgxAXNTM5473RbNI64hhMiv3DKr
         5sCYnOXeh4xpxRga0Q87W/MlViRk/lWvFw/hKvryyJeGp7JUdgNW45w9lZvXhcxRrS2M
         v4riOe5CxO1Wu+plYcNxkMXKmh0C5YcIh7QJY8gbyNGsEMvxyne8FrNR/WGFLWtCBmuq
         Pv9rWJj7gOZMcUU/82RumBIfner3N4K3DnyFN7JHh3XBBGB+xfQdOfDuw78ygTCxnm7h
         NPxw==
X-Gm-Message-State: AO0yUKUiHYrsBQVSJxS46S/vYwKkYMKPfC5o6wqUNgGVifL0J0Pfg+38
	epPlsK7GP6rfGvDFpK2PGyJZm4EP/Rjgdbf9Pzw=
X-Google-Smtp-Source: AK7set8NzrQKsRckvFBxs/m0fs4f7x8C8j0v425ppkkJT8FxVnX6zFKiOuSesFUlDe6SQLGBehG/ew==
X-Received: by 2002:a62:5253:0:b0:5a8:4bfb:6bee with SMTP id g80-20020a625253000000b005a84bfb6beemr9462483pfb.9.1678146748111;
        Mon, 06 Mar 2023 15:52:28 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j19-20020a62e913000000b005ae02dc5b94sm6794462pfh.219.2023.03.06.15.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 15:52:27 -0800 (PST)
Date: Mon, 06 Mar 2023 15:52:27 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 15:51:36 PST (-0800)
Subject: Re: [PATCH v1 1/2] RISC-V: move zicsr/zifencei spec version check to Kconfig
In-Reply-To: <Y/jtGRrBfKxO6s0c@spud>
CC: nathan@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
  naresh.kamboju@linaro.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-5ec23642-a554-4e02-82bc-3a138a50d3ce@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_155230_422128_57101B7F 
X-CRM114-Status: GOOD (  20.16  )
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

On Fri, 24 Feb 2023 09:00:09 PST (-0800), Conor Dooley wrote:
> On Fri, Feb 24, 2023 at 09:37:28AM -0700, Nathan Chancellor wrote:
>> On Thu, Feb 23, 2023 at 10:05:45PM +0000, Conor Dooley wrote:
>
>> > ---
>> >  arch/riscv/Kconfig  | 10 ++++++++++
>> >  arch/riscv/Makefile |  5 +----
>> >  2 files changed, 11 insertions(+), 4 deletions(-)
>> > 
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index cebf0c5f8824..4eb0ef8314b3 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -288,6 +288,16 @@ config ARCH_RV64I
>> >  
>> >  endchoice
>> >  
>> > +config TOOLCHAIN_NEEDS_SPEC_20191213
>> 
>> This symbol's name is a little confusing to me, how does the toolchain
>> need spec version 20191213. Maybe 'SPEC_20191213' should be something
>> like 'EXPLICIT_ZICSR_ZIFENCEI'? Otherwise, maybe it should be something
>> like 'TOOLCHAIN_HAS_DEFAULT_SPEC_20191213'? Sorry for the bikeshed but I
>> think most Kconfig symbols should be self describing.
>
> Yah I can do that. I actually had this as the DEFAULT_SPEC variant
> before and changed it - I'll switch it to the EXPLICIT one.
> Thanks for taking a look Nathan :)

Another option here would be to use the `-misa-spec` argument for GCC, 
to make it match LLVM's spec version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
