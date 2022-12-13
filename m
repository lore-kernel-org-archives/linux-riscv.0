Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA08C00145
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPtPu7h2iNGICBBaO7QniW6uBQSo9Fmqssrp8c+UisE=; b=2+EPOok54ISjq2
	47J//gz0ZQa++fksc99NvPT+A9iChru5rrqrhl3IuNVo22yxkxwMjoYklGBzKaWjhPLXaR+Rc8ASh
	Lz6/hvQhrS/E8WpQN8FqOJgaV5rpl2LK9SVdDpLmYNeV24awBkcoxtrVrQeyoWqk7s3K5lb+ItRNB
	HmAq/IToKHLDFo58cPTYzLkpp9yN3n3mnTN42K1RndnUElS9WuDF8zCZ6gkZaFAtHauoGA/zjwf0R
	zto/+NbklDkbp+cSqCPFEuHP8ovy7etjthVUf1LV0j8z4ByP6OTfxVyYbGJ7ddT6UJnLXCyRxK9C3
	etr4vkBJI9L6ylSWmi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u6S-008vKz-Nj; Tue, 13 Dec 2022 01:29:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u5R-008umi-Lw
	for linux-riscv@bombadil.infradead.org; Tue, 13 Dec 2022 01:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8EoQ5xUEc1FhkDzFjTM8ar5jGOrCyi+Uxx/y/QqNxRU=; b=UzN/UIqjkWJSWIQPRHxzXelLXn
	KvwPmLb7TcYqRyEu+S9RSLNFezkZlsTOQL+C89zJF0uQS2TBzPj4NO+i92+QM4F7SpInGvZYDRmer
	T+LqsD4lOB0DFxrYzKjZ79mubSPOQksVE9nAK0Fdkd9LIbw4Io7ZPj7LULYQSbeIlZz5keVyVlfVB
	sAQRFEmNOqw2z0FkKclM0kzbVLoOwnpZ8kPpRflvzRzFW/xB0eOP4aQuT8z5PFpn62z8FhT9o31u/
	+qfbDYAFc/ukCZCTw8UQZUarxc5KT1b6j+BV1YCVM3fSCXDOyLUnhopAUUVszGzJec+aWhGjdjQ6Y
	2goUGtMg==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sz0-009w6V-7B
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:21 +0000
Received: by mail-pl1-x64a.google.com with SMTP id o5-20020a170903210500b0018f9edbba6eso2752972ple.11
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8EoQ5xUEc1FhkDzFjTM8ar5jGOrCyi+Uxx/y/QqNxRU=;
        b=ipDKG2JVkVU4OEFWDzPMjQvpwLjKrvLtAsE0Q12Ig0QpxJrg8GZmiIm/+azC7Rsqa2
         1pdKNzn7q+j8SVvNFFE1MwcgltFtLpVT1j20hR2QXC2Javgns9JomPzKxX8az0MVR8Lr
         xwxNQ4L+57LcZAeNwj6COf48lC0gORWpzAAh4EHs1sxnOZZrp+oLMfA4c+3AeRny/IkJ
         jwTjCm1aa2Xqxkk8MuRjUDMVdOpUJRa/4/CvkiRx5C364j7RnnRN0GmaWDsiuRVgQoLD
         8mXK/UHXSQfeZuLkyN4NIw4jy3LAgiOHXlbk3sYihSHK7Kz3E1BePP1k4h5mJdMfm87Z
         NXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EoQ5xUEc1FhkDzFjTM8ar5jGOrCyi+Uxx/y/QqNxRU=;
        b=lICO7+vdejRKpK/trHFVi33l5DyjDhL1398EEyJtHpDEzgPacdg+lI17AAs7q686le
         ffxtksh0WUhWhpKO9n4D4OUqZPBoT3hMD/bi9rROzXD3vWxMDbNFtzmoQbphkh9+/KxJ
         9x7i3SaIihc+SgFoCre+fzLWkXFNt3/vxTr2erP5QHa+RUAB7fCZaDEfXhc590EKBOJt
         GfAIf4AcF9/P+gDfn9Iu6krOTC4ao/z0sbwuwaSkZKe0S8B5w8wNEu9f2b9T+AlFJAZA
         xWEK6kKORvqlvmyCTWmTYMvBeLgA9x8NnjsS42WgUcWDRj1LyzAhlCdBEpIi2ovCRi8B
         sSZQ==
X-Gm-Message-State: ANoB5pnZJZfbCAkjhi6OT5SdbQcF1jC1DgqcYAnHcMVh9LL8Unx6Cgxo
	Nvo9vxzMngmmUcYdiTskwUcgtSzCGl0=
X-Google-Smtp-Source: AA0mqf41e8RRAh+qKfNTJDDY/qqZQdHGGB0nRmZ6p6Bfn39lpFfpCEPh+Tpnh5gE0AblUZ/3qOhiatioU1w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:bc86:b0:189:6ab:a97c with SMTP id
 bb6-20020a170902bc8600b0018906aba97cmr77809422plb.39.1670890633860; Mon, 12
 Dec 2022 16:17:13 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:49 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-11-seanjc@google.com>
Subject: [PATCH 10/14] KVM: selftests: Include lib.mk before consuming $(CC)
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Sean Christopherson <seanjc@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_001718_928884_94449F93 
X-CRM114-Status: UNSURE (   7.03  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Include lib.mk before consuming $(CC) and document that lib.mk overwrites
$(CC) unless make was invoked with -e or $(CC) was specified after make
(which apparently makes the environment override the Makefile?!?!).
Including lib.mk after using it for probing, e.g. for -no-pie, can lead
to weirdness.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 6594ed51eeea..2487db21b177 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -182,6 +182,11 @@ TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
 TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
 LIBKVM += $(LIBKVM_$(ARCH_DIR))
 
+# lib.mak defines $(OUTPUT), prepends $(OUTPUT)/ to $(TEST_GEN_PROGS), and most
+# importantly defines, i.e. overwrites, $(CC) (unless `make -e` or `make CC=`,
+# which causes the environment variable to override the makefile).
+include ../lib.mk
+
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
 LINUX_TOOL_INCLUDE = $(top_srcdir)/tools/include
@@ -207,10 +212,6 @@ pgste-option = $(call try-run, echo 'int main(void) { return 0; }' | \
 LDLIBS += -ldl
 LDFLAGS += -pthread $(no-pie-option) $(pgste-option)
 
-# After inclusion, $(OUTPUT) is defined and
-# $(TEST_GEN_PROGS) starts with $(OUTPUT)/
-include ../lib.mk
-
 LIBKVM_C := $(filter %.c,$(LIBKVM))
 LIBKVM_S := $(filter %.S,$(LIBKVM))
 LIBKVM_C_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_C))
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
