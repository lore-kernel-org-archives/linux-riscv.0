Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97629D64097
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Nov 2024 00:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j7ZKALwKIJN3yCN2wNuJsY76vErNWDopQcBoSNlgUcU=; b=K15ETPjWrhEyLN
	Gd65jgA1dtEh236oiBKshzwSNzkeIAqrWzDrey91MseYDWqAaD12BxPPhIIZTZNjFxFljVqSnICUx
	hqxN5Ax24K4To8o3KF40sHRKGjBy1CELzOfpI4QJKI0G6hPqanxeL1ZzpkHMl0Ft+pAzzPwbSFL/Q
	JTtN/QzdDwpZf95JJmoC+3GDbdQpMQC/7Rt8ENxETmkDoXN0lxyRXCa1V+3+Jq+CIW2Ovm5dynEMn
	Ju1rmeYxwG2zPehV8q7I4Bcq5vpD3VocXcIka046H/2+BmnhkV7X7EoeBXfBVkZEUW7dTNy8QOMwp
	k1BMC+wqejJjByquyR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZFZ-0000000CKmV-0w4H;
	Sat, 09 Nov 2024 00:22:49 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Yhl-0000000CFbT-0zqd
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 23:47:55 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so2375687b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 15:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731109672; x=1731714472; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vLT8y+Br7ZOzC38CGdRLNZ2zunKzFtQpFi1e/g4uRn0=;
        b=sTQHS466xRA+4fpM1dkcmb15hY9HPMkI7s32hNdT1SZnUzzq8q7e57vaZB8jI1NntP
         iN3e+0OrAodgngDRaADjqQ44QKPq0+PzhzpPJOl9HYKPiEgR0Z/UXY5SCKyuuAPQG2qk
         WMNMl8HWi92DGGQaCk410iS2vU5qgQZGn+k+/hAkJL79NLQuxuDhncn3bR1jBRaT4a56
         KFrMVT0+8oobP0kh011iZFSbZ3k3XD5AncdTKWv69eyJdbwbPePnIufcYuERZM6AAPKi
         6FX0T0YCPodU3t3CFGQ7U19kyK0IGBX5uPOfTfrHcjevrV/QZcIM+hd98vfk6pJed74f
         TS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109672; x=1731714472;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLT8y+Br7ZOzC38CGdRLNZ2zunKzFtQpFi1e/g4uRn0=;
        b=obld/hzlVoMuwEMOa8kn6my8jZFcrUiZsIujdPrBygt+VLegoPrvae6YSGGjN+pctw
         ow/Y1BRRBSasXz9GUO1vagr7OkCeaSXmnY+SKhONuzY9oDG6pItswvz0HI9njlxn/hBu
         G7hJhl/L93H8MXDdiKBz7usnkA0S1x972kc1rGNzp+Wkz0nuKoFjteIb1QSyOIXiCEPL
         Ae+WTNQ8dBPGOBU1qC9GQ6NkOs9ImO86JnBjBkyHyr2z4ynwZLa/ZqWnvmeJgBWcepIM
         I6afCPOeNr7ZDDUvGjIiOkVfs/mB10u7vjG5h5BEkjFqUxzEjwrU4VuvQn8KxtxfgGDu
         WxQg==
X-Forwarded-Encrypted: i=1; AJvYcCU9I863gK+/V+2e0k6FcOm0HHlqDGBB8N20WUgsLmjok0yozsK3+Aky9GQRbP1MZY13wHNgGnzsG7an8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQjGwS5/+52Hgk1aCNouZChGbgKh/Udh4/ofzHOzwv24a4ycpN
	ERo6qzNPUIC7hOaqbGn3YP4NB0pQBHRxScqbrZCal2m7Gc08F15sQ9B50ZnuksM=
X-Google-Smtp-Source: AGHT+IG3/42zTy6o/j0Vb6GpHhmw+p9iTLxozbfpy14GTVUlms+HosrVJ4hPPfRbbps9yC1k8ErBoA==
X-Received: by 2002:a05:6a00:14d2:b0:71e:cb:e7bf with SMTP id d2e1a72fcca58-724133625a2mr5595089b3a.18.1731109671901;
        Fri, 08 Nov 2024 15:47:51 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56048sm4376576b3a.174.2024.11.08.15.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 15:47:50 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 08 Nov 2024 15:47:36 -0800
Subject: [PATCH for-next v2] riscv: Fix default misaligned access trap
MIME-Version: 1.0
Message-Id: <20241108-fix_handle_misaligned_load-v2-1-91d547ce64db@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIABejLmcC/42NQQqDMBBFryKzbkoSWhO76j2KiCajDmgiiQSLe
 PeGnKDLz/u8d0LEQBjhVZ0QMFEk7/KQtwrM3LsJGdm8QXL5EIIrNtLRZWAX7FaK/UKTQ9stvrd
 MD6hrM3DNa4Qs2ALmd5F/YPSBOTx2aDOZKe4+fEs1icL/CSTBBOPKKv2Upmka8Q6UfCRn7sav0
 F7X9QPChXlO0QAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jesse Taube <Mr.Bossman075@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=ffwfWA/+f1ixyduX5KwLaumFNq5ov3RSm3STfwiajJA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7reYjnNpxUrJr++e6n/RMb6tN63Lybf3/Hl3b2V/6YzM
 F78eCXiY0cpC4MYB4OsmCILz7UG5tY7+mVHRcsmwMxhZQIZwsDFKQATKepgZLiUezQlZf9TJ5n5
 CsVl7Hn3JyqvfxrzZ3vAupCc6ezrvlxgZPguIMoSvefezYVpIlcFLD/xv+P/zFh0YqLzKrkny38
 uD+YDAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_154753_490688_AF7D6BA6 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
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

Commit d1703dc7bc8e ("RISC-V: Detect unaligned vector accesses
supported") removed the default handlers for handle_misaligned_load()
and handle_misaligned_store(). When the kernel is compiled without
RISCV_SCALAR_MISALIGNED, these handlers are never defined, causing
compilation errors.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: d1703dc7bc8e ("RISC-V: Detect unaligned vector accesses supported")
---
Changes in v2:
- Change CONFIG_RISCV_SCALAR_MISALIGNED to CONFIG_RISCV_MISALIGNED
  (Jesse)
- Link to v1: https://lore.kernel.org/r/20241107-fix_handle_misaligned_load-v1-1-07d7852c9991@rivosinc.com
---
 arch/riscv/include/asm/entry-common.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 7b32d2b08bb6..b28ccc6cdeea 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -25,7 +25,19 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 void handle_page_fault(struct pt_regs *regs);
 void handle_break(struct pt_regs *regs);
 
+#ifdef CONFIG_RISCV_MISALIGNED
 int handle_misaligned_load(struct pt_regs *regs);
 int handle_misaligned_store(struct pt_regs *regs);
+#else
+static inline int handle_misaligned_load(struct pt_regs *regs)
+{
+	return -1;
+}
+
+static inline int handle_misaligned_store(struct pt_regs *regs)
+{
+	return -1;
+}
+#endif
 
 #endif /* _ASM_RISCV_ENTRY_COMMON_H */

---
base-commit: 74741a050b79d31d8d2eeee12c77736596d0a6b2
change-id: 20241107-fix_handle_misaligned_load-8be86cb0806e
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
