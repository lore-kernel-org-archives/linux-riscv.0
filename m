Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B9BC30658
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 01:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mdJ0+KNoijhlTw/u3XnvU10mKQlqYIJ67gJi4IkXvso=; b=xJ0PCvwHIsw7Ab
	MH7uKXX9REH2nrCXw3qx4OUYO3Bfjmqq1YQtX/JQdjBf5WkllzpLoQdckE0pnkdU6iHy93VnJT4U8
	yEo+eDnOtD/elyXGEwcIMEnWGBh1lJx+B4ZLXDAz8QX0BS+WVFMzS2/p1+Nrz9Y3G9ARUd8IErdAs
	EXoJ7EqXUiFSwUm0ly8ACOsZ0lcyQT1kAuCepTfj6H77Hm8LHEURFyC43jj8qGyDOy3VKI4PnbkdS
	xQxu1BYxh/wwHczdDFTZz9bZki5OAorU03zGYtN8LW4ZYgGzu/WslTkGvHNFoL5JkZfeblG9znu1R
	hV0/nafZablvnIIYswIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOpD1-00000008WWO-0keH;
	Wed, 03 Jul 2024 01:54:59 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOpCy-00000008WW0-2sDe
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 01:54:58 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70675977d0eso3191109b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 18:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719971696; x=1720576496; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHnHE2GTnxtpKeQVqGKu23WsWDVRXJprmZQx/8LwZ9Y=;
        b=ZmT/dJa4EnP0N5h/jyVRyPITM+FjiAaFFc2jdrdKIa6s2wpWai/gfJH9sqocfRl30Z
         9YXP0N7si8k8H4VsGy2jK6bglsGWCsmSl5w0bBbO2i+Uy/M0aRSbqnLaA15/kTUCgfao
         kA+yhOksoPVXAtelgnuMR9BJwbiMaqAhk0TS0bnH9yu2q2K4jnuzLWkA5WgFe5mIIkqp
         be3NoI6CMlUq3HjPRIhU36/xdO+RiD7qK0/FYux3mg4dJ2DWP554JJE3AxEt/VCFwnoC
         V6oF+UNSxhLVrkGXB5bKcRphbhwI0yH9Bo9v7XlOkZ/xSPpESvEFUSWyywQqNo+T42J4
         hMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719971696; x=1720576496;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHnHE2GTnxtpKeQVqGKu23WsWDVRXJprmZQx/8LwZ9Y=;
        b=DGlpoBGnAiH2rae0ixPYk+ZR2wBqOpVpp9uDeMDfxo4+o/QFyXkBGp1gvih1QHSszo
         J+Y5eLE/i3jONO2ENXajuYqxvG4AblugVEFF1LwspLj/H/TWKZmt2Z0zsXyH3WLRXedi
         x6LZS8K8DGuJ9ZERintew+LXctjahjRAbORWji9mwSTWsBjjsGTkMqTt63FjvkOjz5Ny
         NKXqOvEqz/HKVNnaEFvNBR2NcREwMla1oMCeuqRFkFhp1OYwSLNPgd5r/Nc/gTvl3fdG
         o+qd4uwa5CHPMWgTrHTIDoQxstdWtD3GyXwkS8v5+0iKe+l6bcJPnJUXzCU725fTQhmZ
         whQw==
X-Forwarded-Encrypted: i=1; AJvYcCW9CL5YLQb+U39rNZExqJYifcY1qjdgEg3zVHjkLEbOIrMDHfVh3rLTYht8op1QxtghkQheHxWBYj0udQS/JAjd/dPGpw7oq1foxxN/igrA
X-Gm-Message-State: AOJu0YyHUjaKkPd1e5DX/Z1M3/0utJLpPav37OKZkym9YWyeno0fbUr8
	53DX5KkSKv3VaYgb9ekcK8isjyEUsuozky3a3WcQxHwZugoVoC76IPHbODKnhbQ=
X-Google-Smtp-Source: AGHT+IHVaTNrEQj0UhlgCk9T6SwsM+7KULs8BJil9oMO9HLDbJD9EPjpJtrlGWIGB2o/chZZ3qmuiQ==
X-Received: by 2002:a05:6a20:8922:b0:1bd:d7:6942 with SMTP id adf61e73a8af0-1bef627701amr7103130637.60.1719971695758;
        Tue, 02 Jul 2024 18:54:55 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11d8a70sm90881235ad.118.2024.07.02.18.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 18:54:55 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 18:54:48 -0700
Subject: [PATCH] riscv: selftests: Fix vsetivli args for clang
MIME-Version: 1.0
Message-Id: <20240702-fix_sigreturn_test-v1-1-485f88a80612@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAGevhGYC/x2MQQqAIBAAvxJ7TtAKjb4SIZGb7cVi1yKI/p50H
 JiZBwSZUGCoHmC8SGhPBUxdwbLNKaKiUBga3XTaaaNWur1QZMwnJ59RsupccNq289KjhRIejMX
 6p+P0vh+S2H4YZAAAAA==
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Chiu <andy.chiu@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719971694; l=1692;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=p1H3bMXP1kaxiJKEHWQp3wxLk1lndgbgCIxUehTD7eM=;
 b=THxzHTU66KhNxRU98J3d0MKiSdJbtlJEQVuKgH/hJ0MUkrz504ey4G+CHt1Zj7NvRbhmk2SXm
 6JUG+aLMJ25AzycCjlzsfdAzISKI0z2xA994yPLwJ3CwbrrRrvPdDZ2
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_185456_757763_998BDCC4 
X-CRM114-Status: UNSURE (   9.73  )
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

Clang does not support implicit LMUL in the vset* instruction sequences.
Introduce an explicit LMUL in the vsetivli instruction.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 9d5328eeb185 ("riscv: selftests: Add signal handling vector tests")
---
There is one more error that occurs when the test cases for riscv are
compiled with llvm:

ld.lld: error: undefined symbol: putchar
>>> referenced by crt.h:69 (./../../../../include/nolibc/crt.h:69)
>>>               /tmp/v_initval_nolibc-5b14c8.o:(dump)
>>> referenced by crt.h:67 (./../../../../include/nolibc/crt.h:67)
>>>               /tmp/v_initval_nolibc-5b14c8.o:(dump)

This is fixed in my rework of the vector tests in a different series [1]

Link: https://patchwork.kernel.org/project/linux-riscv/patch/20240619-xtheadvector-v3-12-bff39eb9668e@rivosinc.com/ [1]
---
 tools/testing/selftests/riscv/sigreturn/sigreturn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
index 62397d5934f1..ed351a1cb917 100644
--- a/tools/testing/selftests/riscv/sigreturn/sigreturn.c
+++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
@@ -51,7 +51,7 @@ static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
 
 	asm(".option push				\n\
 		.option		arch, +v		\n\
-		vsetivli	x0, 1, e32, ta, ma	\n\
+		vsetivli	x0, 1, e32, m1, ta, ma	\n\
 		vmv.s.x		v0, %1			\n\
 		# Generate SIGSEGV			\n\
 		lw		a0, 0(x0)		\n\

---
base-commit: f2661062f16b2de5d7b6a5c42a9a5c96326b8454
change-id: 20240701-fix_sigreturn_test-47d7063ac8e6
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
