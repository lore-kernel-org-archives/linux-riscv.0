Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874D7C8303A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V9ZueB6Ydvtz1bx9uGLM8E7/M3DbbTrUteOVBBcjl0A=; b=PN0PqBoC16MV6m
	BdUwmJ0ogEQYb2yuzlWfRnz1e2gp9Bk1rQ/NUwNLefxYkWrVanFdjwbA2j8LblxRZzkn8LTX+Yg2B
	yl/+pwZkmJya4R1mv81NpGwAfylri5fhUqZWYUndHZTa+epUwRlNnxcEnLdbt9bzLMK6Npzu8p7RE
	uX+sLfyhrGxXlxvaS2Vb4hpRsaWbU4Y7i830XkWBtdROZlqM6tI9htyJ7ZDltAE+cQNQK9JVYJiko
	3nSGk8mYxgTKAXIyapx9RSqLX/bU9XAvo9UYOVsTkZAEI+aoUPihsYF7qAXhQsnkYPvvRC2ILnnHy
	iR5N6PUP43pzUPzA8Iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWqw-00000004WvM-1pEx;
	Tue, 01 Jul 2025 09:00:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWnu-00000004VzV-1fuW
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=qJC4fJm2YhnjpF2wX77l9euWqeB/b0iLJ4T9FOe1boc=; b=nJhFtTghrxhQoSDi//F/VZeNYE
	CEalOUwVPVgyUkFhzXEoBzUVqthmgySRWJerkIBcmwstfqu51Nzly90OABdWDs+jCFNwyz4FVecSl
	c702U+A9YgrVeLTJ7wcqI2Za2pubvz9sX6dJ5GXl6fY+V3V01AEwpgD0azMG7RzFS6hHFeHW58evf
	kmv86ZE4fVEnS65s3urWoWxR9UYjWUSN5baNgf3+U9nF6RZm4wRJw4jLa+7MYZgXq4WCcxYZL/Uon
	S14IvpWClLl+VGio4TtojynjwWUtvOUWyS3a3lS6q23yU441pPhNVh4DP79KaVvXv9SrQOaxIQDkg
	j0Ru3abA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWnp-000000070dr-3xkk
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7AB6461A6;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B89D5C4CEEB;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751360237;
	bh=dP90U+P+CIJkX3PevzW9Eoc1cobYxd/SZNH6G2NvVvo=;
	h=From:Subject:Date:To:Cc:From;
	b=bGqLX9VYHiEQceo1jpTP0qNo7U221u/c6/SKV0j6ao5/kU5a/oiF+gN23CVN6WVq2
	 IHjLEU0e6qNvDGbsUJ0LtgflknNjSajIns+plR9/JOWCrTu6v/3TzEj2vyYzZbLUvo
	 //AKeBhd1Q/pEC/8sFpCmS816VSX+Mxf7WNw3CHjWCAGIUKDn7O+wipudGAX8gUayI
	 OukNQogwkg8iWUSWPXbndrdiL2qnYG/Rg/EWJKBZsDZhZdYKZMaYps9Xzvqz7RY+sR
	 PBMM3heuWCDnllKvWbEGkdrvW5B5ssHx1zHBIAxd7GZ92+h3D5cICG0g8kwGzdHtXm
	 Y7x7hldO7Tckg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A674CC83038;
	Tue,  1 Jul 2025 08:57:17 +0000 (UTC)
From: Joel Granados <joel.granados@kernel.org>
Subject: [PATCH 0/6] docs: Remove false positives from check-sysctl-docs
Date: Tue, 01 Jul 2025 10:56:41 +0200
Message-Id: <20250701-jag-sysctldoc-v1-0-936912553f58@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMmiY2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwND3azEdN3iyuLkkpyU/GRdYyMLw+RUc4NUI4skJaCegqLUtMwKsHn
 RsbW1ABH4LJxfAAAA
X-Change-ID: 20250701-jag-sysctldoc-3281ce70e28b
To: Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Joel Granados <joel.granados@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=joel.granados@kernel.org; h=from:subject:message-id;
 bh=dP90U+P+CIJkX3PevzW9Eoc1cobYxd/SZNH6G2NvVvo=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGhjot2AfezT7qOGdr19ioQfavdV9DUKox1i/
 DrrVSqP5eV72YkBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJoY6LdAAoJELqXzVK3
 lkFP7WIL/2XyjWIY8MH+O6PwTq1+qzC/LvN6NJLzZEpEAkcsfEkSuJEeRjN7SgwiHNPvmYhiUKt
 n6IGsJDdCa6bXWpNAIpADHqebELpG/nst/oScGmdBE/6wiVc3DEDdAYgkvzusitb8OPA7WVRL6i
 JQ5fYy+QD9Tnvgzdhgc6JO401DOJan7piJVygliiqxUZLgtvtQtxpUQXxi098HxW1F7pRWxzOL9
 PPzNJfPBF5lyn6+dnp5jtZPSTUfCbo8rnurr0yY8bRGaJMZ6Qbl385ThjpgfhL+ADpr9ahQXRHh
 ot8CQ0u0Tw0eC+T7XpltJ468fh2+Gl2NKVr0iBhIxbIeslSYPVsjI6HKWIYrfWMnN1lgwTT9WPC
 MbHrjgSVjEpcMquHSN17VQHuiVufWJ2ofuAR37q83LTsJ3oFfl8VYycqNijRwoMb5/rrNyyZiLZ
 ctjNJcj/ssk3hnu2IISO3wadRSJ9EqQ6b0cAMNoIYm9uk9X3ag8f0IzApiyCpFrlc52ECB0gFI6
 Pk=
X-Developer-Key: i=joel.granados@kernel.org; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for joel.granados@kernel.org/default with
 auth_id=239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095722_468986_AB52B79F 
X-CRM114-Status: UNSURE (   6.25  )
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

Removed false positives from check-sysctl-docs where there where
ctl_tables that were implemented and had documentation but were being
marked as undocumented or unimplemented.

Besides adjusting the patterns in the check-sysctl-docs script, I also
corrected formatting in the kernel.rst and vm.rst doc files (no wording
changes!)

Please get back to me if you have any comment or suggestions
best

Signed-off-by: Joel Granados <joel.granados@kernel.org>
---
Joel Granados (6):
      docs: nixify check-sysctl-docs
      docs: Use skiplist when checking sysctl admin-guide
      docs: Add awk section for ucount sysctl entries
      docs: Remove colon from ctltable title in vm.rst
      docs: Replace spaces with tabs in check-sysctl-docs
      docs: Downgrade arm64 & riscv from titles to comment

 Documentation/admin-guide/sysctl/kernel.rst |  32 +++--
 Documentation/admin-guide/sysctl/vm.rst     |   8 +-
 scripts/check-sysctl-docs                   | 184 +++++++++++++++-------------
 3 files changed, 120 insertions(+), 104 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250701-jag-sysctldoc-3281ce70e28b

Best regards,
-- 
Joel Granados <joel.granados@kernel.org>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
