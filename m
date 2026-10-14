Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DC2CC6B2D
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 22:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dz83h7vb59Vsgu6JW7bjt3c+nGxdtOMwkd5dth4lcvI=; b=kwsrDDUa6dEYEu
	pc9y7CmJ6RbB3LhrrBTynswEUk2/mGKeTOSGiZHVCIXO5oYXUKbMTkhc4ESU+/aq/coEnoEkICJNV
	aCuOO/9/P7/Dy2PeGShaCC/6GBxyUpKRhh/yox3INvaDltq+rsXZvmkXOFNrspzRkgfDAd1RE6ICv
	pBTu6Nhs3Wih6UKtp/T9PcDv92M6CH2qe+FshR93aW7HGK4GU/6DOZKx0be+lFDB2Pci57alcCxRK
	W9SmR0tffu3CulZqDNtmQJGj5McTSFKaBNkN7BvAg6jdJjN4Q4EK0yuGPEGPNoH5L59ZrLCqpjBJo
	rGDON636PidFbBAO7j2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH7ga-0000000GQ3L-4A5X;
	Wed, 14 Oct 2026 22:43:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH7gY-0000000GQ19-1lzT
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 22:43:00 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D7FA640267
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 22:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792017775;
	bh=ZdiR6FLWYbNv8HRJW/cp7ACv/gfnAQ2Xl+ab8eRDEmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=mCyY4jhJ7ZcI7KPXDeIzGwVCxBKUoI8uwCSvNUnOhKAYsNVzpRR9r9FqHliqmWXKf
	 dFVEB9WbdK01k4cUqfzyCxA4rbN082iwp7XLjkQlz2RBKs7XQo0SHVtHi6zwfTaq9z
	 SB96uLSzcDkQ7j0yAUe5BG6yW5Uz0q8fICfoBfiWRzQqtd8e9gZkg9SgGsplvAnLL/
	 h0SmUegl/FQUlh8C7P9YYUuwo+Iua1kYDG/e/yWXJAxAZIBpOD3ZoekPMbwqG+IwVd
	 c7M470grJn5VLBCN6EsJVekDdMn6lkVahne/zwy9VkM7UweXNTW5atP35ekL+ywOau
	 IqZsR42PozLpTqtkaOcrbpRhDQ3rExDNpYFyc22kt9lj74V4qvbrqhkf+OPDsu5BAP
	 dDr1JAPEFz0jhdaA8gZJEb3K/yeFVQ1BSN/W00EeP4Ldwf/1u8hafSbyjmmo4JLrQ0
	 5b0c+GU1YTViyNA9Gb6MPzmbBKOzY94XuaNhGYVXIqCqlJQwsM0m0g+6FWqner9S5G
	 u+SvEChXqIQqVmHC9B6dd0eUrgNdaQLOvZc8DVO51uuMpI/mutqKoKRM4FLdFO5vWg
	 bmP3Wr0j3x9GqrL6Eva/FfRos6F1cnVzKERcg2n/NXK4giXX4aYXDoVrYQKSOlH9CP
	 X9slncHwmwTTkpH8JZX7HGBM=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a17741243eso9314795e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 15:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017775; x=1792622575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdiR6FLWYbNv8HRJW/cp7ACv/gfnAQ2Xl+ab8eRDEmc=;
        b=Evqv2cGHOZdLXKVAasAoHExqWMW0mEWx48IhomnV0yjDB+WyH0L3Ct3trRMXr4P+/4
         LCrQeRaNCU0xn42OuBQfUiBQTkwcCHkYvyArOP4OToEYkPbEpagkmi87mRYkpqPltUMp
         om9bJxWBs4ofIOkdCHrpT6TZ0QmcPOF6wuj//Xygnc38/2XNXQG0leXnmpyI7rTqRcT7
         BNGQvjqMCGndR5O606sPp5WFUVfmcfNHzacxQnO85AxVSg9HC2jXI2Gt8xd+e1aKqel6
         BikmB1ghZDBXi9HXPfo+HgZqXkpeCffW2os20hb1GVG8e1tSLlUzJ1O87QYbjgVDHR6d
         rA8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwreROPGtDs5MwGApAhfXVbtF5WBZIAqzY0kCgAHtHZDbS51M/xSeW9l/d15OBhJOA030jSvqAiWUuHfg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKMCxSng6/QphCpJI8ixxIxpsQucsnQAHeKRRdRHgvS3Us/Rsct
	yAGPcxpkLVQa7rSkwfukBiRw8QASumNFQQOGGsaJgX/i1M5YbUtHD///3R5ZwVqjdj5LCiZnxD9
	3FclD2AWjsCTe86lB0qaE60jDZ9t9RXWhCZ3QSufCE/29kDhTI7TcHb3zfTpWSYTJJ2KOkYxy26
	DdxYgBj33f2w==
