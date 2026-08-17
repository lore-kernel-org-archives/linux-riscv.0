Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C47C5CFC1
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 07:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kWCg1wkakEe+OB5jxPpYvwkxtoxMRqUoiZyvfClC38I=; b=jCFfWu1g+DLv7k
	QDgGlHiau007DAMK+K6A0/nFxGrTwUd2hjlvZfKdEniOhMmB0h8BBUqC+1D4qtrC8+dmnmDTRav0Y
	dIWZpgfXm6Ao+ZqMnO+seMiL7ohTUnXWp/zn8dKROVGCiKQ2Upjx+fjTNQd6DGLgs/sdZcD0UGgpV
	4sdbCsq/Fse195SWdsQJyBkdBM3LL9ZpknW5+J9c9/abosij5Cl3aauYay/gU5cZ06MbOUTjQSVsZ
	okmC83KY9dWY1j4jIdEN8u2G6TG5KWOiySQc2rX8RJXWvGcaprb06UmkuCPHeHP7Sy2JzkQZdhYMY
	ZxPvKTDdkvJhbKqMTh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrqd-00000005YzD-45zL;
	Mon, 17 Aug 2026 07:33:31 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrqa-00000005YyX-409M
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 07:33:30 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso1655007a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 00:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786952007; x=1787556807; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ctO/918wY9I8dgMN/rNhQAZPgaBP/6EBpuY/G7CkCVE=;
        b=Czlf1kLXtP627RCBYQdmTFAYRit6NDSSmhILmIoa7VYSV2TlrDli7Mdjxyo+USRWtm
         DHr6JjAjh8G6qgnHcMAcQZUzs4UReztrPKWHzwaSDTwERCqZgzZ9FKLdjkyJIoGP4xZf
         ssnsRs4liWzcdAgP6gcAIlHVRQ4RuU2JNHmDkkbrqSpSr8VeDhHuR6CVx3NpMJISDFuH
         aodDA5miXQeTKoCrL/G8YRDUiQN2ByGaH5kg3I+dElx212Yde/NvTeKfNOejytEqVGxN
         pdlcU3jWLbboFjQlIRvjfE94RJS60x74i7C5KRGSA2NM8QOMhZxjK/H+/I8iPYqU7tIr
         IgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952007; x=1787556807;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ctO/918wY9I8dgMN/rNhQAZPgaBP/6EBpuY/G7CkCVE=;
        b=c3y/mMb10nMg0QaHoPwIn9pdnY9CavcW/8Rl9FNhnQgQvL6jiH7icbq+EG4dE/4AE3
         tc//VML4eBhA25DUlfj/v9w810pJQvRWivrmJZbDPVBYvQloBmOjuMecjglUrZ15ZdmZ
         xuFitAyI0v7w0xSXfUQlYiYEwbaulrx9g9V/uygmUnYOfzbxMk6ZXLDi9d7VN0sPjXdd
         tLw8TFwryEdGOoqgRAdmnHicBeEEkjmJ1zS57MFpWs9n+tqVA4VjJmTjcsOq7VB+B3Xq
         Nj4NnNLimdqrWEfewIxTcWEKVBsauYrJwn/x2CQHoyWfJzXS6YtLCmgJhyrCJ/W1/LMw
         PucA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1FNWJW4k1s1blp//+iu4pjiqiAXYs44NvYJuuBIV5isQrnJ+N0tEhEk99mJgb3UndFjs99IZJAyvQRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnV2iYl50W7xDwsBf7hNjFFukntjO8L3V71spuyQVawxeVLMVS
	jEI8GrUtfENpbLMXG8d3lSU6pQGV6b+ZvHYCurUkeFhUcSp9mZocsoBDLkOkIzQjAyA=
X-Gm-Gg: AR+sD13oshumi2q9C76qMuQBH+zugI5hJ76hhIQbj+uYmA3o7ZeEGbNgSvU529/IT/G
	tzzqj4LVpRV1Pr13ptko2Cq5TEHuejorQjXkvBTeJrUF1lQYYhp3/Yb9k7ami2LAIShWledc1f8
	2tKhr/T5vv7KcwEJs2s1HQWQmGzkO2iftFekiDz5CDmrAqBbobXkEFUhvZgvTyKOE/r9AayPrTZ
	K0gCpzBJZcSAeRf8XIkEYeHo5gdUUyeidRfyqHZiwmRAXnTnJpp6WrjDCQkSFrMJsH40ta/Oe8+
	bqmf5itRToJmCUctFE8MrRRJWqd9Yk+U83vw2LF6qrm/is4zBIVZQiTImPQKZLlsZh5g5g+v4Gf
	AtpIHb8QaKr4MBXgO2WElquTBiLajKPtVCJv2i9IfMuHZdH5e+B+VPRQ9iaOebUWocOqaPKtHXe
	PupJY7KRAMtMGCzzjM06ikoyeW/GUs9DGQtVRhD3lOgc1nw0VFl1VbabOumNCeEblMu5Oo6YlmK
	osBZUDN
X-Received: by 2002:a05:6a21:7702:b0:3b3:d0f:7883 with SMTP id adf61e73a8af0-3cc7196eda5mr27885097637.7.1786952007506;
        Mon, 17 Aug 2026 00:33:27 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326796d646bsm3575972eec.10.2026.08.17.00.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:33:26 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 17 Aug 2026 00:32:59 -0700
Subject: [PATCH] KVM: RISC-V: Clear HSTATUS.HU on hypervisor initialization
MIME-Version: 1.0
Message-Id: <20260817-hstatus_hu-v1-1-28c53cdfb408@sifive.com>
X-B4-Tracking: v=1; b=H4sIACq5gmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nz3YziksSS0uL4jFLdRMNEC4tEI/Nk8yRDJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaANvzj4duAAAA
X-Change-ID: 20260817-hstatus_hu-a1a88a27c7b1
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786952006; l=1212;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=tM0pTha1/9nfcltCgNGuo/8gpha3J9wIDaj3gZsBSBo=;
 b=xzAemguTvxKYZkrL488xqh1xU5+sYfHiXmghrUUa42oEqlIaC+MMhYmzECXbY6IRHF230q1PA
 xRvrYY3gIRDCL/W3d8Js+WjMQhGkDGoZJqmExKFef81IWvX/6NJVnCE
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_003329_024130_8536A5D7 
X-CRM114-Status: UNSURE (   8.52  )
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

The RISC-V privileged specification does not mandate HSTATUS reset
values, leaving the HU bit potentially set after hardware reset.
When HU=1, hypervisor instructions (HLV/HLVX/HSV) can execute in
U-mode to access guest memory, which may cause unintended behavior
if not explicitly controlled.

Clear HSTATUS.HU during KVM initialization to ensure hypervisor
instructions are only available in HS-mode, preventing unexpected
guest memory access from U-mode code.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/kvm/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 85e772588fad..e80a99e93d56 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -47,6 +47,9 @@ static void kvm_riscv_csr_init(void)
 	csr_write(CSR_HCOUNTEREN, 0x02);
 
 	csr_write(CSR_HVIP, 0);
+
+	/* clear HSTATUS.HU */
+	csr_clear(CSR_HSTATUS, HSTATUS_HU);
 }
 
 /* Clear hypervisor CSRs - called during CPU offline and non-retention idle entry */

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260817-hstatus_hu-a1a88a27c7b1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
