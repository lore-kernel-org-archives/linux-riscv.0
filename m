Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FCF10F92EC
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 01:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vaFOaDjIh0M6PeygMYxSvfy6TwbAM1+hHde9i9fpSSQ=; b=k7lSg6pY3M60WR
	DdOSfYdCzDshwiL1cXz0rxu59hWa2U00lDXCbyPtwtnt1ZnCCDDXYXp1NzmZVkDXv3Z+x1OfSunZL
	v7zaKuD/6QFETgNxn3GcJ14tI9hLhD4iVVaHtGY7K3CmZCRJ1iAllnsxD4aUwM8QKAe0VhLK+JNtD
	tY0QcUuG9pkcPeV181O+Hzkq++4r1UJhmK2hAQ5s2oyn4ApUZDU4Rzz9H47+AeKVXoaUJeYH3R1ih
	MqB2gxwMRCh0fuv6AKlSOZXlh3eV1wdALy4ZVpkvZu1CIWkypsNMV/YiRIoAzFDUTFU4XN2QF1UJy
	DIjWf5gD9oQhpEGUV6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7klv-0000000Do3m-2SU5;
	Wed, 01 Apr 2026 01:53:31 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7klr-0000000Do3K-2MjI
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 01:53:30 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowACH826Oesxp41nPCw--.8410S2;
	Wed, 01 Apr 2026 09:53:18 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 01 Apr 2026 09:53:17 +0800
Subject: [PATCH v2] riscv: misaligned: Make enabling delegation depend on
 NONPORTABLE
MIME-Version: 1.0
Message-Id: <20260401-riscv-misaligned-dont-delegate-v2-1-5014a288c097@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAIx6zGkC/42NQQqDMBBFryKz7kg0kMaueo/iIk5GHbCxJBJax
 Ls39QRdvs/nvR0SR+EEt2qHyFmSrKFAe6mAZhcmRvGFoVWtUVorjJIo41OSW2QK7NGvYUPPC09
 uY9Q0dpauhllZKJJX5FHeZ+DRF54lbWv8nL3c/Na/1bnBBo0dlO0GrQzpe/m7VDuqKUB/HMcXf
 y7eus4AAAA=
X-Change-ID: 20260330-riscv-misaligned-dont-delegate-3cf98c76ee08
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Songsong Zhang <U2FsdGVkX1@gmail.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID: qwCowACH826Oesxp41nPCw--.8410S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw4kuw4xGw4rGr43CryDZFb_yoWrXF47p3
	yUCFs8KrWUGrn7ZFWaq392gF45Wa95Gry3Gw43t34rGFW5Zryjvr92qr47XFyUGrykW348
	uFyakFy09Fy5Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_KwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUCFAJUUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_185327_986037_8652D15F 
X-CRM114-Status: GOOD (  15.76  )
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

The unaligned access emulation code in Linux has various deficiencies.
For example, it doesn't emulate vector instructions [1] [2], and doesn't
emulate KVM guest accesses. Therefore, requesting misaligned exception
delegation with SBI FWFT actually regresses vector instructions' and KVM
guests' behavior.

Until Linux can handle it properly, guard these sbi_fwft_set() calls
behind RISCV_SBI_FWFT_DELEGATE_MISALIGNED, which in turn depends on
NONPORTABLE. Those who are sure that this wouldn't be a problem can
enable this option, perhaps getting better performance.

The rest of the existing code proceeds as before, except as if
SBI_FWFT_MISALIGNED_EXC_DELEG is not available, to handle any remaining
address misaligned exceptions on a best-effort basis. The KVM SBI FWFT
implementation is also not touched, but it is disabled if the firmware
emulates unaligned accesses.

Cc: stable@vger.kernel.org
Fixes: cf5a8abc6560 ("riscv: misaligned: request misaligned exception from SBI")
Reported-by: Songsong Zhang <U2FsdGVkX1@gmail.com> # KVM
Link: https://lore.kernel.org/linux-riscv/38ce44c1-08cf-4e3f-8ade-20da224f529c@iscas.ac.cn/ [1]
Link: https://lore.kernel.org/linux-riscv/b3cfcdac-0337-4db0-a611-258f2868855f@iscas.ac.cn/ [2]
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Changes in v2:
- BROKEN -> NONPORTABLE (Conor)
- Elaborated the config help text (Conor)
- Add one more breakage report link
- Link to v1: https://patch.msgid.link/20260330-riscv-misaligned-dont-delegate-v1-1-68b089b306c3@iscas.ac.cn
---
 arch/riscv/Kconfig                   | 22 ++++++++++++++++++++++
 arch/riscv/kernel/traps_misaligned.c |  2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..56a4fad9b7c2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -941,6 +941,28 @@ config RISCV_VECTOR_MISALIGNED
 	help
 	  Enable detecting support for vector misaligned loads and stores.
 
+config RISCV_SBI_FWFT_DELEGATE_MISALIGNED
+	bool "Request firmware delegation of unaligned access exceptions"
+	depends on RISCV_SBI
+	depends on NONPORTABLE
+	help
+	  Use SBI FWFT to request delegation of load address misaligned and
+	  store address misaligned exceptions, if possible, and prefer Linux
+	  kernel emulation of these accesses to firmware emulation.
+
+	  Unfortunately, Linux's emulation is still incomplete. Namely, it
+	  currently does not handle vector instructions and KVM guest accesses.
+	  On platforms where these accesses would have been handled by firmware,
+	  enabling this causes unexpected kernel oopses, userspaces crashes and
+	  KVM guest crashes. If you are sure that these are not a problem for
+	  your platform, you can say Y here, which may improve performance.
+
+	  Saying N here will not worsen emulation support for unaligned accesses
+	  even in the case where the firmware also has incomplete support. It
+	  simply keeps the firmware's emulation enabled.
+
+	  If you don't know what to do here, say N.
+
 choice
 	prompt "Unaligned Accesses Support"
 	default RISCV_PROBE_UNALIGNED_ACCESS
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 2a27d3ff4ac6..81b7682e6c6d 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -584,7 +584,7 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
 
 static bool misaligned_traps_delegated;
 
-#ifdef CONFIG_RISCV_SBI
+#if defined(CONFIG_RISCV_SBI_FWFT_DELEGATE_MISALIGNED)
 
 static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
 {

---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260330-riscv-misaligned-dont-delegate-3cf98c76ee08

Best regards,
--  
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
