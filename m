Return-Path: <SRS0=qhrg=NC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D3AC004D3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 22:42:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31FD620645
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 22:42:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oDmYKnQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31FD620645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGr1h27qe7Y41LAstajL2+XVmK7n1TyAaZNWPaS0iAk=; b=oDmYKnQZKUHBZY
	tpVD82JsaviAqN69CUfzDffBtHD9Eqbyd5vlVRNS1hp595PbHktCGM7m2iAJ95wTc9Wfcqcd5PGZl
	OzyqVgj0sKg8FDaa9WV0H3FjgkzE6kudravmQ92u+3jm5VnkKe9vr5Uc4OUzgClACi/JMDbU2zCSr
	kmRQdXVzBUEPM4l6ZQhZzH9ksNBaSTM+2JPb/IRUP8i4BL1PGfGFysgPqgTSU7Bc0R2+RN2GATmbP
	plcExiWtPDYh2crjAx+JSwSAhAUmLLgzmCnmcYNgkJgRBoUf4UU4P5FxRR4lZ0qxawp2G0TNN4xGT
	CHnoZ6BK7D95mY6s8ksg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gEiu5-0007T7-6O; Mon, 22 Oct 2018 22:42:29 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEiu1-0007SK-PX
 for linux-riscv@lists.infradead.org; Mon, 22 Oct 2018 22:42:27 +0000
Received: by mail-oi1-f193.google.com with SMTP id e17-v6so33609781oib.4
 for <linux-riscv@lists.infradead.org>; Mon, 22 Oct 2018 15:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O4MBWr1V335QIefXQZGcH2nDg8Oj0qoP1oQy0uy3rQI=;
 b=bzPwt4OGoybDx19SIlyLzVkr/N2GVY0S2udEyoTXVR0/O8EgRhcaAlomoiezTIe8i9
 CyRYB3wGePkX2GUpReda2YVZkXayGMnDUksLx2Lbm9FLnCMRCCYJFXHOmgXhZLjR+o+C
 7voODD5M233BsFKgtjQMKd30kh72KtZcmwAoWfA+9d6zdmsv8czcfnB0ix0qyn7xXfwk
 WavZcFLctwohYKY+vW34OAXtXIzB56FzgKK8j8Ef76sI0YvVk8mWWjY/bzcn4EGQImet
 va3p50iQY4aZxM/7tYACjhWGmgqO05cQZUQox1NKJeKOcJyN2fFIgOEvzAVYWvWgXcE8
 +V4Q==
X-Gm-Message-State: ABuFfohGLcEN2pKtnhYPQrjb7pqRh0fXojUlCi8s5pT45aG15zLv+a+n
 KhNX75/GVsgISAZGybrQKw==
X-Google-Smtp-Source: ACcGV60QGnZETOqr5TQxrejqLq5tIJ2N4erplEu6B923c6abLbkjksVugRpvUyVv4cA3Fe6+gY+ieg==
X-Received: by 2002:aca:b844:: with SMTP id
 i65-v6mr23698822oif.315.1540248134552; 
 Mon, 22 Oct 2018 15:42:14 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 107sm11637975oth.20.2018.10.22.15.42.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Oct 2018 15:42:14 -0700 (PDT)
Date: Mon, 22 Oct 2018 17:42:13 -0500
From: Rob Herring <robh@kernel.org>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
Message-ID: <20181022224213.GA25145@bogus>
References: <20181015142010.13401-1-mick@ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181015142010.13401-1-mick@ics.forth.gr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181022_154225_830471_25F1077E 
X-CRM114-Status: GOOD (  10.22  )
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
Message-ID: <20181022224213.CwDWmk4aGpUpRrXEX4TL-KjQSKbvVhzhnT9fksIW38A@z>

On Mon, Oct 15, 2018 at 05:20:10PM +0300, Nick Kossifidis wrote:
> The /chosen node is optional so we should handle CMDLINE regardless
> the presence of /chosen/bootargs. Move handling of CMDLINE in
> early_init_dt_scan() instead.

I looked at this a while back. I'm not sure this behavior can be changed 
without breaking some MIPS platforms that could be relying on the 
current behavior. But trying to make sense of the MIPS code is a 
challenge and they have some other issues in this area.

Can't this be fixed by making /chosen manditory? I'd expect ultimately 
you are always going to need it.

I'd rather not resort to making this per arch. There's also some effort 
to consolidate cmd line handling[1].

Rob

[1] https://lkml.org/lkml/2018/9/27/1099


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
