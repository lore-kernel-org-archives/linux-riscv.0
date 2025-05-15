Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E949DC54795
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niCj8ldGVgphcRJKfE8gB9tJ4eZp3IqnTlprP8fetls=; b=Z7BUnaD0QE8xth
	y/Ux6kILpOgMdDNZljaRCRoC7uHTUZydYPfO0NBg+LUxXynllanq/7TSuPw8Lb+Q4r/jHT187awgH
	IsXbJ8dKgvsX7MYyUH2991f+aiWLS7jYEFMYY5wI9aOtbeoQnocZTvEnSmA0Yv8Ikm7lYkO84sCn7
	pBTJKfgqgK8DZEPMiFpg2phvFXSf4zz9GBsXSffpGe8X7/InHs12CGI7chJFUAXCU2h40yUzV/NKy
	54ByZzAJJl7NX3CyGc+awmTttQqNdwQqZgmiBi61EGA7UjwgqrxnIMlMPzrxlnuixYXp/LDssTFLL
	FUHk+FbGIeJxvC/Y6gEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyB-0000000HXhD-33gi;
	Thu, 15 May 2025 08:29:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsa-0000000HVgo-2grU
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf680d351so10533915e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297427; x=1747902227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=jf5Ty01kjdHR2w+uxYcekV/AldVuaCBKJElSN/DXBZlqdd30DWhP89Rp4gEGl40jaP
         W6YWwaz84bJFv1YFSoLeR1EANEh+wrC8bb3PDtHQR/oofJUvQT/A/W2X4mJeUDOdOlbE
         kvKlMxP9iKAcBO6vJ71V8rWDE0hFGOgyBmsMudoAOWY22B54q46S/LGqQ7ifmUZ+lOdf
         WrATWv6HJuJd3BHeZ8f8ur9Q/ER+6BoG3hFkVApJCAhdoAqZNXGFCsTgqJfFmuhYZqfL
         ZISNRC8TluT/ebhyCh+FOYV43qPnFyWXWXcFFhc5Kqaaoj2Tf4Cf0Lu2cMrLVm58O679
         SKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297427; x=1747902227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=JqDoVJodgJR8CTDjzCkWJPeCccBcW1UXzYAdKS7pBEX2isELoh+jjDqBw5Fjsv8tW+
         0n1f1Hl3HWvAASViWx+0C436mB85P11upxj0RHdCdNcc14xKeLm2grsHIKEZhShH2EIf
         qov+hv/LJVbdDMZIghXuzn15JzrhkEFK9bTC0qPDmLx2nxPd1IcGDB9ubkpO50cxCA1D
         QCa25n0LZLW+h74kJt+gp8OphqLvat1yjml4GKIp5LvpGdNKhl6Arw4A29J5pftHJuH4
         eWubUuiUOBcbob+YaB18j/qxWBNZ5Ai8XCMZJWtZ0OKrlMoZoUIQ0eMNbgviGI37TPuT
         s51A==
X-Forwarded-Encrypted: i=1; AJvYcCV6YibFPx6Iz0PIB7+pbXNujph8CmEWYckfTssFeM1L5ebtmFJfDELanhLF4GxFYdbckJGEE55Q4YLh6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhefWsrQjsTHoQjRa3OJWw8D0BxI2H3jW6goihDQCottpAdL2H
	A0TLyqagXEAAV5thQHx5+f/3ES1BUKDCD3lHzLC7JlSMjCt/+0orS1vF+xxDTCE=
X-Gm-Gg: ASbGncu7vLZRmczDTnhz02j01kYm54vIus28W59VI1vA51fZ7QAt8ag4hppM5kOvXr3
	iHlqUU5xGahFHK1qRvZ/e4xEGVhiQKcDq21p+VEVbKCuyf2vimKeK8gl+vN6MxY007unabl7J+N
	ir48+/XJisgCEMFTBB0G0NVtPfxWPJxUETj+4a356X65lEqAmgSpGZXfDYE8INaO9GopiPIvogX
	iv9LZbix/n433uILpG86WGnR2KuY2/Ix86GyTXaCAhH0AMRW7qdE8rYX+M/4+9kMNsayk7j+6v5
	tWhLVOZM3Z61z5EH/wDTXbYJRbyg5ClsC0AEppha7yOQt3hbvqo=
X-Google-Smtp-Source: AGHT+IHkZNQbpAw1wphnseKXwk4yMRcZGss2iiWcC12RxGFa4TAsYttDPas1NVsjc2nqofvNADAfDw==
X-Received: by 2002:a05:600c:828e:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-442f850c4f5mr24840985e9.13.1747297427334;
        Thu, 15 May 2025 01:23:47 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:46 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 03/14] riscv: sbi: add new SBI error mappings
Date: Thu, 15 May 2025 10:22:04 +0200
Message-ID: <20250515082217.433227-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012348_677193_CF0E2B98 
X-CRM114-Status: UNSURE (   7.85  )
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

QSBmZXcgbmV3IGVycm9ycyBoYXZlIGJlZW4gYWRkZWQgd2l0aCBTQkkgVjMuMCwgbWFwcyB0aGVt
IGFzIGNsb3NlIGFzCnBvc3NpYmxlIHRvIGVycm5vIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+ClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8
YXRpc2hwQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwg
MTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaAppbmRleCBiYjA3N2QwYzkxMmYuLjA5MzhmMmE4ZDAxYiAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ni
aS5oCkBAIC01MzYsMTEgKzUzNiwyMSBAQCBzdGF0aWMgaW5saW5lIGludCBzYmlfZXJyX21hcF9s
aW51eF9lcnJubyhpbnQgZXJyKQogCWNhc2UgU0JJX1NVQ0NFU1M6CiAJCXJldHVybiAwOwogCWNh
c2UgU0JJX0VSUl9ERU5JRUQ6CisJY2FzZSBTQklfRVJSX0RFTklFRF9MT0NLRUQ6CiAJCXJldHVy
biAtRVBFUk07CiAJY2FzZSBTQklfRVJSX0lOVkFMSURfUEFSQU06CisJY2FzZSBTQklfRVJSX0lO
VkFMSURfU1RBVEU6CiAJCXJldHVybiAtRUlOVkFMOworCWNhc2UgU0JJX0VSUl9CQURfUkFOR0U6
CisJCXJldHVybiAtRVJBTkdFOwogCWNhc2UgU0JJX0VSUl9JTlZBTElEX0FERFJFU1M6CiAJCXJl
dHVybiAtRUZBVUxUOworCWNhc2UgU0JJX0VSUl9OT19TSE1FTToKKwkJcmV0dXJuIC1FTk9NRU07
CisJY2FzZSBTQklfRVJSX1RJTUVPVVQ6CisJCXJldHVybiAtRVRJTUVET1VUOworCWNhc2UgU0JJ
X0VSUl9JTzoKKwkJcmV0dXJuIC1FSU87CiAJY2FzZSBTQklfRVJSX05PVF9TVVBQT1JURUQ6CiAJ
Y2FzZSBTQklfRVJSX0ZBSUxVUkU6CiAJZGVmYXVsdDoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
