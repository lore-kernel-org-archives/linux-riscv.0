Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D62C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 08:26:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 722902070D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 08:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYpu+7Hi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 722902070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cW8zidVV4W7mcoyT4Lu30hBfJ+WaG1SH0vKHxerBg8=; b=LYpu+7HiVWKUV8
	a0Wvunu+TP+LuYFk4jTRlKzP0Ljo6JJ5Or+mwemAUoaFB9PS5uWDDQengN/ZxVgRzHpNUUvpfG5IQ
	ubT5rAAVcc0b5eMKLhaMGq7FsDaPs7uQ8WBob/2jpZAeAlMg5ZLkcLkmUXc8TvF50fb8ra68Huf6u
	by+borFI7rPME8GnELJtjMCKC9zEP9gTGu2OF0nIV5wwaWgLAIcyXg/X4uvzaKEP/frXh2FV15W7f
	4tSBeOD9e1O2YJuIQ/8MFOmXTbBDj0DXa7kurzzctgVt/fGCSiaq9YSSR20a5gE20JwAalC8kB4jH
	5/UcB4s2XFN5PKxeFeqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtTOk-0001B8-6E; Tue, 12 Feb 2019 08:26:34 +0000
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtTOh-0001Al-HI
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 08:26:32 +0000
Received: by mail-lf1-f65.google.com with SMTP id e27so1294499lfj.8
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 00:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a+2h7gpQxkc9JQfd9EdYxmd37Yt7ECu246HBXw6YV9o=;
 b=f5XHR26Ea5Ut6Iedx/BYs1oNIFBY2k9ti0MqjWnyY6jlVwbXf7Fa4udW0eqCbZ1V3s
 kVLIID8/1NcNMGnl2bJPH+M6E6pmMJM77sOJ+olYMAmwhOARQuySDDxdYkR8unZGvzTF
 9pt5uK/eOdLbVF+EtSej86CCeUN32X38PbVJY9EuqMf7aHILkZ2tgLBdIdTd/Vdh6ebI
 c4yi3e9gJAvDEz6Zap8iT7juBOc6PcXwvqUp0lAjkXh3obzD1Hnr+DtPhnehYjmtQB9y
 V2xGAs+j1YxLpEbZ9o8jY17h3iHCsKp2k6QOsk1GZf1V+g6E8/0PGjykB8ir7DuLJkp+
 0PKA==
X-Gm-Message-State: AHQUAubeOJ0vEuaTl4sSTayD/v5SX3hWYu9lbbOPet9ssI78SxX/GSKF
 sFX7TNHYW6h7BLK/06voP0o=
X-Google-Smtp-Source: AHgI3IawQsz13vKtdO8RDNQ9qEgjslqcVxaQiK9xKywWZBslPO6oabAHqaE81o6jZOLkVhWXgfZa8Q==
X-Received: by 2002:ac2:5593:: with SMTP id v19mr1594914lfg.60.1549959989317; 
 Tue, 12 Feb 2019 00:26:29 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id q1sm2209253lfk.15.2019.02.12.00.26.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 00:26:28 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1gtTOX-0007Et-DK; Tue, 12 Feb 2019 09:26:21 +0100
Date: Tue, 12 Feb 2019 09:26:21 +0100
From: Johan Hovold <johan@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 5/5] riscv: use for_each_of_cpu_node iterator
Message-ID: <20190212082621.GA26912@localhost>
References: <20190118140308.9599-1-johan@kernel.org>
 <20190118140308.9599-6-johan@kernel.org>
 <20190212071339.GL26747@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190212071339.GL26747@infradead.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_002631_569866_D3C8F233 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 11, 2019 at 11:13:39PM -0800, Christoph Hellwig wrote:
> On Fri, Jan 18, 2019 at 03:03:08PM +0100, Johan Hovold wrote:
> > Use the new for_each_of_cpu_node() helper to iterate over cpu nodes
> > instead of open coding. Note that this will allow matching also on the
> > node name instead of the (for FDT) deprecated device_type property.
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> I think this is going to conflict with the ELF caps changes from
> Atish.  Maybe the riscv_fill_hwcap hunk should be included in his
> patch?

Since that patch had some issues (e.g. the node reference underflow) it
may be better to rebase it on top of this series. The changes are
otherwise distinct after all.

> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks for reviewing!

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
