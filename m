Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A680C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:17:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD9A6054E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD9A6054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ga20lqKWOzb+ggX75dlR1J/KB+KOJ9m3kE9wh8KHYHo=; b=ce1jKhoD2WHbo0OTwwaDL7sCYZ
	rhSD9P9UVbNS4cgYfVX1hwBxtPOKU/FMS+M83vze0rbtC1GcIONbfuEWsMaC65jwzieLwTfm0mZ8K
	+MUsP/VcEpDYK+Y4fLLOcZ3FUyFcC8QpFZZVwkxdIDU5uis647A7N65DwTrFodYvTKyFp4FBh5keq
	nLvUzCTfzV3PlJfrLC/dOfrZYDuEEk+7hbsZIRPuAzCriHMnihGt7AYBKjzk3w4Bp8vIjU3HFiiO9
	GCylKyRSK3BaVM5i2sFjGVNt29KBn6n9AX5kKrLyjEq4+UV3z3XrdWTKqNZlfEvbsd4cRVCfzXQD8
	8DJYZRWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqFC-00CB8l-DR; Tue, 20 Apr 2021 13:16:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqEz-00CB7Q-Cr; Tue, 20 Apr 2021 13:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=WdP7CAJmeC7mWQ0qrZQSoxA5ruYVZKsSsI0y7xXfvSE=; b=oRZO+KbymMI3OPNIc4iSSaAgp5
 sWF+s27EB/XbboFIylHVH8NRXwge1+NiMAZ4BMEjnjy4WGvsy2ZhsE86KoFKd41n6RN6DuJUZpR2b
 ML81QygNioNYG+Nbz6kAgKfJdzSV7uRmPH9O3a+4NKgEXwIrfLR8wyJFKI3FxeC3rPCX2cnscZhrj
 9c1/LtRJDY62Tz//pQ5KTM1x8q/Kw9t5cniSw+tWdUh5CJA8fJhPvDn8EQwRpPNmA9JLxGQMOSY46
 fxT6OdbNhhytXmgMzu57U3zrpmLH90u7rhAJXdBdqUy9pAJswg4jPQjDZCNpXStDa2zmPau3gZOgC
 Js+IuifA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqEu-00C8BS-Mz; Tue, 20 Apr 2021 13:16:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB92561155;
 Tue, 20 Apr 2021 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618924588;
 bh=qhR1fpCqAsT1S7eszhL+8DGn+IohPdIv6ZmfP8rMA54=;
 h=From:To:Cc:Subject:Date:From;
 b=KUF557NhH5l1t2K0OYATzazaNCSAUMl7v8OSvEA6BB3++H9JFEiE0m47Qe20TLsyA
 Mg+bE3SvdjK4KbC0KDgBwkghXH1+SdNl7XPGJXfOGWL6rieURUdgwykpH/YpDMQBPG
 rKBgMRdJAVDnOl31RwFKVeNmayE39KOv5tA+vfGakvNDvdEpQ+NJsJgelSxLbVraWI
 bPMda19jc0MXqs60Xcjv5yfm6A6g9IJPG8oGUJGNTfLxnnkT0YtwmG/da8/HHsmN7t
 JmXlm7VjlV/79DJvWlsaprQDngcrZLv3QMmwPhKSGYJzeKATbw0tpP/7J7LXi7vTV1
 xuJcRy9ZW0OEg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: [PATCH v2 0/2] secretmem: optimize page_is_secretmem()
Date: Tue, 20 Apr 2021 16:16:07 +0300
Message-Id: <20210420131611.8259-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_061628_816909_C3D473D2 
X-CRM114-Status: GOOD (  10.86  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

This is an updated version of page_is_secretmem() changes.
This is based on v5.12-rc7-mmots-2021-04-15-16-28.

@Andrew, please let me know if you'd like me to rebase it differently or
resend the entire set.

v2:
* move the check for secretmem page in gup_pte_range after we get a
  reference to the page, per Matthew.

Mike Rapoport (2):
  secretmem/gup: don't check if page is secretmem without reference
  secretmem: optimize page_is_secretmem()

 include/linux/secretmem.h | 26 +++++++++++++++++++++++++-
 mm/gup.c                  |  6 +++---
 mm/secretmem.c            | 12 +-----------
 3 files changed, 29 insertions(+), 15 deletions(-)

-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
