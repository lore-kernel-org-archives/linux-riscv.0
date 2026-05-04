Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A8EFF885A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 06:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJYUceukMd69yc4186JR/fYhU0dL/DNUB1K44lKFMbs=; b=GLaLVUB0KrRTDG
	EDfXa9PVnjPKCVYoe1tcwofOxcXuvgZ47T48dvuzHifVVbcQQFkFIfzF5wae9sxMe9ft7OFpB3Zlh
	9Lv2vRlr1joVsaaqJ0Pl6/ndz1yyfW5dasSr1QGT8n3FIieF1/vkt9YVTGx/9AeRHZMhW/9ux390g
	EtZ0aa8dNvE5jo10/ZaQKoJsMn452vFCAZ9/c3SctyskyjvuuXSpcczza72g0R6YYZw+hVQrzBu45
	qM9sAR34kze3PpGsDX5XlvjlBmAKJvyefKoxPNNmaS3hhnO1vNIgJi/kTRjrenBjwhOOrygOLtGcM
	zwnv70qvgB/Ae3sR1iqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmpZ-0000000CVhm-1zqb;
	Mon, 04 May 2026 06:31:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJmpW-0000000CVfC-03Yk
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 06:31:00 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777876255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IpXuDy/BAVZk2qCTwlweC6tduAoqiaSv5XotfzVf0l4=;
	b=BhX9HGYmJKpHiA3q7zk+ZziJnQEyuNJLA9KupmknfEZddUrjugJSiIwSpHfzBDStF6qIst
	GvroyAG7Gu10oLgF76Japyc0l257fNyaWT0RXrk3RQxXaDvieBb/D42PtEL6u+uEIl3J6l
	sRhVuXxnYetOIizoJB3/jb7dXowR61nJT+xxq4z0nwPsLyGm9vsCCz/sWnGmiimiHEMTrM
	Mb1PZGFdwO1iHdGjIHiYsCEU4xQRdom+AM/XIC06ok9rsHjHmjA9562hemS0bo/Tnc6i+d
	pOAAi+dHKGGYDdKgHWUL3euyEl3Nva12ebh/LlBmNb4QE0rkjEkdqZ1KZq5ehQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777876255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IpXuDy/BAVZk2qCTwlweC6tduAoqiaSv5XotfzVf0l4=;
	b=YcdqAtzLgrWyejmcixfgwN7CQ7rUQwcGh7zmnmYitXk6heTE3IyuwnxxSTHfUUywkE3Py9
	49dJXglb6aYKs4CQ==
Date: Mon, 04 May 2026 08:30:53 +0200
Subject: [PATCH 4/4] riscv: alternative: Also patch the CFI vDSO
MIME-Version: 1.0
Message-Id: <20260504-riscv-cfi-vdso-alternative-v1-4-bcdf3d37f62e@linutronix.de>
References: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
In-Reply-To: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Deepak Gupta <debug@rivosinc.com>, Charles Mirabile <cmirabil@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777876252; l=807;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Do5fKZU2bln4bc8zh+us/vSp4w75v9ClWSIbr9FVOQU=;
 b=5Lu0bjK+r16rXf4ydnhC5v/B9bUJ0Unhv5cdt76ZEt9dGs8b42xlhESSSfKqd/mGlXwj4uXPd
 KvSmAAH1LEYAuGMd9yGXhLI33kQLqZHF6FK/yQJVUNlntqntk65at5U
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_233058_250119_0F768C67 
X-CRM114-Status: UNSURE (   6.15  )
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

VGhlIGRlZGljYXRlZCB2RFNPIGZvciBDRkktZW5hYmxlZCB1c2Vyc3BhY2UgY2FuIGFsc28gY29u
dGFpbgphbHRlcm5hdGl2ZSBlbnRyaWVzLgoKUGF0Y2ggdGhvc2UsIHRvby4KCkZpeGVzOiBjY2Fk
OGMxMzM2YjYgKCJhcmNoL3Jpc2N2OiBhZGQgZHVhbCB2ZHNvIGNyZWF0aW9uIGxvZ2ljIGFuZCBz
ZWxlY3QgdmRzbyBiYXNlZCBvbiBodyIpClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVo
IDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvcmlzY3Yva2VybmVs
L2FsdGVybmF0aXZlLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCmluZGV4IDg5YzI4M2E1Y2VjNy4uMTA0ZGMwODYyYzVjIDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCisrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2FsdGVybmF0aXZlLmMKQEAgLTIwNSw2ICsyMDUsOSBAQCB2b2lkIF9faW5pdCBh
cHBseV9ib290X2FsdGVybmF0aXZlcyh2b2lkKQogCiAJaWYgKElTX0VOQUJMRUQoQ09ORklHX01N
VSkpCiAJCWFwcGx5X3Zkc29fYWx0ZXJuYXRpdmVzKHZkc29fc3RhcnQpOworCisJaWYgKElTX0VO
QUJMRUQoQ09ORklHX1JJU0NWX1VTRVJfQ0ZJKSkKKwkJYXBwbHlfdmRzb19hbHRlcm5hdGl2ZXMo
dmRzb19jZmlfc3RhcnQpOwogfQogCiAvKgoKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
