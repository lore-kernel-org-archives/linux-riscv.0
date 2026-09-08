Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80ABC79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BzX/46zsdA4NIJXakN1oEvmV4MKq9hahAogQNOhcSYo=; b=DrQckhlceFeSjn
	6eGyGYDywclVHfu1VzAuyOg/h5BJJIlC358r2kFmyystOQ1ghwpxtQ0U1MkkuYWxv8oIRcu0hU8r4
	wkW+mCZa24iS4X9n5niIpex8q+P8FiEkYc0URelZ2hPyuxCgYmJgUd/boQN/xUUuVsEDKb5N6/qB6
	fICY/Ruik6CZOdmMxtYp7Rc8/MhYiaIQT4qVbIwnmMpYDKwHLjfTT0YPAdQ8HuEoeaJEpYU+G+pd2
	xN7q9FfZP67UE4/8x3RoNRzD2rGPIyWhvx/Eq/7ieP4XWmaOXEJPGhofPN1xP1o1n61ryZhJuArLG
	K8y/j/djKsVyq/FDXr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vUQ-000000095TV-21Vf;
	Tue, 08 Sep 2026 13:03:54 +0000
Received: from out-39.mta1.migadu.com ([2001:41d0:203:375::27] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vUN-000000095T1-169B
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 13:03:52 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=G1xbX1aVzAnasMGtM4jScBWUpUusRlFiE4T+B4ny3Js=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788872628; v=1; x=1789477428;
 b=E1VeKMGBpbmRdSWD7u7ISe2YXwNqF9AF0mwxVfUZX+rORCoATMisoDGDm9GjyUFUFPwCpfFX
 Vhhind3tm87s2r/svzS72lUTEIjM6h5MDije3JXFgmE9hx15VlmO1Eaxx3Qof5JJnDZv+kYEDLv
 febcY56uqEdm/8Y7j8Me9MOk=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id c969d80fa3af1ccf;
	Tue, 08 Sep 2026 13:03:48 +0000
X-Mizu-Trace-ID: c969d80fa3af1ccf
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 08 Sep 2026 21:03:37 +0800
Subject: [PATCH] riscv: vector: Fix data pointer constraints in context
 save/restore
MIME-Version: 1.0
Message-Id: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQAwAvyI5N7Duyrb2K6UHXaNNQS1JuxTEv
 xv1OAMzCygJk8K9WEAos/I8GZSXAtKrmQZC7ozBOx9d7W4orCljpvSdBRsdsec/+it1IUYf6lC
 BpR8h08f28TxZf+3bov0F67oBwDpXr3gAAAA=
X-Change-ID: 20260908-riscv-vector-asm-fix-27ed36623934
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Andy Chiu <andybnac@gmail.com>, Vincent Chen <vincent.chen@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1551;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=G1xbX1aVzAnasMGtM4jScBWUpUusRlFiE4T+B4ny3Js=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkL2Ne5fpC/OH3WxGUtT0vW20+ddT91/dXE5Ef5Anb5y
 odmWTM86ShlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZjIvx6G/5l9Hh9nPS1Zyrf0
 0A2G9zzBr5+Lrw9WfCNwtWRtsswG2UhGhq6pc+vfBcmEsLhv3344tdliZZByU+/kzzvn/SkXWW7
 4mgMA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_060351_469033_B71D511A 
X-CRM114-Status: UNSURE (   8.48  )
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

The standard vector save/restore asm advances datap but declares it as
input-only. An inlined caller reusing the original pointer may therefore
use the advanced address instead.

Declare datap as read-write so the compiler can preserve the original
pointer when needed.

Fixes: 03c3fcd9941a ("riscv: Introduce struct/helpers to save/restore per-task Vector state")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/include/asm/vector.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fffe72a772080..c7fd6d50a7a47 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -230,7 +230,7 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 			"add		%1, %1, %0\n\t"
 			"vse8.v		v24, (%1)\n\t"
 			".option pop\n\t"
-			: "=&r" (vl) : "r" (datap) : "memory");
+			: "=&r" (vl), "+r" (datap) : : "memory");
 	}
 	riscv_v_disable();
 }
@@ -266,7 +266,7 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 			"add		%1, %1, %0\n\t"
 			"vle8.v		v24, (%1)\n\t"
 			".option pop\n\t"
-			: "=&r" (vl) : "r" (datap) : "memory");
+			: "=&r" (vl), "+r" (datap) : : "memory");
 	}
 	__vstate_csr_restore(restore_from);
 	riscv_v_disable();

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260908-riscv-vector-asm-fix-27ed36623934

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
