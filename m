Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EE1FD006E
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4q17GL0TYaCnY4xhDTE2WIjAqJv0WmsZ7zjVr626kU=; b=lCVHoBxwMumy3u
	WRYdvJIoIS0bM17fKmB5k7QNCtpgv6+KzTMqMNn2lAxZRhHFvI1QqC1bsZAxm6BnfM/mFEzI19I/c
	RMnwyix62bl7+GEMC2t+kS1cSlgjy9SBT8tFEQBnPUVGgjT5xVziWK18Ot+OPoyF4S5Ci7LTG7XYa
	CHhrXQYHPPFp75Ezu8lm+wQuuPfrkJrbR9T0SD7VnQ1WXZX5snCcps4hPw5FFOIGdjueNhcq9jPV2
	TD9iStVPRpnJKqlQvnylvpDYu8ct3lK40hD7dAb8mCGVXhLg7XRDNMjJpUHSd8k5L+jhOR/NHVW1x
	WlJyp9Z6h5Avc/rjCydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3KB-0000000D6YX-2k7A;
	Mon, 02 Mar 2026 13:28:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3KA-0000000D6W6-080K
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Mar 2026 13:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=7cjIEqDAe6MTPa2yql8v8L5e7mjA+roV54bcD0Te3Y4=; b=HFTnmAXHPyWiLL3r7ayuNb3glQ
	dp0+7C4IyN4B/jcppBH4TWhutwyTDfTFtjsqlBKEdM9tluFjEQKHNp0qPOkbaug1R0PI9v6sXXKUI
	eQh5j7FbuvyWUdhavVNqb5lMP9ThJt0ssH+9S1Nhdt7HdfIBeh99CZG9Mvm1Kkcmw430rGubsT9Tr
	l23sHTtSxX5JidZM1kSRS1l1YgOK8rhXEnTyocPsgGrKAJIGArTKGKphpFf4svs+zYxk8+V6NLRpM
	WC4YL9I7IY8eYCVGsE8gOCU1Tdtb7GYBV4YFcQf1Smnj6jWDX9Ot6xwVZQ0HEfrHwv135f/hFU5US
	b2pMhFGA==;
Received: from mailtransmit04.runbox.com ([2a0c:5a00:149::25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3K7-00000000A5l-0Uuu
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 13:28:36 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jw-003ZE4-Au; Mon, 02 Mar 2026 14:28:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:To:From;
	bh=7cjIEqDAe6MTPa2yql8v8L5e7mjA+roV54bcD0Te3Y4=; b=pfYMBjDrxtDGIuseYyHfRKhdlY
	wxGF1P6KMNx6ObRuGN6ZC4wsAsw2hRQ/moIf5DlPtJ4OdcFDVbbZfYlXOaHjFV7UCzwT+RFpEzmxH
	qWXXDA4ONYMAsNi6ePJIKCLTLb8MT74QJNuqJ6sdh6Tq/4chxS0eBiQlHuCMuynNI3HaM4H+mIWD+
	MfMF3aDGj96f3wG2XdkXTZREX71lpkYTiXzClo5Rgz07oqNqD1x1j5Sva9T4TMi13zMpJPrbafMuY
	y2tpwibHn24xe00sD61gejFnTEEHP9CDzwhRxR2Z0zEadqZouQs+4eZ2DS+v9eN8M5kbcQczC3zdl
	N7bMTDQg==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jv-0003tI-NG; Mon, 02 Mar 2026 14:28:23 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vx3Ji-008UTR-OY; Mon, 02 Mar 2026 14:28:10 +0100
From: david.laight.linux@gmail.com
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Andre Almeida <andrealmeid@igalia.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Darren Hart <dvhart@infradead.org>,
	David Laight <david.laight.linux@gmail.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Heiko Carstens <hca@linux.ibm.com>,
	Jan Kara <jack@suse.cz>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org,
	Kees Cook <kees@kernel.org>,
	akpm@linux-foundation.org
Subject: [PATCH v2 3/5] uaccess.h: Use with() and and_with() in __scoped_user_access()
Date: Mon,  2 Mar 2026 13:27:53 +0000
Message-Id: <20260302132755.1475451-4-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260302132755.1475451-1-david.laight.linux@gmail.com>
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_132835_244477_98D76906 
X-CRM114-Status: GOOD (  10.74  )
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

From: David Laight <david.laight.linux@gmail.com>

Wrappers for autoterminating nested for() loops have been added to
compiler.h, use them to hide the gory details.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/uaccess.h | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 809e4f7dfdbd..64bc2492eb99 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -736,13 +736,10 @@ static __always_inline void __scoped_user_rw_access_end(const void *p)
  *
  * Don't use directly. Use scoped_masked_user_$MODE_access() instead.
  */
-#define __scoped_user_access(mode, uptr, size, elbl)				\
-for (bool done = false; !done; done = true)					\
-	for (auto _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl);	\
-	     !done; done = true)						\
-		/* Force modified pointer usage within the scope */		\
-		for (const auto uptr  __cleanup(__scoped_user_##mode##_access_end) = \
-		     _tmpptr; !done; done = true)
+#define __scoped_user_access(mode, uptr, size, elbl)					\
+	with (auto _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl))	\
+		/* Force modified pointer usage within the scope */			\
+		and_with (const auto uptr __cleanup(__scoped_user_##mode##_access_end) = _tmpptr)
 
 /**
  * scoped_user_read_access_size - Start a scoped user read access with given size
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
