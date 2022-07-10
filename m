Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6657C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kNRhGLMPL3cpfV9L65tWJ8LZYphzQqy6q1QFb0kODXs=; b=XRqjXNiYnbbnH3
	8Gfl/IraHFUO2Wkd0a9naVqWb9mLnuPdzU6geGY5xgHD/ISY5TuCEavmYInWA3XF3kI7DVPIsWCap
	F5hfSKD8QACirwmKdYj38XlgUTU5qEPx8Z1nWp9SkV8leYxcOSN8MnTgawgsDnOQzWZCbEFUkIeqF
	vSGTwTtQBVbAZ6j+/ibQuYyBkxDtmy3qhDAopL1LsGO+P94gFXbU4chK9mHMWH2HeEVrVqw85wZCg
	vLn0koti3XfcH9qp5dAX5nVhzRn1NmLa/rM+gKGSQPRIO3xg1bdcKfeOmkAZh0eTZYXA9YdllFdQX
	+svLFLS5Hvbp8xgaPMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oATl8-00BLLP-G8; Sun, 10 Jul 2022 10:01:50 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oATl5-00BLJU-6U
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 10:01:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id bu1so2412566wrb.9
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=81hvwpBlfxQBH7APOHFnmGU6Oy26r79hMsY7b8ngUnA=;
        b=LaBR8No6eDA8e9Rql/Q8hpGkLLfuSD5/EMXQepcthh8cGp7UjbSFP1k9BsyzXUHnNy
         /Tpq4atRiIOMgSMJhXBMpDbldJ1g4b5k0jQCcLGn8jfGRoB7x/q/8CTNYecJfV/bu4Bo
         MERWiqyGTdkZFrXjwSPTS3Z7Yn+KmnzXcWrJiE8YusI2QP2MhVEHWCSDIj8F43mtTiYZ
         TEX0Th1RPImvZ0IVeKx1UMGztnYZGsQwur0HjBXDJzClOHfTYfzZhOg8rixDdLobrGug
         oZU4dhUGGW50vkkWM5cZ8x/txINWUWLWL80giRRZdFN9hqvwmfL00pFxL7khmpX45EwE
         onMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=81hvwpBlfxQBH7APOHFnmGU6Oy26r79hMsY7b8ngUnA=;
        b=TbhehNsbsT4bI8AoZreltBIYT8J8GOwOfwYPdC8ZL+7HFpChiBOmFgUP4KvxA5343R
         Ba58QCH+qYlShqKSvOJnccPkX48H9tdmynlMCpEckb91w+pcoKtm/30xyw76JVdNjxyo
         zxHAERMVHMu1rjogglCNQAawjQ7hGsyRJ2gPtsAutpnla1wVIv6DPtlhKjJH/kxb7rtZ
         FWvZmDwAfyup2NI4pAehF3TVGrDtsSCgFZjew0qeq1Z+WoOISkmD1FDjpCaFxwdA6Wr+
         g5qjG8Y7/pg5fN8/9kD7ir7UJFvbiXI4UAzbF9Hf9NXFdnf/EFDhheni3XNmwRhGjqai
         l72Q==
X-Gm-Message-State: AJIora8v2jhdDID2j5sNjbGB5gFjhwgo/pHrvtoWZ9GxquySqIMWq8SI
	avmeBusSSit2nryaGQThE0w=
X-Google-Smtp-Source: AGRyM1t1D8hDiyos2lkhzHSCdCKBxQy3yBejjsdGsbA5T1lQgpocurWl0ACdlPHS4JNTO6vo74nRPw==
X-Received: by 2002:a05:6000:54f:b0:21b:944c:c70b with SMTP id b15-20020a056000054f00b0021b944cc70bmr12117283wrf.572.1657447303959;
        Sun, 10 Jul 2022 03:01:43 -0700 (PDT)
Received: from localhost.localdomain (host-95-235-102-55.retail.telecomitalia.it. [95.235.102.55])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c434700b003a2da6b2cbesm3502026wme.33.2022.07.10.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 03:01:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Benjamin LaHaise <bcrl@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	io-uring@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: [PATCH] fs: Call kmap_local_page() in copy_string_kernel()
Date: Sun, 10 Jul 2022 12:01:36 +0200
Message-Id: <20220710100136.25496-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_030147_260025_6826CAEA 
X-CRM114-Status: GOOD (  14.66  )
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

The use of kmap_atomic() is being deprecated in favor of kmap_local_page().

With kmap_local_page(), the mappings are per thread, CPU local, not
globally visible and can take page faults. Furthermore, the mappings can be
acquired from any context (including interrupts).

Therefore, use kmap_local_page() in copy_string_kernel() instead of
kmap_atomic().

Tested with xfstests on a QEMU + KVM 32-bits VM booting a kernel with
HIGHMEM64GB enabled.

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

I sent a first patch to fs/exec.c for converting kmap() and kmap_atomic()
to kmap_local_page():
https://lore.kernel.org/lkml/20220630163527.9776-1-fmdefrancesco@gmail.com/

Some days ago, Ira Weiny, while he was reviewing that patch, made me notice
that I had overlooked a second kmap_atomic() in the same file (thanks):
https://lore.kernel.org/lkml/YsiQptk19txHrG4c@iweiny-desk3/

I've been asked to send this as an additional change. This is why there will
not be any second version of that previous patch.

 fs/exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 4a2129c0d422..5fa652ca5823 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -639,11 +639,11 @@ int copy_string_kernel(const char *arg, struct linux_binprm *bprm)
 		page = get_arg_page(bprm, pos, 1);
 		if (!page)
 			return -E2BIG;
-		kaddr = kmap_atomic(page);
+		kaddr = kmap_local_page(page);
 		flush_arg_page(bprm, pos & PAGE_MASK, page);
 		memcpy(kaddr + offset_in_page(pos), arg, bytes_to_copy);
 		flush_dcache_page(page);
-		kunmap_atomic(kaddr);
+		kunmap_local(kaddr);
 		put_arg_page(page);
 	}
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
