Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51614F3ED79
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zxtxpHnjKbXtamVe8x9KKwe0svth6ENAVObHhARos0=; b=up1UOf6MW4+M1b
	K6Sd+/H1RPoeadoz54o5/FK+tSxoEKuz3B/vmHiQ86T77jULWoqq7gqvLN5qXyT6NCuXtiCJCVN1k
	UFK4dRJWSw0FlRQsxFxo4opUGwJbKakKf1fQz2j/YdXBYPShvJfTAIz4MPfJU4FG2c+QBJS79KPQu
	+0sRXLriUNXLvfs5we6FeEg9skDGri6LeDyjXnO20xvAl9HWKh4V0durAGqhqNBDiHB7rgF4WBOIe
	1UOX1GJ+1NK8NpueLTNWNjyyPVn8yTwAQyQR4q+if9UQyoRSMiRPN/D+KwYKyPNDLGhG/fvKFzF9f
	QdkF855bKfMJTaOPCCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFbp-0000000FaEk-26Q6;
	Mon, 13 Apr 2026 11:37:41 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFbl-0000000FaDm-43nc
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 11:37:40 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 654531C1B4A;
	Mon, 13 Apr 2026 13:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1776080253;
	bh=pi4Nq3JR4Vatn+X4duKPyDnTPGN+N5oNVQU0w963L28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vGZiE8npq+oY+p6bdKObsi0UMK+/xHM9GX5A3Q7uGdVMDSY8wQhYbQgDEmY4V8Lhw
	 L2jAsXLgvDLQV/hUGKAVmoJx0+qe460CURiSXQSjQhGIOaCLuYxnHnX1o8Mvemu6Vo
	 guV0DUUAnyiaB1dq7kzwu7J4hqEHEgt1bK6OYp2D5AWR7qvEE9ZGiLG60isDahuLbO
	 zmXKlu3REkF6WMlhz88kRxZz7laO4R/1sEx9xRDzo3Xg9Yr4UANdNZvIJMLuj2WvDr
	 HWN47fpPiSHu9OTz6p2bbZwFUQkpyGhk4vaFZSWff/CAPVq0X0PyWSrw5WfWAyfaKe
	 xMvFqkt5TQA5A==
Date: Mon, 13 Apr 2026 13:37:32 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	devicetree@vger.kernel.org, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Michael Ellerman <mpe@oss.tenstorrent.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <5tr5kacx27a4g4udx43vemqvwhr4iaflacdrkz3d5tnd6vcldo@s6l34e2xyg5k>
References: <20260310003850.3837030-1-npiggin@gmail.com>
 <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>
 <ac7TByN3oQGSUpyq@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac7TByN3oQGSUpyq@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_043738_223627_FE4326D6 
X-CRM114-Status: UNSURE (   8.45  )
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

On Thu, Apr 02, 2026 at 01:35:19PM -0700, Drew Fustini wrote:
> I think it would go through Joerg's iommu tree, but I could if Joerg can
> an Ack.

I do not have the original patch in my inbox, but looking at it via lore it
lgtm.

Acked-by: Joerg Roedel <joerg.roedel@amd.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
