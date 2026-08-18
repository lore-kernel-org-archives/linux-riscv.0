Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0518C5DF81
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 23:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LbQ+yPHMLEh9mva/KbC1Qi2+/DirOHRzuCdasUkltAk=; b=whg
	W7onxCEAQvGbANXl1j7elM4OO0TEzWMX2h15sxVEYJqAVQLDE3GYCssbiUc9/jYgPmZOuOKXilVwH
	CzfGGufgSJH7KS3nMOfcZJVIBVyeAIT8PeoFPTrU8WvKC0TXFKA/OvNAzwP5ti64E0ARJ/SecpyAW
	uqkS8dV0LiFySfBbDKt/trAe8YesygkPvdBC8nXt3pXfhbuMNnCp1YFAhxwD5pJf/FODG59sOmlTt
	/MQoQK1XMiULQAAXLI/KTpK4UD0TIWvvegbfPRAcEr0XIdtbMDZRxTSzWE+/lb/Iroi8/9ykNugf9
	wmOD+51Kns9IMkgjay1uX5c8T5B1Tpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwT3f-00000008l0Z-3qEF;
	Tue, 18 Aug 2026 23:17:27 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwT3c-00000008kzi-3aeO
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 23:17:26 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-84859a64079so682411b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 16:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787095043; x=1787699843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Us4VG+LG3CItnApG3/Giy5h2nvbYWbtv9395p9c5DHg=;
        b=dREiTctl817a4NEOg4uic9NfDhl8ESjLyGaGUcBF6zo7r8xw1Ck3nIcONaBjCLO0Qz
         woo3puYoEDS6YfJlZ4EL+mCty6VgFRVOJJwLlwQU34fZaTiZGyFvJIJF7pdHalJuvrQM
         gX4GLb3QfZ7O+TzZvOGwCNAfkoZETj6BM3uOU0NInqJ8MEN0oW0bDe153eZiKyl5yMdC
         TcVTnOG1rNDVwq7QUmr07GnvbE0GOj6Q43CHJMNgZViIMTkRIc1tpCwx03LhEld15FCP
         RLCejrvfa8HewJF92/7dsvyQtXm+tjTaWUcOG08T+AxuDhQNgsnxAjIlSKNpM8vJBRrL
         BhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787095043; x=1787699843;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Us4VG+LG3CItnApG3/Giy5h2nvbYWbtv9395p9c5DHg=;
        b=Zb3PUt69PdRKxw46R5+edmD2hGQ0CDXrb9GPdCBJRj024b62xhkonljNNH4sJsHP8R
         FxpkgKbdhd8rWg0A9x1ikePsJGEypcQL+cFEm0qs82vo8VumuJ7ICn/Gdendr14PdfFa
         /+OvEFyyjTjF82qfaKQNDGV9+xwp7l78LAA9a0KkwS9ZIrvCDXVaYEo8sI3vUvzMgSwb
         CmAGy8vvLmaelAjuV2GWMJsCeBEcfJULuJiqdIUuXoWPpAINBBWlivQLaoEE8AfPKRZU
         x3cF5oxvWeVi8lrQr9MyJ+IauKOBBc5pGFcvYCyzvbqxyLuvDWY03Mae3qsX00tZD6Cl
         Fprw==
X-Forwarded-Encrypted: i=1; AHgh+RqRPCZtUguyM2WGs9LrNvJdAVxjwSYF3dM3IXSz9chO6BPLgiKvmA2jyGnJW4FYoqmE7DdzmYRKzsR+Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaCU8PLfqSy5/Gl9YZyr1nLgrwMBBk3I9hMJvEPT3jlCWrgnTc
	S6PtNo1t7dCfj7N4JMUTXQJhByQ5b1bafF5rTeGVH3UDCmyk332SuulmpuDTWWUVC7mYD/yLhvW
	gKibbDZMk5w==
X-Received: from pgiz6.prod.google.com ([2002:a63:c046:0:b0:cbe:e4f1:a597])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3c8c:b0:84e:2722:5d9e
 with SMTP id d2e1a72fcca58-851d38399cemr351833b3a.1.1787095042948; Tue, 18
 Aug 2026 16:17:22 -0700 (PDT)
Date: Tue, 18 Aug 2026 23:16:31 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.737.g08866a6d13-goog
Message-ID: <20260818231646.804507-1-wfelipe@google.com>
Subject: [PATCH v2 0/2] init, arch: make command line size and init arg limit configurable
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: "=?UTF-8?q?Maciej=20=C5=BBenczykowski?=" <maze@google.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_161724_931706_833D4EB5 
X-CRM114-Status: UNSURE (   9.40  )
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

