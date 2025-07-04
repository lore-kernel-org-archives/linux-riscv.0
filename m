Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2A2C83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 13:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNWWIsSNBqWSDFwC788sm/1scnECAj5LtVHbhR14TSw=; b=t0e2ixgnfmT1lV
	TXHOU7F3SDu+f3yS/wGbwEyDYmiCbbYtInfqvMjoYSnH3I9n8Jmst9Ptr5OtCV1GNOxHtUOwVnEGa
	v8/NhdyeA8xLQ4lOkaDQnTDQ5VEFIvTC8cjnTnI0qPEOkB9Dx9s5bMgTMq+tIw0ahprF0VA+Kkyde
	+nHUpvip5BIiJGVtqByCxXXAchi224s5U0KbxxPUbx3xGxL1psuYTuq4pG/xHEduCYQjjSS/P+q8b
	H6Pi09m8JKO/NsMPWrAhOk/gweKa3QvcY1AQ02wDGdMdz+KCSRNpt6s4F6X86Ck1p8whoC0EPiztF
	w8nL/o5mOVXqY8jhW3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9w-0000000ETOP-1Jv4;
	Fri, 04 Jul 2025 13:08:56 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg8h-0000000ETDA-3CeK
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 13:07:41 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 564D75Qd002650
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 4 Jul 2025 21:07:05 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 21:07:05 +0800
Date: Fri, 4 Jul 2025 21:07:05 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>
Subject: Re: [PATCH 0/8] add Voyager board support
Message-ID: <aGfR+Vx0dseqgmKW@atctrx.andestech.com>
References: <20250704081451.2011407-1-ben717@andestech.com>
 <cb8891d4-de4e-493c-9914-0391b3baf212@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb8891d4-de4e-493c-9914-0391b3baf212@kernel.org>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.173]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 564D75Qd002650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060740_305447_E2C7F092 
X-CRM114-Status: GOOD (  12.94  )
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

On Fri, Jul 04, 2025 at 11:15:43AM +0200, Krzysztof Kozlowski wrote:
> > Also, there is a patch dependency in this patchset:
> > Patch 2 <- Patch 4 <- Patch 5 <- Patch 6
> 
> How? These are bindings. How DTS can depend on the binding? Do you have
> akcs from their subsystem maintainers that you are sending it here?
>
> Sorry, but no, this should go via their maintainers, unless they did not
> want to pick it up. Is this the case here?

The dependency chain arises because each of these patches introduces a new file,
requiring a corresponding update to the MAINTAINERS file.

In v4 [1], Rob and Daniel attempted to merge Patch 4 and Patch 5, respectively,
but encountered conflicts in the MAINTAINERS file. That's why I specified the
patch dependencies in v5 and this patchset.

Now, I understand that binding patches are typically handled by subsystem
maintainers. To prevent the conflicts again, I think I should gather all
MAINTAINERS file changes into a single patch. Is that right?

[1] https://lore.kernel.org/all/20250514095350.3765716-1-ben717@andestech.com/

Thanks,
Ben

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
