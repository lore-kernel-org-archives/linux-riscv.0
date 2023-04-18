Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C65C77B78
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qydycFqlu2Qo4gM24HqV7cEN5YqfCjVEasYzZWAcJc=; b=wT6unAhzd6ssv7
	hUe7vDVeMZyTjSYZfwhrr+EXhx9fYGoG5ek9FuT2hgsOvE502RXguc0gQT9KBrC84kqytqfbti9dZ
	eC9Jfo7nHVvk3aqbiSSKLIPr2g+syMSTGnfrvRXWpw0Xn6MkzUNB0/4BNvtfBKBZqEi8DeE3qlzfk
	BTVp25oIQqEPMEIjNSktF41TsVl/yV6+pJKxYUOuqgZViEOBGzWNrHr568VEl17TH0UJP45Rftzga
	98ANC7tFUzwmtecStusH7whtbRjV563DvAOVVBxSktHPdXL9cir1Knsd2OZUnftOQkgUP7N1Xjun7
	T+KkWhJvwzXXKhcT43SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pomEV-002Q8w-2G;
	Tue, 18 Apr 2023 14:22:59 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pomEP-002Q5I-2l
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 14:22:57 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pomEF-000Ub9-Fe; Tue, 18 Apr 2023 15:22:43 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1pomEF-0066nY-0U;
	Tue, 18 Apr 2023 15:22:43 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: kvm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	ajones@ventanamicro.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH kvmtool 2/2] riscv: add zicboz support
Date: Tue, 18 Apr 2023 15:22:41 +0100
Message-Id: <20230418142241.1456070-3-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418142241.1456070-1-ben.dooks@codethink.co.uk>
References: <20230418142241.1456070-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_072253_895375_3B57934C 
X-CRM114-Status: GOOD (  12.66  )
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

Like ZICBOM, the ZICBOZ extension requires passing extra information to
the guest. Add the control to pass the information to the guest, get it
from the kvm ioctl and pass into the guest via the device-tree info.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 riscv/fdt.c                         | 11 +++++++++++
 riscv/include/asm/kvm.h             |  2 ++
 riscv/include/kvm/kvm-config-arch.h |  3 +++
 3 files changed, 16 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 3cdb95c..fa6d153 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -20,6 +20,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
 	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
 	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
+	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
@@ -46,6 +47,7 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 	const char *valid_isa_order = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 	int arr_sz = ARRAY_SIZE(isa_info_arr);
 	unsigned long cbom_blksz = 0;
+	unsigned long cboz_blksz = 0;
 
 	_FDT(fdt_begin_node(fdt, "cpus"));
 	_FDT(fdt_property_cell(fdt, "#address-cells", 0x1));
@@ -95,6 +97,13 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 					die("KVM_GET_ONE_REG failed (config.zicbom_block_size)");
 			}
 
+			if (isa_info_arr[i].ext_id == KVM_RISCV_ISA_EXT_ZICBOZ && !cboz_blksz) {
+				reg.id = RISCV_CONFIG_REG(zicboz_block_size);
+				reg.addr = (unsigned long)&cboz_blksz;
+				if (ioctl(vcpu->vcpu_fd, KVM_GET_ONE_REG, &reg) < 0)
+					die("KVM_GET_ONE_REG failed (config.zicboz_block_size)");
+			}
+
 			if ((strlen(isa_info_arr[i].name) + pos + 1) >= CPU_ISA_MAX_LEN) {
 				pr_warning("Insufficient space to append ISA exension\n");
 				break;
@@ -116,6 +125,8 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 		_FDT(fdt_property_string(fdt, "riscv,isa", cpu_isa));
 		if (cbom_blksz)
 			_FDT(fdt_property_cell(fdt, "riscv,cbom-block-size", cbom_blksz));
+		if (cboz_blksz)
+			_FDT(fdt_property_cell(fdt, "riscv,cboz-block-size", cboz_blksz));
 		_FDT(fdt_property_cell(fdt, "reg", cpu));
 		_FDT(fdt_property_string(fdt, "status", "okay"));
 
diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index 92af6f3..e44c1e9 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -52,6 +52,7 @@ struct kvm_riscv_config {
 	unsigned long mvendorid;
 	unsigned long marchid;
 	unsigned long mimpid;
+	unsigned long zicboz_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
@@ -105,6 +106,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVINVAL,
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
+	KVM_RISCV_ISA_EXT_ZICBOZ,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 188125c..46a774e 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -24,6 +24,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zicbom",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICBOM],	\
 		    "Disable Zicbom Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zicboz",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICBOZ],	\
+		    "Disable Zicboz Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zihintpause",			\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIHINTPAUSE],\
 		    "Disable Zihintpause Extension"),
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
