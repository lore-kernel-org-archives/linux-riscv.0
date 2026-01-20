Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FC4D2ED13
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiPkbQgvbqEl0Z1fhvkvc10hGZP7VKj7bjON1zLIyzM=; b=uTrMv+gmNpnmjn
	Q9yNh6V/eifxHHrex8GPZrGBuvYYKfObMuMjqfY9m1rqvVoYxSu5ahxp4D/LEQ+h3pxHECKGG/lkj
	YQDI6+dLJwfy1db6aIQ6hl42b3ff6ENgPYZiGVIj9cmgtunR2Y7lQ3ju+uQyuChBaOCFXVSVtjYN+
	Gev5HHmdzmZC0VitCMLbvjchGwB5iPcVZWHpOLKDSti6uNR09r9jucysK7TM+nstHajRmec3AcYAh
	J5uBGXdT+jxFbx39xA0dUYAOfUcLcunLWkWVaOtIjuCehST35Tj7kTUZQk0wqizWvqUw0y4SNnSxC
	pzAgUDjOfZBlV4OnLGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39p-000000039UC-1Asv;
	Tue, 20 Jan 2026 04:15:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39M-000000039Ms-1G1B
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A684C60165;
	Tue, 20 Jan 2026 04:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6D4C19424;
	Tue, 20 Jan 2026 04:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882527;
	bh=08+NoXyvW3Xk6Oo5KOcsUwbtLfO2FJFdCtJSOZ1Zuws=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=tRPacVIB4t2VbsUGJIO2a17wCy77QjWXAqYWwS+DmywWQ4CWeiln7CdoF7NgrS5WO
	 QctBL5aVxNJi9c4/0f0XNETkCdcbkj5n0ztIYdU9Mbr0gJzs7QpYdlecRDZg9xYIe+
	 uE/TOVtnIlYqqra03dzwi5VJodv6Bhdk6Ky0sTFNwhoEU3aTMPuXGRURkPrgwkh0Vp
	 9nJo0cOP4H6KavTf6THwQiyeigZ17k9C4fnZx4rQPy1tYmDSAmaywdZv1CxvaxyEHa
	 zlQbXvbGESSPyLfKcu5hgSEZDfutLFOyGI/vdAMsc2gc4QoK4BZhGE+rBO3g7wG/Ae
	 2xdke4ZtlmOdw==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:54 -0800
Subject: [PATCH NFU RFC 17/19] riscv: dts: qemu: add dump from virt machine
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-17-aa2a75153832@kernel.org>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
In-Reply-To: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=17006; i=fustini@kernel.org;
 h=from:subject:message-id; bh=08+NoXyvW3Xk6Oo5KOcsUwbtLfO2FJFdCtJSOZ1Zuws=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwY3Jj7gXmZ++ZKKxNwG3X8sSgwn27sPfVXYGlV3e
 JL8woNPOkpZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATmWbFyLBL4M0U39MWP16x
 ZByefHHb1xbd//PaHiTNPVG+SO2xi1IXw//8Lc5J4SvPOkR0/vQxNpD/lTzvQqm8REaej170hLb
 6RC4A
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

[NOT FOR UPSTREAM]

Dumped dtb from qemu branch based on the v4 riscv-ssqosid-cbqri series.

 $ qemu-system-riscv64 -version
 QEMU emulator version 10.2.50 (v10.2.0-208-g087112467867)
 Copyright (c) 2003-2025 Fabrice Bellard and the QEMU Project developers

 $ qemu-system-riscv64 \
      -M virt \
      -nographic \
      -smp 8 \
      -bios output/images/fw_jump.elf \
      -kernel $HOME/kernel/cbqri-linux/arch/riscv/boot/Image \
      -append "root=/dev/vda ro" \
      -drive file=output/images/rootfs.ext2,format=raw,id=hd0 \
      -device virtio-blk-device,drive=hd0 \
      -machine dumpdtb=qemu.dtb

Link: https://lore.kernel.org/all/20260105-riscv-ssqosid-cbqri-v4-0-9ad7671dde78@kernel.org/
Link: https://github.com/tt-fustini/qemu/tree/b4/riscv-ssqosid-cbqri
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts | 399 +++++++++++++++++++++++++++
 1 file changed, 399 insertions(+)

