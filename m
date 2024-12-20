Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61BCE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zTQRVMVuD8XAtWENVWRX+Jhuesy935Lvk785oPd0nH0=; b=u1/zxuXcR+D41S
	HcHrSb3wc98PkcqXmIQfXucw+SeJ31u+gGXsGGYrmY9ksGt9C2YlzO3BG7KW4nw5OjPJtO0ffczWA
	Mh24SzkwlJbkm5jBMVSp66HKMpGRfF3dq+nva1OrwdFrTVMmGSPBWdzF9SSTEFTLyBmCGgEIhDArh
	5MGwwqe29i5mKnIH26YX8mk5f45lVuHtYQvUEc4BN9Mc8CNmZ2fO5PBPPG5GXWvOFb7mUpk55LX+A
	Wo8IgLmh9ZUvvsbH5syopATRI+J58I7zZOPpZdAMCsv/KBuu/fMj/Y4YXkYvDrSO+2pi6C4Emp8pz
	d704a6IVJI5GpRiJ2WMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYXu-00000004J21-2fZk;
	Fri, 20 Dec 2024 08:39:42 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYXt-00000004J1d-1DUW
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 08:39:42 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6d8ece4937fso12167186d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734683979; x=1735288779; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fg+GZBUNMLaPkOO/iG2b4jCZOREcONmwra1hXNav77Y=;
        b=HAIIMcvEFkZixsX6mfvLMpr2wwp22hqWhh2jd7VNKAaTxxCS4neU+5sOQ23CeEvYy8
         WOkaF9U5O4tnv3ZHnDbysiiWX5snLW30lBS9rasroQBY/QyOiftdIBAS43/MU538cR/R
         P+rrJNyiBtGygS9d+nxcxJ+6osFfKIIIz1SglgJIEOfJV+kueeJD0iygrfaJz2KC7IS+
         aWUiFgJtuw6h+xuXN6lBwIK3gOTQtsMeZSBv0SGu6NSDrczZqiQVrVxh0PdN+YBNkoIM
         rDMhKGGFMOTWq9G/y3VBmqGoXEu2jPOlF4TtUqoslbxINciWKFIKHqLO06AkJ9eV9SfF
         LoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734683979; x=1735288779;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fg+GZBUNMLaPkOO/iG2b4jCZOREcONmwra1hXNav77Y=;
        b=oRMi6Iet9ukpqMhYKLegxCpOiqjFqn9bckDicbywI7bOeaDszCBspFw0tDsP2xpZtD
         TgN3xqjaLtxIzchhjHkQ7gXNVSJIcxhipTDESUSyM7P3/oh1EO+9wzMtJHMqUOLSJ/cR
         E8kMglckRMzLbdB7t544FZ09LtjYpkbT7kx4VVS15Grn/jSmlKIdwlhy7D9LrWhbbbXB
         DJZ5ujNq4L9A3H+rrk/xYhPQTGIX7jgqq7VqjM7bxeWl12RVVHk2zZEdyQG5glp8JBNa
         NkwxXdYqDsH4U6hLVKE+vfRZTMtzFGWtU9VBQmZeelOF/eG+qpLEqvZlV5wF+nC1IJM3
         p/wg==
X-Forwarded-Encrypted: i=1; AJvYcCWRInzuvWGMFQ+UPx+UosIJ7q3trpRaQ18AKakf47QUBmZpJ0XOaYiyWFQ55wVh1Pb2vqm3oBsbHb6XTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGVJUxjbI9nb7jD3cFsUEGhtxXqnO7/hiM1z2PnBHsg4Y32qd1
	90buqNoDmMvkBzd3w1YX5ssZ+HvIaLClFOaEhPHKfNgKsvscMFIegkh5M4hcNiQ=
X-Gm-Gg: ASbGncusec5HFOFPIvdSXPzPmSx2ImJKTCWUGOUMF134mAibd/emP8lyMkfcGcUq73Y
	niiw/f4MHysTHf8Mb9FeOZ6T5tcY87bRlKDB0/0nQsOlNfe7rhV9NzcqO5cfH1H/h9TghbiFlNz
	7EBSLM9yh4hEaH9SKKIw3il/L4YuIEQ66H6Pu0iitmXZjgh3Arl6jeQjEvWUmhbtqCm7Muz+bHZ
	59CqLIZdTQdMcffPL333IGjo2qTMIfrDQHn9mmgDIyhNRf3tbwJ1eZdpc6hSLmGVm0Ima4pqnI5
	z6qbALxC27o=
X-Google-Smtp-Source: AGHT+IH8uc8lCjbR9xxYj/GIG1YOX2CpVobRYmAeXj+In5J23W7MObFTRRe0ThsAj14XBxOd/BV5hw==
X-Received: by 2002:a05:6214:21a2:b0:6d8:aa04:9a60 with SMTP id 6a1803df08f44-6dd2330b2efmr27705036d6.7.1734683979587;
        Fri, 20 Dec 2024 00:39:39 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d528csm14617866d6.112.2024.12.20.00.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:39:39 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	AndybnAC@gmail.com,
	andybnac@gmail.com,
	zong.li@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 0/2] riscv: signal: fix the size of signal frame
Date: Fri, 20 Dec 2024 16:39:22 +0800
Message-Id: <20241220083926.19453-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_003941_333465_A353145D 
X-CRM114-Status: UNSURE (   6.83  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series addresses two issues about the RISC-V signal frame size
calculation. PATCH1 removes the unnecessary header preservation for the
END header. PATCH2 reorders the apply_boot_alternatives() and
init_rt_signal_env() to get the correct signal_minsigstksz.

Yong-Xuan Wang (2):
  riscv: signal: fix signal frame size
  riscv: signal: fix signal_minsigstksz

---
v2:
- Remove the refactor of init_rt_signal_env(). Instead, we can just
  put it after apply_boot_alternatives(). (Andy)
---

 arch/riscv/kernel/setup.c  | 2 +-
 arch/riscv/kernel/signal.c | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
