Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FBB10F3DD6
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:Cc:
	Message-Id:Date:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3gwmJg4RLfINTfOtw7Xz/fomPaBXP7tTpBoVuSwPFY=; b=ocHpWqgxwWCc2v
	kp9+fO49YWptWe/eZAM0/XuYRqov+6CXAJOfI+lsbtTBcbhxrLLuLGZUejz+jAdNjVHZz5b4TWIT5
	WpgcSVbPwAQaQ5erokOZ85umDH9Z6+ENNihJd1tABe0zJDiEBQq1aITYnADTHG2Powz8ofsN1jlzm
	jqIRWhqBkY1KB2ez6Wf97e72nti05qh5oksGoxGoTOJ39sYzNkoWfPBmm0FjVBnH1g2Fh9esYr79c
	ZmRjj/hCCLCgdKT2/qXviUFvGfO7F0ssw1EmvK6+2H4Gem5cSK2L6NbPPrQ7ixfZgc9AlargA+e/J
	OlFeLVRQuqitruj8XxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QHP-00000008nKG-0du6;
	Sat, 28 Mar 2026 09:48:31 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QHM-00000008nJt-1dmc
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 09:48:29 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-2c18cf2fafcso562342eec.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691308; x=1775296108; darn=lists.infradead.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRlWsjp96tD6U6Z/Cd/j4p1pGmRJaWjFo7e47fa1C/A=;
        b=AP7WmKBNJkHaNc1QCzV3Nfc0Krwoz88mFn5Rj2Zh8XCeSak2d1kyVtV2j6VOXSa7Nt
         fJNS2hJk9RdhuXliJ3dCm7wyo7RMwcGVvXSYbB0kjIMQcM486CQtH4mTKXaCmumASy4m
         MVV5j5ivbMFGyxTHW2v9N5lfemR1+cDk8nvVdLdtlwyVcXSm+u7UuiEkQtdx53Kw/jG4
         KXOKat3CqOW/xfWP6PUuH6C9n4No4d9CUTAi8M9sHOZSoYtFERWjlZ6hJ3LNbz4XCFuh
         sQjA9kPeGlus0zPfwXtuJs/ux5gjcy3D7fy0xka7gyy+opJrgV6zuf1yScKx2diYz0As
         E1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691308; x=1775296108;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRlWsjp96tD6U6Z/Cd/j4p1pGmRJaWjFo7e47fa1C/A=;
        b=f00mGfHAuH6XXG2LV4TOumjiv0ZzSkQNoZa0AaBSYEHkHTGCnvo2bTmC/iz9QmgEsy
         LhQ8v8pjN86dI9dtptYlV094O0B3/Eiu8RaExK6RCrRjD6DI7BEVdaZXmzG8On1Bfh2y
         Ug7+1or/WJpFr/NFP3ch7MWt6iMOgp7upO6alA7MO25tB8LCX8y2ou98oftvGbURxG9l
         woNiO53AuI/h5eihc7v2ittEUxzA/59QHiLOIjHO7PT6+KlWdiImfJuXvT2r3OanLkCN
         waOiDFfBGTp2TLa9n5iYYUiO+Lu6QgLNsoLxRjbUJjJOikNJ6tgDC6brM0z/B4h/MnuQ
         f4gg==
X-Forwarded-Encrypted: i=1; AJvYcCW1cFX0gk34HNWjszYwSVk46PLuLfHfewUaM/qWcDaOuDJEMHHnaaLz3LPcWGEXjHCfqUhjaL3qvuEFxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5YDrU2rATKeIFbl9KGXmllXanSZivicNCc0hNhyQL3pVr5SC8
	Vmmv7XW7qJwREOSFhxTkwvAqCMWcmOXJC8LrUw0jaQy+A30Oo0efxI97
X-Gm-Gg: ATEYQzw5zZEvt7h96lisGknoqZhIuUEf5m8/I2yNMJjIqiwir04H4qznl7IDiaaNavv
	1Bdh0Kq61QYwLISIO8VA0uHx6FVjGqlkhHqQA7fj7OeKjuuOPQ6PeGOQY+YY6gLYnfy+9byHxvs
	iyyXXpMvkug4FXGCkrXbg6sCofELPEv13P6U9/pum7+Nix1E+DwJORF0d2upP1Mv9vkyM9Lr1ZG
	cPwsypfdTbi/jvP9DLiwW3Cqk66dg3xWYQvDLQrShZ8yVKWZq8d2tybgdwuAdwFrnpb+Ak2tlbK
	VDu1ppeoz3iV1QBYJzfJz8e8IZTwOCdJ+odln2hy2mWLnhJFrEdUsmXmVUwtk4gSKD1Zk73Cctn
	hrX4VFcXFQf97cAN8B/w1h+LJSczfYerXN68hsh2YZ8Xdyz9GaF8fa3jjVTxUyMv1C7NWVbpR+Q
	MsInLHCQ/2Ctb5SVampx0Oa1JDizo=
X-Received: by 2002:a05:7300:fb8b:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2c186dd2a0amr2428508eec.4.1774691307454;
        Sat, 28 Mar 2026 02:48:27 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda147sm1742844eec.5.2026.03.28.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:48:26 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Mime-Version: 1.0
Date: Sat, 28 Mar 2026 17:48:24 +0800
Message-Id: <DHEBKA3QHPUT.2A9BJLPBXGQWG@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: dmaengine: Add SpacemiT K1 DMA
 request definitions
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>
 <20260327-silkworm-of-algebraic-aurora-e9bd1c@quoll>
In-Reply-To: <20260327-silkworm-of-algebraic-aurora-e9bd1c@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_024828_429988_A14B0872 
X-CRM114-Status: UNSURE (   7.99  )
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

On Fri Mar 27, 2026 at 3:28 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:16PM +0800, Troy Mitchell wrote:
>> From: Guodong Xu <guodong@riscstar.com>
>> 
>> Add the DMA request numbers for non-secure peripherals of the K1 SoC
>> from SpacemiT.
>> 
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  include/dt-bindings/dma/k1-pdma.h | 56 +++++++++++++++++++++++++++++++++++++++
>
> Also, this is not a separate commit.
Could you please clarify? This patch already contains only a single file
(include/dt-bindings/dma/k3-pdma.h).

                                    - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
