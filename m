Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97570CA5FFF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=utidcUjibthq+JKxJz+JReavfJTeOxzoM2TQ0Zg/82o=; b=eqN1uTEm8moPVP
	8sncO0yyJKVOAJFkiIqOcDgqbaA7rsLhn8XFpiIo07fDXF70aWz7uXSw9gdE/K+gCXdMDoPc+4XdU
	0XI38N4cFPoT9EJVVXF14huCUQ+I9/HFNTos33Vxe71kPp/6lWjwGtXu8VMfd2hPUpt2k3HbJ9RWa
	gjmRbzK8M1NdFCnGKRC/TGwLaZdO4XeXpL1PboVEswkM/nD0dHZDQsDij7uqXAr6ivCkEZ4qPrXzS
	358Wo6bQz/EloZVlu3vjiUK7z9lmr1oXXb+LCP8O3U3ndUr3rHx0UmiJr/CtCuOYiqncLDimYC754
	ktMlnTHusATFhgsDdENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPGS-00000002EYx-1a8R;
	Wed, 07 Oct 2026 10:52:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPGP-00000002EXs-1zET
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 10:52:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48b0be347b8so1334821f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 03:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791370363; x=1791975163; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NZeoDWuLeHkfSjqfDQhymjIVrj1yL1sXaCr2GcXJWFY=;
        b=XuQnNYvkCNFdTneIYBqCtED/5Op/30edTkL2j6cjqhr9Li5aeugunTW1yvz3OQM0PB
         Mil9cS/vrvYGW7OpeOelFCy9uH5qfngH8Cg/5kyU8hCl0IIXTXaYulrB1nTLkL70YSsE
         Di3+ZJ+JKtgUgSKfEon5X3oTcbBPh51x8ys4GRXmU2RauosLA5PlzmOYdjeKUtlhNw/C
         SUZiAI1uhfd5PfvrQJRFAtd1ZRejVZsHO735a2lYht/5Q/ov+wXJteBILpcA1cak85Z6
         Ib5dupPB23/3f4b/CcKoGFwiP8k+dT0wA/0oQxnp7YgGo0p8o2UrbuNZJuD6YihYT5Wn
         o+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370363; x=1791975163;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NZeoDWuLeHkfSjqfDQhymjIVrj1yL1sXaCr2GcXJWFY=;
        b=rfaXt+hrF7Mp/uT4IOSwbeZNy+94ypob2nDHaejlViYQPW+CT3bCKXTVlJOAJRHBC3
         khmdLis8J+tY3dCicTNHd8KWtbRzzCGq5Vb+MFWDLW4VEgFXV1lLWLHXpZQ81l9kjhYb
         +P9Lf8eUGZn9ab8pVEqerPi4rMQMdvahGO9hWdnyqtcq1+p1SXFxkh+Scngrqj2z1hTn
         cu1tsxAdN8g73sLeQUzI2QeXbyjAsuQ5NZrbF/OBjKjNZExLZD3E4wHK7oT+O0POqobt
         jwU1v+dgdMKytLqkVyrNMsrFQ/H4F9MP6Wfp2hZ5G8aNQgwxIZfHy1F8WsBEu8IV1+gK
         pn6g==
X-Forwarded-Encrypted: i=1; AKwUvBxt8eNhaprb1GP30RfAoaIc0FQIW0oSju01z7cyZOcAsOedRP+0tOVt7cxmFqyummW+PBZhCX9EbAtNKQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKpog/406FRsmxW/AuBQMIfX3f67RbiFkVxPnEIl0XtWig0L7g7
	lHPCvbar+2+N5R7W9ZIntjeZ7EDuVnOtxy8xH6TB2qkybgyRVJOXPcd4vAKgQrKsl8WeQSBUei3
	nA4AJDJg=
