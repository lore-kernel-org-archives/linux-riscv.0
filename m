Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A471606A33D
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 17:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jA8EK/cd;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hQD9mPgX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=72Xk5Nlm2Cax5mjrAlKzpkTTkli2EIgWQsYcAHxPa+o=; b=jA8EK/cdcTUglTUbBBkmmEpee8
	I1CW6eGJB97Ti9yCt3ENkNBwxPbU7G4UwButK4cs7Fo1chWsapXlCgvTaLJ8dfod1a0mYW1RoQkIf
	0Wcps5QuYU0uoRZaSE17eIedEFKh9iLuX2PLQ7sozmgfx9ddxZ6YWPG/RE+Q4PQCiksoYSE1QoRBi
	6GTf3yhOBy6rrC8zzsiZt/ysEq2bV0uTrb27CCWwwEGQvNnr9SbcB8ebKW4rfM61mZ01Np96/Y/ql
	3srSbhZXoh2Gqa+bC/lpTsX6StHdob0BzD0QNoCfb2jgYiIqnrgiS2yrryz197XuyxnGiJ5yj1Ogl
	9b4y4NEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpFE-00000004cXQ-3Bmy;
	Tue, 10 Nov 2026 17:02:52 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpFA-00000004cVw-3amZ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 17:02:51 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 357C34028C
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794330166;
	bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type;
	b=hQD9mPgXugfhtIhDcvsq4SZThekNRzFT3sMIjicEtPufbY6ARxAAxLQP9WwXgY4CC
	 aR/wvfhIAOuf3xGqJZo7ygWk+aKNtZBVp7lmCnO9LJjMhM5KrxcmeB8bpIIiHRMrzY
	 PrQkHf/lANfXuOSU36xUjcvWW5YuG7yc9cPxFeqpveHCwXebfEbaeOUTnysB/U1Bfa
	 CPGExOBT+QlJol/ka/7z/wx722r0mcwCR5XGgD0Q5CsXjt2jIbL03XUfyNoMmsSoTh
	 azWcf7ngIBV/oFBaUnd03Yo25hSnHRyOScMrPajLZzJy5tRQmcPlyGJChgcodsy58N
	 FmaWQlVn+De1Ouo/qWit8uxUXwv+CoTiMTgzmtBj9+o9QGitYLGM8c7Q/jbx1Yas5Y
	 Y/48ZWEGk1Yw3ZMsowhzD+KSuKGreYgOQSxMwuhcsT8w3gjGieQ12dOUI6ZXkWpzhG
	 8sMIACnv7Y4gRSVmbu8/sq3RVbNdvF6kvTeBTqiOTSECV65jVm7E9GQMzEHXuE4I6+
	 4yxISxem7RcOd1JlrFHtBjJWAIfBc13cDpxb24Pe6pnOiyz2sJ0yOQF8Nn30Xsj4Se
	 9g6K+eeCapUKBWNEHlb7hd/cxrT1Mr+c02r8iPBVBUvKS9yvI67OBzeGZE5fHy1WgH
	 wOfMNs7ArNDVqstymZ1zmUTA=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49323e268aeso1770740f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 09:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330166; x=1794934966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
        b=nYGkeNyfZUq0D35WGsOfPh4XK8qDTns5OFkyPvKxwwELWHS4fQ4pbWs05sR0YU4Rv7
         +SF4YPmIJpM3rqB3P5Gsr8pZqqs5wzWGnHm2BqGu3g4lpJwhaXHDPB+E0rEMoU72vebt
         27FENmRwfhTalhlop41YnATJNpbvXr0bXJBItImp8OdWEo+b3KUWpF14QafGDeNoHv92
         uTcZgsXdYh/HpvAN9TMVERkQem7pqH/NuJgyyVElWm8QgEgA5yFXTGfNReEVCp1HYITb
         6KefXt3v79YMhE2vuBEnyIAy9KwwHIySzKqMvqqilsEkzWHsTj0ajFiQk1GcS1k6UOay
         R5ew==
X-Forwarded-Encrypted: i=1; AL+hErGlAF7ydLehHB1Bcrzfto6V/aN7TmIWFwVd6ypjBQImp94g8pGFHFmRBNIewMmkGnDDc3E35mXuALZ4kQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8tRr/0DPIiBlLyoLz9lEmnFMItBZJJyhqn0s0q+Q9o4Vqu6D1s
	qc9eDcy8cgqt51xlmPh0GSd5j6ToBYcGlryLLS8kt/Kl116tWYt0vgjV9ZQlksgfuVKf8wxkuOp
	8e2n1f3TjApkwAMuYYUqwSr425q4gIhLm34otwJAYJyJ2u2yKsgGYj+hkY8TsTZVTzkxjspOhJV
	Rky4k3r0nR8g==
