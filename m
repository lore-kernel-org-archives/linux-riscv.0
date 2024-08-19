Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956B4C52D6F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DjhDWzLvLoiIimDqp2Rzr1pmkcYcRkDNcl2x/+yfz8=; b=nLu/x3Q8VXAZ1S
	N43LzFrcUQ5euyjJwVxWwHi5KH0/p7CpCKWri+62wve6HFgSSWtigqnoFbyBwF1566RPzpRvkhAt+
	OArHmTeJG7SK5tx9YXRJDti+Wgi1Xp1OOGWT7vfyZS5SxEU9+fVqmVxpFe2D+VpioG5gYmLYbcF3R
	WlETrcy3rIrFa14Y+tKT0JqCTDrWvjVE1tWGeS0bZWZSEX53u1Sd9sPx8cLYJvRPmoUc9cl0guhfe
	y3oMl0iRvYC68Z+eT4hBi0hX7PKqByf9zpxh2T9BCggcINMGkcU3AmcXuTm7bgpqhx4Gr2zYCgR3y
	dEilQ7WHKxlNYfwoxLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5FB-00000002AH3-2edS;
	Mon, 19 Aug 2024 16:28:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5DM-000000029cp-16cb;
	Mon, 19 Aug 2024 16:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IGJaMG9qiozX2LdaUFuc0UpSRy3yDcaGi1eBuhF0YSc=; b=cXP2iQMx437m8oZpWC/v8UF0J4
	bxiFoALVEA2h6RkyUq2Cm1RIsU09EKTd7E73X38Urg5LMJLUzksqVY7JGqGcHEIl7Qo/vVBI2620r
	0AXIGQFuI9x5fp/oKS3Z1xj6YaFr1nRJYQx38zuLMFP5A8fQH49eYgJbglYPrLqLkQIKkQI0tJRR1
	4HjW7tOMVKopaV/vTF+ZnWUAUwjo6jg04UUtfXG/Gm/6tIG+PwPN5gwkCDLTOMQ0J/yp/+fdgwNgr
	Gtrd3j3S64VB2F68CNEMVpNRiR96GFm3Ru87Hi+Aj8Oe1rxI9U1DR2tT49hrTBArBlgpyQygteqx3
	V31bu42A==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5DJ-00000009Aca-142L;
	Mon, 19 Aug 2024 16:26:39 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WndFC5njvz6K5mr;
	Tue, 20 Aug 2024 00:23:27 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 609F8140A46;
	Tue, 20 Aug 2024 00:26:21 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 19 Aug
 2024 17:26:20 +0100
Date: Mon, 19 Aug 2024 17:26:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel
	<anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 4/4] cpuidle: dt_idle_genpd: Simplify with scoped for
 each OF child loop
Message-ID: <20240819172619.0000670a@Huawei.com>
In-Reply-To: <20240816150931.142208-4-krzysztof.kozlowski@linaro.org>
References: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
	<20240816150931.142208-4-krzysztof.kozlowski@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_172637_439106_F358390E 
X-CRM114-Status: UNSURE (   5.21  )
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

On Fri, 16 Aug 2024 17:09:31 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
