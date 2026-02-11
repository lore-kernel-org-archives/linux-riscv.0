Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD7AEB595E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 04:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mEWiczz0Gxi/nnpEERpfMhzfc5nhO4C3oMcAJGJklzg=; b=L621Jq8DJ9sSeL
	PMUnbfTgBlfx3D40PgaDFXvyc7Huojcy3zA+13NlO3RltJWKzw0onfXBLgMIcKxjS0m55Rk5H3nUQ
	G6YjvdA6otJFoOtcII3GKjz6bpbFWYNgoZ6lA8lj3aRVQlzZXbxU6vBZA8QEAS59VrZhl1Mgy1DOK
	+0ICyRrvQPwVX+wzQzwwR7pgdqJU6LBSFtjLZhx9q9UzDM/CRqDqQkRAsT2Uh4U1+pGlYXmoX2IRi
	yRjEd/83UtQ+1xKUrfH8De4c8lMIZ8HxJJJIgAyo9uklROHMzQTWCDW6BO0HKJ+aVfdAxcXhJUFq4
	17Eu7aeCoaW0knq3+2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq28n-00000000Cgz-2zlc;
	Wed, 11 Feb 2026 04:47:53 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq28j-00000000Cgd-2qTa
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 04:47:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a7b47a5460so2516005ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Feb 2026 20:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770785268; x=1771390068; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDNE5BES6mjx46ADmVSuSrLvpbM3wrn3TxoCyTkI3Mc=;
        b=JFEuJoxEnhLZ1Cii+uCOs1QW+gUEJZ2xZ1TahWDktb1BuErveJZ27HOG1/JoHs50q1
         2YM9zhklQhEq2dzo2DD23c7/G8iyc5VUzQOSbU2JRiqHp7fuq3ZpIZPcJxgUo5cb8AhD
         nmuJCQDB/zcTSGOCljKayZFMfPq7LICLTfqfSszwQkNvi4FmhGAfrwehXH7wgKi33HeZ
         Rgf1H267+Tb0e3YDHJENwLla8Ij3TZrDB5ShuvNxMjHPHekkEWSsI0iuWumvyZOwzvWM
         aKBOmN0Cgj5UqTN3U59x5EWyP2KvEw113/3PeP5iMauDUAgFXWz8o7rcuPVP0zndJ+cR
         5JbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770785268; x=1771390068;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDNE5BES6mjx46ADmVSuSrLvpbM3wrn3TxoCyTkI3Mc=;
        b=O71L5CDNG12jHDNJwdmnkJ1L9g8pyNDiwvol61gwyvuOgAM7Dii9AL1f3O5TLZC9gD
         +mwEJmBz21+l9OBciMwqHu3Fdv+WQjZpiB+19Vs6grwtgBkd4uBJnRld4cogWotMUuNj
         1CpnXP4iGLqd9wMrrDnGXYxsRJVBLONgDZekDrcpDgdq2JhRB2yhl9Sjx2ff8LtfcQvE
         XpR+868Adp/TPgCMAYpf5JhlzZ4Z/hrR9AIbKto78+JvznwQIBYEm4FvUush8fgLYu38
         0Mfz18yiZ82r738RYF0gbvKJvvyZJOf71o/ZccLnmEMYBvWuNkOjhV2dKSy1akt2YymB
         w8xg==
X-Forwarded-Encrypted: i=1; AJvYcCWj969ON5AkPoTAVQzrDooSh4pi8XS8XFE01S4zeqojt7AFBc7vQdvBvx+q4+P77Wr1tYhjvILZWaJtyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJENZqHXIj1Va65+OwtJnp1kMeZh6mM5pTdNSxzaDa6TGUbu/e
	yBHh7PUc5AKdSH1lPg/4q53CE0SiZ5dE7rw5+3flW9/75Cohh2brm5q0
X-Gm-Gg: AZuq6aL5EOWGUQEjzdLiH8GNdfcy932wypa2CxGYwcOU//JXjsAwPUql2RtHkRxvhR0
	TodgEAz1vlXPlR1EP+0W+ZzLsy2Q0igz9Y2GV3hIaRwkVqTZ0c4fWSKo8vvrk9WpNtUE2mDET9N
	61IS6pwB3xi3yMG4LosZmWdHJ7OEk5YqczuhhEtiXvLa0RduZXUyIkUe9cWg9Qbypgd+GstUplD
	HFBLur02krePU0nplpjDhD0aeBPSYP8O4YJRdavIStNScw3fgtq4HjydDPxw9Dp9d3aj9VxFFur
	DdNhdy0lniuqwVlnNGUaWsEMemUvuJUSEuhQRIXX+Q9kWoNlNs4GSiZRidBQLwj92jGsd2EiUBd
	HBcm5xKYmSI2ENNJapTCV+qAxysXWWR3UGPuw30GygTooczO6OfsliZzGxTtGvbK0HLcaCVh/Oo
	MhnplY/vWBAX1R9V2ObpNFhnBEXHd5vNh5grJFwz8=
X-Received: by 2002:a17:903:2b04:b0:2a7:5f26:aaf9 with SMTP id d9443c01a7336-2ab0fe291bamr48593325ad.14.1770785268026;
        Tue, 10 Feb 2026 20:47:48 -0800 (PST)
Received: from adminpc-PowerEdge-R7525 ([27.122.242.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29965031sm8879665ad.46.2026.02.10.20.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 20:47:47 -0800 (PST)
Date: Wed, 11 Feb 2026 13:47:43 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	austindh.kim@gmail.com, austin.kim@lge.com
Subject: [PATCH 1/2] riscv: move kaslr_offset() to page.h as a static inline
 function
Message-ID: <aYwJ76yHaMbbQVJA@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_204749_741585_5AD003C2 
X-CRM114-Status: GOOD (  11.09  )
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

From: Austin Kim <austin.kim@lge.com>

The kaslr_offset() function is a simple accessor that returns
kernel_map.virt_offset. This commit change also ensures that kaslr_offset()
is consistently available across various kernel configurations without
requiring explicit linkage to mm/init.c.

Signed-off-by: Austin Kim <austin.kim@lge.com>
---
 arch/riscv/include/asm/page.h | 5 ++++-
 arch/riscv/mm/init.c          | 5 -----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 187aad0a7..813b6da57 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -190,7 +190,10 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
 
 #define sym_to_pfn(x)           __phys_to_pfn(__pa_symbol(x))
 
-unsigned long kaslr_offset(void);
+static inline unsigned long kaslr_offset(void)
+{
+	return kernel_map.virt_offset;
+}
 
 static __always_inline void *pfn_to_kaddr(unsigned long pfn)
 {
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 811e03786..257df6bd2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1078,11 +1078,6 @@ static int __init print_nokaslr(char *p)
 	return 0;
 }
 early_param("nokaslr", print_nokaslr);
-
-unsigned long kaslr_offset(void)
-{
-	return kernel_map.virt_offset;
-}
 #endif
 
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
