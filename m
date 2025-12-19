Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE8CD74961
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XL8BrCPX7SVeFu4hvgbUy1f2PLErVC3JMCwccpsk/VM=; b=aMigO2oUDUJq67
	ntnMYpIXZlWW2KjrLPR+3OJYVxGY/RDlGqoeuCRtil7BPLh7zCOl+7by4CFteWIB5gX9/ErjMrRzl
	Mvj13titIU2TCMYyY7CSlP8enLqt/pK/ivkDSdfwcLQeXmHprbwLpyG8Da0C2NZNuVlZyAFhT/22C
	iLQ2nfy6B5rdwrZkJbLQ8pM00qubabYR9yJdJXRU67jqzdh8eh6vtFdeliWp+u4bBKziLeDPQUrS8
	0WIJNmZoYrKBLe7QRjUSg6HCk+PHgYsio0RmS2B0NWsPadUkkKFFyxgrafOhdOqTdu2R/VqR7SN1e
	gXO8T+RwCkbVJ5alJL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV8G-00000009lkt-1cBq;
	Fri, 19 Dec 2025 07:42:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV8D-00000009lkU-3C0e
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 07:42:35 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so1177506b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 23:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130152; x=1766734952; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGrTuvEwjjViNUMt3QJcRhb16ogXp7GtzCI+L0Kabag=;
        b=HyNEtIKPIwsYSQa6oFHzWXm7s7S8x1b8n8UO18wOAxSur3C1IWrLqECkyAPR5fQtXE
         WRvWSmn5yrnOSfmIeUQrgwppvUIXJPATW3ZV2eAjvG9MZDFnchCYur8ftV0TrSRFuO3o
         HTitq4YGENA7zidIXpLIJOYmyD9TGdvY/3BZhegUmwHzQz4e7NBF6dmM9xVfU+5lnS1C
         LUvcW/hP4MCCVvezcFvYze1f0BUnvzIerBsDE4fGSnGp59evCZftkmC+P02So+dvAT4+
         Ll44wG2VK40bH8IrNJSzf8oQS+kp5g7bJJFTiN3VXacs9IJsY9lIJGMOEfAHTKNcFUiI
         bmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130152; x=1766734952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGrTuvEwjjViNUMt3QJcRhb16ogXp7GtzCI+L0Kabag=;
        b=nTqFHfPWt0FMWSu5IWNHGNGAOKscPzRRap704l5seVmCv5kzPjdldv0lPliuUzD7aZ
         d7wlTtjutUlv+Q6q8M0aPCzC5oBsGtOq8oEDIsZG1sLzkv2SKVLD5nCs4RHFdQfsvaPG
         1PSz2M6yQZ/Nx98wzPYVPIl0Po2gb/IPjlpLirnLUdte81eFhAb2tUz46LOwR4GkB/fm
         u5wWdUwrNQEe/STiiyDhTU3FXy4ZvYmnM6iQ18rCc6tuygxfpon46uYAu3SDqnrhdngf
         qw1aUWSDwy8lOFIjtg8du3c1DE1lIXLxxSPWMRZBScGpXwyIkr7HKIFezfTzkB07XilO
         lBTg==
X-Forwarded-Encrypted: i=1; AJvYcCWeuiF/MBWjDOzOEY5odOiWRkYqJZnt0hbeJlqNEjcYBdMlrWGx3DTqM/JGceEDFv7JRKtA0CPc/3oTkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUKMIhqYkSQaupx3B/gUgJBjRebGMJxUL2/fpD95nw1y/GNHn3
	qZxDbBXYwYRB9XedXzx3zIVjkAzbgx6Knr+1PNbmtNtNQH2EAvgoq0oA
X-Gm-Gg: AY/fxX4xdSF9ZsWe/bRb9fFPpRfEebI+OyjO7lQJuxU64UfnLwaErr+mbT+p6XQQqqE
	AWabwRPAUIfzizqKt4inLxhhQJ9RdsqIROPJYiryPdlhjFlXPs+0fwQR4Ihb+VZLNPf8tDnaoI/
	pqzvfqVxjm+fdr3CNyPd9vpDtS8WhJ5raz2pGPv/ym7Xn7RL3rbEJnfG2C+zb7Q0hk3bXN037HH
	GF9fwgoPCoMYdz10v7vJF/bRhjuqUZxAaM31DTI7T787SOlBoh2EpLOj+Z3mhObWig2syZZEXCg
	kTASEdti8gK+TysReE95l/XFj84snz5Wsn9JvPzFSpIg8W4BeJE2ypFrnav26FJOAmeX2w1/HXc
	cIQkOEvCM42fbEgIxHlavkmfJpppaPv7Ijn1ZcQEBDAugynG3Mxnz
X-Google-Smtp-Source: AGHT+IHvlxajrZyvgu5NAl/VwkuEOt/upecy4ZBkpxVWB19Jg5A5qRKqAiwdH54bqOmcRQaHwjRFZg==
X-Received: by 2002:a05:6a00:2995:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7ff664798e5mr1631925b3a.50.1766130152282;
        Thu, 18 Dec 2025 23:42:32 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm1489676b3a.50.2025.12.18.23.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:31 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Subject: [PATCH v2 0/3] i2c: spacemit: add reset support
Date: Fri, 19 Dec 2025 15:42:19 +0800
Message-Id: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANsBRWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDI0ML3UyjZN2i1OLUEt1E86RUQ2NLI0PjlFQloPqCotS0zAqwWdGxtbU
 Ao4A1YFsAAAA=
X-Change-ID: 20251218-i2c-reset-a7be139213de
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=1131;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=qNd7Kkg/H2zhSsCmeKqv5XE2BPxplo29/JW30z7IwFc=;
 b=IP9PYiLnxh4jarsPPV3BBgqvdAZV84EWSlqmOsx0gleAv9VAbPkrnmv1JaYOb/jF/whJbat21
 mM7tks7h+8dDHF63uWqww3whwCH//d9Myr1eKBAj41dpiIhog/DiS+4
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_234233_829551_AA57396C 
X-CRM114-Status: UNSURE (   7.49  )
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

Add reset support for the K1 I2C driver. A reset ensures that the
controller starts in a clean and known state.

Reset ensures that the I2C hardware is in a clean state. We cannot assume
that no program used I2C before the kernel booted.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Changes in v2:
- Replace reset property in dt-bindings.
- Use devm_reset_control_get_optional_exclusive_deasserted() instead.
- Rebase to v6.19-rc1.
- Link to v1: https://lore.kernel.org/r/20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com

---
Encrow Thorne (3):
      dt-bindings: i2c: spacemit: add optional resets
      i2c: k1: add reset support
      riscv: dts: spacemit: add reset property

 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi                       | 8 ++++++++
 drivers/i2c/busses/i2c-k1.c                                | 7 +++++++
 3 files changed, 18 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251218-i2c-reset-a7be139213de

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
