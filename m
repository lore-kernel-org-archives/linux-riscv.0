Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1BBFCC9AA
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 01:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3JZzGaiRtc0GOuzz6YWih6x0Nq2Af9wNLkL2lBZeYnU=; b=eyZBPvQw4Ty64O
	ialsVIYfwwJC7MYunBmupeyJTbIasBAi15TbPv8gPIwSg85VT8dIfmxviRtrhbKFLgOqVG2H3Yesq
	ozqMYN6WY3vqVsg88rWUdXUpUnEuJdFl8iuRoU3+qepw58ThOmPkiyNiey74QPJcYMYalnzafmusx
	gM9PDWOEDZLymEKB+k6TuYBGuj25SHxz+wldmlDBhKyJzfXnaWPEvi1XXhSrp72H454Mk7fIDkbNL
	3g4zQJcMIoGGZJEQ0Fhz5/H6c0QIIzx6HuW7Or1sSZbC937Lciy7eocF91ovWB5HEZJhlvmbZFm/F
	IcVbiTffO8OsSjhG7p7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmGm-00000008VYP-2KME;
	Tue, 10 Mar 2026 01:52:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmGi-00000008VWX-2Q6p
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 01:52:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DFC840A37;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 255A1C4CEF7;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773107539;
	bh=DzKG948gcs5x9YgNVim780sUPGDP+fTXP+UFVdlqzwQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VMr2FyoleiSoAgr5GCbS2DsKpQypuNkJ0odP4CTSsyb3MCdj7DilVVtf6GfHRhoqy
	 VWwpp5783Do6EiOrvyPiN7DWdgpHayKLWKfViIGhjLdIczyvlZMzdI6PsN7y0qVj0v
	 aUI/udlVUbTmryw4xk4FXEwQFQu+2mGo8nA0S3WDCxg24kWFjQZLk4NkdL/t4NN2Wi
	 ajPgnVetcFuN+G1pGHvkLEL2LnNsiW1TV4/dGY5m0k84yA+sDCHG24v7Ku1uDC+FRn
	 cdF/8PuQKSiVsLgaqgQmfRtLzVUvws/5szReZWRpC4TN3weCOpBRli428k0MPNwhR2
	 SI0uq+EuYMtvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17460FCC9A9;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] selftests: riscv: Fix compilation issues for
 v_ptrace and cfi
Date: Mon, 09 Mar 2026 18:52:09 -0700
Message-Id: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEl5r2kC/13MTQrCMBCG4auUWRuZJm0EV95DirTptB3oj2RCU
 Erubiy4cfkO8z07CHkmgWuxg6fIwtuaQ58KcFO7jqS4zw0atUWDlRr49RCah0ASRDkzYEuV7Yy
 7QN48PeWHw7s3uSeWsPn3wcfye/1J9Z8US4XKlp3VvTY1Yncbl5bns9sWaFJKH8LiauKqAAAA
X-Change-ID: 20260304-fix_selftests-c3f0ae46b3c7
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773107537; l=1204;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=DzKG948gcs5x9YgNVim780sUPGDP+fTXP+UFVdlqzwQ=;
 b=FLwvV3VuWbMYTOsNB8g4GlIeYcaaWljR8gG/AFM7wyZlqNAq5LMBFTbAVvehUzguocGXLf516
 udEBiYriGz1AGyHpt8l8MWcFqCDNTDkQZ98VWgwZXSgMPD6nLqi8ZgE
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_185220_657230_9A14A9D2 
X-CRM114-Status: UNSURE (   8.73  )
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There are a couple of compilation issues of the riscv selftests.
Coincidentally two of the issues are independent problems with not
including the header that includes the BIT() macro and the other issue
is from checkpatch incorrectly suggesting to remove non-redundant
braces.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
Changes in v2:
- Fix compilation issue reported by kernel test bot and Sergey
- Link to v1: https://lore.kernel.org/r/20260305-fix_selftests-v1-0-61b62d23500b@gmail.com

---
Charlie Jenkins (4):
      selftests: riscv: Add definition of BIT() macro
      selftests: riscv: Add braces around EXPECT_EQ()
      riscv: ptrace: Fix BIT() compilation issues
      selftests: riscv: Add license to cfi selftest

 arch/riscv/include/uapi/asm/ptrace.h                     |  1 +
 tools/testing/selftests/riscv/cfi/Makefile               |  2 ++
 tools/testing/selftests/riscv/vector/Makefile            |  7 +++++--
 tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 16 ++++++++++------
 4 files changed, 18 insertions(+), 8 deletions(-)
---
base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
change-id: ${change-id}

- Charlie



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
