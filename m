Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78646C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g29DodQuhSU3fDPRbNZAP6QIm7d4TCzOt08T3y5UkpI=; b=QEYH0Ho04tVRKh
	dCJ7xfLR3M9sXP7JPcFPevaAdsqlZmMxXEYzgG5o+PJ59vd5PFePM7cQ6wPEq2HinoMgQlg7cWzwu
	840Gj1U8P/DAPSHq6KkDI1aKcg7ZHgoaNhUEECpYfCLE66gVSXId5sj0az6LNTOwKwUXWgP+ZTlxL
	tKiJ/hJirkTZMagnfQ6RfYr0EPdwMzqF9bLbsGwdPYf0XE0HaOvb2OaRgZpzDkUT0ADXFm4XHheB2
	qRP457SouGebuwB3rUXnehWV059n5/Z2R/dmIDwZJMfiG1yY/Y3cO12C8/oU8bgZVUeyeD3d3+h77
	Sm8oN7W0t5XmA1FF7QVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2sqC-00Dxe5-Q4; Sun, 19 Jun 2022 11:11:40 +0000
Received: from forward100o.mail.yandex.net ([2a02:6b8:0:1a2d::600])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2sq0-00DxbQ-9Y; Sun, 19 Jun 2022 11:11:31 +0000
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
	by forward100o.mail.yandex.net (Yandex) with ESMTP id D16D952AB867;
	Sun, 19 Jun 2022 14:11:17 +0300 (MSK)
Received: from vla1-d53b4f396d89.qloud-c.yandex.net (vla1-d53b4f396d89.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:b8c:0:640:d53b:4f39])
	by forward102q.mail.yandex.net (Yandex) with ESMTP id CBDB0BF00002;
	Sun, 19 Jun 2022 14:11:17 +0300 (MSK)
Received: from vla1-62318bfe5573.qloud-c.yandex.net (vla1-62318bfe5573.qloud-c.yandex.net [2a02:6b8:c0d:3819:0:640:6231:8bfe])
	by vla1-d53b4f396d89.qloud-c.yandex.net (mxback/Yandex) with ESMTP id mqFByjOn38-BGgmRKmn;
	Sun, 19 Jun 2022 14:11:17 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1655637077;
	bh=x2SLVKj3Y2z4qT7CkEW4It9dIWFbakpMlebj5eIZY/w=;
	h=Date:Subject:Cc:To:From:Message-Id;
	b=jvV+F265YM61bUvgAJy4kqOtsdtLOX+3w2s90+Hdf68rMSLF+U7/5vu2CNK0IFsQt
	 5dBVYu/XLnMIHT9r/dX9AdpkHtbg6c1Ov78oSl9eGJTbOFmmlWlnk2KZlHNCrPGzOf
	 cyUHrvHm3jhXM5apOo1mEjk5pgty41pvouynsqME=
Authentication-Results: vla1-d53b4f396d89.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla1-62318bfe5573.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id VrXAFig42r-BFNq83H4;
	Sun, 19 Jun 2022 14:11:15 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>,
	Will Deacon <will@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	linux@yadro.com,
	Nikita Shubin <n.shubin@yadro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/1] RISC-V: Create unique identification for SoC PMU
Date: Sun, 19 Jun 2022 14:11:10 +0300
Message-Id: <20220619111115.6354-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_041129_323717_033862B2 
X-CRM114-Status: UNSURE (   8.88  )
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

From: Nikita Shubin <n.shubin@yadro.com>

Provide RISC-V SBI PMU id to distinguish different cores or SoCs via
"devices/platform/riscv-pmu/id" sysfs entry.

As per Will Deacon recomendation i am splitting the original series in parts,
first one is to provide a reasonable id for RISC-V SBI PMU. Events for Unmatched,
general RISCV and SBI Firmware bindings will be added later.

We can provide the PMU id as is marchid, mimpid, mvendorid as string, separated by a coma:

cat /sys/devices/platform/riscv-pmu/id 
0x70032,0x70032,0x0

In this case we are providing them as is as given by SBI extension.

Also i've added a string allocated on probe with pmuid, to avoid excess ecalls.

Atish would do you think about this ?

Sunil, thank you for reporting issue with 32-bit, i decided to make another approuch to problem.

Link: https://patchwork.kernel.org/project/linux-riscv/list/?series=648017
---
v3->v4:
- split series
- fix DEVICE_ATTR to use octal permissions
- use string for pmuid, instead of incoding some magical numbers
---
Nikita Shubin (1):
  RISC-V: Create unique identification for SoC PMU

 drivers/perf/riscv_pmu_sbi.c   | 41 ++++++++++++++++++++++++++++++++++
 include/linux/perf/riscv_pmu.h |  1 +
 2 files changed, 42 insertions(+)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
