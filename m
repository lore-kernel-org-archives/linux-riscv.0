Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AC3CF6D38
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 15:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsGCuoU3ZbXBrt1saguMD6AO1dGItOHi8ND0kBhWhIU=; b=CVOf8SPoVM245O
	E1FahtvPYRFsD16o1OX+r6T86tCtFbuhQHganrPlzUk8B6DUrq1/eqeCKPCQX/Mq/s54uNHwW+dRv
	Uf7jq3CqlzjzzPC/AXwBJcOIWDBfEKrwVq8vkUiw01kPf5C+ZvIBbvCSmKqYeJdnTLWs+a1fhpvm1
	6rCTskNlQvqLhOpF1tGy3t4E5Q5V9GvFkB5/tj/eLPpw5Pq8pHScevsHR/+U0fWSf+4WJd51eRqLV
	ilAZ5M4xhh0km7+RYh337yMpBJ2BvmXFtppjxBtXHj60z2m4cNOI7YmwdU0c+7kxG2B0rtR7nYy0D
	qL+sI7hY3QICZycELSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1Ob-00000006hJx-1RfI;
	Wed, 02 Oct 2024 15:36:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1NB-00000006gp5-2bJ7;
	Wed, 02 Oct 2024 15:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RF3Yt7mUhMh9oXBfNRlXYo/9TTj+JpEotlqG6mQiyzc=; b=bXHTMLw64O2XzJunhOyTUZn3TK
	p6e+Z2FtDCcDxvP2FrrMqADCT5p80CU+vWpuRJAN3+95RLNLCv4bGCBxT6iz69fcGWiq8/MgboEtL
	bANHYwMi5XO1bZ6OnOrpIeCHp4sadfowduY1EmaVqjiqVmi4UKbDvhE6E4ugdNk/zG3o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sw1Mr-008sC0-Kh; Wed, 02 Oct 2024 17:34:21 +0200
Date: Wed, 2 Oct 2024 17:34:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Add the dwmac driver support for T-HEAD TH1520 SoC
Message-ID: <99af411c-ff40-4396-a6e2-5aac179ba1be@lunn.ch>
References: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_083441_677455_0EBB8C57 
X-CRM114-Status: GOOD (  10.36  )
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

On Mon, Sep 30, 2024 at 11:23:23PM -0700, Drew Fustini wrote:
> This series is based on 6.12-rc1 and depends on this pinctrl series:

This is a network driver, so should be based on net-next/main.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

>  20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com

Everything should meet up in linux-next, where it should work since
all the dependencies are there.

    Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
