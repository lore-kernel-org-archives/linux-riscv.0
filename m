Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B0CCAC5A7
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 23:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSwtb4KWtdQkLbIKvMAORfjq98NbpbWV1KizQWoDOvU=; b=ZbqhWjnIPoVxOs
	gONWUPPT1ZUgQZf4O0nAzDTsirmKSmhJ1QRJwKsd1BOy027e1zmZH6UqUtzjCb8ZIP+nCoRS2696I
	EHHJkGc+W1O5xu/4j/ZIqI0FA5nJDZhS34Of/kFSEAw4uyexppgV8kfnn1krX1Si6wGWYH9LjVtlO
	xd3QAkXaVshROra7VmnMXTQhp6SaK6KR54IubYPjqX6w+BujcJsG5OIUyLdQbcaG9g3rC1X8NAsHu
	y95lKIgrunemde+Pl3FPrYMO7FNK2rElTTwiDKUZK7GvtIddU1r5xd+Mc8gSzKsAJs5EX1Otfe0K0
	NwEdyoed7gakd8UdKWdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v06ki-000000063Kr-2F6h;
	Sat, 20 Sep 2025 23:12:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v06kg-000000063KH-1CFb
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 23:12:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC58E449E7;
	Sat, 20 Sep 2025 23:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BBAC4CEEB;
	Sat, 20 Sep 2025 23:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758409939;
	bh=eFnc9b1aoladqShWY6Ma0VhkLo6XXery986wD968NAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZz9J+MjJDl0UvG7r5/l1XW/V0b12bQdNcvgPUBCpjiNXi38BeAg0wndvCctQIusZ
	 JRQNgo2s5r3IVYGkTN0RsvAJm/TD7b7uube7HjIMwc+NCKicO06glpZcC1NPanxG/q
	 fTfL7XRimHxs94vMlvKtTVXxPn6Kil2Fb+Zx7fo34YFG/w/IYPENoZ0y/Glfa1QTJE
	 59Q5M/eL+Z2RYvpnDCGvRqQxkeXGIBXgo5Z/RcW2mJzSqhc+PfGVxILXmX2/gzTecF
	 wkCeO6iYhiRUoTNmtEn8s/PN9SCFXxJbIry6gMNW5z96hefum1S62gYwUYSawWCmPE
	 nmnjkfsCDzkiA==
Date: Sat, 20 Sep 2025 16:12:18 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] riscv: dts: thead: add ziccrse for th1520
Message-ID: <aM800uhWPZ3x28mm@thelio>
References: <cover.1758228055.git.rabenda.cn@gmail.com>
 <71ac2ff73a63bd8674c4bc91fd287390d5339609.1758228055.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71ac2ff73a63bd8674c4bc91fd287390d5339609.1758228055.git.rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_161222_343005_E7509526 
X-CRM114-Status: UNSURE (   7.40  )
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

On Fri, Sep 19, 2025 at 04:44:48AM +0800, Han Gao wrote:
> Existing rv64 hardware conforms to the rva20 profile.
> 
> Ziccrse is an additional extension required by the rva20 profile, so
> th1520 has this extension.
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>      

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
