Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523C8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lweBNAq5zD1lyAw3QlsIi3WlurIpSvh4DNx9v0stwsc=; b=AX10qDO9Ho8eQ3
	aKykfdkgiX8+7M7DjcWFl+qLllQQy0DIxqI30sJPbDJyycPzmGL82rBCLIJMGrtI4fqP5nIvnwn3G
	GBK9n/OpK4pyMMis/Fj//Kdfvk71xgUmqdtA2XfUpAINPqKobukDG6aMLTexokVNuWfIqD76TqmY3
	iAbEjNuDnKHzmGBGLjXM+axVzX+oNp6m8XVN40xow5+qx3O/jzgFJz8TBHkeNhrc5xsxn9jkfFklt
	y2xnIWxqeZOlXxukWS0dxcMWjCHMJIjOQbBnbeHYhwazps8pEOkP31RvuoQif6jt/EDg+S2xs1z5Y
	IetXtuG2xQ+mPu589nYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Nif-00GhvZ-D9; Wed, 30 Nov 2022 14:05:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Nhh-00Gh9j-BW
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 14:04:50 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0Nhd-0002NB-Da; Wed, 30 Nov 2022 15:04:45 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 02/13] RISC-V: detach funct-values from their offset
Date: Wed, 30 Nov 2022 15:04:44 +0100
Message-ID: <4000385.ElGaqSPkdT@diego>
In-Reply-To: <Y4aPNs4clTTSvmF8@spud>
References: <20221128102632.435174-1-heiko@sntech.de> <20221128102632.435174-3-heiko@sntech.de> <Y4aPNs4clTTSvmF8@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_060449_434803_3D201A53 
X-CRM114-Status: UNSURE (   9.08  )
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

Am Mittwoch, 30. November 2022, 00:01:10 CET schrieb Conor Dooley:
> Woops, I built this commit in isolation and:
> /stuff/linux/arch/riscv/kernel/kgdb.c:32:32: error: use of undeclared identifier 'MASK_JALR'
> DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
>                                ^
> /stuff/linux/arch/riscv/kernel/kgdb.c:32:20: error: use of undeclared identifier 'MATCH_JALR'
> DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
>                    ^

actually that is patch1's fault, that added the prefixes in the first place,
and I've fixed it there.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
