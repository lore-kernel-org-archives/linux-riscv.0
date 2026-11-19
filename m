Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AFB606A326
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s7gvBcX7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=OrKiLOrX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Message-Id:In-Reply-To:Date:From:To:
	References:Mime-Version:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=41TnuOvhQqa4tsyXCmzJuMIN+PKVTR3IOkS4urtFE8o=; b=s7gvBcX7DXJj6dAvEESorD71h6
	J1T3l/zBL4ih/3PNcGiJhxjC5hQhqta0CxRNhdsYXIqsnLv8+Zo6kt09Usnk2DdWLJPhtLWJArefK
	9x5Gr4jHy4/F2QC2rpdCUmc5EOeTfEe53E/ZaAfl7DVlCprr5B+/nlv5oKPO/LHFaNuHiyJSE4d1F
	Eh20B5xLnD7xv25dtv7dfjznzqXL9dO8M50SVviEr193WzJHNdLBOfZc0jilfwIQ5mU2M9jsf5Z8q
	cLM/yXpBXKKvsPCLVyVv1SdmPEvwCJNdq8ALOgJsSkQSZKKieNp8Tp4q/dZZX3qaSHG2qhChOKIyD
	oK2C0Ajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTydD-0000000BQlx-3Mb5;
	Thu, 19 Nov 2026 09:40:39 +0000
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyd9-0000000BQlW-1oYU
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 09:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1795081229;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=9Rhlrsd3szVwXHApQsxbvat4ytGyJqWvh7lnq+1BZZk=;
 b=OrKiLOrXkSfO3Wl8Nmlnhd4eUlf3qm5ZsPxTdqbyb8bWdsqoxaWhlxluMthcoJ4uVXNkD1
 AAocWj2id49e3h/34Xt/c2POGz/xASAoIu8XbrPYNFIxoAmcy3yUtRDnCxPRF97krWqPuA
 gMOt/V9Tdm7Xz9Yaq0pXtbht+LFZ/z6ODUSZU3Y78H9gtNG0Iam1HiP2z1MpYQ4hrneDEL
 F8mbpB6p0v4io9Gl+eIoawboWv7nZQhz34I3brdLdgdGFh0xauDNFgaLUP84UcmEe2X1/b
 Y7QII84y6W1b3Lj4ULnIZxwFn7xUnBd/ydiIynEi/TDtmEUlzLeD5qdTe+3YeQ==
Subject: Re: [PATCH 3/9] bus: Add SpacemiT K3 eSPI controller support
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io> <20261118085742.1817536-4-yang.wang@deepcomputing.io> <av4UUyCtDBJNU0h5@aurel32.net>
X-Mailer: git-send-email 2.43.0
To: "Aurelien Jarno" <aurelien@aurel32.net>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Date: Thu, 19 Nov 2026 17:40:20 +0800
In-Reply-To: <av4UUyCtDBJNU0h5@aurel32.net>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afec40c+e79541+lists.infradead.org+yang.wang@deepcomputing.io>
Message-Id: <20261119094020.1888153-1-yang.wang@deepcomputing.io>
Cc: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Received: from ubuntu.. ([183.23.99.162]) by smtp.feishu.cn with ESMTPS; Thu, 19 Nov 2026 17:40:27 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_014035_543095_8B30E67C 
X-CRM114-Status: UNSURE (   5.89  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Aurelien,

Thank you for pointing out the AMD RFC. I missed it during the
initial search.

I have now looked through the RFC and its follow-up discussion.
I am still checking how K3's CPU-mapped Peripheral Channel window,
device enumeration and link recovery could fit into that framework.
I will take this work into account before posting the next revision.

Thanks also for pointing out the EC on SpacemiT's K3 Pico-ITX
development board. I understand that its EC uses the same eSPI
hardware interface as the EC on FML13V05. Keeping the controller
separate from the EC transport should allow the support to be
shared between the two boards. My validation so far has been
limited to FML13V05.

Regards,
Wang Yang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
