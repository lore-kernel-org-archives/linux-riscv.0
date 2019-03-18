Return-Path: <SRS0=/XvO=RV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B7FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2019 16:13:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37DF02087E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2019 16:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sMItAKxd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nw5HVSyW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37DF02087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYVLNup9i4/2ev62S9BH/b9vR2SKkosFMLPYtAQMGsM=; b=sMItAKxdvUfhDP
	0Jho1PSx8yewuWK1fZRDX+uWX2VZoNtosm2JBLlzFMyvtzUvvyHoi5OZ/30jhxQvYxQ6buscDjzvd
	+RK91V1E4vI2Tpb4XOWPcaEOw91nvHmyIqECQvvAnXfz8xm9UeK0cHQemCyoP9yLVyagSyt4zPcrN
	KSyfZpFIN15dQYZsWI+jkAQEFLQHcaWxy7ErV1jERAzEgMU8b2vu4YKg3GLMFq+Nu+GxUJlXWbvxL
	skTEdkNzmlNC/IS+yHJeEUbFkPVEqprqsl2EwgxLwZu5eIlDwYZiMwuFsHGE3M9pKrKhXIs/Bx9AZ
	hwS0SY8wPfMQFoXLOREA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5usq-0005sg-Vh; Mon, 18 Mar 2019 16:13:04 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5usk-0005rn-DS
 for linux-riscv@lists.infradead.org; Mon, 18 Mar 2019 16:13:03 +0000
Received: by mail-it1-x141.google.com with SMTP id m137so5748545ita.0
 for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2019 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=IraHUDTEtuXM/Ec1wSzEQgIe4yar1F8UWczeCKwsQg4=;
 b=nw5HVSyWNFxDeDlw6HKZJe0Npjv72G/WEgGt4HElzn8bUnoYiTtHLwzuArWkMoGNht
 jeAnwGk8UmUyxwO3kLlz15QsEAHVyG/VUvU2LWZNvLj3GZUUAF4GEfnlc4s53vVGnzdu
 i8oqwb6C8Xw8VYMfuJ15vjeqoSX8fuvueIb/YvBmBefM7Yc6jiGlpLwnjh2wPWB9sTy9
 Vv95Vig58teA3BwjOFtP7m7oB3jObTW+lggIakvo1qIzL9cvbQtT7SuyW8/Y0NHsipur
 fCepMQjNkDEM86BpnL7wkyjrYHtEfSasDPCL8QZhxyv8ERk1HzEB+ayG9J9MJA72HzZE
 yDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=IraHUDTEtuXM/Ec1wSzEQgIe4yar1F8UWczeCKwsQg4=;
 b=LpuPT+MTLH1aNEBCgp4fmIUDe+ujhsKlyc8e9MVxIvH4+3uWQMSbD9HJdn5sbX7RF4
 a0+3vGvh8LOaNOVsNFfY0NUi8ub8X+iGm+u9V3J51FruS242CmMKA5u9B/38qUJ8MS8f
 zqfxUFqUVEFNkUzqycQkaDTdtDzGcJAbDdF5AbyOiMXNgX/h8FNIHxbfysvTxWyZ9RuY
 2h4oaAyc9aqJn4D8PNfAdeDK8kgoPwFAFSqN1F51oSpnAgIW/6JmfGy5YkspgRRrM+si
 JMfwhZveO+sT92JNjDeO2q5mlwsubL6E1XTxvXfb/a38xftw5d2wBycOGjNmI0wMgEWH
 Jt1w==
X-Gm-Message-State: APjAAAXJ6Y4IuEc+j2TwLq7Fkm2ezSk+J5EJ7kkNt8+9ww2/sCGz0Lm5
 +K3VK/q2u4nabinpC0PEXeU/KA==
X-Google-Smtp-Source: APXvYqz3CBWVgcMAaq2JevnJzs33yhBPnw5bqm8+2q0HxzbNa+r16m3Z5NvkY60J1SsIEqLThJtmAQ==
X-Received: by 2002:a02:8c3:: with SMTP id 186mr11964145jac.69.1552925576491; 
 Mon, 18 Mar 2019 09:12:56 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 a77sm311450itc.5.2019.03.18.09.12.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Mar 2019 09:12:55 -0700 (PDT)
Date: Mon, 18 Mar 2019 09:12:55 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH 3/3] RISC-V: Allow booting kernel from any 4KB aligned
 address
In-Reply-To: <20190318071829.GF21385@rapoport-lnx>
Message-ID: <alpine.DEB.2.21.9999.1903180906560.25529@viisi.sifive.com>
References: <20190312220752.128141-1-anup.patel@wdc.com>
 <20190312220752.128141-4-anup.patel@wdc.com>
 <20190313183121.GB28630@rapoport-lnx>
 <CAAhSdy1mrV2CakS0cfOY8F1B7uH_yXjO3W-CiMUcYonkRnVbeQ@mail.gmail.com>
 <20190314065311.GC24380@rapoport-lnx>
 <CAAhSdy2uEgyvs=5NdoZ3H208qeDGJ9OrTOeaz6HQ+1va+R3dUA@mail.gmail.com>
 <20190315155828.GB920@rapoport-lnx>
 <CAAhSdy0HoTTccyy203Y9m3kdAjCOzjjMdrb670huU71pjOMw4A@mail.gmail.com>
 <CAAhSdy0D6JpySExCG7ziSSDmQ_88=paiMwjjXTTR1gbKCEOs3g@mail.gmail.com>
 <20190318071829.GF21385@rapoport-lnx>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_091258_484416_B2BC6AAC 
X-CRM114-Status: GOOD (  14.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup@brainfault.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 Mar 2019, Mike Rapoport wrote:

> On Sat, Mar 16, 2019 at 04:55:30AM +0530, Anup Patel wrote:
> 
> > We started exploring ways to re-claim memory below kernel because
> > we are trying to get Linux working on Kendryte K210 board
> > (https://kendryte.com/). This board has dual-core 64bit RISC-V but it
> > only has 8MB RAM.
> 
> Huh, 8MB of RAM is tough...
> 
> It is possible to use the memory below the kernel, e.g x86-64 does that.
> But it is definitely a separate change and with such RAM diet using 4K
> pages seems unavoidable.
> 
> I still have concern about using 4K pages whenever the load address is not
> 2M (4M) aligned. People tend to not pay enough attention to such details
> and they would load the kernel at an arbitrary address and get the
> performance hit.
> 
> I think the default should remain as is and the ability to map the kernel
> with 4K pages (and use 4K aligned load address) should be a Kconfig option.

Agreed.  That Kconfig parameter should also be default-off.
  
Only a small number of people will try to run RISC-V Linux on a Kendryte 
board.  That niche use-case shouldn't impact the much larger group of 
people who will run Linux on more reasonably-sized systems.  No one should 
need to ask people to report their kernel load address whenever someone
reports a performance regression.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
