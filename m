Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0CDC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 01:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s6DmU5iobjAXg4gZ3Zjc/5ug5ISBPw+EjTw0RPKWfgQ=; b=pruu4MaE+oTZBP
	lC578NUruIxDkrj6S1eVH7lx3KcMjYkmICPkWWkeDOuYyQBxcPYMvtHAqUiAKFnZGNyYM0z/Z9v+H
	m2YCEgyprBdm5+9rZJwECPHeGjxTux65gbpSZGn01oDcWm19REvpnvtFic1ZHZT9JDB2ZwXVY6f9u
	w8BkmNzYUVtwvEfcDRPExYLWZl79ZlOSnS3p2Z1/jZEmDp4/MjYny71JJ+LepytI/6Z0dN1iJip9/
	IJoPhPTQHyb5yebnbT+6x0fBJFP8gGlRpvcgUimym5bqMntBgaSLn3+n3gKwZVhY47gpMbEbJfPmU
	TRoJT3oci/4tuS2jfgnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEi2f-00AyNx-Kb; Tue, 01 Feb 2022 01:33:09 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEi2d-00AyNH-7B
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 01:33:08 +0000
Received: by mail-qt1-x82d.google.com with SMTP id z1so12033040qto.3
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 17:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MoWm32zvhEyqRVmUpa5LXZEYybwAAQFRmq/wU8a+Gt4=;
 b=EgGzc5rt8LRF5c2Eif2fVlYrh9HTecIoACGjTA6wXsMIE5Cq6qPShWc2VkeRIbLQLJ
 NzdWdQo2IAl4ibTNTDpXspNbyJX8M4MXNhOrJdH7s1L6p52qZ4QQmdA9tPnPO84GtTBx
 t7MPx8RQAxDA9goxsppgIVZ+UrbAWYJM/6BsuBOZkSZXcDSdMWpTIxG/j+/nhuMs3Lqj
 3/1dB0rzc7uOB2csLmqRxJfM1rzyDgXH68UG9wViOR32SdzStDiwpIWGxdl9ILrg8+5K
 qn0HtVvCShbOisPior89CQpUSaHiw49SefIEMrjQqmB2DRVai7BMhol9HGp4yJaVyAvZ
 B1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MoWm32zvhEyqRVmUpa5LXZEYybwAAQFRmq/wU8a+Gt4=;
 b=U0QTaJkBQL+jg91/kWmKFsvRNErZe7xxCKN1UGhip9Coc6b6MQRH00z/AYOR8GsrXR
 b2LwoXdVQbbKCxFOvJalKG3T6+lnmiiNST+2LaDt3HvXls8SXd+Wk3aYX26YJA2awPpc
 5Hx4u+lHZp6WnqdZ8CIpYAM68kKtx5oId/bvzwt5GFMtPrF2vyAHBoF+q+2zVKKr3bnv
 Q/BYQCk2q1EDkadD3c93JlA8h3tLY1WwsD0cLh6JXTW8+6u0QYO+/p3WUpUg0pUexbk8
 U3hkebuk/2XFR0cPfwAc0iPWjygPu19BAZ7gsB4Gk2tP4yDA8UMz4Rv3Hs8jH17Mh8kz
 pU3w==
X-Gm-Message-State: AOAM531x+p3oSLFdSYGpUBFYgvVlR0Ee6LQHdMapZY5683uW83VUdfj/
 GDxiSn/nkP/rPx/FdpyBfw0=
X-Google-Smtp-Source: ABdhPJx9XbvUrAI3Emn6dngj5AmQ9NNxFJ3HrnmEE5AIo9Ak4wHhNAJY3XZGyeDXTS4yuiTX27NoKw==
X-Received: by 2002:a05:622a:1881:: with SMTP id
 v1mr17345340qtc.683.1643679185259; 
 Mon, 31 Jan 2022 17:33:05 -0800 (PST)
Received: from WRT-WX9.. ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id v73sm9272458qkb.51.2022.01.31.17.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 17:33:04 -0800 (PST)
From: Changbin Du <changbin.du@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] kallsyms: ignore all local labels prefixed by '.L'
Date: Tue,  1 Feb 2022 09:32:57 +0800
Message-Id: <20220201013257.17926-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_173307_301668_F201BD7F 
X-CRM114-Status: GOOD (  11.26  )
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

The llvm compiler can generate lots of local labels ('.LBB', '.Ltmpxxx',
'.L__unnamed_xx', etc.). These symbols usually are useless for debugging.
And they might overlap with handwritten symbols.

Before this change, a dumpstack shows a local symbol for epc:
[    0.040341][    T0] Hardware name: riscv-virtio,qemu (DT)
[    0.040376][    T0] epc : .LBB6_14+0x22/0x6a
[    0.040452][    T0]  ra : restore_all+0x12/0x6e

The simple solution is that we can ignore all local labels prefixed by '.L'.
For handwritten symbols which need to be preserved should drop the '.L'
prefix.

After this change, the C defined symbol is shown so we can locate the
problematical code immediately:
[    0.035795][    T0] Hardware name: riscv-virtio,qemu (DT)
[    0.036332][    T0] epc : trace_hardirqs_on+0x54/0x13c
[    0.036567][    T0]  ra : restore_all+0x12/0x6e

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 scripts/kallsyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 54ad86d13784..8caabddf817c 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -108,7 +108,7 @@ static bool is_ignored_symbol(const char *name, char type)
 	/* Symbol names that begin with the following are ignored.*/
 	static const char * const ignored_prefixes[] = {
 		"$",			/* local symbols for ARM, MIPS, etc. */
-		".LASANPC",		/* s390 kasan local symbols */
+		".L",			/* local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
 		"__crc_",		/* modversions */
 		"__efistub_",		/* arm64 EFI stub namespace */
 		"__kvm_nvhe_",		/* arm64 non-VHE KVM namespace */
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
