Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B00C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i/OpqMs9rcVjNXHzbdeqh1nGJrbswHqna3Pc+TONi8U=; b=o9al1UG5ALkh/k
	6RH6oPvQYhvKaneCVJx3OhpwJwruHFo2c/cZlAUFquVqWb+INFwIh4qjjAKgOE5h9c+08uxS2KJtv
	g7DYXysttGSn4bNRJk8J6QFb6xKeuwvEcbDLeNif74U/gQkMg5NMmlvZb+J2irCneH7Iw/t2SL14n
	IrlK1EjO94qs84WzWWXXWn//4ov3kTa0KWTsC6bjpvpt4u1cn1ropDvYgrnJQdEAn536cElJNFl0Y
	zkWb2Bve1HcdfflCw+/fxKLzoHxr/4mNVQg/KPHiUAcz8+LDunx7xg10iGdIne4Wa3+l/YYVC7ZiM
	7jDUyH3c8EjquSKo3i/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwK4q-00Elea-15; Wed, 01 Jun 2022 08:51:40 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwK4m-00ElbQ-U7; Wed, 01 Jun 2022 08:51:38 +0000
Received: by mail-ed1-x52f.google.com with SMTP id o10so1231755edi.1;
        Wed, 01 Jun 2022 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=U/4uwHbN3kTeOBlqC9MtcT8Zh6UZytYx1qP79LPgSd4=;
        b=KplaBvFsTVLv0IqD9M3SRA1T8uWUDOy/owGLewCaeOD9l1E+4/5fI72BAzMypMEyCr
         mFkrCA0pmXVxT4hgvHYsWrkDEk/mIE16NkQIj/BZecW8IdHJ59IUx7VegWouURPucjIU
         yLHHSmqqY6JmZn5XW6Y4YJqcus2G0No89u0ImXeEbNmQrx0gqXVTHTMn2ZnX1cUptsFM
         wFt/Xsrgss5kgU0yEPame4MuS1AAO8V+e4a/Q/ETlpXxapTsPvMH6sIoScfeMO2DjJ/u
         6jeaTAjz9xU8xL2V/g+EpI7gtLieQIxBa8FwPeQ0GF7nzfgRuR5IJL78EQWW/i/dTVAu
         S1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=U/4uwHbN3kTeOBlqC9MtcT8Zh6UZytYx1qP79LPgSd4=;
        b=KY4L/XPcr1LUKSnqMF7SetBfPphqQetewUwMHRSJlhx7q7qqggcYRS8BX7dk6gszb0
         h2iAcGrr2JdiwhnNkjq5m9qlN7OUF/xF4+MrqCndb00xitwUbCSpbdN090TYaf+lGgFD
         Lay9h9kKp78MOorXQq5O7wcGhqtpSrKWLZUSgYfIRhMWOnymWqDj6AqhfyydsaveP92D
         I7tUbMJIkFPBz5qjCEFtnHaeooJWYOqLBIQIwC99mHdtlXb8+TJxfzNUdQ8raxz7331K
         wHrDyYVAszKs14GPjjtSQpGK4RSVqFifGuOv9J1BViMllzoXmgiFqOjvHd5ZfFUj9ZW+
         Nf0w==
X-Gm-Message-State: AOAM530CZWY/qKVCrZ04okjomTzeb6RSyKVLouL1e9h2aZxWH5Xnff5g
	ZxaELM3+bFZOQ6po7KVzVLJUaTRGL4nA3g==
X-Google-Smtp-Source: ABdhPJzi3J/9s2Bj4RLOaibco+6hWCvjhIAHxvfi6zd/54MSyh/912AMfWa6u4p7Qpatl1i5Wzw1sQ==
X-Received: by 2002:a50:fc10:0:b0:42d:cbd2:4477 with SMTP id i16-20020a50fc10000000b0042dcbd24477mr18330933edr.363.1654073493766;
        Wed, 01 Jun 2022 01:51:33 -0700 (PDT)
Received: from felia.fritz.box (200116b82620c00028af88788fa7d286.dip.versatel-1u1.de. [2001:16b8:2620:c000:28af:8878:8fa7:d286])
        by smtp.gmail.com with ESMTPSA id fg16-20020a1709069c5000b006fe8d8c54a7sm447918ejc.87.2022.06.01.01.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 01:51:33 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: Limit KVM RISC-V entry to existing selftests
Date: Wed,  1 Jun 2022 10:51:22 +0200
Message-Id: <20220601085122.28176-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_015137_007298_650D9BCC 
X-CRM114-Status: GOOD (  11.28  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Commit fed9b26b2501 ("MAINTAINERS: Update KVM RISC-V entry to cover
selftests support") optimistically adds a file entry for
tools/testing/selftests/kvm/riscv/, but this directory does not exist.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference. The script is very useful to keep MAINTAINERS up to date
and MAINTAINERS can be kept in a state where the script emits no warning.

So, just drop the non-matching file entry rather than starting to collect
exceptions of entries that may match in some close or distant future.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Anup, please consider to pick this minor clean-up patch.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36eab5ae237d..a8eee9d2aea5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10863,7 +10863,6 @@ F:	arch/riscv/include/asm/kvm*
 F:	arch/riscv/include/uapi/asm/kvm*
 F:	arch/riscv/kvm/
 F:	tools/testing/selftests/kvm/*/riscv/
-F:	tools/testing/selftests/kvm/riscv/
 
 KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
 M:	Christian Borntraeger <borntraeger@linux.ibm.com>
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
