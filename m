Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A17C531D0
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 22:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=atIsD2iJgMRgW6DFC4ITSWB2O4b9t325/Z4jwNmHMKI=; b=bU+7C5NRdMMiA2
	iVAaowpUXhPhJSFwRTF/YxYsx21Xmhx6Rx53uuzM+UWxO+y3R5rTeRFKpO2KNxefFCuVX2uOVJQdn
	EbkllOJkrj53h0vQ+4M4FU9jOgO0T/mueTrI/niG7UT3gAdjK+qdKrOQ3qsdvu07HXhW0lhQRcTAT
	bTZ7wDhAesPATy8ILT2kcaHEsNs4gLN1NHzgIsWqxpwS0wHZCRpj0F15dsyKm23a7iumUNaNkjGmq
	wAfA9SAOY3Xdvmb4DYndHsbqr4yVABZ6WvcfgYZPklYEOLVu4YNYrijz0Kv7QIXqFgnacBZyVSOwC
	sjQI1y+1FbufLPFmTqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1nH-0000000FCKi-0HnR;
	Thu, 23 Jul 2026 22:21:31 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1nF-0000000FCK4-0tzs
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 22:21:30 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6aae73c40c6so70731eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 15:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784845287; x=1785450087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vy4yayST3KYkvhOri0kcum0952MCYGRKHrnNWx+qcmc=;
        b=cBQ/BEkfyUlHWeDXfE/Glcy3fLXfidNr3GBMWy7hCErNGwfbIvKjxmSZhgoJsu3Q7W
         YVfOQD6TF16pL7dmCLHDGgwJrfCfgq3HzBeb5+mfc9BSaLabDsvL3AkddFQb9VoxbyH0
         jUOu2/5+36zTsYn6m5eOJ65na9UDoKZHI9jQXejPqDPHS0AhSDg8Mxnmm/j0oid6zCTV
         iHhqca0MFYy4q/rVFaIda2bqAkmOXMuBhIG3FL3H6kkVWCAWe5p+Zv4A47rWIc/8UMyr
         mP8bulRsppWYDOF2BqA3IM03nCOrGBvxmyuL3PERNcPPD/TQvcdJAHUWtDmFJ1YTSVSw
         /RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784845287; x=1785450087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vy4yayST3KYkvhOri0kcum0952MCYGRKHrnNWx+qcmc=;
        b=duUZG8FJwl3z/fz2790qPtY2pQ4FZI2LtS7gZc3bSsKrprpnpXM8ntaM7bqk+4895S
         Nm0pKpeABOJB4mlMftTt1r/f7SOo1fgSAbAwv3Qaz86//r1/lR4wDzH3F1IH0fZk2y3f
         Cc4UJEeXHz4IH8uzxtC7QMiEhJtcsW8ShEOAn2594x/27NAXkzo5c0YRrxwTXvj//8mY
         oSiVqNXMTieMdgMQz1sKaktokZSYcZjFguR7VOH+8PuSxVEYGI8T+srhlzalsQ/AZDfK
         UqZAPTD0o2recuustdesLbkvhaznROkq0tGYlJXWSRFAqvZ4n/LefCLkLJwhadOgw1YS
         R0mw==
X-Forwarded-Encrypted: i=1; AHgh+RooL3fc+CLiKeYDm57byWHijLazYJmHZWj/+qreXBIbP24JFzF7mbT1Y+Tu1BbmUShD6d0siMAPrF3Vdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHpYS7MCzNrifGBZmpdBo2dpW3ohgVSCTIkm5GmpN69zpytxYK
	BCkOR0I34IFr/FrJk0hiibS+lkPzQmNK6HVS1vhkL24BIRYjT9YQMHyt26XfuReMNYjevugRPm4
	uhRRe2PX9SQ==
