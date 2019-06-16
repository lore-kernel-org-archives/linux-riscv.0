Return-Path: <SRS0=FAhS=UP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A94C31E50
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2019 18:36:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6040920862
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2019 18:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IsJEr52g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dZFfXxgA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6040920862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xo8Wa8W1dqWfRXKXB221N6qsvzrUsqmfF1wZ4MtJIr0=; b=IsJEr52g7lj/qE
	iYfJI0Os3kYZP1i2xBqo1AbYxmiJaaNcXQ0Fhv92GP5IDG/oIPdqIy3UT5jIdffnycfU8GXUdJzcg
	QDADDIjzfo9cCytcQHveKhzIWSqfWiHEJbpRJzGVd3U594h2IsstYzt459T6JS4TTqSjt/vimaq0q
	GYUUEb7PfGrs3qXBUraIuEmu0C1NAR1IzHQEL1XgL88m765rDI8C/teZYRwi9R65C8pufOVFukHvX
	YYque6tlXt3TmaXIh/Y4GCh02ecMc1gXllkjzK6TzETDPwY8MTsayQwSDqBTVs8c2xtV4oprFWRUC
	PJDil3Y/F+FKNwKWpuDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hca0v-0000vz-9Y; Sun, 16 Jun 2019 18:36:25 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hca0s-0000vG-IL
 for linux-riscv@lists.infradead.org; Sun, 16 Jun 2019 18:36:23 +0000
Received: by mail-ed1-x544.google.com with SMTP id m10so12497311edv.6
 for <linux-riscv@lists.infradead.org>; Sun, 16 Jun 2019 11:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Ih0vMtka/CWfK/DMqpVIf0q0omD2Of2trUIRIXOZFek=;
 b=dZFfXxgAdt2O+dYVBMW3wJzfwc4UBN3EZExhIR/TbD3aG5hCZCvkOe9x49gecVFzMI
 t6fF0X0ojWIcHedqbNSLq1PzMZpQrP5qatpgSV4CIsDu6PdtlxU/4jgWYBuCTgduGBOW
 GuVbJ9cnlPmFw1NDKG6SKZZQlGhEA7I2ZkIfis164iAB7fOCBXe2M6fMIgtQmSTiB6dC
 RYiSvoe0Hm0sxBwZL16TOatKfcZEJdv9Bz8qNMb1vjn2HqS0HRsTjP+ITsNvzrTR3Kj4
 3JJzfNpso1y6HU2n3/bZuCzt5A9fgy71aaZmd9NsT+aya5FJNmn1Co4mZuHlet5I4lHC
 0d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Ih0vMtka/CWfK/DMqpVIf0q0omD2Of2trUIRIXOZFek=;
 b=MqcchETzvpLYGAYbUiuppdUwvf5WrstkqOMwBjoGq3x4Nf867z8cODsg5Fy3Cu99Tz
 VJ4ZZaXXbzgEyBTfCnTUMWuUaFetGYBdQYZliRS1bQtBWp98fwO0z8Tr83ADUIjR4FR+
 5FANHf9STpX8FOfbjNF9OGaZJ2s6QW05piUICtHTp0FHsWkeTqDU7hG5Utt7MPYcanfE
 i0SeNAD8xBt6aQ268c+xOGUgzECGs/tfyXlTN1F5Evg2dFZUcO7qODy2xX1jGNvWlBrr
 U6U15ZwAL6eTHk7feoUUwQepHjllThOKioBI1PpMThb2/L3ISMtDqinJeysTSSEPpIhe
 HN6A==
X-Gm-Message-State: APjAAAXA4G6M4eNaNKOPqc/q9dsDvuKOHGlWaDm37zolTEiDeoyGVk5K
 sOLVZznXreI6M+9gByXO59reYBDrJ6s=
X-Google-Smtp-Source: APXvYqywYn66JZCdeecFBIyEmRV6m0nV6+A+DDXidbrSGQ1fVKYOysZbvUAbi5kyFzXQC9UVsq5ptw==
X-Received: by 2002:a17:906:d549:: with SMTP id
 gk9mr75132621ejb.268.1560710179023; 
 Sun, 16 Jun 2019 11:36:19 -0700 (PDT)
Received: from localhost ([81.92.102.43])
 by smtp.gmail.com with ESMTPSA id w35sm541055edd.32.2019.06.16.11.36.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 11:36:18 -0700 (PDT)
Date: Sun, 16 Jun 2019 11:36:16 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [PATCH v3 5/5] riscv: dts: add initial board data for the SiFive
 HiFive Unleashed
In-Reply-To: <20190609091819.2d1a97c90c0b44aa9120d373@gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1906161135160.26914@viisi.sifive.com>
References: <20190602080500.31700-1-paul.walmsley@sifive.com>
 <20190602080500.31700-6-paul.walmsley@sifive.com>
 <20190609091819.2d1a97c90c0b44aa9120d373@gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190616_113622_639012_6754617D 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 9 Jun 2019, Antony Pavlov wrote:

> On Sun,  2 Jun 2019 01:05:00 -0700
> Paul Walmsley <paul.walmsley@sifive.com> wrote:
> 
> Hi!
> 
> > Add initial board data for the SiFive HiFive Unleashed A00.

...

> > new file mode 100644
> > index 000000000000..1de4ea1577d5
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > @@ -0,0 +1,67 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/* Copyright (c) 2018-2019 SiFive, Inc */
> > +
> > +/dts-v1/;
> > +
> > +#include "fu540-c000.dtsi"
> 
> You already have "/dts-v1/;" in the fu540-c000.dtsi file.
> 
> You can omit it in the hifive-unleashed-a00.dts file.

Thanks for the comment.  Dropped the line, per your suggestion.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
