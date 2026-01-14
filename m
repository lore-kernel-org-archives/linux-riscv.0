Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A569D3CC84
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 23:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRly1NObchwgt0eTujZVH3nalmKEG7ofVtoD5EzUUZY=; b=xUMSv1NRsRwQe1
	4PDuSafws7D9l68fDXdj6uojZ9eNWRFtN9RIh7uHLwjcT0wiyJhvhwLdBLSVu/zPQWevxLdhCU4gQ
	TDktiP3qMqQCg3iXfjY6rrVOVd+08PqKduF6QvOok2BeVoy1LXIsXJY8ihFZRhV+aLwzSqGP79JsC
	jiWihhtpnSExe/iRyRB6WWpMRmntrqchut3UH5hJece9gtgWwaGtcxV020fwEvNChMoxSr53s1D41
	bSvioZDzMOS5wcgCXi6yVqrabY4twwwTzbg6IF9GBghQ/b83q4Z7qUxGVPeka+uv73Ii/YzceK2F1
	KUdb5A5A6mq95eschUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgA94-0000000B48i-46Rx;
	Wed, 14 Jan 2026 23:19:22 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgA8z-0000000B468-1Qcv
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 23:19:21 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2a07fac8aa1so2668315ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 15:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432756; x=1769037556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nbmp2d0HgOyIl8jX1BIaQZ3qrfCn/EZHa3mK+NXd3sU=;
        b=xzTyM5c8VYo5ate3graLSfjBBJJerI3O68Lx+ROueIqzRCzPL2J9Jv+2mgaSqLWndg
         OVjkvXHItKixwi3PDfqnNDvRPIiU/qvDSkjLCpkv8p4GMIga4vXT1IFEXbAEx30PnU40
         xiXJmGhJI3y+3BLmhe0vpu413cfLoOrz22LPUKN/eMxK/jrCxm9EsarhWZeXp8xgV3Gl
         7NIuNfFghSHmmuK3dGtnNKhFS9INWhC0zZeJsD3hTKTDzaW0TaUGRzbqdCWy7dHQUbHb
         mn8pa2DAqnVrTEWpbLAjz/VjF4Zz6F24uOPC1UbFT2m97RkdPrpwt88nL7i5dhADL/9N
         YYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432756; x=1769037556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nbmp2d0HgOyIl8jX1BIaQZ3qrfCn/EZHa3mK+NXd3sU=;
        b=guZGcd6lSenn+UDYY142vspxuDwWmdshJ/G1jBZhkUKWIKWZM4C5k993n5IbVInp8Z
         iprB318Adz/+gxwwa+5PapXlQR40l+CmFB1hDeeKXFa3Ewg1+O/MuCRWZoe+jJ1rKaWy
         71STECX2p6gRpCc0pyz9uh0RSrgfgWB0/T4MQuipsGaWyQsnGt+CxY9cKep1jpDDOpmX
         BkNpJF8piNtNe6ZoxnAxZ2AN8YCAPl41iFDX2CYXpaDjdFGRVG3+0lRxgeRAuxvpEMMw
         cDkGT8OKQXpUNu46RNbEbSXQh+ndotoef0bVPudRzh8fgbm/32fgJJBSn4odiZdP4IbU
         2I1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvoQj7J4W6rzE0KTXOnizoCB+PqhultgwoPLRzWG0HoJD/1Nvz1SRjJF3nAG1y/lE6nS/4cfG/proI9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHDofIBNvQZPcwFmF78bFSqDRNWOfJtdv6CZpRtibrLfkCamYJ
	utpKBLo4dmX6cp3a0Sr8IPislqKI5cK18mA+/u0fyKkOcHgauynV1vttct1D7FpNdxs=
X-Gm-Gg: AY/fxX4bId5fPdrxvrX/HlgbWR5LYS9L61IyVXf2vUc6XTkEWRizdOUlpU5HMUZC5fc
	c8+VOuwG76f1OqIdC9nWc1DCEyiAtzKgwzsh49ZF5NcaH+1KoB52pytARbPRQdlPvoFdZb3yPh1
	xo8XSVOiRgX1yzYdudRzk+Qs0UJ5R/IQ+P2YIdDBmIcy31HUUSWDDDFxn39BXR+Zp2btlxL07eo
	zUXNFhgKa82fN5Sw7cLlD5gksjK4FGr+YnP+l5LeWoNepTjq0WcVJup0HkLMEgM3QmP2ePC5Uvq
	bP9DgX8y4cLBCyVg88er/4PjxKbMcDg4t2lePpAz21mPN2r3ZbgzgfS/BX0Leg3Zux9FW9XfGrb
	Lq1Mm7g2ND4Eb+c+05oqgeYiPvL+DbseinZqdxzueHrbzm6Z+VtQx8Tq4rnR+fhc0+ETpzQoE5P
	iaTMBp5SyNA6HADDwoWauHkbRF3nSlVvxSzcWDbg4v8k96w4ZmxVtDBEPrf4qXMgLI
X-Received: by 2002:a17:903:3bad:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a599e8edb4mr40339635ad.41.1768432756448;
        Wed, 14 Jan 2026 15:19:16 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:16 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 07:18:57 +0800
Subject: [PATCH v2 1/4] Documentation: riscv: uabi: Clarify ISA spec
 version for canonical order
MIME-Version: 1.0
Message-Id: <20260115-adding-b-dtsi-v2-1-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_151919_856276_E697D5AA 
X-CRM114-Status: GOOD (  10.62  )
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

Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
Unprivileged Architecture. The chapter numbering differs across
specification versions - for example, in version 20250508, the ISA
Extension Naming Conventions is chapter 36, not chapter 27.

Historical versions of the RISC-V specification can be found via Link [1].

Acked-by: Paul Walmsley <pjw@kernel.org>
Link: https://riscv.org/specifications/ratified/ [1]
Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Acked-by from Paul.
---
 Documentation/arch/riscv/uabi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/uabi.rst b/Documentation/arch/riscv/uabi.rst
index 243e40062e34..0c5299e00762 100644
--- a/Documentation/arch/riscv/uabi.rst
+++ b/Documentation/arch/riscv/uabi.rst
@@ -7,7 +7,9 @@ ISA string ordering in /proc/cpuinfo
 ------------------------------------
 
 The canonical order of ISA extension names in the ISA string is defined in
-chapter 27 of the unprivileged specification.
+Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
+(Document Version 20191213).
+
 The specification uses vague wording, such as should, when it comes to ordering,
 so for our purposes the following rules apply:
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