X-Gm-Gg: AR+sD12tyQlQ2jYMy544Fssoeh4CeUKS0AWf36mbnVhFDkImb9PdH7IAD/59chLp+Pm
	lnIeSMRTKXdIXKUGTmiiP+IOvA+mbCt4SS42WQKRf9x5C/GFknO01nVbJcX06MapKa4FTOWHpiN
	xV3sLyilGFsbY4+jUzw65uC8+cnjm4ksSdKiYU+z87ztMDsTpXrl9IYQHZEy0GxvD8QPELI5oPd
	msFkrB+UHNAydSlbhiuhH2n8A/ahoxdDtftYgZa5nsG0wiWK0SBPjl9r9WpJ+gB3WKTrukPZ+zk
	ToSILG6tJQJ6Eoa6Wf2XnHg9KnGZILiSwdkLBeAfTGYxJMxXCmnmhc01a/+C232wtSZbbMnsQQ7
	b2KtQewppZTF2sSEbPpQuNk8wy3FeaBLi2sM+Ivr2d9jrhUqFYv50KFheRdSHFKdMvPI+ULqkIw
	vxq017tNx/Gm6pOYpbRfwXsy9H9bj0XD6+dNSdl1hwYDUAhw==
X-Received: by 2002:a05:6820:4a88:b0:6aa:e7f9:fa68 with SMTP id 006d021491bc7-6aae7f9faf6mr76600eaf.11.1784845287321;
        Thu, 23 Jul 2026 15:21:27 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaddc93c54sm1316877eaf.11.2026.07.23.15.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:21:26 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH 0/2] riscv: hwprobe: report per-process extension availability
Date: Thu, 23 Jul 2026 17:20:55 -0500
Message-ID: <20260723222109.2229089-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_152129_283737_046F67E4 
X-CRM114-Status: GOOD (  13.14  )
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

hwprobe reports whether an extension is present in hardware, not whether it
is usable by the calling process. Vector can be disabled per-process via
prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), yet
RISCV_HWPROBE_KEY_IMA_EXT_0 still reports it. An IFUNC resolver that
dispatches to a vector routine on that basis then takes a SIGILL.

This series adds RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier:
within one request, keys before it report present-in-hardware, keys after
it report present-and-enabled for the calling process. Both views come back
in a single call:

      [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
          present       modifier       enabled

When V is disabled for the process, V and its V-dependent sub-extensions are
cleared from a following RISCV_HWPROBE_KEY_IMA_EXT_0, and XTHEADVECTOR is
cleared from a following RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0. The enabled
view is per-process, so requests carrying the modifier are deferred from the
vDSO to the syscall. Old kernels report the key as -1, so support is
detectable and existing users are unaffected.

The earlier documentation patch [1] clarified that userspace should discover
non-standard Vector extensions through hwprobe(2) and then use
prctl(PR_RISCV_V_GET_CONTROL) to check whether the process is actually
allowed to execute them. Requiring that separate prctl step is awkward for
the IFUNC-resolver environment, where a resolver wants to decide from the
single hwprobe query it already issues. This series folds the availability
check into hwprobe itself, so a resolver obtains present-and-enabled state
in one call.

Tested under QEMU (rv64, V enabled); the selftest passes. The disabled-V
case runs in a forked child that sets the NEXT control to off and execs a
nolibc worker, since V cannot be disabled in-place (-EPERM) and a
vector-using libc cannot run with V off. That check assumes
/proc/sys/abi/riscv_v_default_allow == 1 and skips otherwise.

[1] https://lore.kernel.org/all/20260107000609.63892-1-andybnac@gmail.com/
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220795

Andy Chiu (2):
  riscv: hwprobe: export the availability of vector to user
  selftests: riscv: hwprobe: test the RISCV_HWPROBE_KEY_EXT_ENABLED
    modifier

 Documentation/arch/riscv/hwprobe.rst          |  27 +++++
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 .../asm/vendor_extensions/thead_hwprobe.h     |   6 +-
 arch/riscv/include/uapi/asm/hwprobe.h         |   2 +
 arch/riscv/kernel/sys_hwprobe.c               |  34 ++++--
 arch/riscv/kernel/vdso/hwprobe.c              |  25 +++-
 .../kernel/vendor_extensions/thead_hwprobe.c  |   9 +-
 .../selftests/riscv/hwprobe/.gitignore        |   2 +
 .../testing/selftests/riscv/hwprobe/Makefile  |  14 ++-
 .../selftests/riscv/hwprobe/ext-enabled.c     | 111 ++++++++++++++++++
 .../riscv/hwprobe/ext-enabled_nolibc.c        |  58 +++++++++
 11 files changed, 265 insertions(+), 25 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c


base-commit: 0ca1724b56af054e304a9f3f60623b02a81aba3f
prerequisite-patch-id: ecac88d39cfd235fd3bd3be495124f8156f45c5f
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
