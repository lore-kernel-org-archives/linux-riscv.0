Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BFFCA1005
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 09:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74SL8AESlpZye9hFqP0JUNBLd7gLcG56+hdgISNlnnY=; b=VZHq1Snu3YPcba
	PMk5TaYIjm79gWiecDZ0rvem+c2mUs4N5riLEnGGIyyjf7JUL1e4hoo+k9xNdOTDVtoLf88RqZnZH
	Ib/xalhFhppRQ1jZw/ThpiKD8VAtV0OUhSva1Wj1OhoD4VSvJPoDGmu4janPLWQTF/HmN2UVx5/0u
	GDCkJ8yDSkYHeWcWYUsyt/h3lDq/86LeOBUnn7aDxlzk/r1B253G+5p0NvN8ItNz4QqWVOc3/d8PG
	V636+6uP0QLnx2STvQQpuLhU2OOTUMbHzslFengWOS+wQcpGl8y4c/sKrOPCLemzr7PPjTpRhXNFe
	yu86bqfnV1MGjcKzXdfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNP1-0000000GP7g-09Kr;
	Tue, 02 Sep 2025 09:34:11 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMwQ-0000000GFYn-3MNj
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 09:04:40 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CDC1520D9F;
	Tue,  2 Sep 2025 11:04:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zhnfERamph4; Tue,  2 Sep 2025 11:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756803876; bh=VybVW/M85O06EpGLQb8cA55azBhCKHa2SYmQOC/9wUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NHMqfsAHt7DlunZl4h/nCBHuASSBKTn0YNZDRIE3yx9wEbO0F1jqgwPpOmxhHnbfW
	 HkIFjXqE/4PN7dO5gsxXEDiCly149PLq6eO6JNB12kbqdUXfHYnXfH38baWmp0BWEl
	 TjexwQ0IjANJcdG6qkfNpAGLjt//r1GgAYZxwkC1KaJHXA78TFmLdnN8fxhpNhPw1W
	 kNATLPwI4sQ3buNG5L7EZmWdyC3XQxM/b7SGA2LQBzD6nFT9RrLd9R3T8Whqj4A//6
	 TvZO8ZAu14tWQHx0I+Z1/1iwcg5YrwkBpLVFyGNpPTK+k46uDxwHGxzXrwtOazxPtf
	 jAY03cl38QaVg==
Date: Tue, 2 Sep 2025 09:04:23 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: thead,th1520-reset: Add
 controllers for more subsys
Message-ID: <aLazFzq2l7s66IqS@pie>
References: <20250901042320.22865-1-ziyao@disroot.org>
 <20250901042320.22865-2-ziyao@disroot.org>
 <20250902-peach-jackal-of-judgment-8aee13@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902-peach-jackal-of-judgment-8aee13@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_020438_970921_A633595C 
X-CRM114-Status: GOOD (  12.14  )
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

On Tue, Sep 02, 2025 at 10:27:53AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Sep 01, 2025 at 04:23:17AM +0000, Yao Zi wrote:
> > +/* VO Subsystem */
> >  #define TH1520_RESET_ID_GPU		0
> >  #define TH1520_RESET_ID_GPU_CLKGEN	1
> > -#define TH1520_RESET_ID_NPU		2
> > -#define TH1520_RESET_ID_WDT0		3
> > -#define TH1520_RESET_ID_WDT1		4
> 
> This is ABI break and deserves explanation and its own patchset.

The registers in control of TH1520_RESET_ID_{NPU,WDT0,WDT1} don't belong
to the VO reset controller (documented as "thead,th1520-reset"), and
thus cannot be implemented by it. They're in fact AP subsystem resets,
which gets supported in Linux with this series.

Is it okay for you to separate a patch to delete these wrong IDs and add
them back for the AP reset controller latter? Anyway, I should have
provided more information about these three resets. Thanks for catching
this.

> Best regards,
> Krzysztof
> 

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
