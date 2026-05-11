Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28599CD37B9
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=txanKP+LCf80FdcFLJugyNSSUqC0MXMYB13Y+m4xYRw=; b=n9hPAgx5UcCyYo
	/qlq3GnZOmKCJEom3yS6FF725z61fYhwQzf91Z2Ex83rHv4L7eaJxUOeHi6+XaDAfvkz5ldqxImiB
	LB9nibPVQXgwYnRWyY2Wy1k03nh/aDk1/Mb3pNNjKtv6ulscC79COGkX3HBA3l6oFMDRJdPRS+Hz/
	y/i+VENtyf+FPEiY+hEQcAxkMEg5vvzbJyrFHRelVtBbTDAyAQxzprPGnuvrvx9niULg3Or9mK+E9
	A8/8M2C2YCZqZc87j/hfJ3ErxgIoPOQkCkdJ+8axKUv8EZaK9lvuoApHvy2hVK1FUAO+JTsZH/2Ag
	eOqClHrxhJAUPzOeQtQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOVC-0000000DEM9-1mil;
	Mon, 11 May 2026 11:08:46 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOV8-0000000DEKb-2L1O;
	Mon, 11 May 2026 11:08:44 +0000
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gDcR26Szgz5BNRf;
	Mon, 11 May 2026 19:08:30 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 64BB8RFR010522;
	Mon, 11 May 2026 19:08:27 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202605111108.64BB8RFR010522@mse-db.zte.com.cn>
Received: from njy2app02.zte.com.cn ([10.40.13.116])
	by mse-fl1.zte.com.cn with SMTP id 64BAnfWM045156;
	Mon, 11 May 2026 18:49:41 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app01[null])
	by mapi (Zmail) with MAPI id mid204;
	Mon, 11 May 2026 18:49:44 +0800 (CST)
X-Zmail-TransId: 2af96a01b448f8b-74e63
X-Mailer: Zmail v1.0
Date: Mon, 11 May 2026 18:49:44 +0800 (CST)
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
Cc: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <pbonzini@redhat.com>, <shuah@kernel.org>, <wu.fei9@sanechips.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDAvM10gUklTQy1WOiBLVk06IEZpeCBza2lwIG9mIHZhbGlkIHBhZ2VzIGluIGdzdGFnZSBvcHM=?=
X-MAIL: mse-db.zte.com.cn 64BB8RFR010522
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.131 unknown Mon, 11 May 2026 19:08:30 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A01B8AE.000/4gDcR26Szgz5BNRf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_040842_774537_759CA57C 
X-CRM114-Status: UNSURE (   5.23  )
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

The current gstage range walker unconditionally advances by 'page_size'
when a leaf PTE is not found, e.g. when the range to wp is
[0xfffff01fc000, 0xfffff023c000) , if found_leaf of 0xfffff01fc000
returns false and page_size is 2MB, it skips the whole range, but it's
possible to have valid entries in [0xfffff0200000, 0xfffff023c000), so
only [0xfffff01fc000, 0xfffff0200000) can be skipped safely. Both
wp/unamp have the same pattern.

dirty_log_test intentionally sets up the unaligned guest physical
address, after riscv kvm enabling KVM_DIRTY_LOG_INITIALLY_SET, it's easy
to trigger this bug if there is a larger window for guest to write more
pages before first collect_dirty_pages.

Wu Fei (3):
  KVM: selftests: Add unit to dirty_log_test
  RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_wp_range
  RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_unmap_range

 arch/riscv/kvm/gstage.c                      | 39 +++++++++++---------
 tools/testing/selftests/kvm/dirty_log_test.c | 24 ++++++++----
 2 files changed, 39 insertions(+), 24 deletions(-)

--
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
