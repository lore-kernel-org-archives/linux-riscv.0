Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFC4C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 03:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9KNrjr8EsmabHE/2wRCgaLHJAL+3u4YdkC6b2F8uNLg=; b=nCwEgWgSUWdXHt
	NImijtJhofE0q8ElxOtebL6VfPCQ/J1b3Xy8J+KZYWPt/UwnPxTgy8z5K+j3A5UGEIzCP0QysmBVX
	ESd/WDAPI6PkKE/1VMuuV2Z7R3SZxOZ6yejoCjle+LjdfuuynG2pKq51RelUpAyzg9n7LD8A2ik8z
	BZeMeMCd+cL+HALtw4QqyTXjTNm5VLwOo1v/XgZhDhNYRTgUZiXJqcqQNi+taBf15onSjKJJ+lq6+
	xokA+bfGQjpzdl/8iVH1Q7L11Z2Ks1KLV/V7mgfEkAfCsO13MRhnYRgDWjeAHpN3AoXheOwkhWH1t
	EN3Ta8AOItJmFJKga7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcctD-0000000GwmM-0NCE;
	Wed, 21 Feb 2024 03:03:19 +0000
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcct9-0000000GwlU-13fu
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 03:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1708484589; bh=LKI66u4dgr+7iwYTp927KXhXTPqMfb6/+YRPw56ONE4=;
	h=From:To:Cc:Subject:Date;
	b=frPaumstbBFv47/rdxEFDJLe4zIYNI5yWDb8mM4pf6ydyw4Hqn6mbKxrwA+Yp1sw3
	 XjCb0F7jFT6Q0WrH+++6upH+oL0KTODunCAFQmjFbiuUAa7CPec3Dh9D1GVHstXMIn
	 r9hO3+WXwz5Qptm8RIT1laiXH3xBFQ4t1JFlir1U=
Received: from cyy-pc.lan ([240e:379:2240:ef00:159c:db93:bdcd:c9c6])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id C5A0C88; Wed, 21 Feb 2024 11:03:05 +0800
X-QQ-mid: xmsmtpt1708484585txbs3v0gn
Message-ID: <tencent_E19FA1A095768063102E654C6FC858A32F06@qq.com>
X-QQ-XMAILINFO: OUnVc07lD2ZBmrI0ZhjTbaZSf3JrAeZvIVT6kjHJ26bXBjMScunXxm1aDNZZKQ
	 /X/0IbcXbZ2RgT8zWVbJ9Or//pv5wVpAsfgTCHTb0t4ud6fWvmCH6mL82nuOjSk6/qeQ8LRZQBO8
	 8fbHDB1JF1SUl/Ova/4VF68qRq7N+tdwe/kceR1I+X8S7JtQFRoUCu+QRGSX5auPoW7zMccfPGgF
	 csuJjMy61fN3y9sSZkZ8alcyAr4/kU7vU0Ul/yJoiTNU4Jyi+JUCNpZaULAdpgqo1FXBUfzWCMfh
	 994NDiDExo5GjgDnf7OSDXQXmf9yHwGpScNSfEQ7YdofkkcOiedu6zxodZbriXjvZdzbB+gsfzf3
	 P3p8ynZDcDqNdWUCYR1mDsjOgZNUk/QaC2IHmdBXyRzsaitWiJH7D/w0ZTxvZEj+CplhxOvcdRDb
	 zk9berts7PfJWpbYb6pY9aTJiB7/mUWzzvllshAernW9m6UZ22EchXrOwN64b3lXmdLNVgAsVyzk
	 vC+V6Iue9wFWAwW8dGMXv9aCHg4tyEWfYa4roEfIZKBoY8SHv/y4mDsP/C9VaWpyqw9YJtjcvBIk
	 +a0x210bc7oc84PeoLUeAK4DncF/i7t6QBFnf8KszULRdSQLiQ4qRV/LsQnEZ5fBKac5xynLBVYB
	 RzFpnfmftmwafv5dmkBR9NpOscvCC2nroj9kc8fRAF5x6ZjKpAZcoXOnmDoIittaDitwQpY8Kwo8
	 yWKgmNmzcoBRDZ9BnrpOdQ6/Kht50BLNP2Kk70f8tTUcLI5PzDBhNRauTdXVuRg6569JpxiB3aQP
	 NENXpQQWq36kZr7hO3GZwYJ9RNHILSgSQzO9s+jYaOdYiOxrzwq6uIyVW5YCLESDnR5YommNMggM
	 a+9nT/Ic6sDUBVr9aOT0Gk/4TnEHlzooLRHraW8pN9S2iLiTGZX+CL4pn7bys4+k3L/MLV4mAPri
	 5AkTJsC6bl4Md5U3zGvUlz3r0E8QBFu4BKxrJq31Ru8ka9sSneuKyeqDeMdNxrIqJUDrB80MfNnu
	 AJdMvN59mRU4LF9QPn
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2] riscv: mm: fix NOCACHE_THEAD does not set bit[61] correctly
Date: Wed, 21 Feb 2024 11:02:31 +0800
X-OQ-MSGID: <20240221030231.3413066-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_190315_659303_0228CC08 
X-CRM114-Status: UNSURE (   8.97  )
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

Previous commit dbfbda3bd6bf ("riscv: mm: update T-Head memory type
definitions") from patch [1] missed a `<` for bit shifting, result in
bit(61) does not set in _PAGE_NOCACHE_THEAD and leaves bit(0) set instead.
This patch get this fixed.

Changes since v1:
* reword commit message and add reviewed-by

Link: https://lore.kernel.org/linux-riscv/20230912072510.2510-1-jszhang@kernel.org/ [1]
Fixes: dbfbda3bd6bf ("riscv: mm: update T-Head memory type definitions")
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/pgtable-64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index b42017d76924..b99bd66107a6 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -136,7 +136,7 @@ enum napot_cont_order {
  * 10010 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Shareable, Non-trustable
  */
 #define _PAGE_PMA_THEAD		((1UL << 62) | (1UL << 61) | (1UL << 60))
-#define _PAGE_NOCACHE_THEAD	((1UL < 61) | (1UL << 60))
+#define _PAGE_NOCACHE_THEAD	((1UL << 61) | (1UL << 60))
 #define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
 #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
