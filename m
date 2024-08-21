Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18232C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 11:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2ruSH0OCptAiMiauuZKarRTR6Veyycvv19XrHuW/Go=; b=KQfELmzgbDilTF
	aNfKM61aUckbaQ0KtSis9mqAqoADW9W6gnPRumZOisFAiuJu5P4xWgFtNc/Q6q+j4pcNrKhX3yV9u
	RIau2KxDkYKK34WJbKdVKBDwA5dhirK2qEUN0mRV1NZ5j1JKYntzYqxOM9Q2QORE7WA1cwFuE55os
	wPK+SjZJF3+ovihFIu0xzd+Uzltv67UKaSjF9bmH0uYZbxAyP4CnSUwVS0SR2Cwt/AL/TsJQJodv4
	wBmHGXrXGHB0oSC/i1P4B3DYVrU5T0WOMIcHtfBHfYm25gk8FQuP6F57b5cPIrVrCGTBGcTLK0Vbj
	D8Hb4Qz8k8s+q/lCBhpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgjpg-00000008mDG-1ewj;
	Wed, 21 Aug 2024 11:48:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgjov-00000008lzU-200X;
	Wed, 21 Aug 2024 11:48:10 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wpkyx6hvRz6J7nH;
	Wed, 21 Aug 2024 19:44:57 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id C2AA1140119;
	Wed, 21 Aug 2024 19:48:03 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 12:48:03 +0100
Date: Wed, 21 Aug 2024 12:48:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel
	<anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/4] cpuidle: riscv-sbi: Use scoped device node handling
 to simplify error paths
Message-ID: <20240821124802.00000c35@Huawei.com>
In-Reply-To: <e006aa3d-3ec1-415f-a8d2-8aee6847a698@linaro.org>
References: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
	<20240816150931.142208-2-krzysztof.kozlowski@linaro.org>
	<20240819171313.00004677@Huawei.com>
	<20240819171954.0000600d@Huawei.com>
	<e006aa3d-3ec1-415f-a8d2-8aee6847a698@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_044809_691572_62B12EB8 
X-CRM114-Status: GOOD (  20.18  )
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

On Tue, 20 Aug 2024 11:36:32 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 19/08/2024 18:19, Jonathan Cameron wrote:
> > On Mon, 19 Aug 2024 17:13:13 +0100
> > Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
> >   
> >> On Fri, 16 Aug 2024 17:09:29 +0200
> >> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >>  
> >>> Obtain the device node reference with scoped/cleanup.h to reduce error
> >>> handling and make the code a bit simpler.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>    
> >> The original code looks suspect. See below.  
> > 
> > Whilst here...  Why not do similar for state_node to avoid
> > the delayed return check.
> > Existing code
> > 	{
> > 		state_node = of_get_cpu_state_node(cpu_node, i - 1);
> > 		if (!state_node)
> > 			break;  
> 
> I don't see how __free() helps here. You can return regardless of __free().
> 
> > 
> > 		ret = sbi_dt_parse_state_node(state_node, &states[i]);
> > 		of_node_put(state_node);  
> 
> ... and this code is quite easy to read: you get reference and
> immediately release it.
> 
> > 
> > 		if (ret)
> > 			//another bug here on holding cpu_node btw.
> > 			return ret;
> > 		pr_debug("sbi-state %#x index %d\n", states[i], i);
> > 	}
> > //I think only path to this is is early break above.
> > 	if (i != state_count) {
> > 		ret = -ENODEV;
> > 		goto fail;
> > 	}
> > Can be something like
> > 
> > 	{
> > 		struct device_node *state_node __free(device_node) =
> > 			= of_get-cpu_State_nod(cpu_node, i - 1);
> > 	
> > 		if (!state_node)
> > 			return -ENODEV;
> > 
> > 		ret = sbi_dt_parse_state_node(state_node, &states[i]);
> > 		if (ret)
> > 			return ret;
> > 
> > 		pr_debug("sbi-state %#x index %d\n", states[i], i);
> > 	}
> > 		  
> 
> Maybe I miss something, but I do not see how the __free() simplifies
> here anything.

Personal preference.  To my eyes, it does, but indeed not a huge
advantage.

Jonathan

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
