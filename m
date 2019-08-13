Return-Path: <SRS0=0jWI=WJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E98C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 19:59:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 992FA208C2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 19:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JMJbt0m1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RpTx+//5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 992FA208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVfrHmfEiNYYPSNqp/sJoDN/rGKR8YWUpYBRypT9384=; b=JMJbt0m1lJYCvg
	UJfI6t3TXLh4IDvifpN9/dgVm7cPhrLpBXSNyprvADt1NnpkrbC0c9WrIkuuGXmbj5C70xNfqQz3D
	YPNlrG06Dg/sOoBSPggNfEkCRrJnFEL3nfcRNPX+oY6xsh/T2UXtyjlZXdaPLeivcW4dgdgVm/I0V
	DROg/5M7eDTaAx1pglM5d2kF1D8HvvO9KtO6WOuRO2S6fquBPeJSxrkuamem6X0loinegoEXTRYk0
	kdSEFhJaWZ1WncKBykJzsBz7VYntoB+iG12uj8521mkSqChhWkwi5FTFo76UumnV+O0oNn+5N8e+5
	ACCDO9Ut2+qy9EAcnyCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxcxT-000444-Kz; Tue, 13 Aug 2019 19:59:51 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxcxR-00043R-Jk
 for linux-riscv@lists.infradead.org; Tue, 13 Aug 2019 19:59:50 +0000
Received: by mail-ot1-x344.google.com with SMTP id j7so32176331ota.9
 for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2019 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=nWHNHqC3bIoRSwxuJl3F0SbV8pQ/Gx2zD3CiOeVvxHM=;
 b=RpTx+//5O9mDpRShXm2soE7BxQNZ/E69lzZKvBD4Eyj7Zcz5AZ9/JOnA8RRj2j8zMO
 np46BJ79HOnpT+k6xHYwZHiAn7QQ/5KJXvhZgThFn4T132QDvX4j2UwDrxtSXLgbPRfi
 Xtl3NDG+bO5TG+1A5WsST2oftutb6MChj4lnoKmqN66lS1SurI87+w3SQcgDLtO8B5Ed
 WOGeet1AOPhlp99+tLtt/SIMWWf7NYE66VYIkhL+8YwyOnjMlsVf+K0Lhc+SC41x4pVE
 plxrVBAhhcAk565C8P/alfYup7JAk2GDSrGZggsWdTX/XlKstw3W3Yl5yqqrKOj0BXuu
 Speg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=nWHNHqC3bIoRSwxuJl3F0SbV8pQ/Gx2zD3CiOeVvxHM=;
 b=mTW8CSHnu16JnazcD+GJ6GvZEq2kPTNikc8nTVMlA0Jfh0BOs25oFDNynkokjEsPsl
 lU+37BrzaKQjNKQwnKKg4ltosjpMCgbKanjlkTof+TXQ6JH5P0vhAIjIOg0DQW4oiQAC
 jTSD+oZLkW8KIARl8FaopVet+PW+JmgNfKYrXYRCMBXRm8FEzJl5vLkFpbpmY6ZGsgyt
 zbeHJK5/H3WGd1BJ/81wAzlI+WYVHjcqoUgCejvY5n1c9IbPQDUqdLfqxQoBlSk/EHHn
 NpnWqC++gTIa3jqaP3LuE+P4Lzj+k5IikE7VmWsv46GiqU6e57/U0baeVLy2dB+TRlk9
 9q8Q==
X-Gm-Message-State: APjAAAVdWQe2tKUHA7FaxRj29ondWJUfem3vQxR4E0wyXJEnSuxoAIjA
 +xTyLxjWMmIRizxbHgnNltUJVw==
X-Google-Smtp-Source: APXvYqwc0uOqr7pRZlj85UgmmPYYrogEs6beI+PqksxlVBwZUtkPwKhgCRe5EWMdFyOGNFdEQENfxw==
X-Received: by 2002:a6b:6209:: with SMTP id f9mr2472333iog.236.1565726388798; 
 Tue, 13 Aug 2019 12:59:48 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 o6sm9868759ioh.22.2019.08.13.12.59.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 12:59:48 -0700 (PDT)
Date: Tue, 13 Aug 2019 12:59:47 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3] riscv: Using CSR numbers to access CSRs
In-Reply-To: <1565194418-9672-1-git-send-email-bmeng.cn@gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1908131259290.5033@viisi.sifive.com>
References: <1565184656-4282-1-git-send-email-bmeng.cn@gmail.com>
 <1565194418-9672-1-git-send-email-bmeng.cn@gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_125949_650987_F19A853F 
X-CRM114-Status: UNSURE (   6.44  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 7 Aug 2019, Bin Meng wrote:

> Since commit a3182c91ef4e ("RISC-V: Access CSRs using CSR numbers"),
> we should prefer accessing CSRs using their CSR numbers, but there
> are several leftovers like sstatus / sptbr we missed.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks, queued for v5.4-rc1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
