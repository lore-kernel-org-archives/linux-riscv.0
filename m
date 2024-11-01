Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5C2E6F084
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAFaOo8cnlxDsh2n+rE04adn62L8WwWF3Nk+iLzBnVM=; b=QqZkQ1ErGfsaOB
	0qR8K4HsITfTC8v8OoqG2X3HQY7QGlOMU0t8pHTbS+7CHAmnBxdc/YRUbzkoc++z+c1iNOvQ4Mrfs
	j05GK/IzTCAIsYXFV/xnDKzX26OwHXUxmVIpG7ErtZl5sl1jSsQFIqDT77fWRoLuPGDxnMX1LXpS5
	sAyvErj9GhXP27T3YY9nqSJ9BNvQDs2DXRtbz9eu6ZTUmUQl/YkxV+HCtEvJfUs/mjl6uGf4Y4EhI
	+6tlZwad13P4Z265N/0cQdGd0VBDdS1S7cJTeTjILxj29r0WwqBAaOGOHiyKQQc+GMndY7peHeGcm
	sU03AvBUSU6ngzgTGB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xEn-000000086VP-2Kgy;
	Fri, 01 Nov 2024 19:23:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xEk-000000086Uv-3VHt
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 19:23:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F5BDA44C0E;
	Fri,  1 Nov 2024 19:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1F6C4CECD;
	Fri,  1 Nov 2024 19:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730488989;
	bh=IoVjrTz/gindmuxJ0QMs4DJ8o1qRWvbiA1FET2LLBkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrbdQDEX0OezccbcP7PeNYpAbB6P/SZVG7QBZZwDgeOkhjnC8oPjnF1ZxKOB/bIkB
	 LlBXi+kmCfNz7i3u3jE0VZGsy8SQJvYjFLdWDpOaYSMquMkiPCXh93J+c0AD9wbaei
	 W1ySLqXm7dWe3T8T0b1EWxsFhPzwcx80/zw756Tf2Bnqf37Dv0B8IAZoe61eVIr7vi
	 YiBGTeYv+N6ZZ6zgQyE1Snux8kYlZaXsTWxpLVb8Ep/dcWQtWLh1JbL2RmJ29K6ry6
	 CI+zbX9hAO1ttKqSXXeTczGw7U/Ixbi2RtjxxeFscreybr3KYUkPpb5KkYguDJa2wh
	 K60EcMgkUtE5A==
Date: Fri, 1 Nov 2024 14:23:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	inochiama@outlook.com, linus.walleij@linaro.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for
 cv1800
Message-ID: <173048898705.4061273.16401199278517673218.robh@kernel.org>
References: <20241029012312.3448287-1-unicornxw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241029012312.3448287-1-unicornxw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_122310_959033_4517C9C6 
X-CRM114-Status: UNSURE (   9.71  )
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


On Tue, 29 Oct 2024 09:23:12 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> It should be PINMUX/PINMUX2, not GPIOMUX/GPIOMUX2, see
> <dt-bindings/pinctrl/pinctrl-cv1800b.h>.
> 
> Fixes: 64aa494de6fa ("dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.")
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
