Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D4EF532E9
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbX4ykyzL1Okrj0t2Xvxa+4E6MglYtvEwZ13uezsFOo=; b=XY3rmgOnYRHT5h
	lzzHE14RslbYi1H7L+1T8VIXioL6jla+wrNAba4tgsz2U0hUd8ce38AlJqB60hQE6gjwBDED2WZRS
	ax+cscncq5vSLNAAeVAz7uvoDWtS3/dKaMHIbMjPQh0X2bYvReD2Bk7hLdwpYnBryMbCYp/Tof2NY
	0Wu1lgoOLwVTfXoeiclgcrSTrUhQLFGx3OZiA2EY8Kjv1iV1m777JoA/zbWB8rm6eQ2TVBZ4AMrux
	zrpZdqsZwf9sG2GgawsY4/Y7YH4hywd8uUZhuZPTsQvTlmyruptsK9ncoEZKQXfNqsieRDUS0Bco0
	6mDLJryykLGhXxjmPnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wi8-00000000whm-3tWf;
	Tue, 24 Mar 2026 08:02:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wi6-00000000wgW-3hZC
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 08:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774339317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bgd+vofP82cnhY2HCjU8+4Ds20YvfUWfxFen0NOxHQs=;
	b=hAp9XRz4RsDonq3NyMHabZR9pIc0nVbOHZQuwvpEZRewh7wLnOChkk1NpgM/Rd072WKmVM
	oXAuAkwHm8HrznpMJ+uKvY4SvO+/IWkXPVziUjVFtSGsILQdyGVHYi4NSixSW9S1lqgVm/
	ZAvqjoEJpeHCqIx97opZiTF3QSN+SrU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-XI_C5GLEOvS1joll8neufg-1; Tue, 24 Mar 2026 04:01:54 -0400
X-MC-Unique: XI_C5GLEOvS1joll8neufg-1
X-Mimecast-MFC-AGG-ID: XI_C5GLEOvS1joll8neufg_1774339313
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48535f4d5e1so11058795e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 01:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339313; x=1774944113;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgd+vofP82cnhY2HCjU8+4Ds20YvfUWfxFen0NOxHQs=;
        b=WaO3bFP5FSn3uMHWkXfo9qpvmRUzd1XiYH/rgjUQGMO+DPXLmRaUhG2nPjPKD4Z1Q6
         l+qDrXusqhWrCC4bwq98y1c6WyXHwnb31aJRvvwD0zzBkPuh00u7GoQPNLpEgLbw+YXx
         cQb00M6ZKy6+Rk+sx36e/7e8kLt6Z5+fJJTPsgZ8/HU9yf62yJTcSkN1OgtJ1feazH4B
         a5e/HBa1EOaDSkA92/qSvukeAsfA1us1Sftpbo8SpNwSryEC2zIYnLwbOj8Jyv/EuaD9
         LVFE20Msm8e+GsV9BSTj+OT2ADT3Pwe70nw6ma/pmRC2NFgepHX0hLa63HwZo3a82ijm
         AQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi+dtTUs26wX/gXjH8zRC+hC2h4shuj9zgqF6b+Kpo2rz9p40nA9Ova/Fk9fCjFtVKMJ88CET2OUr7QA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOmnTQCADU502FIf/ZQIXp4E2fkAfTrKLS3apkkQp2FzjY4QHo
	27XdE3epNClDSRfIdOX0o1A0wTN4uO1YjfWWckIduOcYduyvjqMd5bexSiOqr/TTlKQTpO5EZGc
	TV8jtbE3NgeXA3aipx97Kz0fL/2wWgs246fmlxT52SFwxzOjQhdnEgQol3bA9LyICeMrdZA==
X-Gm-Gg: ATEYQzyZ4+mnx6FhaK/TzbkApCeCrEsp9BuUcHrqeSqJSJvBoILMQWCuv0Kwf1OpYmu
	YuuddgT/zwxtaedah3bxksb7VYK0DVxgS2BujnY5fCpUiTnqefnB2j8N3YQz78rr06TgQ5wsP04
	SCGg1pyt71+R60PzC7EZ1lIMolmmSM9x+pMR0A7h0Vip738xFk6GJpfALuPkDYm5G6wGKSoajJa
	ZeLZ8VYHptUy3XRirqVjsOH7RqVCM3r7LlZRE7XAAFgCkHzmJxQjkP7XjvBPJfQnhb0pGIpy9ic
	v7T/35ebg8WmqnM7/UxzBmpC9SS3uk/YIK0Vc1/Cc8hkUPvcxQQGd5DKGyPKXtKuRITMXWMG2vU
	SK2XbnqPGvXFZUkzgRWjJ/Z2QbHyz3yobYGYOtyjk2rTVyDPirW7Rh1dTzvnm9MC/pI4krO0/gG
	bsWUfI
X-Received: by 2002:a05:600c:3554:b0:485:3ee1:eba5 with SMTP id 5b1f17b1804b1-486ff01cc5bmr216112605e9.27.1774339313305;
        Tue, 24 Mar 2026 01:01:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3554:b0:485:3ee1:eba5 with SMTP id 5b1f17b1804b1-486ff01cc5bmr216111995e9.27.1774339312748;
        Tue, 24 Mar 2026 01:01:52 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116f173csm38812215e9.2.2026.03.24.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:01:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 5/6] riscv: dts: spacemit: enable USB 3 ports on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-6-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-6-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 09:01:51 +0100
Message-ID: <875x6l8xlc.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5hzOJIXw-BWFyMQv7PsBU66PvAMAaqR337rHebkWjGk_1774339313
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_010158_995112_B6BE3AEE 
X-CRM114-Status: UNSURE (   9.73  )
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

Aurelien Jarno <aurelien@aurel32.net> writes:

> Enable the DWC3 USB 3.0 controller (USB#2 port in the K1 datasheet) and
> its associated combo_phy (USB 3 PHY) and usbphy2 (USB 2 PHY) on the
> Milk-V Jupiter board.
>
> The board uses a VLI VL817 hub, providing four ports. Two are routed to
> the 3.0 type-A connectors, and two to the F_USB3 front USB header. The
> hub requires two separate 5V power supplies: one for the hub itself and
> one for the USB connectors. Add an always-on regulator sourcing 5V from
> the DC-IN input, along with two GPIO-controlled fixed regulators to
> manage the hub and connectors power supplies.
>
> Note that the board also provides four USB 2.0 ports (two via type-A
> connectors and two via the F_USB2 front USB header), but these are
> handled by a different controller (USB#1 port in the K1 datasheet).
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
