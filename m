Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3928EC04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 02:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WrLqvCUqmczvTmieJex8srGOahu6wsH1PbCEG8DUSAQ=; b=eQhhlCcIbu6EZp
	WtSftGTLealtjUjEbTxJZ2d5JUbpT04qFH1q5Wul6+p7gt0vVQrRYe8qsFJfHJQXH2XAfcwaWeLsZ
	fl9m5T9oP2oNGgr8s3++SAS+KbLdTzifbOsd5GU41ohDmRrJeaY9YxsVKaXbbzuu82oQIf+uAJfAr
	E2zAdp2gja87dFJklfhm3lxbVIBjCCfsZVQ0chA+nI3pK7wE9Dq0Q5zpoyAd4Ue4zbqlGEikd22ah
	0cJrOhmaB9GPXBUfHEfPWCmT/JjOeYwwN4nevAeeFhFyzkKzaaBFau2+B3VYPtccXi0AHH+UxieyD
	15Zrg4pOb8WoBvVWra/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tJt-000000003KH-0anX;
	Thu, 09 May 2024 02:15:41 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tJq-000000003HU-0bpc
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 02:15:39 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-628a551d10cso309262a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 19:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715220933; x=1715825733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fxIkAne6MLj2unx85v1dfJVqW67G69sWljeMKDpPwc=;
        b=TpEMP06+fS+QEkTd0AMx4nynaaoeskZjV55W4NfcNSNglp7bCsLMaV2WUB9RKh+2J7
         FlOyHCb8GjE+7P+/MDvgOYvFbFXqF3oyL4oLveIGKJ5GET3+IWKUwIszFjpdvXsyW5UR
         zwNs0W2X3i6SZ9rnnoqz9oozqXoqHLWYrf0Iq0N7i8O0ueK0nYBOtKF1rTcZ6SOYKThH
         GiM0syajO2Sdok+QtsBkGIY/8U8pmG5mv6BsAm8BFq+mxJ7yEQ+SsvvIl9Te0Yf8mHl4
         h7/XGpxiKlHCN4DF8Hqi0VoYoUdRC7jUvZY/K6oXcHC3xoK2Uq3Q+ZC72rChaoOxzieM
         xbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715220933; x=1715825733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fxIkAne6MLj2unx85v1dfJVqW67G69sWljeMKDpPwc=;
        b=wfT708nlUcGF6EG698x1Q0BqboaSXmn7d2PiTQYOiz/LmtCJlFj9P/y5Kps81WPwxK
         BXdJSGDMN5A/xftBak/u9IysDsebTYC9ytVJO94ghGxWDhBx5Sz1Z6oTAxegXWIW0EfP
         OGVLXOaA71jKX11cgfLSJMokdn0VspOr84xNVGJYCI0CuXiqrHjENLoWwEcbTxi9Nabi
         r37JeuqgbYkfoZP1M7FduhxPsfwfORHyCMzqsgK+CmXVyQ9A2RIb28OMvM6KGtS+aBT3
         CEG4jkRbF+FzVXmTtsXHsIidfw4ogmSyllYtq4jjcMdVC0mkAgkJe7DhO/nkwy0Rq6lf
         6Xug==
X-Forwarded-Encrypted: i=1; AJvYcCVSBkmYaLJIvY0YaewjkC4oegFvp9G9XpmtmTwsThRRm4Wn2b2Fr1M9Yc3g8XXS3bdqr2dqjj2ydGHsueaO3ukuzQgYVN4N1sG1VwmKR+jv
X-Gm-Message-State: AOJu0YzAcfONL8tsqYXYRkMCRBQWb6NdSTCn5R17xv4gAqstPDRXgcsm
	4G977N3bBIZXANOWCObzKZhwIi+CeF6Vlg5jNa5jk3UvYjC5JoDTqOZV+Te3kbk=
X-Google-Smtp-Source: AGHT+IHZ9jRoKKp0h7NT5gHjkgyTEvRFuMix9kyTJj50uyJt2h4HmefYnbrdEjHmjyVE87F9L6RSOg==
X-Received: by 2002:a05:6a21:9988:b0:1af:d0bc:d144 with SMTP id adf61e73a8af0-1afd0bcd40bmr2031451637.53.1715220933069;
        Wed, 08 May 2024 19:15:33 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d176fsm2339115ad.58.2024.05.08.19.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 19:15:32 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/7] perf vendor events riscv: Update SiFive CPU PMU events
