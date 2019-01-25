Return-Path: <SRS0=IGe1=QB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA07C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Jan 2019 19:54:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99A3F218B0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Jan 2019 19:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="usr/Xffi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="J6197mwU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99A3F218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eQV3UkiPK3eXuhpKGrOY823VZNCc/mVJGaVSWlg+wmY=; b=usr/XffiJBFqUAK4tF7Oz9r8K
	J1UeFwwPUomf/wKozw3PKS4vCAarrk9ypS1bXvAICSg8jP7YUemdln4EugZYvspOIt6tRlZ+r3jr4
	5kNC6oaeBOzMeHnbpXylDN8h1cvyVg7AXQpARxztRvNX4ArUD/To+KDzueHUkG4NkJmm7Dov/Z/vq
	Pr5I7qzMlnHRgtQM4jb+xSsOE/O9MBLlu24O6gRMsVCB7wYb7NRE1roQ3Z+5OSm0etV/7Wl1netH+
	tnu/Nknl7XoWm0Gd/ry609WIyb/YJbJfR+S4+inlVHnbN1hxNBz2ac0522RZ/69xGOVyh/FAXbRu7
	sAMA8omnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn7Yd-0006fN-SF; Fri, 25 Jan 2019 19:54:31 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn7Yb-0006f0-5c
 for linux-riscv@lists.infradead.org; Fri, 25 Jan 2019 19:54:30 +0000
Received: by mail-it1-x142.google.com with SMTP id g85so12303650ita.3
 for <linux-riscv@lists.infradead.org>; Fri, 25 Jan 2019 11:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=mBLhCc7Oplw3vOBLO9U5NUIwyMECCiggGQDjETNG+6A=;
 b=J6197mwU/cF5llcGfWFzDICbkVhkFOavpJSs22ObEkdddW1iXYrmXNsfo7BQQWaCxs
 KlPnp+3DTrzMGLCG5Jx2R1YmTQU/Ltq7QXLil8qvuVJ+InLqNxeaVDIsw0LvjTbr9v++
 WVeZlXNCX29nYpJBmR2lOV/GfyzoBdLNurvKSJcBKJDjMQ3r4Uxb3hkc0X6xd7wKiMu5
 EQ1yo+MPZQ2YRxcJPYvvhN1/uJtNp4LtEF1NEa7/nw5a1mBwv7JjQ0WPpOxebcGdjjLY
 eeUezU8sI8toIjOIWFRRB3qsDFNl82nBM6zUo/IEzMTFji0f2SzSBgfFhDPTKaZSMVE7
 /7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=mBLhCc7Oplw3vOBLO9U5NUIwyMECCiggGQDjETNG+6A=;
 b=rWzijn4ps3vPKpslahVpUaWnuLa3jUtSEtXya2vMCSE5uqs8U/qHL293/dSrwWp8tI
 DalTTRs9VYmOZWbsK+QO7YhVoWPYW7Ft6pVg/RNOOn8bR621sGsEBxxI4EBF/hfDnzRm
 SgX2IRpAJNJyW9eS7+LvKLSClbYvryBlw5sbHGaZB3fJtwHGGaeG298dQUvz0BtII7ec
 0kdURmSXJJ+80oxdgwzyNVkJI9cYLnnmxlxvvN9lObhQRRCjd4ppXiXH66SpcsgAVeUj
 6YKbBVxWMydbh3uA6m7ecQav8M68LXv+B1WX997NCGNDjkE89vQ+TkjRahw71lG0XQ1W
 bKgQ==
X-Gm-Message-State: AJcUukdxFfvSPleQWIqwMNdDXV9XJRUt6ZK06ojA7cEz6JcLDVtAuHOW
 LJcPwSGKrC/lE5wvKptS+l9kzQ==
X-Google-Smtp-Source: ALg8bN7r/tnyf2sXz/ZdEvLheaoI8ljykDlaQe/taxPTdYqJILg6Vwxhpq7TEM8/4IEooYUgLs+TzA==
X-Received: by 2002:a24:9686:: with SMTP id z128mr4860898itd.97.1548446067439; 
 Fri, 25 Jan 2019 11:54:27 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 b25sm13052332itd.37.2019.01.25.11.54.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Jan 2019 11:54:26 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Fri, 25 Jan 2019 11:54:25 -0800 (PST)
To: =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: [RFC PATCH 0/3] RV64G eBPF JIT
In-Reply-To: <20190115083518.10149-1-bjorn.topel@gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1901251147250.20864@viisi.sifive.com>
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1448834684-1548446065=:20864"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_115429_245011_CF91CADE 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@sifive.com,
 daniel@iogearbox.net, davidlee@sifive.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1448834684-1548446065=:20864
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi,

thanks for taking a shot at the eBPF JIT; this will be very useful.

On Tue, 15 Jan 2019, Bj=C3=B6rn T=C3=B6pel wrote:

> * I've added "HAVE_EFFICIENT_UNALIGNED_ACCESS" to
>   arch/riscv/Kconfig. Is this assumption correct?

From=20a hardware point of view, this is not the case on the Linux-capable=
=20
RISC-V ASICs that the public can buy right now (to the best of my=20
knowledge this is only the SiFive FU540).

So I'd recommend not including this for now.


- Paul
--8323329-1448834684-1548446065=:20864
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1448834684-1548446065=:20864--

