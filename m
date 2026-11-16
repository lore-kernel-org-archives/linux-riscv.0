Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41F8606A887
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 01:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FvcS7iYK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bI058RwZpyUo5VW8DJV5aacy0cAybktVgn5m39iR0ME=; b=FvcS7iYK1677tVZPqUyhqRIGUX
	rVFFLrb1PGwo388E1gUosXWjZbD2THXx41bY0qc4GHbGhE3U/momxNZWVcFTK87PWJ6HQogHdXGKb
	V+Qmcre21ydaFJH6Q9Jt6+0o8B5fi/w1Z95sUKYQYIrsHezB9//KsmWATVQpQRKjIwWFNBzi6U/Z8
	GhqLf6SX1doqypKlzJfGYeuO9FqRa6pI1mzZdqUXr6LTJ4Puo7BEzSm+keUFBZEkmudw6lB8kaJmG
	heCoCKLbwgzSBryJVfS4RlDcHT75hly98pDBv7NG/iGlrpNNzndXJSl+byCcy4C2AHYmST63yeh3I
	+K+CZzAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSlR1-00000000rD6-2CzX;
	Mon, 16 Nov 2026 01:23:03 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSlQy-00000000rAf-0CfZ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 01:23:02 +0000
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AG1MShj096367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 09:22:28 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 09:22:28 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Nov
 2026 09:22:27 +0800
Date: Mon, 16 Nov 2026 09:22:23 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jic23@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2 00/19] riscv: andes: make the LLC driver and cache
 errata generic
Message-ID: <avpaz5nZ6UsSNo1Q@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113-overcoat-facedown-fcac3e162931@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113-overcoat-facedown-fcac3e162931@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AG1MShj096367
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_172300_474901_EB4D5566 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 04:21:53PM +0000, Conor Dooley wrote:
> > - Patch 19 adds the andestech,a27l2 CPU compatible. The V821 devicetree
> >   will be submitted separately by Allwinner.
> 
> This patch is missing.

Thanks for catching this. Patch 19 failed to send with the rest of the
series, so I have resent it here:

https://lore.kernel.org/all/20261116003937.1776888-1-minachou@andestech.com/

Thanks,
Mina



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
