Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DADFC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:52:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DECEA6103E
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DECEA6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfQ0FxuOqSXJWQZSoQYXQhKbs1FdlJkXxELk1V630Dw=; b=gkJhpvA5XHXBAD
	GZKqBj5J6IwzJfW7nTOMr+UPpOCvsS+BYFaYr8y4kyxKgUwvgE8AGN6LP97n2SE7kyTiiLgWSYwAL
	3bSQ4TVazcAeJT/qU7g2+UUl1Ilqwr3z7jpq8mg1jNEE/gNS+U7V4G3hrKKXIwu8T98SXrTFQ9wZv
	2cHQjC74D1IPv2rdfqP8pNT4HQC+cgdAihuFGpzmbpmUYVj254bXxpBPDA/ulTgJ9iFVT1rXMOwdA
	uwwEwMdehkdxW30GezsjtUYx0yB8lXBvBYj9aHneOYNy4W092PhDyYAydVHXAG0y5LJTyubhULug4
	lLGanh2vOISbkQNEHbLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA9Y-00F6vz-B4; Wed, 06 Oct 2021 16:52:24 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA1P-00F2Dm-CV; Wed, 06 Oct 2021 16:44:01 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so3941904otj.2; 
 Wed, 06 Oct 2021 09:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ODdwkiH4tXq9GvyXH7/gt65PfkKCS+62hrrbhfBOAKY=;
 b=qJiFOc1ArbMuHfPh2zWcwGEUrnOYgIsQcb8hxwpwThzPeW9Q02DoKVoeVCNsCHHLUN
 wYFnc3mUSJnjnUiTONQhU4WszbS/F5XME+TCG71e6QP/Wxox05a6hjMW5odFujvL3Rrd
 QfOtgAKOMjnuXb20K9AvKJQk9Y+nIe5tRwUvPCdbC4exZeRUJtR7A2btLaGHAbifsXd4
 tRA4eCSth7cPs9cdmFHuUU5DKdKbnn8JQPsrLtb5E7U/HbIwqno2uDXLdIA2zti6pVwf
 r5MLXBfrob9nkLLMrjdO3MLHmZXM8G4mcnOQsZMn5jXzOdCMmbmPBTPJbszVDMO9PxJp
 clOQ==
X-Gm-Message-State: AOAM533AmPtO0gwTBotitVxbLuvSpUQNIeYC9qYhgDxty8ces9/bGgTJ
 cVG217eHVZ25K9X5JNn6Hg==
X-Google-Smtp-Source: ABdhPJyKbg8/vmyrEytsmwBD61hnJT/KfL8RD1L+0+jj33vwvFOqRG7dPOrAYWXK5lnk+W9TvgzSoQ==
X-Received: by 2002:a05:6830:1ad3:: with SMTP id
 r19mr19253078otc.98.1633538638626; 
 Wed, 06 Oct 2021 09:43:58 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:57 -0700 (PDT)
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
Subject: [PATCH 12/12] cacheinfo: Set cache 'id' based on DT data
Date: Wed,  6 Oct 2021 11:43:32 -0500
Message-Id: <20211006164332.1981454-13-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094359_476284_8EC7D590 
X-CRM114-Status: GOOD (  16.07  )
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

Use the minimum CPU h/w id of the CPUs associated with the cache for the
cache 'id'. This will provide a stable id value for a given system. As
we need to check all possible CPUs, we can't use the shared_cpu_map
which is just online CPUs. As there's not a cache to CPUs mapping in DT,
we have to walk all CPU nodes and then walk cache levels.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/base/cacheinfo.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 66d10bdb863b..44547fd96f72 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -136,6 +136,31 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
 	return of_property_read_bool(np, "cache-unified");
 }
 
+static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
+{
+	struct device_node *cpu;
+	unsigned long min_id = ~0UL;
+
+	for_each_of_cpu_node(cpu) {
+		struct device_node *cache_node = cpu;
+		u64 id = of_get_cpu_hwid(cache_node, 0);
+
+		while ((cache_node = of_find_next_cache_node(cache_node))) {
+			if ((cache_node == np) && (id < min_id)) {
+				min_id = id;
+				of_node_put(cache_node);
+				break;
+			}
+			of_node_put(cache_node);
+		}
+	}
+
+	if (min_id != ~0UL) {
+		this_leaf->id = min_id;
+		this_leaf->attributes |= CACHE_ID;
+	}
+}
+
 static void cache_of_set_props(struct cacheinfo *this_leaf,
 			       struct device_node *np)
 {
@@ -151,6 +176,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
 	cache_get_line_size(this_leaf, np);
 	cache_nr_sets(this_leaf, np);
 	cache_associativity(this_leaf);
+	cache_of_set_id(this_leaf, np);
 }
 
 static int cache_setup_of_node(unsigned int cpu)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
