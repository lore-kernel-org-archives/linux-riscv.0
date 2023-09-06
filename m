Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64CEEB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzTu1XmbpYNuK7lGhBLtIYU/hweSA2+GB6zWm9ytD+s=; b=tl/TOiN5FLtySx
	+PCixp5Rv6Rkrkt8RqhyaY05sC/VymTyg1jRyvWwgoS2HRGJfNnqkxjOuXTIqT4gBKi57NN6Nb42C
	OqrlmfsR7ZO4X3UYVydwuUkw5YshShV9iJOpSbPdhz8k95lTOhizbFaXXitr0jLcG8mYSXSmAa6QR
	jOOIsWspyaNOsB/UIsRpr+8Jod2e2RSabRwjZsPxe2kFMPVWUxeIwLssQ1kwxtMBU5Ki5P7DnMmxT
	5I9Wn45eh/SmU3iwAS6X1A/QrFpm8ZVPkM5b7KlO/7DTkI1S1/cSyWsy9oGkH9oxLPyAogq7b0Ykh
	m0ZdAmMBwYH5ybYsxORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqW0-008aeI-2B;
	Wed, 06 Sep 2023 11:16:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOg-0083rf-0U;
	Wed, 06 Sep 2023 10:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=Hm0MzwuSXtBEkdnpYHcx6bvZkqghHjw2RC02cEfYW3U=; b=X5Vo2UrvwHc66enV9ezkU6FMS4
	o/FZVcRdmb/Dy+dn8L+hmIUr+lb5oGDwKHcNhBTu1q3pxdXYs4cZMdgE+AE0SN3QS+/Vc1PCV8YNb
	gUa6iLBmooX20W4PfxMX4KIv7F8VJMFErPBjB32Iv2L6bClldWmnOzWnSeUIivOh3jkCW4OCs4+5w
	+rPHRzXA+L/JDe6GjLHzgYr9VN/aSgBZGPw4lHw4+DBvOtsvT2zxjHgCkjf+R6/dyWgG5fWErs4ME
	W9fIrG1TewqIafKUDeHXnMPCzI5Jq6LASp2dceeRoYp7z+zdHNwezZ+RJCUbmazD6WxKIwAOae+B5
	X3GBfuKg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOS-0012PQ-17;
	Wed, 06 Sep 2023 10:04:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5409F60FE3;
	Wed,  6 Sep 2023 10:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D285C433B8;
	Wed,  6 Sep 2023 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693994649;
	bh=MeWPiqJiO/jOcKwTD539iGDPqH49TJT55WL1+BWZcg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mqcTxzQE5uGFNnU1YlI2ew6jyQZr0W/KWa39DRlrc3RqyZ25Qv46LVmC81T7876PC
	 0LEqBoFQn0g3pV7ZXGv8mW7WVN9mc2tTGoCmS2zv5OIrHFexKr7zG/eigAymiMKye3
	 DNbXUJir37GZrOdvfBp7dAwmc0Ka7xo7us96GAsWILWBsR4cRgd6eJX2KF/H/Ru4IE
	 U6UV7JTa8qmkbdxywL6frapqNa8N+wqqGpaU3/wRgFCvQrk1XNn7XExO+DsEHhJbVC
	 Ho5sHtb9IqtXn7/e1NodRMAEnHjjUtBczUE/hkcdhc7fRiiJ1SlmdGmWOatMqLZgr0
	 M8+uxvNcVjICg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADBFEB8FA5;
	Wed,  6 Sep 2023 10:04:08 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 06 Sep 2023 12:03:26 +0200
Subject: [PATCH 5/8] riscv: Remove sentinel element from ctl_table array
MIME-Version: 1.0
Message-Id: <20230906-jag-sysctl_remove_empty_elem_arch-v1-5-3935d4854248@samsung.com>
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
In-Reply-To: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=t3WkpVtcuZNgLfzODS/f6Wl7+8aj87aPFtcdo3tcO7g=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBk+E6Von/T+ilU5pBn4tuVN9msXbNXiDEdCeNZM
 WZu4HJ8S0eJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZPhOlQAKCRC6l81St5ZB
 Tz3jC/9dN3MWg/3ZWUm/XKdTghUQEp17Vk2HqbZ/vM6brez2iYSNe78aEZgEeiVqr9uX1yKcNlL
 yv9Yx9SlvuX5AVA7JTJD9S9MXahhpbfHtiI9Am58HnMs2Z7Lzl2Ko/pKVIMu8J+pCSzNiPqpFOZ
 xe1xyI5cemTS8YFjjL/q9ABG7R+ug+GAv2Iuy+7jJn2PQ7Fyh0GFdc4zsjdwQBY+4vB0SxFV6ka
 XuUtM9oMYkSjDy7a9pdUOxQBBy1xBFnjmsyS8srdB1t8+/A4rjeqcZIytVtQejZa8lqPjmqoMuk
 XZOreS5jqEblBcNJPg41oJ1o0J8jTiG4qbQZ65xtyyVPeSYekAyUVQHxF2iZ+WkIPV2APheEDU0
 Cemyp+peINjokedAcLEjKDIqxg9XQNYXhTdmBvhU2FdgRkKIBf67ryX5hN5lkSktgPVaJqSFWvc
 Bn01a42l5syjn7KRc/p1e2FbBVgv2tHfrjWzpcWJaHvsbjOKL24B4TSWJBtabzIHzyYXs=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_110418_331242_4BE476EE 
X-CRM114-Status: GOOD (  14.40  )
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
Reply-To: j.granados@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel element from riscv_v_default_vstate_table.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/riscv/kernel/vector.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 8d92fb6c522c..a1ae68b2ac0f 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -254,8 +254,7 @@ static struct ctl_table riscv_v_default_vstate_table[] = {
 		.maxlen		= sizeof(riscv_v_implicit_uacc),
 		.mode		= 0644,
 		.proc_handler	= proc_dobool,
-	},
-	{ }
+	}
 };
 
 static int __init riscv_v_sysctl_init(void)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
