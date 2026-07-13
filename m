Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96300C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS/FFVhOwBex1Bj7exQTwNfnpYut/wJQ+2GiZIRlgh8=; b=zm3NeMXM3KZxdMziYYCdrO3eo+
	tz+lRCT62T5ArAUh+CxEcUtnh5tJ5i5ryfjlOZLf/4hdWABQtTAwahrhkYVv25jfeQKFnig2zX/yW
	FpQTeS+1vv9WRblECWa3RQlQbdJ0L8qY5sozvreSg7189UgJgXFE1wFpVmJtBtk0qWVZcNd3XfVxi
	tOcMfPPt+PMRyW2uMeRMVS88qEaRuA+k165UXnp6hju/4hlXLyBg7rKBcTlokjDGdm/Wx7ZX2B3a1
	61AZ9xToof/w/L7xexnc/etKkOmh++sABAgPCbr8KmifQ8tqvyA3RGhWalBBa2W2kThycxDdUzL/N
	YjEeixmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJJm-00000009vOL-14e1;
	Mon, 13 Jul 2026 16:15:42 +0000
Received: from bird.elm.relay.mailchannels.net ([23.83.212.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJJj-00000009vN2-0x25
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 16:15:40 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BD313721C4F;
	Mon, 13 Jul 2026 16:15:33 +0000 (UTC)
Received: from pdx1-sub0-mail-a235.dreamhost.com (100-104-248-19.trex-nlb.outbound.svc.cluster.local [100.104.248.19])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 47CE972205B;
	Mon, 13 Jul 2026 16:15:33 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Occur-Continue: 756d446a7bc50553_1783959333583_3417897836
X-MC-Loop-Signature: 1783959333583:3589547963
X-MC-Ingress-Time: 1783959333583
Received: from pdx1-sub0-mail-a235.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.104.248.19 (trex/8.0.2);
	Mon, 13 Jul 2026 16:15:33 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a235.dreamhost.com (Postfix) with ESMTPSA id 4gzSGD3z4Qzymc;
	Mon, 13 Jul 2026 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1783959333;
	bh=cZeBYkFPGiKp7Lt+LG4J63ku/ahjD8wRrqJGd55IGyI=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=VFFikpAi89Zz6/ctqOaoPCSpZEu93yfYWBamBVKCnQ8g5Oubb+2hWDYjG0br07CeR
	 a/lyQHfmhgobvWVEBVU9Px7v8oXgUkZseUGQNkkVuDXZ+JiLbGIUmJ8MR0SgeGah+p
	 UAkbSTJb1KglH2QHWC2fFmBBMmE8hxlxsuDVeJgkeB7FI9+WmcqmpCwZ073wfBd++t
	 QA0gqHKhj8aA13bLmjbBI+8Kpugv+HI5tMcJ1+jlucjMTYPn9M11iALMzj/Dn29x3D
	 4fkpIxnkXRboMgBFo/6aIFq5KriyDUY8N2yEQdXGB+f6K9n67201I6Yp+0cibNKz5K
	 xw9VSeBSHjwcw==
Date: Mon, 13 Jul 2026 09:15:29 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org, palmer@dabbelt.com
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com,
	peterz@infradead.org, dvhart@infradead.org, andrealmeid@igalia.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv/futex: Bound number of LL/SC retries in cmpxchg
Message-ID: <20260713161529.arwwntkwpg75opzk@offworld>
References: <20260505125204.999119-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260505125204.999119-1-dave@stgolabs.net>
User-Agent: NeoMutt/20220429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_091539_571559_69EAC82E 
X-CRM114-Status: GOOD (  10.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ping?

On Tue, 05 May 2026, Davidlohr Bueso wrote:

>futex_atomic_cmpxchg_inatomic() does an unbounded LR/SC retry loop while
>(minimally) holding the hb lock + pf disabled. This can lead to pathological
>cases from unpriviledged userspace pi operations.
>
>Bound the retry loop to (arbitrarily) 128 iterations and bail: drop locks,
>rechedule and retry the operation, similar to the arm64 variant, as of
>03110a5cb216 ("arm64: futex: Bound number of LDXR/STXR loops in FUTEX_WAKE_OP").
>
>Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
>---
>v2: patch now applies (and removed a whitespace change).
>Compile tested only.
>
> arch/riscv/include/asm/futex.h | 14 +++++++++++---
> 1 file changed, 11 insertions(+), 3 deletions(-)
>
>diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
>index 90c86b115e00..be69d4211248 100644
>--- a/arch/riscv/include/asm/futex.h
>+++ b/arch/riscv/include/asm/futex.h
>@@ -13,6 +13,8 @@
> #include <asm/asm.h>
> #include <asm/asm-extable.h>
>
>+#define FUTEX_MAX_LOOPS 128
>+
> /* We don't even really need the extable code, but for now keep it simple */
> #ifndef CONFIG_MMU
> #define __enable_user_access()		do { } while (0)
>@@ -79,6 +81,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>	int ret = 0;
>	u32 val;
>	uintptr_t tmp;
>+	unsigned int loops = FUTEX_MAX_LOOPS;
>
>	if (!access_ok(uaddr, sizeof(u32)))
>		return -EFAULT;
>@@ -88,12 +91,17 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>	"1:	lr.w %[v],%[u]				\n"
>	"	bne %[v],%z[ov],3f			\n"
>	"2:	sc.w.aqrl %[t],%z[nv],%[u]		\n"
>-	"	bnez %[t],1b				\n"
>+	"	beqz %[t],3f				\n"
>+	"	addi %[lp],%[lp],-1			\n"
>+	"	bnez %[lp],1b				\n"
>+	"	li %[r],%[eagain]			\n"
>	"3:						\n"
>		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r])	\
>		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r])	\
>-	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
>-	: [ov] "Jr" ((long)(int)oldval), [nv] "Jr" (newval)
>+	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr),
>+	  [t] "=&r" (tmp), [lp] "+r" (loops)
>+	: [ov] "Jr" ((long)(int)oldval), [nv] "Jr" (newval),
>+	  [eagain] "i" (-EAGAIN)
>	: "memory");
>	__disable_user_access();
>
>--
>2.39.5
>
>
>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
