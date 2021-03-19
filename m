Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C808C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:31:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1888364E02
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1888364E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y5Ir7oMF4p2LePcscYG6oCy1VM3xIW2sENWOmQ+51rE=; b=JjUuRhdi7WR+35HgEI4kF9AtI
	ih2BjvwP5JvJZicZjwSS/XCr7JnN89jWuQLyA59UL2DzF3ZlVdXkv6x+pOFhFe8C7bJfeMY9+XdpT
	irGRhpNsnek8Wn4EcWTxBPslsJAB+Y2L3wPO1uoMuGKCgMw1ljCoLtK/NsFBOViAXjTcEV0qRu1mN
	EuhlUkcWM8TlAw817YRKeuLO3mfw7XxZUlDApePvIwx4BFQG+GAfqvVdI6oVZDU+fuCLESp3IpPpH
	GtYMk8XC/nw+TtctceaLsABlNajpZbx/XddVDjqMTX+lvhhZwIv25gi5OlzgL60TnGYAMLhoRgk8K
	99/F8LMSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNAX9-006skc-WC; Fri, 19 Mar 2021 08:31:04 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNAX5-006skI-3f
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 08:31:01 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so7773195otn.10
 for <linux-riscv@lists.infradead.org>; Fri, 19 Mar 2021 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aOBAOoUYVUuaQ/ANg0jzaMHaepXG3KDq4pE4MIvdG8o=;
 b=ehKcIFpqcFvs6rmBGhhYLOmTa156yRI+RgCEmgIEkZfjrNkBsB7Su31mJPBIbzGPVA
 iroPBc8wT7bt0wZcHbLRDyK4q6LtniOz0X3MB0C6sAiW4xQ06OTTyPgzfWFTcHurActw
 rtAncV4a5KU1YpT5hEVwxgiFF0F4KmnMO/MNv5aUvkZu7YTrd8Q293NxvSlLyVN4rSEA
 Zo+qsNIBemsj8hOvm/OAu38NzxqQ+5uOzcKSfG5nvB5DQMHBOidYiS9CK9g8uW25CyLw
 trLjhuXGM9dGCkiDZmNhzOgsOicmkrsPXS6M0hHa38odvX4EqT0xcDVgylz6mT/TjgmD
 HFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aOBAOoUYVUuaQ/ANg0jzaMHaepXG3KDq4pE4MIvdG8o=;
 b=YkwnkzOxQEj/zQVGUR9BzpDp/0SktXG0Kk5GbRGTOxNT3vQeuIk4FiWtjYuNdQfoRh
 CjQqkY9I+BDa2vzRBnFW+p6Aw9sPUNVGAMTGf95VFmxSDFpQTAiZMTYiNPXSqFbilGQd
 kyb4NUVNSPVhZzRdIRLOjXdC548mM/N3x3Bt70iUEg269kWtVIjRN26ArfibwjXTYOoO
 DWeaG+FIJzx+gdD0j7Y6Lmn0yng0tMNxLxw0c5dsrlAS7FsuAs3ZNurvc/UlLsrk5bKc
 CD6hIlvRPClehuv8YIrd46Cl4fxgfcgtJ+mI/sS86/7EQigVeFTpYz1WZjGl7P1fQAvv
 1fzg==
X-Gm-Message-State: AOAM532JixWx0Re3AwBtymnDpxtr3mnRxSXnIyMN9aGliPQKz2KMzAEZ
 h090zmdcSpZaJajGVBFbfjC74QthaCkRiEoOvRfrLWuujFo=
X-Google-Smtp-Source: ABdhPJxk8oR3tZuE0wVizpmB2OZnYufj91eZnehno59lNg/ie7ktVZyajwutrf5ekj5wc59CR8jJZnhWvSE50F+P5cA=
X-Received: by 2002:a9d:12a7:: with SMTP id g36mr190938otg.304.1616142657379; 
 Fri, 19 Mar 2021 01:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <87tupl30kl.fsf@igel.home>
 <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
 <87o8fhoieu.fsf@igel.home>
In-Reply-To: <87o8fhoieu.fsf@igel.home>
From: Yixun Lan <yixun.lan@gmail.com>
Date: Fri, 19 Mar 2021 08:28:06 +0000
Message-ID: <CALecT5gY1GK774TXyM+zA3J9Q8O90UKMs3bvRk13yg9_+cFO3Q@mail.gmail.com>
Subject: Re: macb broken on HiFive Unleashed
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Claudiu.Beznea@microchip.com, linux-riscv@lists.infradead.org, 
 ckeepax@opensource.cirrus.com, andrew@lunn.ch, w@1wt.eu, 
 Nicolas.Ferre@microchip.com, daniel@0x0f.com, alexandre.belloni@bootlin.com, 
 pthombar@cadence.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_083059_780312_E29E2EE6 
X-CRM114-Status: UNSURE (   6.13  )
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

HI Andreas:

On Wed, Mar 17, 2021 at 4:27 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> It turned out to be a broken clock driver.
>

what's the exact root cause? and any solution?
seems I face the same issue, upgrade kernel to 5.11, then eth0 fail to bring up

Yixun Lan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
