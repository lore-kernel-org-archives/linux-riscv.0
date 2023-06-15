Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B911AEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+hCh56E3DR0WxlPON51qwUw8YjruESOGqrx5O0A6fU=; b=u5pku6ZgNg6iUd
	g9wcGpXQR8lfxwDuGur0NtMC44tbCjq5g4srVimWcu80nC6Tjj8N8f2wMJgFvdnv5JnYgNyj6O595
	Ek/Hy0eV/IQPqtsnDmfJLPYGigyzAAd9URM99QW8r2XnIxBFa2+wA6iPaT+UXynjU1YIu63QamPgx
	BdhD8tinbMZm5GSoWxJt5fzxW4/n78rQ+hiyM17nOMwGDVhXDhbwPLZGR0oLO2TAiL2Fl4WHpxJ5C
	2QqWcu6/EyAkYQPHxf3d8S5qdewu4A287gozcnvKW9GAxcBqbuWPVUTT7bRaqF8BzWI8KYjtcyXDK
	RND7B4tKZOxv2a7htPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9jZu-00EMGW-22;
	Thu, 15 Jun 2023 09:47:42 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9jZs-00EMFx-0O
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 09:47:41 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b3c578c602so32037405ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 02:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1686822459; x=1689414459;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcIbsuTuras7nhZRKwXQYUq8Gmb7hiznRWwdCPO8xpM=;
        b=aQGO6ueCJziuDO+nAGnGz5QTl5OIKIrHs2i/hdOQKmAgBl4NTbEF1FRxIZGr6oiKVr
         /kynnbR43iXhit/NSlrXDmfTvgDE0HhrlyCWduduh9BjVekMKhHhBRlq8lT/ipShEooi
         cMHo6Yn0pimsYW+JmQcRZyz8zv6gw8saL1C+qbe5FXq91uU8D4P4d7oQB+CKeFY6Cw8F
         0cyghIRKVXG5pm5m8XSsNklnZv0BqLC1QRHKZQhHwt6IwB36xAaTm2sErgNDdYsyF5EO
         xEzPHJJSm82TCnY6gEwxT21zSgLm07cT8e6ZxUcKMyag9W9EnGAr5bpmO0T0QlL8QMcd
         AMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686822459; x=1689414459;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcIbsuTuras7nhZRKwXQYUq8Gmb7hiznRWwdCPO8xpM=;
        b=UNTcPaifsiqe99sXl2mI/cuctSbToGhoHehxxsbg4nMD3wb3cTGwyPa/TsPlcuXynW
         ePcvTIaPB6kZp640HDH22aUFfiFY/MYxcCp6J70T2Txbu9AuFBekO4wPa366ND1CUxbU
         IIQw2foduMCYdv0dA8siIeDKlnHVOymGAqYQcY65ZdoTu/dGGa6NqzybwP99uK6NeXIC
         AuC15ObZV8AV52IJIyI03SSnZYzGh4QNiI9zjTR0v1OHZOb4+ka/2uHb4oza1Sl+Wmj4
         xQVq3BSEZyIaJt3s8P4iK4I5wqJqUJoJAZqCYhNQ/+jdv3DXVux5zRb964Spfx6kq/0b
         dyZQ==
X-Gm-Message-State: AC+VfDzwlxJhapWX9ci/lpYTl/clfe6o+VlKcpebHhFWNxU4hplIW+cD
	VMdLdYu2Wla+FKXhS8JOojBZkw==
X-Google-Smtp-Source: ACHHUZ4DB1lofP+kyQ79jZotePluoFWtcHF3WEHWh7MQjOnnqgczFkuipTQ03MximRBmBW9a4rI9mg==
X-Received: by 2002:a17:903:244e:b0:1b3:c7c7:74ae with SMTP id l14-20020a170903244e00b001b3c7c774aemr12312783pls.45.1686822458748;
        Thu, 15 Jun 2023 02:47:38 -0700 (PDT)
Received: from hsinchu15 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id w22-20020a170902d71600b001a64851087bsm4800996ply.272.2023.06.15.02.47.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jun 2023 02:47:38 -0700 (PDT)
Date: Thu, 15 Jun 2023 17:47:33 +0800
From: Nylon Chen <nylon.chen@sifive.com>
To: Andreas Schwab <schwab@suse.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, jszhang@kernel.org,
	ajones@ventanamicro.com, aou@eecs.berkeley.edu, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	zong.li@sifive.com, nylon7717@gmail.com
Subject: Re: [PATCH v2] RISC-V: Support 32_PCREL relocation type in kernel
 module
Message-ID: <20230615094732.GA8710@hsinchu15>
References: <20230615072302.25638-1-nylon.chen@sifive.com>
 <20230615-unvisited-deceit-9beab8ce987a@wendy>
 <CAHh=Yk_=oZJ6eY3jJzLavub5rGsvY=MKv4tGXeiqkz+rgJHwDQ@mail.gmail.com>
 <20230615-luxurious-rewire-84ff9d639fea@wendy>
 <20230615084310.GA780@hsinchu15>
 <mvmo7lh2ip6.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmo7lh2ip6.fsf@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_024740_173253_16548467 
X-CRM114-Status: GOOD (  14.57  )
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

On Thu, Jun 15, 2023 at 11:11:49AM +0200, Andreas Schwab wrote:
> On Jun 15 2023, Nylon Chen wrote:
>
Hi Andreas,
> > Because LLVM currently has it enabled by default(https://reviews.llvm.org/D145164), it will generate this
> > relocation type.
> >
> >>From what I know, GCC will also enable it in the future.
> 
> That's why the kernel explicitly disables it.
Ok, thanks for your feedback, after I cross-tested, there is indeed no relevant relocation type generated.

If this error no longer occurs.

I am open to the idea of adding this patch to the upstream and would like to hear your thoughts on whether it is still necessary. 
> 
> -- 
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
