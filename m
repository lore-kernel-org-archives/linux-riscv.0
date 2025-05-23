Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F8FC54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niCj8ldGVgphcRJKfE8gB9tJ4eZp3IqnTlprP8fetls=; b=P0qxAinyaBIhIM
	Ijj48yCqJ6STTl9RfJHC7Owp9m/S65xzqD8Xg5AdGnJSR2KRHHTnuSoYMKVnB6NpJu0Cy/OGiJ0aZ
	KBjjIs92L3NZN7cI0mgE2+J0fMtuXlYiodPvuLkVVhHh1kWkZ+RLlxF9cCwbk0v5zIdaOCKF+wihZ
	3j83rVrKoEoCFevkYe0usEc5EkV/0LRcSaT9GXfrhJmpR8LHzOIsmNUGokdjIKx8VmGltoY8/F4wZ
	0LdWSRCnR6iFexjv5KOJU12K4LhrGyC7kPo+jOXmirW70uC9noPw3XhXoT0obZmAAx5eXpba5Q7RG
	UrPjXGLNnscpGJ9doTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWh-00000003ZLI-0CEj;
	Fri, 23 May 2025 10:21:19 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWf-00000003ZJu-0xOh
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:21:18 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-742af848148so5434721b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995676; x=1748600476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=Eya+O6dbYmQithT4NmXqH0hP1N23MLKcqr8A6+SlLabXDS8TaHJ+XgyYqSq4bninm2
         dI6aw3so61K//xbaKWnCQxiXysJikxcLnAwToOGtri3cpa6pwp3pOO9oeiz+2trqXswb
         fKqhmZBbkaIw5AHBGPQoN5vZDw//6GVmt4tWUarxu3Xn+9GHfZSddB+6XIqvtKqDVa3B
         C4eQ3Dg4Tkqomk61VPJ2T1aMA2j5gMCWsL8kh47aSMJyNrpBjyg6hs0Yul1AbQkQkg1d
         Ept0wQGd6yWGkG8a2cyCYJhL4m+6X7xVzRTvzadzwOJY1bPK2rsYdGthoVcPbKjRZwVI
         PIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995676; x=1748600476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=iSuEmLkjGde/TrN+j9I26zEPPyp8FcCVhUB57sls4VT9SV6Vx1AolzGLYc7F3O86+7
         w+hrA93iH/agIo4nGdQY80VcGwQPyEBw9TJuYRWtqV+oH1ZxiNHzatbD5UR+QWRzhauh
         rpCal0KwOEpSCrsqwh2erNoTJZy0oDW9znWe2gFAntuhCeC1cajrtN52sBro3tcr9iPF
         rUHD1syFkQ14NZFxBSO6IiUirOOh/lq9DNfGjIFqFw6mlBcogMi9xCfuOlzPysZPRmbp
         Bs5EUOJR+5BnfncFnTN7inw/s9xU0PPU0pMHIZH/eo8l3P+Wfpv0W7v8/b5rYo4lmEDX
         XlYA==
X-Forwarded-Encrypted: i=1; AJvYcCUvwK/4ZYQNrSx1MiTE7rvpUgS+qviqEdFMoyxeTPVficLCkVNUnwIr287Jx5Q59N9RzSWl/TphULH0Dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBt4F0KzPX7JF9t47Bp/c72jAp4BOFfOju8zH+i3hTgnZ3r4s0
	DoE9L05mMMrQL3FxZNHPaHB9SbsFd90u/lQDW4gCcNB+joijX6s1PEUhPpukh8F9YVg=
X-Gm-Gg: ASbGncumF/7YClH8AIdEhF2Yy1tIPLyxX1r074NnCwhWvfFufwV1dn0ZgtQt3Jll18A
	tPF3ZAp3y99KzhVbLP28/HmPGqJ0ppQjH7q+caK4sRkdsPlOo8xJVWAT9oVsLNkNBz3T/9G8NyY
	5wC3V6i5HrG8RwNvCBWcuu2tuK7ipeIOaeyC7EHU0WTFUsiMbQ3BPTSR2pBiK0yyrpOuzHq/EPP
	HDwIO+p0x2uF6JrET1JRa8Eh4mZAegb0ZNgVadJL69YDpW/JYrdxFpkrV6/ZU13ugNGne8uKZdM
	W+eR73xycX01As5yUPPbMI6KvgeKWh1QSp67noUhchOXuvmEwBB1WIuBbiwnbrM=
X-Google-Smtp-Source: AGHT+IHF69bbGfugVW1hk34muZ1UxkEhf/sMPEJ/BrKkaYgUPpqT3QpHbdDEt9j8Gh0ePOgA3f704g==
X-Received: by 2002:a05:6a00:98d:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-745ed8f5d5bmr3378167b3a.15.1747995676226;
        Fri, 23 May 2025 03:21:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:15 -0700 (PDT)
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
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 03/14] riscv: sbi: add new SBI error mappings
Date: Fri, 23 May 2025 12:19:20 +0200
Message-ID: <20250523101932.1594077-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032117_268263_AFAA99FD 
X-CRM114-Status: UNSURE (   8.03  )
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
