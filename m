Return-Path: <SRS0=A6Fl=TG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB96FC04A6B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 May 2019 13:19:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE77920578
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 May 2019 13:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n3PQc71p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KonHm0ud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE77920578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0NadB6PV3rj9NSFXazU2a13ydTi7m3aGhxAmT2QdfM=; b=n3PQc71p3Araeo
	kDIT09yQYFFlDlRl9SJ0F/HfCMY4YgpqzX+n3ofv7+Hu9UvCn8dXaJRYK95RPzXZKbRNVZFWX/B65
	ht+IXm6NsRkL9rzs3rttw9209EuBl3Y8XwXgcjgjGH156lT/YbZ92XSpMFeI3pCbtDQdt3sbc5e1V
	M0SZiG6fQrLu+oZBpi8++rMXRF7wvf/a0q+IsQDhAlcAkg9fOOp2jHXzmkOzlKOCl7Rraze6EpSHY
	t6SDZ9V3WslluMNXTveok7BzwMyRjnGNp3qeHNLXgyqIZmaBIAAXDxa3i4LXQKAllbvZW15qS9m8y
	JBo8edapQvsOLZ+yiYJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNdWo-0001Wz-KZ; Mon, 06 May 2019 13:19:34 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNdWi-0001LI-9o
 for linux-riscv@lists.infradead.org; Mon, 06 May 2019 13:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/39Byr8Jz1d2Cq9RZc884MwZCtSwkYNYQBE+LN5ZoMk=; b=KonHm0ud0tHXY8V6u9Y7S9GRJ4
 caA7TK2xPZ7euRsB90vYTt67HPHd3ui/AzbKSGb439axZfxMfIjQ3VZuV7YKUxD2hbNDAuE52+aaD
 dWD4Ta0yqq9x4lNYcvgxqC/9Xh5NlWev5/szH72aMCzBxow4cX3I9YL8geSvSZEQKgOg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hNdWZ-0004xc-1J; Mon, 06 May 2019 15:19:19 +0200
Date: Mon, 6 May 2019 15:19:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v1 v1 1/3] dt-bindings: i2c: add documentation for adding
 SiFive I2C driver
Message-ID: <20190506131919.GC15291@lunn.ch>
References: <1557147240-29551-1-git-send-email-sagar.kadam@sifive.com>
 <1557147240-29551-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557147240-29551-2-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_061928_744654_F947FCDA 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, peter@korsgaard.com,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 06, 2019 at 06:23:58PM +0530, Sagar Shrikant Kadam wrote:
> Add DT binding for OpenCore's based i2c device as found in
> FU540 Chipset on HiFive Unleashed Platform (Rev A00).
> 
> The doc explains, how to add DT support for I2C devices.
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  .../devicetree/bindings/i2c/i2c-sifive.txt         | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sifive.txt

Hi Sagar

Please extend the existing i2c-ocores.txt file, not add a new file.

       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
