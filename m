Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F2FCA1002
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 12:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mqeAvlDT4dklubipbGj9fakM4f+0FME5X/CZOaeAmnU=; b=l15wg/LLK7t0Xx
	9VgRIWxFfedt+VhlPVEU3CiDPdYq0l04An4fCK3WsyJNZ0wWOnGxlG3WP0LBwDxYPbCarKyktYUzN
	Py+SqK+9/z/V9pXfaV0EUmoIo6rYjSgVVpaaj8Tl4Hhfg4UeFFDXDrNYGQ3y/chsUCWMi1wAJl3W9
	mjHOoRsnlQAlVXadF1D+emkxP0Crx6A5uZoINoP5Tnv3nbj8jKvWCc/F0JQ8Gn/Fvm8Luqiw1FNHb
	VrtaXnJlONpqsmxH3WeBSzhEnAGw6O4Qqem2RmW/g1jBNpjuDge+ll1bT96nEP0eKKMEXzGv/2ci6
	6LmYO0R1S6NDX2U/JX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8hj-0000000BQms-3DnD;
	Thu, 04 Sep 2025 12:04:39 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7Z7-0000000B1Eo-2aiL
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 10:51:42 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7724fe9b24dso674686b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 03:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756983101; x=1757587901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7jQbVfvjjy4s26/KcS6dbO1yAkMslYFuaBzKbU8/+A=;
        b=alv8O0j5gdwCwBvEt+HZ4wLJODUqqIzwl7KZ42eoS35rxQ0Qk/Sak7MwDJao8Po7J/
         UqC7uibdumGxwo7CzgsH+9AivH0DHaE9XbYOt3KtAAtTTCJCJY8WtKWT/712T4Nx+U2n
         Aeq1lJwMPGODilbQSSXNNIL27HfPiJl0jNhg1FRwt2rjAlkkIp4FRpCRGkZXFs/cCvMO
         5uyDCOHJGdDZfHGW6SQsLDpl9NjoC0P0rvQrOzIGYGh+C8tXInavr5oQBAOnOuYw7e7u
         KyXw5Xl3L+OzwTSE57A6W431l+/oULxpg/VltADNZG5UHKL5llllGlGxOUAjW1nfv3HS
         ALdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983101; x=1757587901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7jQbVfvjjy4s26/KcS6dbO1yAkMslYFuaBzKbU8/+A=;
        b=KjEOdGzRETDHHwgt+E6Krq12HXqiBmD2ReNLinddeW1DYb+paHKu5GQTKsl5KEPP5b
         CgPgJ1S9ZcXjrlbOgn+wvCIRlpHxWhx31qb5o8u6DjFvEDWQkc9cB3fG5jl2Rtc7lDo9
         bN+1vLYrNUyU2hqqzse3I8jgrA+4VMtBZhlrfgPGNEDQbQAgkTww2cTomc6CT9jhq60Q
         3caoqA3LS0zPH4UfxkxSqCgTMeK/n/alix/2UMKHQUzqjx6MhlYHyb5URCqA1m/JNTOD
         qPucG2G1vOXVz+7BC5707FsqVp45rCVJewYVkM+w1uW3QMGj5fV1rdkmcTuLdIx5bhdu
         7ypQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9BB+bxHpT3nVB3v5u4w3lIzMGf/ofX0paCRFeFeUSOE/8qWKiXUAObHZj6dHS2zsUCqkR11QgQXkAMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKo+njYOa+CmKZrIOhSR6VdU/AkbnoTW4Q+DWwopLDF9EbR0lV
	bvFQDShOV1J3ZCN55wXzQtiBacYm+HAtphrJ/hk5NbCFPAdE6VclLGYg
X-Gm-Gg: ASbGncukt6AQkzrHlE/IPaZ/7WAWYJl9XPR9nlqwOj0LfCXifuDXUFtefbAQNxSXbOz
	GJmEkYcTXp4pXIx3WkIpiOipqsGDEPjWEA035fRd5x4FMpz06avQ2iBIjXXLGONp3+uGhXjXjW6
	v5oMGKXnXD53tg5nUVBcuVemXS0npeTgMeTT2Ec5ZlwjBQSFCESs6F7qwr1TmfRxtZ4i4Ddtchz
	XiLSRe1DudH+FNFhxDITd/BSr5LIM5QHXOvUE1FC01DtpESsEs/x++vCv4lya3OwDL8mSQ3EFjr
	qsA8jmuoMM3XFzEJQjsfmiJzh2sTE0ukmxP8OG5ApjZdgkgM0IdvNN0M09BTa2ASXcBdFfFcEjq
	8sVRdiJ9ktgQsl89LCIMSrmTyItQ0XKKGtcnEOE0HfmpOi/JbXmg=
X-Google-Smtp-Source: AGHT+IGsqHfcYn1HKs9rJ6BOzzQ0f8SkFW4i15uSMDVYFJ4sqMTx8DnbC+WafRushmd718na10DSTA==
X-Received: by 2002:a05:6a21:99a2:b0:248:b2c8:5cbf with SMTP id adf61e73a8af0-248b2c85fa6mr7775770637.58.1756983100730;
        Thu, 04 Sep 2025 03:51:40 -0700 (PDT)
Received: from ubuntu.. ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fb7d391casm2795224a12.7.2025.09.04.03.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:51:40 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org
Cc: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH bpf-next] riscv, bpf: Remove duplicated bpf_flush_icache()
Date: Thu,  4 Sep 2025 10:51:18 +0000
Message-ID: <20250904105119.21861-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_035141_674548_6728BAE8 
X-CRM114-Status: UNSURE (   7.12  )
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

The bpf_flush_icache() is done by bpf_arch_text_copy() already.
Remove the duplicated one in arch_prepare_bpf_trampoline().

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index c7ae4d0a8361..3fcc011c6be4 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1305,7 +1305,6 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
 		goto out;
 	}
 
-	bpf_flush_icache(ro_image, ro_image_end);
 out:
 	kvfree(image);
 	return ret < 0 ? ret : size;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
