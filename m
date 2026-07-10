Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C83C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 18:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wjq8n3P2Mw2RpVV8L6wsLj1/+QECcvWAQIke1TNwlU=; b=ju0fkKfoED0bk3
	7xoi4bkmuE1QGCC18OjCKRc2VumHRM245qDpl70h/hypbIsm6L7spbnolGfK8OpjWD+HofiO4SPMp
	+Q/3NpSU8+BGsQ2nwfxG7cmsIFsgg4STyJdKZgkM8qBRcYlldsE7dH35dJIuwGakole6dN2iXvA5e
	DysF4J3kv9KfUtDFwN6yThRdRaUrSExVX061crphdcPvtSfQoMuY6gd0v0XD03ubbFyCSsNEpIPw7
	zCHfO570OPvN21LxCcUDg5p0EzjuUp/wSsEEa5dS4eJuftksAHU9k+phsFuuPRnSrZDF1jhfyhwhi
	+6cmFQxJAbtKlnR5WKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiG42-00000005WGC-2bj5;
	Fri, 10 Jul 2026 18:35:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiG42-00000005WG2-0vPK
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 18:35:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 52D9A60052;
	Fri, 10 Jul 2026 18:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861671F000E9;
	Fri, 10 Jul 2026 18:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783708505;
	bh=W6Q2nH/nNTfW/UR3nhHT7dv70F2QmoWiv8pPzVSl5o0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=jWRusUwHqsjZ9IFK/CoNGyw30XsCPz4VgAg8ZchFWr5puaAlyp82kE8Wj3Cse+PCd
	 8ceqVPW5dmONCd4KwVZd5/1dVhMs1yxpy2ZrGIAFrA7CY7qeoRriq3vBslU+FLlJEa
	 /NOxedeGvto0r2gqZiBWkdzyl83gq6zQB5ScKmuPlKtA3uSYtEQYBugRD0HEvduYgD
	 ZqGsVrNZU1X1eZG1JRHM+gzbcXdHxtia/kPK2aG7I6gPhU71Z4WpducrZYqGGZDsQ4
	 FYIXZd1okJsDb+PS1L2svzM74KKfQdIQqntJrprGKXiqc/P/4i7yJm6N8LjHRheVxn
	 q9X563tvlKMjw==
Date: Fri, 10 Jul 2026 12:35:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xiaofeng Yuan <xiaofengmian@163.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, 
    Charlie Jenkins <thecharlesjenkins@gmail.com>, 
    Nam Cao <namcao@linutronix.de>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] riscv: add c.jal instruction simulation for
 kprobes
In-Reply-To: <20260701081033.49871-1-xiaofengmian@163.com>
Message-ID: <0dce8cf8-359e-a0a5-bc6a-674c7fc93ee2@kernel.org>
References: <20260701081033.49871-1-xiaofengmian@163.com>
MIME-Version: 1.0
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

On Wed, 1 Jul 2026, Xiaofeng Yuan wrote:

> The c.jal instruction is part of the RISC-V compressed instruction set
> and is defined only on RV32.  Currently kprobes rejects it, causing
> probes placed on c.jal to fail.
> 
> This series adds simulation support for c.jal and includes a test
> case by Nam Cao.

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
