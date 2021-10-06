Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F93EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:48:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C8C6113E
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40C8C6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uU7v+T6wqtjwix+OMJTniw/gTtIgPxJRfjTIh/2PQ4=; b=nqBG8xw8S/ndru
	zNlQmEgZ1T+WE4+44A7j9GpeKlzMQ+zOvIfHhR6m7z2qKChvx83tFw6LB5D4lESA+XaKa4K8/A9Q/
	GTDAGITRN++p0Ja9KUTv6zdiEZ0vHDtcsitKkCp0PooYaWpxrTrLy9dJJ6ClWkL8iNbMnlbxQvhky
	+qZH5833rWnOAc/2iVXJEuAcUI/oh3h+XerpBdpRsNw1y4XURE5AkvZBCpVUvsaDvaq7b0xg4Yflb
	ldLhnNnsMg4NHN2d36gbxC5wlzP+QIxdlspQ/gATXHTcKVc/7czjsaGzKrZRZ2f+dFmIzfqKVgZdJ
	hl3WEgL9bBEovLrFc3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA5d-00F4Vd-23; Wed, 06 Oct 2021 16:48:21 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA1I-00F29P-EQ; Wed, 06 Oct 2021 16:43:53 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 h16-20020a9d3e50000000b0054e25708f41so3071853otg.0; 
 Wed, 06 Oct 2021 09:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YhacG1oflfweV+ZMxYJrdhD3dQtCOWEVKc3UA01qLrg=;
 b=On9lb0qpU4T+GkzVFtR1tWY1IuKmyYcQFHmlskPm4zvsiIIvEaU4VolgqeDMJP9Ws5
 bvYl41ehRSZdfnGjGUoLwRWwg4sQ9grL4esV5YexDXu6D3wSQsNQWBnAFA4xg8exJdLF
 f0O67j7DM3pDcFqGHlwDrtP+v+oEe+TLqZwNwAmu2LAfdU0CkdP8bRg4huCd9TxZgiEe
 iFLhe51/S107Zi6Vx4O/xRgBIX0Ft8nX6iqKatXpEM+WRuxmYy1Q9wBrGPn1lEFWN81g
 bH7u5i1Mj2KwUiByOpVqDYHCcZhMrhvpMBSDIFWv+5nceQLM8PBIO5GQRB//EWkQyPmq
 kjjg==
X-Gm-Message-State: AOAM533s2u6+9fxriBBahUX0bcnYuLNahy81bh8VozVNKEfftg8L8HxZ
 9Jf/RVSyGqvcV4uHwn86+Q==
X-Google-Smtp-Source: ABdhPJzJQ2R5CEfp/bAtXtoCRQDaDF5B6RqZA1flXSsxFu0kVfpgeNfjZq0OKrhuVdseg2/0PDqWlg==
X-Received: by 2002:a05:6830:455:: with SMTP id
 d21mr20503877otc.300.1633538631080; 
 Wed, 06 Oct 2021 09:43:51 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:49 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 08/12] riscv: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:28 -0500
Message-Id: <20211006164332.1981454-9-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094352_495029_F4CBE6E7 
X-CRM114-Status: GOOD (  11.78  )
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

Replace open coded parsing of CPU nodes' 'reg' property with
of_get_cpu_hwid().

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/riscv/kernel/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 6d59e6906fdd..f13b2c9ea912 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -22,7 +22,8 @@ int riscv_of_processor_hartid(struct device_node *node)
 		return -ENODEV;
 	}
 
-	if (of_property_read_u32(node, "reg", &hart)) {
+	hart = of_get_cpu_hwid(node, 0);
+	if (hart == ~0U) {
 		pr_warn("Found CPU without hart ID\n");
 		return -ENODEV;
 	}
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
