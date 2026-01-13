Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB324D29DE0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pG+Ydiiy0WkE0DdbccSY/GaW7kYsR/6UUnF/Ut9P4Z0=; b=o/ppa8QyHu4NJe
	r0qUof4Kk+JVHWL98SEoQaoEa6i2u12mFcekSm5zrEVCLxRE+COvGm/ReEw7MJSubU7dBwQKhjTxG
	RZvTCtUmIUku1tgYmsG+Q5UsTrYzkftxsQowv8rccA1cCfxaey/+LshuQ8tYg2ZGjG9/zgxz7fLJM
	b7Sc1eXWZvR31ubzGVPztCprkofYJe9BvMGK0MMx+ZnldfMxq5lYqfF1m2plzDKuLOsbalQJ9ylby
	p+C3MJWThvPX31BaM2Z94W0Sy/oBL6zZcPFCoAZ1bc4Hd+SDqVzzLsXReBSGLLbCy5eiNP1Pnqsic
	APwzhMpYwUu/jYVZi8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZ6n-00000006fzz-1WBQ;
	Tue, 13 Jan 2026 07:46:33 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZ6a-00000006fxv-0k9t
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 07:46:27 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a12ed4d205so46230545ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 23:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768290379; x=1768895179; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNeknCfa8wEEbV/WEcBxY/dqGiWsyOavd00Bwdi/7Iw=;
        b=JrNg/f1JuRVer3nxnuA/CEgwup7UCJVuQytSK75W/0trersu/l2auotHSKMazDva+k
         +8zhXFjvy2S2yMrWafCWlvw7OBECz57ex5adA2tLJB6/HQU/AVFlIBjnCexdV/g6khC3
         6G94ZWJINMFG/r9awV5VVoXbylAZCguy8wy66W3/Q9EUWBO2Fy9RasazHMgrZsVQNngn
         eOuZuKhnNGggDlo/KU7gYDQhnb01PqD68zqzr5p9cOGTJCw2UzR3vobvtQ8iScFrTKtn
         2AqrJ59Ck9v64CqwJCrJl5AGVcDM7E9GFNwvKQpFLHm3zyEvY5CCjBzQKYVXbecuKwqN
         +hVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290379; x=1768895179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fNeknCfa8wEEbV/WEcBxY/dqGiWsyOavd00Bwdi/7Iw=;
        b=KyxDFD5VKUFDCQGb9pE32bO+p2FZLv9loTWDS1J5yB7jY1s96XSAgbHXIzEk7JmudP
         niMgjBKJ80fUdMMQ6hEIF6pIngmiwXMVGn8SSSxNkW70SFACzBK0oXirtOE7y6pV3LcV
         ow/SzxA2LBXT45GeUmcrueS7xzNCQ69qKLV/g6pwtq6LlpdfK/vyySYVnBK+SLGxjiSO
         3Yt4qtmrzj9y6tuzCQT7efQGK+V5jMbzqnIlNiDxL2/gb0B61llWXHGbzhBFo18EgK+C
         FAlDw6cfP4PTGcGcoDyboOGgpsyqh8bLhFPOZ2dWUpeOgbOsPsJEbNK8W2GnmvazTHLv
         ut3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhy0mxuS07zR4Ag6+nAlnJi0xpCDZXjWlWEyZp54IqAOWM0eNTOdz9mCmBWjQP4NnzaK8+8dGchykvPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3BcT/zomnPKJcU8uvuEOOXJliUPmofytbhNmGnYf+Sq+n1041
	I9StF9VlzKbMSPyFC7gL/GcS/itPKMf5feKtmnAB0asHtiyuS+w4dHBBh5o7WMqDBbw=
X-Gm-Gg: AY/fxX6UOHt8ODldDuO6WXxYQK1xHP1c1XKnK4XXI7lS38G3aqmB8BLyJAK4kjpvMxE
	3mgvsKdIDHkveNGCyKAGgaN6ePmyyz5F/2z/DU4GNbQcb2XL896K/omScdQSbUzcfipwOYsspTY
	eB0/0Ixoc7fDMR9IQU9E2EZW1k9/3u1GsEBz/z60HT1XEVtzSribjJJpOR7zeuntWGHeaxDHwwB
	cPKKFYz/Iw4qEYBZWslT00AOOYmd9nhGZ3j0awdCsNMHl/aAdq4I+5lhylhpX63J31/QIyZto8x
	BMbrFBG7yCEVI06Z2t1ZmlLvUxZZq/wqBV1TpUq/c9F1V7o5YYa2PJVaoEh4ByGq66sdnnOGEmP
	7/uYF10ZB23fnaSAt8W6h+FiQ7FDi/RoK5wbSTUvR1dF1hOHbzXBK0xExqKVpVWicpXvGJfqSaO
	V8rFQvneYxU+yv9ZCnc+z+XLV7CGtowstrbumf5vu7u6FjtQCRUwGqWAco9D8U1lQn
X-Google-Smtp-Source: AGHT+IGrssuTQycrsW+2hCknhmQdMnpg0esEoKPvLFi/81f/ttHiYeTe2gILmVWkDFy41Vy2Qxe06w==
X-Received: by 2002:a17:902:f547:b0:295:8a21:155a with SMTP id d9443c01a7336-2a3ee48ff6cmr185468915ad.35.1768290378939;
        Mon, 12 Jan 2026 23:46:18 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm190956165ad.102.2026.01.12.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:46:18 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 13 Jan 2026 15:45:53 +0800
Subject: [PATCH 1/2] Documentation: riscv: uabi: Clarify ISA spec version
 for canonical order
MIME-Version: 1.0
Message-Id: <20260113-adding-b-dtsi-v1-1-22d6e55d19df@riscstar.com>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
In-Reply-To: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_234621_502208_D4DF2FD0 
X-CRM114-Status: GOOD (  10.78  )
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

Link: https://riscv.org/specifications/ratified/ [1]
Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/arch/riscv/uabi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/uabi.rst b/Documentation/arch/riscv/uabi.rst
index 243e40062e34ed5057e3e79ad61311f94b7dd404..0c5299e007622a123d64cfd36ac1491b22d4255b 100644
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
