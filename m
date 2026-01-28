Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38185D25B48
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYvvJcsREg5DW5Mxy/HVeFaBSWdf0Nw1nXj920gdiP4=; b=Ym+7HWDA0yqRiK
	J+3feWPV6QdaL4UJ1+GPhOVYgQW4d+wyOmOo0C/gkeOFgGJfmd4KRI+bFChO+4zgmO5ZWTs/KvUGq
	MNZA48e2FS6UcR0UjqiE6L4m19wf3/oHrvjjuy4fu39uJo4DRAbpcwc6gkGgq9uk5uzlg5ItD3glJ
	9UzSrHfBbKnaaWBEC6xAohJeYIsUwVeWFXUWjdSPhOy8EZaH/1/lkGOy5CAyWK+Rl4FiyEvbrgFKi
	IHK5+G70Y+m4u9KjS19GbW4mscxsYlxIBr/TBghKGts2CEynvSKvYS5RbnklH1EJk2uuXDFo9oFIZ
	hsnfW3eyR5xC7vPCHIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4cL-0000000FzjH-36in;
	Wed, 28 Jan 2026 12:25:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4cH-0000000FziC-2O1i
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 12:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CD0B60132;
	Wed, 28 Jan 2026 12:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1A6EC2BCAF;
	Wed, 28 Jan 2026 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769603147;
	bh=4Hf8WFVjj3Fr8FkaoNLFWcuWjq8ROC9IttcHryo+64E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W5v6j9ICJ+4Zl1bzJQOMCZCZw9JRUHTudvZ3krWOw8Kz04QNC82GWWwO8xzmdsRA4
	 HUrPKkwznuk9HM4aK4Bw/GwIlPD3I2VtwYrtBivfdTDIfJR+rXyRxp2aHHj4CkyRjE
	 1z16VDBRy5XTe1c+ymBHShZnnzxXzB+PJ8SgP84twzCSit0OgnbR57Z8dm1wLLghNw
	 /XCs6upOJH4bbqPyu1rTRU0Ix2Y1BOZ2OC14hWGNt3WthKeIYP/mAizW6rrE+BWufP
	 tQk7/x31tBl44PfEs9CFrEpifESSo26mdOhwwu5I6kqDZLhP/MSNxUPqyV5g/3agXK
	 Hxlf56DvA4QwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E8FD25B48;
	Wed, 28 Jan 2026 12:25:47 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Date: Wed, 28 Jan 2026 20:25:46 +0800
Subject: [PATCH v3 3/4] MAINTAINERS: add an entry for Andes I2C driver
MIME-Version: 1.0
Message-Id: <20260128-atciic100-v3-3-8c002fcc2bb4@andestech.com>
References: <20260128-atciic100-v3-0-8c002fcc2bb4@andestech.com>
In-Reply-To: <20260128-atciic100-v3-0-8c002fcc2bb4@andestech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ben Zong-You Xie <ben717@andestech.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603146; l=725;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=R5gM2pzYU1W+0/8WWd58LyJRsiDel4+cHcYEncZpNOE=;
 b=nkvGd6uphKL+SR3Wj1edsbzWRIJnDia++C+nJ2w9q+QAj8xXJGRcJmp0GxcDMwtYFnu6OTPqQ
 ZSL9x9NgzgLCrzEVeb9jOFiokz8xBwtii7pXPkzMKgGUp85tlApImYx
X-Developer-Key: i=ben717@andestech.com; a=ed25519;
 pk=nb8L7zQKGJpYk0yvrYKjViOZ34A36g1ZIsCmCsP518s=
X-Endpoint-Received: by B4 Relay for ben717@andestech.com/20260120 with
 auth_id=610
X-Original-From: Ben Zong-You Xie <ben717@andestech.com>
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
Reply-To: ben717@andestech.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+CgpBZGQgYW4gZW50
cnkgZm9yIHRoZSBBbmRlcyBJMkMgZHJpdmVyIHRvIHRoZSBNQUlOVEFJTkVSUyBmaWxlLgoKU2ln
bmVkLW9mZi1ieTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+Ci0tLQog
TUFJTlRBSU5FUlMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNjg2M2Q1ZmEwN2Ex
Li5lMmZkY2YyYjk2NzcgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJT
CkBAIC0xODE5LDYgKzE4MTksMTIgQEAgUzoJU3VwcG9ydGVkCiBGOglkcml2ZXJzL2Nsay9hbmFs
b2diaXRzLyoKIEY6CWluY2x1ZGUvbGludXgvY2xrL2FuYWxvZ2JpdHMqCiAKK0FOREVTIEkyQyBE
UklWRVIKK006CUJlbiBab25nLVlvdSBYaWUgPGJlbjcxN0BhbmRlc3RlY2guY29tPgorUzoJU3Vw
cG9ydGVkCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FuZGVzdGVj
aCxhZTM1MC1pMmMueWFtbAorRjoJZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hbmRlcy5jCisKIEFO
RFJPSUQgRFJJVkVSUwogTToJR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KIE06CUFydmUgSGrDuG5uZXbDpWcgPGFydmVAYW5kcm9pZC5jb20+CgotLSAKMi4z
NC4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
