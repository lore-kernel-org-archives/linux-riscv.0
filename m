Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E3AEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlJhPjKmMzITp7tt2Uvk1C+e9YzxB51Ng2e2AZkrVOU=; b=jons7YBA1JQT0W
	ecgfUr3Ewv4+m1p6DlSve39EKllrn0L7rlYQS1zf5aVmc1yA9PfXNFzqHxTmYdZS1ckSMykAzBRGU
	VZVXJsjPQNABmD5SUmvXjekYY7zfi8JEu+lktXHv2EADWPzWdsW9jGMgMqEM9fJCuZglwMShgYIyM
	zlMu5RcCeKne7/J8HMo9ofg6SFimgmfdXOy2jXP/RQu/oHCIiI3otQ2fSuj97EkxT5wWvdMTld1wy
	ToOztpXhxvLbJAJgzEGGEE7SAXpD8LYF7/nlzzDwNKTaqtg2FqMCOj6gbX45z4YhqimOjWh+DiV98
	l0IHH/tpNNIbDRXOaU5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJdP-003Tv9-1u;
	Mon, 17 Jul 2023 08:31:11 +0000
Received: from out-9.mta1.migadu.com ([2001:41d0:203:375::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJdD-003TsQ-2G
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 08:31:09 +0000
Date: Mon, 17 Jul 2023 18:28:16 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689582657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QJ9/CuAa6+LDouLcF91K8imsDM9eYpGUVmE6W2rOKk=;
	b=CoVglM/4wL1Z5nL8yMaZJ7znRMpZp0juZsyvKM1r9iXeox57COEWWEsPGVu2/0Q8+zngEG
	EQc/q/RmbmK88P/6Nh3nT7aR+v+b/pzh07rvYJLxP/btmPrScrmmSbndZ47MFNJxfCkBZt
	TJddnOThZI8a9Nz21hPzJqNmEjekLZrHfgFRhlIXasMeqn2tzTe1lTpxjvLIh1EX7C5KtW
	EsbcVgEVgzPooo/++nqSAsgX04TEIMLc83lGZ8JhTqI26z86IB2V+XD7IzH3hbdKmpLNPd
	r/hjcbuS8f4/M115X7hwukpAbTWAusuOyZJCA6T4TkrZhhFrNYWC3uKT+WERJw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-can@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/4] can: sun4i_can: Add send support for the Allwinner D1
Message-ID: <ZLT7oPwl1O2TXpxw@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-4-contact@jookia.org>
 <f3b1240a-4be0-4c02-0a63-561499ad6d0d@kernel.org>
 <ZLQgQAigmhk9uYYd@titan>
 <eb2d6e5a-595f-85f2-fe36-8acbb76d3987@kernel.org>
 <20230717-aluminum-driven-a008473620ca-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717-aluminum-driven-a008473620ca-mkl@pengutronix.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_013059_883475_77E14BA1 
X-CRM114-Status: GOOD (  12.03  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 17, 2023 at 09:03:06AM +0200, Marc Kleine-Budde wrote:
> Jookia, please let the patches build on each other so that the resulting
> kernel is consistent. The kernel at the state 3/4 will build and load
> the driver on the D1, but it will not work, as the new quirk is missing.
> Please exchange patches 3/4 and 4/4 (add the sun4ican_quirks_d1 in patch
> 4/4 only).

Shall do, thank you.

> regards,
> Marc
> =

> -- =

> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=FCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
