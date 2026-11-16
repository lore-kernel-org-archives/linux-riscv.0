Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC783606A88B
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RXlSr64+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=J84VIi6F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UM6fqSNFGMV6XT5/OphW/pcE2QFXnJH9cgibrNU39GM=; b=RXlSr64+4Kkvy4+WYDrQfVavtL
	+CZKbM2eb5tDZOrpSQ1lf3GghDy8OazMAHoWPtAtZKzLVM8QKPXk6SK/xKdkilbjPjQM7hq7NiW0Q
	zrUnKJGMtrTLr7nkTdClQbWhsLDpfQCBcYqZQ163Ha88Hz1++DOYPrJCXZDcIhHU3knqxKjPrD1kC
	+DJqjqNtohB6Ke+g+mvEy4ESSpMXPHiBylY+TptlGs1MVJHXTAiCBz5XpdA0zRYy3Uvso+HNq8MdJ
	JJKj++nSJMZo5oOqBfEAeOXd/Qo9UOEur2jiqwMQFUGfLi4elrTQcxk8mR0yrkHprcWuz1Kvn/boM
	wS1lIygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSroH-00000001WgI-2yDF;
	Mon, 16 Nov 2026 08:11:29 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSroF-00000001Wek-14Ii
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 08:11:29 +0000
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jSgY84f55z5B17r;
	Mon, 16 Nov 2026 16:11:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794816668;
	bh=tShg1f4Y0wrs6aXeclAtYsoXU3BahhonJla1y2uT88I=;
	h=Date:From:To:Cc:Subject;
	b=J84VIi6FmFOR6u6bpGLFQm6JZLhUQO3j2ScdwfLoGZnMBiWnES4LMo0TJCtKEKXZG
	 3LQf2RVd2O2qDt+Mt4lUDrsGGy8VPVpHw01diQM65voEO1N0KQSZcd5RQLk1TcRF4n
	 dPfcgbCklfFkCmZKuX7g5ANwtq7oijcZxalbuO0Ch5X9QNXmeTeSjs2CRccmgnjtwt
	 iQK35gl9eR3chfbLiFIeqUqkqq/sh0lcI/KL0L4EHgIkf90zTmsD5bly03XVq7sF+5
	 64qF1/ep35z0bQ5R91dgLo+Awg53BTleK4ZxItSoFKnZJnd4KR5vkduqiVUyOJmW0I
	 C8sZ1ekO21fMA==
Received: (from root@localhost)
	by mse-db.zte.com.cn id 6AG8B8QM046993;
	Mon, 16 Nov 2026 16:11:08 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Message-Id: <202611160811.6AG8B8QM046993@mse-db.zte.com.cn>
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl2.zte.com.cn with SMTP id 6AG838vr028538;
	Mon, 16 Nov 2026 16:03:08 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Received: from mapi (szxl2zmapp05[null])
	by mapi (Zmail) with MAPI id mid16;
	Mon, 16 Nov 2026 16:03:10 +0800 (CST)
X-Zmail-TransId: 2b076afab8be597-cd7d6
X-Mailer: Zmail v1.0
Date: Mon, 16 Nov 2026 16:03:10 +0800 (CST)
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
        <linux-doc@vger.kernel.org>, <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIFJFU0VORCAwLzJdIHJpc2N2OiBBZGQgQmVpamluZyBMZWFwUmlzZSBUZWNobm9sb2d5IHZlbmRvciBJRCBhbmQgdmVuZG9yIGV4dGVuc2lvbiBmcmFtZXdvcms=?=
X-MAIL: mse-db.zte.com.cn 6AG8B8QM046993
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: lv.yating@zte.com.cn
X-SOURCE-IP: 10.5.228.131 unknown Mon, 16 Nov 2026 16:11:08 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFABA9C.000/4jSgY84f55z5B17r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_001127_800507_AF7A33B5 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
