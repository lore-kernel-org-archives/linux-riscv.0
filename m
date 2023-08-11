Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F842C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 19:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNCGbIyRvV8tU9lxU3bk6q+SgWe8J65yCQXMwJiQO9o=; b=T6lKA7M+Skltva
	GA7Vb3Y19AowApOFkXYJqQTSSYK+pemuJf0s4wnhJh7llygRWqL89tpsdcI2vFrb/EDEmkhb4Gsyj
	NKTpQ+WrtzRwx7spgA8tL9n8/LhZ+S5E19hNa5iYzh/710UtEq+7gl/kaN23yKvUr88iMQy41uNXc
	kfKFMcJaeBAfOTjUmv9Yy+/3bQ5fp7HyhqXmbs9FxD4YZbwSo/VgNOuGjKBfhfzyrwCMbDmgWKRd2
	UDDBuK9qO0tYsIECPIw6Ihp0QiMO5V0JLNgqyT+YBDPZ/LGu5WEz+nSux+ZzjyXYb1vQfuy2pr/b9
	VHcw+lyS9Vc6zBIWFAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUXYB-00BQpY-2u;
	Fri, 11 Aug 2023 19:11:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUXY9-00BQp5-1V
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 19:11:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBF4464A52;
	Fri, 11 Aug 2023 19:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38F1C433C8;
	Fri, 11 Aug 2023 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691781112;
	bh=qEv0xjlpZqHRIMwTcKgbAHEP5C2QlnmhQGw49ZFdUD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wZpr+uOJNOY+Z0Lu+VlxW5+wWTG7S1wMJ48xBu91FfFO3O4ANr1JlGl0VrrU5oj+c
	 ykBvI/XrE7Pc+8JW/C5DAy1k8hF7jFALZQr1KTJu/dD3m4g0l2dnRQu9asVeZvLVvk
	 +LR7CjPh1T3KLXDzgdSrssuEBX/AvwtiD70OtKuk=
Date: Fri, 11 Aug 2023 21:11:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: zong.li@sifive.com, jirislaby@kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/1] Add Sifive uart suspend and resume
Message-ID: <2023081143-flannels-verbally-9d0f@gregkh>
References: <20230809135042.2443350-1-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230809135042.2443350-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_121153_547966_0D9F7C0A 
X-CRM114-Status: GOOD (  11.85  )
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

On Wed, Aug 09, 2023 at 09:50:41PM +0800, Nick Hu wrote:
> Add Sifive uart suspend and resume functions for system suspend.
> 
> Changes in v2:
> - Change Signed-off-by: Ben Dooks to Reviewed-by: Ben Dooks
> - Remove the unnecessary check
> 
> Nick Hu (1):
>   serial: sifive: Add suspend and resume operations
> 
>  drivers/tty/serial/sifive.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> -- 
> 2.34.1
> 

Does not apply to my tree :(

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
