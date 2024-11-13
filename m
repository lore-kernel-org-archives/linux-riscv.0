Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DDBD637A4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 18:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EEsCeq5NHe/MZk2QxblmWj6vVa6uZduAZW2d27mZ+O4=; b=abN1F0VfP0JFl2
	5OuXmBeWM2vw+L9U53kfHLNS+EA4xSbIOXBHZIr8CuJgFGbWfrT09jKDdjcXoZtkyNsOyHVSMBu5+
	5AaFG6Vxels/lkvAbH7fthWtHzSVzvBaaWVbTDoFrPUw5tA9Pl7DyOEjZmlqkjJnU4YCxLoPQYEhL
	1Vtpcb7ThbDE4u9gpmJoGcT6LQ7De8ZIO1pwg8vFnlEKWVYvVx3AfCQHS+E6orJqjioNRPlhgvGEG
	FkKP4Ak+ju0QqMEGE7uCaYAXevhkawzUh7nNtgcivju1Iao/Ml3Nbzr+5EBMkdw9Rft3niIWwipkT
	hJHrgK5KgV3/psCwjv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIBQ-00000007iyg-3Tf4;
	Wed, 13 Nov 2024 18:33:40 +0000
Received: from bisque.elm.relay.mailchannels.net ([23.83.212.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIBN-00000007ix8-1NpC
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 18:33:38 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5D770321B99;
	Wed, 13 Nov 2024 18:33:33 +0000 (UTC)
Received: from pdx1-sub0-mail-a256.dreamhost.com (trex-5.trex.outbound.svc.cluster.local [100.112.46.30])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id E34EB321F4D;
	Wed, 13 Nov 2024 18:33:32 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1731522813; a=rsa-sha256;
	cv=none;
	b=oOqvGhiDZ5GplF33ZI2XXkhWZ7CqAxXTPXNWtbaw5tQfD6ED9Ahy9khTbPR06YGPwGWDhq
	kzVoB0ekmBg8c0Ar2gyaubSLXlBYQPz3ssJEU8WgYBwSE/QxWDn9+eBpLkqL5dbWOJgHyl
	WDJJqi0aVn46q7gzWXSnf8IBKaO8/7lZjsR4CLhPBBDFUxDPv01KNkXP2KF6la6CDEo/A5
	hylK30p/SQZU1faiZo5W8KoK6Hei2+c8YatsWo9MIf8fG5SKRq/GZL6Lo7ePBkq7t41dfu
	HR8SEtEIfRLscCxlmdD5dyBuaWvMJgiNbASM78AEY3pCTNV13AZds1RLv0SokA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1731522813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=VulcaJeiOjCEiNlRQp/6xHIi1YJHEp/kfmwWLJnTfrA=;
	b=uh7jbHVJyskj3Ad9eA/e7bch1ngKBnud0MPksnrV4wVl5InUz+dt8VdVBieoAz/nIWvBaY
	G5KCYHjLHMFrW6bkQz6iODMsb6YTr8x2NBoOIpLmRi2tIUPDkJER8RuWjcKciyNzCO5xIP
	Frxo26aVqyaDDBZiirxOwJeoQGYkLDvB3Cd0Qo2P3wmSWQYdqjzm5l5GMPSnv4rMopQ0/S
	bG7JHVaSXMVo4T8VQjKALPqXlVMO8adnpFAKX9AjtYHCf11V0vaooV16OqvusN01NkiubH
	mx4YUHK0b7enSOkg9cnTAXnyfMmr3Hi+2u6raSBgrrJTD/93UbxeAqyifnn5Mw==
ARC-Authentication-Results: i=1;
	rspamd-7456989c76-6nw2m;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Plucky-Abortive: 18e1b6b15394b47b_1731522813235_2807936657
X-MC-Loop-Signature: 1731522813235:656539216
X-MC-Ingress-Time: 1731522813235
Received: from pdx1-sub0-mail-a256.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.112.46.30 (trex/7.0.2);
	Wed, 13 Nov 2024 18:33:33 +0000
Received: from localhost.localdomain (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a256.dreamhost.com (Postfix) with ESMTPSA id 4XpX3b72Hcz2L;
	Wed, 13 Nov 2024 10:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1731522812;
	bh=VulcaJeiOjCEiNlRQp/6xHIi1YJHEp/kfmwWLJnTfrA=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=hSMTZP9EfFQPjhdjRj6vLQUeGBnkhgxb/U5yiuwU8vuxJUZFq8J3HYltaLascGphf
	 BEi/KaMr84m1aB9mT2ktcjjq4/2ZYdenCvvNrlkNamEisztVtYqmui5sRWE/vBKa+o
	 3N1caEj2T7hBzQuHAt0CEYXUY+uobyZ52O+1TSRSYUhvaM8j/tnFxpxKvjnCFuXROc
	 zbyqSEOEK0l7jyRCV5QDOQ3pC3zu/kAGXzDJmq43AiM15+8zel7Hz5KlSBROdQ0wCV
	 hwJeGCHsk5sYROJQRdwWip59eUYfZqgwjZvsb/sBeqfwzDAEzQpA5NH9PNrG9/eCls
	 pf35NWnAhd8pg==
From: Davidlohr Bueso <dave@stgolabs.net>
To: palmer@dabbelt.com
Cc: jimw@sifive.com,
	guoren@kernel.org,
	dlustig@nvidia.com,
	parri.andrea@gmail.com,
	boqun.feng@gmail.com,
	peterz@infradead.org,
	will@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dave@stgolabs.net
Subject: [PATCH] riscv/futex: Optimize atomic cmpxchg
Date: Wed, 13 Nov 2024 10:33:21 -0800
Message-Id: <20241113183321.491113-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_103337_462670_7B05A61B 
X-CRM114-Status: UNSURE (   6.39  )
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

Remove redundant release/acquire barriers, optimizing the lr/sc sequence
to provide conditional RCsc synchronization, per the RVWMO.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 arch/riscv/include/asm/futex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index fc8130f995c1..72be100afa23 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -85,7 +85,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 
 	__enable_user_access();
 	__asm__ __volatile__ (
-	"1:	lr.w.aqrl %[v],%[u]			\n"
+	"1:	lr.w %[v],%[u]			        \n"
 	"	bne %[v],%z[ov],3f			\n"
 	"2:	sc.w.aqrl %[t],%z[nv],%[u]		\n"
 	"	bnez %[t],1b				\n"
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
