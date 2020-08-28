Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8B2C43461
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 07:09:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A891C20CC7
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 07:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3P3gKfFP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="COa8vwjH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A891C20CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N0Dm6HDGBjAK/n/iPl+/AaGc21vaN1Cx/G+njCMiAVE=; b=3P3gKfFP+DUpJWS2qq6rp/mYD
	fs0icYmw4I9e4ECAOAhGpnNY/cClmQtz613P6qzM+nQyJQvqFRF9lrWBYZSTPLOgGeKpnFChzaoV9
	JGZrRcncJgQtL1CT2yR5/zULf6xscqd6YbpSpJeRhFApn0vRpxg5QIyrsIkW17kgSzPjOm+TpCFJP
	UDqi0KonxY2N3JJfaElsGW9s6outhG1K/IN66lXtYegSMEFu7+ds7ELSv3Vwe/141vhFLK3nMfyrF
	OGkDrlYnSTMIhqvuHforEzR+Cwe0S2xhjyZ7Fh+dn1oyHga7862ivJEt4JIbJwtqnFfXqc4WkVsNf
	3TAsyIhWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBYVk-0004c8-I8; Fri, 28 Aug 2020 07:09:20 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBYVh-0004aJ-18
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 07:09:18 +0000
Received: by mail-pf1-x442.google.com with SMTP id p11so182142pfn.11
 for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2020 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSKyECKPJv3nU8Dw0z78rbKPD6Ym+7wJ1BP9bvbD4E8=;
 b=COa8vwjHx2ZzN6nPPNKrxFxN1fyA0xYJ5MZm8IQjFG0daOd5bSUncn2eASIkGUSnYl
 17G1fa5Vz0MVNGq0T6LQZxSEHT0N55wxXo5g7mGBlPhlwYiM8ZA6FPRaB1eY8euSv7Rm
 ofjEK3EPVhaHH5u+LWWXyEUcgXlHUkMrkQ7bwDIhs12viVsvFVLmyJnEMQZLTv0R+aYX
 ED6ugS/WILDQ5IpAGj0usJwyth1Xl9UQIlCOh9JGJzA2VxJo++76eoX7/PIZDPBDNWtE
 D3vLdW6OwKHkHh3q2o4vxy1JKhgcjoRf/eUSCicm6uw3tfvz3HVP7YML1mQjxCGE5ZfY
 XCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSKyECKPJv3nU8Dw0z78rbKPD6Ym+7wJ1BP9bvbD4E8=;
 b=NAUkjRRO4naD+dRz0aLv1uklnU32boTK+Tp2+CunEZomTfs5IY02aKi/ngtCccX8U5
 THGL4BTPYQE4Q6SpqHfNuIHnYdK+1L5iOC217zzAMNRdB1kZ1PYAXnaVSxwxJVIpO/qB
 l0+BH5/gVETtb5Ip3378JIC1k8nZEFzOrfay05gWHKLg4qtvj3REOrFVf3CUSdGy8cUf
 kK16w/Mc5aBYCMPEkU92yZW5SoHwXPrBilMHTDr0W23xOvTDsNBcEli4ndnMGKvnJ76D
 rvnvSbIBmttWeKa7NuIrn9bY/4+F+uTS/9eW/qBhglfg9SsxBrDacv/sTVUXx1uJZmsU
 T6Lw==
X-Gm-Message-State: AOAM5323z4cFzJAiR+zI/HKDHuY0AJIJb48rCNzS76FIlEF3WwFrQ3ou
 HnfjFTkaJtexzj/PutPYDagrfg==
X-Google-Smtp-Source: ABdhPJzjb2TTq/xU0YJvZImSFFpQX7BbQ6hxsBVGAZSfnTtudzoH2x/NN+zAMvGVS9h3tdDUOF9aOw==
X-Received: by 2002:a63:fc5b:: with SMTP id r27mr252356pgk.142.1598598554762; 
 Fri, 28 Aug 2020 00:09:14 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id b8sm434158pfp.48.2020.08.28.00.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 00:09:14 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
Date: Fri, 28 Aug 2020 15:09:06 +0800
Message-Id: <1591b508db1564adcb2179e310d9df2e79411c92.1598598459.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1598598459.git.zong.li@sifive.com>
References: <cover.1598598459.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_030917_296934_517A2B15 
X-CRM114-Status: GOOD (  10.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

AT_VECTOR_SIZE_ARCH should be defined with the maximum number of
NEW_AUX_ENT entries that ARCH_DLINFO can contain, but it wasn't defined
for RISC-V at all even though ARCH_DLINFO will contain one NEW_AUX_ENT
for the VDSO address.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/uapi/asm/auxvec.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index d86cb17bbabe..22e0ae888406 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -10,4 +10,7 @@
 /* vDSO location */
 #define AT_SYSINFO_EHDR 33
 
+/* entries in ARCH_DLINFO */
+#define AT_VECTOR_SIZE_ARCH	1
+
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
