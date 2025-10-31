Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011E6CCF9FA
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 11:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ItB99rUtvGkOv92FCLJjDuAzL3UmrvpGzfgQPJ2YMGc=; b=rEgcJaI2EiZo8f
	LgtlX45dz2K+9B+Cqu4YOA739AHYFR0ODXpzNq0h5ipWchxhS6+PDblwbHwrUVRjjnpst1/h0cEYj
	Zv0dMrpdM3zqq/ztAomT9hIZVqYT8ZwNwwHUJeNVm6wwVRUxfHLIUl+jwsrVx7c1cU9n+JrnFZ5R2
	lUqfPPDOKIy+aAxCZOHhf/QciIf/mhV1Oxw6VRSbXoFJnOSI0OWLtgaYnn1mJSVZehEJrDYJM81su
	iw9BBwk+Ltsr8EpoW+WfCtkwhDVgsRYE+svKWeqG9MSLKz7zr2zYoCFFWQyl0AnXcs8rdpKVEPSgi
	8qXczvITcxQV0BSG4z9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnID-000000061PD-282a;
	Fri, 31 Oct 2025 11:27:41 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnIA-000000061OV-091a
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 11:27:39 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-781010ff051so1690391b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761910057; x=1762514857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=841lRTZT5x+EU23D4TPPYc3iU3UALNZmZRcvpFA9gCE=;
        b=DBAo2RYp4JgsXAmtIzJKH0LFvbkZP+c8im1J2tz8fWpj4BM8+7nVjg/y9ZYcSwYtPB
         EFx5zLMaQVed4PNN16y0WMMSXavKaHOI7RrfS5kihnPU/COFwXU1qrI//iYJfNYewOGe
         Cdw9I/GxotN/ynVNeLxmk4JFlwnRcdK7SImvUEB+vYvxBnM1ioycOXxZF90vtqnC0opI
         9i5eJSZATNBe4K4MTIjAvjvsEmk4zfIWTmS6JI3FAlPj6Bi11zjsEzHMiHKsVilwSDg1
         dJ/iSAqj/DgRLtNW1Q23uuB2u+QhU1krgrqjA8CaNSGar9/UF+oGKBfo3R8mQ7lHlK27
         q8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761910057; x=1762514857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=841lRTZT5x+EU23D4TPPYc3iU3UALNZmZRcvpFA9gCE=;
        b=VGoTUE6Fn4BafyIeF+ffYjmrG7nOBCFQUK+uvcpn746jn9uAmfUhzlLt/goYU/nlBm
         CA0M40dp3vrJHSZwa8xB68oGlQx5pRirRSXtRhj8CHhCZfB3mizYKxTsH3e2bT9crIYa
         fDmAWhMB/CMnXevW1N9kLG0D84P34HMmlMSpwQZN8B4PB9QfVDCZT/lhAzZ0kiOqoFUG
         BwBEngInkP99CBYz7MD5zxV+1hkSiuJ7krEbY177QLItXgiuBcwQfsyMON1uip8Vq+jB
         0JnSdWg2JhpfVAzw2UeHQYcxd3yVkICRxXabAyxJ4FCyAJAu+kmAS9BuLiRGONEoxfdL
         GE0A==
X-Forwarded-Encrypted: i=1; AJvYcCWOAWJINuNGoVYnS7vKaE0gjv0K63JIykFC9THyI5ny/iGpbORwoSnCsG6iHQ+Qze4YAIz15B2MfqoICA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4tOo5ZB3vYAY/GdWFJVrBjJpJw1g6al7krWStdg2trhsVqPJh
	T4IgiSF8NRVQk1+haVtRWvGOuNEJVPnZQlszi2ynD25vFjkxC111qLk1
X-Gm-Gg: ASbGnctZdF0yNDyIE/IbL+J1l4x9yfU6I836lW9HdYVuYXfLIShlXe2s2GkqFPfpz9A
	auBFdqiwocL5fijEHB5qoZz19vTpXd7S0B3s7Am/nqfSMUqJfv35mLeHYRR0qbpqr8VwuzmONsj
	Yorvo1/t9nJS9xaE0Gr0VMMrr2PaRok6NT06lGDSAH2GhasFc0tN2wR31gxN51UYxv9ALjmo+S0
	ADxiAv6BvX5gslGVegAWnOvZFh39J8NP+GUFJko4ZtSY3Hr4d6x7yH1tnWA4aciFDuVi41N4N/7
	CWIstioAXl11F4dD4+bSH9r6ajQWRf1mtetc4IKZVv8CVxs+3wvZGi6iZpWIaNKu1qeqbCY/kQu
	a1WqDFUGwxduxJg1Mx9tzEw/UWe7KDza+N0B6xTq+GoxSbLfUcNfEZ8K94sFaUlDqZluCRRfICt
	NOvyqivi4yOLw=
