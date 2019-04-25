Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25759C43218
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 18:59:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8045920678
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 18:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UEmcQE1N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QuU+CvUH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8045920678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VQvPCKPR5qrk6z7CeOL6ts4DYVviM3QjHZPMC6wITM=; b=UEmcQE1NvJPyyX
	VBlx+huLIInWN4CA6pU8c33slHVsenWcnfAGabLNVVK6V+mKvrrw6hhVm4lRUe231frhjRJWX7K+F
	7kNfkIvXqxh2rE1Cwmg76F1ox8yMmED5nJOpXqrvDKBYjAjOyfJyS5FTbItxx9Ct8Ur/nrBln8dJy
	UWHeth2njW3MuGpRbiSsAEUeTXTCAo9+dnK+XH0ivOc8KbWZpjI0IdmJG4G1rw/1oWsTxbxpiVFly
	XiVH/M2UyuQj+XyZe9QSdeNRlM9jVRGzp5CsFiggtHlNEFj8WnoCoIsBVuuNJ9455Xk0MUaKQs5ud
	uZySipqv3FqOOiz0ia9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJjal-0006cr-IF; Thu, 25 Apr 2019 18:59:31 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJjai-0006c0-G2
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 18:59:29 +0000
Received: by mail-io1-xd41.google.com with SMTP id r18so926561ioh.2
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 11:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=u4c8ph7+xRKvJNLLb9Kxs/E5+8tlnT9K7Yszj/NWIRI=;
 b=QuU+CvUHRW+ga047VA9Yh5ikCx7vVA0spFYNNYzmZHUJ0RuZXi/1DZ3T02BJh7J5O+
 SZZ6Ozzj4u6QktSxQD8B5CR/9ZymciKnA4AKs+flxA2gM50rDdEL8VrHCgWE56vKzhNE
 D30nboVd5n3xiQ8jvU19eyzX+dxAS3OBaWhbxtfUkLM3wNClGnmbm3XL7YeBPVxQfCog
 5/CmfYe/AjVWddOoFSIhdke/kP0nTs6SWpT20AdQo3IyDTDIuSJxDNvQEkl7B/k9Bbh/
 w9ntGTui+LQuhtE4vkvldwPlRCS6LekwjuN0Sgo92lqTUzrpAubnHDzRmLLlIxXfAO7N
 BYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=u4c8ph7+xRKvJNLLb9Kxs/E5+8tlnT9K7Yszj/NWIRI=;
 b=enDeotTDNVNikpFmILqvXtdZzcHTHyv5wpyqofrLejYCZVcdTPz/6zTcu0lenuD6T2
 +xiwzbhWq9twXqhUAPq6i3MTpvy9ZdhOp/m17l/qmSm6GNTJaacI06avOGSaeOyiXL4G
 BuBIiR9jdDTM4rHOxxVM4E881jM+Ut835PL0vHt5JzjJz7oSCAlKsJ0YzUyqSMRYF/K6
 i8J1lyunIHq4EYbdoei0rJ//rKgAH2pLc1RyC56VK2NI9ip8m1BjTnQWCQPNIxmkpMdC
 IkqnH/ANmd9sOwNHySW5U44/f2iOfogGvk1PdT+dL+XSWItq4IbTs/nWS0Qah09pMFuo
 16lQ==
X-Gm-Message-State: APjAAAVuse5jn8mBWb3tnKPdYXt4UZuLli77WhWQD3IyYxr7bwMLpKRp
 5SMtRSTJTWjMQN12qWGtDa85yQ==
X-Google-Smtp-Source: APXvYqz9YYvoNau93tzvwIXl9XXG2DmFKPGwaHf4Ds2TwBu/Mk9MVok8IF79wM9MKZXQrfZNF7Dvrw==
X-Received: by 2002:a05:6602:20c4:: with SMTP id
 4mr4637447ioz.145.1556218767058; 
 Thu, 25 Apr 2019 11:59:27 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 j132sm6797912iof.37.2019.04.25.11.59.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 11:59:26 -0700 (PDT)
Date: Thu, 25 Apr 2019 11:59:25 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 8/9] riscv: print the unexpected interrupt cause
In-Reply-To: <20190411115623.5749-9-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1904251158590.17442@viisi.sifive.com>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-9-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_115928_532535_ED2FE3CD 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Apr 2019, Christoph Hellwig wrote:

> This has been helpful when debugging my pending nommu port.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>

> ---
>  arch/riscv/kernel/irq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index 48e6b7db83a1..b10af8ccd656 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -54,7 +54,8 @@ asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
>  		handle_arch_irq(regs);
>  		break;
>  	default:
> -		panic("unexpected interrupt cause");
> +		pr_alert("unexpected interrupt cause 0x%lx", regs->xcause);
> +		BUG();
>  	}
>  	irq_exit();
>  
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
