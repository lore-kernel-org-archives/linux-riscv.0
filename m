Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99E4C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 18:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J8JoIPMooK+njwOkzD8hORDt63JhY8zfytQ6Z/pytIE=; b=aakzRecqf3arp3
	ROyRZUpX4HoijZHSiFOfrCZWyeIOMiPd7YKoqVWIjbgfyk2rLJvewTRWHHL+XvmjDc0zQGvIVwBgh
	cxE6w9Fe93kICulbqt3HBIecepxtFMxPWkamme0NB0mUrI++5ZxernYMPyhO9ZHzHxjyT7vD5exDa
	Ns01Z7X9y6Bb3qaRvIQHmurLIM9BDrJmJDujthKoiSwcKaPPbi3G80KdF5/bogNu6ZOB0QBAm4kyB
	0APZzQnur42MLh2WtbIwNeaT6dqXzeZm/xO2OGRX1/1TfxhB6QxGrDMDARGeNMHom5ntg6aIzyb7A
	em8YrTe4FxCt4KA1KaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNHG6-009DJJ-0Z;
	Tue, 09 Jan 2024 18:55:30 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNHG1-009DIc-2g
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 18:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1704826207; bh=DmGo0slP1Ax+f+6LBWpdzqWeIFagteLk84bt6YYhxSo=;
	h=From:To:Cc:Subject:Date;
	b=Pv3kSkEQeCoe/kbuOwwDLcE41Dri9PZGznv+HZJFaLmTep0IhJgqbNy14+/CEk2sY
	 B55M3XBASH0UxdDapwauyn/cafUqFeVgzbVoaMFmEvB2wW3qZruENj8mqevEDlP/V2
	 i5btftN7KqbRPJ0sJw/EvH/bnGB3qvtAjBSFy6ZI=
Received: from cyy-pc.lan ([218.70.255.58])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id C803E83D; Wed, 10 Jan 2024 02:50:00 +0800
X-QQ-mid: xmsmtpt1704826200t8xep9519
Message-ID: <tencent_6D851035F6F2FD0B5A69FB391AE39AC6300A@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjwbIh/j+boLSJHX0auiYjrweTADFbG4MJ95HYOrcj5mqN5GslSk
	 gur438jdm2YbxWUFSONaraHqL/MaWpfDIWZuc8uzkHLeOjY5S+OwSlAlVJPOnKDQhPzgFqbEYYu6
	 WC1XzwINxKL0fGO1huOKjvNV9SJMgyyzzmbTGsvYhqi4UT00fNw6YI5lMDP0L2pWsFz+ir5PPFBl
	 NtXjpodLTGipJkpi7kGWufV/XQ+e3HhWeDq4TwOkEHi7fuouDx4WApcFVVO2FG9w7yPo5LeKRZRy
	 fI1V/siWgnTj0nDO+fxYksksU6Mv0AdHK8F9Hhihe6NkHcrNDKnUfkpX1l2lYjupn1xXWgKuHFHR
	 0fBadkJoPP85v/n2ha588yKqIly+6+9B2qCFvwQxqwaoQKNoZQy1VzyUrqlRReAZTDPqFw6abMjB
	 HC6xogbgGlnuHYnNioCYESuem3yQzmRd9EWmcjx8NmWcBqSNW1DqXQrsTKMmOOYcrTFHq9ZUM76H
	 D2HZACHyM8k6Z1xIzXYDAI8M4u6YFVd3TVVPDDQC9WXW7bkDiXdqDAgwE2t2ncYZ7S3IU/IzVAgx
	 oL3CNFWOrtVoRt1guvlKqyvfEedvydfvLW1BCceFB4vu1kROuJ/2DAjX5RbZRtftbeOWlbxgJ7GS
	 PsozfzUN9ICbAHq7Jor5ej0PAb/oE2urUL+dqYEV1Cf8FRkeI5ICzgXt8n5DuQml7B0J3t6i2HFB
	 lTR+VjG/bAZISOJNbTKHxTeA3u8jEVgiY+TsIaG6yKrawmsCcWg1kYuU1PZVh2YTnK8C40D0s3xL
	 JHoxQjcl24d8eT8bPebaFqX0uSRQZM7ETOlMqQ7V43NiWWicN7k3J9AjF9bEUSQHiFSVZ+sBTKL/
	 chv0IM6P0Egm04RrIIIG1cFJXvghlGmRGP7web+cfzx3B09sbOLSySdmUkuD2k9Wh/oUiCfFEUsr
	 Y1v2LJ0NSy+wdKEP01LD/AX3iKTDkmAXDAkp11mTaYNM7OmSOJ31oRab19Yp6XoAlT8v9NRQk=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Andrew Waterman <andrew@sifive.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH] RISC-V: only flush icache when it has VM_EXEC set
Date: Wed, 10 Jan 2024 02:48:59 +0800
X-OQ-MSGID: <20240109184859.379050-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_105526_416095_8DC013AE 
X-CRM114-Status: GOOD (  10.79  )
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

As I-Cache flush on current RISC-V needs to send IPIs to every CPU cores
in the system is very costly, limiting flush_icache_mm to be called only
when vma->vm_flags has VM_EXEC can help minimize the frequency of these
operations. It improves performance and reduces disturbances when
copy_from_user_page is needed such as profiling with perf.

For I-D coherence concerns, it will not fail if such a page adds VM_EXEC
flags in the future since we have checked it in the __set_pte_at function.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/include/asm/cacheflush.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 3cb53c4df27c..915f532dc336 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -33,8 +33,11 @@ static inline void flush_dcache_page(struct page *page)
  * so instead we just flush the whole thing.
  */
 #define flush_icache_range(start, end) flush_icache_all()
-#define flush_icache_user_page(vma, pg, addr, len) \
-	flush_icache_mm(vma->vm_mm, 0)
+#define flush_icache_user_page(vma, pg, addr, len)	\
+do {							\
+	if (vma->vm_flags & VM_EXEC)			\
+		flush_icache_mm(vma->vm_mm, 0);		\
+} while (0)
 
 #ifdef CONFIG_64BIT
 #define flush_cache_vmap(start, end)	flush_tlb_kernel_range(start, end)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
