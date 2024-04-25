Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DCCC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 19:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Q89nqrIBJs5IT/bcyjCiRQ+yOrleNEr1j1iTsltUzI=; b=q3oP40M8mn87tI
	N2BPiigmi2dzUCCU8yZ1Vg1LNOjE7vBWjOMLaeLBjHouPcz2cWQTVhd9jx5eqve9tXQtkCUQB5XYX
	yYThj+BVu3KmwqeRjAZyMPwF75xVMHxZsew2XQfcIO2YGbxEveuZmbScrzPCtKBrdW+sBolXUc+Gv
	qqbUdb2+F98l2kDq6lh12mHpi95lj2LrcX/t7FUqlBqbya9HnHhP6P6ipOmRG/GLKY1XJcQppsdYf
	I053uD1LmVJWVq/EUSf40G10Ukym+PvY4Y5stwkA7njLgkZ3to6o4sHgZ6NCX+MKz79wqQ9KEbfce
	1YYHQ4hnfFfB5YAjDIoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05F3-00000009xii-0fD1;
	Thu, 25 Apr 2024 19:58:49 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05F0-00000009xhy-3vHK
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 19:58:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e3c3aa8938so9863725ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 12:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714075125; x=1714679925; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0NZH4f99IF0WKrj7O85gUWonm//e5lpeuhKVLijLk2E=;
        b=LRew/YI7Zr/Z3ZKgcdb2CthYbDRvaC0u6RlxN1VlHyI957VIqJHAYyHBYS+reBbLu/
         ggq4JhDm2Gsy8dAJqojahnqlzlChkOOYS11mD71zE4CobcBk3hUBrhetWMBlYMgoMpNj
         pifvOPcIf1CUUCXBXnhBMFu7Xd+fQHQNieKPTd8CLK6L/E6IIWblX2x7X+2JN0T7ly/k
         XP1+n2mR4xKLqRXRQk61RtWNE30X+uUM0SF2l2EePyqFJLrlZwuceMyH3eIjH8fQObjQ
         lE0vv2uff1u/LzUG2oDNg0eou+07Bzzk6k3jnI9LkdIWnsmAMKENx4GBt4jkzeufsB/5
         4Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714075125; x=1714679925;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NZH4f99IF0WKrj7O85gUWonm//e5lpeuhKVLijLk2E=;
        b=IztLoEw1asi7XpVWW/TJ8V6b0Rn2SqgeVywdOLKsrQyzSqD/OVeJMgMQbFGLY4bHN0
         qBL8sJzc+O+3rmRgC5wW0U0edOpyxR7iVwC3BXKGFckNyPy6TJxtwAJicty6CcOKIUeL
         xuXbrM2UK0J8KA/7aQcKQ0f5mnWteGATliDDaeOPivggItouzgSvLlx0XEFvvyV80Kzu
         mfakmkAwfT4nDBM0XIXwukkm2ivrszlK7CFGfmNml24ZtZNJOkFKb+a5PIj72e1gK/Fm
         EN2Uto4w7l+A5RlOHTMqxwH0OGamRw4Flln9KSicPew3jp0Ecj1g4be/3Dda4zoSDBP+
         dMaA==
X-Forwarded-Encrypted: i=1; AJvYcCVhtf/1Oghn6AR4SWiw7jAqQKzd6Vbik1NQXSSnlf+59d0L5QrUP9JJD5P+3nV0Sq3i8P/ofFWVf2NZypT7nfzsYB49ZEXCe1sf+JGvnwwF
X-Gm-Message-State: AOJu0YwyMBUC3X4hTBIPMG1U+Kr978c6/XvEX5aRsjXVHLAai+QoJZ3u
	56i7RakMb4rGjKEWwVulUxixtuvrH9hCz2D3t7iETS4Rw2ONqqLoeUK9oec07zI=
X-Google-Smtp-Source: AGHT+IECF4sLhnfZeY8g6vk2fi/Z9puc/V7awMpO2ZhBa2zz101/n/Rq4S5Hho5iCaLR2kaBPAoHRQ==
X-Received: by 2002:a17:902:e54d:b0:1e4:6938:6fe3 with SMTP id n13-20020a170902e54d00b001e469386fe3mr719133plf.58.1714075125454;
        Thu, 25 Apr 2024 12:58:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id p4-20020a170903248400b001dd88a5dc47sm14152176plw.290.2024.04.25.12.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 12:58:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 25 Apr 2024 12:58:03 -0700
Subject: [PATCH] riscv: selftests: Add hwprobe binaries to .gitignore
MIME-Version: 1.0
Message-Id: <20240425-gitignore_hwprobe_artifacts-v1-1-dfc5a20da469@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAMq1KmYC/x3MQQqAIBAAwK/EnhPM8lBfiQizVfeisUoF0d+Tj
 nOZBzIyYYapeYDxpEwpVnRtAzaY6FHQXg1KqkEOSgtPhXxMjGu4Dk4broYLOWNLFm6TTtm913K
 0UIeD0dH97/Pyvh9r8BpEbQAAAA==
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714075124; l=933;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=nA0EButQZ1tC8ouxJfYydhjZwNEli15W2Azor/y6KZY=;
 b=EMBx4wRw1BijgV83w/DHcSmBFo1pgAnUefy+7FE1WoOwc0GghpU0GN3buJtNdf5uyLReFKFc8
 Ek2BHtYsvTBBwL2lzcL85G7/HKa4/x2hUALseg3IMLy0cbQDJ9zs7ic
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_125847_016064_057BF4CF 
X-CRM114-Status: UNSURE (   7.59  )
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

The cbo and which-cpu hwprobe selftests leave their artifacts in the
kernel tree and end up being tracked by git. Add the binaries to the
hwprobe selftest .gitignore so this no longer happens.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
Fixes: ef7d6abb2cf5 ("RISC-V: selftests: Add which-cpus hwprobe test")
---
 tools/testing/selftests/riscv/hwprobe/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/riscv/hwprobe/.gitignore b/tools/testing/selftests/riscv/hwprobe/.gitignore
index 8113dc3bdd03..6e384e80ea1a 100644
--- a/tools/testing/selftests/riscv/hwprobe/.gitignore
+++ b/tools/testing/selftests/riscv/hwprobe/.gitignore
@@ -1 +1,3 @@
 hwprobe
+cbo
+which-cpus

---
base-commit: ed30a4a51bb196781c8058073ea720133a65596f
change-id: 20240425-gitignore_hwprobe_artifacts-fb0f2cd3509c
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
