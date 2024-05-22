Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913CDC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kI5B4mDhMPB5fFjNWZgq/flu96g5TIo5ZbWesDRum0c=; b=EfvfIWgeY+Q8gxEy4opgOChBsZ
	6qN27U3P3Juk3OFkhHWGOcNiRJV5ytJS7ch3BGkNVfMA6H5pEKmnjOYtEWTHHIdRuKZr0PRVjgV39
	SuqQf4h6tNdDyYuQqzeYnYOKAEmw5KQnRWy84Re8z7a0sCO1XLmNU5VcTvSeF5wSWa9WY0msBxU4X
	IoRm2hbnFWEZHiqLIgzFD8Rbtqb6OABBN7G2kN06DE/6oM8n0Ah3Kq0Lm53WTBXybYlxYhESZYm+M
	uoc424S8F3BncUCWljpVoX2LVdhjfAUzRXGHpEKU00Vpk6X5hMNk5m2YmmSMWBb8yafvYwVZU/Z0V
	OgMeeDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aRS-00000001Xly-0R5K;
	Wed, 22 May 2024 01:06:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aPA-00000001WOv-1ybE
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1dqiMTNBgzJveM+1U2NKL51RHxmum4u5pgeXNwn+APY=; b=MdfxSft5TBUOmKlZQSpwxnN394
	LVfNN2HHJlO6sodPWlXJcpgaDJiBu12Hl29CNfZgU5psXntDMnTJXSAzUgjDzg8W4PxOow8l6uqzz
	Nf/T5yytV8KTyxbXXLl2/QSL3j5Ab7p19y75lkhO2NTW4caVDlADmkrWwH/E7A9NR2msVKv2N3Vmm
	bJUCw2tsEgLeSDVPKKf6M9MPGvSETIT/HozMsQoaOxaw4shUsp7L1uytMBity/lqieHrjkb4UrDsq
	e0AP6+qiCfqklRH5zorB+Hk7LwG+5QSxSK9OEIIioySBqrHQpC0de5cEFys4znOXLJ/HdfRYDNTV2
	6VarVU4g==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMY-00000008826-1Eps
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:04:30 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1f2fbeba118so30879145ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339707; x=1716944507; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1dqiMTNBgzJveM+1U2NKL51RHxmum4u5pgeXNwn+APY=;
        b=pmFNeZudjTvcMq+UXnJNmV/5mcc48H5x9r7PdnA6cMaiXMP5v8KWGMQ7Au3ADAbZD4
         WLtgOUw0JFQyv1SMzhfFDX3JqXF+cFSmAWR/e7wf6XahkwsrKTTraMAiss8qSlkmtCyy
         uxYMkA1UntZfukkcN4JiiOVepi+uMlTJgVYICVHHJm6cFDZxTfK1m6lpaNU8+o5UEzew
         0KAon+tAEw2Uvlpagcbi8swK2vY0zvSQX2hLGkMu6RHgq47jvXx+1qA/zuYRxkNmjbbN
         QDAQN0FA9Fy2NpCWB74xuYQ1BuLuj17upVtPAmfA5D6K62KnvrIXOxI8C99qMWDLqqEV
         vd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339707; x=1716944507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dqiMTNBgzJveM+1U2NKL51RHxmum4u5pgeXNwn+APY=;
        b=DKgDxWY8JvVpwqR3WCHDscKAwKV84fAAYhw+xJxm1jn8hJm6XJbZCQcrH2AOBTj+Vn
         sQoVbKkAF7uy9Dh57bpwQ+CwyCx4ZclHFv1Le0E6EI3j/FFVLW5TzP0+WM9J4XxZh/2D
         NvZlkSifaXKZVso6VD3vyAG0i3zWjZb+BAcaj+tg7u0UBFyLWb5ZvgYR+166Y4UVQcSv
         gWaly7+7p7pcngu3u/Fo0WKsVOkquaVF2Esq/JUnjr6AByWK7BBI0DvPJSlWOp7DEAH+
         U/wJpBM26r9RLBNVgzQ1Br2ik+QCn2sVm0/ZNewXPvOrzaeslePZQqGD0aAxmtu+pHKF
         ptdw==
X-Forwarded-Encrypted: i=1; AJvYcCUOIC4G3XzxL6UAvZur60B5Udg3fdcWcj2sf6bcB5QlE3Z5uM0AEgUyZLl/V47bMBiI2fDXZ3MJ4Cd0w4v/geztOv7Gk/hZLuqfoS8EYgSz
X-Gm-Message-State: AOJu0YxbGicOIYXY9KPoBQr+5ScPHhjaS2gvxu5aRUM4jwTcnH2JJWGh
	uOkCnnNiwgmPkxDYEq0m9K6YF6Ek83UTbqjxsHNSJxICTGmwo/GpgFGujeYZnkGTnko6oa4OR01
	A2w==
X-Google-Smtp-Source: AGHT+IHx//11iRXfF9jU7Y+WwJe3/GdLuBAfz6WDem92qdspDh3/TEq+7NzW8GllbYjjYjpp726oyFnk0SE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:903:22c4:b0:1f3:aeb:321c with SMTP id
 d9443c01a7336-1f31c9e8135mr338475ad.13.1716339707160; Tue, 21 May 2024
 18:01:47 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:31 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-46-edliaw@google.com>
Subject: [PATCH v5 45/68] selftests/proc: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_020230_117690_FDED5C7B 
X-CRM114-Status: UNSURE (   7.79  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/proc/proc-empty-vm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index 56198d4ca2bf..f92a8dce58cf 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -23,9 +23,6 @@
  *	/proc/${pid}/smaps
  *	/proc/${pid}/smaps_rollup
  */
-#undef _GNU_SOURCE
-#define _GNU_SOURCE
-
 #undef NDEBUG
 #include <assert.h>
 #include <errno.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