VGhpcyBwYXRjaCBzZXJpZXMgcHJvbW90ZXMgQ09NTUFORF9MSU5FX1NJWkUgZnJvbSBhcmNoL3Mz
OTAvS2NvbmZpZyB0bwppbml0L0tjb25maWcgdG8gYmUgZ2VuZXJhbGx5IGF2YWlsYWJsZSB0byBv
dGhlciBhcmNoaXRlY3R1cmVzLgoKSW4gc29tZSB1c2UgY2FzZXMsIHN1Y2ggYXMgbmV0Ym9vdCBr
ZXJuZWxzLCByb290ZnMgY29uZmlndXJhdGlvbnMsIGxhcmdlcgppbml0cmFtZnMgc2V0dXBzLCBy
ZXF1aXJlIGxhcmdlciBzaXplcy4gV2hpbGUgZm9yIGVtYmVkZGVkIHdvcmtsb2FkcywgaXQKY2Fu
IGJlIHJlZHVjZWQgdG8gc2F2ZSBtZW1vcnkuCgpTaW5jZSBDT01NQU5EX0xJTkVfU0laRSBjYW4g
YmUgbGFyZ2VyLCBpdCBhbHNvIG1ha2VzIHNlbnNlIHRvIGFsbG93CklOSVRfRU5WX0FSR19MSU1J
VCB0byBiZSBjb25maWd1cmVkLgoKdjEgLT4gdjIKKiBTcXVhc2ggdGhlIEtjb25maWcgcHJvbW90
aW9uIGFuZCBhcmNoaXRlY3R1cmUgaGVhZGVyIHVwZGF0ZXMgaW50byBhCiAgc2luZ2xlIGF0b21p
YyBjb21taXQuCiogUmVwbGFjZSBPcmlnaW5hbGx5LWJ5IHdpdGggU2lnbmVkLW9mZi1ieSBmb3Ig
TWFjaWVqIMW7ZW5jenlrb3dza2kuCiogQWRkIGFyY2hpdGVjdHVyYWwgcmFuZ2UgY29uc3RyYWlu
dHMgZm9yIEFSTSwgTTY4SywgTklPUzIsIFBvd2VyUEMsCiAgU3VwZXJILCBhbmQgQWxwaGEgYmFz
ZWQgb24gaGFyZHdhcmUsIGJ1ZmZlciwgYW5kIHN0YWNrIGxpbWl0cy4KKiBGaXggS2NvbmZpZyBz
eW1ib2wgZm9yIFBvd2VyUEMgZnJvbSBQT1dFUlBDIHRvIFBQQy4KKiBTcGxpdCBwcmUtZXhpc3Rp
bmcgaW5pdC9tYWluLmMgbG9naWMgYnVnIGZpeGVzIGludG8gYSBzZXBhcmF0ZSBzZXJpZXMuCgp2
MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwODA2MDYxNDI5LjQ3NDk5Mi0xLXdm
ZWxpcGVAZ29vZ2xlLmNvbS8KCldpbHNvbiBGZWxpcGUgUGVyZWlyYSAoMik6CiAgaW5pdCwgYXJj
aDogbWFrZSBDT05GSUdfQ09NTUFORF9MSU5FX1NJWkUgZ2xvYmFsbHkgY29uZmlndXJhYmxlCiAg
aW5pdC9LY29uZmlnOiBtYWtlIGNvbmZpZyBJTklUX0VOVl9BUkdfTElNSVQgdXNlci1jb25maWd1
cmFibGUKCiBhcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCAgICAgIHwgIDQgKysr
KwogYXJjaC9hcmMvaW5jbHVkZS9hc20vc2V0dXAuaCAgICAgICAgICAgICB8ICAyICstCiBhcmNo
L2FybS9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggICAgICAgIHwgIDYgKysrKystCiBhcmNoL2Fy
bTY0L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCAgICAgIHwgIDQgKysrKwogYXJjaC9sb29uZ2Fy
Y2gvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oICB8ICA0ICsrKysKIGFyY2gvbTY4ay9pbmNsdWRl
L3VhcGkvYXNtL3NldHVwLmggICAgICAgfCAgNiArKysrKy0KIGFyY2gvbWljcm9ibGF6ZS9pbmNs
dWRlL3VhcGkvYXNtL3NldHVwLmggfCAgNCArKysrCiBhcmNoL21pcHMvaW5jbHVkZS91YXBpL2Fz
bS9zZXR1cC5oICAgICAgIHwgIDQgKysrKwogYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBpL2FzbS9z
ZXR1cC5oICAgICB8ICA0ICsrKysKIGFyY2gvcG93ZXJwYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVw
LmggICAgfCAgNCArKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCAgICAg
IHwgIDQgKysrKwogYXJjaC9zMzkwL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICA4
IC0tLS0tLS0tCiBhcmNoL3NwYXJjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCAgICAgIHwgMTAg
KysrKysrKy0tLQogYXJjaC91bS9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAgICAgICAgICB8ICAy
ICstCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAgICAgICAgIHwgIDIgKy0KIGFy
Y2gveHRlbnNhL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCAgICAgfCAgNCArKysrCiBpbmNsdWRl
L3VhcGkvYXNtLWdlbmVyaWMvc2V0dXAuaCAgICAgICAgIHwgIDQgKysrKwogaW5pdC9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKy0KIDE4
IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKLS0KMi41
NS4wLjczNy5nMDg4NjZhNmQxMy1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
