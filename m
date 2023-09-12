Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610D2EE3F09
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 18:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0WXaKX1pi0Y3exQBm5I1e2VX83MC0cPJ9xdye4jzYno=; b=QO6THGtKIfcGDS
	Vh3c1cpA0AoBxKNqb1oq8j05LzdU81BOAZThMd8nHQsW8qMgAbf2jKWldXJ6fRiYmebhBQVVYQEOD
	F65VAkwRewp5tCP1+spuyGM7eOmq56Ya+aUgdmhmO0YvPqIgevqqDOUukRJqQ8LXHaV5IuH6kR+BC
	WGCHb1vqZRJjdVHpehrnrHzudXNkHVZdredp+lxb0awoXxdhlxKjYNXVm8F4LSZBcPXPvbSq4FI9e
	HRWCBm2O1/UR7wPnHf+3zFzvjfZ3Ln3ffBKIFs+IP9Dn2E1u9+yJBjni0HEfhSb3y6i3+Vd5fy24t
	76CwIfst3odCVgJfv7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7nS-003y5j-28;
	Tue, 12 Sep 2023 18:07:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7nP-003y4n-2U
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 18:07:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c364fb8a4cso54112025ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694542049; x=1695146849; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=5P792u/W+uYHVAlK3Wk+WMLaaMRTUy9AL0RSgtpOHuA=;
        b=HVPqeaJL5vylDP7F/rlByII7zye7x1RnQwnkFqHz1rNAdKzGlM6LHcVdnqNQFzBvGN
         K1j8n5JE3x/CKeA8sH+FuGY6KWDXyBkr0pdvNwYUpT8jSAvsQ8SoFZ0rg0trKQqBI4gI
         zwra0GempsPG/e/FvBVfGrWWn4syYH/QzHaYhS5RCVnlYXmUFp11/Im2xYATYeOHfQaB
         bKRk1xnbSzXdxJwTyaW7tIzJ5DsEEz1HzZUFq2gUYH5er9VmQ/+7sw1+FlB3vAbFRrLd
         z9bKBkZ97NGFAu04dyUFQvEucfBDSos5klCqCIdLijUncqfIvRXZcjwkgjwGyq9pjKYq
         5aqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694542049; x=1695146849;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5P792u/W+uYHVAlK3Wk+WMLaaMRTUy9AL0RSgtpOHuA=;
        b=uH68TB/MRLCsdcKBaVuggAiukIamOMNJVJReK9tK3AdHkVy7HwJv1hQT7urmg7woES
         jqD40t0/7r90saAxVQaMKq8jEc6Yt6DXjFwKmjhOq2mraZustPQ0CTvi4wuNgFwTMpMV
         woKQriKT6EQHauI5cPi71Vlk3lZGz7YiF0ib9GA2bNmAcafQeG5dT1DidpbH9P3VF/4L
         Vr5Ts3C3zX2f/SIS1NsroM5nlY3sxNWwqOrTDrF8hjJDjfPv971QxVO1JdsSRkp5ebzP
         EUF1UNi85ZdEnHR8TfdihQvkDhfFX2UqhSMnSjLQrvS9JSQ/LS4kWcKYVvpJvlAjgZRL
         Ddaw==
X-Gm-Message-State: AOJu0Yz/VY3jRQb0x5QGfTWuBAEoTcNTIB8rFBWiZDrJNu1g+R/OrPGf
	3ai9Zd3dWIIuIUOCDtGGVlINDg==
X-Google-Smtp-Source: AGHT+IGpM+pJjvarAfRfpZy5vCZhx9yUE6GrHEVUou3LIHgewnXUK4D3CCgLD6GhHOB6XeZsyD9kRQ==
X-Received: by 2002:a17:902:ab45:b0:1bb:1e69:28c0 with SMTP id ij5-20020a170902ab4500b001bb1e6928c0mr503326plb.30.1694542049261;
        Tue, 12 Sep 2023 11:07:29 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c14d00b001bdd51748f8sm8676588plj.271.2023.09.12.11.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 11:07:28 -0700 (PDT)
Subject: [PATCH] Documentation: embargoed-hardware-issues.rst: Add myself for RISC-V
Date: Tue, 12 Sep 2023 11:06:56 -0700
Message-ID: <20230912180657.31841-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
          linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_110731_814489_429E44A9 
X-CRM114-Status: UNSURE (   9.49  )
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

SSdtIG5vdCBzdXJlIGV4YWN0bHkgaG93IFJJU0MtViBmaXRzIGludG8gdGhlIHN0b3J5IGhlcmUs
IGJ1dCBJJ20gaGFwcHkKdG8gdm9sdXRlZXIgYSBzb3J0IG9mIGNhdGNoLWFsbCBmb3IgdmVuZG9y
cyB3aG8gYXJlbid0IG90aGVyd2lzZQpyZXByZXNlbnRlZC4KClNpZ25lZC1vZmYtYnk6IFBhbG1l
ciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRpb24vcHJvY2Vz
cy9lbWJhcmdvZWQtaGFyZHdhcmUtaXNzdWVzLnJzdCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2VtYmFyZ29l
ZC1oYXJkd2FyZS1pc3N1ZXMucnN0IGIvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2VtYmFyZ29lZC1o
YXJkd2FyZS1pc3N1ZXMucnN0CmluZGV4IGNiNjg2MjM4ZjIxZC4uYWM3YzUyZjEzMGM5IDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3MvZW1iYXJnb2VkLWhhcmR3YXJlLWlzc3Vlcy5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2VtYmFyZ29lZC1oYXJkd2FyZS1pc3N1ZXMu
cnN0CkBAIC0yNTEsNiArMjUxLDcgQEAgYW4gaW52b2x2ZWQgZGlzY2xvc2VkIHBhcnR5LiBUaGUg
Y3VycmVudCBhbWJhc3NhZG9ycyBsaXN0OgogICBJQk0gWgkJQ2hyaXN0aWFuIEJvcm50cmFlZ2Vy
IDxib3JudHJhZWdlckBkZS5pYm0uY29tPgogICBJbnRlbAkJVG9ueSBMdWNrIDx0b255Lmx1Y2tA
aW50ZWwuY29tPgogICBRdWFsY29tbQlUcmlsb2sgU29uaSA8dHNvbmlAY29kZWF1cm9yYS5vcmc+
CisgIFJJU0MtVglQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgogICBTYW1zdW5n
CUphdmllciBHb256w6FsZXogPGphdmllci5nb256QHNhbXN1bmcuY29tPgogCiAgIE1pY3Jvc29m
dAlKYW1lcyBNb3JyaXMgPGphbW9ycmlzQGxpbnV4Lm1pY3Jvc29mdC5jb20+Ci0tIAoyLjQyLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
