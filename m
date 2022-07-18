Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F44C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 18:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VbGmrlcxv6L4LJTNN2cMuxg06IScN9SaoweSyRsvixc=; b=pvGH+drBkkMU0T
	Ngi3Xr41FqvNzkS45cOFAeZnbVAdRJoJyefKAE7J1Q6hANI0oChIKW4f91ILBh1PL8RYvlTF2ibqj
	ZyCnRlIcQpKnQNPjfv8OxRnfpx20/EfXxauPdvPtshKtWPh48jPlv9dVMpFP9qlrmKIHDesV0RHa3
	bsH78be+rtpsufdxFInkavlU9k97tna5Ii9knjlvWGycshiaY+5G2XkS+UpPOcvRRbJ/2Emo3Wb4b
	fZx4SycMIyxIz3Mpgv8BcCV7XPyWGTu/t+0pW5NTuPr2evB6umAaq/XH7jOnleZ3rwcko8KvtsxGE
	JeTi6RRdjsGpiyPoYKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDV9i-00HTD8-2U; Mon, 18 Jul 2022 18:07:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDV9g-00HT98-2m
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 18:07:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id bk26so18203552wrb.11
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 11:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tJkJMSkCdlF0gaFl/bz9jTDoXOI1h8lyvQbXCIuYLC8=;
        b=C8tWnTILf1YjNs3VRqs2iJpG0DCvNLMm0tdHYgZplGjo49Xb8boIEkUjfMPoTyRsB9
         w8dxn13zDk0vfYhmhSPrS65Hs/leAZs2FgJPm93GLgwguAZ/qbL9/Tp5ASnVAMqsoIr9
         VICJzkZTA8jaimDI7tdXZdjFV8lThbq5XeY/ZNNXufSwcXICAjKYXwkhukqEDg8IMdGv
         AA01nviygOtFh+HIFB8HeuzRtLMOk7eTDhxLwfpiXVYAMibeJjbPwV77cTIkwJyQZlBi
         4k2qecn6oiNweTbcakjCoebgnZZZpIGE8c7E8paWGuX7zrPNVABAnz3PahYIO78l4f5h
         AlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tJkJMSkCdlF0gaFl/bz9jTDoXOI1h8lyvQbXCIuYLC8=;
        b=WPVFqGvA/+QWf6TvTp/+skUrYfdCEySkXy3DO0DwP8M7bH6farbiva13eny8UpXu+x
         BE0vvPbgl0Iy86nXik2/UEGNaLSNRTKot+vDzvc+DCJNbrQpQ4oMerY7zWZEx4eOxskZ
         6ZpdEZBa7Ib7iInVb47mrEDJf8s3pjMpecKYlAMCdi2m8BL8Zkb2bPIPHrk8NML/LbQG
         YXRSk+xhZ/5rGOCNSKiMkBR29ckZHaBN/068AK9ROvt9ukqnla+8F5UJQG8oVOcaApI+
         qURsFl14UOKsW6mpgVG3gFxfKCMXmAgbTAV1td1R4lHWJeZ1+3ea71vdLdFrrK2+n+T/
         aOCA==
X-Gm-Message-State: AJIora/THZv/ih1HgyCRWpAQUHBkBsFRktcUpbYulAJzlJEd5zcd3eDK
	nTHBXm+zCArvCSdWJ++1s3fnYA==
X-Google-Smtp-Source: AGRyM1s9VcZfyCL0yD51nC8+bn/oG5LkVuSnRR0IpEa5nYTlSMbY4m9+W1bAQh9hvOB93AAHa1J5qg==
X-Received: by 2002:adf:9d8d:0:b0:21d:e5c0:2d86 with SMTP id p13-20020adf9d8d000000b0021de5c02d86mr11854660wre.482.1658167655623;
        Mon, 18 Jul 2022 11:07:35 -0700 (PDT)
Received: from henark71.. ([109.76.114.24])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c35d200b003a2d0f0ccaesm20886888wmq.34.2022.07.18.11.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:07:35 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] riscv: cpufreq: enable cpu frequency scaling menu
Date: Mon, 18 Jul 2022 19:07:14 +0100
Message-Id: <20220718180713.451507-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_110740_176142_DF7014BE 
X-CRM114-Status: UNSURE (   7.32  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Due to a lack of support for frequency scaling on existing SoCs, the
frequency scaling kconfig menu was never enabled. Enable it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 205c1e2f539c..ef12ccb81801 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -643,6 +643,8 @@ menu "CPU Power Management"
 
 source "drivers/cpuidle/Kconfig"
 
+source "drivers/cpufreq/Kconfig"
+
 endmenu # "CPU Power Management"
 
 source "arch/riscv/kvm/Kconfig"
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
