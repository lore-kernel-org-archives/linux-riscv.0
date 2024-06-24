Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3C0C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 00:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hTPs3rPHo+NnpVrMufhNOfcardxSH3A2IEGwg60ZbNE=; b=mI+CwcV+FBD20fKxQq/+BhkY9V
	9zp6yGzxOqP8dgIAHncJIWaWf7dGSzINqfaNuAhAMc2FpfkohaamBF0zT+agiSTBRCukyuaGXAR1Q
	SWygv7QjlPRWPGgS/TTKOX+FMJDAHLlPunBClKH+VLZFc1sTqcjVUBZGDqU1EpUw+kDlE7vEWclVh
	NqkdLkCtjzQXFDUKTbDFF6o0zLMYldRnRFw7izW1X2LPKBZBceHmBzW0WC5wYWXByjno9AAnEQD+m
	CGqBBXpIT4Ih7TiUaFdqzzrefvPd+OH3gRYxDhnE9Jm9BZLIv/2tfn4VjL5vtQyyDtyrGn2CgPCwj
	d1rZUviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLu50-000000016Ed-2s9o;
	Tue, 25 Jun 2024 00:30:38 +0000
Received: from mail-pg1-f202.google.com ([209.85.215.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt8U-00000000yk2-3ERl
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:30:22 +0000
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-717b045b0a1so3866266a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271808; x=1719876608; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmF+q3rwrhR8UU+6OXTpwv5GaDaD/Y47DiJtkxDn41A=;
        b=Rm2GQn3H+mgFNnt6NWZUKWGhivSLH0d9IR+mMNHGyfs7M8vZxXVM1jBBq8+5HiAWim
         PPqIVYm65q/BNNdPZQReNh8b0ar+SCV1N+EyMPnHyRyyJOav3prVqQculCbthHTi9gew
         XdOKkw9GAai2PXw5mbHTR+nZMjNORRwH1vP4KyJMVna9iB2ZmAW76cb/tPm3I2NmWU80
         2pY5zqF5kRrNcreFLtmyVL4Cm97/8sOhXqa+89sJi+Efd5dK1R1TogK45km1X4tWDDn8
         YYvQoJz3juZGYHKkI5yqgb8EY4fqVjdNWwUfbS70ubKsjx8HpCfbq6WvmUy5N19coVM+
         AE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271808; x=1719876608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HmF+q3rwrhR8UU+6OXTpwv5GaDaD/Y47DiJtkxDn41A=;
        b=JM8dpfQks/v4sdih4hQ6HgZVgD99CGPXragsSc1AeTvx2ZRUCuedE5Nim9DZm0yExP
         YVN8iQJIj3m/+D9+I3yaf7in7knC1FGtVcMcK/5AvO8Sdw+mkAu+jfPz+1qZUNOClV+j
         e8jL4Qx2gL4PKtzu6sIY1v4a1qBigTRDp7dnRD6A1n6LDK/LMXTxPFTbokfE1HxToEeH
         q24objlJrWue121lkGU2SwuQmOeU6dDjMYpRlHzF64Q+i/epEhfx2gGzWgCdfuIvk7fW
         S/Aj2CpOY8N914GXcgb+b8ajQ1O3pBwCQula/LNU9OfjTySgYJEjC/uaKMU0h7PPaC64
         nOfw==
X-Forwarded-Encrypted: i=1; AJvYcCVD57nJcaJG9aIuTpGp93r9v365wDUJrDsXsgZoLLT1yUIpIKYydceXnPADetcd+c8LiN67CiFd6L05NThhlGTSkc9R8Od+6eCxOvsb2unU
X-Gm-Message-State: AOJu0YxHZC4vOyoxvNVFtAHuST/EZ1aZH8U9jBY7lDv7+dcOymx/n4QI
	f575Q7oRE1Ny8jq27UHytiL4Dj1euhCMlN3Huo4lqn3k69Kmv4J0w8MXtnbKj3GDj4JEa80PzbU
	Utw==
X-Google-Smtp-Source: AGHT+IHcaOj/Ro9h0704QE00MFW9hpEi3kDY+mehE3/RAXufwF49RwalyubuviiuKxGcrX2qWa70mRNXqFw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:9d83:0:b0:6e9:8a61:b8aa with SMTP id
 41be03b00d2f7-71ac38a3772mr20790a12.0.1719271808040; Mon, 24 Jun 2024
 16:30:08 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:22 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-14-edliaw@google.com>
Subject: [PATCH v6 13/13] selftests/sgx: Append CFLAGS from lib.mk to HOST_CFLAGS
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
X-CRM114-CacheID: sfid-20240624_163011_024310_518A38B7 
X-CRM114-Status: GOOD (  11.10  )
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

lib.mk CFLAGS provides -D_GNU_SOURCE= which is needed to compile the
host files.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/sgx/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/sgx/Makefile b/tools/testing/selftests/sgx/Makefile
index 867f88ce2570..03b5e13b872b 100644
--- a/tools/testing/selftests/sgx/Makefile
+++ b/tools/testing/selftests/sgx/Makefile
@@ -12,7 +12,7 @@ OBJCOPY := $(CROSS_COMPILE)objcopy
 endif
 
 INCLUDES := -I$(top_srcdir)/tools/include
-HOST_CFLAGS := -Wall -Werror -g $(INCLUDES) -fPIC
+HOST_CFLAGS := -Wall -Werror -g $(INCLUDES) -fPIC $(CFLAGS)
 HOST_LDFLAGS := -z noexecstack -lcrypto
 ENCL_CFLAGS += -Wall -Werror -static-pie -nostdlib -ffreestanding -fPIE \
 	       -fno-stack-protector -mrdrnd $(INCLUDES)
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
