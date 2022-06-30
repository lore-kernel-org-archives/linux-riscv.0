Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05C9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bw6en456lyyFphqLa1uWr5jRu5d5UgkMRaU213pqjXo=; b=Tlm6B5rKEwmDKj
	iKjsVVPBbCgKVrfZURqfhZabiXxfAlF58/b/j1MjisRZ3GW5LFrvlDtw95mU/ewIh+wX0o5ec4GK0
	LU6Ar64Qk871r3L1+B6xSOZU38N1rKxS2B1k7iCG8k1mD5IaA8EfbZvHEuFYzJ9tge6xFf0Y1gC7t
	dJGnRquBGJZcrrsGh6TwepMorel1VgZLNibfv2qHWmVT6tMr5dBuRaLkUEpSF+BhsZQhex2Sod4Dr
	gMs9bLZw+mQUvLTGcYNsgOzIoes6F1WYXGseRaxQkI4ok9semYaDJ3e3exq/70WCBcvCLwGSQeNKM
	k8Ljgsw8QM/1A1aTgw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6x8m-000eCI-KZ; Thu, 30 Jun 2022 16:35:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6x8i-000eAT-Pi
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 16:35:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id i205-20020a1c3bd6000000b003a1888b9d36so197368wma.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 09:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lZIrTmlOnvUkLrFbSOhPtwGibISpt/RODIchaEd1CDY=;
        b=gvOxH2z87z7QsFkRgTQuNhQyyz+dHV1+8rh1sM7GpDupM74IOa6Ym2zyVx4Y0mEnkA
         xFy3h+4BLgQAGQb7kHWwxfMcgIUz4Tef84LuOZORClSobvlsqYZZA4JRBDfKNY3iS9A8
         W3vDemOPYtYp6bt4LA+muwinmH5c50oo9YbK3ghNa7sz/mzg54ZgVTtrFKX2Cgzw+P3N
         ELSRjvVF4ivQ1YmTMe+MNMmYKoyNYpV+LtXu6h2BXUafKGQrVOGF0X6LVvrsdTzc/XfD
         EcDDOVPqA+9w2kvc7GCTWMKYCQjY0KUvF3eMQA1meIaibaLIqLPbyUm6YJoKiAbmsj+a
         uGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lZIrTmlOnvUkLrFbSOhPtwGibISpt/RODIchaEd1CDY=;
        b=hFJExvPQoB4QD4FYDWhOyANpfhMbgcUZlxzQWuKzNPjGdO+F7IMczcQxsHMofYgnSh
         qvZ6R2HT/a7C7eCG+79vfzLnasVsO2yWc0eFQCL1wky2TzA8fn/vSYCDgt+Cd1m/urlV
         SUV3SeH6fQNVgWrk4hBXojTOsXV7C7HKoNHnWlOZeXypISK9SFQju0qfo0nr6z9OPKrp
         4zEqN0gc0VGLTGpuUGPuEQSW8wxqpwRX3yJPwevuRMFpTKlp2/S5F+Fn8BkSVwus6kvv
         /wh37qStp2kMGBx+Nj9gFlLvYk1HyFbPUPL+C/d7RWZxTKOq2SVh4V3BHsyeKTasAw4S
         c/gQ==
X-Gm-Message-State: AJIora/Hv03TrZro3kytGA+hANKBGj+YvCZLUtdJPCGLLfsH2ub7cEHx
	MfdWDnonZlUvpvJUs6KD09Q=
X-Google-Smtp-Source: AGRyM1sQNe4+WIPmqW10XET/JjOyzodgMYKlJLfdcugPO9fE6FCvfEevPFPhlgS/sBSR469fLSNDFQ==
X-Received: by 2002:a1c:4b11:0:b0:3a0:4270:fcfa with SMTP id y17-20020a1c4b11000000b003a04270fcfamr12974836wma.53.1656606933805;
        Thu, 30 Jun 2022 09:35:33 -0700 (PDT)
Received: from localhost.localdomain (host-87-6-98-182.retail.telecomitalia.it. [87.6.98.182])
        by smtp.gmail.com with ESMTPSA id u3-20020a05600c210300b003a044fe7fe7sm7112303wml.9.2022.06.30.09.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:35:32 -0700 (PDT)
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
Subject: [PATCH] fs: Replace kmap{,_atomic}() with kmap_local_page()
Date: Thu, 30 Jun 2022 18:35:27 +0200
Message-Id: <20220630163527.9776-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_093536_872210_FC2CD594 
X-CRM114-Status: GOOD (  11.31  )
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

The use of kmap() and kmap_atomic() are being deprecated in favor of
kmap_local_page().

With kmap_local_page(), the mappings are per thread, CPU local and not
globally visible. Furthermore, the mappings can be acquired from any
context (including interrupts).

Therefore, use kmap_local_page() in exec.c because these mappings are per
thread, CPU local, and not globally visible.

Tested with xfstests on a QEMU + KVM 32-bits VM booting a kernel with
HIGHMEM64GB enabled.

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 fs/exec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 0989fb8472a1..4a2129c0d422 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -583,11 +583,11 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
 
 				if (kmapped_page) {
 					flush_dcache_page(kmapped_page);
-					kunmap(kmapped_page);
+					kunmap_local(kaddr);
 					put_arg_page(kmapped_page);
 				}
 				kmapped_page = page;
-				kaddr = kmap(kmapped_page);
+				kaddr = kmap_local_page(kmapped_page);
 				kpos = pos & PAGE_MASK;
 				flush_arg_page(bprm, kpos, kmapped_page);
 			}
@@ -601,7 +601,7 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
 out:
 	if (kmapped_page) {
 		flush_dcache_page(kmapped_page);
-		kunmap(kmapped_page);
+		kunmap_local(kaddr);
 		put_arg_page(kmapped_page);
 	}
 	return ret;
@@ -883,11 +883,11 @@ int transfer_args_to_stack(struct linux_binprm *bprm,
 
 	for (index = MAX_ARG_PAGES - 1; index >= stop; index--) {
 		unsigned int offset = index == stop ? bprm->p & ~PAGE_MASK : 0;
-		char *src = kmap(bprm->page[index]) + offset;
+		char *src = kmap_local_page(bprm->page[index]) + offset;
 		sp -= PAGE_SIZE - offset;
 		if (copy_to_user((void *) sp, src, PAGE_SIZE - offset) != 0)
 			ret = -EFAULT;
-		kunmap(bprm->page[index]);
+		kunmap_local(src);
 		if (ret)
 			goto out;
 	}
@@ -1680,13 +1680,13 @@ int remove_arg_zero(struct linux_binprm *bprm)
 			ret = -EFAULT;
 			goto out;
 		}
-		kaddr = kmap_atomic(page);
+		kaddr = kmap_local_page(page);
 
 		for (; offset < PAGE_SIZE && kaddr[offset];
 				offset++, bprm->p++)
 			;
 
-		kunmap_atomic(kaddr);
+		kunmap_local(kaddr);
 		put_arg_page(page);
 	} while (offset == PAGE_SIZE);
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
