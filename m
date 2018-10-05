Return-Path: <SRS0=q3DZ=MR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621F1C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Oct 2018 00:25:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3ACB2084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Oct 2018 00:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tGYwJzcD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EEelwCAc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3ACB2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1CUsxOssbdpBGs5SrrEQis9JTQxXbPilEPCAK01rxkM=; b=tGYwJzcD6XnShV
	5EJR+zFE5vlmhuth09plYEDQAMqtxqnwWRu7qwCki0HAjJYUV2LGAmwM30S+Lfi7Qcy29x1uODkx0
	6M4KKZjPGMJ7rVCU/M9u8UL4u1I5Lkwrv35f73ojChcdJbdXgZHqv+28mD+lzoGUTQaRo6a2S0S9N
	Gb/LRec9/7zJpI01MaYIj1+kqOiNDWD6y2Mv6UIdGlZQnF0E/dMhuwu5SRN5TI8wnPevqsLimXy7X
	Q7E0eH0uUVEHVQbqNJBD3IOtHrqXKV+K3ADdbAh33pq40jtVQ82h/jrgpPylPbrf2iNQfbPiYNe4C
	hg4CfLiGCHj3Hu0qLioQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g8Dw0-0007Vs-Au; Fri, 05 Oct 2018 00:25:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8Dvw-0007VD-C4
 for linux-riscv@lists.infradead.org; Fri, 05 Oct 2018 00:25:34 +0000
Received: by mail-pf1-x42f.google.com with SMTP id r9-v6so4035743pff.11
 for <linux-riscv@lists.infradead.org>; Thu, 04 Oct 2018 17:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HH4C1QZVmSDiVephtQUjAlPJ7+CgdDwzYhAB+h48vZ0=;
 b=EEelwCAcytiI5cj/eudWG70WjXz3xs0WiDnDXnnEt7CQxeBMPURS7AH3NjZyBOap8O
 agfP1YhbgfsNa+ICzkdugD+WcSjhNEJjcms40rVUgpFdRM3XXTUYr+GcMd9aDyGlcEfS
 QsrRpoAKLf7zExtbiceFVNuiAf33ft1guoqih7/nRIQVPFDOldqsAtXojI2mReUWj2GC
 PrwSenea03USrMB8z5TiDJXoiiy9ETH8XBguWJrJREr4epCayCr3zUnXfWc0RGjxkD5r
 TV76jt9Fad15W9XO+/rAS0mf/8kHxZv3MlRVYNpe99wYWzwKr5BCfXn8pBR/4jkbHPgb
 d2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HH4C1QZVmSDiVephtQUjAlPJ7+CgdDwzYhAB+h48vZ0=;
 b=F6utXHwD/+PUBzAJIbBFthT5fXdlEgurdGp0B6cIE0AiAaXwaW0TH/cn3XrAru7Md0
 2zN3LgrezDbIVaT5I/Jdq5AaiH/S85m5KbylABlAggRwk69FAYkSyZS1xeJBbv0AtSie
 0z2PmmHZGLoyv9Z5MfbQu5RIRNllFRxc9SgRDj5+mv5GlrI0kKXikrVqojWIRWbAvml+
 JVLHCfZyzWIcVrMnm6U3DKLefhctEKfsccJlU7Y3yVVGd/we4fQZLFPZgtNocR4W+leT
 +iQ5jDcDr7kZPvUbaPewq+SrHn4LDAstspAPgcFlemSKPqOAm258OF1zH6isQWUo+gCE
 J26Q==
X-Gm-Message-State: ABuFfogUuwMZpbWwoujbNb0IxBhfF2udeNwyLgM83q1i95H0eiVgvcXW
 JeyDipM4jU49jnFLQFAJbhl4Dv28uo8=
X-Google-Smtp-Source: ACcGV60MEAixidKOwQmEOS+dSULNycEVLS3g3WMxUTdFDWF5OqJthmsOrdASa01bNuEBJbsXuaEfPQ==
X-Received: by 2002:a63:df06:: with SMTP id
 u6-v6mr7815449pgg.202.1538699119433; 
 Thu, 04 Oct 2018 17:25:19 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id n79-v6sm15095073pfk.19.2018.10.04.17.25.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Oct 2018 17:25:18 -0700 (PDT)
Date: Thu, 04 Oct 2018 17:25:18 -0700 (PDT)
X-Google-Original-Date: Thu, 04 Oct 2018 17:25:14 PDT (-0700)
Subject: I've generated for-next
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-4f277f06-1d57-46e1-926b-a3bf06d6de13@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181004_172532_456242_A22270BA 
X-CRM114-Status: UNSURE (   6.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181005002518.YCfgID8t5XrTNSFyTJkWGDQZ3YjxA6Ln2v8-O-uZ0Qk@z>

There was a bug in my for-next generation script that was causing nothing to 
get merged.  I've fixed it and generated for-next, which contains all the 
patches I hope to have for the 4.20 merge window.  If I'm missing anything let 
me know!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
