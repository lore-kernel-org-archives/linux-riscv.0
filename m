Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D53BFF8850
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 02:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AxWAZFwg3yoiGnpJOL9A1w656B9uuQLLuwFmVxlAFrQ=; b=qL9cfFWT4Glo8K
	4fnrxB2wRhHh/xGaj/lge1tLSgEnPDcyUEJL8zBBTuWD72zEdKJivpUGOnWwP3pLadYvZmS1PF9sx
	K8yLEUcShKqL/Jf7ggwmObfXEl+LA9FhD+XX9r3fWvLOaHiUAAl40nwPJZMdCOXJ1vs0L4WnOc1QU
	rleUaHvmVs0ze6lT9RE2UZZfCuA2KspMznCSJY8kjXVd+mnEWAUVbCfRywkfPfm1VanuVgfjOYRft
	dZANikS9EK2eJeE2FxI0ypqG2c3ZgrE4sF9WgBR+6ioCZhTfCxKLpv0BZT3dZt6ZSc9/12ZP+Cn4Q
	8ay/sOkJ6oND/Oob2W2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHC6b-0000000G53F-0jTi;
	Mon, 27 Apr 2026 02:53:53 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHC6Z-0000000G52w-0Noi
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 02:53:52 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2d9916deb14so17363317eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 26 Apr 2026 19:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1777258429; x=1777863229; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XZvmQ7eoImwy7zW1eddL/tScs5S4rVs3fx4RgOdLsO4=;
        b=Jx8bePEHGcLZoEyEzamorx/DcpDi6ga45tEXdLBdy0c/PvsK6BJMBXxSFvVIMah9FM
         YvySczUwUbr/n0bPqq1zU7gfk2K/aNSm4PLTaWSqGDju88mVWR82iGGovlcIgx1Ji8/m
         t+Z/uSTNjLDW3k6GL4DHcStonIMxyFFl8Q4v8HUgxkpBKWlDBH7+x8TaMPfMgJ20a547
         jHWvfA07IzDP0DFH4ygXxcGL2nprSlWNQy5vCOBVy/vL/eGe/+KQpgC9puhfuIRB4F99
         HVIbes35WPvl+DrUOkW74aqXuRh67YJ78RvUsU5zD7SwzqPTIl2mzgk3G+ZKcNs77UTc
         CKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777258429; x=1777863229;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZvmQ7eoImwy7zW1eddL/tScs5S4rVs3fx4RgOdLsO4=;
        b=W7S4hjtjmUapMycpDcRw4VkAP5a5x4K8OBBSusTyjKHk2A5wTvrOeKlq+FF2o58Qnq
         NY/FsY8YKUKYSwycUqVe0BvUWi73g7JM0hJjDt3wTGKB678dgQAByYPIl2CF9qe5F60Y
         htNdggfnW4tVws8WeycL2F6mwxVzyCqNEgMBUbXvuKQYF6zYHnl/R2deIVkrScveYAa/
         mZ5DT7hKy1RrvHCPDsU4eMQ8pbL3L/1yc+zfqkq4FkuDSc/IsP7ZOrKp2iwv4/3yslNK
         6e1fsxZ1Wu58fMz/afgasADX2te4bnNF9KpeQep4Zdbn5c7zyqUj4e+oG4V/OPpiqyWn
         MqmQ==
X-Gm-Message-State: AOJu0YxtKvjtTlSPSJEMKXMN2VK+eu3op+ObXlEUobdmhn4TRwc3o4kg
	S28v2HuCmcQQ9Y7B2wTp8QO5fXN0udmN9b0+qKPvC40YcbUnMs3xDCQ1jVoflq6vBZAABAAw6dW
	8MqLzyBO8Da8HgBe6jKjlSm5+gchp/6JLdzVT6oyX0hY9vDAfRfgos9E3DoD3yp/ing85ImAGWu
	PV0Ox0uVBRSfESB4IDl+BDbMVVUJcajeLYqgEW+5lMFHLpNSZINFstjKergto=
X-Gm-Gg: AeBDietLVIDdDdt6JR/s4pZ9SJPNRGyyoZYzhtCqsAlSgmWtz98At86TMc0O1V0t6BJ
	4mhyzzp56wKT+PYhkM51kAiTOMsV9SoxTvQCFfajvBPwjwv7H6TDNH25LvHX4cEZmKZK3MC1k5J
	7tVUY9Rn8W2anMXPM8X0buHl183oxWChFg0X2gYaM69NlM2LnCaAG7oLEF7rINzp912qM06JvpU
	qbdsbOQwHpB3d5lBzsPRSuAuDc8H5OL8Ci95YLbbo0pb2lU5VX7tbXrbD6ntu9h6UieuW9SjwGG
	PyHLmezLjr6PgpT+0CVgJ+ex21vho5siwi6tR9gILmPiKBHVXgANZfJcjjE7hmz9Az614Yduqo7
	IoS4y3iMhs+24+niHzi8VNi/0zV347FlQ3ASSGqzfnD+z2l/3FGcTq+D+lQ+I1idCdD3sJPJhNy
	3ZHenYGDJdejZpSwLLt7tVgZTSM9u765YPJ1QHgBz/MhloC0nqqGHiTHNQU/+t+N9g
X-Received: by 2002:a05:7301:3d19:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-2e4875e15f2mr25333668eec.29.1777258429119;
        Sun, 26 Apr 2026 19:53:49 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b3dd9sm41345856eec.27.2026.04.26.19.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:53:48 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Sun, 26 Apr 2026 19:53:46 -0700
Subject: [PATCH] riscv/sifive: remove warning in errata
MIME-Version: 1.0
Message-Id: <20260426-vendor-v1-1-041fbde8918f@sifive.com>
X-B4-Tracking: v=1; b=H4sIALnP7mkC/yXMQQqAIBCF4avErBNMRKGrRIvUqaaFhlYE4t2zW
 n7wv5chYSRM0DcZIl6UKPiKrm3ArpNfkJGrBsGF4lIodqF3ITJppBQauVGaQ433iDPd39Ew/k6
 n2dAe7xpKeQDhCjSIagAAAA==
X-Change-ID: 20260426-vendor-4b4427e0b670
To: Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777258428; l=912;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=Tj03smyocGGv25IGJrmc69iFJyYXycCAt7rS2LHtQuE=;
 b=rp6pkO2A0aUiwLgqkmXvuOyfMOxwhYATuLhCQOwJl9j1mP2QorxJw8fOfgf5tTbLjEi9qEtvo
 apGfzsUjEsDDAI59PdnpV17UcGBfsue7Hwts2UtEXbuGDeGOMZ7HB07
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_195351_157124_3933EF31 
X-CRM114-Status: UNSURE (   8.36  )
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

The patch_id of the availability checking for SiFive vendor extensions
will always larger than ERRATA_SIFIVE_NUMBER. Remove this unnecessary
warning.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/errata/sifive/errata.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index d0c61f86cba3..98edd9143321 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -94,7 +94,6 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 		if (alt->vendor_id != SIFIVE_VENDOR_ID)
 			continue;
 		if (alt->patch_id >= ERRATA_SIFIVE_NUMBER) {
-			WARN(1, "This errata id:%d is not in kernel errata list", alt->patch_id);
 			continue;
 		}
 

---
base-commit: ddbf9c76c4020bf63a0799b00faad40caa3de6c2
change-id: 20260426-vendor-4b4427e0b670


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
