Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778A9C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 02:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAZHL0MM/id0M0sQY7edgA3xTTaaW+NCTIkLjnSfJz0=; b=l2bofwXRjyfqgO
	0U+bYHZfHpyaU4hCd0Uc+hoPRU/EizzAji8Cz4llkYZsvu7PQTd2WpqYXkmQct/vTpYwBRxjIzeyE
	h9XvQ7pjFl7V0vV5GPc6v2VXk2mH1FDfroCE9k9pSuLK8pOS8e+9n2GbEU71corbeZKqhLke2Sxie
	v56TbpzE5GFV6jm5FmSW64xnsyTcZoiYzzwOpifd7Idd5unY5Fwo3lH/zJ98z+7IKXHmv9pYhtjoz
	KH3fScoPLNWDaN5bf7Szesc95sjS/Ag/4izbnxCiAPrjTehbvbFKqOPcFCLFKVXN0JtAgIjoOW5eu
	3tD4PWXcFJQaZqBuU8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTt6B-00000004S9Y-47Gw;
	Tue, 24 Jun 2025 02:09:23 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTt69-00000004S8v-0k9q
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 02:09:22 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0DF7692009C; Tue, 24 Jun 2025 04:09:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0690092009B;
	Tue, 24 Jun 2025 03:09:14 +0100 (BST)
Date: Tue, 24 Jun 2025 03:09:14 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Palmer Dabbelt <palmer@dabbelt.com>
cc: namcao@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>, 
    aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, 
    bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org, 
    linux-rt-devel@lists.linux.dev, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
In-Reply-To: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
Message-ID: <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_190921_383277_D772EBB8 
X-CRM114-Status: UNSURE (   8.77  )
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

On Mon, 23 Jun 2025, Palmer Dabbelt wrote:

> I'm kind of split on a Fixes tag here.  One could argue it's a regression, as
> having interrupts disabled during exceptions is going to cause all sorts of
> performance issues for users.  Seems a bit risk to just backport, though...
> 
> That said, if nobody noticed then it's probably a good sign nobody is really
> paying attention and we should just backport it before anyone notices...

 Oh, someone did notice and it's not only performance, cf. 
<https://lore.kernel.org/r/alpine.DEB.2.21.2501070143250.18889@angie.orcam.me.uk/>.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
