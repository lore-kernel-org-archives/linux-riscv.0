Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9FEC9832F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mLX2IQzdicVZN8VHdoN87PBWYn7FkqW9mDbvMqWniX4=; b=0rsDV0ET5d4NvZ
	+b2xV6U3hz1pwPqzfBVDo+UthJ4WEkH7Vi1RoWku+/z2AaqGFo3IANcNWiSSb0Fi4i1Ehh2H8FJSa
	4UycyWo94bFuJ+Df85tA1OAElUq90IisO/3uL+eEZsc+4FS/O+CII8gXkXIFIOlieofGGb0OnDiyw
	q8HzCQRKYBRXivf0D6vywFvY7na6g8thdEpNoVD+7+G7f05LVSiCr8WZzTCUs5zI6h7EC6E4Y5tnL
	wk3WY0t8TmEUmj1ZcdxvG2ooRHGx9XgfYOyyrD2VKR/dcZQxWiqQErFNsdXuVb315/yLwm7VosTiu
	kidVRogsfd48zgHnT6VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUkY-0000000Fcll-15yv;
	Sat, 26 Sep 2026 15:55:42 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUkV-0000000Fcky-1n1n
	for linux-riscv@lists.infradead.org;
	Sat, 26 Sep 2026 15:55:40 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c13f2685f2so1027401b6e.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2026 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790438138; x=1791042938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FL/IwT1Hb4lximhhDXismKRaoV2j4LIwOh7vqKvTOc0=;
        b=m2ZHSOpsxixo/fBf9sjvVedL5xhJ9oCeBVaa8GjUnmMTZJQULRzjb9by5lv46tNd0w
         1dswLJ1hfWUwM7Ykk2KBchBYJopUf0GD1WDDCIDLZ20WwwPzCEzJTAP5VV3D3XDqHigD
         dOiSG942BqSkHvKSPabE3bgrf1OPvARq9Dbk2VgdizjWFCjOpB4sY4X502RGnCcURuLE
         SB2978YOwq6nUZCeLGXkvAwiJJlj/4WhCguFKAYZv9Tn0riamk2B9J610r9Fe2n3p6+9
         rDDm6wRnZeVx2Mo6PSo/v9qpJcGwy53OH8CdD8CdnYT1iMf2Eb8cqIBZNV8Brvvfpnhp
         JkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438138; x=1791042938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FL/IwT1Hb4lximhhDXismKRaoV2j4LIwOh7vqKvTOc0=;
        b=wu01va14W2H+FjH4dBzGbdfkGlTPXdPB8WA9mC9h+HDE7l1MtL7R3ZF1jFtKt6WIMH
         5z143JhO2IZd13tU7kdXzX82tl1lblf5c43j3FmA4GV07xJzocQ837vj2AezhGknDE/L
         RA/Vb/FVB3PhIM+hU4tdvzeS5qi2zjsbG0aNoLNsiz3ZPpxv+fDvsnpYKtqk54QLHfcf
         5iUiOAvtr/Dab9qoxsmRONU1ckFiKJrYuvIvBlI5lcuc20OSYMIeZYqmQap1NppkqqSU
         W9Gt0GLm4tBjN39xU3KtsijVajylVRm4bPcotEB3jE7vcpESL6HZL4eZHFijX4/ifVzb
         Vrew==
X-Forwarded-Encrypted: i=1; AKwUvBxO09aG8YTSsUFa5rhkMLZkjjjCZwsf/p4x/jS9Kt73hyEJ85tIDOMnzqhlQ4l9TR2Vg+hOB7uG2YY64g==@lists.infradead.org
X-Gm-Message-State: AFuF++nBZtIxKyUBTpcK+C0W43LEx/G1Qxrt7vqNLJR7O8bCwboPrRYK
	bUH0Pw4JoNYLUvvo27qKoa8xZdSMx1j8LcswzT+Be5gz/JgwS+xCNmRV
X-Gm-Gg: AYBFou2CEhus5lxhe9M+rgyBfIWqWv7ewsoydMDzArjYjzx1EzO7/P2Inhsarjvva7t
	5DkkKrhJkUhFmNfqzGCD7WaV6Q2Wlla7rb4iZJiO/XS8wqrbXEwVsy4ODenSLjElq2dSqNobbGb
	62HzsHLm6qK0D9DC8qMN6fLPYY4XydOAjT3Dl9UhG7Zf4PnbaBYmZj5kH9T+FEms7Ki2/Cowcmr
	eumW6EB8RXl1qdmBye6+fgAxZk7ntrUBOlI3oC0oQNp8Kvya0z1W2VvrbpRIzuC3k2VwZzsIVLt
	+7+4PGiW2tynJR3YKWTO8NSYx3n8HL6meZxqzj+QzwiuFiGn3DuZ5Sx75ZJ3YiGN1xQPGhSBkiJ
	vVQrrcWbHJUAsBj1b1ffvvRIdmKkNXH7q4C00LDpSQSam6+9Yb22cOAy5QH7z9XBBHV2or7T09Y
	nVGjXshD2TYeGW3M7VtzuEiTuxoL951ySFWgJ7b7RmWUpPRDM41CwfQxHBLlurshb47PT1dm3kJ
	FXQZKe2M2F3+mWv/eMwgOnNLa029150AA/vJCdi
X-Received: by 2002:a05:6808:1185:b0:4c3:b6cb:da37 with SMTP id 5614622812f47-4d72df6ccdamr9178567b6e.35.1790438137587;
        Sat, 26 Sep 2026 08:55:37 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74e99sm4577446b6e.4.2026.09.26.08.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:55:36 -0700 (PDT)
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
Subject: [PATCH 0/2] selftests: riscv: vector: Fix the checks of the child's exit status
Date: Sat, 26 Sep 2026 10:55:33 -0500
Message-ID: <20260926155535.306111-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_085539_489919_C23D6D24 
X-CRM114-Status: UNSURE (   8.93  )
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

Two fixes for vstate_exec_nolibc, found through a kernel test robot
warning [1]. Patch 1 checks the return value of waitpid(), which GCC
warns about. Patch 2 fixes a check which never matches, so that a child
reporting a failure no longer lets the tests pass.

Tested in QEMU (virt, rv64 with and without V) on a v7.3-rc1 defconfig
kernel, running vstate_prctl as init:

- vstate_prctl passes 13/13 with and without the series.
- With the child's vstate_ctrl check forced to fail, it still passes
  13/13 without patch 2, and fails the 6 affected tests with it.
- The warning is gone with GCC 14.2 and 16.2.

[1] https://lore.kernel.org/r/202609250003.hvssJlRZ-lkp@intel.com/

Danish Khateeb (2):
  selftests: riscv: vstate_exec_nolibc: Check the return value of
    waitpid()
  selftests: riscv: vector: Fix the check for children exiting with -1

 tools/testing/selftests/riscv/vector/v_helpers.c          | 2 +-
 tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)


base-commit: a06776565b9e73512e880a95b66c198ae8e7e24a
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
