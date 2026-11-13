Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20430606A330
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aKkoFeAZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=ARImToeH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UM6fqSNFGMV6XT5/OphW/pcE2QFXnJH9cgibrNU39GM=; b=aKkoFeAZs1aEEfqUrvYV4fOUXs
	nTK18k2zqzlMXYGSVi9MkTrLVWI1GwsD/SKmpIrsTuaotihvZ35idE569cxRlynwV3TUjzqttfCPx
	N56Qow3LhriwU6KbAbqKks2LrpqNjC8gJx1+1E6y3OVJIvgHeADxsxSO0xYBes3k8jvc3yUHEyGdw
	Solng3ubGgfqVzc0ljlh6Q7Beb8YLgK7pC60Zrdyeo3/a2aQSvX7ZwMERZSMT07cV1kGXB+xt0jZi
	aEO0+oozoFKvncwW1W8Q7QPR/oX06PBNTZmhH9C3Y5bzQbxm+u+LT4CRpLBdhN8VNnyzOJwSZKFxr
	VAKW8cEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnUR-0000000CCw0-1f9z;
	Fri, 13 Nov 2026 09:22:35 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnUO-0000000CCvJ-1cv9
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 09:22:34 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jQsGq5P0hz4yjSq;
	Fri, 13 Nov 2026 17:22:27 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794561747;
	bh=tShg1f4Y0wrs6aXeclAtYsoXU3BahhonJla1y2uT88I=;
	h=Date:From:To:Cc:Subject;
	b=ARImToeHvzYjvfnTt0xQJ9JDrPlbCTAIl1moZ6x6J8Zsg2tl/mFn02jQ/ZqLVujRY
	 A9WuyaaCvBu2UnvzdBW0plS1hD2rlOlWFMisE81WDrmu3+knjP/7DUyiqfMVWTWxxu
	 rsHY8CIZ91rWfkXjvKPmEwR8Ek6rWlCo3+BAVaxH01DAiJwlb8eczo4TrcA0VgL5YS
	 UpJQxJDlU120a0FLWwFw7T0r/b5W8+iT08IiH8Hjq2Ze62RoQWVzvJjF8eZVEjGBM5
	 uguxDCvYCa9XFlZD9YgQZo8JaipQoU9hjRfN76Y8vGEIKEI0iVfrH1eOZEwrL41EN+
	 bXbDMP6xomEAA==
Received: (from root@localhost)
	by mse-fl1.zte.com.cn id 6AD9MON5044419;
	Fri, 13 Nov 2026 17:22:24 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Message-Id: <202611130922.6AD9MON5044419@mse-fl1.zte.com.cn>
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl1.zte.com.cn with SMTP id 6AD9ICIM036723;
	Fri, 13 Nov 2026 17:18:12 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid16;
	Fri, 13 Nov 2026 17:18:14 +0800 (CST)
X-Zmail-TransId: 2b066af6d5d69ee-bd0c1
X-Mailer: Zmail v1.0
Date: Fri, 13 Nov 2026 17:18:14 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <lv.yating@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <liu.qingtao2@zte.com.cn>,
        <he.yilin@zte.com.cn>, <zhang.cheng35@zte.com.cn>,
        <ye.zhihao1@zte.com.cn>, <liu.xuemei1@zte.com.cn>,
        <hu.shengming@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDAvMl0gcmlzY3Y6IEFkZCBCZWlqaW5nIExlYXBSaXNlIFRlY2hub2xvZ3kgdmVuZG9yIElEIGFuZCB2ZW5kb3IgZXh0ZW5zaW9uIGZyYW1ld29yaw==?=
X-MAIL: mse-fl1.zte.com.cn 6AD9MON5044419
X-MSS: AUDITRELEASE@mse-fl1.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: lv.yating@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 13 Nov 2026 17:22:27 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF6D6D3.001/4jQsGq5P0hz4yjSq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_012232_736518_7861BD5E 
X-CRM114-Status: UNSURE (   7.80  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
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

best regards,
Lv Yating

Lv Yating (2):
  riscv: Add LeapRise Technology to the vendor list
  riscv: hwprobe: Add LeapRise vendor extension framework support

 Documentation/arch/riscv/hwprobe.rst          |  4 ++++
 arch/riscv/Kconfig.vendor                     | 14 +++++++++++++
 arch/riscv/include/asm/hwprobe.h              |  1 +
 .../include/asm/vendor_extensions/leaprise.h  | 11 ++++++++++
 .../asm/vendor_extensions/leaprise_hwprobe.h  | 20 +++++++++++++++++++
 arch/riscv/include/asm/vendorid_list.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/leaprise.h |  3 +++
 arch/riscv/kernel/sys_hwprobe.c               |  4 ++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 .../riscv/kernel/vendor_extensions/leaprise.c |  7 +++++++
 .../vendor_extensions/leaprise_hwprobe.c      | 18 +++++++++++++++++
 12 files changed, 86 insertions(+)
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
