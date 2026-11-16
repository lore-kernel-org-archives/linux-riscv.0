Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770CF606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 20:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v0vpuRUT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4+6Y5Ja
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xCVgpJSKamk8/iyHfaUd5VOjjk0ykLESF2+IwcWdZlw=; b=v0vpuRUTpYq0ekxD53O/riG4Eo
	zfizVaFazGhUVd5FJJA/E7p7GQjSJJDSzaRfT6SOoNcusKW6emnEkWYCM8osq32RKX9aj20HZp83J
	yo9il1DpyFKgVuBzo9im1CGDE2W2K87nuMW22iyGjhtwVsXn5kv+qAvL+Dr1tEozkSPlSSqzzvrGR
	6Mu+xEs1Xylf2nG2YsSXZk7nWl2hae0h9MZq8wlcNbKIEluE85ojoWfqDujU8LccSLUrr6N4/SrFn
	cPO+k+YYEGNKy+BCijY7jWSOl/REQPJvn37adjHgMW89cAWylbw2u9k3fMtzLRVs5PVewp7XIjj+8
	tYROZisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT31K-00000003qCn-239d;
	Mon, 16 Nov 2026 20:09:42 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT31I-00000003qCI-0Ze1
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 20:09:41 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1a2af4c8d00so7951370c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 12:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859779; x=1795464579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWKgu+mFgtlwrDE3M/qikiFkywyfILm386oFvXBqykM=;
        b=w4+6Y5JaHY24RRKCb0EhWhEoPr1v24Y39keWe3WrLz+OgPBdG1ia0IAGYg5zY/qTXU
         bB7lmg/jFouQhRxIH8k3RuBII9imxDiHEJdQ0VI3tLkIZcJgMtUxTg4vrviS6YvWS+iK
         2ipJBaGmy4o9z0brvfMZn90cOWXOSNfQXbkOYZRT0l9a6dUbgV8ZKP8r8g315XM8l1Gs
         ZDeD7g25Z8OlH3May/S/gTeRFJZVL8y2Z99IvHAKdDM3Wl9K29VUPKfAgXrW6xc8/AoD
         PGkM6q1/gDawhHcAhLhN/w2JBbcM3kBul1gPJbUimJfe6UUkbEz3KjDCdf2C+U57MLc+
         m4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859779; x=1795464579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWKgu+mFgtlwrDE3M/qikiFkywyfILm386oFvXBqykM=;
        b=fVUwloLTIWpCBe6g8fguBBRo3X+mMl92Msl81jAaJdXFOmGi7ZCuDG434MZ0ph98CZ
         M9pAim0BBh+zuiWR+ykIk34csGR8jqU8S4cijclbcbwScrYIeFO9hu1Z4M46mcYV6ewz
         6KnWQW7JTgY/d6fMmx6zD/yI95gzztCjEdVvv4mdobrjJmh3PY/mgEv0PDY0m10g1UlY
         Yej9v0eKuY6d744Kps8brtGqXJUsYrm2ZlFV7Z4X8Eta3Vy7E6k36gjD+ViojHuiuQG6
         NQ7Vt/C6HURT1qrBja8BpahSOfXtBILdKms1wj0ODqUonUUwC3pjAvBu5dh+ulmcqJ16
         IjIQ==
X-Forwarded-Encrypted: i=1; AL+hErFeVUguMfK/gNw0nHZy7VX+mO0eB5S3CjEgo7PxHw6Y5ygNnBjnMvR+UqM5Jiw1j/l3GpO9d3SlDUaZJg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+GHsvhVdsIs6qrc2ik5fyHp0mwOGv75Kw1RWgotepcz+tUterW
	Sn66bZFkCaoFU9KLoxXU7wrM+h4qKpoM/Cyvweh803lf8MFGGLcK2tVL
X-Gm-Gg: AZFdTZc1ZyVJftGi1EtEImqbOtgVprfGVtR7kooM3OaHv0EfrGoNnAKEYrkWeN/MjIF
	MRB0nXwjOcBDe+NLedalzWc+VFrgpMoz0siQ0tlWoQYBlBH5Hbv8a5C1PkQK/liD8+hNyu5/8IG
	F12fHogJxOLKfsvcEVrO+Mfgjkf029hhlxWScyz1d8Qw089qzBHHi34wqvJu8PPLhrgHYuxW87F
	Lj/f7+FvdsgNtZ8yjnMh+KhHAcrS83OkN+RJsVIkMB2OUFsu7KmNIHVUcNUhb/v92PdFtZdazgs
	tfLVxvHpdCPZoVYT2Y/AK9kaX3uX6CHweV6Ny8FnlT+2R3SYNobOpT6vKJnwIBaEsXSf/C7slGP
	oNhDQwuY090DwDGQ3AewVbdtNVBbFrmilimBPKRd4J4EtsAyN1Pxy0N+rAWSb0rvFjZGtCTJKYg
	vM+g0OcslNk5pKvqPfyRhmjIxQZYw70lM61v8Sw1UwL3naX6j5jugXXgxixks3uABle//lPeK/9
	3ietRNC+68NZs6ifmrTSyxrnVqGUkDRoGLBsWM8Rfu6GQ2eI3bksHSmZvXIVpCYLvnEB8RKQB3r
	u5hEs/xMp+bLFFpCncPvwvBNhhRcPoAU5vLipuMK7fg6URUPZfGrfBpiZfgNhjLFk9sjHsKP+Ar
	k6Qjy50+ppKcgcmv0
X-Received: by 2002:a05:7301:11b:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37967316395mr13071358eec.25.1794859778068;
        Mon, 16 Nov 2026 12:09:38 -0800 (PST)
Received: from hp-OMEN-Laptop-15-en0xxx.tailcef561.ts.net ([122.172.81.184])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm66737021eec.21.2026.11.16.12.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:09:37 -0800 (PST)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH] PCI: fu740: Disable pcie_aux clock if reset deassert fails
Date: Tue, 17 Nov 2026 01:39:12 +0530
Message-Id: <20261116200912.156500-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_120940_174869_0A432797 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

fu740_pcie_host_init() enables the pcie_aux clock and then returns
without disabling it if reset_control_deassert() fails, leaving the
clock enabled on the error path.

Disable the clock before returning the error.

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 00ec69a09164..2355243da793 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -260,6 +260,7 @@ static int fu740_pcie_host_init(struct dw_pcie_rp *pp)
 	ret = reset_control_deassert(afp->rst);
 	if (ret) {
 		dev_err(dev, "unable to deassert pcie_power_up_rst_n\n");
+		clk_disable_unprepare(afp->pcie_aux);
 		return ret;
 	}
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