Date: Wed,  8 May 2024 19:14:53 -0700
Message-ID: <20240509021531.680920-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_191538_261790_B163FECC 
X-CRM114-Status: GOOD (  12.71  )
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

This series updates the PMU event JSON files to add support for newer
SiFive CPUs, including those used in the upcoming HiFive Premier P550
board. Since most changes are incremental, symbolic links are used when
a set of events is unchanged from the previous CPU series.


Eric Lin (5):
  perf vendor events riscv: Update SiFive Bullet events
  perf vendor events riscv: Add SiFive Bullet version 0x07 events
  perf vendor events riscv: Add SiFive Bullet version 0x0d events
  perf vendor events riscv: Add SiFive P550 events
  perf vendor events riscv: Add SiFive P650 events

Samuel Holland (2):
  perf vendor events riscv: Rename U74 to Bullet
  perf vendor events riscv: Remove leading zeroes

 tools/perf/pmu-events/arch/riscv/mapfile.csv  |  6 +-
 .../cycle-and-instruction-count.json          | 12 +++
 .../arch/riscv/sifive/bullet-07/firmware.json |  1 +
 .../riscv/sifive/bullet-07/instruction.json   |  1 +
 .../arch/riscv/sifive/bullet-07/memory.json   |  1 +
 .../riscv/sifive/bullet-07/microarch.json     | 62 +++++++++++++
 .../riscv/sifive/bullet-07/watchpoint.json    | 42 +++++++++
 .../cycle-and-instruction-count.json          |  1 +
 .../arch/riscv/sifive/bullet-0d/firmware.json |  1 +
 .../riscv/sifive/bullet-0d/instruction.json   |  1 +
 .../arch/riscv/sifive/bullet-0d/memory.json   |  1 +
 .../riscv/sifive/bullet-0d/microarch.json     | 72 +++++++++++++++
 .../riscv/sifive/bullet-0d/watchpoint.json    |  1 +
 .../sifive/{u74 => bullet}/firmware.json      |  0
 .../arch/riscv/sifive/bullet/instruction.json | 92 +++++++++++++++++++
 .../arch/riscv/sifive/bullet/memory.json      | 32 +++++++
 .../arch/riscv/sifive/bullet/microarch.json   | 57 ++++++++++++
 .../arch/riscv/sifive/p550/firmware.json      |  1 +
 .../arch/riscv/sifive/p550/instruction.json   |  1 +
 .../arch/riscv/sifive/p550/memory.json        | 47 ++++++++++
 .../arch/riscv/sifive/p550/microarch.json     |  1 +
 .../p650/cycle-and-instruction-count.json     |  1 +
 .../arch/riscv/sifive/p650/firmware.json      |  1 +
 .../arch/riscv/sifive/p650/instruction.json   |  1 +
 .../arch/riscv/sifive/p650/memory.json        | 57 ++++++++++++
 .../arch/riscv/sifive/p650/microarch.json     | 62 +++++++++++++
 .../arch/riscv/sifive/p650/watchpoint.json    |  1 +
 .../arch/riscv/sifive/u74/instructions.json   | 92 -------------------
 .../arch/riscv/sifive/u74/memory.json         | 32 -------
 .../arch/riscv/sifive/u74/microarch.json      | 57 ------------
 30 files changed, 555 insertions(+), 182 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/cycle-and-instruction-count.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/instruction.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/microarch.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/watchpoint.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/cycle-and-instruction-count.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/instruction.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/microarch.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/watchpoint.json
 rename tools/perf/pmu-events/arch/riscv/sifive/{u74 => bullet}/firmware.json (100%)
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/instruction.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p550/memory.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/microarch.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/cycle-and-instruction-count.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/instruction.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p650/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p650/microarch.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/watchpoint.json
 delete mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/instructions.json
 delete mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/memory.json
 delete mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/microarch.json

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
