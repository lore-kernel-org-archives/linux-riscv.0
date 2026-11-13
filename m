Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B57606A882
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GCb9cI8Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ev7eE77o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c9dBZJxfg41EiHEcUzZqI/Yjei04mHkI1LXbFjqnTfw=; b=GCb9cI8ZuVycjqer0S4vE91j2C
	318i9Plffg6p/iDW9AVrOngQbUEF4l3hFiSVLI4yO1FlkAQR4jMrBDco/O/oqmof3L60bXBAAgWlZ
	klU4y3Qi5WzpOopi6oHabDBG9oq91a6FLBlQy1qsjZoaFdSO++oWk2qBTtA6jf6nb7WPYCE+si83i
	zbJ1oxeMcfscdCgiEBAkioVJJRtd96GFDHGeJjDa2lrSVw6RiFFRsEPydAIG4o4JLC2iLp1W57kvl
	xAjFX5j1RrIRy24xY9poI4bkneYWScSiJVAU2+k1z9SXC0DIuriScY/oYeSJ4AH3rfjt6OKpLZXNG
	YvO+bD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRupw-0000000DhaX-3g6q;
	Fri, 13 Nov 2026 17:13:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRupq-0000000DhVk-3Rsr
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 17:13:13 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so656857f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 09:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794589989; x=1795194789; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
        b=ev7eE77otx11bFO4yDSqVHJQ6PCINMdTqpJMRISoajwN8vhe0jGeSlkhsVUQ4VV5P+
         Tq2oB4x8vGet/k7pl8As2N1CpVVJ+xy7oILT1Ixn9SU1C6/bGXrXK0lXkYdyGcpRH7RL
         fEwrFc84KiVIJCk9cMc/oB2+MrwWZT7bcVpcBJ32S8s6+nJR/DAoZd6CiHnlPDHg7Utu
         UOZC98rukj2bNDs5gtJcyU0C5Mygmua3CxjYhq+GcRj1QoRc3jpKXLntOJeebly22ORf
         thPdZRY6qVdwLIh901s1rpF2XfwlYnWVHyLb1GUbUDOmODR263cXMKBZTsvYnWj7wtNC
         JU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589989; x=1795194789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
        b=L9TLzL1z16gg8uu6I798CCeeggiH7npbt70J1TNKlBw96deDZFs+s8BskzUX3wKVSZ
         N61hybIeIHqmDNIipWDvEZBg/lnoQrhdWZRUnfCoDGxyl2gI6zrZuBPnVcLP5MRutzJb
         B24zbUjXrrANVK3clE7A/3DzjQYtj84V8swGsQ3YwCa5UvralYzT7JpIAV9E7t3A24xc
         Qk2JjEStldfCMfW/oGLG+6zFLtgz430cAUgWn5yndqojhtDBLPB2iSjM9LGGiAPHqwp8
         9ykHqv5jqnzoM3kzdg1R9P0Dz9l6v30w4MG4IrEDSTPf000M34z2XCSOqPI4T9g4LmZ0
         suDg==
X-Forwarded-Encrypted: i=1; AL+hErHhfc/fIhLOS0r9wwzTN4bhZsOvauOKyao3y/M3BmtHAfWf6f1YMYuSrGxb1qyrmSaIhMtuxfGdsjz/Kw==@lists.infradead.org
X-Gm-Message-State: APuU4Z87nAkYWHUYdI2FZnvCfgYl3tAakUrYGPnegvgXFa+pgdGqNfV9
	zlN0h8tEIcefxgt5dx5fFg3H5a2zspsOuUuYJdmn1mlosK+y9UwBJetiTi70zqbZzQSD
