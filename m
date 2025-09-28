Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B66CAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 04:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqSY6ZjwGbtPVe5QPFiL5kNHQFhroDHwublQD92Ml+c=; b=PTY60X3zJYg83w
	aBHZGG1Tp9A4i/UzCfRsW8+LOyFV0MVQb0zT7vbbl0jJl3GV2VScids35XNVNAwfy3ogfacuLUog3
	TqHY+ha6a5xGv1PuIau+qnsCvwJms66aaZm1jbwRJkf/Gm/8Y05HXDYBgV+cA9yuJtgpr156vBvYu
	jXymb73pe2/Wm43/HG+g9BXe7m5kqoW/ybvl5DYgVzqoth2ZfaZ5Pc8Bb7D4oY4CjHx4kqugX4zRp
	RTeVtlw+ovazzQK2yEvkSX5wnx9ggzpfJ52bLsvhAUDwgKLK78tmI71LxPgkOSGXHsyI1ozlVe2Qc
	txP8oVwn70RlCmwN4zew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2jSw-0000000DvAn-2kJJ;
	Sun, 28 Sep 2025 04:56:54 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2jSt-0000000DvAA-0iCd
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 04:56:53 +0000
Received: from [192.168.2.54] (unknown [98.97.27.29])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E13D0B220091;
	Sun, 28 Sep 2025 06:56:41 +0200 (CEST)
Message-ID: <83fc0f4d-1e7c-41e0-87b3-bfcb84a0450c@freeshell.de>
Date: Sat, 27 Sep 2025 21:56:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
 <C16FB37F0982124F+aNi46yQc_e-gCIvL@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <C16FB37F0982124F+aNi46yQc_e-gCIvL@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_215651_397178_8DF5812E 
X-CRM114-Status: UNSURE (   8.21  )
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

On 9/27/25 21:26, Troy Mitchell wrote:
> On Sun, Sep 28, 2025 at 12:16:48PM +0800, Troy Mitchell wrote:
>> From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>>
> My SMTP client messed up,
> and both 1/2 and 2/2 were sent from the wrong email address.
> 
>                                          - Troy
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Confirming it is showing up now. Thanks -E Shattow

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
