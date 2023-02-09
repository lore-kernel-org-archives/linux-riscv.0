Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF45C636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4ZWNF1y4/+KKSguKb4GsMX4Q5KbLVXTR+/VytsaI7k=; b=OS0QKU2sTVhrEA
	VbPTXx2FVwb9cuzZzqI1Wq6EV2LmWu593+HhljkTFR4/Wo19mUiHYhiROMP14pw50Q7o3FKnZ8U/d
	IiKZPxoWGeGQJS0QKfgoLvng/FF+n5IuooSvvs/aHSrJoviGtZ4H5CngfbR1t/l8ZVt+InjsZEZWQ
	jrkRuNblvxK2ZQV3HAL40KRY2BceQf9teiQ9OZpS2llX1jThCJwOJeBncAR7jDc5QAyAtVJ84oGxB
	S5XzSf8QZAgOlXIeE9FKO2gTDs6YVcwFQ2jD78QD3Kb1WdH9DUCIOZD+yD0OFylS0pW02kJXaXXXF
	fvWUHEzBQHPvrLYCuIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQByh-002tjz-SJ; Thu, 09 Feb 2023 18:49:03 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQByd-002thU-Js
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 18:49:01 +0000
Received: by mail-pg1-x535.google.com with SMTP id q9so2189307pgq.5
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 10:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+Vl164bAahdCQM/OeioT8QfAfHP3epqU1qWcESFk9M=;
        b=Q9NrtJRbHCDcyldUiFG3MjAJhR7cxlCGHlVMH7LvRC3pxy/zIoIaFcED4GXKwinD1h
         hDTaEFxQ84y9gg+xsxessKJmgKjmsH/ccPU7dLS+9Z1PxHLZ7r8K9cGLpwYaeAUB51f3
         wfUulFWoL5UTgA1wB8HgiEWYzLNcH4jAzX0n+kGnc8VSpjuECmf4SQ3/KsPefV1//uxm
         AR9zbWUlZKiZNP2xoS/HpWucCA9ZDltulecliEK0dcQ/7DtxKL1+XBJ39JZ1HQ0iGCgQ
         2jGKBIAVRzFg4oUu6Ll7tW/5wUdAcTnCQ1bqcXQZdypfOiUTsvlIrJvz0bfy3JIvdtzy
         NYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+Vl164bAahdCQM/OeioT8QfAfHP3epqU1qWcESFk9M=;
        b=45QT6xvZQmoSotnNfENlRFNez46AwUK3fAdujWiJd1JBS+B0lMNMOLXli0PNQnxkMY
         UeX0FbH6/ekNflJ8ijOlBCyilyHCTjQ0A8kvIOV3vP5tIm5cp96t2IpuneukAJf8c1cy
         pUqdwT5wrwlNjiZzLAddtfSjQq/gQ9FmR5oLZqjAxOhON/EX81i6VclX0NaryNm4SpAN
         EWSjHuF+3AvS+NXlf4rPyJG5F95GzQ0nWhLfJ9xB/MrUNY70DGRmFPb1ZFdab16MeVAA
         pDL36RBWHdCH/vQOz6oWdfNBphsZ1rpRt7BSYxXHLImbNNzvxIasfIzhPd6Lc5sdvYDB
         zZ6g==
X-Gm-Message-State: AO0yUKWNZcNEp/ajvDh2IDb8aXmEd2ESwAqduplG/wOtVi52jFJ/hGSY
	uRfd/gMAIDELKMIQ5pdaKrTGvw==
X-Google-Smtp-Source: AK7set8VK0PujOG9ifS5Vi0bKSC0OilXyKgwdPqjzzZGbTEePN3Ze17cacetI8xUKvyQsqrxCAmTdg==
X-Received: by 2002:a62:5243:0:b0:5a8:5271:5a2e with SMTP id g64-20020a625243000000b005a852715a2emr2519445pfb.0.1675968536010;
        Thu, 09 Feb 2023 10:48:56 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s16-20020a62e710000000b005939fe1719fsm1791104pfh.39.2023.02.09.10.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:48:55 -0800 (PST)
In-Reply-To: <20230129235701.2393241-1-conor@kernel.org>
References: <20230129235701.2393241-1-conor@kernel.org>
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item
 indent
Message-Id: <167596825349.4932.12265010808108160648.b4-ty@rivosinc.com>
Date: Thu, 09 Feb 2023 10:44:13 -0800
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-ca426
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
  linux-doc@vger.kernel.org, corbet@lwn.net, kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_104859_678047_2F26373A 
X-CRM114-Status: UNSURE (   5.85  )
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


On Sun, 29 Jan 2023 23:57:01 +0000, Conor Dooley wrote:
> When adding the ISA string ordering rules, I didn't sufficiently indent
> one of the list items.
> 
> 

Applied, thanks!

[1/1] Documentation: riscv: fix insufficient list item indent
      https://git.kernel.org/palmer/c/377804b13d8b

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
