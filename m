Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C964C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:05:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1046F61355
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1046F61355
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NSfR0fNtbdEJdexJcQ8XiLnPBKA0atRYptaSkbd2zPc=; b=kbqKv97pSIoYE8I7r0U70mgEd
	7kC0+LBDqMHpBclG70yOiTOV8rIWJC9d7IbhrR46r57LQhmeOL48M5XQj84DDssf9IhuBloqpgt31
	/GhznbBoD+FdTTn7DPldkLaFLQTFLgpsZCO3hh8o+ET7HMDcfBfNqqHcObvSBEtQ1bmiDzSnnJqR1
	py+BBV5MBLgWTyyglaC4rX9q+YGzJOb9Aw8TqOCfKwl0GDNan8n224UaV01SB2I+APwtorFkz8M70
	288lUv1cXkzOM6wHlMN/L0xJk4ZsNiDu/VXzulFi7uGgtMx3IDEKV0X4KB7SAcROXocoMuqHm7wfT
	K0CS6dCXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljFKY-002wh8-1M; Wed, 19 May 2021 06:05:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFKW-002wgs-Ky
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 06:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=p+XpRqw4dfP4ss+e2zahskjK4m9y8ZnIzEAB35uG9Ik=; b=ipG6PeZ+Olyrm7NnuuUZR66Ids
 fyAw0ksKM13TxgpbpUxU/mjt7eI9Z6AaIHfwFGdbBSgwOT6ZKvZ1phCAbQWchpp+Jh622OSlzWNXg
 a7rvEoKispJw+LbkDBqo9eXPzM+wEhvAf1x8g5vHScm704gdQFfMuV1uqy59FCqjg4vkKtJH5nQcN
 UM7K95nMFhtf65hTmZlbXbX+iefbOZczaz09BlzfKjKEmUWiDyLUfN7d/zzKJps+IZhBZfZ0N3dfl
 4qvgZ0aAp+pc3jCUrW2DiNMBYO/iI9P4Eo8wPlspEufDccVRNbQCwCg7J3yE7AxVbdlELuoCreMIz
 rRc4RISg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFKU-00FAY5-12
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 06:05:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E171613AE
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 06:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621404313;
 bh=Xwr5QpNNsC32N22bkt85qEAJwNFX8RrXNiNTTm93wus=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kcQhiZ9BBe8gjdEzlwZcHnMhmtCas71Aga6bxkQmMcZEQ7gZ3t0i05nXSz55Gjtn7
 ViOJzkMJNM37yOkUz9jGlDDu7g41vlC8LyQRu8OdaYQ+W9s+dUHWSWctXYKgWNS1ZD
 ewv4eKQiyGJbMeeP4jHCB/2jKglATyFDI68hCn3awXLdScWbTda9sBsCeh8Mb+gpn9
 aBalxBJrYQow0qfDQ3gUKV+6LpiaKYaFRIrpYWjiub9eA00XKtsE0tiSklRGd0dHGv
 CA/nFwOVVOmpYYPGmCbCh/zhjuiXOBSG/ltWkrxsnDJiI/SwlVQbZxEuNDfTG7FAIH
 49w4XUdqBbJIQ==
Received: by mail-lj1-f180.google.com with SMTP id e2so7883879ljk.4
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 23:05:13 -0700 (PDT)
X-Gm-Message-State: AOAM530AYxzt5UmNrqMpA2yjNPjg+IEYYrcSNhqwxjmbAclURTNtssJo
 VmTzmrzimigjvaiJar0eYOyHB1m0o65NPQ+vpTs=
X-Google-Smtp-Source: ABdhPJxS98EKiSh0CCfAv3lXvniOWIJpH2z4fy4wekWkqzlazYCilU9LFIurrbqZaH2bz1PaLXu13U1ljpl+sI6/SN0=
X-Received: by 2002:a2e:504f:: with SMTP id v15mr7695318ljd.18.1621404311670; 
 Tue, 18 May 2021 23:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
In-Reply-To: <20210519052048.GA24853@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 May 2021 14:05:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
Message-ID: <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 drew@beagleboard.org, wefu@redhat.com, lazyparser@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_230514_106973_DE265B87 
X-CRM114-Status: GOOD (  13.46  )
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

On Wed, May 19, 2021 at 1:20 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 19, 2021 at 05:04:13AM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
> > vendors define the custom properties of memory regions in PTE.
>
> Err, hell no.   The ISA needs to gets this fixed first.  Then we can
> talk about alternatives patching things in or trapping in the SBI.
> But if the RISC-V ISA can't get these basic done after years we can't
> support it in Linux at all.
This is the lightest solution I could imagine, it avoids conflicts
with RISC-V ISA.

Since the existing RISC-V ISA cannot solve this problem, it is better
to provide some configuration for the SOC vendor to customize.

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
