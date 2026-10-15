Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D740CC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D0bSAKWz1oWecbU1yBUx8Uy0hZEXEN4SB9IjHJmVpvc=; b=Tob63sZ2ibnOnc
	h2Hn1GJxUDDgISgCM/3ebeqHccMbisPyRhIOR+DDuHKVOyPodSzyZj9s32SZKsdOs2vIwN8bHawqt
	nU26LM93a0U1FkG+LgHZhiLakH2HPJwszosXCZtWyMWXGhrEB68RbMQ5MdyVX/6dXB/GnsVA43uxL
	s4E3qhpg3qn+69PZGbx3/ZqSbAL2lNHdblmh+/CaQ6c1+nMYLEDlZ4sr8NtptSs9bk3KX6uQZxGIs
	juwX5PcTbKZ6SpbAfLnePE91PpPccMWt+O4gIvA8XCMvXyeNMFn0B7xf4DtQAq9ae9Hv0F6KBexxg
	4PM9za+kJ8bw/+V1cZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL2z-00000000Bxw-14qN;
	Thu, 15 Oct 2026 12:59:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL2w-00000000BvU-32Ji
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Oct 2026 12:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=gzDS3xnAfb++0NZ2mM9jNCMhIa/Xs/tZlWtnxCVCMlY=; b=ESHoksPOuW0Ujzk31p0M6bYKH2
	ZP//N2cqCPZJuiZpOFEOiF67maEFv12mZ7AaTwvNdnqRTpWa2YWyhLZxx4wLAoIFMY5MaV0M0Xh/P
	DV81bAcnqqZLOOOw7sF0Pp0eUXQZvAnDJCjFyllpq9KZ/BKzwH8Q1upyoFHVfrHfPHQDnWBEVrqTJ
	QkvoF8YLEUQeCpuEI94cGCaGjgHi5bIx31qilEl6soZsS0rWDDbFDWkM/ab7xeCpF/94wMesKYRxp
	2SeT1BDkMHqAXPm4pcNVC6fykDHIt1oTtOfilFfk+6nBneDZ+IAhgESHzlF28LdgA9uWJURsDL3Zt
	OQXeAYeg==;
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHL2t-00000000O5A-1tY4
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 12:58:57 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-35943f55c06so2017088eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1792069132; x=1792673932; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gzDS3xnAfb++0NZ2mM9jNCMhIa/Xs/tZlWtnxCVCMlY=;
        b=Q5kgNPQLKyIbgAlfqr78FzEdKtFgQ/Gzl8B5BZm4tTBe4GfmZP3SWKPZwgtYnjUO1m
         t5/PjU5j2H9lDi8qJPcmXpMMesgTXFLBEfKIyicPIPt23MCrNX1SE2lYGhN9twAtfocg
         td4jUSDD4R+3Qnw6zDKdt462BoefgqSz9FRSV6z+UErrXIkCx5q2ezmS0Wc6nA9DR57y
         aazzuAktWNznh+kOujvWF7oPLmxPCUlBUbVPko3zFcebOt8XvEd4oWG+8fb32+DIX66h
         5BKroTqSB+tggwD/wvtfzP8SkDFYbq9g1/d+cYyksyHZA2U1GALKAhADnaf4yi/ejAZA
         /hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069132; x=1792673932;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gzDS3xnAfb++0NZ2mM9jNCMhIa/Xs/tZlWtnxCVCMlY=;
        b=Ip4G9TyNxZUJttVqxbeKsOw6mDsA2KKc+52R9OAYraM4DTgAK09QVGoz9JTubFfpaq
         4+IM2MKV7KZrL35nmPBDuvKtm2b3hdcR6k4LfNGfVuVIuysEmfsi3gHpq8y/8A3jWkRi
         qqH5/F8XYOgZNYawcB+xWTEZzQFzaMvwPlJchVCZBuyhpz7iyPAcU5sljMTGvxFJ2hyk
         9VOYRgMTV1oIuPs8aaEQ6XGmtHA7R0tUrtAvSnI27StnCXkcMUnGkH4i2c1rCaA5KZeM
         Q7Lqoe07o+WkJs3DtkEuDOoFM24jA+tdcdPWOqAxYzJ4WZ6iQBcVpM5nYA/7WR4R46Su
         FMyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxILT4iK2PzFKsDJpKDpwUwByn40hhonBQqQAQeR2a/AIUqKKFUUVWeWqwWZfp1kHn2g94Hg3/Lno78RQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5J+6VZ3mKALE51JXrrJXi2N0nf/Lqg7cw0uO5Cz4g0iw9/K45
	rrCioKldWoY2j4QXhHvp+ztzy0tkPPsl6rRt+JHgW5qfdvEwJhn3AafoFdjMtNuzIME=
