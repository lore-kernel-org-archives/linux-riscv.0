Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DC1C5321E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 20:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4UbO30gBnjvLF6CbDNNfDZ6w1sHVmcydUbCQqHDONwY=; b=msoabDrYBfqvj2
	VHe73QfTNvBk89aIp0//0h9Ai44kVrtTrf732GqZw82yel7NLi62y92sL83MXZCVnQDR4IpziD+yx
	O0JY3oSRxr0QsrPo8o+NyWRhGXoWROat28TRq8i32WZ3PxmW4IOPQjjXwYbzkHeVW0DXgfPHyoprg
	qH9YWydUGl+I7dmANx6iAeG+wXUMRzSyf0RQNjhwul4OrEwk7l83zPWoj/qZa20RsCdWj/JX81e5U
	ksbOo5Tbq99Z6DBC5Xr2a1pTFF0ELIUVeqaRly/GUVPwRcvmHo9W+4W4gayXSAuiAlATAOc9aoV5z
	YDbc/BTSiR7CbkAZG2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siJgK-00000004yvu-27mD;
	Sun, 25 Aug 2024 20:17:48 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siJeu-00000004yfH-1a0u;
	Sun, 25 Aug 2024 20:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1724616979; bh=IftuA32XlEbaZofHucC96uY7DnLWjOMFJXrYAbowuxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vw5M0PGHSNqyRDXXTCPxp04Ukp8NusTDFoBlaUrO4IpxPVCSVz0aCiFT7RhvYHFYi
	 BLPBRrnIvlD4n1FzWgZC+JcMNH8Wu8IvlGXZXArhUsGsrfrv0D41jcYYB0Isp1+1y2
	 FC08j6ikn9su+V+x0pL+ZYGuvABVIkiUbl55glvUY+FqZVd3rgpiBpEz1/O3E48iDn
	 KqUChoLWVuXurEyBlNAjpSt8se06GjGiKlULuBbNs+hVCP8wrPS4qo/eBMV9F7oKOB
	 q4sJwHctlKc4Yq39bcVNjCi+S330WhLm693p+k21iu7C/aeTm9dqMRzU3OKJNgnsoT
	 ivPXBQUh3YYZQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 00E9116C9;
	Sun, 25 Aug 2024 20:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1724616978; bh=IftuA32XlEbaZofHucC96uY7DnLWjOMFJXrYAbowuxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OVoCRC3kQ36E/aSOrcsfVbQpeix8i3FTvxZvC66afdP1KYM0WT5RjA6BYUXu/PC+A
	 o1k7LuuWROvMbLL1yNtBY94AEfFzkE1MMsoAC9R+BCXd8hQwmi4VjbpU425YrHd3SJ
	 DZFfKJr/6IPkDgt5Fp7ETlE8OSE8gjIKTEmgr6kz1WSdaNFZoKRt34Q+GnvuyPGv6F
	 H1bF/mCeE2mheqjcm9id8GWxpgGVCXFp1yeIlvJTMrmXmjv0wH9UsDS0QKDpUftoCN
	 YANumklnkoTAr0HoIPuGYUds1fjlYiFK8TjJEZF3TBMd4J1hVkJuqXXD0tYPp8vFwb
	 akdh8p4zN60Ig==
Message-ID: <31fc82ae-76e4-4045-952d-210f8c47d7d7@mleia.com>
Date: Sun, 25 Aug 2024 23:16:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] reset: lpc18xx: simplify with devm_clk_get_enabled()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Antoine Tenart <atenart@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
 <20240825-reset-cleanup-scoped-v1-5-03f6d834f8c0@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20240825-reset-cleanup-scoped-v1-5-03f6d834f8c0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20240825_201619_037168_D36C7569 
X-CRM114-Status: UNSURE (   5.24  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_201619_037168_D36C7569 
X-CRM114-Status: UNSURE (   5.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/25/24 17:14, Krzysztof Kozlowski wrote:
> Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
> make code simpler.  Change to dev_err_probe() in handling
> reset_controller_register() error to make it even simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
