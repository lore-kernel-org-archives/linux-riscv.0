Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDB110BA436
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WJyEls/ZGiJZ70wjKkl+Q9kk0PmhNQoIozLvD3eP4yM=; b=m+hIwIvTUhr8IX
	zHQ2RbjSmJSisFlI/sK7WaN+wnS4hYCdpCv8wpHzlzw/LkkbZBVGi1YT3wbJ1cEkkLEP2DsXgFZcq
	TjjlMEDVWmF80iRhDKh3e3icBtgF/fyjMz0MFhYUodYnpcflS4gYkMGBelP572ygSINUilZA5GZOb
	X4YCGF8dUSFGzJwm+7sK1hCWg5GRwKl6SQLNtyjYQ0/S6PjbCTbLg4xsoLMXMsnZK+wh2RFQ1Lu9c
	MumM4oS3FTuJzUr6LGmAFNpiTNwef+oflWJnvqtIlx+mswCDZyw+d17H4mnMnVLdUfbqf+qGBxL4m
	H9nVz4csUOvXqnOWGOLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627q-00000006v6X-0mEZ;
	Fri, 27 Mar 2026 08:01:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627p-00000006v5y-0BHr
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VdbZVRP/Ak929baCc2EeOgVlzDU6Wbl9p0jTnb7CIGk=; b=ULX3uMpgsGSEUKd1dcP3OTGTZ4
	tRVKAPT9OloUKwvyiyUN0qQ0HoCbcoCEX1zFEyKflnvjU2ly/GJknUcfk8yFtOpofp5SwGS0aYKzm
	a1EZrLekU3Bqj+BLDpWyN7hUJUvipPCyGtlKWlgrfWaii1LUOWQSyqW4Q2h3tPTzRsgmtcXpUhKMN
	trKjKOVbOfWXPtosC8woJlsH9UE3U5lYdhlPDAXSu2KKQoaD/F41HdCs6TIF/wufG+8j/ggMxsRUt
	A1Ag1iQcUTItdgjuxkrhsutQ4/Mc10ZnV/4Gk+Am8oNDixU2fVM6ODEaKgAi8W4oxVGrilFW5kEkQ
	jau9xWBQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627l-00000009vId-1xi3
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 08:00:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-487012ce896so10945145e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 01:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598455; x=1775203255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VdbZVRP/Ak929baCc2EeOgVlzDU6Wbl9p0jTnb7CIGk=;
        b=D5kX164KxkHR2uCYZNZeYyhuFzsd3EuL46OHkwfbU2sLyIvfIWi4up82fgXXPBykDI
         lsx5vtMwa61Zfdy7gQsNi4MV0kCV1kMh6HcPLGlHz0Yyvd9Fy8vFHpojN1rbN9jiaFC7
         UHgkB26Urt10I5dwi8WHpYKR4j5OveM3z7rjciYZTxluubWdphmJrcaq7uam8oHZgVhQ
         +wkyA9frJV10NWqjMM3yzvyQpLwRfPsTPBH8u/wHsNoU3uF7111faqkSWG6kDm5hb+SL
         4BV0QKQdtcwDFOiW6GmzH1ebygwM3JyAxBbmQsvFNP0M6JC2y6znLotFfHkNNb3XImUm
         jTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598455; x=1775203255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdbZVRP/Ak929baCc2EeOgVlzDU6Wbl9p0jTnb7CIGk=;
        b=Fm9oZ9qPiSo2ib3M+f8lv/Xnm02o91nQ3mOwySf5sKpBCw8ObwwpL2KEHtTKakoON0
         erDQODbKc9QgotW5r/fQHLZ3LFKc9XtW6cCkTMLpKZ+l7ORR1i0qrU3q5xdDEY5Xdn3z
         4+kOBE6GqL0SdCBBpenP42uoto5/Y7gyS0B5TJ+Xjxzp2sfrhYpDSQFOo/09HjsjyoML
         9CrS9qjA4tRpgPpIkDMrWnmkjs9Navay2X3e3j4b4jzRe5geP3FqopT8nUxVEWC4WMxG
         UcB5wsF0sOaHNPKoq/L/0SZeY9LGXqQdZo0aL95JrxF7OLBL+KFKRjqdNnP60CUMW/3W
         USNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIOYeuOlgiahWF5TijzQYndjMge1hP1ung81pGfPt4g0H9/eT3/qqKo4A3Xd8OOcc94culCp/w4aldQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Utqp1GgZet4wzTQB2CV6i2mDtnMGTAuW4vtSlfm8YYlVjKre
	I359tFm4h5bXflKXtTLan2NFasnwZpXf9eO5EDI11PDbqSXnxSQLlrYr9/f/ohnIt58=
X-Gm-Gg: ATEYQzzpApsrh5MeM4J7dZeasp5+UU8jYIILqnlC4i2r+aZjlZfbFwXCVh6OoYF9BRU
	b22h327cPNFZIN5V+K5VZ2Cf9c0QgHhcKjwSRvDk143QmEqLou8xfqGBojQeIDqEFEZY/DYTt3I
	GpVl9OwKHWCEFhN9BPpDTU9/UQ/Wlw3XqswNeWcwt3ugWNe5phJ2fw1uT+kKjBiT75ZP98KtSAQ
	K0IGDYcAz1ukgDXixEhrUELiYbOqfSawDEn/xkebL43jc3jadB93Jg0AX3wqYjqXy/rOTfpmC/G
	ewOfHkZhXD2nbFSB3x2ubRJNIdKkMwbPUDXv1SHsQupb+q7PwY7mtCXJbS/emUfM18NuaBw2N1L
	w7RQ7FGNK0deNkvJ1WW8Ko09DmXAOM2Pr46M+QrYvB8+d46J2QYUfhiwxIvd8KSw0p2P6CIMKbR
	b8jnFA/exvtcHWpOSCUiXVbm49+GvJqFmr7MBcsw6474Yvp8IBKRw=
X-Received: by 2002:a05:600c:8b6e:b0:487:716:2fa9 with SMTP id 5b1f17b1804b1-48727e883c4mr23399585e9.13.1774598455233;
        Fri, 27 Mar 2026 01:00:55 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:54 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-riscv@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] module: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:58:59 +0100
Message-ID: <20260327080023.861105-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_080057_764978_860C7F66 
X-CRM114-Status: UNSURE (   9.39  )
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

When linking modules with 'ld.bfd -r', sections defined without an address
inherit the location counter, resulting in non-zero sh_addr values in the
resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
all sections. Non-zero addresses are confusing in this context, typically
worse compressible, and may cause tools to misbehave [1].

Joe Lawrence previously addressed the same issue in the main
scripts/module.lds.S file [2] and we discussed that the same fix should be
also applied to architecture-specific module sections. This series
implements these changes.

The series can later be merged through the modules tree, or individual
patches can be applied through the architecture-specific trees.

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=33958
[2] https://lore.kernel.org/linux-modules/20260305015237.299727-1-joe.lawrence@redhat.com/

Petr Pavlu (4):
  module, arm: force sh_addr=0 for arch-specific sections
  module, arm64: force sh_addr=0 for arch-specific sections
  module, m68k: force sh_addr=0 for arch-specific sections
  module, riscv: force sh_addr=0 for arch-specific sections

 arch/arm/include/asm/module.lds.h   | 4 ++--
 arch/arm64/include/asm/module.lds.h | 4 ++--
 arch/m68k/include/asm/module.lds.h  | 2 +-
 arch/riscv/include/asm/module.lds.h | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
