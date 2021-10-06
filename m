Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6E2C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:50:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F8296113E
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F8296113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQdckqn78NWZIhcDaHkltkftg5Eiq97I0SjhR0cHcOI=; b=LqLZeqQANfF6Cs
	IBdhIRNdhYEqnQD3+imccmMhv50igKYa7ARW1qym1UMX6Gk+NloNUVqqxamjULHhmO5+Un0MmX2qL
	3SkGG7uugXeptz0FtDk4HIzyYO5RtYzxkejXv61ss1EKz4rUhKGpbs5cmpxPiDjY3Tfqev71ZwSob
	2irldU5i9WVEWuDD/wSXBcyZOBy0ZSge/y3xgp3z6eCS4D7m+jQB8Cxexu4pHla6WvmgIuvjmyJir
	0DEEtTQfDOAr6NKq/FrT1AOL7m4XMbRHVxZ5XV6CWL1RvyvNEu98klLw7B7+TF5s6CV73fkSW5KF9
	pD3HfL6ZWfffKB4zXYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA7D-00F5HV-Hu; Wed, 06 Oct 2021 16:49:59 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA1M-00F2Bh-AU; Wed, 06 Oct 2021 16:43:57 +0000
Received: by mail-oi1-f181.google.com with SMTP id s24so4841196oij.8;
 Wed, 06 Oct 2021 09:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J13zoIHrX4tLH3WneJUTeWV7jFKNgk6/LfnJOFSAv7E=;
 b=1svU/8hVX2CNvpLo+G903jRUDZUeQClJ2Xz++gohAOhTl/yz0mh3CHF9Yz/2xemHrB
 pjvQaiLC2hcEcDs/KBZYLdBwaxwbX5LMLvkwMd82mUM1+Qz0batKRiXEEKD5HhsuzRLH
 PEr0lWJlBJHz5KWwhYyuHlyqmO2+8LA2+gbv/7KRHpW3ZfUS+vW6toYaZnUdT89M8VAy
 cFjnz03MRC/vbWp8Dj0s370wMOLx6pOED4/46vOE6L8AolRGE7l7s4rmK77xh2dWRCg+
 74nhLJDNNcoA4TMk66ejF3wgDKc6FkYdEhJI/X3Al7e3P28zZy4gyPF8VL74Wo1Tytb3
 gvJA==
X-Gm-Message-State: AOAM531aXmQ+M+vSJpfEqIev5wEtZtX6LUv018TtmROClDGOfm9GGy/j
 /N8ybobXXXFa6eST+AOBCg==
X-Google-Smtp-Source: ABdhPJzsmLqvAc8ULa8uzHfFQAR3YkQa63E6ZsBRL9k77fBu+BE8j4mODwWxFxPISSskaMe8DkKEfw==
X-Received: by 2002:aca:c288:: with SMTP id s130mr7509039oif.138.1633538634953; 
 Wed, 06 Oct 2021 09:43:54 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:54 -0700 (PDT)
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
Subject: [PATCH 10/12] x86: dt: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:30 -0500
Message-Id: <20211006164332.1981454-11-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094356_410927_26C40E50 
X-CRM114-Status: GOOD (  13.84  )
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

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/x86/kernel/devicetree.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
index 6a4cb71c2498..3aa1e99df2a9 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -139,12 +139,11 @@ static void __init dtb_cpu_setup(void)
 {
 	struct device_node *dn;
 	u32 apic_id, version;
-	int ret;
 
 	version = GET_APIC_VERSION(apic_read(APIC_LVR));
 	for_each_of_cpu_node(dn) {
-		ret = of_property_read_u32(dn, "reg", &apic_id);
-		if (ret < 0) {
+		apic_id = of_get_cpu_hwid(dn, 0);
+		if (apic_id == ~0U) {
 			pr_warn("%pOF: missing local APIC ID\n", dn);
 			continue;
 		}
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
