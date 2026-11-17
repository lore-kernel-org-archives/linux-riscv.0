Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12723606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j3fnM9sE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Ng1VJu42
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ALF6z7U/PMjRrf2V1Q0nDcmYlIR2yafWgO4+0tFZjqM=; b=j3fnM9sErMRDsDjy0xd22I0SPt
	ReUtdVxAuME2b1pe3NgFm10/Qdth58xln2wqOcU9pCqFV3oaJkrUbzxnRNx5SFwuOL0q9twwir8no
	3XTSS9hJ61sikCFeCT0UETKUoa4FvZqS6NXTLrfds24CBLZeUvEhik50rOwttVARkBx2qxrTRZ8pu
	MM71QNpQpXVE6eGvnYoShs85AYnCiHwlQMZC83OQZ+wTYGPg54dvwtyhFnltaPZtYqWl7OlUKK81M
	W/UdEJHViD67tplsXjht/HWClIyt/Fb/TWhi2v52s2q6+QzlRqal3USj9ijuOzNRwbvflvWx7U3id
	mw4ZMEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDmC-00000004o0V-3L8w;
	Tue, 17 Nov 2026 07:38:48 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDm8-00000004nzI-0dmN
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 07:38:48 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-15ea896ddc8so6756830c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 23:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794901123; x=1795505923; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X1EFeZBdLj15mNpUXtl+gFcocPPY28d2wx+TBKBPcMw=;
        b=Ng1VJu42QUfnz1BxQ0qMfZhasRLgMlqUYw1BX+kZzrRReeq8Q3LfmYaAcBxnugM8w9
         99vRiewVqPU57d1pdFNOS95cO/ojCnP79p+MViXG7z6p4rcvTFdBvjN8+5ZIV40g3hfw
         xn0vOnV6dQ4Yo3i8fnGY/RUUz1+3KDzgONta9rnyDHc3Km3fiN9j2NZELDXfks5Klo6v
         g0sldPoRSPg3X5DXVU/91vza/Evuv8LlagDpFrBAGIeZpmI4PSTLXQ+5co6fgTODkg7l
         AhCPtOX1Iaa1w7jVjCLSOZEJNEG/JP2w4AKHTdWCKkmGxFaBOobd4B5hvF3Nzznz/m4z
         rXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901123; x=1795505923;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X1EFeZBdLj15mNpUXtl+gFcocPPY28d2wx+TBKBPcMw=;
        b=yJBAWzbwgcrZOpsvzH3NoS4Pd5MLM2Yi+bzCVSP8EY/bhVupTYDApnPpPQ3YuYQFpf
         kMeGCJqh8zquNQKCilSL3DaOhIwixn09vD/VxdFghVn3gHjJNkIkRAgbwdh+xDcUW/p1
         1WrE4JvLkCsQWbaKV98ExsPyTFgBUYN0SBjkE/YfnIsNweVjBm1BpqD28tD/5QEqcDTX
         DSpy8iehyHqpvCSlI949RiEo3hkt1JX3/8km1tj0oWKwcFm1NaMQ7hvbfzzURLMZuq4x
         1u4ASeIgXMHt5n5GR+hWOLIXlrk2dh4hG0IBk4X0hSVLfyM6Py9Fny4kEX9eZPsEFWoK
         w0LQ==
X-Gm-Message-State: APuU4Z8knK8rosbEbHH5oy+t8Q2cuaiR0pA1sZHk5K9brX//3XVrI9KB
	ju2IZSa7T9zFEstQnc64GiMap7UorZ02PlnKACymxYyCrjvlFfX7t3duiTVc95Cv7+wvZsAhmOB
	2sWN5