X-Google-Smtp-Source: AGHT+IH9hYEkyK3AXZ+IMp9m3KiAHOe4yc444P5qMkA/mzNCRPgTC75k9sFDT03UAxG/sZ06ANMb+w==
X-Received: by 2002:a05:6a20:258c:b0:2d8:ce9e:87a2 with SMTP id adf61e73a8af0-348ccdfd2cdmr4592558637.57.1761910056860;
        Fri, 31 Oct 2025 04:27:36 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf44dc8esm1827291a12.35.2025.10.31.04.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:27:35 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 094144209E4A; Fri, 31 Oct 2025 18:27:31 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux RISC-V <linux-riscv@lists.infradead.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Subject: [PATCH] MAINTAINERS: Remove Albert Ou from riscv
Date: Fri, 31 Oct 2025 18:27:03 +0700
Message-ID: <20251031112702.41271-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=bagasdotme@gmail.com; h=from:subject; bh=ILQo4TDpqVd/Vz4HeogVsmkzW+Qi7czkZpkAAN/N6kk=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJksc6QmeZ96rKO2kH0W45Hn8yz2WS/6K2Zy5c5P2X8KD 7boS9q96ShlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBELBIZ/kp9fnl/59yp3F1v D61MWvjRU+Gy5DK2d0neU055dMTVuaYz/E/Z1fZra6XOohvssxXltGorq31CKzY9yee/rf6z9IL ySRYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_042738_100488_53B79DE1 
X-CRM114-Status: UNSURE (   9.96  )
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

RnJvbTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KCkFsYmVydCBpcyBu
b3QgYW4gYWN0aXZlIG1haW50YWluZXIgKGhlIG9ubHkgcG9zdGVkIG9uIExLTUwgdGhyZWUgdGlt
ZXMKaW4gMjAxOSBbMV0pIGFuZCBoaXMgaW5ib3ggcmVqZWN0cyBhbGwgZW1haWxzLiBSZW1vdmUg
aGltIGZyb20gdGhlCm1haW50YWluZXIncyBsaXN0IHRvIHB1dCBhbiBlbmQgdG8gZXZlcnlib2R5
IHdobyBpbnRlcmFjdHMgd2l0aCB0aGUKcmlzY3YgbGludXggbWFpbGluZyBsaXN0IGZyb20gZ2V0
dGluZyBzcGFtbWVkIHdpdGggcmVqZWN0aW9uIGVtYWlscy4KCkxpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvP3E9ZiUzQWFvdSU0MGVlY3MuYmVya2VsZXkuZWR1IFsxXQpTaWduZWQt
b2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1i
eTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI0MTIwNS1yZW1vdmVfYWxiZXJ0LXYxLTEtMTdlYjg1MGYxNTQwQHJpdm9zaW5j
LmNvbQpbQmFnYXM6IFJlYmFzZSBhbmQgYWRkIGxvcmUgc2VhcmNoIGxpbmtdClNpZ25lZC1vZmYt
Ynk6IEJhZ2FzIFNhbmpheWEgPGJhZ2FzZG90bWVAZ21haWwuY29tPgotLS0KcmlzY3YgbWFpbnRh
aW5lcnM6IFBsZWFzZSByb3V0ZSB0aGlzIHBhdGNoIHRocm91Z2ggZml4ZXMgYnJhbmNoIG9mIHJp
c2N2IHRyZWUuCgogTUFJTlRBSU5FUlMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAzZGEyYzI2
YTc5NmI4Mi4uYzI3ZDhhZDY2NzdjNTcgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01B
SU5UQUlORVJTCkBAIC0yMjA4NCw3ICsyMjA4NCw2IEBAIEY6CWFyY2gvcmlzY3YvYm9vdC9kdHMv
YW5kZXMvCiBSSVNDLVYgQVJDSElURUNUVVJFCiBNOglQYXVsIFdhbG1zbGV5IDxwandAa2VybmVs
Lm9yZz4KIE06CVBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Ci1NOglBbGJlcnQg
T3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KIFI6CUFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0
aS5mcj4KIEw6CWxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKIFM6CVN1cHBvcnRlZAoK
YmFzZS1jb21taXQ6IDJlNDQ4NTY3ODM5YzY1NzY4NDg2ZDU2NjEyYzg4Y2IzMjdkMjYwNTAKLS0g
CkFuIG9sZCBtYW4gZG9sbC4uLiBqdXN0IHdoYXQgSSBhbHdheXMgd2FudGVkISAtIENsYXJhCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
