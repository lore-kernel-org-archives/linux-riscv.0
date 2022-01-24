Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EE9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jan 2022 07:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6h7QMoSyotwr9Hg/pnlpRt3gvvkqewbnEKmR33g/9+M=; b=1jaxxyRjpsGnoD
	APLUP6IdifG0E70yOtiOM1AROsG6u/UwCPoaJtQTYS/afhyQUKc6XIbLjudO+NfenVheCFpMWTQik
	5+H/3ojJD3SXFLmnfw8BPHwsLNZgtQshi6En2u/s407HY1XznhNnNXK9Rh5es29X8PLEYPs6x3meb
	XkwiSM8Xk1/cilut2g+4riju4EKDToZIKUuLOnB6n9Ul3xlti4CUFoIMCdhtzoXAjaCVbxl/t+Rfq
	2Htp+UTQQ4TDHujiS+KledvVAtPjgZQ5IEHrQChSqjb8QyZzn0p1rDN8E9weEqbW2YRZh6bhPaPP3
	qglKu+WixNLxp9Ir516g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBtgI-002TpL-JS; Mon, 24 Jan 2022 07:22:26 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBtgF-002ToQ-HK
 for linux-riscv@lists.infradead.org; Mon, 24 Jan 2022 07:22:25 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 898DB68BEB; Mon, 24 Jan 2022 08:22:08 +0100 (CET)
Date: Mon, 24 Jan 2022 08:22:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, dlustig@nvidia.com,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, huffman@cadence.com,
 mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH v5 00/14] riscv: support for svpbmt and D1 memory types
Message-ID: <20220124072208.GA21441@lst.de>
References: <20220121163618.351934-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121163618.351934-1-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_232223_772062_3C6C7788 
X-CRM114-Status: GOOD (  10.72  )
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

On Fri, Jan 21, 2022 at 05:36:04PM +0100, Heiko Stuebner wrote:
> So this is my try at implementing svpbmt (and the diverging D1 memory
> types using the alternatives framework).

Please spell out what it does.  While I can remember the original single
letter extensions very well, the new priviliged extension naming is
just letter salad.

You might also want to explain in more detail what it does and why you
want to support it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
