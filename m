Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9927EEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 18:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7rne0tvzNBxPt49v02+wrQAUNwf4j35Ptr1gLLwVqs=; b=SuccvpBvgY+NhR
	Q2rxu+XADF6DhYAyepkFUG1wX5eQTS6mqdwjQ1dUHBMPWi60pmjELcWdXNNLOH8vlyR8WqRt1mk+g
	y9Alu93ot1RIhljspgwYem1ePP8s8UZHNbkBhag74JCD0OlIkeasOpenvZ0EvBUOVxn6/SMxntx0z
	5otp2uzRIptHCDVXoS6hE4wuM7SDOibqfPe888tJzddiVXKGqiTQdNcaMTPqJKBSn90Gncr2kctLr
	5XwohuXB4ynVX6zjxCV/xKnwVf/NLXoNN0DqP/hj4YYI11T1ynInO4Di01mfKM+9TVhgpMNxrltOL
	Hjka7m3qxA+bMHKCvH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD85q-006OYg-0z;
	Sat, 24 Jun 2023 18:34:42 +0000
Received: from mail-pg1-f170.google.com ([209.85.215.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD85m-006OXd-08
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 18:34:40 +0000
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-54290603887so856869a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jun 2023 11:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687631671; x=1690223671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50y7QuRKBodc8YNaSDdNunw0doa5v8GtHWwRWDHFDKk=;
        b=W/IVPKeYNHLIYX8L/hhFYT/x4EJGAStcXB9eb2UUwrt6c5d9yjtC0uA017ShktfFti
         hmB7c7f2CUfzWZjO7W/A6rL9Zf8knvXKcHdpUktrros2N37YWSw+wy5/18JGgJWzjohx
         EDQeEZiCfPcCpfxsDPDDVl2AiaXbg9v8F93xTlG9lQwJd47kHljto2WGqpMBBDuh9ozz
         RSwwKptdLSIFVlkBXWAMYwNr358c5uUHotl/722KykkBddOwik2ptb9MipfNznukgLNJ
         fx9SyR3Xq96oUCck8qQplx3qrAqywNvOlaBUTQZcv5MJI/1LK0TYvT5m/07rmdaxjwgQ
         w/xQ==
X-Gm-Message-State: AC+VfDxaLDaZZSVY4cOlCiU82u3RmpFzEOgzprcPJap9Wzsz0DfUytvu
	fUdJJjLWL1yyYAXH/miFmdg=
X-Google-Smtp-Source: ACHHUZ5uMVGqMJ7Rd2OWArZh6D8bOZhrUrh4w3CU31H7VC3deHLqQehtXsqUxGcOUXznlRQkuorMUQ==
X-Received: by 2002:a17:902:f611:b0:1a6:46f2:4365 with SMTP id n17-20020a170902f61100b001a646f24365mr1242488plg.30.1687631671195;
        Sat, 24 Jun 2023 11:34:31 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902bc4100b001b7e63cfa08sm1142312plz.293.2023.06.24.11.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 11:34:30 -0700 (PDT)
Date: Sun, 25 Jun 2023 03:34:28 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, lpieralisi@kernel.org, robh@kernel.org,
	bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v1 2/8] PCI: microchip: Remove cast warning for
 devm_add_action_or_reset() arg
Message-ID: <20230624183428.GF2636347@rocinante>
References: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
 <20230614155556.4095526-3-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230614155556.4095526-3-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_113438_104002_067D69BE 
X-CRM114-Status: UNSURE (   9.37  )
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

[+CC Simon]

Hello,

> The kernel test robot reported that the ugly cast from
> void(*)(struct clk *) to void (*)(void *) converts to incompatible
> function type.  This commit adopts the common convention of creating a
> trivial stub function that takes a void * and passes it to the
> underlying function that expects the more specific type.

This is a nice change, but it seems it has been carried along a few other
series and through their different revisions.  Simon also found the problem
and addressed it independently per:

  https://lore.kernel.org/linux-pci/20230511-pci-microchip-clk-cast-v1-1-7674f4d4e218@kernel.org

However, we have a few other drivers where we could take care of this, per:

drivers/pci/controller/pcie-microchip-host.c
864-		return ERR_PTR(ret);
865-
866:	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
867-				 clk);
868-

drivers/pci/controller/dwc/pcie-keembay.c
170-
171-	ret = devm_add_action_or_reset(dev,
172:				       (void(*)(void *))clk_disable_unprepare,
173-				       clk);
174-	if (ret)

drivers/pci/controller/dwc/pci-meson.c
189-
190-	devm_add_action_or_reset(dev,
191:				 (void (*) (void *))clk_disable_unprepare,
192-				 clk);
193-

If neither you nor Simon has objections, I can send a small series to
address these in a single take.  You could then drop this particular patch
from v2 of this series, should you send a second revision at some point.

Thoughts?

	Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
