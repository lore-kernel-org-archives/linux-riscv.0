Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFDAD4663D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUWENuN2ZPLU6q2znbOX5fBt+qWoriAoN5nWQlaF7vI=; b=0KL+fazBXTu1VW
	/Q0uKUDbpJooNDAFu+R2WJJU/o8FO7HJ7tTVNrWGVwH6CQnRwjPfnil9b1jKrTixkVylhe+fPvtDL
	xwfaSRb5JbJGt4dQC+9LN7DNl9hMCazNDRJChDq0+rbH0oQ7l/J8OGwFnMtsXMTN3rKEUIzpOgnRW
	9ZbHKFgA0KmnxZ4ys2V6QLJY6kYvQB9g8ZTb9bOZYRBxIo/7omTN8upgsL0rfG91D5ZYXGzdQG6a/
	TtFL+xpibT7d/fF4FY3k+TRR1LEfBlJaNvnedqrKgWmOCwPZsG8ymCHD3H00wEKY1yCO8oY+WOyBJ
	Hy4Nlb4h+MN443VB+SQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzU-0000000DKMb-12vW;
	Thu, 15 Jan 2026 23:43:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzS-0000000DKLZ-2Hmu
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Jan 2026 23:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mr+DET/MCWrJ44Xgox+RvCv0LCqYSg+k7ueyqWHNGvw=; b=U3qfVeYIuwxMXcLFuFZ/56YYF9
	EvVT2JxVMxj/Ehbu0Vjk0P9JDxHwc/F0oKCkxwOCnd0sVnIMKgHnUIL4uhq7FpWW+dRDHVPqqwGCS
	mBqd+Wf4fYHDYMkXRKhIATfNbWjERXD0XRkcgUELWrDgGQzUK3o8vDwlMXjl+HwMbeACvDneYzsIG
	I/DCu5LC09sJMxexXpz2jF5PfE2NY5l5NoDbTIcJ75JRU7MHlrSugB7RbR31+9KT9Ee/TVrqLyQ9R
	J2dls3bGLXzNStilXZOoKgWFTQcI4HkuHqXBl07AL2jvFtuh8o0bLM/sQP6OUlXIHIMTKY8JyM6lp
	NVnbB5/w==;
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzL-00000007o5l-1zux
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:42:57 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-79088484065so15928727b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520570; x=1769125370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mr+DET/MCWrJ44Xgox+RvCv0LCqYSg+k7ueyqWHNGvw=;
        b=cGY9PCHxmUCofx4h7YT/9lOq8tpJCfEXHKAaewoTiufwNwA9CvuRKoOcdx5CwxN+H6
         hT8KzOWR+TYIe99JpXOA6/SynRlj5HeJYtCsRghiWQJbK1jgSoct0CyqZD4/0oDC/8hj
         cOtZLwN74EXINbkuwMmQ/wuMyyp1KB8f2HMCxKVOfLWycH7Owg70LzYN2AL4ZRtLdWc1
         QoTfbQsSeUhfLWSg/43bz1oDdW7sM/DRnhwuqYkSBWWfgsUWsYbUi844al6elpyvVn1F
         81nCG1wbg9LI0/jvjyaWEWN9IRsikr01O7ufL5LxdIRg9bYa4di484H2hREdbWieFIk3
         AtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520570; x=1769125370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mr+DET/MCWrJ44Xgox+RvCv0LCqYSg+k7ueyqWHNGvw=;
        b=koWjFgFoOLoh+2Iv/oyPeYu6xl6hJoxDYxsMZ9y8BxYv5PmGmXLSEO1wk9f2xEBmu+
         6q11fws7UxelVb/AyLt1udwCAKL5erbPka1OJJcHOLWjTtyMlNq4rm0wpJ9/Wm4V91JD
         dRM0K4Cwa3h+MD8VB2xqMarljSzFwXYm1YuR3Pw0YsGyX/oGBva6ZouX1RemV1Jv3lP/
         mcry5UixiDDyfPvwIjLh4RxByQ9kT3lY4M1IGUgkWJIWiTvMjuhH4COlQvnAcKU5LJoM
         5kgoHLyqtQMx8T4Uk61GiGb37WZ+41JfGkd4ezGy4LidyFxMuRluPJceWI1jJ9UsFznE
         VUnA==
X-Gm-Message-State: AOJu0Yzbitrah1ZuJmQkYLVBuNCyj/igRwogT7p05cRLDVS3/+2DWNUz
	qFOhW7hd30z57GDrhHMDsjm+Kz3B00/77wffgL9d6qDujkR155VkB4qCgGoXCjbL4jk=
X-Gm-Gg: AY/fxX7RkOpuIMtDTWtzrSFrBzC02gwWGJ+sNe7GgAlCXvTPmlWc4bomncQFvq7cgrh
	zmvTWqMyvRyNohLKl3lFjJSgN8gHcf2C0l5eZVg8EuHnNFGCn3vARwqzyfyWxWj0gHLJZDmM9Dx
	Mq9gnwgfyIqjhPzuT9OypkNVutEYBEOMRhVG+jHt3b5o5/McwX4Bz0mGNzkl9iVGHAt/vyv+mJO
	WDjPpsLSacKhw3SDpWLOw5xaqthvp6GeUluQqVxpRr8kzMXDMekuOctLWnuiM3QXAi56sAUELQi
	vkKCJLMJ2jB1Cz1vxfYfr3pMQ25agB9r8g6ZtvFprOHnbmEviCJ7HY2tGq/j2jMShp/tWuirVHQ
	4+Hvg1RpNhUUzyWd08PA02BZPOuWastQ1vZDHlmGj/djy4cUn6u3Ma9obpltk2HXi9TGdVhDk2T
	o33PeT1L/ZMsbMSRPV2W7DlIF6jE9wZY9RFoqzIaqJPtttj7G4Bef95qaAVtLzGnn/xCz6zddzM
	fLMjoTvAg==
X-Received: by 2002:a05:690c:e3cc:b0:78f:b820:f2f3 with SMTP id 00721157ae682-793c523ce6dmr26018967b3.12.1768520569702;
        Thu, 15 Jan 2026 15:42:49 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:49 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:04 -0600
Subject: [PATCH 5/8] soc: tenstorrent: Add rcpu syscon reset register
 definitions
MIME-Version: 1.0
Message-Id: <20260115-atlantis-clocks-v1-5-7356e671f28b@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20260115_234252_009598_09F8ACA9 
X-CRM114-Status: UNSURE (   7.07  )
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

Document register offsets used for resets in Atlantis

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 include/soc/tenstorrent/atlantis-syscon.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
index b15dabfb42b5..f1dc6ad33c6d 100644
--- a/include/soc/tenstorrent/atlantis-syscon.h
+++ b/include/soc/tenstorrent/atlantis-syscon.h
@@ -19,6 +19,13 @@
 #define PLL_NOCC_EN_REG 0x120
 #define BUS_CG_REG 0x01FC
 
+/* RCPU Reset Register Offsets */
+#define RCPU_BLK_RST_REG 0x1c
+#define LSIO_BLK_RST_REG 0x20
+#define HSIO_BLK_RST_REG 0x0c
+#define PCIE_SUBS_RST_REG 0x00
+#define MM_RSTN_REG 0x14
+
 /* PLL Bit Definitions */
 #define PLL_CFG_EN_BIT BIT(0)
 #define PLL_CFG_BYPASS_BIT BIT(1)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
