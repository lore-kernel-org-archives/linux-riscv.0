Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB61AC7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGKb9OjwA2v4Ck8Lpcbc1VIghw9rsrrkkH60dqMQugA=; b=r7pqCsZHTXrI/2
	x1qWwqCGuHMLO8ug2ajDZUYGURdXJTCeUJU2w058gp7ex3Mp7R7rYHSpGbBaDf8AsfTDaZENKSRc3
	Lat2bvs4wxamtK3qqkOvSBMGT0+IliROpM4MjYM/btHpuQRKEtp7AJI5SzJ91D3kc8xotGsgrzJl0
	tu3u8vpYsKGhsFvId8l+royXcf3dNOZc/a9cT43UAStuzl3/shm5pyBySqc2temMPVwj7DmxPPiCQ
	/FovowqEyhrukW/mnKTR4iQDY7cYmYWjdv9j/hVUGXodSTCdBJqsrbwZJ2mUvRP3cRPOaClrHULvV
	BQtSabXVjnc1Gfi6NZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWqu-00000004WtY-2HiG;
	Tue, 01 Jul 2025 09:00:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWnt-00000004Vz8-0NQ9
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Li/0oRMlSoEkPsu4Z/kOiDh+YQJRUP8G4T3fRZTdNro=; b=PSBYT6EV9Yv1xGLv6SEXVUkkPx
	b6ji9j4g5IGtJD5PnzJK3S+NrL7uLXBcTZy8CqevZ+pUl9xYfgNnGGFIT9swSHUsuZcv7FBp4OL6f
	b1yrYkND0ugZruZLjlYJVQWf1cAwtZX/WdJTOU8e51YpvnEbkEAnxgQ+3ZirFrERI/hEf38QTrVFh
	1lHsA7VNj/7gJbXs1K3PaerbNTDbRbRKfRrv5UP4v9C8SLuvyVNJ8TyxVlXfBLYdF9RCvfqlBYq0q
	bWawC7P6h9TUTWL44VOmzJ9kHIQ6Sot6JvvGeuiDyffOQtb3SCQnTUMqOxG6/YTtbjFVw3bH1H9eI
	B6PdEv9g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWnp-000000070ds-3vbR
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48F20464C6;
	Tue,  1 Jul 2025 08:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E99F9C4CEF3;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751360238;
	bh=ePs3rKA84il3gm9cXFfVHZ3ucJrNb+nPVHECDo+XbZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cNDFq16FletVTE+NfGeEhHIPc0QdYj0aOPGiETDNaNK3HOJpLXhe1IbKwg7zAtojZ
	 bEbfePcBN0H4PCuSTT5PNspKsbjMs/IUzEpt3ULUMLrS38S/0o90LyW3BhBumkd3j/
	 tasLlAynfjPQvjxQt67kIzLKz66eqJGJWOsaHRnINVZHle6w1JRESDgxDYvPVQUbvw
	 xm2lcv1B/K3ZHxx5B2jzh/U/nxw6YcVx2ZQ7q9TeeGZ4kx48zcb3zMhtJv9C1dcHLt
	 nxAmB13ArM44FGDNKUMvvjGJ5TUxTSQiYCWgMG9QcyPx4ooVkLLf6qvIVsNc8ywLC+
	 ZulIlbCC2n/zg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0662C8303F;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
From: Joel Granados <joel.granados@kernel.org>
Date: Tue, 01 Jul 2025 10:56:45 +0200
Subject: [PATCH 4/6] docs: Remove colon from ctltable title in vm.rst
MIME-Version: 1.0
Message-Id: <20250701-jag-sysctldoc-v1-4-936912553f58@kernel.org>
References: <20250701-jag-sysctldoc-v1-0-936912553f58@kernel.org>
In-Reply-To: <20250701-jag-sysctldoc-v1-0-936912553f58@kernel.org>
To: Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Joel Granados <joel.granados@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=joel.granados@kernel.org; h=from:subject:message-id;
 bh=ePs3rKA84il3gm9cXFfVHZ3ucJrNb+nPVHECDo+XbZs=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGhjouoNu2I0ilCYWLHWWuG47LqYHwLaTWL3g
 OQqm4JJtVO3YokBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJoY6LqAAoJELqXzVK3
 lkFP7iMMAI3NMJR99dSUgXyOUtmWmrLaFiCA2eWJ02jhi9jyeDG8vcCXeXnRXVtb0tGHTMA6/01
 VoDeAh8fLOsUthbt3PfU7ZBmMfqEDJrF42hyug+KWNqNngAK9YKNsuQOVBluWaHhPzEdpH7DwMG
 B/qNvNttRWVTPsoVFh+tsNguiXU3J6zatmyEoi7zP5ycDkLu8nkL9AvzEaVilfn7R3R3kmGMTym
 IIv1bTqrHXE2mEomvaQ08a5PKPwQBva+ruTEnHxCxfu9TWRHqtwOkkqlsTMbFKykrny9P73idu5
 5o+VXozhMUzwUBfS9I52vZ5gVhI3ezempQe1X2em4K15yWlNdu0EcJhll7EL9XxbtdrUfvVDKq6
 6IJmwZFFGh5dE33oUaWUfw0/fdc5bjwIqKxreW4K+wPp71JHymE3zQ+9qxqA536z7fBJxOXQa7A
 6NI/7JELVvyktBH3O8bWA55sb1fL+wIsAb6cJYUZcMl8VvFCPUuRHPooslppSBftwnb57C6rLu+
 DU=
X-Developer-Key: i=joel.granados@kernel.org; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for joel.granados@kernel.org/default with
 auth_id=239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095722_436425_3ABD6FAA 
X-CRM114-Status: GOOD (  10.24  )
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

Removing them solves an issue where they were incorrectly considered as
not implemented by the check-sysctl-docs script

Signed-off-by: Joel Granados <joel.granados@kernel.org>
---
 Documentation/admin-guide/sysctl/vm.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 9bef46151d53cd3130a4a14c8a66bfdc3a5561b4..4d71211fdad8d061ccdef57477ce3dca5c78741d 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -465,8 +465,8 @@ The minimum value is 1 (1/1 -> 100%). The value less than 1 completely
 disables protection of the pages.
 
 
-max_map_count:
-==============
+max_map_count
+=============
 
 This file contains the maximum number of memory map areas a process
 may have. Memory map areas are used as a side-effect of calling
@@ -495,8 +495,8 @@ memory allocations.
 The default value depends on CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT.
 
 
-memory_failure_early_kill:
-==========================
+memory_failure_early_kill
+=========================
 
 Control how to kill processes when uncorrected memory error (typically
 a 2bit error in a memory module) is detected in the background by hardware

-- 
2.47.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
