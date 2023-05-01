Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE12DC77B7C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uih4L7hBXZIPyCC86dhcBNdq/f3pjJ6bYVsppAQa0+w=; b=tAoXlkbKV/WIMP
	DQPLYIOVo7fsjLW7+wIXvaGEpeP6RXfaSN2No3K57IJqplPKOnZwlPkWPnmS8HLKvqXqF3SoM5TI7
	pJavDA8GcwRj+7jbuRKqBF0ZN63v0qyEVrjj88ViHoNYcrxC3tr7lRfEaN3Dn5QSxEuGEw1m97Pdi
	4NGHH0WsEUqQdjvarTmoRUlGbBVXWfl2UfhaeeTZmcSngKqUYCrPBOsgC4J4Rz8ZV4ID07BBJ1LsQ
	7ra2CNNCgCroTMpY9QTQTmtMaGtkJUbxESq+FwQpH5VXBxtbgRunN0EU2LsPADcGzRGA1qfztydDH
	nfTMAKemCNqxA4FYviyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSo6-00FzsR-28;
	Mon, 01 May 2023 12:39:06 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSo2-00Fzlx-2D
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 12:39:05 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bc4d96e14so8630217a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682944742; x=1685536742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsOOlRTCOjL3abNi/3ZUSQqB4+vgvV69cdyU9ee1C48=;
        b=hODYeDeYg6APhZAviVEDv24zkkV5PSyD9YF80bCIKMgiHcDDsd8y08C3drl6nvnGJD
         IlJxYRT/wEBGX7nbEciydDBBtR5sxWJSS+Q1JOTL+EYkrNHQvWMsz4+2JhTAsCU5cMFe
         Ea+MOxsYngr/dEQhvm3KkMoPZiJyiwADd2JrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944742; x=1685536742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsOOlRTCOjL3abNi/3ZUSQqB4+vgvV69cdyU9ee1C48=;
        b=lCsI3tI6aNpUKm9OPioLpS7izk0Gof/DfhztZI6eMnZDBo1Os5W4766aR3KZrXG7oP
         Ne3PFAM3fwFaAHLUYmdv+pH5LuzdOFu5+sSZVeys8BQRA9/MuUOXlB6ZXQwjwQPy0u1a
         0yF4lfvTxHVdU/yr01P/JchBSDrhqh+ag9+dhaMNJTe14zEhhdYqigCnvNBSql4PfWTQ
         8DVSlo9LKd7PPmnUjTNmbM7Hn4gSUnMUy0UH484lNzOoskXtaNoj8uEXTf3VS3ax1kUr
         X3//Zcx/OFQRJDonvoL1QXYmgtr0GSQPVURslw8W1dY6Z5mAvpy0YIf/1nkdWHjZBnrC
         XAMQ==
X-Gm-Message-State: AC+VfDzwGarJcwnVKxJhtZY9TWZ6O72JvgWFEKSupP7Ckj8pC+NM3FGl
	8BsCxoQLsi7xRgNiLWIXd3hSVg==
X-Google-Smtp-Source: ACHHUZ4EUorB+1FZYBv1RP6+ov+r8A+Pc1H1dxULnrAhwBqWHXQ9LjOP3Ez/dznJWtTpBeBKUxYLqg==
X-Received: by 2002:a05:6402:27c8:b0:504:77ed:5a33 with SMTP id c8-20020a05640227c800b0050477ed5a33mr5864584ede.8.1682944742259;
        Mon, 01 May 2023 05:39:02 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:c573:159e:712e:688b])
        by smtp.gmail.com with ESMTPSA id c8-20020aa7c988000000b0050bcbb5708asm146772edt.35.2023.05.01.05.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:39:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 01 May 2023 14:38:22 +0200
Subject: [PATCH v6 4/4] risc/purgatory: Add linker script
MIME-Version: 1.0
Message-Id: <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=ECbK3ORJb/ox8qpp2VcGabf7Ou2PzFFDokGI84nq/PQ=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkT7Lc5MTx2hMC4Re9phVjZPNed9BIxos1Pxii0
 61fGiCxDbqJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZE+y3AAKCRDRN9E+zzrE
 iJuYD/9j2b1eDvjy+uQCumtGC2Jn+H/Md0JWPsxPb46aNyMDJJYtpnBOkQyLCIR1Ro6iTpnQQLM
 +8uN/ou0X4CF9cfN+g6f5JwkPoQfQcP+jYNP8HE3vvJyaw+gY8gFKrsolGYojIu5+7EZscjeM+x
 7hCRkxslbxzkKo8bCXJPNM5bL+TS+8voKLtJw5vxmDtH71krf0z6Gp38OUM1qbruri9kSi75MmP
 pPIc503fFiicjySfDDJ804XtSoK2FjXUVn96C+XtJdu8JE5WpzayNi5G1CCxtOHmymMyPL11Nyb
 +Y3kXDpLRgX+07NcFuZOiO/0ThN8bGM98On1cBYfS5PV2bqYo2Cv6+KOCjnObJd8T8zLrIWY31E
 dkIZGehfJGieHtPMQYd0Up0Q7UFloD9EOCUk3YXQjbVL5YW62U0ajBT0UqSNiyO8Fk5AdOGQnDv
 M1oDH7eB6zhw04nOc8MvRcEL1vb70bgueckn6cp6u0ViYD7VRwHLkKiDx9y2wl93EfhhVpu9EpQ
 108x63OJbcTsVjOEtHREb8lzuERyPHJsPH5o49C5N+yZd7HKY8dMY7vi4/kdo4rqsrCdLSOYIRN
 nVm4G0/Z6eWsohGrZwA5weUUpMcYwEHd+mCMobjyQ8WPRg/nBapyYtxdaEgYMK3As9R4j0j3G0s
 Q5pwBDSsFyR/N1Q==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_053902_741234_80D6CC27 
X-CRM114-Status: GOOD (  10.94  )
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
 arch/riscv/purgatory/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index 5730797a6b40..cf3a44121a90 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -35,6 +35,11 @@ CFLAGS_sha256.o := -D__DISABLE_EXPORTS
 CFLAGS_string.o := -D__DISABLE_EXPORTS
 CFLAGS_ctype.o := -D__DISABLE_EXPORTS
 
+# When profile optimization is enabled, llvm emits two different overlapping
+# text sections, which is not supported by kexec. Remove profile optimization
+# flags.
+KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
+
 # When linking purgatory.ro with -r unresolved symbols are not checked,
 # also link a purgatory.chk binary without -r to check for unresolved symbols.
 PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib

-- 
2.40.1.495.gc816e09b53d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
