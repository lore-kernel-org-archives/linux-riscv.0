Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E152C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rhDogyTKCVeEolPThRDMOdKyA9mbN2ByDyY7c3X/Xjg=; b=FOjlhBwrm5HwmD
	daLFOomo5RhxuLyai46apVQfRLmoJFaCFNGN23q9c3x01k6H3cQeSfsbk/r4oTjIZURa3MkJLgUf/
	tStA/ND9AN4HSPc+HVi5jlQfJnCRpsHHFzcIyf0quI5+Zkv9WQ/tSw8zIpewLeyQ4hgm7ct6ax0Dg
	oTFmEIipD6EVd47kmkrGPkQVTlnY6YhNuHgQkD95JdQ8lKQq0U32bMWILbspJbyjVdhTG663LDBmR
	7zrqAMdEdNPTratZpYnWh3aXk1hqd0dXkQTpO7Q8KaCQd61t5DrUTzYuq70JmF1oJo9O16SkX5tg8
	0XfI2iBnI6GusaiWStdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wer8O-00000001BRK-1Mke;
	Wed, 01 Jul 2026 09:21:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wer8L-00000001BQ9-1EZO
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 09:21:30 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782897683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1P4DveztDZLFBBvdim/QuvRX0fea6opwzUnSRtwBTe4=;
	b=HRscMH2hEk4eFGUvQRMinz684fRtcSCcw5V4/tuazqcpITge1r2Snu5ZI+GSEypf/FhoAe
	gsWFPF4w2pOX5O23bj2A2+e14GOFmVSVjTKZvi08LkUmrZbtLxJ1OraI9Wncb9xqZGX+AO
	g6ZDnm5A8e5WjwCjwI4iqVxJtiocghy/ugPMlcC+1sJIClQg452i7tJQtFNf9fjluEklNQ
	uFhQusHiZ2NC6sJS3O+GxMdpc5FLTgu2mH2Kpo63VWowLFvaj7yNbSxWtptLBxH9vELxuf
	1GvndWdqvp1PKehu/TMkzZnrOO+JRJZby0rz8z3odwxwPgH3+y8Ld1TWsxKhuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782897683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1P4DveztDZLFBBvdim/QuvRX0fea6opwzUnSRtwBTe4=;
	b=1mucl8RoLD4zN8QqUTRXyO6tbfnnY213qFutYvpjOm9WGT9iYQgw5j+FSXl6olxZ2KdUPx
	82boq77Um+Bh9kDA==
Subject: [PATCH 0/2] riscv: vdso: Do not use LTO for the vDSO
Date: Wed, 01 Jul 2026 11:21:21 +0200
Message-Id: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNtxA5eRRykphqQVhopgvTuF
 sc3/P+CchZWmLoXMhdRSbHB9h34Y407o2zNQIaccYPBLOoLlk0TnndCWkfvgiFrHUGLrsxBnn8
 4L7V+C4C6dGAAAAA=
X-Change-ID: 20260630-riscv-vdso-lto-2a5c6f021162
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Wende Tan <twd2.me@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 kernel test robot <lkp@intel.com>, stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782897683; l=689;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Itu0zuJP1QIEVm1n4HhqMKHpUvYrOj/M/IwsB44LALk=;
 b=yCwSaWupVhWoA1E000vsVKYKin3V7oT+/pgmoTsgEDzbWh4agJ/uW0jiPhkilk7osRTAnBdLr
 UeBAOy5J1XlAH/cyvV+0ARleJLysbJh/5lo/rEMlwYZhWWTIlGTd5dt
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_022129_482598_306E8305 
X-CRM114-Status: UNSURE (   4.60  )
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

V2l0aCBMVE8gZW5hYmxlZCB0aGUgY29tcGlsZXIgYXNzdW1lcyB0aGF0IHRoZSB2RFNPIGZ1bmN0
aW9ucyBhcmUgbm90CnVzZWQgYW5kIG9wdGltaXplcyB0aGVtIGF3YXkgY29tcGxldGVseS4KCkRp
c2FibGUgTFRPIGZvciB0aGUgdkRTTywgYXMgdGhlc2UgZnVuY3Rpb25zIGFyZSBoYW5kLW9wdGlt
aXplZCBhbnl3YXlzLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53
ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQpUaG9tYXMgV2Vpw59zY2h1aCAoMik6CiAgICAg
IHJpc2N2OiB2ZHNvOiBEbyBub3QgdXNlIExUTyBmb3IgdGhlIHZEU08KICAgICAgcmlzY3Y6IHZk
c286IFNpbXBsaWZ5IGNmbGFncyByZW1vdmUgbG9naWMKCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNv
L01ha2VmaWxlIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGRjNTllNGZlYTlkODNmMDNiYWQ2YmRkZjNm
YTJlNTI0OTE3Nzc0ODIKY2hhbmdlLWlkOiAyMDI2MDYzMC1yaXNjdi12ZHNvLWx0by0yYTVjNmYw
MjExNjIKCkJlc3QgcmVnYXJkcywKLS0gIApUaG9tYXMgV2Vpw59zY2h1aCAoU2NobmVpZGVyIEVs
ZWN0cmljKSA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
