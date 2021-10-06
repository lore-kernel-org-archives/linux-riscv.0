Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5ACEC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:44:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81D761130
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A81D761130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07E2knxNPlBTHIYCD+NPz1KXaPVLqUOWiYYdCgYUbjQ=; b=U2Tj5yncVrjSLO
	BQUhtd10spKjMssXDELB3O54GDKT1UC7oqF7a7+hnOMgloszrjqcRJgSr3eJ9WzwCg98dbIBHDQaz
	suWF01j0Vw3B5CnA6Tix69I2IAe+vXGnACqC10I+PNOoPiEg0OzmYs1uLAW7ee6sKr+eiUbVctrLd
	bf66krAmBSjofr5Tar+HKRPVPN+yKyWWx0r9T81Ourg/FH/943pValJb1EiqA1qZbgNtGIP1zVIsb
	LTZsFqFj+agZbbrezP1eGMuoTr11VVTFJWEz//7OCJMtlCVxsLxGNtv+/+I5v76B1HzkUYbLveC/e
	hoxxnnlDC8kVD1NlJ+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA1Y-00F2Ip-2U; Wed, 06 Oct 2021 16:44:08 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA14-00F22c-N9; Wed, 06 Oct 2021 16:43:40 +0000
Received: by mail-oi1-f169.google.com with SMTP id 24so4949856oix.0;
 Wed, 06 Oct 2021 09:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uA/cSYcpVyY62IJQPXwhEfvcH0a7DNNoh6QF/gbSv/o=;
 b=ZIONa+MghHpVISBsFa+ktTPEd0/qoVrT8avmkwqApwHavjHJ1F5UfAR5blMUvhL6Yo
 B8gYt1oWGclJ/I7oI13S645TPOZpRYhMxZ+WggBKHesgBB1T/x3DX3PtoTN3UC49jJAR
 DtOGRrU1IrUWXo1ETxST43oo2ks8ikL+3A1tY+q0YHk4T7+FZUAoSG26tkF4WfVi5xUv
 1lfy2kKel5BkXb63e1rYQ9dc9Kw/rU9rP7IykZ1t7UoDfy9f8m2ET2TBSBZcofxvluta
 6XNx6eFYUtm4OdDXiW39r0XTgUPiGNpjoDMQ4osW3gbLQcmRy95rUEguFif8i3FbvRln
 Tvwg==
X-Gm-Message-State: AOAM533/Q5BNuVI/uE3/OyDcHEwRysbgHMC7Ssp4G6yF5VX1MDMLzUVg
 gvmfjLfEFTYq2sfeaPb65w==
X-Google-Smtp-Source: ABdhPJyz5HqR6tKtFIEsHk/GSarLhJvs4xTI3uQnRBWEIdAL05spj94Pn3luIAFrkmprFHNc17eP4A==
X-Received: by 2002:a05:6808:231f:: with SMTP id
 bn31mr855081oib.66.1633538617237; 
 Wed, 06 Oct 2021 09:43:37 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:36 -0700 (PDT)
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
Subject: [PATCH 01/12] of: Add of_get_cpu_hwid() to read hardware ID from CPU
 nodes
Date: Wed,  6 Oct 2021 11:43:21 -0500
Message-Id: <20211006164332.1981454-2-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094338_776614_966BA96B 
X-CRM114-Status: GOOD (  15.83  )
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

There are various open coded implementions parsing the CPU node 'reg'
property which contains the CPU's hardware ID. Introduce a new function,
of_get_cpu_hwid(), to read the hardware ID.

All the callers should be DT only code, so no need for an empty
function.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/base.c  | 22 ++++++++++++++++++++++
 include/linux/of.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f720c0d246f2..e587ab44be22 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -286,6 +286,28 @@ const void *of_get_property(const struct device_node *np, const char *name,
 }
 EXPORT_SYMBOL(of_get_property);
 
+/**
+ * of_get_cpu_hwid - Get the hardware ID from a CPU device node
+ *
+ * @cpun: CPU number(logical index) for which device node is required
+ * @thread: The local thread number to get the hardware ID for.
+ *
+ * Return: The hardware ID for the CPU node or ~0ULL if not found.
+ */
+u64 of_get_cpu_hwid(struct device_node *cpun, unsigned int thread)
+{
+	const __be32 *cell;
+	int ac, len;
+
+	ac = of_n_addr_cells(cpun);
+	cell = of_get_property(cpun, "reg", &len);
+	if (!cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len))
+		return ~0ULL;
+
+	cell += ac * thread;
+	return of_read_number(cell, ac);
+}
+
 /*
  * arch_match_cpu_phys_id - Match the given logical CPU and physical id
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index 6f1c41f109bb..807f8168dad9 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -353,6 +353,7 @@ extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
 extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
 extern struct device_node *of_get_cpu_state_node(struct device_node *cpu_node,
 						 int index);
+extern u64 of_get_cpu_hwid(struct device_node *cpun, unsigned int thread);
 
 #define for_each_property_of_node(dn, pp) \
 	for (pp = dn->properties; pp != NULL; pp = pp->next)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
