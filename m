Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845DCC25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 07:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=XnaN+dBB173qTi
	HfjTyYH84Pq6S8Q8UP9OZitznnRqURzUmrqcorPeS9D+sIgORFrT/NEJ0rWGXBDKNL/WkmixUhYy0
	6ATt5f3dZ1q3xL6Cy8pkrGiYr3zGpXFKKgy4aJIaqwHfo5+DkgX8CuUG1YeW+ulUkvVUUp853ZpgG
	xByb5vCLrv4HYQ8hbjPahCeUFWz9gJArPQTo+nT84oO0BT1jDxoc8L8//iHHyJdUhgR1lz/3cELyB
	iyYub4+4H/llgMaJwf+zWKsKzWr+tSoqRU5Qy9UFXoseJRzBUWK/xtc56SCjESp46Ha6GYxQREp7W
	Fn8DTUTj3Rp/X4AKsEfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE1A-00000003Cey-2boA;
	Wed, 29 May 2024 07:46:40 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE16-00000003CeD-2TSa
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 07:46:39 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id 60708247F4; Wed, 29 May 2024 09:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1716968793;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=i14F27c4WZG0lByn73DoG00kykF6kBJoHlzNNRp57rjy6/4/lu75CnUPLkKfTLRcf
	 PcTQgnzHcxABoLD6yFMC6BdFp75iaYONZL3AcMOPfjH18j6CgGfzvWowF3TaEqENUI
	 51TcbScJ5SNe5Je4qRV9I/CjYMNYj5a4Pl6BjBiUHFc8DfQlg07/JQZoa0dz2dwnaa
	 iAuGqkSqqqEBzLYqaB38gc7+7pBEvW3CRX1Oln/NOKWaABPvUysn3GebEPg3lLMuLo
	 dbg7vPmea2bjqCVd1Ap10c91+Z6TbMC2w/g/6l4jBHIszWztR7753DPDJjZKFBJ4V1
	 Cagtn8KvF3LTg==
Received: by mail.explorepulse.pl for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 07:45:52 GMT
Message-ID: <20240529084500-0.1.bh.sgls.0.ntb6papg89@explorepulse.pl>
Date: Wed, 29 May 2024 07:45:52 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_004637_612289_F84AA7F2 
X-CRM114-Status: UNSURE (   0.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllCk1hcmNpbiBHYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
