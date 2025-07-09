Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C41C83F0A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLuWGqJkgVEbhK0T7bHTSMDSPdtBmSlGfR4nxu19/Ok=; b=GzCZ1OqCGJ/FMs
	xpkQwjWBo6Z4wFJR77iA68WuwXpXzq2pVhZJljcQrfWgZ9IPQRp4F/lf2433dQ51eeiOnD+JC6Sx5
	y1dg+tl1CPrx+hP1MBccXdLTiroaOUyUWa0aYN4WuxbxYJFiCeo6VW+6OG3T/9jICe/B2rxOyFy3X
	dv5bavKl435yZM8f4uAXgmDewSqLSghhsrOvUoa9c5iIcDwUJO8iPen/H8p4jEmEJJo4VcPqkpQIj
	qVD5xC6XEit/TvBAShLZWGFYbua2auGV43yn1t0gKml5K+0xNXiCPLT/kriYpKt8x4ORmohxCNm1F
	jUBXDZilq0Gwpg70rJUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoT-00000009xvV-3g5Q;
	Wed, 09 Jul 2025 21:58:49 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZZ88-00000009V5S-2PNi
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 18:02:54 +0000
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 15B94129394;
	Wed,  9 Jul 2025 18:02:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 06AE32000D;
	Wed,  9 Jul 2025 18:02:45 +0000 (UTC)
Date: Wed, 9 Jul 2025 14:02:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Nam Cao <namcao@linutronix.de>
Cc: John Ogness <john.ogness@linutronix.de>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Gabriele Monaco <gmonaco@redhat.com>, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 00/12] RV: Linear temporal logic monitors for RT
 application
Message-ID: <20250709140245.555f5fd6@batman.local.home>
In-Reply-To: <cover.1752082806.git.namcao@linutronix.de>
References: <cover.1752082806.git.namcao@linutronix.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Rspamd-Queue-Id: 06AE32000D
X-Stat-Signature: 4tomrud9jwmunkyz57wfp5k71ry5wety
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/ggJjnnsruuPvYIVxNLflPkiwzfzc0XTE=
X-HE-Tag: 1752084165-40581
X-HE-Meta: U2FsdGVkX1+FoU1zagZx+55nCSK0CRRO+gJw16rt4pRYrTaqRE+5MdFJDk8bVx1GCKROKOBODMciAKoOKdnbMPBNtuWYohDXRGiFjMAzO5YrSBY8leaRpHNz49vZzwck91lLvIklDX5cJF/1KjjUrpojPk+/Bu2jSPizMhI2Lfx+pVOmDiYGSF7vBwGkiUHPDw9SSbsN4bYg6b2f0rS9+ZguPNCmTaoLzzPwlNF80ZguwzDoEuDTjUaeWauPMw8KE8VJSjaG7AwZIdqbPVrg9v6hYtRssSWiLZNIcAGVrxKgmeMzvN2XzYndvAly0iLN8pcTh2sYXlfq3XOrFaOq2jZpSnS3YCLX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_110252_674660_4915EF2F 
X-CRM114-Status: UNSURE (   7.13  )
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

On Wed,  9 Jul 2025 19:56:17 +0200
Nam Cao <namcao@linutronix.de> wrote:

> v11->v12 https://lore.kernel.org/linux-trace-kernel/cover.1751634289.git.namcao@linutronix.de
>   - drop the applied patches
>   - fixup build failure when CONFIG_PRINTK=n

Bah, I didn't see this. I was actually testing this series, but the
tests are having issues.

Anyway, I'll apply these instead and restart the tests.

Thanks,

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
