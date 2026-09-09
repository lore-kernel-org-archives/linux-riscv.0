Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B03BC79F8C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFQL/AURgq4RgZiKE3JZ7sflUUSiWrar2V/trzy17n8=; b=e7QGKZbkM1qHRa
	tZa2B3P9Rl9aDhSsgnt4VU2DcuGoZ/7zstwDA7AgqiVEHhONAlfcqYDgnsbz40esNjaB/UhxRgQcV
	rHjfbaSza/QzXCWSgMn4Y+oWed9RxniKOhM5nh4s3ms/hPuuQanxOnUQoD/uRDpMz7OOQWwhqRlcJ
	Eahxd4oXa4qd6E/NpEIFRZunmwVX78J5aCEo0xVhJ0ENIlVzTUhS5nCdzhAgkQz/KikWRA8Cp6Bo5
	anO1G7tbxaa3/nmsJyo7xl/XEyZogfrYip7yniLlKGPW3q8OCmfrVNNzl5AJj1zVfIWz7HXs2ye+u
	GQsi1KQBPhdUDL91Wtgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E25-0000000BAhT-2M89;
	Wed, 09 Sep 2026 08:51:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1l-0000000BAG6-2t2O;
	Wed, 09 Sep 2026 08:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+BSSPIkVsfUiGZ/2/7JQoGktT3Bg/qW3vWeVl3H8t4I=; b=d8RQ4kO9N5NXJwEBZv9tmOB2zk
	VfDzNDsNT0319Aa2wXvPuv3cOaKKq5MF1Z0nnAx5liWYjYWzRVpfRsR03Ozwk7WA04mkJLImZs6c0
	bZ/ygmHgb0S/bob+nKCckaI96EgkcTpJsBPa6zdUksi9lMNZzDr/1LNRR+yuVpAd9bHCexArbo7aP
	7i455UaQt/OUEnMGI2k1/ZVOYexwLpkCI5sxaXrUsyIr4ARKqFNOG1YL8v7uqK3701nfpCd0sokHO
	z8t5TPM7QQsZHvxwudctZPtCRs7YvSniPVZpOoQ1JgAIcu0DEWZC5cYLE0CHmDg4M+thi6o/xzhj/
	F3J1e42Q==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1h-00000000wHm-1Trq;
	Wed, 09 Sep 2026 08:51:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BSSPIkVsfUiGZ/2/7JQoGktT3Bg/qW3vWeVl3H8t4I=;
	b=JaOyz+GffrY14/vqZR3mc3aRHefVc9sKFST/Y+iv6y2dWE5XkrXmA9ZJsAgqJ018f/vug2
	cBMChuc7FaXyUAF9yQKOHxlkPemVJ32YoyN5tLBaH5C5wxOmAtxy0Ukobemx+5ORO7uFfy
	Wiu0MtImMa+hOKQRUZBdB84qZjgFlKRYR7h4fdWiycJ85XrjCvCyV1y6fITwXy11WldYgg
	+vgzkpMELO8vXyECyskLAnuY5vVpDRCTsaR+01bT+hpNKuUJVRHkC5wWfCgNEJWMjBkGqg
	t+9mVcjwwU/JEljjnrLJ3bJK/1yy+XyvUm48H3zRCFfkamQLKNoJ6UlylCYASQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BSSPIkVsfUiGZ/2/7JQoGktT3Bg/qW3vWeVl3H8t4I=;
	b=y5gKHnSvh3NyUEy73IKx6RfvsCL+Ha6mwmh698IzxBvPV1anfbtnSec1fGWt7Tg3vCMaSo
	l6Cb8RNPcUh7xvDA==
Date: Wed, 09 Sep 2026 10:51:25 +0200
Subject: [PATCH 12/15] riscv/hwprobe: Include vdso/datapage.h
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-12-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=814;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=WJuW0vHAzgVK65zYpMsMpkIoWVAhRqBIQ43ugL+Vfgo=;
 b=3v9PIQWIfY59Utoqf3u0a+2xyzC3K3qFiLXNZMe7AgOtEielmjn6RIPlrTTQkKqzrYA4P+N4f
 jrwA4Hzlo03Cus2D1tSaBop8ClV4dFKjXJ96j2IsAFgQehGy3G3Rb0w
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095129_545306_DF47AD42 
X-CRM114-Status: UNSURE (   6.55  )
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

VGhlIHN5bWJvbCB2ZHNvX2tfYXJjaF9kYXRhIGlzIHByb3ZpZGVkIGJ5IHZkc28vZGF0YXBhZ2Uu
aCwKd2hpY2ggaXMgY3VycmVudGx5IG5vdCBpbmNsdWRlZCBleHBsaWNpdGx5LiBBbiB1cGNvbWlu
ZyByZWZhY3RvcmluZyB3aWxsCnJlbW92ZSB0aGUgY3VycmVudGx5IHVzZWQgdHJhbnNpdGl2ZSBp
bmNsdXNpb24uCgpBZGQgYW4gZXhwbGljaXQgaW5jbHVzaW9uLgoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKaW5kZXggYmQ2Y2E3ZDc2OWRhLi4wZjQy
MTAxYWQ5MzUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwpAQCAtMTgsNiArMTgsNyBAQAogI2lu
Y2x1ZGUgPGFzbS92ZW5kb3JfZXh0ZW5zaW9ucy9taXBzX2h3cHJvYmUuaD4KICNpbmNsdWRlIDxh
c20vdmVuZG9yX2V4dGVuc2lvbnMvc2lmaXZlX2h3cHJvYmUuaD4KICNpbmNsdWRlIDxhc20vdmVu
ZG9yX2V4dGVuc2lvbnMvdGhlYWRfaHdwcm9iZS5oPgorI2luY2x1ZGUgPHZkc28vZGF0YXBhZ2Uu
aD4KICNpbmNsdWRlIDx2ZHNvL3ZzeXNjYWxsLmg+CiAKIAoKLS0gCjIuNTUuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
