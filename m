Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C0AC47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 19:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e5degMgwKErOyg47mVlNM8lgpI4JTgEFDGKNwDOe+hw=; b=xYxuLjy+bIF9O7
	iawYU3yqjvx2xEmLrrR9dZqnJr1BJViRvC0dc/2c14PBrG3qeBgYPMch9s1ZuTpbUA4kIC/nd+ZBk
	FB9lW7lyYmvd/o8fG1S0UutQqNYRxfB1v13IdUqOz+BTyTlPhQh6fYERJ/togM23UeE6k4m4vDMvf
	ao5OlMCnC5rcLYWjylXiwj7yZqv0CYADuNWZVJMtylU6sLZ3F/LCu7F+jVeAPopiKnDxs4HQiCy/y
	2BaH4u2DySd1DeLyZCHP4OyAFYn406qzRHlgdABu3aQNLq///AeI8+W9eTUn8+k2z63R7b91OiL+M
	zzUkItj4AFUfPgWwcWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUtPR-00000000GUO-2Juu;
	Tue, 30 Jan 2024 19:04:37 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUtPO-00000000GRy-28rG
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 19:04:36 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ddc0c02593so2065352b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 11:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706641472; x=1707246272; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4D44QK/kPW88RwduNoGSI0iqhkYRS1kC786c0l3XOWc=;
        b=QfbejHw3fgNQlKghfk0vcxZhTJSIGwAK6fEgY8Nn6iNPo6fFPZjtTBH+fJXP0hh+pj
         mwos34f43YR4i3W4IVscq5M3nSf/QwwwnKQOJEL6m4aMc1cBvL8AAhF4gIbNw/yXGdFg
         q8lVtJDY9+GNY/ZCXrr1jg4r/qVvh7+rlyM+2ccbXOPvabHhtfmn4HcwPeHRG6av7F0k
         mGt/KHLpMKT6gudU0RFD9q1K1xXB+QNn6vV4xO4RZvOUnYniMtH5DH1xKEwxn60jj+Gl
         t0W0CjKveIqVI32m649IgpKYwt2Wryf/LBB3Xr0NYDnvY+9kr2gbUJrS+FvzmTngjlLa
         KkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706641472; x=1707246272;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4D44QK/kPW88RwduNoGSI0iqhkYRS1kC786c0l3XOWc=;
        b=tbeS5qZgraOvua4Cg7v5WfPOWF8w/pJoOj0lw6s0UXUK6q0XUlvJuyEEP//7GMlntV
         1bE5bkp/CuaYAZIM9WwrDpPddlq8pNWTOEK7+SrbUJwqwlRZtwJcc/ZOmrBy93h3WPbv
         CFK4TBLwGEqZ6raXl9NL2x011WGDiWKl7/ljoyncF6l5elobhErrc3DY5vCscl9sTzEc
         sUeaK4Cn5iU5ShPit9pB7cmN8haDcFSpidC/hy2eq7+iZGwKoW9nmrHvM4zAxiU3tMBo
         HakwbmDCmq9OOWmw3/Z5pUzZqylqII78BJ0KXQ3rr2DdheP87A4RxJ7iH4pAfvk1o1Av
         EeHQ==
X-Gm-Message-State: AOJu0YwtHiNqupUjB31O7YQKgyLVC6yImY0e+WvcmVu7306h6MgWbd8u
	f8NffnUJoi32p6PeT1WnJqpK3AuIpXAWcOtHSFHGivmxWfmprg2jFqJhi2I6Ls8=
X-Google-Smtp-Source: AGHT+IHDqzd/dBdeKM2ZuEG20ibf2MrAQHh0T7+zovFIc6n7MNP/9tMbddtfCfApaIPGdcPdBlRWvQ==
X-Received: by 2002:a05:6a20:291e:b0:199:8ed6:746e with SMTP id t30-20020a056a20291e00b001998ed6746emr4930207pzf.58.1706641472640;
        Tue, 30 Jan 2024 11:04:32 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f6-20020a17090aec8600b00295c3bb9318sm1196541pjy.54.2024.01.30.11.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:04:31 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/3] riscv: mm: Use hint address in mmap if available
Date: Tue, 30 Jan 2024 11:04:29 -0800
Message-Id: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD1IuWUC/3XNQQ6CMBCF4auQrq1hagXrynsYQtoylVnQkhaJh
 nB3gbBxwfKfZL43sYSRMLF7NrGIIyUKfglxyphttX8hp2ZpJnIhcwDF3wnrrtN93ZIfat00EVP
 iTjlpwBTu6oAtv31ER5/NfVZLt5SGEL/bzAjrdReFOBBH4MCLwhq8lU6qAh+RxpDI27MN3bqxA
 +oYyLm0pWz0DS5Gwz9QzfP8AxGwGU3+AAAA
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706641471; l=2052;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=nus7scvl4gLMAQ9st9lYJlzmjXyvjRvTvEos3E8SaN8=;
 b=KdPbSOIofsdWCW2zc9sZLA78Ps5RefDdeL5SX6tbIQDoFBXQBMlLBYRg9jpjXuHz+YesaWxjJ
 OSV+nMMkghNBtK/mt4vwjxEe5eas0TqtgvuALwBT9CPyCLon78uuHuz
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_110434_781316_F18D1FB1 
X-CRM114-Status: GOOD (  12.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On riscv, mmap currently returns an address from the largest address
space that can fit entirely inside of the hint address. This makes it
such that the hint address is almost never returned. This patch raises
the mappable area up to and including the hint address. This allows mmap
to often return the hint address, which allows a performance improvement
over searching for a valid address as well as making the behavior more
similar to other architectures.

Note that a previous patch introduced stronger semantics compared to
other architectures for riscv mmap. On riscv, mmap will not use bits in
the upper bits of the virtual address depending on the hint address. On
other architectures, a random address is returned in the address space
requested. On all architectures the hint address will be returned if it
is available. This allows riscv applications to configure how many bits
in the virtual address should be left empty. This has the two benefits
of being able to request address spaces that are smaller than the
default and doesn't require the application to know the page table
layout of riscv.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v2:
- Add back forgotten "mmap_end = STACK_TOP_MAX"
- Link to v1: https://lore.kernel.org/r/20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com

---
Charlie Jenkins (3):
      riscv: mm: Use hint address in mmap if available
      selftests: riscv: Generalize mm selftests
      docs: riscv: Define behavior of mmap

 Documentation/arch/riscv/vm-layout.rst           | 16 ++--
 arch/riscv/include/asm/processor.h               | 22 +++---
 tools/testing/selftests/riscv/mm/mmap_bottomup.c | 20 +----
 tools/testing/selftests/riscv/mm/mmap_default.c  | 20 +----
 tools/testing/selftests/riscv/mm/mmap_test.h     | 93 +++++++++++++-----------
 5 files changed, 67 insertions(+), 104 deletions(-)
---
base-commit: 556e2d17cae620d549c5474b1ece053430cd50bc
change-id: 20240119-use_mmap_hint_address-f9f4b1b6f5f1
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
