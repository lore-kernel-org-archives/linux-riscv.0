Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE75C30653
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 23:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zCxvSPZGtoXCqapPzz3K/80skozKvKDQVbcjeZg+SgY=; b=Ezcv8fJzlVDnC/uA3pR40WehKy
	F0ZYd49jFccQQbPPVJd0XgyV5Zhan55LbFgBE16lJS4n+iCfpoqvXyt8qyGG2kxLCmPDMUSrHaJaJ
	q/dzCQncdXLuVQVvg75cIOLFpM8eVB0dlNVApjsFfHqLIEjpaX8cjbnp8+PC+R6QbZ6sQnj7EL9DW
	mzHjwPG47D6youRQDQl2GmKhMtYKHQ2BpijUqaB3E9iLO1cfd4C0gWwLDSXTQDj3mrvQTNIsV75tK
	eJ49MNKGpu/G9uSqUFvJIsrghWvYcJfL5Fu0mg4DOKEsciDAMfretQKuHgOkmFkmBSOHG0A0cZu0M
	vcK2jSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7t-00000000yDs-1lMH;
	Mon, 24 Jun 2024 23:29:33 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7r-00000000yAb-0EYW
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:29:32 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-706819a8390so1202013b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271769; x=1719876569; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ifr8Ya8A/Lifd4HdrItZMFbfd7FCXsltsIVIxxyLaY=;
        b=2BgsXz/7oOxCzGBOst9Su+vQpexzKGs0P/69uIj2v/q5r3k4eSGVDxqnmHCrN/pWdp
         7uoXuCM0X9fCVl33zLMk+YVUuCfJDStuK7QePn1Xjv31/qFnXWRtGOvNVUAlna5UpGJ9
         BRT40uNz9oKpH76B9Vmi3RzcAaMREwvfXDapQiu0d+6C8gCD8+cIufMquWCqu8sTjFQB
         AcH9qaX621GiX238cHL2tzSzGn2tDhPKt+Osx5PprSaTQ1KakBU5EQcHW4CzW6JuJ90s
         ID834I6jxQw54fFDDRcPjdcuYXDBnrXheLyou9qohQC/9tilc69YYUQz1x69510yWkrl
         AAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271769; x=1719876569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ifr8Ya8A/Lifd4HdrItZMFbfd7FCXsltsIVIxxyLaY=;
        b=qQGw/or1uSNnyAY72/chd5nrDyaeWwRHb8pzfF5atRCss7hCZYiBYzl5HxQ+0RWJF/
         7ORIHLzYOaKO2tOaF4ICMcsNDAOa5SQFzLApiFERtVrrhlgb9TB0wRB5ZKsH2c3rGg2E
         MSb0/EKI17pJIfuut7KcUtttsMP2YJIdmMVkwifr685LnNknNJ7VzROsW2ad2raf3E0v
         joFhwdofxBucBSK753EsZt7DX1eF0SrG9URpWh3vf16J9IxlEre2ddWOIICOi5mwB/I1
         n1DVwNJxG17nJIdSzMuLxYQYEUOxss00ndeUHERYt9Np9pin9b7pdeYlqnza/q6ZbIbh
         yydw==
X-Forwarded-Encrypted: i=1; AJvYcCVBUO3gALyACz/2mZOr5BkcRS5+H5C9SLWy7DK3pB4QtICGrWej3Uw46LF9TJvtshyyQCoO1z1mxMdKCF0QYjZUBz1uWqWKUUnLTqP0w5SC
X-Gm-Message-State: AOJu0YzYiLi/blRbXm27dCnJm6YzqXvWb0ylhMLlITjIECzmaw7me3al
	+CznUdYC7BBJmIEYMuYK/947XRRDDOnK9PNui/9id9xbUoivyFLPb/anYAgMZA9a81GH/0juU4i
	Ikg==
X-Google-Smtp-Source: AGHT+IGfwxTfgoKpQbwyVdHdeu4Fayfp12bseSCI+21TX1FuKt23v8wGVL/xanJWyhgjJiFfoB7TugWlGLo=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:898e:b0:706:3433:bf21 with SMTP id
 d2e1a72fcca58-70669dfcfdamr31477b3a.3.1719271768844; Mon, 24 Jun 2024
 16:29:28 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:15 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-7-edliaw@google.com>
Subject: [PATCH v6 06/13] selftests/intel_pstate: Drop redundant -D_GNU_SOURCE
 CFLAGS in Makefile
From: Edward Liaw <edliaw@google.com>
To: linux-kselftest@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, usama.anjum@collabora.com, seanjc@google.com, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_162931_169148_E6E94F52 
X-CRM114-Status: GOOD (  11.36  )
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

-D_GNU_SOURCE= will be provided by lib.mk CFLAGS, so -D_GNU_SOURCE
should be dropped to prevent redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/intel_pstate/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/intel_pstate/Makefile b/tools/testing/selftests/intel_pstate/Makefile
index 05d66ef50c97..f45372cb00fe 100644
--- a/tools/testing/selftests/intel_pstate/Makefile
+++ b/tools/testing/selftests/intel_pstate/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS := $(CFLAGS) -Wall -D_GNU_SOURCE
+CFLAGS := $(CFLAGS) -Wall
 LDLIBS += -lm
 
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
