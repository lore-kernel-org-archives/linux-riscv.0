Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EF3FDEE52
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 23:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BBsswKXhrp7/cdkIzDTy/vWz6xxwaIInRwj0iuxvHZA=; b=qssbrl+Yyvj0jF
	2mR1iR6WgA4MhqLYo0eTwWeHe++oHxrONdm16utg4VBlgW6cpVTpH8Fdi32M0PHF7P1lSAI3+zcRP
	YOlvU0UVAqUbtXjVNJREGSPEIKh25BUfZNMKdQQvogDy+gX6+DnhM5DQxzORel0E5oNkVm82dVBrW
	cEKJerhoZulNKJwkQpT0eYMCFuas2S7+YvAgeyihrgGo1EidhstMmdtpLETFMGp2wfQYOR7uPsUEN
	C9hbWBj/wqWKykb/RQkPV0Hz81V1c6v0AWDlFdZ70v35TxHSQJ7KaQTGEP89Y2/tIe9t/86jF2y6g
	5IIaFr5BFf5d1nLqwrVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG35z-0000000COlL-0nSX;
	Thu, 23 Apr 2026 23:04:31 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG35w-0000000COkf-3TRZ
	for linux-riscv@lists.infradead.org;
	Thu, 23 Apr 2026 23:04:29 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so7711453e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2026 16:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776985466; x=1777590266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9RlDzCHwvVoLD/T1N26pKp2/i9mgbsKP9KFqAoWnRc=;
        b=RHteX7qQNaCMF6rhnpyGLdRUU1AFQGIkxhbAS9SYVuu1qu/J1ayIH7L6thcnv/1wPm
         l+XXOMFe+6XneHKpKkSna6MxxNEWe6ft+GbbC44C2xE8PTxbgWDGclb5l/fHYcPWIC2v
         9ZR75OtDclOBIqtUMBSiVkIxnxRZtOp4tZh+syDA3WG9KTuB5cwUBgYLXHOpyB1Frg2Y
         KDohUV+bG+R4m0S/H0pW42WfdduOFhPiY+8MCktkg0dzNAcMvM8S68vWiKj5fvjMhG0Y
         l0Kv3k81dXeTu6gpMKbc0FmJ/R9u5shCvKj7g4vngTJzuPtJtr5rQ38s6izcQ4m+9iUj
         UwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776985466; x=1777590266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9RlDzCHwvVoLD/T1N26pKp2/i9mgbsKP9KFqAoWnRc=;
        b=hWj7t6xS3N0O2jvjQp3GH2FqDP9cEqydpf/HCZLS/rS3TE4S8OtcYz4RqjmrSoBBxM
         g6a5G5zIeFzdCJdkrrnx+imhfisbaKMjHLPdmwnT+Qv5cXVB05+ZReVnhGf5mLbXBRHL
         3oRZ9NQ2XQAR3ntzzTgJjEsvQg2D/kBa5l4ZAjfX7ul0sbK1HEQASinOGQdzsUMucXHH
         cMhtDzHun/iBBm+RkMmc8Opi3pdJ910nj8lhRKUHf9gnOjsySMdreiI/V0/jztSIjjp+
         xzKlshGPkkkfIyivr1Np5WJDNFlaokiCWFFiL27Us5vl+bJAPLVFhsO5rao2qKy3Yc1y
         2sJg==
X-Forwarded-Encrypted: i=1; AFNElJ/7dCJAoWopgd6QI8JwbLQXrBI7bfdW07fKG17i0RPWTv/pcwZdKcMBvxCwUIOqGKvCBbspoR/AWJf7uA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1snm1Xz4z5Ob9WllPqquVsbBp0q8kjECaaweo2A9ccxpHIj++
	SHLiI09KRWJGFNQTzy6cdweBLnubAJXuTNvH8balzOXi/JrHWm2YfA/s
X-Gm-Gg: AeBDievnvSYVmFzyaKHCE7UGgj6dHUH/eI/D/TfIW65Kdekjzg0gQsj+fPajqEieITP
	46qEFoCAPTOdKmvwnk9jRGVv/ygzBiBTC7SlLhhiU0Zls1Db4A0o40k572WlQUBW30WSD92Yi8y
	V35zk2322TTBvybrmqr8sFOc1C9cRsblWTpUVhKivCIXbQ2zlsKrzizj0ggLTe5zGtJ6MwITekx
	vj6GUK0oZXPldeD9+lx2Puu3SONprmY8YEr20UQohz3M5RSzPIvYwVlChmiIVRAVZy8r/qZwqSV
	gX4qYlU32XuDaV4wJZlk8HOI6uNjn7b43XDeBVxel+H0joJSyDgV6YdA68Hom66ao0Ar4Ptm3mr
	2IEnHDzmzI8NRx2eFzIlRCIIgy0WV/DUtddhLzP2fB32v6Z2o/bfzf2R2rSFWJfUqsNzP8R+LHZ
	fTB/LM3SFUHXSXjs60Tiq2CZPVFce7D6I+D8ZrEPyL39Dv3Qy0FvvL6gro