X-Gm-Gg: AYBFou2BFl0X1r9jOV6SlPYGhU0pCxnQqAeVIzRNJtBgkDkRH+Cir3f8mlv4BMnad29
	J1/Ytgr3mYT8Jf+ohVk555VeBuD7e4sgbwFim87jNmjfoIGKp6MYK5AwqCHYMh62bfZJk+A4qKb
	1QMM01EyJClnEJaf5yU5rTcqlQXqodAWKt7K0sroCZZhYE7AxxCGigQ24fBuHJZIByGsZQTsgbr
	qL8UV3o/h7mDodBVNEPYkDiOKy+ye677WxYuTFb8Q1HHx5fSUoTYwvoRcYL8DCZXV46OzlUZWNd
	qRGldi07Sto3eCKSzurzsg9Soj2HAfLWwkQaabWqKuEVcefjJKDvv63wHxvK2DFAtUAiO2zn5lN
	7/dJ13TeiV2KH8L5s4aAii9nnBdXukQ0A33Z2hCPg+QBZ0B9sFqdIkmwwL4PeIYo0OkZw66whlS
	ywcTqIF6s0kaX/Lyc4Wcx+6+LFsF612vHZhr9ZeMwU5Jjbd2CI3oth
X-Received: by 2002:a05:6000:607:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-49992cc6a24mr288622f8f.8.1794330165631;
        Tue, 10 Nov 2026 09:02:45 -0800 (PST)
X-Received: by 2002:a05:6000:607:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-49992cc6a24mr288536f8f.8.1794330165190;
        Tue, 10 Nov 2026 09:02:45 -0800 (PST)
Received: from ?IPV6:2a01:cb19:9432:11ec::c98? (2a01cb19943211ec0000000000000c98.ipv6.abo.wanadoo.fr. [2a01:cb19:9432:11ec::c98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c83432sm5386247f8f.58.2026.11.10.09.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:02:44 -0800 (PST)
Message-ID: <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
Date: Tue, 10 Nov 2026 18:02:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+codykang.hk.gmail.com@kernel.org
Cc: airlied@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bmasney@redhat.com, codykang.hk@gmail.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, docular.xu@gmail.com,
 dri-devel@lists.freedesktop.org, heylenay@4d2.org, krzk+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, me@ziyao.cc, mripard@kernel.org,
 mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, sboyd@kernel.org,
 simona@ffwll.ch, spacemit@lists.linux.dev, tzimmermann@suse.de,
 u.kleine-koenig@baylibre.com, vkoul@kernel.org
References: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_090249_288924_FA349DF2 
X-CRM114-Status: GOOD (  16.04  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

We have incorporated this patchset into the Ubuntu kernel for display 
support on the K3 platforms.

During testing, we found an issue: the screen would display artifacts 
all over, kind of like black lines blinking.

I have implemented the following patch to fix the issue:

drm/spacemit: map scanout buffers write-combining

The K3 display controller is not DMA-coherent: the DPU fetches scanout
buffers straight from memory while fbcon and userspace write them through
a cached CPU mapping. The shmem helpers clean the buffer only once, when
the sg table is first built, so nothing flushes later CPU writes. Dirty
cache lines shadow what the DPU scans out, and erased fbcon text lingers
on screen until the lines are evicted by chance.

Add a gem_create_object() hook that sets map_wc on the shmem objects.
The K3 harts implement Svpbmt, so the CPU mapping becomes genuinely
non-cacheable and writes reach memory immediately; the one-time clean in
dma_map_sgtable() still covers the initial contents.

---
  drivers/gpu/drm/spacemit/spacemit_drm.c | 16 ++++++++++++++++
  1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/spacemit/spacemit_drm.c 
b/drivers/gpu/drm/spacemit/spacemit_drm.c
index 12b2fe8b6fc99..fe354219b996d 100644
--- a/drivers/gpu/drm/spacemit/spacemit_drm.c
+++ b/drivers/gpu/drm/spacemit/spacemit_drm.c
@@ -12,6 +12,7 @@
  #include <drm/drm_fbdev_shmem.h>
  #include <linux/component.h>
  #include <linux/of_graph.h>
+#include <linux/slab.h>

  #include "spacemit_drm.h"
  #include "spacemit_crtc.h"
@@ -75,6 +76,20 @@ int spacemit_drm_mode_config_init(struct drm_device *drm)
         return 0;
  }

+static struct drm_gem_object *spacemit_gem_create_object(struct 
drm_device *drm,
+                                                        size_t size)
+{
+       struct drm_gem_shmem_object *shmem;
+
+       shmem = kzalloc_obj(*shmem);
+       if (!shmem)
+               return ERR_PTR(-ENOMEM);
+
+       shmem->map_wc = true;
+
+       return &shmem->base;
+}
+
  DEFINE_DRM_GEM_FOPS(spacemit_drm_fops);

  struct drm_driver spacemit_drm_drv = {
@@ -82,6 +97,7 @@ struct drm_driver spacemit_drm_drv = {
         .fops = &spacemit_drm_fops,

         DRM_GEM_SHMEM_DRIVER_OPS,
+       .gem_create_object = spacemit_gem_create_object,
         DRM_FBDEV_SHMEM_DRIVER_OPS,

         .name           = DRIVER_NAME,
--

I'm sending this here in the hope that it will be useful for a future 
revision.
Is there a v3 in preparation?

Thanks,

Sarah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
