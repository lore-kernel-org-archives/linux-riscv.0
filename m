Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3145C3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=POPY6QzQRnCx6vSweIdNP8Qif/MjvDSCx++2GNBdb84=; b=K/Z45wHGUWZ6cq
	+9M3i0RIKqePpDeWJKfxiiO6bahycIqUcvkWshS42BXbeN6EahLi6fP5czdolb0qePgL5FgHLVeZW
	zkOfUtHbFYh1EUhaZ4Kb9V8eZHAg1hYWQs5UXXAILGGSdfpawr2MDT/4Q8sEF8yAGeVXryuQY+Yfh
	+dGr7J3jjviTfYgLvRhb2ZHzF7OageXi0FF4D0EBkAJcMHtE79JMdJ0NMOWVzLCTPEppvWuQePrNj
	wooH2wYH5fpkXtQs3Wfw7z+kNZfUvCfJEhQ6NAE3rH3KKh564Lt5/EPkS2Sn98JSrxYIuWiE3SgXs
	SGhyADqmhXMYM7Y/k72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy41-00000007sDh-2lvQ;
	Mon, 05 May 2025 15:49:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy2w-00000007s1o-2kcm
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 15:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746460077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Awzo7DI7AJd+wpwgJ5wGQ8SIQd3qq+gLPnXP8U+TGDg=;
	b=KdgLOSA4VwrmyPSkO/z1bnqksU8u9JwlChEmX+TW46gigBB3zRwiO6b67ykuYC3T/7+FTt
	8QFhDmY9LbOMpTCWIl+JRuY0LTdOaEl5D2wNelKcOSi8SGVLtu9KOTlQIfrV8SPusEA+xp
	IKZOQ5DrjoNUftoyW1OkGWwBFodkd58=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-E2DIrUWNOUKANXqO-vlJSw-1; Mon,
 05 May 2025 11:45:36 -0400
X-MC-Unique: E2DIrUWNOUKANXqO-vlJSw-1
X-Mimecast-MFC-AGG-ID: E2DIrUWNOUKANXqO-vlJSw_1746459934
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ABEA419560AA;
	Mon,  5 May 2025 15:45:33 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.34.28])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8A48B30001AB;
	Mon,  5 May 2025 15:45:25 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: x86@kernel.org,
	linux-efi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Jones <pjones@redhat.com>,
	Daniel Berrange <berrange@redhat.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Luca Boccassi <bluca@debian.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] efi: Add a mechanism for embedding SBAT section
Date: Mon,  5 May 2025 17:45:21 +0200
Message-ID: <20250505154523.231233-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_084758_765630_480661AD 
X-CRM114-Status: GOOD (  20.78  )
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

Changes since v1 (Ard):
(https://lore.kernel.org/linux-efi/20250424080950.289864-1-vkuznets@redhat.com/)
- Get back to the idea of putting '.sbat' in between '.text' and '.data' as
  the later also covers '.bss' (and '.pgtable' on x86) which are not present
  in the file but must be accounted for in memory (see the discussion on v1
  for additional details).
- CONFIG_EFI_SBAT is now automatically set when CONFIG_EFI_SBAT_FILE is set.
- Simplified make magic for tracing possible sbat data changes.
- Dropped 'sbat.S' for zboot (x86 stays as there's no good place for it in
  the existing 'vmlinux' compilation units).
- Other necessary tweaks.

Original description:

SBAT is a mechanism which improves SecureBoot revocations of UEFI binaries
by introducing a generation-based technique. Compromised or vulnerable UEFI
binaries can be prevented from booting by bumping the minimal required
generation for the specific component in the bootloader. More information
on the SBAT can be obtained here:

https://github.com/rhboot/shim/blob/main/SBAT.md

Currently, shim checks .sbat data for itself in self-test and for second
stage bootloaders (grub, sd-boot, UKIs with sd-stub, ...) but kernel
revocations require cycling signing keys or adding kernel hashes to shim's
internal dbx. Adding .sbat to kernel and enforcing it on kernel loading
will allow to do the same tracking and revocation distros are already
doing with a simplified mechanism, and without having to keep lists of
kernels outside of the git repos.

Previously, an attempt was made to add ".sbat" section to the linux kernel:

https://lwn.net/Articles/938422/

The approach was rejected mainly because currently there's no policy on how
to update SBAT generation number when a new vulnerability is discovered. In
particular, it is unclear what to do with stable kernels which may or may
not backport certain patches making it impossible to describe the current
state with a simple number.

This series suggests a different approach: instead of defining SBAT
information, provide a mechanism for downstream kernel builders (distros)
to include their own SBAT data. This leaves the decision on the policy to
the distro vendors. Basically, each distro implementing SecureBoot today,
will have an option to inject their own SBAT data during kernel build and
before it gets signed by their SecureBoot CA. Different distro do not need
to agree on the common SBAT component names or generation numbers as each
distro ships its own 'shim' with their own 'vendor_cert'/'vendor_db'. Linux
upstream will never, ever need to care about the data unless they choose in
the future to participate in that way.

Vitaly Kuznetsov (2):
  efi: zboot specific mechanism for embedding SBAT section
  x86/efi: Implement support for embedding SBAT data for x86

 arch/x86/boot/Makefile                      |  2 +-
 arch/x86/boot/compressed/Makefile           |  5 ++++
 arch/x86/boot/compressed/sbat.S             |  7 +++++
 arch/x86/boot/compressed/vmlinux.lds.S      |  8 +++++
 arch/x86/boot/header.S                      | 33 +++++++++++++++------
 drivers/firmware/efi/Kconfig                | 24 +++++++++++++++
 drivers/firmware/efi/libstub/Makefile.zboot |  4 +++
 drivers/firmware/efi/libstub/zboot-header.S | 22 ++++++++++++--
 drivers/firmware/efi/libstub/zboot.lds      | 11 +++++++
 9 files changed, 104 insertions(+), 12 deletions(-)
 create mode 100644 arch/x86/boot/compressed/sbat.S

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