X-Received: by 2002:a05:6512:1282:b0:5a4:6f5:6c4e with SMTP id 2adb3069b0e04-5a4172d389fmr11928940e87.19.1776985465575;
        Thu, 23 Apr 2026 16:04:25 -0700 (PDT)
Received: from wpc (host-95-152-45-178.dsl.sura.ru. [95.152.45.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm5567888e87.30.2026.04.23.16.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 16:04:25 -0700 (PDT)
From: bigunclemax@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yixun Lan <dlan@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 0/1] reset: gpio: Add support for GPIO providers with #gpio-cells=3
Date: Fri, 24 Apr 2026 02:03:34 +0300
Message-ID: <20260423230338.442497-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_160428_892224_A93CB535 
X-CRM114-Status: GOOD (  14.63  )
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

RnJvbTogTWFrc2ltIEtpc2VsZXYgPGJpZ3VuY2xlbWF4QGdtYWlsLmNvbT4KCkhlbGxvIGV2ZXJ5
b25lLAoKQSBsaXR0bGUgYmFja2dyb3VuZC4KSSBoYXZlIGEgQmlnVHJlZVRlY2ggQ0IxIGJvYXJk
IGJhc2VkIG9uIHRoZSBBbGx3aW5uZXIgSDYxNi4KSSBkZWNpZGVkIHRvIHRyeSB1cHN0cmVhbSBM
aW51eCB2Ny4wIGFuZCByYW4gaW50byB0aGUgZm9sbG93aW5nIGlzc3VlOgoKWyAgICAwLjQ1MzI5
N10gcHdyc2VxX3NpbXBsZSB3aWZpLXB3cnNlcTogZXJyb3IgLUVOT0VOVDogcmVzZXQgY29udHJv
bCBub3QgcmVhZHkKWyAgICAwLjQ2MDQ3Ml0gcHdyc2VxX3NpbXBsZSB3aWZpLXB3cnNlcTogcHJv
YmUgd2l0aCBkcml2ZXIgcHdyc2VxX3NpbXBsZSBmYWlsZWQgd2l0aCBlcnJvciAtMgoKVGhpcyBl
cnJvciBwcmV2ZW50cyB0aGUgV2lGaSBjaGlwIGZyb20gY29taW5nIHVwLgoKSSBzdGFydGVkIGlu
dmVzdGlnYXRpbmcgYW5kIHRyYWNlZCBpdCBkb3duIHRvIHRoZSBmdW5jdGlvbgpfX3Jlc2V0X2Fk
ZF9yZXNldF9ncGlvX2RldmljZSgpIGluIGRyaXZlcnMvcmVzZXQvY29yZS5jOgoKLyoKICogQGFy
Z3M6CXBoYW5kbGUgdG8gdGhlIEdQSU8gcHJvdmlkZXIgd2l0aCBhbGwgdGhlIGFyZ3MgbGlrZSBH
UElPIG51bWJlcgogKi8Kc3RhdGljIGludCBfX3Jlc2V0X2FkZF9yZXNldF9ncGlvX2RldmljZShj
b25zdCBzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzICphcmdzKQp7CglzdHJ1Y3QgcHJvcGVydHlfZW50
cnkgcHJvcGVydGllc1szXSA9IHsgfTsKCXVuc2lnbmVkIGludCBvZmZzZXQsIG9mX2ZsYWdzLCBs
ZmxhZ3M7CglzdHJ1Y3QgcmVzZXRfZ3Bpb19sb29rdXAgKnJncGlvX2RldjsKCXN0cnVjdCBkZXZp
Y2UgKnBhcmVudDsKCWludCBpZCwgcmV0LCBwcm9wID0gMDsKCgkvKgoJICogQ3VycmVudGx5IG9u
bHkgI2dwaW8tY2VsbHM9MiBpcyBzdXBwb3J0ZWQgd2l0aCB0aGUgbWVhbmluZyBvZjoKCSAqIGFy
Z3NbMF06IEdQSU8gbnVtYmVyCgkgKiBhcmdzWzFdOiBHUElPIGZsYWdzCgkgKiBUT0RPOiBIYW5k
bGUgb3RoZXIgY2FzZXMuCgkgKi8KCWlmIChhcmdzLT5hcmdzX2NvdW50ICE9IDIpCgkJcmV0dXJu
IC1FTk9FTlQ7CgpBcyB5b3UgY2FuIHNlZSwgYSBHUElPIGZyb20gY29udHJvbGxlciB3aGVyZSAj
Z3Bpby1jZWxscyAhPSAyIHdpbGwgY2F1c2UKYW4gZXJyb3IuCgpVbmZvcnR1bmF0ZWx5LCB0aGUg
QWxsd2lubmVyIHBpbmN0cmwgaXMgb25lIHN1Y2ggR1BJTyBjb250cm9sbGVyLgpJdCB1c2VzIHRo
cmVlIGFyZ3VtZW50cyB0byBkZXNjcmliZSBhIEdQSU8gbGluZTogYmFuaywgbnVtYmVyLCBhbmQg
ZmxhZ3MuCgpIZXJl4oCZcyB0aGUgRFQgZnJhZ21lbnQgdGhhdCBkZXNjcmliZXMgd2lmaV9wd3Jz
ZXEgaW4KYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2MTYtYmlndHJlZXRl
Y2gtY2IxLmR0c2kgZmlsZToKCndpZmlfcHdyc2VxOiB3aWZpLXB3cnNlcSB7Cgljb21wYXRpYmxl
ID0gIm1tYy1wd3JzZXEtc2ltcGxlIjsKCWNsb2NrcyA9IDwmcnRjIDE+OwoJY2xvY2stbmFtZXMg
PSAiZXh0X2Nsb2NrIjsKCXJlc2V0LWdwaW9zID0gPCZwaW8gNiAxOCBHUElPX0FDVElWRV9MT1c+
OyAvKiBQRzE4ICovCglwb3N0LXBvd2VyLW9uLWRlbGF5LW1zID0gPDIwMD47Cn07CgpQb3RlbnRp
YWxseSB0aGlzIHByb2JsZW0gY291bGQgYWxzbyBiZSBvYnNlcnZlZCBvbiBvdGhlciBHUElPIGNv
bnRyb2xsZXJzOgpzcGFjZW1pdCxrMS1ncGlvLCBtaWNyb2NoaXAsc3Bhcng1LXNncGlvLCBhbmQg
bWFueSBhbGx3aW5uZXIsX19fLXBpbmN0cmwKdmFyaWFudHMuCgpJIGF0dGVtcHRlZCB0byBtYWtl
IGEgcGF0Y2ggZm9yIHJlc2V0L2NvcmUuYyAobm90IHByZXR0eSBpbiBteSBvcGluaW9uKQp0aGF0
IGFkZHMgc3VwcG9ydCBmb3IgdGhyZWUtYXJncyBHUElPIHBoYW5kbGVzLgpCdXQgaXQgc2VlbXMg
SeKAmXZlIGZhbGxlbiBkb3duIGEgcmFiYml0IGhvbGUsIGJlY2F1c2UgbmV4dCBJIGhpdCB0aGUg
ZmFjdAp0aGF0IGdwaW9saWItc3dub2RlIGV4cGVjdHMgR1BJT3MgdG8gYmUgZGVzY3JpYmVkIHdp
dGggZXhhY3RseQp0d28gYXJndW1lbnRzIChzd25vZGVfZ3Bpb19nZXRfcmVmZXJlbmNlKCkpLgoK
SSBhbHNvIGRpZCBhIGdpdCBiaXNlY3QgdG8gZmluZCB3aGVuIHdpZmlfcHdyc2VxIGJyb2tlIGZv
cgp0aGUgQmlnVHJlZVRlY2ggQ0IxLiBJdCB0dXJuZWQgb3V0IHRvIGJlIGNvbW1pdAo3M2JmNGI3
MzgxZjcgKCJtbWM6IHB3cnNlcV9zaW1wbGU6IGFkZCBzdXBwb3J0IGZvciBvbmUgcmVzZXQgY29u
dHJvbCIpCmluIHY2LjEzLXJjMS4KClNvLCBpbiB0aGVvcnksIGEgcGF0Y2ggdG8gcHdyc2VxX3Np
bXBsZS5jIGNvdWxkIGJlIG1hZGUgdG8gZml4IG15IGlzc3VlLApidXQgdGhhdCB3b3VsZG7igJl0
IHNvbHZlIHRoZSB1bmRlcmx5aW5nIHJlc2V0LWdwaW8gcHJvYmxlbS4KCkkgZG9u4oCZdCBrbm93
IGhvdyB0byBwcm9jZWVkIGZyb20gaGVyZSBhbmQgSeKAmW0gYXNraW5nIGZvciBhZHZpY2UuCgpC
ZXN0IHJlZ2FyZHMKTWFrc2ltCgpNYWtzaW0gS2lzZWxldiAoMSk6CiAgcmVzZXQ6IGFkZCBzdXBw
b3J0IHRoZSBHUElPIHByb3ZpZGVyIHdpdGggI2dwaW8tY2VsbHM9MwoKIGRyaXZlcnMvcmVzZXQv
Y29yZS5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgotLSAKMi41MS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
