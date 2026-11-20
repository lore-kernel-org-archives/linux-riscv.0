Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71132606A33E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0hCqit8I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=R91yIs3w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NCOSENoGdkKQEjo0+BHwJ1N5hTSwvIfexYb68RO5Lws=; b=0hCqit8IF1MVDiNsZJaEiiTcFW
	Nfqr7ytYPddicrlUWVwTpte3LCc6bGWwLtTOzseZaTEVqgBX0qdzgBeEXOr9piaskIumhnPzcSz3l
	VCLNAA32oajMwEiunPjj0cf3qDheaGTD1vlHI7TPB3Ml1+SHdGZBDtvW+QUNv0EdVsPwm7j72/tmX
	h3N+oWg93niNSc+QbR0u7DNfFSyTvYzDuhp8yKjqyjhOTTNvicPnKaYwHX9opH19gY2JDllUDVR3o
	XAXumasYirrUTOj+Zy5wvS8VX3GuL0xBU5P+KPzMJl0/VQyrSpds3a/VWinqq8xO2pr4y0cF3PCMK
	Oeq3Uvvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUITP-0000000EBsN-3bmI;
	Fri, 20 Nov 2026 06:51:52 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUITK-0000000EBrG-3Ex6
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 06:51:50 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jW5bW5m47z8Xrrr;
	Fri, 20 Nov 2026 14:51:35 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795157495;
	bh=ssuXCnFeWlBYZvoeFd26ywYVrzitiYp5r2Sm+PSkqho=;
	h=Date:From:To:Cc:Subject;
	b=R91yIs3wUrOQJNN4W42KJkOZ7fwm5dhbhL33EM6gIn+1D7qpB+AVRZCDAb1F7uLM1
	 OXuWx73GsgywOagWgNFtDrHWNIjLQjxDB5z6mws7SNAZ5SZsCPDzQq/bQIOkZPFxA3
	 SJQE8doNGlVALgGmc/h0yCpTclycAP33ThWCREpbQh4vJXsMk+eo065/NLYOwS2xTt
	 3+IplabHhpe/h/OhwOSC3l5T08ezSxhV51NStZN2OISicQq+XLh1ISV2fn6C6ZWwG7
	 vv0ggeUNCbDdChrAji1B94JN5Q+SLz0u453/FGwK5quN5/5TgV3byOgzBc2+CzgiiE
	 Js2MxV6P5cBHQ==
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl1.zte.com.cn with SMTP id 6AK6pFAx086097;
	Fri, 20 Nov 2026 14:51:15 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Received: from mapi (szxl2zmapp05[null])
	by mapi (Zmail) with MAPI id mid16;
	Fri, 20 Nov 2026 14:51:17 +0800 (CST)
X-Zmail-TransId: 2b076affede5677-0a5aa
X-Mailer: Zmail v1.0
Message-ID: <20261120145117988UPrFJYA461pgTds3xOCwH@zte.com.cn>
Date: Fri, 20 Nov 2026 14:51:17 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <lv.yating@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
        <rdunlap@infradead.org>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <liu.qingtao2@zte.com.cn>, <he.yilin@zte.com.cn>,
        <ye.zhihao1@zte.com.cn>, <zhang.cheng35@zte.com.cn>,
        <hu.shengming@zte.com.cn>, <lv.yating@zte.com.cn>,
        <linux-doc@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyIDAvMl0gcmlzY3Y6IEFkZCBCZWlqaW5nIExlYXBSaXNlIFRlY2hub2xvZ3kgdmVuZG9yIElEIGFuZCB2ZW5kb3IgZXh0ZW5zaW9uIGZyYW1ld29yaw==?=
X-MAIL: mse-fl1.zte.com.cn 6AK6pFAx086097
X-TLS: YES
X-ENVELOPE-SENDER: lv.yating@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 20 Nov 2026 14:51:35 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFFEDF7.001/4jW5bW5m47z8Xrrr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_225148_196061_FF2CA755 
X-CRM114-Status: GOOD (  10.60  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Lv Yating <lv.yating@zte.com.cn>

Hi,

Beijing LeapRise Technology has been assigned a JEDEC manufacturer
identity, encoded as 0x966 in the mvendorid CSR per the JEP106
scheme (bank 0x12, final byte 0x66).

This series lays the kernel groundwork for LeapRise RISC-V cores:

Patch 1 adds the vendor ID constant (LEAPRISE_VENDOR_ID) to the
RISC-V vendor list.

Patch 2 adds the vendor extension framework support: hwprobe key
recognition (RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0) and an empty
extension probe list hooked into the common probing path. The key
reports an empty bitmask for now, allowing userspace to distinguish
it from unknown keys (reported as -1), so LeapRise userspace
libraries can be prepared ahead of the first hardware shipping
vendor extensions. The key is documented in
Documentation/arch/riscv/hwprobe.rst.

Follow-up patches will register extensions as their specifications
are finalized.

---
Changelog:

v2:
- Bumped RISCV_HWPROBE_MAX_KEY to 17 so the new key is valid for
  userspace and in the vDSO data.
- Registered LeapRise in the vendor extension framework: added the entry
  to riscv_isa_vendor_ext_list[], the LEAPRISE_VENDOR_ID switch case,
  riscv_isa_vendor_ext_list_leaprise in leaprise.c, and
  RISCV_ISA_VENDOR_EXT_MAX_LEAPRISE.
- Fixed the build failure in vendor_extensions.c and the wrong
  MIPS_VENDOR_ID case label.
- Fixed the Kconfig.vendor syntax error.
- Unified SPDX on GPL-2.0-only and cleaned up the new files.

v1:
-https://lore.kernel.org/all/202611160811.6AG8B8QM046993@mse-db.zte.com.cn/
-https://lore.kernel.org/all/202611160824.6AG8OXL4051238@mse-db.zte.com.cn/

best regards,
Lv Yating

Lv Yating (2):
  riscv: Add LeapRise Technology to the vendor list
  riscv: hwprobe: Add LeapRise vendor extension framework support

 Documentation/arch/riscv/hwprobe.rst          |  4 ++++
 arch/riscv/Kconfig.vendor                     | 14 +++++++++++++
 arch/riscv/include/asm/hwprobe.h              |  3 ++-
 .../include/asm/vendor_extensions/leaprise.h  | 17 ++++++++++++++++
 .../asm/vendor_extensions/leaprise_hwprobe.h  | 20 +++++++++++++++++++
 arch/riscv/include/asm/vendorid_list.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/leaprise.h |  3 +++
 arch/riscv/kernel/sys_hwprobe.c               |  4 ++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 .../riscv/kernel/vendor_extensions/leaprise.c | 12 +++++++++++
 .../vendor_extensions/leaprise_hwprobe.c      | 19 ++++++++++++++++++
 13 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/leaprise.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c

-- 
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
