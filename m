Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB54ECA5FE7
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 23:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MgiMp3DTETQpdr63nHoVTZo7y/WpyN0nXqjIiiXe/OI=; b=lrGZV+z24AwQCh
	A7qYx33PTgJpxdR9TXHAaXYOu01eYwa+t5+1RLGK0zL9hzT9JbyXbdv/ZYaxSGuxoc22BeOpiL6Pn
	LPOyWJurB/i5BT6ol4n+8SJXnwCrgdu6Ug7jWHCcyNQ6l65/sk0daDqAOgKoYZYDNNB22a4iIuO5+
	sSRy3NOxWaBb76egc/p5SX/tOHyFFxxtaCcU4MJsTJ2DA+bnMiKpqWP5Um6BeWVIdEvKrbBasoR4R
	vDvDK82CSLwsKdcsI1esz/0bO5M+HoU/etgUumdrc0aUXctC3NsuwTmHjzPJNEQf7YhBzhgvfq9hn
	wkcIuTXjzEmu20SlLphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhFmc-0000000GDFq-0Rej;
	Sat, 17 Jan 2026 23:32:42 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhFmZ-0000000GDFH-40kM
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 23:32:41 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-45c96b175baso1701128b6e.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Jan 2026 15:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768692758; x=1769297558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJi2c02eGE0Lx/gRXI7yV1B+E+TXhOaeYVBCRIQYM7U=;
        b=KifAMAjvVctT1Nd9pJPaqfnI+uJiQbl+PC5vSZzfyn5ZqZmieKt8WlkH5XtSqTMMDK
         Pdn5YIPFsj4sBbEneNtuWQiopHuD4tko2jSPNXMq9za07HjzRdKmmd/F5OeglC4ADBUj
         Nw8vF1yO9ZwZLZnPcPLLtHrpKmbfP+LJczHdYTW9wgEuGHjjgJ5XlRYw6inc6JGX84AC
         z0/RN0kE79pgKHUsMcCPgPf+lGSVZl066OLW/G8sUMGMM3APt/0h/d9BprzBEFAYievp
         bx2m+tBZnk4gA4JoPeUM5iXgPZ2LmRP3X+cGnhr+Qep15NlP6QU4loK5D12Wv12m/uAo
         sEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768692758; x=1769297558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJi2c02eGE0Lx/gRXI7yV1B+E+TXhOaeYVBCRIQYM7U=;
        b=YwKwvLVrq7xDFwUQm3MwyOM/ivUZONylGdTsMfV8YjDhd0YmhMBNvdfuDbGnPVyPC5
         /K9tRzHImev4EgVosOOvsSNLdQzzpqRoDxk7hVMx0mTQCBMgpNTBsWed3fLHm6+QriVO
         Guxq7KnK70DAewax0KYbaaHpeMZbVQaxSeef93O1WPRoSYApsNyYoCBnCYLTPdnPrlFk
         2VMDF03huoPuw69VPROLxGJicNAlpYmq1Rk7JDGh/yh6lUrJxJyw0O9RhstJm7FB7blW
         6GgF7FBmuScfUbzsMxJI96VJl4XEt2KMUDGzfo/qBVgDE27i50WteWR7u77rBhVFLIe+
         j23g==
X-Gm-Message-State: AOJu0YzVPbVt536uSSIwZhs9qK8vOAjbouSVCHBzKvrgU2YQD0zI+ebZ
	psaz5LEJVlH4lp+GCqIX9+ykKRxTQyS3smRNTslkT7i9swaoG4glQ/28/Qui8dnQ
X-Gm-Gg: AY/fxX7NSt4KLaRhleFlVx1AzDUZPKSzs4aYbLl4GR2n+4cXRBujqaXdJy+FbVMH6sb
	YwNgIG+wGXtdmtZ8BPgNukasJpnQGg7+N8lsg9suTv5cywIWCF+/6lAsM2jjR8clbMZuzUTkp0C
	LfLk60B8fny77nHFSuyOWDAMMiXtWXhsCDdOW4iBXfBV6xUTnvB1n4TNhZcGSb3Wz+LuKowSCpk
	dDdS2/U7jpkN20Rup7AcdT/Aqg8oDMEdTeaXpVF7VSA0IJ8mqV1o0lhXtdtGCj4kTBIsKBPXPya
	CmjIEhRby/+3QcXcIHFjpTv0+l4jJh07o555f2NVCuwjY7E94kEga5uDwzOKiKWkXcQkLtEmJ1Q
	aoytRpRrKNFM8UE7tzZ12ivHcv7lBGxw1czr6Qq3eanR9VJus4RFDj1KRkts97ftEA9NDkWME6F
	IH07jWp2keasnpUaIV88nlmRPhqPm+z1E4mOmakgki
X-Received: by 2002:a05:6808:3088:b0:43b:8cf4:9284 with SMTP id 5614622812f47-45c9bf84db1mr3555134b6e.14.1768692757671;
        Sat, 17 Jan 2026 15:32:37 -0800 (PST)
Received: from localhost.localdomain ([50.24.139.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e0086a4sm3424232b6e.12.2026.01.17.15.32.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Jan 2026 15:32:36 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	pjw@kernel.org
Cc: Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vincent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v2 0/1] update riscv prctl for discovering V extension
Date: Sat, 17 Jan 2026 17:32:26 -0600
Message-Id: <20260117233228.36088-1-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_153240_032130_0C0C94C0 
X-CRM114-Status: UNSURE (   6.81  )
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

This version of the patch fixes an htmldocs build fail and some formatting
issues, and it has some sentences rewritten for an easier read. The
patch is based on current riscv fixes and the hash is included at the
bottom.

Link to v1: https://lore.kernel.org/all/20260107000609.63892-1-andybnac@gmail.com/

Andy Chiu (1):
  Documentation: riscv: update Vector discovery for userspace

 Documentation/arch/riscv/vector.rst | 51 +++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 10 deletions(-)


base-commit: b0d7f5f0c9f05f1b6d4ee7110f15bef9c11f9df0
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
