Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538CC606A320
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 01:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NUCeVSqt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Awh440Ft
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7R9yUWyyvrDRWAub9OGSmFajxbTyvoBKh3a+6a/vXDs=; b=NUCeVSqt756ov/NCRZQXrj8UI2
	XPwozXj8p9bq+fOH6Dl1fO/VGsDAOxM/8+9NUhqqlXIc0eSrlYtwh1Y85XZ1e1ieViT20qddvwsK+
	7WKfTzr7HaU2TgFxWqyptWdyfC68uEyGMN7M4Li7P3ug1lcUS2PDUqrk+M1SHSQXAPb2BY83KdAdM
	Uuh0xMfyT3g0MROA9u69s41oYo0HYn7L680NsNvHcYk+2HS8krMbt3DK08SGC2fyyDRDFhz5H5EfD
	efkUrWaIMbp/8khX7nWNA8C0WC7K6EPBZvbYROnE5+ifFbF5DF4p+EMdF87HN4oA43zpV8ejGdFNd
	bzMmVq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Q0-0000000FHcZ-3dzm;
	Fri, 23 Oct 2026 01:50:04 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Pv-0000000FHbO-3XJN
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 01:50:01 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-354ba08cfd1so725986eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 18:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720198; x=1793324998; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+p8cIpnt0YjLXT/3n6WuKQxFq68+6JJEn3PVDsIrB3s=;
        b=Awh440Ft8UEYMoIIwebJsWPHka/ePnxRCW6krc/2A6pAVc3JsXq1rMQrBtNMfnmSGK
         j5PG4pPi8+eL7C0qeXSsKaEdgqsI4zHrpDHiRUGGzBTgA7AwlQFfx9knYu8rRqpFE33o
         Z+Hf0vVJ84TX6ZN7zoiK0bg5fpSG5Mq5wj3xTkkdzl5DVpNvj8a0lHo4c0yrWJn6rvS+
         IL4i4jWI+yqQUNMOp42cYmsXt1BGFRb8rje5KxZqlFn0TkOSewnSwHs5d8RTTmIDP+0l
         J4ubVusu7n+D2e+nQKxogdMzEXhgjx514tM6dgxDv6ZG8F6A0BPYRY8Ya9WT6x7/RJgU
         WPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720198; x=1793324998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+p8cIpnt0YjLXT/3n6WuKQxFq68+6JJEn3PVDsIrB3s=;
        b=YjpFh7apDnjBkddOUrhEY0s4xjB9CcjbObPQacvqIO2bcNSA9/mmbU8XD9WNQTJcRH
         6jTPR6Ukvlc3oU/zFzNBuUo4T7n61x1XJdBHXqUzrhjNv2nRo5/0JC98O4jUfcvJps06
         TCsXgqO/45VCZ2pLOVk0zTsJHHkbRSwRubJkkGgSAVua9nDG15hQeWBEbTui1hVw5uJ7
         8JBxbEPzYxWYBlT3aj617XSRCnLolGMm/z2RR0nh2iRXtr25AkLY0HcKczvabqGpkLvv
         SbIebM2Slv2xmJ9UbsIxZc4whk2hyi4XGmIHGuJhhCbS+tzPd2d0hrqw1iSvJhU4YBt6
         Lu+g==
X-Forwarded-Encrypted: i=1; AKwUvByGONkPFxeXGpH1W9Dgg+xemCHrNZ/LPnf1jl3tNpfyDXOgLMCHsfvRLYY3Jc4bzZR+L6nFv2VxIeJQCw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIrq+grbw/LkU8H1cKyZvsJjlXlbf+EzeNOC6/0Kn2I3B14d+YJ
	6NffVFqa1YW0S+zUKXNE67uT8DLbScVw0TxoTroCnX5jLIzkNGXH/oGt
