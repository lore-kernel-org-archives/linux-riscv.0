Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E68C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WZdrX8RYmKsaXo8VJ5Wrxh10ANldC7phqkpjcmCZug=; b=yPlog+kT+9yHkY
	me5EneBGfKyRMaM/Mz5Y/v2XcHvJvk+lwBfhNTMg/SlDE6aAdSBJwJKz0EAigMtVeoQuDO/EnWVBS
	Zo6PnxLupPOWuNRwWUj6FYB5Q5TXWhJntwSPmn90GrilGhAmeTl2Nv46Uh6l1zA5i3l3V/zNf4tbf
	2banEDWFywj4sIgeZlx2zqHs+qCm/z3KGjtOSNwOjqOfmc2QhIEtV7oMpU78sLfuNBO6MTYouiBpu
	k4l8IMekCEW/OFXNobchDgB2svxXwojLArmnMyiiil6lwJah3YmbmAK7rDezGal4OeC2TiOZjdhbG
	WvS0fDBU9fxta8LXr4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSo8-00Fzub-2H;
	Mon, 01 May 2023 12:39:08 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSo4-00Fznm-0J
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 12:39:06 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bc070c557so3012556a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 05:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682944740; x=1685536740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecmOgKj4rHuYIab/sfV0jN5x+nFDKq6SG67BJPIt7F0=;
        b=mKg+bkq0NR+B9AinP7+ox3WRRdl5CMkW6hn7AD82Fgqa+7fbUMNiNltYuZCdWKFzGc
         unhr5yMOsZL/or9r8PjKGOGnbVzP8zPkt+LRSVK8mg5G/t33oA9o1PY698FnKY8PYIET
         /LDgi+GpCXZLnhOflN7j/omuXZmCcamYmO4lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944740; x=1685536740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecmOgKj4rHuYIab/sfV0jN5x+nFDKq6SG67BJPIt7F0=;
        b=janRIcYRJsVGE1/roJ/qnsxmBQZU2t2dfuu89vzfbmZOyDLMyXCl6W4B4XzBd1i172
         CummuEfEVyL1CV5Rp7u2s9tRg0dLzRujh94pxUpCCTxJcz99i1AwPr8CDzDSpzkmwuCr
         s0i8l/PjtzB88ZZ+qyq1FOptv1pauuZAvX7nAisi0a5B0Ln41cLOHI3Q9AJs7mIZ1Tm7
         l5YqT0oCF5p7idZ2kd0mK10dcmWM7lk5d1opo+z3NL93qctfUpjP9wnaIgtTshHwh5In
         ylutiFHj+G4jTM0VOT2nrZndNUE5kR3/a5fl1osqKsXpxN1hGUl8IKEFYMvqTU6CHNBY
         9LAg==
X-Gm-Message-State: AC+VfDwrHzen9ZrkT17tqed8MLQq63qqFmN0IfzQHD0p2fD810zn6Krx
	Rg7faylp8/MZfCVkrhY0u0R7lg==
X-Google-Smtp-Source: ACHHUZ61A+LRi+71XC3zKgGuQNso9mPlM0T8FY/poP6QaGXzZI8sTUhNY6Hk0v49L4lTBvUZBRM9uA==
X-Received: by 2002:aa7:dc0f:0:b0:506:c2b2:72fc with SMTP id b15-20020aa7dc0f000000b00506c2b272fcmr4483898edu.7.1682944740515;
        Mon, 01 May 2023 05:39:00 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:c573:159e:712e:688b])
        by smtp.gmail.com with ESMTPSA id c8-20020aa7c988000000b0050bcbb5708asm146772edt.35.2023.05.01.05.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:39:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 01 May 2023 14:38:21 +0200
Subject: [PATCH v6 3/4] powerpc/purgatory: Remove profile optimization
 flags
MIME-Version: 1.0
Message-Id: <20230321-kexec_clang16-v6-3-a2255e81ab45@chromium.org>
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
In-Reply-To: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
To: Eric Biederman <ebiederm@xmission.com>, 
 Philipp Rudo <prudo@linux.vnet.ibm.com>, Dave Young <dyoung@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ross Zwisler <zwisler@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
 llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=5RExnAah9i9M9ThRE28+66klWLL9LdvzLPE8nTUxjoc=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkT7La8ioS0FTBvHSBrwIzNc4yErEKxBXHSQt+x
 JiCAoPrehyJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZE+y2gAKCRDRN9E+zzrE
 iPSPD/9e9vGoy1sdkIvKVHZQw4XGt6HvaPue9LcoY39HNyZE8mZATbQBYoSI3SkVObACWx/jlGW
 hny9wRcxVSR2gX6ndlP3hfzmhcAG5m4snPNfr1/kVb1t204udn4JAMSu6uB0tOAaEJf0cly/tPX
 MgzKHTBxQ934jsr55N3AFr9IVNmsahHF4f3aSWjNkqG17UbtDgv8cTwplGTAcFmuEaR2z1RjZkA
 F/yFwnqe+z3MZ88H8P+DkXvYeZmVqaAlsGnmPR7qa/hdj36aRty/zFgPnKfHUSJeGyp2fH2NnXz
 Cd1SzviJIuk0zXGetJ0TVMwvd06uiL48vL15JIziDBIUBrXgwgsjgWjbJX9UyVQgnQxw2mlzHtT
 Z7CLSbHlZeWWNhhMRi8OdxxXy970/+OBiTXjIC3RdYBoC1cs9ICI2TwUw+oOGh+NTL0sqsgyWmN
 qXAI32vfKKHiJSW146dpoerqe2/aEC2FUfzHHni/4c6Xc897c8ScvQ1KbXuolWzL1VEjHrXofQx
 UTbe/svZ2wrRRbzYDaPi17SrFGFPMeTLs/8NtUxrR/huyW2SHpZatS4Q5VxStlZ8eC+qZ/c8S1X
 VmC7nztI9HXeDK9dTlsMYGuPnA7hQ52n2CrQPyQ+zyQMCydIlCzoTIuFwmucPvw8iUBDg/Qb8sn
 WvYecPgPSx57Nlw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_053904_138735_439D6A4F 
X-CRM114-Status: GOOD (  10.19  )
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

If PGO is enabled, the purgatory ends up with multiple .text sections.
This is not supported by kexec and crashes the system.

Cc: stable@vger.kernel.org
Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 arch/powerpc/purgatory/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index 6f5e2727963c..5efb164330b2 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -5,6 +5,11 @@ KCSAN_SANITIZE := n
 
 targets += trampoline_$(BITS).o purgatory.ro
 
+# When profile optimization is enabled, llvm emits two different overlapping
+# text sections, which is not supported by kexec. Remove profile optimization
+# flags.
+KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
+
 LDFLAGS_purgatory.ro := -e purgatory_start -r --no-undefined
 
 $(obj)/purgatory.ro: $(obj)/trampoline_$(BITS).o FORCE

-- 
2.40.1.495.gc816e09b53d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
