Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AEDCCF9EB
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 04:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJQG1yTHysMYAvjue92L8AoVPip/g0PRVjDnGOnyxcs=; b=Cm/eWfflsC/yjL
	X4eCBL4rqAWs66VcdQ1AX0X8zz4g8nAZoLBgsesrXS+rp91cQFkWua60hLkxMh8/L+QHHBtKF/c5v
	sy2xeblSnV0cp/gXR00WyKHMQuBg9XrcUvV00g+c1fNlhWONmoxT3tnixo/TPhe11kPZarRNLQLOh
	+ncSzVPm/6Q7bAkfusPjNp0BZvnniznIRlMPe9rI6/yqH6xZAR8ya7r8819S8l3OSRBW62uWYa5TM
	fTeDDkldIip7vGUQAtr8QZmatJn0n5/FtZSIoqW/8zkEAzisWbQ0cpiSCc0DNbTBWgPH6r65XMJiM
	gLegionShRWLpQIKXVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEgVQ-00000005N9q-3Dc0;
	Fri, 31 Oct 2025 04:12:52 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEgVN-00000005N8q-1GJI
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 04:12:50 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7631425CC7;
	Fri, 31 Oct 2025 05:12:44 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAQWNjLXEiVO; Fri, 31 Oct 2025 05:12:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761883963; bh=Mzlx1Jki3My90PskIq5MtUmOdsEdvQ1YbxyQk8t4p7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=blwXw/iqmeep3zsYeN43m2KK2dR4wIw5kQXG/0YO0QKL32l86WcFNcvrENBUHaQwc
	 9jWd1J83d4FE1kTRhKKe12e7ZPnmS6Vf19f7CQGOjoCIYsdEJb8n27+EVshFNFFidu
	 psKZZVlyziI6sSEOMR+q4xuU/I5H/gPZ6WfVN3XiKubD17mzwNbgK+lzozRXdIz2L5
	 In+mzXmtrFOHz9vxBNP6Hrx3KxZkyxY0peXQ6Pz06AZMhjI7W0N5sXLVISXuII/xZo
	 5f+gYo/s5bKYyklK7oKlGuwg5f1hYZ7RXRLs1TaxmIaWnY09+GiQLQ7/qfIUaWGqKq
	 ptarl34+4hRiw==
Date: Fri, 31 Oct 2025 04:12:25 +0000
From: Yao Zi <ziyao@disroot.org>
To: Qiang Ma <maqianga@uniontech.com>, ardb@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] efi/riscv: Remove the useless failure return message
 print
Message-ID: <aQQ3KUap1cB73HOm@pie>
References: <20251031024328.735161-1-maqianga@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251031024328.735161-1-maqianga@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_211249_813408_FB574350 
X-CRM114-Status: UNSURE (   7.69  )
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

On Fri, Oct 31, 2025 at 10:43:28AM +0800, Qiang Ma wrote:
> In the efi_create_mapping() in arch/riscv/kernel/efi.c,
> the return value is always 0, and this debug message
> is unnecessary. So, remove it.

Should we make efi_create_mapping() return void at the same time, if it
will never fail?

Regards,
Yao Zi

> Signed-off-by: Qiang Ma <maqianga@uniontech.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
