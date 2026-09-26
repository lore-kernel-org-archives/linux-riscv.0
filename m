Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEACC9832A
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 15:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17srbCT7MtaBh86vDiU18LzIVLfJuk6x/Kn+yipZo3k=; b=c5KAS5M0HFzGT1
	QDd6I3IIZWfNYFEnreZPx+6BPrDIkGhB4RmK8bubPZXXjzPUgkJ1k1pOaGmBW9waz0gALdMHxrkTX
	lZZn/7pchHzDYxa5PdOTsnNejAsFCi7Hkd2mGVebGuUzl+efOzu8etZb7H0oA++KpiB9dn0PXA7Sd
	q6qnpngKum3uGPz5qj1iooMLpw07xlDkat3J4ExCT0S5EZozHc+09JjTJLeyKfhKzJMrxuxp4qodY
	rXGytIp4Ay7OkuM6ckZ03mGVeXp9sPbPuiBIlw5eCSSmAIQ42J6kTMUTkw1zNHUVHhKuEIGwUGEJ4
	PqoXRulDDua8EDpI5Lvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUkc-0000000Fcmx-212j;
	Sat, 26 Sep 2026 15:55:46 +0000
Received: from mail-oo2-x2a.google.com ([2607:f8b0:4864:31::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUka-0000000Fcm6-2rGj
	for linux-riscv@lists.infradead.org;
	Sat, 26 Sep 2026 15:55:45 +0000
Received: by mail-oo2-x2a.google.com with SMTP id 46e09a7af769-7f4f0c89e34so1171641a34.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2026 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790438143; x=1791042943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/X8WtMKO+kM8/RymoeclZdtD8nVgAtWR81xquL6WA4=;
        b=qFjoe9h31M4C6V4A1fuFgCTTaQk34Es+CUBVkljl28Nh2nKEXWzJBjkszUvVqK/ZVm
         Clv696ffda4bsROSspcCjjWwzHfLaE55kWNcCq6Dr9ZIXr+NF38kxaJ8By6vnDRhWcyD
         +gJqjWTIM9Z7n7C0SuqlRCEkQgiybC+BMXEgwxG7eyNoVAL9uBCl//bvptr29rzuYG9C
         ghizoWAVyFwWYlRE/3FxJ4gKVWXKih1tmJQZ75RSdtYDfVQIP10bErGDjSFyU5XASoiq
         w/kjGb9gf2G4uNeis0a782OfhWHcrptdiFSeMWTUIdVOkyiv/xFonH2EzZbCqrOLmyz0
         kHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438143; x=1791042943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/X8WtMKO+kM8/RymoeclZdtD8nVgAtWR81xquL6WA4=;
        b=irZv6zK42hxTxiw1g7Jor644gVPLe+ENHo0HjQFNy7tQjqGJ0V7+xGhMNUyhbXM6XB
         26FMxaAxCcGOGcrGybJu1jtC5LMC4o40yZhwdMjIT7wTyhs17lxFGknJX+L45ISLaki4
         YF7kfEi2kYe4aDbhqagtU/kXv0atSIfG99zTuCiurgAA58uJrADb14fJSrNQOFUDL7Nb
         0nOjKku7UHQ/WuW+zfqscTas0mgLsxhLrIknC82URmi/GlgTmS/zD+enfWGh1GTZi4T3
         OzST3b/+R/PvOSjfzoksPf6XgkMd6CVnrVQjI1QaOkuwhyH5hdxrdR5HAgH1fiB7myJL
         SJjw==
X-Forwarded-Encrypted: i=1; AKwUvBw5mFowDdd46k3AYnW1g/PqEVsMb81MYM9OmUimEOq+5Ttr9d94K5g1fQMDTd8X+8Jq5sRJ8GGPEwIcnw==@lists.infradead.org
X-Gm-Message-State: AFuF++mwAVyDZE+zAyOekQ961z2R2U550NBaJvfXjn8KV1aS/iAiseh9
	+Wy8eoX9m1qU1O4LYBsYtr1BgmBsWdZkAzz8HW9+mQ5/moSHqhU/Ss1X
X-Gm-Gg: AYBFou17+dfD9ba1lCgEdYMfJwpxI/1DPNtcjoymQfLpt2XV2vyFbvRBcJlxlX/f5Af
	EiMrWrRh+HLHGNCrAGodlk5/gtEN64KxvG02y/cx4ax6LDzNJi/3bI26snwFuPOSH0+2Eybxxrs
	SDhOmpTqYkfPjA3+y9OZWn+1ZLQbY05mHqWRwCfPfacLYFClhmw3pyl9gEFIDVlRmVDik3ANSd1
	tk5O8hyWQNy4iQzWekEj+052w2/ba0xmmFJOChyn2T4lLXDoQnMA/j4YlNyGwe8DCzXAYeTZPM3
	R6EPCR89XePMkQqpuTb0cvd2b3R1Ynw++JxZsbhNNQY784BvUtP0WesL06pFFFoDF7trzlhe8gf
	va4dMDEwYr0MXthLYcjgMeodVo5hThJur3XS5msvKOpIvkbHa9E0zKQ23kjDfmxgbi8uzYBfVV5
	xBAlFkMJYKhooFsu0Ayi/n1+2V93qbiubXD/FfFCBf9bLBvUkltHu7HQu16jybkDdR6XWGqpsuf
	FRFNeLGId1Qhunf440qefARvaYn5pOCljLfqUJGhqjwvhK1f0U=
X-Received: by 2002:a05:6808:23ce:b0:4c0:9d00:b46d with SMTP id 5614622812f47-4d72be38df9mr8255004b6e.13.1790438143549;
        Sat, 26 Sep 2026 08:55:43 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74e99sm4577446b6e.4.2026.09.26.08.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:55:42 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/2] selftests: riscv: vector: Fix the check for children exiting with -1
Date: Sat, 26 Sep 2026 10:55:35 -0500
Message-ID: <20260926155535.306111-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926155535.306111-1-danishkhateeb03@gmail.com>
References: <20260926155535.306111-1-danishkhateeb03@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_085544_747234_3F6C1B28 
X-CRM114-Status: GOOD (  12.41  )
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

vstate_exec_nolibc and launch_test() look for a child which failed with
exit(-1) by checking WEXITSTATUS(status) == -1. But WEXITSTATUS() only
returns the low 8 bits of the exit code, so the check never matches.

vstate_exec_nolibc then returns ctrl as if the child had succeeded,
which is the value the harness expects. So when a child finds that its
vstate_ctrl differs from its parent's, it prints an error, but the test
still passes.

Compare the exit status with 255 instead. A successful child exits with
its vstate_ctrl, which is at most 0x1f. launch_test() already failed
the test on 255, but now reports it as an abnormal exit.

Fixes: 7cf6198ce22d ("selftests: Test RISC-V Vector prctl interface")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/riscv/vector/v_helpers.c          | 2 +-
 tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/v_helpers.c b/tools/testing/selftests/riscv/vector/v_helpers.c
index de6da7c8d2f1..8942ddf2b52b 100644
--- a/tools/testing/selftests/riscv/vector/v_helpers.c
+++ b/tools/testing/selftests/riscv/vector/v_helpers.c
@@ -81,7 +81,7 @@ int launch_test(char *next_program, int test_inherit, int xtheadvector)
 		return -3;
 	}
 
-	if ((WIFEXITED(status) && WEXITSTATUS(status) == -1) ||
+	if ((WIFEXITED(status) && WEXITSTATUS(status) == 255) ||
 	    WIFSIGNALED(status)) {
 		printf("child exited abnormally\n");
 		return -4;
diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
index 5f53e5e8ac52..05f18b13a36a 100644
--- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
@@ -74,7 +74,7 @@ int main(int argc, char **argv)
 		exit(-1);
 	}
 
-	if (WIFEXITED(status) && WEXITSTATUS(status) == -1) {
+	if (WIFEXITED(status) && WEXITSTATUS(status) == 255) {
 		puts("child exited abnormally\n");
 		exit(-1);
 	}
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