X-Gm-Gg: AYBFou0Qdl+jRNSVtWKtZg6CPQWTvLsAgHIpo5m/aDH1G7j9rYoWK/24no2fWIs595r
	2q1IirgRhkWq4DPxIx+C4eljDHJ1zlafqUV5Dbt4Wgrkcpdxuwpfapk5vdGC15XKV/+Yj8UC9pH
	c2rhyze97XaGMeIkG7Ojdyver7AcRKJFpVHAs2muO9Rnu6Co4znMnU3pNAyHdBUNffUxccypd/3
	sDczJZejZ2NkvFOsTB/zgLyKfvYfzBz2Dm57lrIuESboIYGsSGJVB7WsgpjyQGWfCAaYNxF33fQ
	vkhi4EFNiU+uvNTMna1JQFMGCwsokgcROEQfL1Pg9swx4PRAC01HaVIrnNZmvAHNafjkog3yFPZ
	8U706WgKKUp+S2utOOuvhAXoPfF0JWgvxsimIeynvsbIpLUiZiGTHXhA1+swY02KoLV7wGw7ifk
	iEgpSSit/MzqgnJRxjIKT2k7OW8IgftAgqe0mjCnffRmYlaTz4lEEG9rcnTn/Q2Q5LxYIYJ1aDW
	h5KZofulnwNPPOi
X-Received: by 2002:a05:693c:83da:10b0:353:804a:5e83 with SMTP id 5a478bee46e88-353804a5fe8mr24930671eec.8.1792069132269;
        Thu, 15 Oct 2026 05:58:52 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:efe0:7af6:c627:5f7f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm27325895eec.23.2026.10.15.05.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:58:51 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 15 Oct 2026 13:58:28 +0100
Subject: [PATCH] mailbox: Use named initializers for acpi_device_id
MIME-Version: 1.0
Message-Id: <20261015-acpi-mailbox-v1-1-152ba71454ff@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA1kAgrpVcRFMh11SmtCUktAv
 LuxLt/i/x0yJ+EMj2aHxD/JEtYKbBugxa0zK3lWg9GmR42dchRFfZy8fSiqI209WoNoCWoSE09
 S/rthvJ03/2L6Xg84jhPqij2KcAAAAA==
X-Change-ID: 20261015-acpi-mailbox-5c09b192119c
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069129; l=3235;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=Ti3ORTRFIbhTaKVJ+zyV+gulbIXNDTcXQZ/fH+BdAvQ=;
 b=KHPuP7rvUi2hhNNtdgguZt1cgOx1RwPRIeyrjwuRcU0S3vubL3X027eNdmKk4+WyLv6WFbnR0
 XcJpEBEyzOtDVNPC97aqsT5fzrS4Ovo3AXER+h01Sh/6tZbj9P6QLep
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_135855_717217_BB791E73 
X-CRM114-Status: GOOD (  16.63  )
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

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member (does not apply to this tree)

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/mailbox/mailbox-xgene-slimpro.c | 4 ++--
 drivers/mailbox/riscv-sbi-mpxy-mbox.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
index 946ea773ec33..1f87a84e5995 100644
--- a/drivers/mailbox/mailbox-xgene-slimpro.c
+++ b/drivers/mailbox/mailbox-xgene-slimpro.c
@@ -228,8 +228,8 @@ MODULE_DEVICE_TABLE(of, slimpro_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id slimpro_acpi_ids[] = {
-	{"APMC0D01", 0},
-	{}
+	{ .id = "APMC0D01" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, slimpro_acpi_ids);
 #endif
diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index ea69c6b6b4f9..4ebce35a8b6c 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -1006,8 +1006,8 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
 MODULE_DEVICE_TABLE(of, mpxy_mbox_of_match);
 
 static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
-	{ "RSCV0005" },
-	{}
+	{ .id = "RSCV0005" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
 

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261015-acpi-mailbox-5c09b192119c

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
