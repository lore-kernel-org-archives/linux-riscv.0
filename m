Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20FDC021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 23:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpM8uKPtYFNGy68ilFpTSCNs+iFPul9QajrQ/EVrpVI=; b=fg2mMaX7f1BDsz
	yyloc9qNO8WIZ7Jh0p0POsopjmb9Hl9BCxHb7ybHqKivikoa9Rx/smpIgu3bro9UX4wqrPD85b8q3
	MWl9wKGAhnZPxW4XArZq5UF2BtSatnT0jS68Wg/gaYjDHd7WCfespcn+PL1POQJqWZXfZ2bGjqLnQ
	m4AEKTJ8pXdneHgCkIb7x33jI6Slo4B9YXw3WCSnwrkmA9B3aMHHzuoyF5+iUkLrEJ9obIFy59EqE
	0KrQvwjLB4w5WYoQf8ISlwVutmejwqEbyfao7sMpQ80WVq6GkossR9gZw/eY7KHpo8dVImusIxMXp
	qnzRVRNEj2WmMUELm0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlckY-00000007AJ0-1Rla;
	Fri, 21 Feb 2025 23:48:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcjc-00000007A9o-13JE
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 23:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D116E6834F;
	Fri, 21 Feb 2025 23:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17777C4CED6;
	Fri, 21 Feb 2025 23:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740181627;
	bh=tvv3CVQ87XW6GTiJt4OIp9rEWjs0eLsUZyDUVJoleys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPT9Lg7O1nzU+AvI+rBrmJmC8YEOt3H6HDVBh7HSkg5s3c+I2H03VUnESWMDbHzfP
	 nss6JXkrt7usdqa6fd+30ucvq8LQIe3J4+sf5sGF0nf8utwVRFcaIM6P4VR+HGq25H
	 wtAkPzjkM9KaKcZqrRKQXTqwKZeIMScjiU5jXqQKtHnxAzqXmh9rX3SsWLB7aoFlmD
	 zNWkvPRm0dJK4WfBiFE/SsL6E8yrp+3OmZlKCZJEabxnbYjWAfYVAlM4JLlejc9C3s
	 Endn+cfU+FrzRy/qPcTjyYLBg5ywdF9g6BVlUzMxpnpEkpJkL5NCtXR3ETikmxNlt0
	 CSudVOtPFFHPw==
Date: Fri, 21 Feb 2025 17:47:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: fengchun.li@sophgo.com, paul.walmsley@sifive.com, inochiama@outlook.com,
	arnd@arndb.de, krzk+dt@kernel.org, tglx@linutronix.de,
	guoren@kernel.org, devicetree@vger.kernel.org,
	u.kleine-koenig@baylibre.com, palmer@dabbelt.com,
	xiaoguang.xing@sophgo.com, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	unicorn_wang@outlook.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2042 MSI
Message-ID: <174018162492.399095.16752025893987256211.robh@kernel.org>
References: <cover.1740116190.git.unicorn_wang@outlook.com>
 <4967e01306c07908caebd60736f898579412765d.1740116190.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4967e01306c07908caebd60736f898579412765d.1740116190.git.unicorn_wang@outlook.com>
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


On Fri, 21 Feb 2025 13:49:58 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add binding for Sophgo SG2042 MSI controller.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../sophgo,sg2042-msi.yaml                    | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
