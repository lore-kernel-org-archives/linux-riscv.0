Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ABDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 17:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nKEVL6GNRh4vTABqpZXFTmLhOBthwhrnR/GcjO0attE=; b=45Yr5dYkrXO0H12LcQWigAsin1
	1qV4ehjQmGj4Atk1R8kJ0k4HzIkPzx3U+QahndV6xelNunertOpsHFHnJ+vTugK2AU4NuIvujxG0j
	lcAQsgc7/mHxrzsqgKPZbIDXeE6Z/nLle/lNIOAECMcoYCG3XucQ2ZhydMaOMW2HPGeQEhoPoDIsl
	W2vGKeHrUALFbK+Ejjb/T5kaZ6/hHshZsAKdquTiEXoxLOJtMcLePhmRUPr1yOKQBBHwYaWlYElC+
	yxOrt/1X4n6yqgwWwl+71EgjLLlMN5wJAB662EMlRvhBXEF/VDT3VCFIaihKLBtfokDGOKGo2Z3Jj
	JWVptLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o44Oe-00Bjxl-AZ; Wed, 22 Jun 2022 17:44:08 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o44Oa-00Bjvx-Dz
	for linux-riscv@lists.infradead.org; Wed, 22 Jun 2022 17:44:06 +0000
Received: by mail-pg1-x532.google.com with SMTP id r66so10782938pgr.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jun 2022 10:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=bUXnsJdEFiCG+SMWEsd2jUVr6VH+u5NdRqQetyt+5jU=;
        b=aN6cVYuVa2RBa6c0SK9DmWxymPrXYFhusiNe2XjgzwcSz3tFcnwgegQGnVn8Rk0G3E
         no/B9vS8HejD4uV/kTwhBryE8MQqA/mKcM8jcYpwuN/DLI/ojwXxm+1Zj+WXiRhM6Wg5
         Sek+ZSoMOhzJu9YYMxDVdFTUh7ea94tuidVaTJKWNcW/RbEBv2vpG92zlXVqviRUBnlT
         b2GGoPNqlsPGG2lO/yN198G3z7+TLGKLeL/fm+d6mUVJ3iX2EhQt9MtUjj1MjVO/C+R8
         GPKx97BL/HW+CXxCNfhLaSCU7n+8vNktRPyt5xKylDD/7+NZAH2sDsV1KM6Yh7oMVbrA
         Anjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=bUXnsJdEFiCG+SMWEsd2jUVr6VH+u5NdRqQetyt+5jU=;
        b=49rOhGi0OUXt7+BPbkMy9ry7i6LhzaZar4smSrQnYYhBzytrs7tv0cK2AyCECIHBJ+
         W1umfR36tPKthCBKAHJateFdkrPrPVBVNHRWH3LU8PjQzNmXxg2FcyueD7BKgvYgNs/u
         jfCt3T2Si6gag3/h+M3sZ5vCXP6xGalMB4ZWN0qu9lb7VmLYYo8iCYqG7f07RGteDXe3
         snwqUMjCi+fc8WhKwJChTj/YzzRchEfRHAEbD5byvMRARPlSg8CIjAMO8bydCQKuAfEM
         KwRfYq8f3ayWOb/7uPRq68+rcRyft/ID4/PEPAdz3lGgd1daVdhPf9YcU2m+Pwhx4oSK
         VjCA==
X-Gm-Message-State: AJIora/3g9NDQBqmw/ScVdQVfA/wJzx0mYmqEpbWpXdF8Eldjtw1FOp+
	kJW2+N1Gkfr3wKzqXGoRtNnv8w==
X-Google-Smtp-Source: AGRyM1uhuLVklzd1mZvWuHmjdudBMSsPGdfyvcUOZW4m0ZDtiPRFEmT62FqhS2XMIWcf8orqboT4kQ==
X-Received: by 2002:a05:6a00:170b:b0:525:4e88:f7ec with SMTP id h11-20020a056a00170b00b005254e88f7ecmr1938154pfc.2.1655919837319;
        Wed, 22 Jun 2022 10:43:57 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902e14400b001637997d0d4sm12932432pla.206.2022.06.22.10.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 10:43:55 -0700 (PDT)
Date: Wed, 22 Jun 2022 10:43:55 -0700 (PDT)
X-Google-Original-Date: Wed, 22 Jun 2022 10:43:52 PDT (-0700)
Subject: Re: [PING^2][PATCH] RISC-V: PCI: Avoid handing out address 0 to devices
In-Reply-To: <alpine.DEB.2.21.2206221202590.57474@angie.orcam.me.uk>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  bhelgaas@google.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: macro@orcam.me.uk
Message-ID: <mhng-a0733eea-8220-4bf6-b1da-9de3139dbae3@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_104404_742325_40479939 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 22 Jun 2022 04:04:09 PDT (-0700), macro@orcam.me.uk wrote:
> On Wed, 27 Apr 2022, Maciej W. Rozycki wrote:
>
>> Therefore avoid handing out address 0, by bumping the lowest address
>> available to PCI via PCIBIOS_MIN_IO and PCIBIOS_MIN_MEM up by 4 and 16
>> respectively, which is the minimum allocation size for I/O and memory
>> BARs.
>
>  Ping for:
> <https://lore.kernel.org/lkml/alpine.DEB.2.21.2204271207590.9383@angie.orcam.me.uk/>

Sorry, I got this mixed up with the non-RISC-V patch.  David poked me 
about it, this is on for-next.  It's passing my tests, but they're just 
QEMU so probably not all that exciting here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
