Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF07C8303A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4s2l81o6+Xfnj8En4qfJY1tJ99tvXoJKXJ17ViQFGjg=; b=zOwYSugR5Kq2Rk
	Jv7F3i0L+C2bH7FN/RfkGhMx3vWs7j9H6YCKs4KbpaIlXHh4/pOpB80a6bdqVVR0KUiiRljTx0ChG
	Ma9sWNcy37WoLP9KAHap7PtMCxBAa3iiZ9Kpmcaa1n/JEsk31MDP7XUP+Nis+vxu5ZU9/HIZN+zzo
	rsjDTGFRyGkkL8QwTlxO3VRdsysXmxDrR+xjZCnKYFBHoZHSRDaPib1cF1YOAQsdvEXNIbXbPrMfe
	oGF1TqV6p4N1sh2K7gHKfJqvg9CGiHmJkYHq9fuRy2RpQ0ZfAMcpVolFZ0umoZs3J5Nttbh0RMyAS
	MYRuVTygkoS5jTAq0IsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWqt-00000004WsB-0C46;
	Tue, 01 Jul 2025 09:00:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWnn-00000004Vwy-24qp
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 606C961448;
	Tue,  1 Jul 2025 08:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1194EC4CEFD;
	Tue,  1 Jul 2025 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751360238;
	bh=vmReX47mqCLgmmgZzbo16/Xw5onF/bS5D530hw5Anx8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TOPCN3lEFa9Pb04mHDONYZhWUehnQy/XLyKk96s791L+h1USqQRyA4hc3cG4FFZLw
	 sf3uPeYnAvcMKvOb216bOzvNrcvmLCMrH2lyEaEo6Iy5TTOGiuPEAn/MwnxflhreUc
	 gsr5GkJs9DkNf+FEFvJH7guc9x32yUpBk8hbuhpYbxGPI0JgQeItVYy87Hj8hlkUiq
	 o1Y2UhDJh2V5cA8O+mOsyUUDIoP2d3w6hWKn70KbmIAK9ol9eY6rw773VduO6dpJCN
	 4xCAjqx3GmCJmTDmMBFgf0xe4HTOoHJvZsfo51WdGgZz/AaHPkOx3o6oxBNH7xzjuV
	 Egk5Rs5DlIP6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0951BC8302F;
	Tue,  1 Jul 2025 08:57:18 +0000 (UTC)
From: Joel Granados <joel.granados@kernel.org>
Date: Tue, 01 Jul 2025 10:56:47 +0200
Subject: [PATCH 6/6] docs: Downgrade arm64 & riscv from titles to comment
MIME-Version: 1.0
Message-Id: <20250701-jag-sysctldoc-v1-6-936912553f58@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491;
 i=joel.granados@kernel.org; h=from:subject:message-id;
 bh=vmReX47mqCLgmmgZzbo16/Xw5onF/bS5D530hw5Anx8=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGhjoutgafknIe4uDW/tuqngY3301IDb7siVv
 D+Ppdv3MEHYgIkBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJoY6LrAAoJELqXzVK3
 lkFPIqYMAIw2aha8NP8P8uQJTcXrqi1uSeSVBitGs7JzTKKQH03EcYNNRzfXlq0GvfmC694C68K
 589+Rg8OmUJyr8RY9P8gRir1sNTcfD377eXgw2JBiBuNYo3sjcy9AH74ytTRTmuKtgkfOgqLbQB
 L1t0O/8qy5g0lVo3UboWOEmAj28SisTNub/9IDCBLn/3YxVfeqlId3k6HJgp3E4Shr1Va8fwDHD
 DUGoZ45iqIKT4ZNSDZcTuZpo+kLYFF+Q1zDWD+vXV8BeBRbOblYB9Fq5dKKWWq4elk5K/LhMdyB
 ZwDosse7CN63dW+gi8zKu8wD1CcLQ7gBvQqcouX51yE/HMRlqiyIY8vvPhlOdzILOg7yZxdl5fh
 K5Swo/tIBbzJh5pPNb5A9s0wLS06nyLLFa7rKscBeWVqhHqUF0lU+Qbtd/wgiEowZt3jRumBlya
 qrzjEEq6B/3sp3UaVJUsfXH1j+4LAyb5+TgCSP4stcZ/rTULBR8x2KOtuq09XuOXDpQRa13oMI7
 lk=
X-Developer-Key: i=joel.granados@kernel.org; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for joel.granados@kernel.org/default with
 auth_id=239
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

Remove the title string ("====") from under arm64 & riscv and move them
to a commment under the perf_user_access sysctl. They are explanations,
*not* sysctls themselves

This effectively removes these two strings from appearing as not
implemented when the check-sysctl-docs script is run

Signed-off-by: Joel Granados <joel.granados@kernel.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 32 +++++++++++++----------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index dd49a89a62d3542fa1a599f318dff26589e1d57b..c2683ce17b25821559d0c04914aea360440c7309 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1014,30 +1014,26 @@ perf_user_access (arm64 and riscv only)
 
 Controls user space access for reading perf event counters.
 
-arm64
-=====
+* for arm64
+  The default value is 0 (access disabled).
 
-The default value is 0 (access disabled).
+  When set to 1, user space can read performance monitor counter registers
+  directly.
 
-When set to 1, user space can read performance monitor counter registers
-directly.
+  See Documentation/arch/arm64/perf.rst for more information.
 
-See Documentation/arch/arm64/perf.rst for more information.
+* for riscv
+  When set to 0, user space access is disabled.
 
-riscv
-=====
+  The default value is 1, user space can read performance monitor counter
+  registers through perf, any direct access without perf intervention will trigger
+  an illegal instruction.
 
-When set to 0, user space access is disabled.
+  When set to 2, which enables legacy mode (user space has direct access to cycle
+  and insret CSRs only). Note that this legacy value is deprecated and will be
+  removed once all user space applications are fixed.
 
-The default value is 1, user space can read performance monitor counter
-registers through perf, any direct access without perf intervention will trigger
-an illegal instruction.
-
-When set to 2, which enables legacy mode (user space has direct access to cycle
-and insret CSRs only). Note that this legacy value is deprecated and will be
-removed once all user space applications are fixed.
-
-Note that the time CSR is always directly accessible to all modes.
+  Note that the time CSR is always directly accessible to all modes.
 
 pid_max
 =======

-- 
2.47.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