X-Gm-Gg: AZFdTZfV90Hxt0iOuTN4e3rUIvr/0WYKf8h2znRM1w85yv41+zWDYZbrTcfCm4CNuSR
	TDQOSCh1XjyEQPSsord5qDHopyjARLqz6IIXQRC/DO+grcdUK2Be935l78Eryh2wn3/pz8gWECb
	kzd87KcNahCMJEbi/V1d9lNIluPMp8frww9NpY6OapFSomVM7R2vWc+8tEpBsWlTCwYril3RRTy
	8YwmJ/AWX/OKUiLIE/v6ttHaCDcf5uLFNT1u5W4DSW8nm3ZxBKEvoDmfEJegSuiO+s++gVMD+4r
	BlzMySY9ZNHuBcSIyxMbBHmVXY629BGzGS9LKRo+M8Gy4IRGdvP854F3uIJl3NlHbLNdkuscS0B
	ORgE9RRoqgqDlW5BpCuSuSp9MJZ8Ry+TI+96xr42rxE/ZzoMY7iUwYrmTNlUh2dRq9TvEl90bqS
	7hvWlt4d7zMAcrLcE26SWH0rALIHlbVD2Q9UGqiN4WAKwrjo2jStpFO9LAPaEaiy/EANskPSjg4
	rHQN4dfC6vLQNsm4igtSDMUlX11+wZwVv7YEVNFbkTwCsr/MVKo22CxeS01eEhwsnmsOBRtR/w4
	yq0um+xc2URBZA058h53KwcxQI52VWXYgWKfzIetd6lSOg==
X-Received: by 2002:a05:693c:8084:b0:378:1191:43ca with SMTP id 5a478bee46e88-37966e3b292mr13877536eec.18.1794901122726;
        Mon, 16 Nov 2026 23:38:42 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm5190967eec.17.2026.11.16.23.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:38:42 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH 0/2] riscv: Add support for vector misaligned load/store
Date: Mon, 16 Nov 2026 23:38:36 -0800
Message-Id: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHwE/GoC/yXMQQ6CMBBA0auQWTtJiwjoVYiLUgYcg4XMQENCu
 DtVl2/x/w5KwqTwyHYQiqw8hQR7ycC/XBgIuUuG3OSlteaOwuojRvLLJPhhdSMPgTq8FVV17Wv
 jXdlCqmehnrffuXn+rWv7Tt13B8dxAvHaodh7AAAA
X-Change-ID: 20261109-riscv-vector-misaligned-54773f80ca6b
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Nylon Chen <nylon.chen@sifive.com>, 
 Yeting Kuo <yeting.kuo@sifive.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794901121; l=1475;
 i=nylon.chen@sifive.com; s=20260310; h=from:subject:message-id;
 bh=tmkoHjHMDPa3fXfBx0Bpn94ZmUkTCA76BxDrgEkQkxk=;
 b=SiEKMftKaKj2WXk40u2hgHdrIuZP1id9WexL6FBiWpYCzwKZ7E9P508IlsiIrGB8ZZ4YTwaay
 QYqbd9QQSghDsu1t++ht8dkkuaGOQ6a8UGxl8a31LHjf9RJ+2LrcOT+
X-Developer-Key: i=nylon.chen@sifive.com; a=ed25519;
 pk=+xtFLLbXfGd50d5UhR9oBzLTh+JLft7T60t3u7YMZPI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_233844_213167_A68EB179 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds emulation support for misaligned RISC-V vector
load/store instructions, which may currently fault/trap without being
handled on hardware that does not provide misaligned vector memory
access support.

Patch 1 implements the trap handler, with emulators for vector
load/store covering unit-stride, strided, indexed (ordered and
unordered), segment, whole-register, and fault-only-first forms, for
both user and kernel mode traps.

Patch 2 adds a kselftest exercising these code paths across the
various vector instruction forms and element widths.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
Nylon Chen (2):
      riscv: traps: Add support for vector misalignment handler
      selftests/riscv: Add vector misaligned load/store tests

 arch/riscv/include/asm/vector.h                    |   4 +
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/traps_misaligned.c               |  39 +-
 arch/riscv/kernel/traps_v_misaligned.c             | 902 +++++++++++++++++++++
 tools/testing/selftests/riscv/vector/Makefile      |   5 +-
 .../testing/selftests/riscv/vector/v_misaligned.c  | 169 ++++
 .../testing/selftests/riscv/vector/v_misaligned.h  | 530 ++++++++++++
 7 files changed, 1647 insertions(+), 3 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261109-riscv-vector-misaligned-54773f80ca6b

Best regards,
--  
Nylon Chen <nylon.chen@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
