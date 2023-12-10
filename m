Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204CFC10F04
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Dec 2023 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37YU7j3KtlaAdFhNAXVKUhlkQxMGMZxxxZkJ8fjx1v0=; b=0PrJtp9b3QsXF2
	xaGb+ZrYCp9t/+aMM/+pB+QkGa3zqk58M9kX6dfYwS5b/oCkKh1IqGJBx4BucA92Lk37mPSe32CMp
	KSGlmJ871WsKLi75GavwyF6mQGcmFrOulvlZ6y1GGYKQ1ZLRnUhfTfg3zwxaH6AlMAiaZOk2uggGm
	qQFVqo5F9+5Q7IQfrh2vzt0tAHPcSb6zjXnJwVKIlUfvuQR+9mmbogHz39Fbmo7moGEqL3sXFGADF
	2W5vjCxvYIMv5fAyM0pQy83f2uw5Y5DGLH1c6sW8OVVLQgC7MA7RXEHdwqa+pki0YDV+V3dn6oXQm
	yZlpBy6zfVLQU1SHXUCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCJEV-00218U-32;
	Sun, 10 Dec 2023 12:48:32 +0000
Received: from smtp.outgoing.loopia.se ([93.188.3.37])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCJEQ-002111-1G
	for linux-riscv@lists.infradead.org;
	Sun, 10 Dec 2023 12:48:29 +0000
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id B92742FC9EF5
	for <linux-riscv@lists.infradead.org>; Sun, 10 Dec 2023 13:48:17 +0100 (CET)
Received: from s981.loopia.se (unknown [172.22.191.5])
	by s807.loopia.se (Postfix) with ESMTP id A98B62E274F0;
	Sun, 10 Dec 2023 13:48:17 +0100 (CET)
Received: from s898.loopia.se (unknown [172.22.191.5])
	by s981.loopia.se (Postfix) with ESMTP id A6D3822B17B5;
	Sun, 10 Dec 2023 13:48:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s981.loopia.se ([172.22.191.5])
	by s898.loopia.se (s898.loopia.se [172.22.190.17]) (amavisd-new, port 10024)
	with LMTP id yo_ORE4WT41Y; Sun, 10 Dec 2023 13:48:17 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: fredrik@frelon.se
X-Loopia-Originating-IP: 81.233.40.252
Received: from localhost.localdomain (81-233-40-252-no600.tbcn.telia.com [81.233.40.252])
	(Authenticated sender: fredrik@frelon.se)
	by s981.loopia.se (Postfix) with ESMTPSA id 3734622B179D;
	Sun, 10 Dec 2023 13:48:17 +0100 (CET)
From: =?UTF-8?q?Fredrik=20L=C3=B6nnegren?= <fredrik@frelon.se>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	fredrik.lonnegren@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fredrik=20L=C3=B6nnegren?= <fredrik@frelon.se>
Subject: [PATCH 2/2] RISC-V: sort includes alphabetically
Date: Sun, 10 Dec 2023 13:42:25 +0100
Message-ID: <20231210124811.26204-2-fredrik@frelon.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231210124811.26204-1-fredrik@frelon.se>
References: <20231210124811.26204-1-fredrik@frelon.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_044826_607566_FE68A530 
X-CRM114-Status: UNSURE (   7.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U29ydCBpbmNsdWRlcyBpbiBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgYWxwaGFiZXRpY2Fs
bHkuCgpTaWduZWQtb2ZmLWJ5OiBGcmVkcmlrIEzDtm5uZWdyZW4gPGZyZWRyaWtAZnJlbG9uLnNl
PgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyB8IDIwICsrKysrKysrKystLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvc21wYm9vdC5jCmluZGV4IDFiNDYxNTcwZDQ1Ni4uOThlYmI1ZTNmMTczIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21w
Ym9vdC5jCkBAIC0xMCwxOSArMTAsMTkgQEAKIAogI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KICNp
bmNsdWRlIDxsaW51eC9hcmNoX3RvcG9sb2d5Lmg+Ci0jaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
Ci0jaW5jbHVkZSA8bGludXgvaW5pdC5oPgotI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgotI2lu
Y2x1ZGUgPGxpbnV4L21tLmg+Ci0jaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KLSNpbmNsdWRlIDxs
aW51eC9rZXJuZWxfc3RhdC5oPgotI2luY2x1ZGUgPGxpbnV4L25vdGlmaWVyLmg+CiAjaW5jbHVk
ZSA8bGludXgvY3B1Lmg+Ci0jaW5jbHVkZSA8bGludXgvcGVyY3B1Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KKyNpbmNsdWRlIDxsaW51eC9pbml0
Lmg+CiAjaW5jbHVkZSA8bGludXgvaXJxLmg+CisjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cisj
aW5jbHVkZSA8bGludXgva2VybmVsX3N0YXQuaD4KKyNpbmNsdWRlIDxsaW51eC9tbS5oPgorI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4L25vdGlmaWVyLmg+CiAjaW5j
bHVkZSA8bGludXgvb2YuaD4KKyNpbmNsdWRlIDxsaW51eC9wZXJjcHUuaD4KKyNpbmNsdWRlIDxs
aW51eC9zY2hlZC5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Rhc2tfc3RhY2suaD4KICNpbmNs
dWRlIDxsaW51eC9zY2hlZC9tbS5oPgogCkBAIC0zMSwxMSArMzEsMTEgQEAKICNpbmNsdWRlIDxh
c20vaXJxLmg+CiAjaW5jbHVkZSA8YXNtL21tdV9jb250ZXh0Lmg+CiAjaW5jbHVkZSA8YXNtL251
bWEuaD4KLSNpbmNsdWRlIDxhc20vdGxiZmx1c2guaD4KICNpbmNsdWRlIDxhc20vc2VjdGlvbnMu
aD4KICNpbmNsdWRlIDxhc20vc21wLmg+Ci0jaW5jbHVkZSA8dWFwaS9hc20vaHdjYXAuaD4KKyNp
bmNsdWRlIDxhc20vdGxiZmx1c2guaD4KICNpbmNsdWRlIDxhc20vdmVjdG9yLmg+CisjaW5jbHVk
ZSA8dWFwaS9hc20vaHdjYXAuaD4KIAogI2luY2x1ZGUgImhlYWQuaCIKIAotLSAKMi40My4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
