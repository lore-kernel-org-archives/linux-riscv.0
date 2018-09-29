Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2BFC004D2
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 01:45:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 952542073F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 01:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d/nQAck3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="A5h7qiJK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 952542073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=jIHeTjtwaTySooVe5YPl6HWOU13gRoMpSzXb3SGHd5U=; b=d/nQAck3swfC+zLcVSs6yOz93
	R/u043tFVpBfGtZL9M5I0MNwsbW4L+d+s5/oE0/Zi00eZxhNas38ShgF+ZqArvz1VrpsW0holFyxr
	VDj/mHWal+uonYURYbXzfDAkzbizSLSC7TB9/pGIDA2rP5Eb//aHCidWbxRLh6FuDmJniAKJiN6z+
	d7sIT4hGv8kwRRB1HMoG2QXorhEcRfY8MsjGKorYFkFMWCR5xBvxhJzvBLov+VhikRqEbN5ael03M
	oqUj2LdQyuB/alSM5C8maFJ+5bMhFLjb5eEXn/r5RP2RRJ2HEP5Z9M0vXeIZH6qKFnYvM5px6ARWi
	zbQnl3PFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g64Jn-00032N-32; Sat, 29 Sep 2018 01:45:15 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g64Ji-0002Mh-Fi
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 01:45:12 +0000
Received: by mail-pg1-x544.google.com with SMTP id c10-v6so5633957pgq.4
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 18:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CgC6+3bG8es7YUXtegFzn0Q8NWTrAsVW+TnFegYC8eQ=;
 b=A5h7qiJKpv2cSwAq2KwGMrmOwSVfZCtTxIu1iKM5BnwTAeUNqqc/92kzD/Hrs4qZKW
 yi9o4+MXFZutWKiiWPC+mf7IhVfIZ2X8QvjHAZaa0uJmis8jMx5+XyYVy2VC/MgJiUWz
 /JEiCYaM5x9EKkDY8Nvinl7TAISg3fJNIdl9YXl+Yk2M+rsZkzMzl7ghVSxwdNBKncS1
 r1+2VCPyrYNMyvkWj/ujQLNnM2yqgax9cm6QtrGgiQqijBWf02gib9qOx2nI9ShPeICf
 h5D9A8wN7r8+tQWaRkWpZ5m5gIOVqo/4ZURAaz0LoTf6UDZTYWKeEMW29ErDqu+HU41k
 d7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CgC6+3bG8es7YUXtegFzn0Q8NWTrAsVW+TnFegYC8eQ=;
 b=VYRRLSfKYtNwUFZiDZBmrFQrrzV8wM665Jcn3abdFODnd8jtKJOd1FljhZpliPKDj4
 pNdwZghHg1SGgVtHpswCe03XSf7q9iBDMLlxc/8UtAR7FyVPT85mIWoF+PTUW8bZRZsg
 RJ7fIIcF1kFWc2Vyz69EwFEjpnTIAq3irvlwy8XRw1zlA1VBrcD5xNTSqpFeVTXi03vB
 Lyth/fUaYCINjxwOJTlC2m4/jD6wz+Vr28YrTHJnwyHgebebdoJnu0XYEz9ZxfyhTqEU
 YNtwgbnQQ5lbT+70lwjllrSyNA6b3WsjWF6eGy5GaAT5zKE8Svr40nOaeo8qhOKuYEnE
 dWsg==
X-Gm-Message-State: ABuFfohRFe9YD+BQM3UPbuTUa/34x6WpjLqF+axE7FgXe49WweGQXCgc
 xB+DgmQRSewYvbMotqhMt8g0EA==
X-Google-Smtp-Source: ACcGV62nr5fT4OP31jmZuU6R2eaiD+3lq/XEzZPdVgdcvhsPbLiYWtCaxmpQUDKLIw0aILKGhfX6xQ==
X-Received: by 2002:a17:902:a989:: with SMTP id
 bh9-v6mr1086295plb.245.1538185502833; 
 Fri, 28 Sep 2018 18:45:02 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id n79-v6sm6636878pfk.19.2018.09.28.18.45.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Sep 2018 18:45:01 -0700 (PDT)
Date: Fri, 28 Sep 2018 18:45:01 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Sep 2018 17:35:39 PDT (-0700)
Subject: Re: [RFC PATCH 1/5] RISC-V: Make IPI triggering flexible
In-Reply-To: <20180910133418.GA12330@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-0f237369-b7fb-47cd-a610-be4c577c3c4f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_184510_569761_275A8DFC 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: aou@eecs.berkeley.edu, jason@lakedaemon.net, marc.zyngier@arm.com,
 anup@brainfault.org, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929014501.NGZozK5ADQD0Fb8RLfg5NfR1DEbAdFEV1nusBzY5Xzk@z>

On Mon, 10 Sep 2018 06:34:18 PDT (-0700), Christoph Hellwig wrote:
> On Thu, Sep 06, 2018 at 04:15:14PM +0530, Anup Patel wrote:
>> This patch is doing two things:
>> 1. Allow IRQCHIP driver to provide IPI trigger mechanism
>
> And the big questions is why do we want that?  The last thing we
> want is for people to "innovate" on how they deliver IPIs.  RISC-V
> has defined an SBI interface for it to hide all the details, and
> we should not try to handle systems that are not SBI compliant.
>
> Eventuall we might want to revisit the SBI to improve on shortcomings
> if there are any, but we should not allow random irqchip drivers to
> override this.

I agree.  The whole point of the SBI is to provide an interface that everyone 
uses so we can the go figure out how to make this fast later.  If each platform 
has their own magic IPI hooks then this will end up being a mess.

We've got some schemes floating around to make the SBI fast (essentially an SBI 
VDSO), I'd prefer to push on that rather than adding a bunch of complexity 
here.

>
>> 2. Have more generic IPI handler in arch/riscv so that IRQCHIP driver
>> can call it
>
> And that is rather irrelevant without 1) above.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
