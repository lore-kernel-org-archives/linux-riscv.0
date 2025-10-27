Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3989CCCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bq2oP4bY2qxztvYvvNWbnpAmShSRHQJWAy6Eso0xrdY=; b=DCT9DHw0OlBg/p
	FSkFggVROxeoPU8F4Uk6b9e8JaiKKbc72Fvh5D/kGH0RXG0pYtwNYhY9mxhtr9tlT1amcEKpH+ohS
	J5RQjdRbsuMvpXJi0ltrVqqx+0vIXU+SIX8qn6rpl0NIRqgqY8nO7xVaJqUeYcHDLiVdu2vqXQEGe
	axYfCuAE13M4ScPxHmVW+6i8nryn8LZtOePUnsyc90ny4XUowgU6J6Bfrhdx/nROIhiUjL5i39aGz
	rjpLqQmFEWXFxKhc89rUP/6oEIylaHpsYoOV0tncvCsFzN8zBjmxN5JS3DWvL8AKJoPiLU4mHQTTf
	NItabktuoUrYxW7QmeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ8o-0000000DTpt-4Bln;
	Mon, 27 Oct 2025 09:03:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ8n-0000000DTp4-366D
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Oct 2025 09:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dMBkmHj4Il5WIq7tDNPinD42JrN2hAdCrLiWHZU59ug=; b=ZFXlnXvu1mr5t6pUkP7ucS2FvV
	C90958R9v/HUHOJMqBn+bUeAs2NR0SobKi085yBhjWCw2E1Oo0qrpHUyf4q04C9zMe6nqy5UCSsPX
	MbjZHHId+RclJVc3VO9z1G8oi4y5rCShRmNwedddw+SOE39igUTsfE27ch/1hndrwahkLa0yfYXd5
	npB3TFA5rJUwLUUVxqndRYibBpfq6Wd2nJn1JN2QZdvcRlqJnU4DEePoV49krmGuqJuuKy7v1eLmY
	Tilv2xLFvOHqiIwc98Uh3yHyg5oUlnv/DPiuA1mZfcWyxKNf/8s3n+dXf5G9GG8CGxIecG5F8tuQn
	qBOgvO4w==;
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIH0-00000001glQ-3W3G
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 08:08:16 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id 411041F387;
	Mon, 27 Oct 2025 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761555824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dMBkmHj4Il5WIq7tDNPinD42JrN2hAdCrLiWHZU59ug=;
	b=LA/mC7GvBSYag5NCN1zSBUpPzUZIZrpIP0cSg2PNRiMcYySavYblijSOy6uT1pCpQccP2y
	AMpExBsBSqiwti/wph3D/5Q+tLEFv3DsshFY6CuprLJq/VgfgSISg4fgByDR4Zc5aFJnAt
	OAaiGtEAwwU4iPNT41OaFyKu3ng+qBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761555824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dMBkmHj4Il5WIq7tDNPinD42JrN2hAdCrLiWHZU59ug=;
	b=xwiKYER+J7hn7pFMSEntBZ6A3dku7r5fvF07Y4j0KGHkHL4z/Sg2MLPTOFvm05reGdMqmp
	CHE++/6NcY3FFcAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="LA/mC7Gv";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xwiKYER+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761555824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dMBkmHj4Il5WIq7tDNPinD42JrN2hAdCrLiWHZU59ug=;
	b=LA/mC7GvBSYag5NCN1zSBUpPzUZIZrpIP0cSg2PNRiMcYySavYblijSOy6uT1pCpQccP2y
	AMpExBsBSqiwti/wph3D/5Q+tLEFv3DsshFY6CuprLJq/VgfgSISg4fgByDR4Zc5aFJnAt
	OAaiGtEAwwU4iPNT41OaFyKu3ng+qBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761555824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dMBkmHj4Il5WIq7tDNPinD42JrN2hAdCrLiWHZU59ug=;
	b=xwiKYER+J7hn7pFMSEntBZ6A3dku7r5fvF07Y4j0KGHkHL4z/Sg2MLPTOFvm05reGdMqmp
	CHE++/6NcY3FFcAw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 2ECB84A05B4; Mon, 27 Oct 2025 10:03:44 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Yao Zi <ziyao@disroot.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  linux-kernel@vger.kernel.org,  Lee Jones
 <lee@kernel.org>,  Sebastian Reichel <sre@kernel.org>,  Yixun Lan
 <dlan@gentoo.org>,  Paul Walmsley <pjw@kernel.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti
 <alex@ghiti.fr>,  "open list:RISC-V ARCHITECTURE:Keyword:riscv"
 <linux-riscv@lists.infradead.org>,  "open list:RISC-V SPACEMIT SoC
 Support:Keyword:spacemit" <spacemit@lists.linux.dev>,  "open list:SYSTEM
 RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
In-Reply-To: <aP8QHwsYDlbQxQJo@pie> (Yao Zi's message of "Mon, 27 Oct 2025
	06:24:31 +0000")
References: <20251026224424.1891541-1-aurelien@aurel32.net>
	<20251026224424.1891541-2-aurelien@aurel32.net>
	<A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org> <aP8QHwsYDlbQxQJo@pie>
Date: Mon, 27 Oct 2025 10:03:44 +0100
Message-ID: <mvmh5vk67in.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Rspamd-Queue-Id: 411041F387
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [2.59 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[from(RLajr16mudzow8bnf6sy)];
	RCVD_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim]
X-Spamd-Bar: ++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_080814_939174_86F297DD 
X-CRM114-Status: GOOD (  23.86  )
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

On Okt 27 2025, Yao Zi wrote:

> On Mon, Oct 27, 2025 at 11:20:33AM +0800, Troy Mitchell wrote:
>> On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
>> > This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
>> > chip, which is commonly paired with the SpacemiT K1 SoC.
>> > 
>> > The SpacemiT P1 support is implemented as a MFD driver, so the access is
>> > done directly through the regmap interface. Reboot or poweroff is
>> > triggered by setting a specific bit in a control register, which is
>> > automatically cleared by the hardware afterwards.
>> > 
>> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>> > ---
>> > v2:
>> >  - Replace the "select" by a "depends on"
>> >  - Remove outdated Reviewed-by
>> > 
>> >  drivers/power/reset/Kconfig              |  9 +++
>> >  drivers/power/reset/Makefile             |  1 +
>> >  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
>> >  3 files changed, 98 insertions(+)
>> >  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
>> > 
>> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> > index 8248895ca9038..61c16f3d5abc7 100644
>> > --- a/drivers/power/reset/Kconfig
>> > +++ b/drivers/power/reset/Kconfig
>> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
>> >  	help
>> >  	  Reboot support for the KEYSTONE SoCs.
>> >  
>> > +config POWER_RESET_SPACEMIT_P1
>> > +	tristate "SpacemiT P1 poweroff and reset driver"
>> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> > +	depends on MFD_SPACEMIT_P1
>> > +	default m
>> default m if ARCH_SPACEMIT? Or default ARCH_SPACEMIT?
>> I believe that reboot and shutdown are actually essential functionalities,
>> so it might make more sense: default ARCH_SPACEMIT?
>
> I don't think there's anything preventing it to be built as module by
> default: even though it's "essential", it's unnecessary during kernel
> and userspace startup, thus I see no reason to build it in the image.

Wouldn't it be needed in a reboot-on-panic situation?

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
