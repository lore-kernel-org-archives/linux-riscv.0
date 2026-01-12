Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D56FCF45AF
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 17:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7XrXgoLeaq1IJNgAygLhR1f3NOIx2nMR4FF6yMvHIw=; b=s9Bx057qPblEvq
	Vg86Mj6Pbi7cA+XLSY+Wc2nOap+PJcEWWoE7A/e9Fr7dZlvNAdum82RnrE7Mk5TclBLFhfONKke7W
	0rBoujAr35pxeNwkPbCeVuirhQeC/rNiS+ZndiNzuLVuS+NJew4lg8OGeRcbkOiL8saGNDAWEd2hh
	bdpmtCBud190oSdCYcVlU30xECLGgkbqysFQle3+BDu6cK4E3DoVsTwzGek3LSv29SOxv7+Sgv/Lr
	N3LPR71H4URTFEwPkkO+JU3AP+TTAYuj7PWVrKok4Ay0Pm0ZJKJFUYtczY8GKQfl5UDGXHD8vLvSd
	XAyM5EeRFQgrenYftl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLUP-00000005prC-1ABe;
	Mon, 12 Jan 2026 17:14:01 +0000
Received: from chamillionaire.breakpoint.cc ([91.216.245.30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLUM-00000005pp7-1v2O
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 17:13:59 +0000
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 0329C607AC; Mon, 12 Jan 2026 18:13:52 +0100 (CET)
Date: Mon, 12 Jan 2026 18:13:52 +0100
From: Florian Westphal <fw@strlen.de>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>, Phil Sutter <phil@nwl.cc>,
	David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-riscv@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
	linux-s390@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [RFC PATCH 0/5] net: make config options NF_LOG_{ARP,IPV4,IPV6}
 transitional
Message-ID: <aWUr0MpAaoPDED-f@strlen.de>
References: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_091358_632010_AA786CD2 
X-CRM114-Status: UNSURE (   7.08  )
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

Lukas Bulwahn <lbulwahn@redhat.com> wrote:
> Once the general approach and patches are accepted, I plan to send some
> further patch series to transition more net config options. My current
> investigation identified that these further config options in net can be
> transitioned:
>
>   IP_NF_MATCH_ECN -> NETFILTER_XT_MATCH_ECN

[..]

Plan LGTM.

In case you'll target net-next tree for patches 1 and 2:

Acked-by: Florian Westphal <fw@strlen.de>

I can also take them via nf-next if you prefer.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
