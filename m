Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A822BEDF17D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 16:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68MCrOzF9KEUKQEiYLNIu911aN3SxlM6Mw5njVkZi48=; b=C/O7vQKMBLRiRN
	5wg2PSwtP/gE/EqlsTHJ3IsNKJJXqVSIX6t217IZ4vFxUBwQmVttSiwSbJhvg7SYd6WhaG+YizB1f
	IaJTJfelwfKwiZ/D19rQQc1+6itz/zhziL3wLd2pvIEj4uqESiW7NVX57OjJaPdlaGT5NyyxY+peo
	LdXmFoLRUhKlQXeb545tIQ4CnIeW6MY4stGQP3ZKh/sBptrag/3p77FLS+07P+nEz0Bbn7cbhqUtq
	WOW7S8wbMAeTltqP2QIIZkfLIh1lozHOItQYE328utfYEE+Y9PJZtElu5qS3BDPrFpJN9HmcT+q/d
	0y4W+pn438kuc/09hC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwAq-00000003gwH-126U;
	Fri, 13 Feb 2026 16:37:44 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwAn-00000003gvv-4By9
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 16:37:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771000658; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M4DX0+b0/lyG76BbVQ1go5Ol9LD43YqFCdpFpRl4llknomFzWY91HaPgfrc/3btFQUS+Uz4iX0M8cajsNIRclGp04hjiXHg7u5rbnjilLkF0GYjYW+9iMXpgAQe710IzbbjvVhjW5d8tgOCKbh6T1eEZW+DxkOEUwa++7Y/6yXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771000658; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YofNjb9F7nJnYLObALJPsqyds5MUF3wsfDl2RGiiVUA=; 
	b=Ygy+OjV4AJfOSSMaZvvRWd0EG1rfZwtZnhFDbhhsLPJenpZf/LwN34G7cz8vaPWeRj7nG2u+TSIqBW+VJBVRE2xEbT+S5vZz38uq0pOqgXoGIVDh73grbdz4p6K9x1YFLbuysq9dtl3KlSSisgEfM2zTG1ueL4NvghsXuNDa7OQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771000658;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=YofNjb9F7nJnYLObALJPsqyds5MUF3wsfDl2RGiiVUA=;
	b=EHlR26S2RoJS9MGAbCknTzVl52mHXVvYunIvqgJfof/yDEK2RvAzMjHFwS9yWx+N
	SLaWuFmhgYXrU8aJhdaf009uhaa5WW5x32mcHhTFshXE/0g9FTFr6Cp/x5Ayo2jPCrT
	d0NB9cKJySJQDjLE4clZznEoJx6aIPJPr/kTTYTo=
Received: by mx.zohomail.com with SMTPS id 1771000650820508.8971456627156;
	Fri, 13 Feb 2026 08:37:30 -0800 (PST)
Message-ID: <f97dbaa3-b6d6-4dd2-aab9-f24a68c4adfe@zohomail.com>
Date: Sat, 14 Feb 2026 00:37:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] riscv: canaan: Add support for K230 clock
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <aYNwmqEjvfAahGA+@duge-virtual-machine>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aYNwmqEjvfAahGA+@duge-virtual-machine>
Feedback-ID: rr08011227773c48f09a28a37a0491e606000077113171c0afaafa5a929e7dc2ff82c0f8a2d6c87de7653125:zu08011227c7fca2267c3403ca2151b9a800000f0b0b4c1ec5ea9754d945c5804b4d6ef907f6d390bd70c97d:rf0801122c6b91044fa389d2e8eb47a6ce0000d4c63a5dec18103768d77ba63014ebb43c195e29e27dd0dd30ae3497c706:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_083742_095673_798956D6 
X-CRM114-Status: GOOD (  10.62  )
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


On 2026/2/5 00:15, Jiayu Du wrote:
> On Fri, Jan 16, 2026 at 09:26:18PM +0800, Xukai Wang wrote:
>> This patch series adds clock controller support for the Canaan Kendryte
>> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
>> PLLs and an external pulse input, with the controller managing these
>> sources and their derived clocks.
>  
> Hi, Xukai. Currently, the k230 initial series and the patch 3 of the
> pinctrl series has been in the linux next. So if possible, you need
> to rebase your clock series onto the latest linux-next.
>
> Then I will proceed with the development based on your v11 of the
> clock series.
I've rebased my patch series to `linux-next` (20260212). I noticed that
the patch which updated the `k230.dtsi` format has been merged into
`linux-next`.

Consequently, I've updated the `prerequisite-patch-id` for my series
from `deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc` [1] to
`9a2d01f55574b538dad572e193f81c44661f0853` [2]. Is this change correct?

Separately, I sent you my v11 clock series for PREVIEW, but it seems you
haven't received it.

Link:
https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/
[1]
Link:
https://lore.kernel.org/linux-devicetree/20251227092355.42825-1-jiayu.riscv@isrc.iscas.ac.cn/
[2]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
