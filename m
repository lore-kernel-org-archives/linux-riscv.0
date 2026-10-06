Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FB6CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G8pSZtrrmYfEPU/Dzp8/2XOoRkeLfkpAIDd19wRNKCw=; b=w4GVJtVoWp+D7l
	n008eJ3IOjrHFKftCd/SVtEt0Att7Mmkr9t6EufLelt4kcah4WCKTPbou2noI6w2CFBk4nZw2CsIp
	xTD9zj16YhNwk+Qo27fquYyMv5l8F+g0yn5HQAfgXYscKIjndxAPud+LFXNI4vbEuerHU9KMKv/uk
	77xBI0btVUkOmKuUT4p8NijpnSf/ZsSW0mt4XYwAQr2jgAv7J/wAKudg8Uc0oq1znCg2F5SePCwUF
	eWs92nNaxwYx27f4CIamsFSVBddBdtApMqz8q8UUrwtSk8k2ji6em222XMDd+McC8ikKxtsCuo3ed
	mpU0XnAZ2MxMryhqidvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE87m-000000019U6-3AjY;
	Tue, 06 Oct 2026 16:34:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE87k-000000019T6-0H4h
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 16:34:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a02718da81so8656515e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 09:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791304478; x=1791909278; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S6NNYhIzBaDa0aocfk5znnJoVbSEEYZymIRyHYxXuYQ=;
        b=yn6OWOhl8YxgiQVPyFAhUbXxhTEebwv+ykbN4/GqY1hTJdHy0PqjT+px3FkbVWieMk
         L0+pcTN42R5o9x7aHq6ZW/vqR5sU8T6uhF4UXuvd5ljZbbEMkV9QfK48nT+ZE4kAXfLt
         4Y234qVY6R5fh3uIwwxVixzOaBuBAbuPKYyE4BwmyC4E61BC3p5kZAJFtec1Mwws5FTU
         IfSIujgfblTCqX7Y+aww/UqylAKbx0tR74IPFSKFijR530ayyhqtcbK0GFfe2Uye49Ie
         fRSUL/HVP6l1IZ4Jr+/B7dKFpZR8j4Ef7rZoBvOppJZYElK/6IBamLsVcHSF1qJnBM4z
         +/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304478; x=1791909278;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S6NNYhIzBaDa0aocfk5znnJoVbSEEYZymIRyHYxXuYQ=;
        b=bCafEZlALt3o++2HmNtvYz9I5y4pex/+yY51GdLaemD+W4Qi0muNgrAhxhMMyDpQur
         Ukf9JzeK2AaxqyV/JHQO5tEm8+kuPXoiVpkcLi6hW74fVK7hfGeLN0RlUowmw2/g17Ja
         WcWwPFi3gF5RhqBXY/zxQJnHxL/wuuGrhBDVLrnr59/HuOYrGdPVFOMXnkUWVeFFEUOH
         zVXC74xSTW1C4iOjo5Ot7LFT9th1/eqjXMcaTxgN03DbH4g+qBDkLf4T04p5z0Ci7DEb
         tyqXGp7BNcAaoAGlFEZvzvXj+4wW9zuOl53aTiUyejGePIvC9Bw2dGMWCvc9kflfFBp1
         iw2g==
X-Forwarded-Encrypted: i=1; AKwUvBzaB7jiJSwEQc5Ehhzy2GBRwHHUOL/5y4v2y+DJoHxJ45FyS8c//y5pJRovjGqXfMYHg+3KN5xpulds0g==@lists.infradead.org
X-Gm-Message-State: AFuF++mjR6ogKAvjUzh5voz2OZUqoz8cf0bYbo5pMC/d/CNxDuUUOAm+
	xNzUGaE0uMgli7EvBL7/CiuyReS/AF1uAaZjlkGr4Dqg2DUlv7BmBqNTp7hcPB50t3VJ2Ska+K2
	l4AJTO80=
X-Gm-Gg: AYBFou3caiFNUp1j/tAStPZYKBZ3/Pcb7yH4ZBzEXImOpIlorHa7a7yu9uJ2VEvhSMB
	jxm81Sg+9PCDs7SS17uoqll2esBHqUR7nGpn779HxY0L30Qn6wkBsFmritzpEh6rfzpu1D4KWMo
	0IMWgN5XcGJdPTCAm9ONwELd1QSJMUcsU2mFJLv9GRVhwsicsn+D6OwQ4usUWoo0UGFWhAG7MdX
	fpm7XNnYSn6tSxsXTiWROVQAMV398sBdIC8cN2FSvPKp5r7pcXaTfW/Xpys5vhhg1kSYhua94Tj
	LTewI3r0/4x/UPcbMmgUeuJeY8TawMAscJwI2+e2mrSwMiEjeNSH2z/FntKHXLSU+vTzjW0b+Zn
	NnGMzH9innz804YPYHVL6/vRf6x24wARoUxJbcWwvo61eCEvPNsAH3lcIoKfab/4x9z1FTUXiG1
	7PTnQqsvC1Pw3ZBFu8jIdHCMaOp3aEpp2/uCMLzOR4n9TCRjlUJZyaf41MgJzpU81cudTKrPeXM
	g==
X-Received: by 2002:a05:600c:3b98:b0:4a1:7d08:780e with SMTP id 5b1f17b1804b1-4a17d087812mr26088725e9.1.1791304477858;
        Tue, 06 Oct 2026 09:34:37 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm78918555e9.3.2026.10.06.09.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:34:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v5 0/2] perf tests: mmap-basic: fix user rdpmc detection
 logic
Date: Tue, 06 Oct 2026 17:34:11 +0100
Message-Id: <20261006-rdpmc-detection-logic-v5-0-b25c9d49baa1@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAMjxWoC/4XOQQ6CMBCF4auQri0ZoRRwxT0Mi1qmtAlQHBqiE
 u5uYePS5Z/MfHkbW5AcLuyWbIxwdYvzU4zikjBt1dQjd11slkEmobqWnLp51LzDgDrEWz743sX
 OTalErc1DSBZ/Z0LjXqd7b2Mb8iMPllD9tDwHqAEgT2UhCwH8yp8fq3xD2FkVUu3Hg7JuCZ7e5
 8JVHOC/MauIlM4yKEVRVkaqZnCTIp966lm77/sXU2lw9fYAAAA=
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
X-CRM114-CacheID: sfid-20261006_093440_134653_721BF500 
X-CRM114-Status: GOOD (  13.18  )
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

 tools/perf/tests/mmap-basic.c | 182 +++++++++++++++++++++++++-----------------
 1 file changed, 107 insertions(+), 75 deletions(-)
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
