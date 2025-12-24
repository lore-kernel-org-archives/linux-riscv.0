Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05844E75454
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eqb/4yOIkW34TJenN4ARWaV6dMRw+PBahhMatnXxnC0=; b=WeoiWmgelPfirY
	u1UfgHP2wE0rwHqJEE5tDRCpig1Ax5AyHCf+E4EoAwtBwLGlfnhsta0ukOZNU82su/S3/vsH6Xlt7
	Irfe6wl3xU5WhLjclmnBbxTPnJT8/nSmmytKeF+vVIElDjv0Ia4dJR9K8TQCBpDX4VzmAv68FgW8T
	HsIMbeGm4bXgEaakFybg+wXRuQeLpyvj1W0GftQwcRdkiGGT1ujEuPQFq+uPW15caylbyN9XgVIoQ
	mV8O1La43mvlPNmYNPzi5guTB2GNDxxHaL694XxINH08RsKZP3UeVtZfOcyITMldXNenBSG/ZtDl5
	bWtDyDq/fu1KdAsBNqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYLmi-0000000GfG3-2lMK;
	Wed, 24 Dec 2025 10:08:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYLmg-0000000GfDe-3O4L
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 10:08:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 251F5C1A5A0;
	Wed, 24 Dec 2025 10:07:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4991C6073D;
	Wed, 24 Dec 2025 10:07:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C94310AB110C;
	Wed, 24 Dec 2025 11:07:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766570876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cI1JQH6Wxakl2cHxkxeZUP6cWNzaIt5ffNvTU0ZKfI0=;
	b=hZ3MU06XDk1/Oju31ZB8FqNiMG0Ume5mT/elnRRSpm/0dM+SQe5eShoZSacKqFNrDdVZ64
	KiSZEC/zRm2spkmjxgSdjHfIOlwTQN7JQtV4VvmhPaa+EtsIYPQw2Af5+FJb9nvwg8Lu8U
	ip3E9oGovdCGDfpFMtfjzENzHodkEoTGoqPQcTkE8Jb9xRzcqYT/t6I2XM7eyRL4AefSTB
	8ydx43jE68aSVIiAAcM2KX6+Aq/GwxHwuqX2PCRJ9ttL4//WN5XLMqyRkHYJVl191SPEy8
	Fd7bBUVuoAfRunSt81x8ted/mc5oa0aM7ybCdkEF77SMZsQZ2Zss1aoMiKKW3A==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 24 Dec 2025 11:07:23 +0100
Subject: [PATCH v2 10/10] MAINTAINERS: Add entry for Mobileye RISC-V SoCs
MIME-Version: 1.0
Message-Id: <20251224-clk-eyeq7-v2-10-81744d1025d9@bootlin.com>
References: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
In-Reply-To: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
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
X-CRM114-CacheID: sfid-20251224_020758_982785_A40BEC86 
X-CRM114-Status: UNSURE (   8.15  )
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

QWRkIFZsYWQsIEdyZWdvcnksIFRow6lvIGFuZCBteXNlbGYgYXMgY28tbWFpbnRhaW5lcnMgZm9y
IHRoZSBNb2JpbGV5ZQpSSVNDLVYgU29DcywgYW5kIGNsYXJpZnkgdGhlIGR0LWJpbmRpbmdzIGVu
dHJpZXMgYmV0d2VlbiBNSVBTIGFuZApSSVNDLVYgU29Dcy4KClNpZ25lZC1vZmYtYnk6IEJlbm/D
rnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDEz
ICsrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA2NzBl
OTNkZGYyZjEuLmJjNjc1ZDYyZDU2NyAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJ
TlRBSU5FUlMKQEAgLTE3NjAxLDcgKzE3NjAxLDggQEAgTToJVGjDqW8gTGVicnVuIDx0aGVvLmxl
YnJ1bkBib290bGluLmNvbT4KIEw6CWxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnCiBTOglNYWlu
dGFpbmVkCiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlwcy9tb2JpbGV5
ZS55YW1sCi1GOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL21vYmlsZXll
LworRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9tb2JpbGV5ZS9tb2Jp
bGV5ZSxleWVxNS1vbGIueWFtbAorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NvYy9tb2JpbGV5ZS9tb2JpbGV5ZSxleWVxNmxwbHVzLW9sYi55YW1sCiBGOglhcmNoL21pcHMv
Ym9vdC9kdHMvbW9iaWxleWUvCiBGOglhcmNoL21pcHMvY29uZmlncy9leWVxKl9kZWZjb25maWcK
IEY6CWFyY2gvbWlwcy9tb2JpbGV5ZS9ib2FyZC1lcG01Lml0cy5TCkBAIC0xNzYxMSw2ICsxNzYx
MiwxNiBAQCBGOglkcml2ZXJzL3Jlc2V0L3Jlc2V0LWV5ZXEuYwogRjoJaW5jbHVkZS9kdC1iaW5k
aW5ncy9jbG9jay9tb2JpbGV5ZSxleWVxNS1jbGsuaAogRjoJaW5jbHVkZS9kdC1iaW5kaW5ncy9j
bG9jay9tb2JpbGV5ZSxleWVxNmxwbHVzLWNsay5oCiAKK01PQklMRVlFIFJJU0MtViBTT0NTCitN
OglWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbT4K
K006CUJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KK006CUdyZWdvcnkg
Q0xFTUVOVCA8Z3JlZ29yeS5jbGVtZW50QGJvb3RsaW4uY29tPgorTToJVGjDqW8gTGVicnVuIDx0
aGVvLmxlYnJ1bkBib290bGluLmNvbT4KK0w6CWxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b2MvbW9iaWxleWUvbW9iaWxleWUsZXllcTdoLW9sYi55YW1sCitGOglpbmNsdWRlL2R0LWJpbmRp
bmdzL2Nsb2NrL21vYmlsZXllLGV5ZXE3aC1jbGsuaAorCiBNT0RVTEUgU1VQUE9SVAogTToJTHVp
cyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+CiBNOglQZXRyIFBhdmx1IDxwZXRyLnBh
dmx1QHN1c2UuY29tPgoKLS0gCjIuNTIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
