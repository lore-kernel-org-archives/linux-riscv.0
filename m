Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9F7ECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhjR/q20bC2BwxG0QHTeG0bMQDm8BtYeRiuQqIaW4u8=; b=TgFIAY0blRC4H7
	eQAq0t1YUhDd92plmQ+aWwROrCoqU/F/ZcTXyJueyK1DMXQqdrH7kRkZXxV+w/Y0BJzUeqIaaAIyB
	AS7hRDb6z/eK3ub7iYTJdia6WeTkFVMvU4crEKZQKlEAd27AXxXvDVB3Rt7L5xqzQcOsneJiuqt/R
	UE/dssPm/bj3Aa4x5iUzXWy67Xz+0ASHCsVpt2z8fAVQnJn3ID1dsriRxikPuTtLBWSVO+F8cquFm
	TQ3E06iziJxi4dzCIqFJnHxWbQ2OHFVRhEo+U2TxTCdBpXLIklgAuIiGkQlUZgeNsDsqG6ibrx8fJ
	SI60SU6fjPkWW7SOEu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxQX-00FZVJ-Fb; Tue, 30 Aug 2022 09:20:57 +0000
Received: from forward503o.mail.yandex.net ([37.140.190.205])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxQU-00FZQM-4w
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 09:20:56 +0000
Received: from vla1-ef285479e348.qloud-c.yandex.net (vla1-ef285479e348.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:35a1:0:640:ef28:5479])
	by forward503o.mail.yandex.net (Yandex) with ESMTP id A91CD5C485C;
	Tue, 30 Aug 2022 12:20:50 +0300 (MSK)
Received: by vla1-ef285479e348.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id DEImCeimEC-KnhO3vEJ;
	Tue, 30 Aug 2022 12:20:49 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail; t=1661851249;
	bh=ySfz/LY99LFzaToppHOlG1ynyDBOH7D7JAMHAIQZI1I=;
	h=In-Reply-To:From:Date:References:To:Subject:Message-ID;
	b=b+JiionGVRrdT+/2QLu+NMGmwqM1bQo7yVVFoEBNF+YNobos7Uc3v6r5SUEKk0/DP
	 gtjSrAcwCl9Ycl0dnLEjya1Y/gB56aS2f1jCO9D1F5OQLoFZi3tH/yX93Af3lbYbDf
	 okX3/akvLqu1DfHIkoDa3IyBVJLYwSPJC+ua608E=
Authentication-Results: vla1-ef285479e348.qloud-c.yandex.net; dkim=pass header.i=@syntacore.com
Message-ID: <adde706e-1d75-8241-fe2d-955035f88f2f@syntacore.com>
Date: Tue, 30 Aug 2022 12:20:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] riscv: Fix permissions for all mm's during mm init
Content-Language: ru-RU, en-US
To: Conor.Dooley@microchip.com, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220830075900.510105-1-vladimir.isaev@syntacore.com>
 <26ec07d5-14ac-f77c-00a7-23ea77ebeef6@microchip.com>
 <6e0aee65-37f4-ffa5-9adc-039ff3085b07@microchip.com>
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
In-Reply-To: <6e0aee65-37f4-ffa5-9adc-039ff3085b07@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_022054_433605_DCA4938D 
X-CRM114-Status: UNSURE (   9.97  )
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

Hi Conor,

30.08.2022 11:31, Conor.Dooley@microchip.com wrote:
> On 30/08/2022 09:21, Conor.Dooley@microchip.com wrote:

>> What is the appropriate fixes tag for this patch?
> 
> Also, you should run scripts/{checkpatch,get_maintainer}.pl before sending
> your patch - many of the lines in your commit are too long & you did not CC
> any of the maintainers :/
> 
> Hope that helps,
> Conor.
> 

Thanks for the fixes! Sent v2.

Thank you,
Vladimir Isaev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
