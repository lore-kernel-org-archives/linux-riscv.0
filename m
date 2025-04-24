Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FDEC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pK9oYoJpHq90UX/7iaDFyK1uLV/FPXxRTQXyMIZNDrs=; b=RUGUp6MuTCl+li
	/a16LOFyUmmN7D+93JvGA11efzzuoQ74WBnmsWby58ewiyGIZkQXAYjslWDNbHVSlzHFU/neyVyoT
	ImQLs/3AFDtycyTDxqqOi55Df03PyTreWWREvfz5fAuqjlwiiJbf6kTqcEKvF1aNhIlcR71HPtSYD
	9U6T/yPS9oIbyznO89Zj0RR7qFTPw9XK8NK7riSk2SDJUFzcLCgvuZdffC3QDPlOT5uAf3B0W0BPo
	NOQDP3j+EAzVjIU8AUR2mqmSvl7menZqpBuiGfYD+b4Ka5iHLA+G8hsUAWHFKOkZ3SExyWNXWBJDO
	oE6IE+18WD8vSu1vEsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7smh-0000000DTx6-2v0P;
	Thu, 24 Apr 2025 09:22:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rgl-0000000DIGy-43oC
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PZaDOlwgs+a0eg3mppTrQoff4ytVBOHdk4tnOUhy/gU=; b=KnHYtMhAbUuzY8dxqkQuBAnme1
	in5dCJ7VKybveAEiE13CSX4fCnsPw8+XWf3syjubaFuW+fheaM50rwatZ2U8SNZFVzDpD0JwBcatT
	hc9sAMX7/JZX9nw3qG6z2xj4JuYOTPgHbwA8Hev95ZpXmPJhQepPINjcP0Az85/KonAXkrhuTHtz5
	rZ3Zfb4HJAgfsiKb55bY62gqS+F6uP2RbM4lJlaSpE+1NIKqYC48cJDa2KQ2p1NgBMWRDbySm1Oju
	lxYYE98au7sMQManKJJYj1WaBnWz3oy/L9RXx+EfgQmg12GTPkaogjak6lfZjCCgfOuvMlCslnd6M
	8DcRxpZg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7rgi-0000000BbX8-2Xp7
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 08:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745482322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PZaDOlwgs+a0eg3mppTrQoff4ytVBOHdk4tnOUhy/gU=;
	b=Nlq74Jkcjsx+/BBIFTTjBNJVK/SwTnozTYzfMl8qKYlmi7q0MI4KLNyXqTEqUGrAbOkjNx
	73X24n5K45tpljJjidW009VM2oKDaK5iPoSHy76zDs8mHUd1jVaFSO9q8+6eDG9eS2Pmui
	tuvaxCjzAGIOrqDy+nmwc+9ss6uAiXw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745482323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PZaDOlwgs+a0eg3mppTrQoff4ytVBOHdk4tnOUhy/gU=;
	b=OLLmzO8/agikFx1T1jvpfwz8TBbhvyEtrHMC2oy+vo2SdPfrYcX0QGYuXxAS5SsCr3aCkK
	Spk7QC9G2oPhcO5p1gpG0u1+MJtiKUMMV9LwJ2mM+Ie0OVXratYG1e69K0B4XV89JYbko3
	zvF4Pgzab0Zdz7VHF2P63I37cESXk/w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-kVvFzdLzNvuPIu-z6mnAIg-1; Thu,
 24 Apr 2025 04:10:15 -0400
X-MC-Unique: kVvFzdLzNvuPIu-z6mnAIg-1
X-Mimecast-MFC-AGG-ID: kVvFzdLzNvuPIu-z6mnAIg_1745482212
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ED54C1800264;
	Thu, 24 Apr 2025 08:10:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.224.198])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E142F30001A2;
	Thu, 24 Apr 2025 08:09:52 +0000 (UTC)
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
Subject: [PATCH 0/2] efi: Add a mechanism for embedding SBAT section
Date: Thu, 24 Apr 2025 12:09:48 +0400
Message-ID: <20250424080950.289864-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_091204_835606_65FA69F5 
X-CRM114-Status: GOOD (  17.72  )
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

Changes since RFC:
(https://lore.kernel.org/linux-efi/20250305101744.1706803-1-vkuznets@redhat.com/)

- Implement SBAT embedding for zboot. (Smoke tested on aarch64 only,
 apologies if I missed some important differences on other arches!)
 It would've been possible to implement SBAT embedding for !zboot case 
 too I think but this looks like an unnecessary complication: 
 SecureBoot signing is likely to be done by distro vendors only and these
 will likely want zboot enabled anyway.
  
- x86: Thanks to Ard, CRC32 is now gone (see commit 9c54baab4401 ("x86/boot:
 Drop CRC-32 checksum and the build tool that generates it")) and thus
 SBAT can be placed to the very end of the binary, this simplifies things
 a bit.

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
  efi/libstub: zboot specific mechanism for embedding SBAT section
  x86/efi: Implement support for embedding SBAT data for x86

 arch/x86/boot/Makefile                      |  2 +-
 arch/x86/boot/compressed/Makefile           |  2 ++
 arch/x86/boot/compressed/vmlinux.lds.S      | 13 +++++++++++
 arch/x86/boot/header.S                      | 13 +++++++++++
 drivers/firmware/efi/Kconfig                | 25 +++++++++++++++++++++
 drivers/firmware/efi/libstub/Makefile       |  7 ++++++
 drivers/firmware/efi/libstub/Makefile.zboot |  3 ++-
 drivers/firmware/efi/libstub/sbat.S         |  7 ++++++
 drivers/firmware/efi/libstub/zboot-header.S | 14 ++++++++++++
 drivers/firmware/efi/libstub/zboot.lds      | 17 ++++++++++++++
 10 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 drivers/firmware/efi/libstub/sbat.S

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
