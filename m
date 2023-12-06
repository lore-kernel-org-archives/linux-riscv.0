Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A70C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 13:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZHRnZKtV3KSKlI8jjTlErlHrjMzC2Z7SLHi5WRzOQis=; b=UXSpNPw/4JTU3E0lQ5pHRIKyHe
	OvZOukmivfdw8tyqbQxy8+dDbIALtlokw3OzAGJ8Ef6k7b7fSWLbEyOgNWzC3yMsI7JDyf3ESAIU1
	+BDAgWlQLUGvGco45VjPNK6el2RBtF6eUX7A28X425aafpWjoKrsQ+3E603/TXwjYrl/YLbEUMDYe
	L98ISiMWkIju3cm3F77PQZvpoeRP3owFkYvOmoS7Su4Up6fr3HE4HLF5gKP4GYHCcbJmaUfg5Fub0
	fofW4Tj0eW2NChPvETx5++U0AgJf++vK+o5VOEDzUgGSFEYkCqTr+U+A8lBoyt+sd5loc0AAf02Ja
	JeKxlkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rArbA-00AM03-0G;
	Wed, 06 Dec 2023 13:05:56 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rArb6-00ALzE-3C
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 13:05:54 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b837d974ecso4385639b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 05:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1701867949; x=1702472749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzgbFdAZtuGUcSvqWCnnqwHA8w3xAQKY5QSWn1ivO1Q=;
        b=DD6xLm/Mf6cNfBS+0Rn1KNabUZ9jg8JNXh+vPiq85ECeZjIJBVXDRKRVNIsWxB5WxI
         xHrJ0Dxdz0WFxZtWDOIGXhsFevfwXpu9q1MPVr9w/tjqsFEabT46MIhnYJ69cugcCNbU
         XQCzoiakYsjh92PFP97wSythEu4NVEft2kV4pKHn90XW9xq80916Dr1qU8TCzZ7LM20p
         ECGdEBY6lrebu/1fbgM3fUIiKYuNVas2tgNgctknNloL8BlDdNCW5fH9JfGL9b/G9uHw
         8/wdErRQyapqwwguCaWqA719xPfs66+Xw/KY3QF7Tm8GoY/WP3trgNpqvZEcR4njee3K
         A2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701867949; x=1702472749;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzgbFdAZtuGUcSvqWCnnqwHA8w3xAQKY5QSWn1ivO1Q=;
        b=G7dB/2MkBXLBTXZ9TnlLscMPaml4IsbcNiiw4SDXv/uU9cMQ29It/nokHJ14MbxXTp
         dE2dt6cJ3fuBbacIVYdhcbXY97jOrhzkRrErecFudatDaBHeVURwd3GJlA9CU9EB1/ND
         zqvfx7MxuB0TgKPXLDURZhoJ0PnaV4ihUUm33zEr/iSVLZTPziCpTUq+4OExKAN6n+fF
         mUcJPa4yfm/TxLc/n1wAZE7zIzYZLd8OImpT+NHd5Keyaww84awD8bSvS3xcHD24+12C
         aGgV101NdMepmHEVHW1tfeh47F6038x44gvR1yQaj3g7zm/f4tnKyIl/guuUH0EjoQqj
         pqKg==
X-Gm-Message-State: AOJu0YxNUwhxRHH3EpxhC33lEYIFRhV9ZjHRmTaFlx/bzn4zO9CX0NTG
	AL8xhemRbuQF6dWENbUqKKanAg==
X-Google-Smtp-Source: AGHT+IEhjyYkjdko17Yv1eA2AphNCktXFKRI2cyiBKG8GmugvSo4jvEZ3+HFE5q1wXyxbk+tyJpYhw==
X-Received: by 2002:a05:6870:9e82:b0:1fa:df52:beb4 with SMTP id pu2-20020a0568709e8200b001fadf52beb4mr1148224oab.32.1701867949085;
        Wed, 06 Dec 2023 05:05:49 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id gy26-20020a056870289a00b001fb3240116bsm2094303oab.7.2023.12.06.05.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:05:48 -0800 (PST)
Date: Wed, 06 Dec 2023 05:05:48 -0800 (PST)
X-Google-Original-Date: Wed, 06 Dec 2023 05:05:46 PST (-0800)
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
In-Reply-To: <ZWe+ljzCUQQVu7oD@andrea>
CC: mathieu.desnoyers@efficios.com, paulmck@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
  charlie@rivosinc.com, rehn@rivosinc.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: parri.andrea@gmail.com
Message-ID: <mhng-40f43849-e610-410b-92b5-7571838ce9f5@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_050553_033748_37CF931F 
X-CRM114-Status: GOOD (  19.16  )
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

On Wed, 29 Nov 2023 14:43:34 PST (-0800), parri.andrea@gmail.com wrote:
>> > So I should probably stick to 93917ad50972, which apparently selected
>> > CONFIG_MEMBARRIER on RISC-V, for the Fixes: tag in question.
>>
>> I think it goes further than that, because you can explicitly
>> CONFIG_MEMBARRIER=y, see init/Kconfig:
>>
>> config MEMBARRIER
>>         bool "Enable membarrier() system call" if EXPERT
>>         default y
>>         help
>>           Enable the membarrier() system call that allows issuing memory
>>           barriers across all running threads, which can be used to distribute
>>           the cost of user-space memory barriers asymmetrically by transforming
>>           pairs of memory barriers into pairs consisting of membarrier() and a
>>           compiler barrier.
>>
>>           If unsure, say Y.
>>
>> Before 1464d00b27b2, riscv just happened to set it to =n in the defconfig.
>>
>> I suspect the initial port of riscv merged after v4.14 was already broken.
>
> I see.  Oh well, guess I'll have to leave this up to the maintainers then
> (I believe I've never managed to build riscv that far), Palmer?

I see

$ git grep "config MEMBARRIER" fab957c11efe2f405e08b9f0d080524bc2631428
fab957c11efe2f405e08b9f0d080524bc2631428:init/Kconfig:config MEMBARRIER

so IMO this is just one of those forever bugs.  So I'd lean towards

    Fixes: fab957c11efe ("RISC-V: Atomic and Locking Code")

(or anything in that original patch set).  It's not that big of a 
backport, so I think it's safe enough?

>> > I'll look into adding the membarrier feature you mention (as a final/
>> > follow-up patch), unless you or someone else want to take care of it.
>>
>> I'll be happy to review it :)
>
> Sweet!  :-)
>
>   Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
