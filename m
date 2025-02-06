Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5954FC02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vc3Whss0tnkYa9yyuNwRO/UjSC+3GTWSr7Ma1mO1Uc4=; b=D4MDI+oaym8ugK
	EZI3PCORKxifr4X78cbojNWOx5IoGPh2lIK0XuiVjGrxfV+kdOZOki6ki3/FQ2prYcb6sw9PHy0C0
	NqQ1JxDaMxYNT+RC6oqwkKxWzveXuwD35QnxileRupxFn1UoB0OV+0AAPgimnyfMzf9TGSHDYkD5n
	ClvSnU8I4s7IWttPFH1rZr8LKEHD8U1/f5gtEsZOf1Y84cbnsKxIKeC6Qh7eRs4Ud6xFiMDfV8q+y
	ZtYmTCs/xo8j5RA8T+mtYkDjMUIdVJJybaB93nHvVBB5UtlrvWkUMZ96wte35JnvEigwA0MWbEjxs
	yu2ACPEKjmDUnecRDbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1rc-00000006Pfp-0Ooi;
	Thu, 06 Feb 2025 13:24:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1ne-00000006OY6-1mBJ
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 13:20:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2161eb95317so16777255ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 05:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738848009; x=1739452809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf4go4iQL4QMflVyTQa4GngDZqe61egNHavae1e4JE8=;
        b=JbzegVdOEbLN1Zue65Lig3sm95B4mkGvPI5bnL1LCvf9nrKqdNPvXo5vtE+zdWXhAe
         M8FsCK4oM2pOd67qt7aSMkjFpproh5GfqtdOzE2n3svbsHy7vA8W59b8i0e4ts1nGLHb
         Yll6QdiJluFr8Aaa2GobtoWVIG8QzmwQC5v+DtyDQUQgOQW74nq6Ei10LUu+O0rxeQqa
         4Lv/zfOsLoU4/B+4Rgh6ZfGmU0+SIFCa5d/SMKzY2AZ3VL1bQxBMfRaEySSAD4I+9lMK
         xHUlc81o4+/2ukZ2T9DkfLQpYW3H2dp+saTs3l4tqR9y8GMUZWY/kF+f4ZUS+sdH6EB3
         0Oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738848009; x=1739452809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf4go4iQL4QMflVyTQa4GngDZqe61egNHavae1e4JE8=;
        b=w/6RJgvRVw+FauXqj9oxl3Gf47go+cxIPego+Trb5i9YCWwUtqU2FrAitT/VtTckQT
         ekMiSA7LLN6i0GceuO6xiamO5kfAuwQ7oK4TuE4Zb/YuULpL8sNW0zKr3HBadKuguSpE
         OF7kE6kGCKYPQNJMk9pNWUX3TWtIKn+aU/H+h6a7ca9MvipQ3LlV1/uzKraaKvcgEyv3
         v43ncO4rmiaCjdPfa72so9lQ09pavF37fWYgtv57VZukLBSAMNDlpr5kWv1sUYl1Y1lG
         mTOtkUDXuHnLXV5prgVNmPftU7MNy6GODvzLOApy5fGOmH+jjpHVG/2U5sJDxdBNh2Rg
         wsvA==
X-Gm-Message-State: AOJu0Yzo0lUIOxsmdv/wn/XhIS4K37lvbvrKamHvej7DVyc7wrGKLhcr
	spAIaxr49S/HgQCb82gxBr6CImulnOYfsCH9uMgm/ZsGjKPYJgs9n5YspioYE6Y=
X-Gm-Gg: ASbGncsdgqmJcXhqi5mg9Jr9nGte605/HernVDhndQcl70rbTFxeYwnpzDd1JsFeQ46
	s4fwRetJwIJthfbrkM39l6sk3AklupAvapXAIIaOY2u0SImvHgs4vHFYyXCXqdVoubh4lVu9/sP
	xaVlvqt28FjQ//FoowwYQ6lW6zh33vugn6HtHpWLYlkiOIEEiT8niWzZN5Fg5TITpUwoIgkGubz
	SN1wfz+7JGNaFCdVEzFs3GHHpM/J2hM/AwMitN/dljm7cmq4xbsPE4J61uQfBeg63wPxciBACv0
	w4ojHL8QnR6kcQ8r4g==
X-Google-Smtp-Source: AGHT+IGCPThNvLp+8va8nWxjbFE00U6UwUxIviEx1VgOqPw4pw4AKuRjGCX0YPWkMIbmGUsUZc9LiA==
X-Received: by 2002:a17:902:cf12:b0:21f:46b:a25 with SMTP id d9443c01a7336-21f17df5701mr115615155ad.16.1738848009353;
        Thu, 06 Feb 2025 05:20:09 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.20.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:20:09 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 2/5] efi: add riscv APEI generic processor error printing support
Date: Thu,  6 Feb 2025 21:19:23 +0800
Message-Id: <20250206131926.91289-3-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
References: <20250206131926.91289-1-qirui.001@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_052010_462039_1E8CC99D 
X-CRM114-Status: UNSURE (   7.32  )
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

From: Rui Qi <qirui.001@bytedance.com>

Add support for riscv Common Platform Error Record (CPER).

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 drivers/firmware/efi/cper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/efi/cper.c b/drivers/firmware/efi/cper.c
index b69e68ef3f02..50f84a0f2801 100644
--- a/drivers/firmware/efi/cper.c
+++ b/drivers/firmware/efi/cper.c
@@ -110,6 +110,7 @@ static const char * const proc_type_strs[] = {
 	"IA32/X64",
 	"IA64",
 	"ARM",
+	"RISCV",
 };
 
 static const char * const proc_isa_strs[] = {
@@ -118,6 +119,9 @@ static const char * const proc_isa_strs[] = {
 	"X64",
 	"ARM A32/T32",
 	"ARM A64",
+	"RISCV32",
+	"RISCV64",
+
 };
 
 const char * const cper_proc_error_type_strs[] = {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
