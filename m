Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D75CCA5FCE
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 18:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z1h7h/VMDCQg4qzfUUGG8QuSX1XUsg1DmeaOoGCTsxo=; b=Yvk+Uoph5zBb4+
	GwJ6bv+6USsJiq6hDPi8HCG647ulQ1pQb7VGYOtj08/OJqEVe+2I+xhCujEBXd/D9D29/x4Wkvpro
	EF+SAUAR6wdDo0KD6apA6Ws07Z8+0zvMlCnPv7E1p19GC533B2RUV+5VKdxuzjfJziId04BYrblpT
	Mx+h3fFkFbmbiYGAP0O3+pUYhPGH8TLy2LXagHQ5xuEeFh/1lt1F34UluQ5t6YBS3Dk31+Cb57uAi
	z+zXiiLoPT4oUa5rKRk1E11GVV21rIU71aY+HzgGtM0XBJG4cy0Hb6drL/Djhp7+Qs6ccvF/QKSGg
	CXiFJWhU8KXpZCv+sIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLlK-0000000A1jK-0L7L;
	Thu, 01 Oct 2026 18:44:10 +0000
Received: from mail-qk2-x0f.google.com ([2607:f8b0:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLlG-0000000A1hx-3i09
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 18:44:08 +0000
Received: by mail-qk2-x0f.google.com with SMTP id d75a77b69052e-5337ac9e465so25665141cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 11:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790880245; x=1791485045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8PbtpP1B6cfhsSP8Q8MPsWsDVS00PSdC8Q8MFvMrDk=;
        b=FHBUv4+mE/OvFfHB6B7RUV8moJNlWOUfanxLjWZe5LX9U4RYx5A52Yayf5Ow+4amAQ
         L/Vm60IqIYELasC6NcQbvYiqdMp+rJL2SdnpsthPm1CThPyZZ+p8IrW2C728Qbb1977t
         p3Q1r9nEkPuNjEHd/ahgdPtZhMciZbpfi0LBZIs8qXTUSjLpuJ6N4bZvHGckZdgzjwd8
         1hUZu+iKN+0PEjGPyzoysHdtJiIEGyGLxyi08ONk0+xjP99NAvVUbjvOsuDsdd3/QrtH
         +0YipFyqERU2y0PxdtGodr2lhOkgC6sK1LOMLhVgE+/fwworsXuZ7ehwWlKKkOfJt8j4
         IbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790880245; x=1791485045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8PbtpP1B6cfhsSP8Q8MPsWsDVS00PSdC8Q8MFvMrDk=;
        b=tonQsCMNQxilQlVek31/EVOp/hrLvTQTgQbaQ0W4TQIxysAOYHyNnhJ9gq8EipV6u5
         hTEmuQbzNQwK9/QKAUlq5MwR0DFtd8dSQoIDcLsEqKyWn4Uy1zsvSud7RMj+3+XHua7P
         9MRi8nZ4su9PThSoG+H4MuQGSgM/JHwOB8MoKPzOPnNADS4W27stLbjQiaks5cYJC4bj
         vERnMnbqe1QYhuetq521/T9yAJlojQZHeGIbk/ou460CEVR6At0gBDg5jf1j6b/Lwjvc
         slEirRCjmcJQVWWV7CANrzI1OqYSnXZywXxJci9GTDf2dK1z1Vjp+pFBKmD6SfWgx6Va
         o4+g==
X-Forwarded-Encrypted: i=1; AKwUvByV5sdb/+ZIblrLZRXvbaIXwpwrX7F6gnEIVp6rgsxFjmVLxVXjPpubKoVJt611cBKYHTkSV70vroQ9Rg==@lists.infradead.org
X-Gm-Message-State: AFuF++k2oeHO13U4opLRd7FqT5yJIzeXBpXsXA+Z9dIAUe2Wb5wjrHMJ
	AOuYERXIv7uSErDpCp5c+O/EUzbr4k2E2oRD2mW8zhmF7rVKj/4wejSl
X-Gm-Gg: AYBFou0zePOd3ZBZxpwV5Yhf1+sbHRrHZ3v9hNnqJVX2ucmzRGxvTJpSiOzwKxXxrNz
	GJndpVv4TORyfaNfpLqioCDCkYLqvRM45mL9JQyVV0ofg0av0AT4yQvnbyQIEO0RLrWqxHMt5b2
	kK8DSPtxSJjS5b1WCiK4eHfK/zFfru28LNsoi3rU/DO/NjgfSlIm02hOqMHNCooxu9M+HMQJ0zc
	lSTRMISNkMd0WL9H4mTGTemsDV5dwJhmII4C8o9C7YgQKHXTj40pzG5ydAbeOteVj5Q41NV9fnd
	IVZXgalo7Zvy9BJjzxDHckh8HiQfhA66BcydrE0gQfa1pYAT0l2fgpMS6KrD+hud0xIJtLzfZcm
	rpxPstUXsn7BzVE5/FaWUvKDUahR/Ujmmli+l5qVcg9+KWgMdNfJNOtdN3ayYHGqsVvoojqlhwU
	4E8DXu8ynV+Mrs73y9CtnLBgWYg32ycTBe7C22u2nXWE8FXLb3yHHk7zagy4iUtS66ALOhxmGce
	k7oWMphhGUtEdLBEJIEEmeY6lXlh8jFSX3NZ/nOzuAbRulB1cRyiKwMZnHlrGAV9F9cnC1WfVha
	lsEjco4H
X-Received: by 2002:a05:622a:130c:b0:533:356a:f7ee with SMTP id d75a77b69052e-533742b2e74mr106883461cf.25.1790880245336;
        Thu, 01 Oct 2026 11:44:05 -0700 (PDT)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398a5b6ffsm5007681cf.6.2026.10.01.11.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:44:04 -0700 (PDT)
From: Ziyi Guo <guoziyi114@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: samuel.holland@sifive.com,
	thecharlesjenkins@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ziyi Guo <guoziyi114@gmail.com>
Subject: [PATCH] riscv: futex: untag the user pointer before the atomic access
Date: Thu,  1 Oct 2026 18:43:55 +0000
Message-Id: <20261001184355.2395068-1-guoziyi114@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_114406_932618_4927AE5A 
X-CRM114-Status: GOOD (  11.71  )
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

access_ok() checks untagged_addr(uaddr), but arch_futex_atomic_op_inuser()
and futex_atomic_cmpxchg_inatomic() hand the raw uaddr to the inline asm
amoswap/amoadd/.../lr.w+sc.w through the "+m" (*uaddr) operand.  When the
tagged address ABI is enabled (CONFIG_RISCV_ISA_SUPM, prctl
PR_SET_TAGGED_ADDR_CTRL with PMLEN != 0), those two addresses differ: a
user pointer whose top PMLEN bits hold a tag passes access_ok() after
untagging, but the atomic is then performed on the still-tagged raw
address.

Supervisor-mode data accesses are not subject to the U-mode pointer
masking (that is governed by menvcfg.PMM, which the kernel does not set),
so hardware does not strip the tag for the kernel's own access.  With
Sv57 and PMLEN=16 the tag bits overlap the canonical-address bits, so a
tagged pointer can name a canonical kernel virtual address (e.g. in the
linear map) whose untagged form is a valid user address.  An unprivileged
process can thus make FUTEX_WAKE_OP perform an atomic read-modify-write on
an arbitrary kernel address, with the matching FUTEX_OP_CMP_* result
serving as a read oracle.

get_user()/put_user()/raw_copy_{to,from}_user() already untag the pointer
after the access_ok() check; do the same in the futex helpers so the
atomic operates on the address that was actually validated.

Fixes: 2e1743085887 ("riscv: Add support for the tagged address ABI")
Signed-off-by: Ziyi Guo <guoziyi114@gmail.com>
---
 arch/riscv/include/asm/futex.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 90c86b115e00..8d80e580eec5 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -40,6 +40,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
+	uaddr = untagged_addr(uaddr);   /* FIX: operate on the checked address */
 
 	switch (op) {
 	case FUTEX_OP_SET:
@@ -82,6 +83,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
+	uaddr = untagged_addr(uaddr);   /* FIX: operate on the checked address */
 
 	__enable_user_access();
 	__asm__ __volatile__ (
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
