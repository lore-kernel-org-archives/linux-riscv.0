Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0547CA0EF8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+yyJQTP3E+ky8A80UDPaT9grqbcrKPL0LLI1PBHOO0=; b=jjLhmt0WWZJ8EV
	RMMloYDEtN9WXhvccdQ/0cDABPCdxlQ3ipjMW7jvAy11irMO07EeiWQeTYQ+yox8sngVBpzfM3eyq
	lbGTSSYerw8YPmnxk3zjGG74RW1J1vyd/JkCRJZ+SF/E8pF6ggTLeRObJCRaX4MSJf721g0ecm7Tw
	qPkkHmCA7Q2Xiu3XsK3NhKpF9uDFTvk686y50xLhTMqfpCx7lNMh6A/dyzWv6at2b5hpH9pd5hPY7
	bbHY1uu1BBwD7l64lUBZ4TMe3RsaDSEGNQca+3LS45R47sIRjq9H3ZOUnnDl5INCinjG6yXOU3KNk
	kh7TaQb5kXpb8UBL75OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1mb-0000000GRZq-3Ch8;
	Thu, 21 Aug 2025 09:40:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up04H-0000000G9cf-3wr0
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 07:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54365601EA;
	Thu, 21 Aug 2025 07:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A175DC113CF;
	Thu, 21 Aug 2025 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755762641;
	bh=qnJopNipLh3FqGklQ4hmhZnz9mS4vFaKnOdQxhh9jqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUMexZGgu5yeuoQuKlzmsf0qMrErQ6EGUpsD8tZsus8qNWWKEvuMr3p8hgJ2YXAhY
	 NoPb49I0Rr9NC5308lEwTyqLGl8yQ50rGy1BnNymu3gR8U1tV3odNXtdPow/AFO2eX
	 ukk4QWUSuDtlFE7ipDgHj5iEmUJiOHc6jAfst+XPtAHmby7gqTxKfWYflVg4yNkx7m
	 m/m2jtf3pq5JnrWrG/IkQkjFZmBeRJSwdcgNyP7gOsbhzqRRB4EwzoC4abnD7SUJYc
	 kzVC/cl/Ln/JHMzNr01S1AYoaUL8qaAErB8Pg5RD7TWTR3KLT1nFAwfkJnxUj+aab9
	 03KE8nGXlji6w==
Date: Thu, 21 Aug 2025 09:50:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v2 2/3] reset: th1520: Support the new compatible for
 VO-subsystem controller
Message-ID: <20250821-helpful-chupacabra-of-fury-b6b3cb@kuoka>
References: <20250820074245.16613-1-ziyao@disroot.org>
 <20250820074245.16613-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820074245.16613-3-ziyao@disroot.org>
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 20, 2025 at 07:42:44AM +0000, Yao Zi wrote:
> The reset controller for VO-subsystem is previously described with
> compatible "thead,th1520-reset", which is misleading since it implies
> control over all reset units on the SoC.
> 
> A new compatible, "thead,th1520-reset-vo", has been introduced to
> describe the controller's scope explicitly, while the old one has been
> deprecated. Let's support the compatible in the driver.
> 
> Fixes: 4a65326311ab ("reset: thead: Add TH1520 reset controller driver")
> Reported-by: Icenowy Zheng <uwu@icenowy.me>

Missing Closes tag. Explain where is the bug. "Implies" different
meaning is not a bug. You need to describe user observable issues of
this bug.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
