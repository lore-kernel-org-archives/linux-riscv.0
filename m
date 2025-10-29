Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B370BCCF9E9
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnVsXT36P+qYWeM1zCAP4pdRqgByTOaUNgDgod6K5k8=; b=CLTyG8I25iyRtp
	9PhrjoubVQiXM9qwm7t5RR/jINtFlz01RqRIFXzomqWsBYaUejiT/iYVkie6aoNnmsg5DezCsoGN4
	jzpInLLZvlMYXAVqKgmuiyDQuEtWSq+D3rl6h5yQGdn91nZ+pp9QygvrFDpZjoynPhhZtMUR7rJym
	CaFuebyK3RXIHw8nbbM6mfQfZt++PUY8/HnzFUrussw+lQwaF0W2aP+A+w00DHeZf8qWun1EB+L0h
	AnKD3hn/YWgFZRf0O3FJxosAWyMuy1kXQJ0WEKsHLbLCeg9f+Rtgtc3NjicJ0r0Ph7jfBpeTP6bmL
	sSv1DVTq02phbuWy8Dvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4LJ-00000000yNq-2nrZ;
	Wed, 29 Oct 2025 11:27:53 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4LG-00000000yLd-3BUH
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:51 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32ec291a325so5548872a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737270; x=1762342070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wd49FUCFXP7v439aOYgrBhlMaMpFr/VqGWFeAvQumyw=;
        b=FL10xZbhV9RMImpXfBhBL/9n4slyg0K9g8kWz8waD78wCzp5cg7iHfkPw2DCV94yqS
         TBkkQxH0RkSRSa4L1pF0OXFiNCPWT7f5mFMulW7GTmmtEd5S1fFrOHi+MtpwqbRur6VA
         cmjEEGMXBuVveLZ0s19pq+Cp9AheXCGt1d60YroHuSTlHbz3NnCcSD7z7DPKdsem6rjZ
         KFzkYG5VtAelIjIuPC1Os+oVQ3d+N3J0AK2vjxEf5qtuq3pyjW1xTH8TV3mke0bZrG3y
         ds4Aw2rR6xDn9+XhrVodNzkVfEo/YzVWbioMyxakGTSp0YVnCkDcpvshncLuMmOlXuKL
         B39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737270; x=1762342070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wd49FUCFXP7v439aOYgrBhlMaMpFr/VqGWFeAvQumyw=;
        b=Yqnxx3lMZyKLaRwuRdWmi9IdQTnO4h2tS7G7KKAHJQNfA99hs0gNTkKR1MCSXktcAb
         g0nuwx4f9YlLQgPznKsfnsDH2RudZv1R6rfLu5rRCA+UD91PVJEzwbD01y+WdCYUcaTN
         V+tG6DG7Gm2DMOxxebvbmMfiAIyJUYiboEjm1ZXo9qg9fi13/CzUOZfVIaXj8F/EwP4I
         Jix/GBFW9fddxkI/wGUQ0I919b7YcBo/EPYczSMCrqnYQTriJBCdo4/PzlmuTlxoiBxF
         wFlfnlA/404irchxCGyCwWCShydnt4JeaDIzgXk+4heSgNWhj1fp6ip3dflqs5DNH/sH
         UtNA==
X-Gm-Message-State: AOJu0YzOjhdBxCxiO8ioaSX8S+FG44ls0+pX3UytSMZ3NGAOLGnpTzN3
	fVx7Dh3uNEKZkHQ9hJwk+m7YC703n8rXH+EYcEMrUuGl+5vYVZxUxeSga/sBT4bLHh63429lGNb
	RlvKQQa6uTA==
X-Gm-Gg: ASbGnct51keRrUP1aVrrJLZrUYQXrV3n/8kl3ybKL7wT67qcA+HEWWpAncCL8H+0ztj
	dspR21xoNfesOYLnsW9om8Vee7XENVuNY+7aCjpcad0ITvYw3v5gPmz6et7uVytdQQi5dKJklDn
	tI7ulHOIo2mYdJDn01RHHVQiZr78SU+7W8MTXcp9pKtOYw91DuV66lJWBQjKe/TJ/q+zTqMiH5X
	qmznWTdv2+C6rmB8MvBlndevNlW5Kjox3F71jN8fko5RwO6JUPlNVGDiLY9d0bfsljjAbNAeYSx
	/7iNLgL+eRyb4dpzs8d+toQC7o48b4yMVEdTygBsyBHVGShDCJ04y0g4SOT0zdOqJ9gNhuiRmgW
	/oEHfVz/1wUvfvrmtQK1d1JIP6rD4vGYaNT20clf8MaR77mrbqAHfo1pfQQakoQWmy8DpcwXmEI
	ZD3/SRHQGNw38LyK8J6hrc9P75cj21
X-Google-Smtp-Source: AGHT+IEwpD5L2Hn2Oj9/1NiPPKl78u4FeofUgufEwNswN516sCORZuI1gux4yna6NQqFE96u6vitOQ==
X-Received: by 2002:a17:90b:1f8a:b0:33f:eca0:47c6 with SMTP id 98e67ed59e1d1-3403a2f179cmr2624640a91.30.1761737269909;
        Wed, 29 Oct 2025 04:27:49 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:49 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 09/10] riscv: Select HAVE_ACPI_APEI required for RAS
Date: Wed, 29 Oct 2025 16:56:47 +0530
Message-ID: <20251029112649.3811657-10-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042750_795462_E7812C0A 
X-CRM114-Status: UNSURE (   7.41  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Select the HAVE_ACPI_APEI option so that APEI GHES config options
are visible.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 22cda9c452d2..97aa3726e9f6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -185,6 +185,7 @@ config RISCV
 	select HAVE_MOVE_PUD
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
+	select HAVE_ACPI_APEI if ACPI
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
