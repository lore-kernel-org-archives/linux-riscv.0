Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EDBD4663D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hwf4XSLGTB3/sCjgtPxtHWzONtqXUHM3nJBNkjXcMHQ=; b=f58VMm1hH8wGjT
	oFztqhiKZ7WEb2qJwlAxlIxLsYbdJ41Dz6X8idjy+wzhFH2As62MAeR9Vzqu32nCdbuDujdxVeJUO
	3uSBlGLAdRaagOx097BS2bOSo+RMJV/TAXsJep1YqrVTkXUhry0sGX6cMf1GGt5XdppqlMZawv588
	l6ZH9gkzJPX+BQxCax84S2PJk5E6Rr2TqGqVE7BL420S7kES7Cw5UXlNJqOLEUrprI+xKuBFJgLVn
	69WXIN2i0Bw6XLFRBd30IlyTJohIr7l9gqsKAQ2TJM9OD5d4DObMObKU3D14hqKOj3GRUcSLB5OSv
	QycIukzYBFUgv9wWEpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzO-0000000DKK9-2Q8G;
	Thu, 15 Jan 2026 23:42:54 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzL-0000000DKIS-3bY8
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:42:52 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-78e7ba9fc29so14819507b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520571; x=1769125371; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6iZRWuyORG3HiSopQBMtG8viyXNEvTSjWImQZ3xz+Po=;
        b=JbsfbNSkq6DvMvvnayhpdVnfWfK3/ygifZOPbK75RenJB5fXoB4DLNI9EJukmYiNMu
         LifvLGw5Hz+vOyJfWhmAQOyMjaZ93n16t8a8lO/hbiZRQ1FHb/g+rG6KEk7S6Lb+xdgr
         PENXz6uX3IHueNwZVImUXtfKhlFe6KooPz6fZm5cmI00sCwQmi3D/dClXDMKUqeca478
         N8pcRRtV9U8gi+wScnRIQDmxaX1fWMtPxKA2xkVkrgEHMUmAnu1JtycDP7u2eiSghfLx
         FOPR34gcGIvakXZJ4+a1/i83Q6BeREz38bj91IMAjxN5q6WMTwwIui0EKoW6RbzFQKOo
         vH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520571; x=1769125371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6iZRWuyORG3HiSopQBMtG8viyXNEvTSjWImQZ3xz+Po=;
        b=h1ccb9MX958fHiMAbZC1fwAT7tUmJuUXcSBr5wWOq+JpLGq0ZeCF3hylL0qk+69fJ4
         /bHOosP8HNYf5VRUrE5igf9ZAoQQVPodNodeNUh2XAneAh2K8c9gvZXJ1+RTa2Hv3W1m
         d/gWouu5lAPvPDzDsz6x4yYvzfFhCarEi+Tipay0v1lB/02mFgt87KESGPiB5/9N7wJ0
         eKs3jLPbu8tXhMVhhDP+g6+OldhrjK/lzQ6+zf5ewI2zIKZK+Pj92TOG4FdpoWWXPLT4
         c9+eqK1CnGRqdZztzQDvwG4Iro8JhqmM+2SMysuuZ32S4WppQbn7Y3FMgHLSMNDO1xxI
         pb0A==
X-Gm-Message-State: AOJu0Yw1GFp7+ADbYf3NO/KfH3sjs1ZfBjEmnTFdnyg0Y/QQfpyfR203
	B9S5ohXpacfiC2aJb8I+W4IGbCdCOdjUfvI+uWBCUbVEiF9QHsM7GNva1790OPcdmxU=
X-Gm-Gg: AY/fxX6FBAJ0j2iwBe6S29zkZqVTNjLQ6mnQ3Hqh2kKm58B1YMp8eLvF3lX00jwpc/L
	Fs9Bn0zB/nWrCq2ZZWIbxt465xJgmHUKNaqDyFW58d9+FSFTLtSoJk1ZoL0x2ZUfkqBy8VqM2V1
	GxhAHozf2ScFCER5gWohrm7YwtdzlrmisdYGwiATlaF03cDkc0VhZXBOpVr2aOrHowQkhwZNOAU
	Jy7aE+DlBQj6ryWpESBjMF4aietKuCSz3ux/Ur1d4KvAgQ8djU3wGEUOd+2R+53/C09NrpVoasp
	DvElk3bXhvju30fcciQ4usDdvy0pGh8lYkfUFMR8PHA2ilk9JZiR3L25JfhCDglpEQV9ubel5++
	9mPfY42P25reY6EOBTncgjei0ekrXagdnQbndB39pkH4/PjGJIF5QVTMdctj819sDavQ1DJGjym
	IJIcHM9+W2RSgrwBQVTRlv9T1Opjfv3Fcnboy8fh1kJ7X3PO5Y1JwNLtmaTtueBSCgamYgapM=
X-Received: by 2002:a05:690c:46ca:b0:787:1aba:3081 with SMTP id 00721157ae682-793c683dcafmr8332397b3.58.1768520570793;
        Thu, 15 Jan 2026 15:42:50 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:50 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:05 -0600
Subject: [PATCH 6/8] soc: tenstorrent: Add auxiliary device definitions for
 Atlantis
MIME-Version: 1.0
Message-Id: <20260115-atlantis-clocks-v1-6-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_154251_912553_B407EFD0 
X-CRM114-Status: UNSURE (   9.69  )
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

Reset shares the same registers as the Clock Controller, so it is
implemented as an auxiliary device of the Clock Controller.

This commit adds the auxiliary device definitions needed for this.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 include/soc/tenstorrent/atlantis-syscon.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
index f1dc6ad33c6d..972a9b7da596 100644
--- a/include/soc/tenstorrent/atlantis-syscon.h
+++ b/include/soc/tenstorrent/atlantis-syscon.h
@@ -8,6 +8,14 @@
 #include <linux/bits.h>
 #include <linux/types.h>
 
+struct atlantis_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+#define to_atlantis_ccu_adev(_adev) \
+	container_of((_adev), struct atlantis_ccu_adev, adev)
+
 /* RCPU Clock Register Offsets */
 #define RCPU_PLL_CFG_REG 0x0000
 #define RCPU_NOCC_PLL_CFG_REG 0x0004

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
