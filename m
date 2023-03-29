Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D4EC74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LokLAN8Mrj4xyZPawHHeSNHL3WEozemEaJ8EHzEPf7o=; b=L2f+Vha+GEOAJb
	0JDhx0QByPyP30XAj5hVukXWvP7NILI7fSa0OHCHlrfJmqGpvgRsVixnG6fcoK3l1mZWy04rEQ0ky
	J7RDQtw0CakhRLqsCTm8tKttQoGurGaCU7YfuZg96WN2XLm7Zh/+hP1SUjvBALNzh24QjzH1hwZdz
	Fz8SftYmbhuDxSdxlxDcPFcmKHCMsCjHSK3j/hLYRyeuRsZos5Kn7r8vXcf1s4Bd2+SaaAwS9CDEe
	omk0iJDWttRxMs/MiihW+JKD7WAajrnuidKYdB+47fU5r9pH3CDFy1GtP4Hq9DbbsCiFSkvmCZ4De
	RwEIWU9m+QEmrtsLn5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phamJ-001WFn-30;
	Wed, 29 Mar 2023 18:44:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phamG-001WEB-2j
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 18:44:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 97E19B81E4A;
	Wed, 29 Mar 2023 18:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241FAC433D2;
	Wed, 29 Mar 2023 18:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680115441;
	bh=AdTMFlaA1yVpN8yNukEmcL6Sup36/1XqYQqUHYbspDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gchDkbybXrNa2nr5NVf2u/a3UBLqWO4oDXNai1+pd0Y+WcT05699mtknFCZ6mC04k
	 f4eBJXcNS8WKaxncS4UezFbxNraVBIXjwNwnyi/iwFeeJEpv2y/ABSUFjbR6za1oor
	 o0Us/G/C9mS0f03HI4KvA3BqUjFo6lr1PPoJ7xursEwwI0qWuS8n9T+z0M84A3xgUq
	 LKE5LnD6r9J61sco6GQMTOrFgd8FzA0Qq1v48meX9Yl8bBOcTpKB0ULf52FOWctPvw
	 aK7S1K+9YpwkpBSnHNwYMzV8W1LtbgB5JgiR7JtXhRaTZyLlkdHXiKthNJITvanvJh
	 k6iXLWOW74/bg==
Date: Wed, 29 Mar 2023 18:43:59 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 0/4] Implement GCM ghash using Zbc and Zbkb extensions
Message-ID: <ZCSG71bRuTzVutdm@gmail.com>
References: <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_114409_034781_35155E45 
X-CRM114-Status: UNSURE (   9.08  )
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

Hi Heiko,

On Wed, Mar 29, 2023 at 04:06:38PM +0200, Heiko Stuebner wrote:
>
> [PATCH v4 0/4] Implement GCM ghash using Zbc and Zbkb extensions

Has there been consideration of implementing AES-GCM instead of GHASH by itself?
This is what arm64 does, for example.  There is not currently any use case for
GHASH outside of AES-GCM, and it's more efficient to implement the full AES-GCM.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
