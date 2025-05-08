Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C989C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+l8slE+SI343KaLdmpnDkeT3i/savhnVPVQ1UGmBs+U=; b=puAQjxNDOXc2I8
	mbTtvQO3LUquesCt4r7QPcRnZMWdiYWk7NH+qVmL4tFZXG37k/dMJavTZE5ytXwyTvf4nS+nZJJYu
	YPSOHx2XVUefyxhwlp/HmAEWCW/KgEeUWZVo/wiCdsMtG+q+LBSfvFTYn3WhqG/G0sxMGLFtGNOrx
	FK4V3fD5qmj0Y6QKg/hT9INy2QKO2aaLDTSe+x/rKa79nK6R3yqShQhZtsu3jYRXg6tEz7so1gZi0
	QBLjlDUkWlfiaJAT8duCEBfpTnSDgQbXwT3RUcFiQc68UEvOXnMZ833Xi6MPHUKMLnDDEwgOVK/Xt
	+CfWi7WMBpSzunnkpIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCw48-000000002qV-3GfL;
	Thu, 08 May 2025 07:53:12 +0000
Received: from mail.taskflame.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCw2w-000000002fw-2gW9
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 07:52:01 +0000
Received: by mail.taskflame.pl (Postfix, from userid 1002)
	id A8AD024D6F; Thu,  8 May 2025 09:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskflame.pl; s=mail;
	t=1746690367; bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=przLuyL4nNFVatihbGA90KVqDen60rLv9bf3sR+8aTplWz6fvYBCLzy6GHQh0Gi55
	 QrrEDV8u1ODq5WqhdxtTKqs66A26CDKfvXBaZ+0FQE4RPq2OYOzUPeoaiW2pfPtA6q
	 bIXqGDkLVOfbF9jvcvhGkoH7cmImtFdMX/Mqd/9bBu0LzC3IDSnUa0EuvUJ4oySYOz
	 zcr502F4TA0Q5QfjanCwUEBQpD3dQ4RNWuB9b0YnreEq7wdVVerwGmv0rF8VMgBaWp
	 ujBqpkGtJvARpEBFIF5H0ldGaBtsfOQubsrUyP64hckhFbwQvhWfaXboxO+oIM9UC6
	 pj+ANlmX9sP9w==
Received: by mail.taskflame.pl for <linux-riscv@lists.infradead.org>; Thu,  8 May 2025 07:46:01 GMT
Message-ID: <20250508084500-0.1.i1.349vx.0.d398dsp9i0@taskflame.pl>
Date: Thu,  8 May 2025 07:46:01 GMT
From: "Marcin Gard" <marcin.grad@taskflame.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.taskflame.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_005159_368455_6A64BBE2 
X-CRM114-Status: UNSURE (  -0.17  )
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

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0KTWFyY2luIEdhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
