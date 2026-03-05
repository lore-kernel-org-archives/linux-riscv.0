Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2578EEF31D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/4XJ7NAoFZJolJ9386LSo7tkbrHnhENtzzktD99UIZ0=; b=LfKxdC8QxCEq88
	ti2gXayMsthvp+5mqQOCheyA+u0gQ5GGj59GrGOSjiUidh6EIjMZGMzdbxfwY7khD/5ynt4wINcAW
	3EnMOdTCuD0sdRWCqATHvSiAWLS4ZF6X0Htz8EMb7xydNxqUxqHaS03iTnaw+y4gdeGvKrmgpuRV9
	PZgWDvDAE7DWWx5xwUSN5jjiBgxiSf4Wh1WJnRuTTEh9geBV3OXTVRAtPmgjtoHEQEMMhBYPa7sG7
	aWVjD+8zomX9MV/aQe/+r/JbhJn+D2qeJB8Z+LHdP/oqS1YGDcGlB4P+oN8pXLw4PkfxlH/CZZ821
	2SPdK0enK2MP4MNQf5hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Ac-00000001Cxu-0OyH;
	Thu, 05 Mar 2026 08:34:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4AZ-00000001Cx7-3PzU
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 08:34:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A464400DF;
	Thu,  5 Mar 2026 08:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05B94C19425;
	Thu,  5 Mar 2026 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772699695;
	bh=RYt5RMr7m7B2TX/DNqszV3gbTYGJO6UDG79Q1h8dApA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=EsgjlLbNoIaQr02oFkntz1z8FfqQStT3G5j3af4w8G4TqZ5BEZwkXcLvZwr7CtT/5
	 9trTxIKegt3JU+TBUURFSWME+DsQAL9a1ntnoM/PrL0HZisI6m0K5lh6dIkB9y/54d
	 xW9qZTW20ZRfkkyO+5dIGG67wos832gqhwSUIP3m112jBzercWFnAknlBx7pxfOGN+
	 7pYXRKDVYjXqucMXZc5JxQ/CWruuQrxg65J99qxNPekFAJXRxRjQ/LipLi5Rrv1hvR
	 tLICbxOV45m8U5E6JF9YPA9g+hjBZLbh/cjpSoBviQq2WNmYZytXI28YwXZ2DLcaDN
	 Wcta56xP3aM+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CDFEEF31D;
	Thu,  5 Mar 2026 08:34:55 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Thu, 05 Mar 2026 00:34:53 -0800
Subject: [PATCH] mailmap: add entry for Charlie Jenkins
MIME-Version: 1.0
Message-Id: <20260305-add_charlie_mailmap-v1-1-c22775c6e6fb@gmail.com>
X-B4-Tracking: v=1; b=H4sIACxAqWkC/x2MQQqAIBAAvxJ7TliVivpKhEhutZAWChGIf086D
 sNMhkSRKcHUZIj0cOIrVJBtA+thw06CXWVQqHrU2AnrnKkmnkzGWz69vYXa9KqldIjDCLW8I23
 8/td5KeUDOq4HP2UAAAA=
X-Change-ID: 20260305-add_charlie_mailmap-2f3c311d0079
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772699694; l=965;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=w3hqIfRCiAPQl/uqU0LjbNlw64civ/W9yAPwp/blmGg=;
 b=rz0UoAG9+WXYZyM/6sOm4suo0nEyyu5gE96HKnH5rFnk9Dq1s7eREnHH2j/8387wDHYDk4rmB
 Z0Q/9aPUxFPD9NOBJnWYCxe1+0BH4Ik5O9ARwI0iD+xVTtK4xT95Gmr
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_003455_898638_AE5C10DA 
X-CRM114-Status: UNSURE (   6.57  )
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

My Rivos email will expire eventually so switch over to my personal
email.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 7d5a6cc3909f..9eb89a60c7aa 100644
--- a/.mailmap
+++ b/.mailmap
@@ -178,6 +178,7 @@ Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
 Changbin Du <changbin.du@intel.com> <changbin.du@gmail.com>
 Chao Yu <chao@kernel.org> <chao2.yu@samsung.com>
 Chao Yu <chao@kernel.org> <yuchao0@huawei.com>
+Charlie Jenkins <thecharlesjenkins@gmail.com> <charlie@rivosinc.com>
 Chen-Yu Tsai <wens@kernel.org> <wens@csie.org>
 Chester Lin <chester62515@gmail.com> <clin@suse.com>
 Chris Chiu <chris.chiu@canonical.com> <chiu@endlessm.com>

---
base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
change-id: 20260305-add_charlie_mailmap-2f3c311d0079

Best regards,
-- 
Charlie Jenkins <thecharlesjenkins@gmail.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