X-Gm-Gg: AYBFou2PC1937SWrT8aclrNHcPFPVPZcSQai5fthfaMfwobkKO3PMw4mthIf6kr9QeI
	XVjuPnXqJ5MaCAlDzxUT7J5Kow1NKqUWEH8e9h/N9nrVhS1lwgy5kqruFslSQN8jypat12/C8uh
	PKYXIpLBXPC/jQBkwIROVL06t558u9eb3AFXYxdAFBtssaEzXV5LVNMvnRVzcCIuZL449UTkpHk
	LED72piDtziBxs1saSid64glA9xA/3MPBkhXJ03FIQkmjaufa78ai2/pIJ2jpusRleqtIEf0bkY
	TPkZNqUo9NQ/hQ765J7HrGfi0VbHMpI2CaOP9SZcHztm+7Llvi0UbEdfy10HhGsDeEuOJOiyQoe
	BenFkHYenCw8/TGpmwh6OOZM5Log1GYpURcm5arKlvRy2S2KZ07mAvIyv
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr359760925e9.6.1792017775557;
        Wed, 14 Oct 2026 15:42:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr359760415e9.6.1792017774558;
        Wed, 14 Oct 2026 15:42:54 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:513f:8595:22d1:d25d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm23227965e9.10.2026.10.14.15.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:42:54 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sarah Emery <sarah.emery@canonical.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 2/2] KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs
Date: Thu, 15 Oct 2026 00:42:39 +0200
Message-ID: <20261014224239.963635-3-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
References: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_154258_598009_1605DA71 
X-CRM114-Status: UNSURE (   9.14  )
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

KVM supports extensions Zicclsm, Ziccamoa, Ziccif, Za64rs for the guest.
Add these extensions to the get-reg-list test.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index bf3980e9db127..71e5969142b30 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -63,6 +63,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVVPTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZA64RS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
@@ -89,6 +90,9 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCAMOA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCIF:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCLSM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFILP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS:
@@ -576,6 +580,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
 		KVM_ISA_EXT_ARR(SVVPTC),
+		KVM_ISA_EXT_ARR(ZA64RS),
 		KVM_ISA_EXT_ARR(ZAAMO),
 		KVM_ISA_EXT_ARR(ZABHA),
 		KVM_ISA_EXT_ARR(ZACAS),
@@ -602,6 +607,9 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZICBOM),
 		KVM_ISA_EXT_ARR(ZICBOP),
 		KVM_ISA_EXT_ARR(ZICBOZ),
+		KVM_ISA_EXT_ARR(ZICCAMOA),
+		KVM_ISA_EXT_ARR(ZICCIF),
+		KVM_ISA_EXT_ARR(ZICCLSM),
 		KVM_ISA_EXT_ARR(ZICCRSE),
 		KVM_ISA_EXT_ARR(ZICFILP),
 		KVM_ISA_EXT_ARR(ZICFISS),
@@ -1238,6 +1246,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);
+KVM_ISA_EXT_SIMPLE_CONFIG(za64rs, ZA64RS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zaamo, ZAAMO);
 KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
@@ -1264,6 +1273,9 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
+KVM_ISA_EXT_SIMPLE_CONFIG(ziccamoa, ZICCAMOA);
+KVM_ISA_EXT_SIMPLE_CONFIG(ziccif, ZICCIF);
+KVM_ISA_EXT_SIMPLE_CONFIG(zicclsm, ZICCLSM);
 KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicfilp, ZICFILP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicfiss, ZICFISS);
@@ -1372,6 +1384,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_svnapot,
 	&config_svpbmt,
 	&config_svvptc,
+	&config_za64rs,
 	&config_zaamo,
 	&config_zabha,
 	&config_zacas,
@@ -1398,6 +1411,9 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zicbom,
 	&config_zicbop,
 	&config_zicboz,
+	&config_ziccamoa,
+	&config_ziccif,
+	&config_zicclsm,
 	&config_ziccrse,
 	&config_zicfilp,
 	&config_zicfiss,
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
