Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EEAD6CFB7
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 04:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hG0o3miXIOawESoeMUNy19JhgxJFlJfXE+lci9On7qY=; b=jp1k385wC4wO6U
	hC7UkfNHaLo7CeOpJGNa/qnWG/NFKEHft32oUeOVAQJSEIXA7h+NgL2SCeao29S7sAwA8wMXS1fq8
	jR14ZErM0Oq5bY06K9pUmB5cBehQ4Fjdck1WGQy3CmvDwigFP22y7w9gnWWCaTHrIi/qnY8oG4bpJ
	gD1B/AGe/AbWAVBognbu2BeGciiPzn14sLcs6KYpCwhMoKnfLWXnxWw+Db7XVFWOuCLYBU/CGJcfP
	zuAHAvsu/Tz5SbzEonEzvaW/IDn7JnerGo07vBWlBdoELDu7nI8O1FGhv92uyzIyD7LVORvhM6I7F
	HzvB7TczYqW0wxXFagig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjVHL-00000009z7j-0h5H;
	Sat, 24 Jan 2026 04:29:43 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjVHG-00000009z6y-2BJu
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 04:29:42 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c634c20be90so890244a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 20:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769228977; x=1769833777; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzuiHQbYslZI5xHIBCbYXnuCh07OaFGFeD1UZM8yZnk=;
        b=HqvKCH18dLQaXY+cAz/qjCycAb28suNBxaYxAIf11w0bm/myWWOqfWG+FnoUzn7lHt
         imVtK3N+ZF8GqswJdonkeGQxyV8mpnzoLNj+lFOsS6Kqo6LSrFWaqz8vBfwFj9jkpqRV
         og7z43szEHncNZdEJ6fyLQ+z4tfT3O+idN1tx7H4GIoUvgirEAfDNq7u+N8LzdXgXHNP
         c2JC/8vqp1eauHIQZr3yDWEuusz7uV1NRVCwCY8d79LT5QpMjXsvSyWwgFj4bJt4qHIK
         kKXMAlFxAyrnqeAKWQduMy7aCZ5jmLHQavWQFGvDb4eBFMaUxQ9qCAhyHyFwTwotRb9O
         TbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769228977; x=1769833777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jzuiHQbYslZI5xHIBCbYXnuCh07OaFGFeD1UZM8yZnk=;
        b=Kb1tRfBGga/XhBVX7g6tUs2h9CoJNTyVaASh8iIEfpCI8xPDabcbFEtL7RzGYuQO05
         A5P/WJcqIOQfDreuqAjLNriH/zK0nzmT+kRdeGj67BjEoCZUJanC9tmk/nzEKSbbT7Qh
         zs+dEl2L1nsPbaAuUA5TpQAZutj6jkffk9GIiVta4QpQl1XCSDlJ9xr5x7vO0r+L6Hqi
         tGSjDpU94CO9YwlZw9lJKw/BBJ0tS+k3NkUaEOBQn53n+AAgp2tK2L+0W+hsyhqx9mOW
         5NT6N2pPdiDtb1EIC2SzcxqmQg1DWZ1lY5fK5yCLh9nKhtSXiWLNjy49Hh2MRhSFBrGW
         iImQ==
X-Forwarded-Encrypted: i=1; AJvYcCW575Y2ucQvDjK3kN4o9fLqM7V+4GPfY4xXXBNqH6WwyjsXJ0tr8u1MRJwg5lrWhu2e13kbzojAUkh67Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHfOIE/tPIA8BpxNDoc0DIfsXxTl1bWrHYtrkvs3e+A8m7GWi6
	3enppGSxaww9hA097ZgZgrt3L4VzwZhvtvAB04ChSSDl/HWwmMAjcaxYrZncwtitOBE=
X-Gm-Gg: AZuq6aL8noCteSAv6xkHZ8XHzhjOK0TUPVtGXXmLEwQTJ42Jwus6W6dqSWI/xeY1gFT
	9t1hLftpor0MWlRZXgkSbFIt8IRvXweOAyYSIfof+4+rSy65sQBw9o0oDtVS7ZLqnkfTrjJX2sa
	6evmnR1q2jTHjXX5iVBCsag7+g6tCM32jy7gyVi05f4ad1/2D6UPNTmWWFDpoBsQLixCE/BPuBI
	M+4kdlYkvW90OPaViAkca7aJReWFVerY8CrJ4c5gek9K+v6wA63Et2OULZpc5KVGB6U/pl0hikQ
	E36E4fSmw/5JMWXj7wnGIfIDKbq9aoCyiOh4L+zYf9qcpf9Tr5tDZAB8aaeLUTIBz4xKr/JeBfd
	l9z5FzN2/FjmbS4FGxawocHggupFBkzRuyyi/N7g8gCLcsuu8pklDxq82cSnvyyISPLO+lvy7cG
	EGlNqpdtgklV3E3FNDfL89uJgBJ9+3E8Q=
X-Received: by 2002:a17:902:f68c:b0:2a7:99c9:1086 with SMTP id d9443c01a7336-2a7fe74572bmr45740975ad.47.1769228977300;
        Fri, 23 Jan 2026 20:29:37 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d51esm3469423b3a.38.2026.01.23.20.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 20:29:36 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 24 Jan 2026 08:20:16 +0800
Subject: [PATCH v2 1/4] regulator: spacemit-p1: Fix n_voltages for BUCK and
 LDO regulators
MIME-Version: 1.0
Message-Id: <20260124-spacemit-p1-v2-1-2c86b06694ba@riscstar.com>
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_202940_948357_7BCD77E3 
X-CRM114-Status: GOOD (  10.51  )
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

Higher voltage settings were unusable due to incorrect n_voltages values
causing registration failures. For example, setting aldo4 to 3.3V failed
with -EINVAL because the required selector (123) exceeded the allowed
range (n_voltages=117).

Fix by aligning n_voltages with the hardware register widths per the P1
datasheet [1]:
- BUCK: 255 (was 254), allows selectors 0-254, selector 255 is reserved
- LDO: 128 (was 117), allows selectors 0-127, selectors 0-10 are for
  suspend mode, valid operational range is 11-127

This enables the full voltage range supported by the hardware.

Fixes: 8b84d712ad84 ("regulator: spacemit: support SpacemiT P1 regulators")
Link: https://developer.spacemit.com/documentation [1]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change.
---
 drivers/regulator/spacemit-p1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index 2bf9137e12b1..2b585ba01a93 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,13 +87,13 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 254, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
 
 #define P1_DLDO_DESC(_n) \
-	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
+	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
 
 static const struct regulator_desc p1_regulator_desc[] = {
 	P1_BUCK_DESC(1),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
