Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C974FD58D7B
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 19:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dpbCw8u/u/TjuBmfqPyqlRbrt6+AwGF8F9SG7Dn+weA=; b=A7hscVEMIq4Hj1
	wz1SHty1OWwRJ0NLFeoXyuJjxCvuGQk2x7oV3f9IfY05wmQFsB7r49yDfQ0nwJXeuMdq7gqciLlXs
	JKTnwMAbmEwsR4L89a31uRvR/WFYcQ7SvF2hU0V9nq2GS6+xTfY6UizIuokuhdj/kf3c93lAgkk1d
	Q077LK8n/VHHErHuAc8Rxq81kr6j2nb+I2e3pamR5Cv+Xe11MwFBTp8q1xtGaJj3QVz2lEwqMQp/b
	6Vha5mvOrvGm9kk0I8fyg666dYF/bUSN5bOej2aPXZZ16arUE7csxkadfYbel/JP9/+vzf5H28fCP
	anRuCD2vBj+XF7gvHR3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFeUB-00000008vig-22XD;
	Mon, 25 Nov 2024 19:11:03 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFeTg-00000008vde-17Ee
	for linux-riscv@lists.infradead.org;
	Mon, 25 Nov 2024 19:10:33 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21260cfc918so33970465ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Nov 2024 11:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732561830; x=1733166630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q78q1OoQNcZ98znvtV4ozluwpFdzLILnURvHrjKkDmM=;
        b=hz/jzbtyWBgD8LY7HvciPi/N0bUQs3H9dBvuo17zjpJTapOA1CfWSENCZ6FpknY93I
         i0fYWom8tLJaPyEICTysNH8vzH143cgLXlMfjKTsh/bH6acSH0xqhuoPKfRTnt/D/xf3
         3FEbSebp2wA+Q1OeYE4Umwy+hXVe8My2rX3DXBuIWs4bYA4OVMU/t4XVoQcqPjp+2+2S
         Fv8JaXT6SjfrqnANeB6eHKDj91viR/X7JLh3OWCfSzYNsd6lyzQAfOAPhNRlBMvqUJWu
         ia0x7VZhmBifcoMSF7gwYDG1mcG6yIb+p3YFa5VCat9R7qIJthzgl8aT8BBsjM7J4nng
         4ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732561830; x=1733166630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q78q1OoQNcZ98znvtV4ozluwpFdzLILnURvHrjKkDmM=;
        b=kWo0Vd3GIzXPdQuOOApYq70nBGG7hGssp2ohlNscPHZTOybRzVSwBSEkIkBqIBVLp0
         Eje+4bahSvR6yCQxoXWFz4FOvBoBiEKJVOzIz8HhP5WQt4BgDX35IMSWBHXVPXWvt4eI
         Va7CrH9o5qwCsyuSAZLQ4coZWx7LxlM2HKrTonZ5XmzNBzz1znjDdKnmoS9+fOsxRM/o
         SGvl+i1EN8pnGuJ63fuwHjblehRBz8t0fBlmOVnVm9TWAddIQULDTwktFuFYel/PNKj2
         ymqfnpiWHjMnYJs2i4ud7xx3NiH2HMFPDhkfAKDsirlK6//U2C/zx4ZSmz7Se1p5zlIR
         xQ1w==
X-Gm-Message-State: AOJu0YzG9tcKC9W/eyXNJJo9wvAlTvSeeLaSXz0i54sp9XboBvJzYlgU
	RKV6ELf7uxIQ0jmFIOcib5GmkNpf669QC8W+h+E7FVnVfZ2K3SBtnO2PDyeY
X-Gm-Gg: ASbGncuglT6DrmUttGMXqx+R2cy86KRkPo31HpEEByXcs67aoVx4Toqi5BH23qBZgtB
	pU68yewtDgRr8lQLpfvPqk9G78QjGAQH/zoZ+97KXZanbWmZqrFKvOi36X+nAOfx4d1bXKHiAAF
	SbLOd3OdK7whWcg4KZ+aoteXcFe9LEMS2IDYFvA7gFbVLalvN0otRCO62YRLDU+SO49vKdqF3Qn
	v/+hJ/UBLdoBIuVWk5BVMWj/Yn89ucy1p/gNKsXCaKCJUKPiCT2FBS3Fc2XTBSJgg==
X-Google-Smtp-Source: AGHT+IHCxmfZgBVj+1qygDHPsmou0yVLe20pxtiugxO94Cqk8ljgQAN2f+cO5yXaAJdG8vF2YDDb9A==
X-Received: by 2002:a17:902:ccc5:b0:211:6b21:73d9 with SMTP id d9443c01a7336-2129f81e8a5mr211338415ad.37.1732561830341;
        Mon, 25 Nov 2024 11:10:30 -0800 (PST)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:8701:62b0:6f84:ac3d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc20ae9sm68428745ad.240.2024.11.25.11.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:10:29 -0800 (PST)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Advait Dhamorikar <advaitdhamorikar@gmail.com>
Subject: [PATCH-next] mailbox: th1520: Fix out of bounds write
Date: Tue, 26 Nov 2024 00:40:09 +0530
Message-Id: <20241125191009.28535-1-advaitdhamorikar@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_111032_303964_71C37470 
X-CRM114-Status: GOOD (  10.45  )
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

The loop in the function iterates up to `TH_1520_MBOX_CHANS`,
but the `ctx->intr_mask` array only has 3 elements. When 
`TH_1520_MBOX_CHANS` is set to a value larger than 3, this
causes an out-of-bounds write at `ctx->intr_mask[3]`.
This could cause an immediate crash or incorrect computations.

Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
 drivers/mailbox/mailbox-th1520.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mailbox/mailbox-th1520.c b/drivers/mailbox/mailbox-th1520.c
index 4e84640ac3b8..759634a4fb72 100644
--- a/drivers/mailbox/mailbox-th1520.c
+++ b/drivers/mailbox/mailbox-th1520.c
@@ -532,6 +532,9 @@ static int __maybe_unused th1520_mbox_suspend_noirq(struct device *dev)
 	 * INFO data all assumed to be lost.
 	 */
 	for (i = 0; i < TH_1520_MBOX_CHANS; i++) {
+		if (i >= ARRAY_SIZE(ctx->intr_mask))
+			break;
+
 		ctx->intr_mask[i] =
 			ioread32(priv->local_icu[i] + TH_1520_MBOX_MASK);
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
