Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346B8C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t8Ndcf/qBz67CIY5hqBYV/U3PlxJJEGBpD79rFbNybs=; b=voIj8lWWt0EY8TFHmbt4G+l++Y
	PHFDpbcQJ2qeZKUrPt7c+yR18uoVG8DlhPjncBZ6pdVM+9bs7Cg4U9otDfDJZoM/7Aj8bNGDf3Zcg
	eDyYyR/0iNRXrBffzhhpguQi3JdIZ6INT+TdK0g4Za4nsLkbrBKui0/EK9y8uKDdVZsfT7N8fXDLj
	pheQ6Er9Mlg7g+mY8P6h3PCms6rQgdzHhZTiRaa19Q2pSKysHxn3OuZL9BTZoT1Jl9jw9ZscYamYZ
	YnA6l0pgwJw6k4uKp70FX9f9sThfCsaSEGNbTLrxGsHr9QzwCqazS3/lDTTTshdyHTYAoB2i6S5fp
	XnGWMq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aRP-00000001Xkv-469Q;
	Wed, 22 May 2024 01:06:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aP3-00000001WIs-3WHE
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PsA+RTqEPsjVoyQz5htVdcF3IiHZQEx5aOWSYNx99Ok=; b=Up//6OJ1y4XoLfqOPWri6kaAm4
	O8FeicXjnsNKmJRjGY0qazonDszHYYSzaGJoelYBJgF3/gsCB8ngGPViNHOEdBBGULiw+zSqR75aJ
	moTb3y5GsBWueNT0W0aKp1FRD7p3F6dhZ8EJZnoKz2IOSnTBjH/4Ly2fxQ1uDogXL1eYnF7CG0/ZB
	Yeuvn4sk5dTLsNfkVYKsRQQCeyXxhZnNhFWyO8532xiVBRC3d6+qfQ+rF55idj0T8WhIiStPG7PcE
	YNj4abfc4ufpoPYZ/RLu5ld/IDCL7bTvi2kNIqufAhcDnTdDpaMihWrXapD0fEjaFxR3PoZIzvv+I
	FqxoqKHg==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLW-000000087lD-0uUP
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:04:23 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ed941c63b3so135424925ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339612; x=1716944412; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PsA+RTqEPsjVoyQz5htVdcF3IiHZQEx5aOWSYNx99Ok=;
        b=Kqdof+1u2ko4JCs7HYnzbDSNRvAq3t1R27bdc1ZmgImFaUqCV7/NoeFlyDoJtS1tcS
         c38ksguPbbE29WAbbhMJyqWj5RHdzlyEuhiIGp1ZA2MPP/xz5XDzK6ZB3NKaG4cF/J5c
         8N9cg8qCLE+w4iHQe/YW33uJ62clAxnt9PnNXGYzh0G4HhCSG9W8SHHdqBK8wxwMuBtT
         vKDmoI63QQrJsGO5ffCIrbnu1NBYa7wtQX+26NWRAJCiBSdWX+RODnaZ/aM3SFuuj6o6
         Y7rIn5wK4XtCgmVX7h/7duGsU7/F2cn1qAILe2N3mC+zlnNXTX+ZnkHZQ1wBHn1EDpC7
         w1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339612; x=1716944412;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsA+RTqEPsjVoyQz5htVdcF3IiHZQEx5aOWSYNx99Ok=;
        b=M1zk3rFcAB0IQolzLg6iIz/zJXt6Pp6DlUkKE0P4PtqA7XOfJIA1O9YkPnxYbTJQxE
         diyLU5kVhfOnp1oRAydMIY/n3bjyL9Ozqsdwi4V6G2laM0Y/ScHornu3YKXnBCftDEwM
         1PJxCKSofHwMi8xaHXy5VUGp7+URR2N2hZRhkqPLE2wLfKKzHdCGmwVRWETQ68ny4Ava
         1f9GIlutGBENz+ufVDdeEOydaUQcwIFXO+TbWxFCiuLHefV2614Tqchm1UrH9w0sZIX9
         lZ8o6Yl+61h/N6klNmzZdbT0nD8DUMRwzJfIqy1YUcSUPVIxlsgqSvrELLxWxkWlWP1C
         6t/g==
X-Forwarded-Encrypted: i=1; AJvYcCUazanruauaO4N0o9dZWZbotBNAy3lAcU9JxynCaIah5fZ/ecx76K924KDBQglGt0WUYTV3R97N6YYtN4LC9JMJXfw6g4Z50WWOSHIp1/UG
X-Gm-Message-State: AOJu0YwY0MuZ4MbqTQ6xmH76KiMTiCSIDSnY6yRiqmybazyuNQ2yE06O
	+ToOQ3BMc1fdOzmPK8EMxGHxiFU4MkanqRCPS7H3bqCM/fTUbWG6k7istEc6xgqw2M/OE16A2VS
	KLQ==
X-Google-Smtp-Source: AGHT+IEcD4R5LAcOkQ6bfXkqs31q98gBsHVg7hM3ofLnT8WyE84ISOt6pDCwS+T69u05hB7J0k9BXfKJ8Es=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:c40e:b0:1e8:37ea:d17 with SMTP id
 d9443c01a7336-1f31c948c7emr89065ad.1.1716339612406; Tue, 21 May 2024 18:00:12
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:00 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-15-edliaw@google.com>
Subject: [PATCH v5 14/68] selftests/exec: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_020223_726354_22874CD2 
X-CRM114-Status: UNSURE (   8.60  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Acked-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/exec/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
index fb4472ddffd8..c5bdb653422b 100644
--- a/tools/testing/selftests/exec/Makefile
+++ b/tools/testing/selftests/exec/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS = -Wall
 CFLAGS += -Wno-nonnull
-CFLAGS += -D_GNU_SOURCE
 
 TEST_PROGS := binfmt_script.py
 TEST_GEN_PROGS := execveat load_address_4096 load_address_2097152 load_address_16777216 non-regular
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