diff --git a/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts b/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts
new file mode 100644
index 000000000000..4c6257bec42d
--- /dev/null
+++ b/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts
@@ -0,0 +1,399 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/dts-v1/;
+
+/ {
+	#address-cells = <0x02>;
+	#size-cells = <0x02>;
+	compatible = "riscv-virtio";
+	model = "riscv-virtio,qemu";
+
+	poweroff {
+		value = <0x5555>;
+		offset = <0x00>;
+		regmap = <0x12>;
+		compatible = "syscon-poweroff";
+	};
+
+	reboot {
+		value = <0x7777>;
+		offset = <0x00>;
+		regmap = <0x12>;
+		compatible = "syscon-reboot";
+	};
+
+	platform-bus@4000000 {
+		interrupt-parent = <0x11>;
+		ranges = <0x00 0x00 0x4000000 0x2000000>;
+		#address-cells = <0x01>;
+		#size-cells = <0x01>;
+		compatible = "qemu,platform\0simple-bus";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00 0x80000000 0x00 0x8000000>;
+	};
+
+	cpus {
+		#address-cells = <0x01>;
+		#size-cells = <0x00>;
+		timebase-frequency = <0x989680>;
+
+		cpu@0 {
+			phandle = <0x0f>;
+			device_type = "cpu";
+			reg = <0x00>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,cbop-block-size = <0x40>;
+			riscv,cboz-block-size = <0x40>;
+			riscv,cbom-block-size = <0x40>;
+			riscv,isa-extensions = "i\0m\0a\0f\0d\0c\0h\0zic64b\0zicbom\0zicbop\0zicboz\0ziccamoa\0ziccif\0zicclsm\0ziccrse\0zicntr\0zicsr\0zifencei\0zihintntl\0zihintpause\0zihpm\0zmmul\0za64rs\0zaamo\0zalrsc\0zawrs\0zfa\0zca\0zcd\0zba\0zbb\0zbc\0zbs\0sdtrig\0shcounterenw\0shgatpa\0shtvala\0shvsatpa\0shvstvala\0shvstvecd\0ssccptr\0sscounterenw\0ssqosid\0ssstrict\0sstc\0sstvala\0sstvecd\0ssu64xl\0svadu\0svvptc";
+			riscv,isa-base = "rv64i";
+			riscv,isa = "rv64imafdch_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sdtrig_shcounterenw_shgatpa_shtvala_shvsatpa_shvstvala_shvstvecd_ssccptr_sscounterenw_ssqosid_ssstrict_sstc_sstvala_sstvecd_ssu64xl_svadu_svvptc";
+			mmu-type = "riscv,sv57";
+
+			interrupt-controller {
+				#interrupt-cells = <0x01>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+				phandle = <0x10>;
+			};
+		};
+
+		cpu@1 {
+			phandle = <0x0d>;
+			device_type = "cpu";
+			reg = <0x01>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,cbop-block-size = <0x40>;
+			riscv,cboz-block-size = <0x40>;
+			riscv,cbom-block-size = <0x40>;
+			riscv,isa-extensions = "i\0m\0a\0f\0d\0c\0h\0zic64b\0zicbom\0zicbop\0zicboz\0ziccamoa\0ziccif\0zicclsm\0ziccrse\0zicntr\0zicsr\0zifencei\0zihintntl\0zihintpause\0zihpm\0zmmul\0za64rs\0zaamo\0zalrsc\0zawrs\0zfa\0zca\0zcd\0zba\0zbb\0zbc\0zbs\0sdtrig\0shcounterenw\0shgatpa\0shtvala\0shvsatpa\0shvstvala\0shvstvecd\0ssccptr\0sscounterenw\0ssqosid\0ssstrict\0sstc\0sstvala\0sstvecd\0ssu64xl\0svadu\0svvptc";
+			riscv,isa-base = "rv64i";
+			riscv,isa = "rv64imafdch_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sdtrig_shcounterenw_shgatpa_shtvala_shvsatpa_shvstvala_shvstvecd_ssccptr_sscounterenw_ssqosid_ssstrict_sstc_sstvala_sstvecd_ssu64xl_svadu_svvptc";
+			mmu-type = "riscv,sv57";
+
+			interrupt-controller {
+				#interrupt-cells = <0x01>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+				phandle = <0x0e>;
+			};
+		};
+
+		cpu@2 {
+			phandle = <0x0b>;
+			device_type = "cpu";
+			reg = <0x02>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,cbop-block-size = <0x40>;
+			riscv,cboz-block-size = <0x40>;
+			riscv,cbom-block-size = <0x40>;
+			riscv,isa-extensions = "i\0m\0a\0f\0d\0c\0h\0zic64b\0zicbom\0zicbop\0zicboz\0ziccamoa\0ziccif\0zicclsm\0ziccrse\0zicntr\0zicsr\0zifencei\0zihintntl\0zihintpause\0zihpm\0zmmul\0za64rs\0zaamo\0zalrsc\0zawrs\0zfa\0zca\0zcd\0zba\0zbb\0zbc\0zbs\0sdtrig\0shcounterenw\0shgatpa\0shtvala\0shvsatpa\0shvstvala\0shvstvecd\0ssccptr\0sscounterenw\0ssqosid\0ssstrict\0sstc\0sstvala\0sstvecd\0ssu64xl\0svadu\0svvptc";
+			riscv,isa-base = "rv64i";
+			riscv,isa = "rv64imafdch_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sdtrig_shcounterenw_shgatpa_shtvala_shvsatpa_shvstvala_shvstvecd_ssccptr_sscounterenw_ssqosid_ssstrict_sstc_sstvala_sstvecd_ssu64xl_svadu_svvptc";
+			mmu-type = "riscv,sv57";
+
+			interrupt-controller {
+				#interrupt-cells = <0x01>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+				phandle = <0x0c>;
+			};
+		};
+
+		cpu@3 {
+			phandle = <0x09>;
+			device_type = "cpu";
+			reg = <0x03>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,cbop-block-size = <0x40>;
+			riscv,cboz-block-size = <0x40>;
+			riscv,cbom-block-size = <0x40>;
+			riscv,isa-extensions = "i\0m\0a\0f\0d\0c\0h\0zic64b\0zicbom\0zicbop\0zicboz\0ziccamoa\0ziccif\0zicclsm\0ziccrse\0zicntr\0zicsr\0zifencei\0zihintntl\0zihintpause\0zihpm\0zmmul\0za64rs\0zaamo\0zalrsc\0zawrs\0zfa\0zca\0zcd\0zba\0zbb\0zbc\0zbs\0sdtrig\0shcounterenw\0shgatpa\0shtvala\0shvsatpa\0shvstvala\0shvstvecd\0ssccptr\0sscounterenw\0ssqosid\0ssstrict\0sstc\0sstvala\0sstvecd\0ssu64xl\0svadu\0svvptc";
+			riscv,isa-base = "rv64i";
+			riscv,isa = "rv64imafdch_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sdtrig_shcounterenw_shgatpa_shtvala_shvsatpa_shvstvala_shvstvecd_ssccptr_sscounterenw_ssqosid_ssstrict_sstc_sstvala_sstvecd_ssu64xl_svadu_svvptc";
+			mmu-type = "riscv,sv57";
+
+			interrupt-controller {
+				#interrupt-cells = <0x01>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+				phandle = <0x0a>;
+			};
+		};
+
+		cpu@4 {
+			phandle = <0x07>;
+			device_type = "cpu";
+			reg = <0x04>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,cbop-block-size = <0x40>;
+			riscv,cboz-block-size = <0x40>;
+			riscv,cbom-block-size = <0x40>;
+			riscv,isa-extensions = "i\0m\0a\0f\0d\0c\0h\0zic64b\0zicbom\0zicbop\0zicboz\0ziccamoa\0ziccif\0zicclsm\0ziccrse\0zicntr\0zicsr\0zifencei\0zihintntl\0zihintpause\0zihpm\0zmmul\0za64rs\0zaamo\0zalrsc\0zawrs\0zfa\0zca\0zcd\0zba\0zbb\0zbc\0zbs\0sdtrig\0shcounterenw\0shgatpa\0shtvala\0shvsatpa\0shvstvala\0shvstvecd\0ssccptr\0sscounterenw\0ssqosid\0ssstrict\0sstc\0sstvala\0sstvecd\0ssu64xl\0svadu\0svvptc";
+			riscv,isa-base = "rv64i";
+			riscv,isa = "rv64imafdch_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sdtrig_shcounterenw_shgatpa_shtvala_shvsatpa_shvstvala_shvstvecd_ssccptr_sscounterenw_ssqosid_ssstrict_sstc_sstvala_sstvecd_ssu64xl_svadu_svvptc";
+			mmu-type = "riscv,sv57";
+
+			interrupt-controller {
+				#interrupt-cells = <0x01>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+				phandle = <0x08>;
+			};
+		};
+
+		cpu@5 {
+			phandle = <0x05>;
+			device_type = "cpu";
+			reg = <0x05>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,cbop-block-size = <0x40>;
+			riscv,cboz-block-size = <0x40>;
+			riscv,cbom-block-size = <0x40>;
+			riscv,isa-extensions = "i\0m\0a\0f\0d\0c\0h\0zic64b\0zicbom\0zicbop\0zicboz\0ziccamoa\0ziccif\0zicclsm\0ziccrse\0zicntr\0zicsr\0zifencei\0zihintntl\0zihintpause\0zihpm\0zmmul\0za64rs\0zaamo\0zalrsc\0zawrs\0zfa\0zca\0zcd\0zba\0zbb\0zbc\0zbs\0sdtrig\0shcounterenw\0shgatpa\0shtvala\0shvsatpa\0shvstvala\0shvstvecd\0ssccptr\0sscounterenw\0ssqosid\0ssstrict\0sstc\0sstvala\0sstvecd\0ssu64xl\0svadu\0svvptc";
+			riscv,isa-base = "rv64i";
+			riscv,isa = "rv64imafdch_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sdtrig_shcounterenw_shgatpa_shtvala_shvsatpa_shvstvala_shvstvecd_ssccptr_sscounterenw_ssqosid_ssstrict_sstc_sstvala_sstvecd_ssu64xl_svadu_svvptc";
+			mmu-type = "riscv,sv57";
+
+			interrupt-controller {
+				#interrupt-cells = <0x01>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+				phandle = <0x06>;
+			};
+		};
+
+		cpu@6 {
+			phandle = <0x03>;
+			device_type = "cpu";
+			reg = <0x06>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,cbop-block-size = <0x40>;
+			riscv,cboz-block-size = <0x40>;
+			riscv,cbom-block-size = <0x40>;
+			riscv,isa-extensions = "i\0m\0a\0f\0d\0c\0h\0zic64b\0zicbom\0zicbop\0zicboz\0ziccamoa\0ziccif\0zicclsm\0ziccrse\0zicntr\0zicsr\0zifencei\0zihintntl\0zihintpause\0zihpm\0zmmul\0za64rs\0zaamo\0zalrsc\0zawrs\0zfa\0zca\0zcd\0zba\0zbb\0zbc\0zbs\0sdtrig\0shcounterenw\0shgatpa\0shtvala\0shvsatpa\0shvstvala\0shvstvecd\0ssccptr\0sscounterenw\0ssqosid\0ssstrict\0sstc\0sstvala\0sstvecd\0ssu64xl\0svadu\0svvptc";
+			riscv,isa-base = "rv64i";
+			riscv,isa = "rv64imafdch_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sdtrig_shcounterenw_shgatpa_shtvala_shvsatpa_shvstvala_shvstvecd_ssccptr_sscounterenw_ssqosid_ssstrict_sstc_sstvala_sstvecd_ssu64xl_svadu_svvptc";
+			mmu-type = "riscv,sv57";
+
+			interrupt-controller {
+				#interrupt-cells = <0x01>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+				phandle = <0x04>;
+			};
+		};
+
+		cpu@7 {
+			phandle = <0x01>;
+			device_type = "cpu";
+			reg = <0x07>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,cbop-block-size = <0x40>;
+			riscv,cboz-block-size = <0x40>;
+			riscv,cbom-block-size = <0x40>;
+			riscv,isa-extensions = "i\0m\0a\0f\0d\0c\0h\0zic64b\0zicbom\0zicbop\0zicboz\0ziccamoa\0ziccif\0zicclsm\0ziccrse\0zicntr\0zicsr\0zifencei\0zihintntl\0zihintpause\0zihpm\0zmmul\0za64rs\0zaamo\0zalrsc\0zawrs\0zfa\0zca\0zcd\0zba\0zbb\0zbc\0zbs\0sdtrig\0shcounterenw\0shgatpa\0shtvala\0shvsatpa\0shvstvala\0shvstvecd\0ssccptr\0sscounterenw\0ssqosid\0ssstrict\0sstc\0sstvala\0sstvecd\0ssu64xl\0svadu\0svvptc";
+			riscv,isa-base = "rv64i";
+			riscv,isa = "rv64imafdch_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sdtrig_shcounterenw_shgatpa_shtvala_shvsatpa_shvstvala_shvstvecd_ssccptr_sscounterenw_ssqosid_ssstrict_sstc_sstvala_sstvecd_ssu64xl_svadu_svvptc";
+			mmu-type = "riscv,sv57";
+
+			interrupt-controller {
+				#interrupt-cells = <0x01>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+				phandle = <0x02>;
+			};
+		};
+
+		cpu-map {
+
+			cluster0 {
+
+				core0 {
+					cpu = <0x0f>;
+				};
+
+				core1 {
+					cpu = <0x0d>;
+				};
+
+				core2 {
+					cpu = <0x0b>;
+				};
+
+				core3 {
+					cpu = <0x09>;
+				};
+
+				core4 {
+					cpu = <0x07>;
+				};
+
+				core5 {
+					cpu = <0x05>;
+				};
+
+				core6 {
+					cpu = <0x03>;
+				};
+
+				core7 {
+					cpu = <0x01>;
+				};
+			};
+		};
+	};
+
+	pmu {
+		riscv,event-to-mhpmcounters = <0x01 0x01 0x7fff9 0x02 0x02 0x7fffc 0x10019 0x10019 0x7fff8 0x1001b 0x1001b 0x7fff8 0x10021 0x10021 0x7fff8>;
+		compatible = "riscv,pmu";
+	};
+
+	fw-cfg@10100000 {
+		dma-coherent;
+		reg = <0x00 0x10100000 0x00 0x18>;
+		compatible = "qemu,fw-cfg-mmio";
+	};
+
+	flash@20000000 {
+		bank-width = <0x04>;
+		reg = <0x00 0x20000000 0x00 0x2000000 0x00 0x22000000 0x00 0x2000000>;
+		compatible = "cfi-flash";
+	};
+
+	aliases {
+		serial0 = "/soc/serial@10000000";
+	};
+
+	chosen {
+		bootargs = "root=/dev/vda ro loglevel=8";
+		stdout-path = "/soc/serial@10000000";
+		rng-seed = <0x56a2904d 0x281bbaec 0x55c405c1 0x602a34cd 0x3490edca 0x3ed9ed5d 0xa98e5ed6 0xa663e102>;
+	};
+
+	soc {
+		#address-cells = <0x02>;
+		#size-cells = <0x02>;
+		compatible = "simple-bus";
+		ranges;
+
+		rtc@101000 {
+			interrupts = <0x0b>;
+			interrupt-parent = <0x11>;
+			reg = <0x00 0x101000 0x00 0x1000>;
+			compatible = "google,goldfish-rtc";
+		};
+
+		serial@10000000 {
+			interrupts = <0x0a>;
+			interrupt-parent = <0x11>;
+			clock-frequency = "\08@";
+			reg = <0x00 0x10000000 0x00 0x100>;
+			compatible = "ns16550a";
+		};
+
+		test@100000 {
+			phandle = <0x12>;
+			reg = <0x00 0x100000 0x00 0x1000>;
+			compatible = "sifive,test1\0sifive,test0\0syscon";
+		};
+
+		virtio_mmio@10008000 {
+			interrupts = <0x08>;
+			interrupt-parent = <0x11>;
+			reg = <0x00 0x10008000 0x00 0x1000>;
+			compatible = "virtio,mmio";
+		};
+
+		virtio_mmio@10007000 {
+			interrupts = <0x07>;
+			interrupt-parent = <0x11>;
+			reg = <0x00 0x10007000 0x00 0x1000>;
+			compatible = "virtio,mmio";
+		};
+
+		virtio_mmio@10006000 {
+			interrupts = <0x06>;
+			interrupt-parent = <0x11>;
+			reg = <0x00 0x10006000 0x00 0x1000>;
+			compatible = "virtio,mmio";
+		};
+
+		virtio_mmio@10005000 {
+			interrupts = <0x05>;
+			interrupt-parent = <0x11>;
+			reg = <0x00 0x10005000 0x00 0x1000>;
+			compatible = "virtio,mmio";
+		};
+
+		virtio_mmio@10004000 {
+			interrupts = <0x04>;
+			interrupt-parent = <0x11>;
+			reg = <0x00 0x10004000 0x00 0x1000>;
+			compatible = "virtio,mmio";
+		};
+
+		virtio_mmio@10003000 {
+			interrupts = <0x03>;
+			interrupt-parent = <0x11>;
+			reg = <0x00 0x10003000 0x00 0x1000>;
+			compatible = "virtio,mmio";
+		};
+
+		virtio_mmio@10002000 {
+			interrupts = <0x02>;
+			interrupt-parent = <0x11>;
+			reg = <0x00 0x10002000 0x00 0x1000>;
+			compatible = "virtio,mmio";
+		};
+
+		virtio_mmio@10001000 {
+			interrupts = <0x01>;
+			interrupt-parent = <0x11>;
+			reg = <0x00 0x10001000 0x00 0x1000>;
+			compatible = "virtio,mmio";
+		};
+
+		plic@c000000 {
+			phandle = <0x11>;
+			riscv,ndev = <0x5f>;
+			reg = <0x00 0xc000000 0x00 0x600000>;
+			interrupts-extended = <0x10 0x0b 0x10 0x09 0x0e 0x0b 0x0e 0x09 0x0c 0x0b 0x0c 0x09 0x0a 0x0b 0x0a 0x09 0x08 0x0b 0x08 0x09 0x06 0x0b 0x06 0x09 0x04 0x0b 0x04 0x09 0x02 0x0b 0x02 0x09>;
+			interrupt-controller;
+			compatible = "sifive,plic-1.0.0\0riscv,plic0";
+			#address-cells = <0x00>;
+			#interrupt-cells = <0x01>;
+		};
+
+		clint@2000000 {
+			interrupts-extended = <0x10 0x03 0x10 0x07 0x0e 0x03 0x0e 0x07 0x0c 0x03 0x0c 0x07 0x0a 0x03 0x0a 0x07 0x08 0x03 0x08 0x07 0x06 0x03 0x06 0x07 0x04 0x03 0x04 0x07 0x02 0x03 0x02 0x07>;
+			reg = <0x00 0x2000000 0x00 0x10000>;
+			compatible = "sifive,clint0\0riscv,clint0";
+		};
+
+		pci@30000000 {
+			interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
+			interrupt-map = <0x00 0x00 0x00 0x01 0x11 0x20 0x00 0x00 0x00 0x02 0x11 0x21 0x00 0x00 0x00 0x03 0x11 0x22 0x00 0x00 0x00 0x04 0x11 0x23 0x800 0x00 0x00 0x01 0x11 0x21 0x800 0x00 0x00 0x02 0x11 0x22 0x800 0x00 0x00 0x03 0x11 0x23 0x800 0x00 0x00 0x04 0x11 0x20 0x1000 0x00 0x00 0x01 0x11 0x22 0x1000 0x00 0x00 0x02 0x11 0x23 0x1000 0x00 0x00 0x03 0x11 0x20 0x1000 0x00 0x00 0x04 0x11 0x21 0x1800 0x00 0x00 0x01 0x11 0x23 0x1800 0x00 0x00 0x02 0x11 0x20 0x1800 0x00 0x00 0x03 0x11 0x21 0x1800 0x00 0x00 0x04 0x11 0x22>;
+			ranges = <0x1000000 0x00 0x00 0x00 0x3000000 0x00 0x10000 0x2000000 0x00 0x40000000 0x00 0x40000000 0x00 0x40000000 0x3000000 0x04 0x00 0x04 0x00 0x04 0x00>;
+			reg = <0x00 0x30000000 0x00 0x10000000>;
+			dma-coherent;
+			bus-range = <0x00 0xff>;
+			linux,pci-domain = <0x00>;
+			device_type = "pci";
+			compatible = "pci-host-ecam-generic";
+			#size-cells = <0x02>;
+			#interrupt-cells = <0x01>;
+			#address-cells = <0x03>;
+		};
+	};
+};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