X-Gm-Gg: AYBFou0HiyIWkq0v3Mc0+xndQSPmcYHXQikJRjtspy4XBMMcukMVNJQ5esFG+hqnllj
	CXr7AgEZrbudn+L6ES8B1zV4YWtJ1QLjeUPneB+Z7Y4OWY3W6Q5+uJzkLWcjBDtu1YqQEIiPzGg
	bKMcaT8g+2NdsK0OqWID8GN0B++mNh0HRgFKQBwoVu129gDt2VccOW19jD9/8hNHMU/fNpCQcdf
	1L08Q1ZgZa+wMbS7hQTT0gXFhMkw22PIP6eQ5MkvMNG1XrVrlwMUfSLO/tFfGtZ5oWfyWhu1W0N
	CxVmNH0TJqIqqvrAdX4x5l+IwW51/cURMoJ4bkINdbikqqePp+TAhf5zncMydEtj+ldJQ4QKF6h
	hQ+cssVu3dM7ISCE2T0/r9u0I07hd2SnnaaRrDvhEDTPctT3hZtSfFbq141L+OjsTVvehXRc6Hz
	HER/LQAXaUl/eZhXuP2Fsh4yYj3G8pkQszRPyD/LOPQbfJQUUuvkrIOCE1ox1GqSrPqFI1kWAk2
	zfC5NTQALFP9+fh7h9agv97bjvUlzIqxHrKHTEUfFrfhpEvPcYqVhFzJPPmOqCCPQab7p7PoqOP
	IBR60T0D9muDa5G24seWgxd3HMxf14v3Dw==
X-Received: by 2002:a05:6000:2f82:b0:48e:4e3e:45fb with SMTP id ffacd0b85a97d-49c73631148mr6928682f8f.22.1794589988794;
        Fri, 13 Nov 2026 09:13:08 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:b5a2:ed52:66a7:3ac7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6001643f8f.12.2026.11.13.09.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:08 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Fri, 13 Nov 2026 17:12:55 +0000
Message-ID: <b50bad38d3e5c045c1c671be4c520c13760c5e38.1794589639.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794589639.git.jpeixoto@osyx.tech>
References: <cover.1794589639.git.jpeixoto@osyx.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_091310_896581_2630B951 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIGEgTUFJTlRBSU5FUlMgZW50cnkgY292ZXJpbmcgdGhlIEJhbyBoeXBlcnZpc29yIGRyaXZl
cnMgYW5kIHRoZWlyClVBUEkgaGVhZGVyLgoKU2lnbmVkLW9mZi1ieTogSm/Do28gUGVpeG90byA8
anBlaXhvdG9Ab3N5eC50ZWNoPgotLS0KdjY6Ci0gTm8gY2hhbmdlLgp2NToKLSBObyBjaGFuZ2Uu
CnY0OgotIERyb3AgdGhlIGFyY2gvKi9pbmNsdWRlL2FzbS9iYW8uaCBhbmQgaW5jbHVkZS9saW51
eC9iYW8uaCBlbnRyaWVzICh0aGUKICBmaWxlcyBhcmUgZ29uZSk7IHVzZSB0aGUgZGlyZWN0b3J5
IGZvcm0gZm9yIGRyaXZlcnMvdmlydC9iYW8vLgoKIE1BSU5UQUlORVJTIHwgOCArKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMKaW5kZXggOTNhYmJiMzE1MDY1Li5kYmVhMDgxNDQ3ZTIgMTAwNjQ0Ci0t
LSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC00NzEyLDYgKzQ3MTIsMTQgQEAg
RjoJZHJpdmVycy92aWRlby9iYWNrbGlnaHQvCiBGOglpbmNsdWRlL2xpbnV4L2JhY2tsaWdodC5o
CiBGOglpbmNsdWRlL2xpbnV4L3B3bV9iYWNrbGlnaHQuaAogCitCQU8gSFlQRVJWSVNPUgorTToJ
Sm9zw6kgTWFydGlucyA8am9zZUBvc3l4LnRlY2g+CitNOglEYXZpZCBDZXJkZWlyYSA8ZGF2aWRt
Y2VyZGVpcmFAb3N5eC50ZWNoPgorTToJSm/Do28gUGVpeG90byA8anBlaXhvdG9Ab3N5eC50ZWNo
PgorUzoJTWFpbnRhaW5lZAorRjoJZHJpdmVycy92aXJ0L2Jhby8KK0Y6CWluY2x1ZGUvdWFwaS9s
aW51eC9iYW8uaAorCiBCQVJDTyBQNTAgR1BJTyBEUklWRVIKIE06CVNhbnRvc2ggS3VtYXIgWWFk
YXYgPHNhbnRvc2hrdW1hci55YWRhdkBiYXJjby5jb20+CiBNOglQZXRlciBLb3JzZ2FhcmQgPHBl
dGVyLmtvcnNnYWFyZEBiYXJjby5jb20+Ci0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