X-Gm-Gg: AYBFou2aJ5552C2ks3ZTLRJ8eFISEHes9jEIV+5dT5IZXeHWoUprB1F8xpSzz7qq6HZ
	ZbPc/Jz8yQiqRdPn93OD/ij1VVh1h3mp4FELBfZGZjJvRj73D2L0ENfVP7HJnQH7V33ON7I1uxw
	L0m0kLF5/r/KTYJDjs6N5T5odwhVEeDk6DAqrbRXE+m2VD+ciRoQt/s0iqzEAOd8BnOKPcY6LpR
	zBLrB/FVHeBsKgVJjLtOg7UUTlmEHdrAMxazJsMtHs3K7WYz5gYLsO7h732WStO2RWpqMijgmTi
	+MsOP5oc55qHWa1VVve4aD6c7PVzzTMk/ZmAD0OE3y0NgPof29A0XPGA2DHXiOOmE/0ABBYDyru
	A9H1Xd1JB7FD2lTMiVWuNdt4w4d4nt9J/eWPk6TmjQ+xmlK11r8qtIYKBU77I2gA9tKq1IE7reR
	7PDsedIwIJFSuedpqw23FGs+p4tJJu7mFLMmMZKRtnitCvZb1qgjURl5IhraLjqDuKQZvFXL8qD
	Q==
X-Received: by 2002:a5d:64e2:0:b0:486:fb08:2353 with SMTP id ffacd0b85a97d-48c72885618mr3221413f8f.31.1791370363566;
        Wed, 07 Oct 2026 03:52:43 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d31767sm5182781f8f.51.2026.10.07.03.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:52:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v6 0/2] perf tests: mmap-basic: fix user rdpmc detection
 logic
Date: Wed, 07 Oct 2026 11:52:11 +0100
Message-Id: <20261007-rdpmc-detection-logic-v6-0-d7ed6a85f864@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFwkxmoC/4XOwU7EIBDG8VfZcJZmSoFuPe17GA9TGArJtqxT0
 qibvrt0DxoPxuM/mfnlu4uVONEqnk93wbSlNeWlhn06CRdxmUgmX1soUBbObS/Z32YnPRVypd7
 Ka55S7S70qAcXRm1F/b0xhfT+cF9eawfOsyyRCX+0rgMYAKBrrLFGg2zl22fEfGHyEUvj8nxQM
 a0l88dj4aYP8L8xm66UUwp6bfpzsHi5pgU5N5kncazZzDfTAti/GCNBjsq4wethRGx/Mfu+fwG
 eCX09PQEAAA==
X-Change-ID: 20260817-rdpmc-detection-logic-d3f7a49cfb46
To: Ian Rogers <irogers@google.com>, Michael Petlan <mpetlan@redhat.com>, 
 Qiao Zhao <qzhao@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_035245_539253_AE0479C7 
X-CRM114-Status: GOOD (  14.20  )
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

I'm sending this to fix the comments that I left on the "V3 resend"
because I don't think Qiao sent a V4 and it's been quite a while.

There were also some unreported bugs that I found during testing.

Changes in v6:
- Also skip on EROFS if sysfs was mounted as read-only
- Don't perf_evsel__delete() on NULL evsels
- Don't try to write or restore if the read failed
- Use existing "goto cleanup" pattern instead of continue
- Link to v5: https://patch.msgid.link/20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org

Changes in v5:
- Keep rdpmc_supported variable name.
- Keep enum instead of int.
- Remove #ifdef __aarch64__ in the capability tests that made the
  cap_user_rdpmc test diverge. Now cap_user_rdpmc and pc->index are
  tested in the same way for all architectures that support user rdpmc.
- Disable running the 'enabled' version for unsupported arches which was
  equivalent to running the 'disabled' one twice and to be able to
  simplify the test.
- Link to v4: https://patch.msgid.link/20260817-rdpmc-detection-logic-v4-1-c22074578f6a@linaro.org

Changes in V4:
 - Don't remove pc->index check. Without it Perf can silently fall back
   to the read() syscall and the test is useless.
 - Test the 'expected disabled' case for Arm in an ifdef to workaround
   platform differences.
 - lseek() before writing to perf_user_access otherwise it's ignored.
 - Support restoring arbitrary values to perf_user_access because RISC-V
   uses '2' for legacy mode.
 - Rename rdpmc_supported to rdpmc_expected as this is what the test
   expects, not what the system does.
 - Label pc->index as rdpmc_event_active for clarity.
 - Add comments and simplify the commit message.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (2):
      perf tests: mmap-basic: Only test userspace reading on supported platforms
      perf tests: mmap-basic: fix user rdpmc detection logic

 tools/perf/tests/mmap-basic.c | 188 +++++++++++++++++++++++++-----------------
 1 file changed, 113 insertions(+), 75 deletions(-)
---
base-commit: 1dc462fc214907671600172280c2e79ef9fe6fcf
change-id: 20260817-rdpmc-detection-logic-d3f7a49cfb46

Best regards,
--  
James Clark <james.clark@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