X-Gm-Gg: AYBFou0dyBDO1ycXeicOkQ8Ahe+KMGPnH0wWWXRuvNQCgdoo2jY78Gk+Izx04++CNEh
	UIdxZTKZ/tthSJ90fmeuI+3mpc1DS6bkMOVQgmulZDwOFb/lhwRoEpQV4T6ohaaKCYH+fEfCLXA
	THs+FF16ddDmrv41dFCMT7Kl0YkTzaoG7EC7sdkiE7J9OTxBuBpWXIEm7qdYqcRX2ODq8O7YFSS
	O2ZgD2ClPFvuYCbstce49BU8shw3/rn3ANklKdNYvQXXcGvPkwhb9uUPZm0fg2VmLiiwEVxGf5U
	ZmRsbwzFJHRq2LQnJeXc7vFkZ/aijKGIr4brVQhniQSKizTTMWuNONA9usUYhWzm1FtsP7+EZ66
	zlyoSehbLu6ktYgjzYE2EshlyWkSBtXqCi6VOHhmVWDL11qeHKEnuAmnIkdxM18Wm3ydfJw40vF
	NrIQeio+Ahl5tNgSA7dvNmn4xXn4DLuqWBYJRgBoogWXOzrxtGSJFd4lr8y2hjE5FUVzfdCo7KE
	OspfA7TvVyc//oHEcXl4vPaEKVPzke0Dwh2SMgyn6lrcbfWsMg=
X-Received: by 2002:a05:7300:c00d:10b0:35f:4780:518e with SMTP id 5a478bee46e88-369d97155f0mr1233857eec.16.1792720198309;
        Thu, 22 Oct 2026 18:49:58 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c0e60dsm1971091eec.2.2026.10.22.18.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:49:57 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v2 0/2] word-at-a-time: let KASAN see
 load_unaligned_zeropad()
Date: Fri, 23 Oct 2026 09:49:47 +0800
Message-Id: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADu92moC/5WNSw6CMBBAr0Jm7Zi2khJdeQ/DYqQDTBRK2oofw
 t2t3MDle4v3FogchCOcigUCzxLFjxnMroCmp7FjFJcZjDJWK33E66PDpw8OKSFhkoHxw8FP5PB
 GkUak1pRWldYyW8iZKXArr21xqTP3EpMP7+0465/9Iz5rVNgaTQd2lsqqOncDyX3f+AHqdV2/W
 tfq3NAAAAA=
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, Peter Collingbourne <peter@pcc.me.uk>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_184959_891628_E57CACD0 
X-CRM114-Status: UNSURE (   9.52  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

load_unaligned_zeropad() is inline assembly, so KASAN and KCSAN never
see the word loads that sized_strscpy(), the dcache name compare, path
name hashing and x86 csum_partial() do through it. While reviewing a
strscpy() KASAN fix, Peter Collingbourne suggested checking the first
byte inside load_unaligned_zeropad() itself, as read_word_at_a_time()
does [1].

Patch 1 adds that check on the six architectures that implement
load_unaligned_zeropad(). Patch 2 adds a KASAN KUnit case for it.

[1] https://lore.kernel.org/r/CAPQLkRhXZwozmfhNd_PEx1ihwdH1_5qthP6PANYJ_m-v9vfQTw@mail.gmail.com

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Call instrument_read() instead of open-coding it (Andrey Ryabinin)
- Keep Marco Elver's Reviewed-by, as the check itself is unchanged
- Rebase onto 7be4bc52fd9e, which drops the big-endian branch of the
  arm64 header and rewrites the s390 load_unaligned_zeropad()

v1: https://lore.kernel.org/r/20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com

---
Qiliang Yuan (2):
      word-at-a-time: check the first byte in load_unaligned_zeropad()
      kasan/test: cover load_unaligned_zeropad()

 arch/arm/include/asm/word-at-a-time.h              |  5 +++++
 arch/arm64/include/asm/word-at-a-time.h            |  4 ++++
 arch/powerpc/include/asm/word-at-a-time.h          |  4 ++++
 arch/riscv/include/asm/word-at-a-time.h            |  4 ++++
 arch/s390/include/asm/word-at-a-time.h             |  4 ++++
 arch/x86/include/asm/word-at-a-time.h              |  4 ++++
 mm/kasan/kasan_test_c.c                            | 24 ++++++++++++++++++++++
 .../powerpc/primitives/linux/instrumented.h        |  3 +++
 8 files changed, 52 insertions(+)
---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20261019-bug-word-at-a-time-zeropad-kasan-af2460466ee6

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
