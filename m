Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D81C10F1A
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1EZhVhgMp8gI+3//QPgqkniS4aHKp+/bMPHteKu3Wnk=; b=NzQ6Mgfe8YtXFf
	weoTkTf39tqdfeKBKARkk3HUkgk4Ul+l4t7qU5Fvo+GOwIvx0+hjPWtNoEWG0CeYeYttqrdR+jdda
	/4SvzI+YzyeCF7afKN9V4nJQr4fAQLvut1IfxlcTUijLbOue37RrYv0p8f+EFHoVvJOx5zDcXcFRK
	7w49g24KgKAsXUUEiwgGgP81PEmApcoAU6OU67OfCbikZK7AVhf9U7lUfL3vlMubuQHDNSr1cRImw
	kZoEnI/97Dluf+tpCtqbfJKK9+Nr9wgEFgsV+aQUJNQZH5e3av6Ohhz/Vbfv5stTxh73ILSWGXNrD
	2pAJpT7ydFtjj1dAMXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3L9u-00000002jJ0-1cwy;
	Sat, 04 May 2024 19:34:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3L9p-00000002jHl-3RMD
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 19:34:56 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B26C63F2B9
	for <linux-riscv@lists.infradead.org>; Sat,  4 May 2024 19:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714851289;
	bh=fCdw8igKrdSP0dtv5mprL77xFjRhGIFmRTlH+eUmhU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GzPEcII2Q3U03nHYpqi8bmvjr45151lY5BWQWGKfOnrBcuUwwgHR8cMgTQZtjUOBw
	 wcaBASXy42b2MF76H+hpW8ruq3M1uba9WeC3DoyH2N/4sYo+t0h9i1PEEGFG4EeIA2
	 hZZv2S1sqES3MaXCv6vwVtxxkc6HbO9yZ2JTDTLpUgtgxXuY6mKdLZBy1fDGxRbDxL
	 WvGKxlRSch4vgi6EZBFegFwCKEMhYphxDH5ksB/bltrsuAiDqV7vbgGi+XQn5RxsMe
	 bkvQBQBRy+iSpwR/tAsuXgEt7n8qm4Weo06MGqlPvR2wOXRfDYGxbKMx8mqCSl4jdj
	 fXNoGNeK/eLQA==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56c1ac93679so546175a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 04 May 2024 12:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714851289; x=1715456089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCdw8igKrdSP0dtv5mprL77xFjRhGIFmRTlH+eUmhU4=;
        b=xGy6UpEwstfMYud+ltYvFijaq6ViX/wrEU8RTOV6xKrwk/PF7u4q4XR25USBN/R1V5
         SCR9Q1zUgqpAly0FYFWFfQP6rWrlVobw8941ob/UlkjZqSYfFRN/lrlIIIX1vFQVfJxT
         kzDA0i8rDo7sU6riubhvyAnH/fXRSYIrOg22xRfR/WQJVlA9ZsCzl8ZEvdB+ZQDipp7F
         Or5gIZ6BG3y4uI+yWJLY0/adRY9LEScrrZEUTBNqFaN9iQB6tiIhqlPBcLb1n+D7/ob8
         7QdaxcZGuEs1R36bHrD6tDIBLJDb83TCO4QWG9M0FvUiUuIvFHL3UhHauVbwspwohEND
         1hYA==
X-Gm-Message-State: AOJu0YycW6jMIUvpDOBgkaP3JYswQjJLb4rFip/IdQEOVGscNElr62+K
	/yqxWGenNPTObYbI3iiOeQL3ix+1DtiPPlT+MVlHc4Mzlf7BJv21bfURZXgoudle0+gW/KB6XkL
	Ji5a5udACJ97Iyauv6rPSPDObXU3SYy7Au9NDR0ciGMdt6FGIHpi3A6zsNtVHaiPO387BwMMQZ0
	jn6qb6jq2JkOXAOA==
X-Received: by 2002:a50:9f27:0:b0:570:1ea8:c50a with SMTP id b36-20020a509f27000000b005701ea8c50amr3930435edf.6.1714851289228;
        Sat, 04 May 2024 12:34:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfrOVNzJsIs3kHfWe2V+kJZE0Bxb3FyGDeAx2q21GBg8JQx9QrNbPMwAvnDHQI0wDmkJ7nZg==
X-Received: by 2002:a50:9f27:0:b0:570:1ea8:c50a with SMTP id b36-20020a509f27000000b005701ea8c50amr3930425edf.6.1714851288778;
        Sat, 04 May 2024 12:34:48 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm2227021edb.10.2024.05.04.12.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 12:34:47 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>
Subject: [PATCH v2 0/2] riscv: make image compression configurable
Date: Sat,  4 May 2024 21:34:37 +0200
Message-ID: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_123454_380212_45B33961 
X-CRM114-Status: GOOD (  10.66  )
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

Masahiro's patch[1] made me wonder why we're not just using KBUILD_IMAGE
to determine which (possibly compressed) kernel image to use in 'make
tar-pkg' like other architectures do. It turns out we're always setting
KBUILD_IMAGE to the uncompressed Image file and then compressing it into
the Image.gz file afterwards.

This series fixes that so the compression method is configurable and
KBUILD_IMAGE is set to the chosen (possibly uncompressed) kernel image
which is then used by targets like 'make install' and 'make bindeb-pkg' and
'make tar-pkg'.

Changes in v2:
- Rebase on riscv/for-next
- Use boot-image-$(CONFIG_..) := assignments rather than ifeq train in
  patch 1
- Drop patch 3 already applied to kbuild/for-next

Emil Renner Berthing (2):
  riscv: make image compression configurable
  riscv: show help string for riscv-specific targets

 arch/riscv/Kconfig         |  7 +++++
 arch/riscv/Makefile        | 55 ++++++++++++++++++++++++--------------
 arch/riscv/boot/install.sh |  9 ++++---
 3 files changed, 48 insertions(+), 23 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
