Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D942C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnk3SOKcfkuVROvB2ybLDDcdbqLLOztOft8z1mrJ/Oc=; b=RdOBcGtIrP43Qs
	aVuiWNFWujWF9DTRvzmJwzGvVHwtlNWySwnakSHdhXfFal2I6QMEUVZvJ0Nj1e6S/4bpqxtRJOx2E
	qyN6u8loGMsL6LPkrVmQmvXYFkf8D8YXzeBdblELLB3pmzsD7BJk5vBnAWp9m6+/ejiAT5IcHCFCX
	1/liadSn68gqBm7/IvClfvxKPTME0I25aOmO4SOGKrX7OE8/CnhkIVxmR11rpd1FAxYylDsui/szY
	pXORxgtXDzu9Hl+LrR9ePUP+LukSYCURUKLhnDshKo67wmjB+mvWGisU2Ji23BAOWjQC9vKT0SIe1
	jR1LI48mVhfFtNQnj6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSkC-00FXz3-0g;
	Wed, 13 Dec 2023 17:10:00 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSk9-00FXwv-02
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:09:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3363880e9f3so822896f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702487396; x=1703092196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOePuvM+S3H+LSH8eq3JfoHlyetp7fWNfsOhsAfjHQo=;
        b=TGloGiV1s77mPs9giVQAywFQMhOsR96wgBqsvUFJRLdk1RnY0qI2QccluXFgu/Mkon
         jJ6riEXYIgRXOUkwmuUfkqz9nkbQ+zD251GD51plkNgL2rlo3qM80ZrSeY9wGsgGwB90
         vmgBvx+r7BiY/jQ9UPDzgqNd4fm8bFd3RtzPw8fyRei4eW6XGOWGjqWWuHZdU9NelUsr
         aHDNnUw80BaJEvarhuCQQZS1mNX22SniFOlePlKPpObe5HyGpDFOub+WvoULADjNrobH
         d6TiksLEVOu0TqP6VLuJQ9mZBtxDAkU8JFOAA9nSF6BO9NLIRPxiJhXSYagFUN7ViUy1
         +FCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487396; x=1703092196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOePuvM+S3H+LSH8eq3JfoHlyetp7fWNfsOhsAfjHQo=;
        b=glib9+2ArSjncWqR+PSCCZDVMO5Y4X2/bOMSewQBwcypXD2u/HaDhIdQVbpYWGYLQ3
         DLleiZe+Us3NWrw10m2oD6tZ6/9Q2a8b6U30KVOxeinLCA2G9yU5RinuPbbIYdOebmky
         tDbyOUONUxHy4/gYsOTvIPWbEwNXIKCrrYXpu7L1pWSr4Cy1F2DBYkcsX+bhw17bMibK
         o2b1YypHwBjrZ9xZCDx4G9oqzCYDDVzdEvtm25YHPqV3r/GVuw6hiKdSm+MhH56Z99Kx
         9b6F9cNc37cl9ewNxpWQY9r8YSGAKo0DWzeMeDNsv28dBsAZbW0iHLGp/9GRYkvvq9n5
         obKg==
X-Gm-Message-State: AOJu0Yy1GaySwLIwQXY97A+IWHk6dYLKi4Mk4GP+d96p3/oWBgPkUigL
	Mq8xyd7iauYzY4P6CVnksbbfwQ==
X-Google-Smtp-Source: AGHT+IHjNFuzFCA/KLkgLbI6z8lFwjySpYLAOE2yzrBsOqp2zCXcldpTaiUNoPokRLaP3oh0zY1pmw==
X-Received: by 2002:adf:ebd0:0:b0:333:4fd1:1c6d with SMTP id v16-20020adfebd0000000b003334fd11c6dmr4216770wrn.31.1702487395673;
        Wed, 13 Dec 2023 09:09:55 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d4e84000000b00333332a8d39sm3658618wru.55.2023.12.13.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:09:55 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH v2 2/6] KVM: riscv: selftests: Drop SBI multi registers
Date: Wed, 13 Dec 2023 18:09:54 +0100
Message-ID: <20231213170951.93453-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213170951.93453-8-ajones@ventanamicro.com>
References: <20231213170951.93453-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_090957_049623_64ED0372 
X-CRM114-Status: UNSURE (   7.91  )
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

These registers are no longer getting added to get-reg-list.
We keep sbi_ext_multi_id_to_str() for printing, even though
we don't expect it to normally be used, because it may be
useful for debug.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 5d86c761784e..27d07a32a1ef 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -571,8 +571,6 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_EN | 0,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_DIS | 0,
 };
 
 /*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
