Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F0ACD5BB4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 07:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6Zseg28HXxJZ6tobQ1X4OZBHMWw9bt+C5I6y7pTnks=; b=vnFEdyJaX9DQW3
	da3rGcMxJcSIX5SI10BvPfUifLG9HeSHdyEOZr8j0eaaPCyh90x/3KyjxkKkQhEVvLSn9nQI3GqwK
	qo7O9lxJnRENPOUaGsHFyxptD+kQHSUOuidlILSch0RZ7HO4v/HMeVZ780+OM1a92rNWPVBwRndNB
	C/YFbqS2ATHU7ZM4OXmiyUt0Nu/dwZ6g28i3VbZ6NheWWUPgCSood9OehhO+I6U/YilvWdNaepl42
	X7MeSNqtNdslXaKSw5cg7ZIg1hVOxH4ME6RrOUWLCP69y99IJRXfHV216pNRltXcvizAvqY+KTpLo
	IS0MdMaYrRNfLjyiQkwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRlxm-00000001Enx-29wV;
	Tue, 26 May 2026 07:12:30 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRlxf-00000001EmF-3KJZ
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 07:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=xdLV9XCgYqsM5OHnHy0sw5i8Vew1uihlr
	uMczZDwmYg=; b=ExW3m2pTqQLrnnqiAOLQ7nd6qeE6M0/6cZS8n2SwH18A73SCx
	xV0UUjkrV4+HKQ/R50qrxcs8t/Z3kerAs9VWGT4S0JJ1KMNt76pZgynWVG2Ou8Lr
	FvLVNXW/3owW5zRIOfARplQUdiYb5crOWkGHaRusrQnoovFBVegW3hgIGg=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkPrRxVq0gMGAA--.7913S2;
	Tue, 26 May 2026 15:12:43 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] dt-bindings: vendor-prefixes: add Rongda
From: Jia Wang <wangjia@ultrarisc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <51dfcffa-1f8f-4a51-afc4-2999748421a7@kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-1-bf559589ea8a@ultrarisc.com>
 <51dfcffa-1f8f-4a51-afc4-2999748421a7@kernel.org>
Date: Tue, 26 May 2026 15:12:03 +0800
Message-Id: <177977952368.1243441.14554680726787022592.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779779524; l=686;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=Kxhh7KR6iwJWM3QD/Mg3E6gH0ENEw3j5HM3LIkiOX8M=;
 b=ti5d/XWaly+TePGbcsCTGPdS7xDmz9VMatjcxDzr3AFRI03LMtglkK2UiKuL0YX97CaHPaMxu
 y//z916nWBTAQHrrludAf8B9sIy+WZ6mx5fAakXRmQJ9nwSKCeCZmTw
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwAnEkPrRxVq0gMGAA--.7913S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF47XryUCr4xWw4xWrWrGrg_yoWxArg_ur
	Z0y3sIva4DXFs3tan3AFs3G345tFsYvryY9348Xwn7C347Ary8uw4kCr4akwn3XF4UW3W2
	kr4Svayq93W3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-AFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAOEWoOgUUACgASsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_001225_913560_790D2BF5 
X-CRM114-Status: UNSURE (   8.43  )
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

On 2026-05-21 22:51 +0200, Krzysztof Kozlowski wrote:
> On 15/05/2026 03:17, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.
> > 
> > Link: http://www.shenrongda.com/
> 
> So your prefix is shenrongda.
>

Thanks for the clarification.

I'll update the vendor prefix to "shenrongda" and adjust the compatible
accordingly in the next version.

As discussed with Conor, this patchset will retain only the pinctrl binding
and driver. The DTS and the related bindings will be split out and submitted
separately. 

> Best regards,
> Krzysztof
> 

Best regards,
Jia Wang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
