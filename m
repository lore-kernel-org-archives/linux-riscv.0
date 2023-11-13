Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063BEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTa4wh/+fXSeO7vnv57SDDlnzbWbiRsVlSwY+WO6dTI=; b=IPOdiTEhO45Q2J
	whLPY0BvSvJy/ltymebMRqLpZoglKaLlRLQy23lKIWXor4kPW4dHA86lLjjY+Z8MkFq/8S2tXzRth
	wV5IDvSP+/rU2Nc3t6Y50xOWs1IcD2aZ4PvphS68eueliOkv0Y2jKRE9ocptgATEj9gV+iKEs8JlO
	B+dSDpKp9T97RqAnMYcoObqTfzBGaPJMc3uYGRAOB520pbOu+0uGQSvEvy0J0ztmyUz53OlhoY+xc
	zQWftsSjDMBEusci9NgNMeeGrElnoFr1dlWPiYYo+VdyZ67e3uXd7WBU6QKdh05ykrrJXn57+qGWn
	u1FkR4W+Zkc0t9H6Z5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2SKj-00DUQA-28;
	Mon, 13 Nov 2023 08:30:13 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2SKg-00DUPZ-1e;
	Mon, 13 Nov 2023 08:30:12 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 7CFF61F45E;
	Mon, 13 Nov 2023 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699864206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vbXjgXdiSDa0vGaBjMJpibdxQZYoKoWdEvdyztopZ4c=;
	b=Uhi49yrpGAi47x3bbpOw29yAha5x59wWBljx+OVa5OhttYhrrXXhom3UhN7Ea58OKoXAkJ
	w/23uH2j1ZvFVB4NTNItVm5o9Gfr7XQcMlwF9ErIBTxD6kS/qHxuP4sLsFCVPXyqPFP20g
	ALH5XZAKkygqBa9owWQedYyG3D5EJ6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699864206;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vbXjgXdiSDa0vGaBjMJpibdxQZYoKoWdEvdyztopZ4c=;
	b=sMu/ETcAxUKtbKM7MOAnXBFevtU+vXgRURWOy3o9TYn6x4XB9A/aE2Fb/SgXQJxqITRipc
	5nKcLKtQwnWYxsBA==
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 557372D38A;
	Mon, 13 Nov 2023 08:30:06 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 63D9F4A0363; Mon, 13 Nov 2023 09:30:06 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  kvm@vger.kernel.org,  anup@brainfault.org,  atishp@atishpatra.org,
  ajones@ventanamicro.com
Subject: Re: [PATCH 1/6] RISC-V: KVM: return ENOENT in *_one_reg() when reg
 is unknown
In-Reply-To: <5d60b71e-d470-449c-b23f-77ae0a6528bb@ventanamicro.com> (Daniel
	Henrique Barboza's message of "Thu, 9 Nov 2023 16:33:25 -0300")
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
	<20230731120420.91007-2-dbarboza@ventanamicro.com>
	<mvmr0kz469m.fsf@suse.de>
	<5d60b71e-d470-449c-b23f-77ae0a6528bb@ventanamicro.com>
X-Yow: I HIJACKED a 747 to get here!!  I hope those fabulous CONEHEADS are
 at HOME!!
Date: Mon, 13 Nov 2023 09:30:06 +0100
Message-ID: <mvmfs1a3vjl.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_003010_729657_581C5B7B 
X-CRM114-Status: UNSURE (   4.83  )
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

On Nov 09 2023, Daniel Henrique Barboza wrote:

> Which QEMU version are you using?

The very latest release, both host and guest.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
