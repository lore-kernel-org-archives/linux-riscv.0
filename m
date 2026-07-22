Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17A6C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Oc2o6IaYFrVWJfmdTKYe7geUUsUEMFLpBqB+exApWs=; b=WbJgvybGBW83Cr
	518c6aSUr0lSfKyAi101N+Ox0FzKjchLrby5epeS4O/Cfc9XZIk8Jm/ZqocfZYgyMspdNsquHHoJd
	FAkmG6B3zcwyZX+LLjuhXDEm0WMC7BIaa1mm1dVHsFUCDHJ42yE6/cgwYXvVuMMdIvx44wM5Z1ZrZ
	h6t8NtpoCR/8b0ANB/Jjo1laPvCct7I49WiLPVYBhXMRj29HtQIrLioSp9UBpyD6wBo8v7hlvfpkO
	BcUdgsDoA1gb1w8Eso8sdjC4+LM45FLgvWZ39A3zMblUAu3Z+V8BD5ssohPqFhNOBhg7K6G2PGT4h
	rsk6y9zCCETnksNzVSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSvd-0000000BLCH-0UbS;
	Wed, 22 Jul 2026 09:07:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSvY-0000000BL9w-3XX0
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 09:07:46 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784711263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9B1Sb2gFl2JYRtTWXT8xaC7KS5GdcxcmKr7gpZV2JDw=;
	b=IxlKEPv14HDGdQy9HHmZgQ3U4k/ptNsl3D33QMgYONjC9lGM5dBCxhROlzb9viX9hQxKjp
	WquV2Y2D/531AKyKTNe9J2GRBlvhNuYKhWBrvhSGlnG4yAwDDOcejfDGUmK/HcJpb0p9dw
	EpC9ZbsHLjnAQCLnCLUjgnhGt0lHZPmEWACAIsmfMdMf71RtTVe8wHs0LWi+mLCbfSPJVL
	3hT2DcCwJmDw0lytwzyqshF6Rbg3CunUSkKFqiuw8fRHlfE1HjBdctMKPMHzuKWtAZUdnX
	CUbFWfp8tbj/D+JRt2bJBwEZqhClRBMclqapr52lO1aptWfladRtL8J0ub/zNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784711263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9B1Sb2gFl2JYRtTWXT8xaC7KS5GdcxcmKr7gpZV2JDw=;
	b=EBJoVIucFznDj+Aj/8R6pxAwekeCSHMnGr1dIwpIaOfgL+awirB3ERBp1Q2DDfcZFZjWpI
	j22uFy+BzyuYalDg==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v4 2/3] riscv: compat_vdso: Allow *.c source files
Date: Wed, 22 Jul 2026 11:06:43 +0200
Message-ID: <1ba6b1e392a0d61551405dbf356fbc8292c96627.1784710768.git.namcao@linutronix.de>
In-Reply-To: <cover.1784710768.git.namcao@linutronix.de>
References: <cover.1784710768.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_020745_023651_63A8FFEC 
X-CRM114-Status: UNSURE (   6.71  )
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

RXh0ZW5kIHRvIHN1cHBvcnQgYnVpbGRpbmcgKi5jIGZpbGVzLiBUaGlzIGFsbG93cyBhZGRpbmcg
ZnV0ZXguYyBpbiBhCmZvbGxvdy11cCBjb21taXQuCgpSZXZpZXdlZC1ieTogVGhvbWFzIFdlacOf
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IE5h
bSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL2NvbXBh
dF92ZHNvL01ha2VmaWxlIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfdmRzby9NYWtlZmlsZSBiL2FyY2gv
cmlzY3Yva2VybmVsL2NvbXBhdF92ZHNvL01ha2VmaWxlCmluZGV4IDdlYzlkZDQ3YzRmYS4uMDNk
MTI4MDgwYzZhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfdmRzby9NYWtl
ZmlsZQorKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfdmRzby9NYWtlZmlsZQpAQCAtNDMs
NiArNDMsNyBAQCBMREZMQUdTX2NvbXBhdF92ZHNvLnNvLmRiZyA9IC1zaGFyZWQgLVMgLXNvbmFt
ZT1saW51eC1jb21wYXRfdmRzby5zby4xIFwKIAktLWJ1aWxkLWlkPXNoYTEgLS1oYXNoLXN0eWxl
PWJvdGggLS1laC1mcmFtZS1oZHIKIAogJChvYmotY29tcGF0X3Zkc28pOiBLQlVJTERfQUZMQUdT
ICs9ICQoQ09NUEFUX0NDX0ZMQUdTKQorJChvYmotY29tcGF0X3Zkc28pOiBLQlVJTERfQ0ZMQUdT
ICs9ICQoQ09NUEFUX0NDX0ZMQUdTKQogCiAjIHN0cmlwIHJ1bGUgZm9yIHRoZSAuc28gZmlsZQog
JChvYmopLyUuc286IE9CSkNPUFlGTEFHUyA6PSAtUwotLSAKMi40Ny4zCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
