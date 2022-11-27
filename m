Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35024C43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 17:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFsA33thpIZbxwj8UsMtkfJSJUYz9x+4BZXZ8x1VUgo=; b=Xj9cksOneaO9Si
	brQs4jRB+UZzb71SDSWNrLv2+YTBvTqCvLIw2nvmqMplNcA28WXspD9Tfa7oE4UeV5B0QXKwhB47X
	zGv9sbhCKxbvGY7aVvnFf2UFxRaKlYM/B5z0/g1HFCaQuJhHi/9hZT4wfFHsJc2XBPLaavit03PYH
	3zm9wBiJ/t1Q1mtyz03pEPzZk2dxCZndOyZfHbAJK1AtxTanjzMMAaHORCYZZv1GlrSmkvsxYvX4V
	Hl3ffTTR6skMUs6t+7UaDLICI6ijIkCfL7b/Cs4wQ9mWTVk5wd6uzcBadTZzSqUMQwQb/4P1PlRV4
	YhyFioYeo3baxHjz7v0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLaS-00Chz6-3u; Sun, 27 Nov 2022 17:37:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLaO-00Chwu-KU
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 17:37:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55281B80AEE;
	Sun, 27 Nov 2022 17:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81876C433C1;
	Sun, 27 Nov 2022 17:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669570618;
	bh=5hMfqLN2vlKfjD92hPO3MtkG8W9uvJa+Nmuer26I3s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adeVPacnVCFAnGjw23mZi2tztUCyjK3CEJWIt/fAP9vhJkvU2ikTpSTrNqzqgcYjN
	 DcRXHYTr6vzBQLExSta+ycdwE/9KqbKTqRVIaUxmio9ohoY/uQlML+S5Jid25eo7TS
	 iu0TLNYy9+RKUv4HJ7ceDBmT+mPYiwueTe02T87gM8rS0Akf94RBAFLTY/Eu6f+lEp
	 Ve2FD/HHgxqipOCpUlxQemEkSETmK5yz4ck/kedAta6bc3F4rp5JDI5G8j5uJtUoUW
	 kKnGwFGb4FPMyZQgswRel0p+zqyKoFt7KW0jP70p11cjvr3Xg9dhITfhXBegNYT15g
	 2H7yjIIPgx8vQ==
Date: Sun, 27 Nov 2022 17:36:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 8/9] MAINTAINERS: riscv: add entry for Bouffalolab SoC
Message-ID: <Y4OgNW6uOe60Pi09@spud>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-9-jszhang@kernel.org>
 <Y4Of7s6UGpD0/Iga@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4Of7s6UGpD0/Iga@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_093700_832939_4E7621A7 
X-CRM114-Status: GOOD (  19.20  )
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

On Sun, Nov 27, 2022 at 05:35:48PM +0000, Conor Dooley wrote:
> Hey Jisheng,
> 
> On Sun, Nov 27, 2022 at 09:24:47PM +0800, Jisheng Zhang wrote:
> > Add Jisheng Zhang as Bouffalolab SoC maintainer.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  MAINTAINERS | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 00ff4a2949b8..a6b04249853c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17729,6 +17729,15 @@ F:	arch/riscv/
> >  N:	riscv
> >  K:	riscv
> >  
> > +RISC-V BOUFFALOLAB SOC SUPPORT
> > +M:	Jisheng Zhang <jszhang@kernel.org>
> > +L:	linux-riscv@lists.infradead.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> > +F:	Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> > +F:	arch/riscv/boot/dts/bouffalolab/
> > +F:	drivers/tty/serial/bflb_uart.c
> 
> I think I asked last time but I didn't see an answer on lore or my
> mailbox - if you intend sending Arnd PRs for this stuff, please add a
> git tree here. Otherwise, LMK and I'll bundle it with the other "misc
> riscv devicetree" stuff.

I forgot:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> >  RISC-V MICROCHIP FPGA SUPPORT
> >  M:	Conor Dooley <conor.dooley@microchip.com>
> >  M:	Daire McNamara <daire.mcnamara@microchip.com>
> > -- 
> > 2.38.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
