Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921D5C9832F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 15:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJ6pu43BoIoGqUz6UkHAfN1+w4v4XIxop+0/aG4VdUY=; b=FWvFFMG/fbWjnF
	hBNs8qB00dgUXMTpfmHBzpu7OVj4scT3V+ZGeTDB6CPt0SzU2cN5ps9khxryro9vYDwAUOrd8Xt0m
	GUy4OhL7OF0F4y8SMu7sxVgFiFCIlkcr5NM12QqI4eJamkZTh7nqZJUf0xT3OJTYrOsRNwllzfnvz
	Qdpq1ADZPnXN3HTC8tce1GAtTvfqOCItjODZFy9WGSccnx0UC32liwoN44h+9/B0GVrQI70hL4OiT
	EjblwBEOCbQCrG7iPJWlsFLtW9MzZ1yjmSY7HtVmBUKC1mQnKcsTg+bt6Ttqnq+XzX9uhI0hRDWdv
	0RtZ7hpvcEsYkx5FnRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUkZ-0000000Fcly-1ekS;
	Sat, 26 Sep 2026 15:55:43 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUkX-0000000FclN-40aq
	for linux-riscv@lists.infradead.org;
	Sat, 26 Sep 2026 15:55:43 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 46e09a7af769-81b15bca7dfso154292a34.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2026 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790438141; x=1791042941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8tzVjsh/cKn4B5b5sbwN+m7Qf+Lv5/itTNncc1/vcs=;
        b=W3r51BJC6rJZTzZ+pmH5vgldJ4ucE0OJnFtMIZbfeZ9HpMfqI/pxgLOj8FF758LM8T
         YCQkEIxZkPd6G8SqRMrWYmDO60Gxu5uVfIXSPiBAZbakLVt2aYystlYonITSIaYel61R
         XVpklb4xvXENv6jAX9nVsStZbZCn12a1wKwQsYVrLZwmcuPSYWt7/RFxfl09wwx0JYlY
         7HDkcAaa/oOqk7xw6mZb/rPItjdOBCrum4i2rrVT0v4IAthW7tu1V9T5ZdtNo2DIG3ms
         Miw4mIt6HF597R9GL+LgQDn9Or/aM9T6srtIbxhC4WCabXeyfiOBFVHcyOxLIiq4C5DN
         4eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438141; x=1791042941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+8tzVjsh/cKn4B5b5sbwN+m7Qf+Lv5/itTNncc1/vcs=;
        b=wchqz3GuhIdRXkse+x83m6QKnolNzd5qLO3Tc1x3vHzqX/SYtYhah5ZoahEq/ShNDv
         uKRrDWLjMQXNGvVIki1N6/uyLuH8xVq9AYcK87K42lfgaC9FWnG5G/GtpdeStzAE0GvQ
         1DCRODWvq69/5m93P1WOxVZHQ+ajP4bJED7cA5KzDmtYb8++GbBZakhTl3m7RNnQ/3yt
         FKtXjhTgFv1vHpjGdOQSTalol2svHqeJKkXwS2Cso4AkvQ8peQiAQVxHvgIUp26CI5N6
         0AvJE7+E9Mf1jFjEikfn8kA00P+nq7dwuIrWV4Yn0ZvMzuhL7n4lJsOpgw3arg4YxdXE
         yIuQ==
X-Forwarded-Encrypted: i=1; AKwUvByDEYtlcVhqL8962Xe03InWLsVMR3Qgh/2Kdoj3q3JEKJdAWLgoZ34blWcfE1+A+b0znO1tR0LL3zCQrQ==@lists.infradead.org
X-Gm-Message-State: AFuF++moBjP44paSeJkOTWs43BZEWWkeA3mep3ZNGHMmhYQRdikokBFF
	+HiMNom9cpAs8qhMPefAhYOHexolvc7p4d/1Xn3+EPD/ITHQkrJ8Dz8F
X-Gm-Gg: AYBFou1e1zeRFkZQGZK2vixP+vpG+odLBhbvu3MyaAZm1u4HBH9PPnmUPt0aoqtQTxq
	zeOei8CXMa9T2iSMhLqY/N04A3jxO6UnQrAIAYJACdE+wRHbDLVjrHCEG8jmJUj46F/6O1bS6Uf
	h3ykzhpZk44Il19ph83RzQxDc/2SE8NR32xkc+pEyx1nswuSD6FIaZVQXTHi21hfV0mQgiODs+6
	rl02T8J0obotXrYRCifrWpjG0fHniF/Qrg520E2c2Vc17ZxzG/KJ0HWCGAZ+RXMOurlylg4Irhr
	6VE1eOr2e25+baadWsMguvxuPAvgivq3t8DSGNVH/Qu6rSa0surU+xwwafdXHkt6tbjwTt5/UZ6
	geUFY3b9Jp/mgHkQh2wOsf9N1v+wU+dRJwQlbIXAq8cx4NF3qBq3ead6hvCLtOuVh5F2xLpVew9
	cauQS8QpO55NwqO6T/Nw4fAun75YbK0nmVz4ILj19IOTF+ScUOMb87Ao5blwB3T6HvY+lRDbbY0
	UTcigoBBxjFQrd2JtNCiC2olJYF0cbyNPdiCsBs
X-Received: by 2002:a05:6808:c210:b0:4d6:9232:b3be with SMTP id 5614622812f47-4d72cd37bcemr8543745b6e.53.1790438140875;
        Sat, 26 Sep 2026 08:55:40 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74e99sm4577446b6e.4.2026.09.26.08.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:55:39 -0700 (PDT)
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
	Danish Khateeb <danishkhateeb03@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] selftests: riscv: vstate_exec_nolibc: Check the return value of waitpid()
Date: Sat, 26 Sep 2026 10:55:34 -0500
Message-ID: <20260926155535.306111-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926155535.306111-1-danishkhateeb03@gmail.com>
References: <20260926155535.306111-1-danishkhateeb03@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_085542_005193_3EFE1395 
X-CRM114-Status: UNSURE (   9.22  )
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

vstate_exec_nolibc does not check whether waitpid() succeeds, so status
is used uninitialized if it fails. Since nolibc implements waitpid() on
top of waitid(), GCC can see this, and warns:

  vstate_exec_nolibc.c:78:12: warning: 'status' may be used uninitialized [-Wmaybe-uninitialized]

Fail if waitpid() fails, as launch_test() does for the same call.

Fixes: 7cf6198ce22d ("selftests: Test RISC-V Vector prctl interface")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202609250003.hvssJlRZ-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
index 12f1b1b1c7aa..5f53e5e8ac52 100644
--- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
@@ -69,6 +69,10 @@ int main(int argc, char **argv)
 	}
 
 	rc = waitpid(-1, &status, 0);
+	if (rc == -1) {
+		puts("waitpid failed\n");
+		exit(-1);
+	}
 
 	if (WIFEXITED(status) && WEXITSTATUS(status) == -1) {
 		puts("child exited abnormally\n");
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
