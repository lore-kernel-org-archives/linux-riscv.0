Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F756C43460
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 15:01:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9F2E6102A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 15:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9F2E6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/Ry3u0cMFivJ6Hdc75cuVHR8nvz/aNs2a5RdFy1dHM=; b=pYqaEANTYmdBTzstRR6RQ0dp40
	k4LtW9bEENR4RE3vyUkoOL7fJTeWTb1O1V2V7MnBECpnbFnUSMemg7Lo1A2NYM6iMd65bCuYms5ga
	6B0mRvHM0uMMJ4P82E4qESgpXYyYZtJqP1z7aLmh29/caAPMDkFUoBFTUfJH6S5ow9sn52PIBCnDt
	GR/mDzu/P/spfBhFjfa79KxBfynsotLKSvqZHC9l9lhxCIHlM2IQ2O7jmAgyhSGK2C9A51wCNK8tF
	F4IKa/NgbvgYXzOidMn0nzy91u58JILXpTWYFdHcAygaKLhzhs0ATSx7aOLnx1KNlob6UyxS84W7G
	Q+AawMqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYrsP-00CPJj-27; Tue, 20 Apr 2021 15:01:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrsB-00CPHb-UD; Tue, 20 Apr 2021 15:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Yb3x8NEBGSEkx/UZEKu1nm1ikowBk8J7hwDAXDZL9uo=; b=yx/7CEpVTSRdO9w6ZhEE3jvOtB
 mUmdV78HrCfIP1NM/twSfN0NWqctLpcZkIItOYP/Ag4xKInfkZ/XAOPtZ/iYWjtKoDWo/9l6KqsAb
 W6AzQy/JKLtpKoRVea2r1OLbPGILoQTtuuv228Stu+GClsyN/TW9eiLOwKJsvIKS35m/OxGdBczTS
 x80ZeEkLeSqF/svAEJM5SfRFMl0NkY3uVuNTjs9EQ4bybn7guicMsfOfw8tEerW7tXPVjs8NUMn/7
 PRiYxq0dEEvHOn5KNE9K5a73OSyVkUCnoAWmD5S+jkKJBKfn02Y4ksq1dMslhQkOqLJHz6kA7l+rz
 bndby25Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrs9-00CDML-Fh; Tue, 20 Apr 2021 15:01:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE7CC613CD;
 Tue, 20 Apr 2021 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618930864;
 bh=8H5HU47vEWQjvvF+2Pz4ChL06bcJ0cPitsV98kgBsxg=;
 h=From:To:Cc:Subject:Date:From;
 b=n4Nm3HlpfChYGkCY62zrscIigP2PS/KwtQe3rk8cf0a4kmFXBffFMI/JZOZf3lqXG
 I2DY9NMidPqLhsTgvFwkE+J6Fy9TPmwoPeQuiLO1iU5ibpkWYcCNMkqL8WamECYDx/
 cFnHJ2L51bPl3ihavFrLiRAdeJI2Bij5m4ZGUDbwVRUbPbbbOGIQTyE7lxfqgkGVlh
 +EYbmgdDfDCeyFVzW71FzXt7d+plT2fK+Ik0mpJZ2ndkuq0eiTmXZAZ7zGob/famDE
 EyW64QzflOhPuGIz3FV6JVuCs/V9Kd04MBng8Mkhuo5rTiWoHO+xJJif/5vq6yiKU1
 X3aq4Yn+wxUkw==
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
Subject: [PATCH v3 0/2]  secretmem: optimize page_is_secretmem()
Date: Tue, 20 Apr 2021 18:00:47 +0300
Message-Id: <20210420150049.14031-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_080105_587912_B0CE296C 
X-CRM114-Status: GOOD (  11.73  )
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

v3:
* add missing put_compound_head() if we are to return NULL from
  gup_page_range(), thanks David.
* add unlikely() to test for page_is_secretmem.

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


Mike Rapoport (2):
  secretmem/gup: don't check if page is secretmem without reference
  secretmem: optimize page_is_secretmem()

 include/linux/secretmem.h | 26 +++++++++++++++++++++++++-
 mm/gup.c                  |  8 +++++---
 mm/secretmem.c            | 12 +-----------
 3 files changed, 31 insertions(+), 15 deletions(-)

-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
