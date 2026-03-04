Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E70EF8FF4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 15:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTL89QjV7noXTIqV+wsQ9EGLhhwoMduWRp/Gg8lUjIg=; b=gkGHvMP1WHCx5P
	Eb8gl1brrf7wwg6LnZdHPYNtzeZqMXdfPuZ8aMFft6cXagAMOSRLFe5Y/3/y6SugFL33s3JP7LRy6
	Bku4peHx2MQdZphlsg3XHthZb/7E/bhLKK4w/7jUBWUfiM7UgaSqU3M+vmJqIfRLSjjCUAY+X4fm3
	UTGDTGKdUyykjWCQnFyTqLqpI1RCxgAQFIqbjdnE+J/J0QT0XS9mMfbRp9EZai5fMiWZl+8t0f44o
	jRMFp0Mwsh3gMs41f4MujfoMRP2x8GocNvXutRmzx5FUU4Z9RKiJVBlhbpqHaO9q/R8cc6KjJDpuC
	4T/oR5gafkpHg0Z207sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxo7C-0000000HXbS-2oEs;
	Wed, 04 Mar 2026 15:26:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxo7A-0000000HXZq-13dX
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 15:26:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D61E91A2C96;
	Wed,  4 Mar 2026 15:26:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC2FF5FF5C;
	Wed,  4 Mar 2026 15:26:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE875103697AE;
	Wed,  4 Mar 2026 16:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772637977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CQCPdFYuBjBjLSKu+vdlGdK6ZBcUmbZ+RsQ4S72GLlQ=;
	b=nSRBIKPr38NFab2uSfgMDC9MoRS9I59s+LdEf3oQGQKkDn0HN8XO01iZWimLJW7Nlsje09
	2UM6j7/J7yQ6xSUtS1y5frzCMAMcFsLnygVsuyJLnqmAWaz5/CprwtvrIUgpfDSVboQF+f
	r48gcaZ3VuJjTUPfq1TeivhuBzd43hGXDT8ZapR8ULsmAK252QL+Tqlgl553bBYEWTtSvN
	f4A26uDlW2MezHJbcfVbVVKt8iHTrOieVEn2+RcNwISMT+mOX3MgXtObsLND0E2ZvQkdtY
	8pz9Nd6eu3Km3jfsJVuK0+1uPCgkYtnyPN9FPrM7fqHna6vvIhKQnkhJ45I4aA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 04 Mar 2026 16:25:24 +0100
Subject: [PATCH v4 10/10] MAINTAINERS: Add entry for Mobileye RISC-V SoCs
MIME-Version: 1.0
Message-Id: <20260304-clk-eyeq7-v4-10-9d6bd9d24bec@bootlin.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
In-Reply-To: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_072620_425718_239F8598 
X-CRM114-Status: UNSURE (   8.74  )
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

QWRkIFZsYWRpbWlyLCBHcmVnb3J5LCBUaMOpbyBhbmQgbXlzZWxmIGFzIGNvLW1haW50YWluZXJz
IGZvciB0aGUKTW9iaWxleWUgUklTQy1WIFNvQ3MsIGFuZCBjbGFyaWZ5IHRoZSBkdC1iaW5kaW5n
cyBlbnRyaWVzIGJldHdlZW4KTUlQUyBhbmQgUklTQy1WIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBC
ZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+Ci0tLQogTUFJTlRBSU5FUlMg
fCAxMyArKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXgg
NjMwNDhkNWVkZTdkLi44Y2NjOTliNDQ4NTAgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBi
L01BSU5UQUlORVJTCkBAIC0xNzgwOCw3ICsxNzgwOCw4IEBAIE06CVRow6lvIExlYnJ1biA8dGhl
by5sZWJydW5AYm9vdGxpbi5jb20+CiBMOglsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwogUzoJ
TWFpbnRhaW5lZAogRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pcHMvbW9i
aWxleWUueWFtbAotRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9tb2Jp
bGV5ZS8KK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbW9iaWxleWUv
bW9iaWxleWUsZXllcTUtb2xiLnlhbWwKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb2MvbW9iaWxleWUvbW9iaWxleWUsZXllcTZscGx1cy1vbGIueWFtbAogRjoJYXJjaC9t
aXBzL2Jvb3QvZHRzL21vYmlsZXllLwogRjoJYXJjaC9taXBzL2NvbmZpZ3MvZXllcSpfZGVmY29u
ZmlnCiBGOglhcmNoL21pcHMvbW9iaWxleWUvYm9hcmQtZXBtNS5pdHMuUwpAQCAtMTc4MTgsNiAr
MTc4MTksMTYgQEAgRjoJZHJpdmVycy9yZXNldC9yZXNldC1leWVxLmMKIEY6CWluY2x1ZGUvZHQt
YmluZGluZ3MvY2xvY2svbW9iaWxleWUsZXllcTUtY2xrLmgKIEY6CWluY2x1ZGUvZHQtYmluZGlu
Z3MvY2xvY2svbW9iaWxleWUsZXllcTZscGx1cy1jbGsuaAogCitNT0JJTEVZRSBSSVNDLVYgU09D
UworTToJVmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5j
b20+CitNOglCZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+CitNOglHcmVn
b3J5IENMRU1FTlQgPGdyZWdvcnkuY2xlbWVudEBib290bGluLmNvbT4KK006CVRow6lvIExlYnJ1
biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+CitMOglsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCitTOglNYWludGFpbmVkCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc29jL21vYmlsZXllL21vYmlsZXllLGV5ZXE3aC1vbGIueWFtbAorRjoJaW5jbHVkZS9kdC1i
aW5kaW5ncy9jbG9jay9tb2JpbGV5ZSxleWVxN2gtY2xrLmgKKwogTU9EVUxFIFNVUFBPUlQKIE06
CUx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPgogTToJUGV0ciBQYXZsdSA8cGV0
ci5wYXZsdUBzdXNlLmNvbT4KCi0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
