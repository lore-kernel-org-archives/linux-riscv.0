Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC0BC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhazFmmWByPAI77NOxO1IifFBgQ4nFGIXIAHc51JpaU=; b=xho1UtSzsX6Smo
	p7qmOAGS3kSh/Rh8FFLg5VUI20U4npZZ0rWX/dz9nLTD9miZuk0rual25tU8pGyA2/6ybtgaDvacS
	YtxwPDm/Ne3FeuS//0k+whI2SeZEAv5d+gktvmW1llyoy6Pjj/AG+twtpMU9OeOd8M0QuCFZ5x1Dk
	T6yPX9UsfASeWghEFfj8LNHG0kKIAiA1/1uxk22eQdi3bIobJGXYsL45Dju/lHec+LWyxcBDws5xL
	VB1c1nzkNc1HEPc3gg/B6c1tKXxSicAI03EtmQ+w2Uyv4ya5TWv18zrhQ/+JLc+mQyAceNqjLQbeG
	plHX8XmT/LYakTA+itHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT6L-0000000G8RE-21OA;
	Tue, 30 Jun 2026 07:41:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weT6I-0000000G8Pk-0u35
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:41:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782805304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=el6Ow7BOPBgUIR+ljby31ILisiUyFqLCCIzESdwb8Cc=;
	b=BxdrA7m+5YnqN87ZV1dLuNhVmaT3jF+RQJBKQnZtJ6qhZjxQaFT/FKa1BszL99gAxG+bfg
	4yJi4TmsYljWLHnn3AcNhitJp4uDRX2EBp3mZkZWb816LjVjA4A0XGZaTRlRYl9mMev4aQ
	9g9v0J+H2wU6+OC9NNhz9PhBJ6LGvc7tZRaPmabLwFvftA+NL2jkCBoonDL0SLSIOs6UbI
	XVLdgqY7UYBrDdonXgHGhCgcY2xPaLYAOgWgw66Z3QYDf5Y+8GK5Ou5CxFg4jG4Xr5ST6u
	ROTjYbf0nCUu5g4yfBJYkbMF7LJ6kRdcHcm2UWPAGeemOTBlOXoX+t3HKH7a2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782805304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=el6Ow7BOPBgUIR+ljby31ILisiUyFqLCCIzESdwb8Cc=;
	b=RPYqvjibe2sASgOw7IzPwCDKyGocB+aoeyuwkDNlwKPif0CL2IvSF66qHT62TidWkxL/JO
	HNTI340kN4RARaCQ==
Date: Tue, 30 Jun 2026 09:41:42 +0200
Subject: [PATCH 3/3] riscv: alternative: Also patch the compat vDSO
MIME-Version: 1.0
Message-Id: <20260630-riscv-vdso32-alternative-v1-3-a32fd89b7b1c@linutronix.de>
References: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
In-Reply-To: <20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805300; l=845;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=i34rwuA7BS8sE/LmOWh+v/wKD8dk0vqTQIEcocMxd3o=;
 b=yNHcvBnby1Fr6v84ZwT8BCMPHZHXxKYrfLWyxBM7J8bSp+J5g4BlxXDY8Xcc/NWVwngppfdK0
 I2eO789si13BqNrY++PEMuJFTMb+lZ2IpQWL21YtQ9oFwZIJEpmY8AC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004146_990780_35D540B3 
X-CRM114-Status: UNSURE (   5.76  )
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

VGhlIHZEU08gZm9yIGNvbXBhdCBwcm9jZXNzZXMgY2FuIGFsc28gY29udGFpbiBhbHRlcm5hdGl2
ZSBlbnRyaWVzLgoKUGF0Y2ggdGhvc2UsIHRvby4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnD
n3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvcmlzY3Yv
a2VybmVsL2FsdGVybmF0aXZlLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYWx0ZXJuYXRpdmUuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMKaW5kZXggNmFiYTE2OWZiMjEzLi5jMGM5MzA2
MDIyYzUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMKKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvYWx0ZXJuYXRpdmUuYwpAQCAtMjAyLDYgKzIwMiwxMSBAQCB2b2lk
IF9faW5pdCBhcHBseV9ib290X2FsdGVybmF0aXZlcyh2b2lkKQogCQlhcHBseV92ZHNvX2FsdGVy
bmF0aXZlcyh2ZHNvX2NmaV9zdGFydCwKIAkJCQkJX192ZHNvX2FsdGVybmF0aXZlc19zdGFydF9j
Zmlfb2Zmc2V0LAogCQkJCQlfX3Zkc29fYWx0ZXJuYXRpdmVzX2VuZF9jZmlfb2Zmc2V0KTsKKwor
CWlmIChJU19FTkFCTEVEKENPTkZJR19DT01QQVQpKQorCQlhcHBseV92ZHNvX2FsdGVybmF0aXZl
cyhjb21wYXRfdmRzb19zdGFydCwKKwkJCQkJY29tcGF0X192ZHNvX2FsdGVybmF0aXZlc19zdGFy
dF9vZmZzZXQsCisJCQkJCWNvbXBhdF9fdmRzb19hbHRlcm5hdGl2ZXNfZW5kX29mZnNldCk7CiB9
CiAKIC8qCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
