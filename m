Return-Path: <SRS0=qdQm=OM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C28BC04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 23:42:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2129A20850
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 23:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K8sb6Pam"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2129A20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDRgV86l7Dx5oyIaFBebFQDHD0hwa111UNtoTAphzDg=; b=K8sb6Pamu9ptBF
	DzJlX4v90M9iuD3olsN4wDzfh15uNRJCdYNBQ8gG5UN8RS0bdqCunHjQuNFO6osXgLeQnEyNI3ENY
	I+GtII6MconYFGJNmvDSNSwwhbiE4ztVjP/SpYKiTwnccslkoY+ZlJn5zVkJhFWkfg0QV7WkxtgBX
	qzOTyN9wjyPww8Bz+dIJYyfpwqrwIysK+dlBguOER8f7/OFOHDoOSNxZ6q6I1YU0ThwP/YSErwiLk
	jSidaTO/cq0X+pLrBN1Jf4hHxRhi5anYjQtZUMr6nssWT4XMAbX6t0jSC/pYlJ91QpHlIL4KkxXvH
	/NHNdgVO0U5K66rXtBUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTxqi-0003yQ-B7; Mon, 03 Dec 2018 23:42:00 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTxqg-0003xH-D3
 for linux-riscv@lists.infradead.org; Mon, 03 Dec 2018 23:41:59 +0000
Received: by mail-oi1-f196.google.com with SMTP id w13so12632038oiw.9
 for <linux-riscv@lists.infradead.org>; Mon, 03 Dec 2018 15:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TN/ZO8mjHjBktG8OGuxPfshMg6Bvd8EI7N6X3Ulsv0Q=;
 b=oSqF4qrahDh0b1yeLa68XTP/s+rMB6FH8YhChkB1Sr8wm5zBctAV3QANKRLPLOqSyi
 JfaPYMKgvL1AeWmWKgbjWRForEtf1Q3Kg3IGFEjL/xVFRUN1o3pe4mN8802PtW9PTC+K
 QCFBa3TWTDM2IAsqBlWfjWtT5v2s4q6VAyrg5YWUP+cX1cIbDHw3vouTxiD7OG4B8r71
 BgPMYdaKb4JqsGXq/E9II/2QVM27IAk/UacV24P8tzBWW2VRz/G4CM6BkmIsU00M2uId
 LtoTsflBts0FnGm4YlrAEpwc4osRW6PQ+5migD9199ilYEBscTXluG5fQhGlafftVPf/
 dL6Q==
X-Gm-Message-State: AA+aEWbBytdA7/2knPn50DVDUlS7NKE5UnUqv5SElFxwf3CWuT/HHrqH
 APBCNb0WsXr6jmXPG7nRwg==
X-Google-Smtp-Source: AFSGD/Xrn9OycOyNl9xAt5CxGTbUgJBehC7KGGv8umJTXOc8j/ZAuFcLA6eWBzgpKMd/QcdwEEpoeg==
X-Received: by 2002:aca:bd41:: with SMTP id n62mr11603763oif.348.1543880507469; 
 Mon, 03 Dec 2018 15:41:47 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d10sm6627823otl.62.2018.12.03.15.41.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 15:41:46 -0800 (PST)
Date: Mon, 3 Dec 2018 17:41:46 -0600
From: Rob Herring <robh@kernel.org>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH] OF: Add a warning in case chosen node is not present
Message-ID: <20181203234146.GA26602@bogus>
References: <20181110005317.5631-1-mick@ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181110005317.5631-1-mick@ics.forth.gr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_154158_439943_25BCE7FD 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@sifive.com, frowand.list@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 10, 2018 at 02:53:17AM +0200, Nick Kossifidis wrote:
> On architectures that only get their bootargs through devicetree's
> chosen node (such as RISC-V), that node is mandatory. After a
> discussion with Rob [1] I'm adding a warning in case chosen node
> is not present, to let users know about it.
> 
> [1]: https://patchwork.ozlabs.org/patch/984224/#2016136
> 
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  drivers/of/fdt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
