Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C805ECDE47
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 19:33:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C2DC2077B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 19:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l6pxMY7H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GSeGubkS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C2DC2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=p4lvrP2nfrsIOXWQTfqhOshh29gwUtOpBJNoRPxzvKk=; b=l6pxMY7HdHTtaSLF3UKkrquSH
	FxyOMNlxDhI1lPwG2PlcnN5emvj7mONsAknnIPZQJGXl4EXvq5noD1xs3LGqjfEcjYxvWBJ17aL0U
	15iWymPXm04d46AoPU1DOi9y1SHxmGLPVUKj+DcIUZztdCP6dobgGgizfMy7IIbNFS5XvAQ1w3cud
	w/pMKv8UZr+1tHFtxJ4kOlQ5nceFZ+M0D/uKYBL70DJ+HbCotkTkksQwV6q+TPc8WuUY0dMTKu4Ip
	uX4cFQt4b3CQBpy7iv+59haj+M4xdplt9rgB+aM4UjdekRvk/ieqMN57lhFATBF/N6MSnVbuKbj30
	4J4xl2FSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKq3D-0005dm-SC; Thu, 08 Nov 2018 19:33:11 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKq3A-0005dA-NS
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 19:33:10 +0000
Received: by mail-pf1-x444.google.com with SMTP id v68-v6so6162005pfk.0
 for <linux-riscv@lists.infradead.org>; Thu, 08 Nov 2018 11:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TIK2R+2irgTzLBZnutnmO7Lc4vftZqOCApHzyog2wpk=;
 b=GSeGubkSB+I4iOXXfYrgyGhmdpepc2pi4ErUd+gTvHpg6iaU1Cr2zplCKZ5rhqWYGj
 vs0zeZcNqw6FiaIohWO/QBY1GffRWhj9seYod5IIOUcNWTku2fUkU7rDAWMMvB114k0J
 99mpw2lQ7SRp0xlbP6NyN5cqQr7yhdutsk7pr3zb9AE5R/8WPYOWdlvP8CM64HTcK30W
 VS8SnOGSrAMtaNJdLkKjP8zGlMT686KUuWwt7SGM51tXg5RS+FdpGUqeyQYDl9Tpetj+
 p5w6rGKu1WpmrUeJZY8Iy4upsBKzM+5o+FncLHxrZfbnXa9ESvMkdz3ImpNSi1iv04ko
 Y6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TIK2R+2irgTzLBZnutnmO7Lc4vftZqOCApHzyog2wpk=;
 b=fsDdSVSIuO9EUSNx0GtsUb4jqC0ezmi03RDLLWBbU/gujdG5PK+cfMTHop+ep+O7/f
 k+sQAXcUTqhklfLdB5+v0C4ZreqSCa/CfK3lE91HaM8g786OHFhp2s9PtO66XA64L4B8
 44tjQhbUywjJU/PV8hHq9UfIGQrKMC19CuOFDle2Z87ykDDP9gW+/Rzzghd2UPcnC1Xm
 SL13+FIRiIPuknSlo/wJSbigdOZtdlf4bfco8V6v7glxIHEb5TFF7i5vzU0o40rKIGKx
 FTY9LxOHClWwcQAG1jfhzuIFNXuvFuDe6FetDa7LpJgnLC1wtbLQs2uaG7iFb928bJ4K
 36SA==
X-Gm-Message-State: AGRZ1gJiV3QZ7YI0mIZcNgSiPrPeBgEfWf2OlDf9pyf4aTmhkPFh81TJ
 x3y2iNbHyHJm2q54nyDj9rjcSg==
X-Google-Smtp-Source: AJdET5d7IC22PPnlCqw2sFPla48l+0M4VDStY8BscG5Wi7dSvTRoNl4ETKw6Sy1MCDVTJeKMUlVuJg==
X-Received: by 2002:a62:3241:: with SMTP id
 y62-v6mr5921005pfy.218.1541705576361; 
 Thu, 08 Nov 2018 11:32:56 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f22-v6sm5046601pff.29.2018.11.08.11.32.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Nov 2018 11:32:55 -0800 (PST)
Date: Thu, 08 Nov 2018 11:32:55 -0800 (PST)
X-Google-Original-Date: Thu, 08 Nov 2018 11:26:45 PST (-0800)
Subject: Re: [PATCH] riscv: fix warning in arch/riscv/include/asm/module.h
In-Reply-To: <20181108190700.30825-1-david.abdurachmanov@gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-1888c072-5274-457c-aa26-b9fa9cb246dd@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_113308_773178_0C489ECF 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, david.abdurachmanov@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108193255.AqwnsPgxez5y9f8v_DEXyX3JkchlLFiXvjIl7VMd53o@z>

On Thu, 08 Nov 2018 11:07:00 PST (-0800), david.abdurachmanov@gmail.com wrote:
> Fixes warning: 'struct module' declared inside parameter list will not be
> visible outside of this definition or declaration
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/include/asm/module.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
> index 349df33808c4..cd2af4b013e3 100644
> --- a/arch/riscv/include/asm/module.h
> +++ b/arch/riscv/include/asm/module.h
> @@ -8,6 +8,7 @@
>
>  #define MODULE_ARCH_VERMAGIC    "riscv"
>
> +struct module;
>  u64 module_emit_got_entry(struct module *mod, u64 val);
>  u64 module_emit_plt_entry(struct module *mod, u64 val);

Works for me.  Looks like arm64 might have exactly the same issue.  I'll roll 
it up into the next RC.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
