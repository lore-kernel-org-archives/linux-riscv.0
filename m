Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F61606A327
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s17ULrpL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ig03THgp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Dy1zEHUwNgP4rfIlClYimsi5uE26lyVYp/WD4JvVYVE=; b=s17ULrpL6Ck1mmd0yxssxKg7j2
	TjHzaCD7KM3qwcnBHYISmILLHo0o/flf/sTod7zoJ4tikTuVGZ5/PYMI+821n3f86P1YfI9xYx2n1
	tUClL1vmj6sXZvlXjVHfXIAcbEuD1d5K0ttfGlcSfy3wV9+IDxGkFhB+O1bAlVe1pgJix67Eh5aeI
	zeg0dfymyQeJgbqVKcjpEM3xcd+TLzuehxVWn5tU8OMAk5cvQQRsWyNVdePe6XGd2Lc4No4EDizPz
	OVDau9gnEhgJeO1VfiQx3ApbwqU+chVByx8mIr/6xbf8M/qkd+NfJbJ1ajz5Mxrfit9w3KSwMZs33
	zHgHz7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4rs-00000006EMe-0Efx;
	Wed, 11 Nov 2026 09:43:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4rp-00000006EMH-25Ye
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 09:43:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-498f5fa5103so775979f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 01:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794390223; x=1794995023; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=17nTIOS/dd/uGgTMm9wblinmfvVg+kfi3Q9xJ7p3hHc=;
        b=Ig03THgpkLb4Kwhf5f4d8C0YCTA/R0s9Z1AHUYzt0mJ2Lz0Sxo3/nsBiSshZKZxMZu
         UPEzrAEJ2M3bmWaqVxEAgzv9x3DPgclPPt5nxT/5CmOi4cGs9myK2Kx+8jQ/4VtQBqDh
         r2lQRR6pXumtudJWrxgmxR491FdsBXCou27HiCcH2EySq6GRRVTfIbIcyHKxYkkf9J8E
         K5T8yP8/bt9mXqo6ed/EYDQZSJZPjvIhwURGCSuLYTtpDnHwM9+fVjdc7QA61h6EFUtb
         1nlyjIwLO9Olz7kWD8TrlQJMOwEGsMHaz3rFlEN9MF4oXirP9j1KZoSeBBH7K+54HdN0
         EEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390223; x=1794995023;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=17nTIOS/dd/uGgTMm9wblinmfvVg+kfi3Q9xJ7p3hHc=;
        b=WW3o8ynqhJdHdhuH3uOtKQG+u1MKirJwOC3Sn3LEtLj9yhqApq29LQVol4wk5BpnS3
         YcaVHOeDG/CF8XJ2fMCTakSTTXwJi3YsNb5HbEmMnyQ3tABdA4g2Eyqt04ChDaNNqcO1
         5RWCKnisKUCv5VDC+QBAjfFV4BQUa7EKzNatVh9yCtWOAsbglVjunkVqADEoqjY78V0w
         uTBJrYGgM9VJ8iCGKcfjhmRc0GsKb14b1o1D3Jglq6UVefLcAwznS+pvknW8JdnyQVTx
         82PC/QzMCskSj4QvevEf/LivNF02ePyuEDa/XnOzGMEG78DmF8RkH9qHTsQmeBvILkQV
         QZEA==
X-Forwarded-Encrypted: i=1; AL+hErHpglF+x+cT+YjVhrxHmTZC9aErjMbhZw1ZbcVMi6XAn51sns4Qv2nb4kGoAculQ77EWsXnjrOg+A6JHA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+NP+cslW2chLIwBb3YWyp0Ld1sgrCOVi7CpB3eQdrRcYdncCnb
	Wmo7hoqWSITj/Uff9GguTsdpj5Py/zQEu72DkK0c0f0SBIp9PzrLORMiFi0D215imf9DI9kna6r
	EHy7o
X-Gm-Gg: AYBFou0oUBhcyr9BW/0FeXARH44dpdpoWK6KEUguuyHOejcj2laQRY6cOG7C55oB9la
	Zd2VBBObFTsev7Azt7JJhPkuJX1wweomoT88IyuQyaF3WfN4zRW91SP9ecYAxmtix0nvxFth0wt
	LmrYPE7yUMNLZS0UTR8huhJszCxi4Nn9QCT0IKEqhynAH2OA88iUdkSqL8eDcKskM2XZLzpGXip
	Z/rTu9xONiFtZ1Yrb+0gdeDm111m9A649y1JZKfz3zoeaPbe9wXqhtwA8e/3/IGxOpt2mig49jB
	HS3Z0AQ3+hO6ajPeI10qx5zsOhRLgSDTswxSvGNvz0mitL5bPcyeSesSwq/yjEXPMjaLNGRmcqs
	ge4o1oza9m7DJsNHoRvYm0q+ye/xHCBgVULawJTy9WmjB9DVp/AjeFrX8Fg+kmWef/sTTDn6Zfg
	aboe4JRTBZQADTvt+3X6WcCkGTBdrR9TwAj5uV4bsVMd53olIkT6lJawxbLqS4cdUWDV0DB6R6d
	Jp6OP1CXkP2RqMSmWGVk+hLbpRAo52R+piM/7YsfW1B1pL32OGsqGYkdI6sPWRlK/msGCF1ugYK
	tLO+27ROR1eEOwfqH/cw66pNt8CjVki79RapTZZHMIbImL9jvNBFgU4TgnN3RWmhIycvcSwh
X-Received: by 2002:a05:6000:2506:b0:497:bd30:8df5 with SMTP id ffacd0b85a97d-499c434ba2fmr3395414f8f.2.1794390222924;
        Wed, 11 Nov 2026 01:43:42 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860::e1d1:d182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm10200316f8f.44.2026.11.11.01.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:43:42 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Wed, 11 Nov 2026 10:43:18 +0100
Subject: [PATCH] drm/imagination: drop redundant zeroing of new GEM objects
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALU49GoC/yXMQQ6CMBBA0auQWTtJiykCVzEuoB3rmNg2UyWEh
 rtTdfkW/xfIJEwZxqaA0MKZY6jQpwbsYwqekF01tKrttFYG0yLo6YVOYsKNJHLw2F2sHfpzryZ
 joKZJ6M7rb3u9/Z0/85Ps+/uCfT8AnEw+4HgAAAA=
X-Change-ID: 20261105-pvr-gem-drop-zeroing-67cc98380a55
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794390222; l=3784;
 i=glaroque@baylibre.com; s=20261019; h=from:subject:message-id;
 bh=5J7YBCe5j9+nwpij7d9ckYkfgn/eiOZ+W8MPorbIWNA=;
 b=jXV9kmOq6eP63sQqsQoSW70q6JsnWFoM+OGtbLmsKdJIx9xdThIWLdwEkoqj7cAiAG6LXxJ1/
 9vYT5k+p7oCB3KHyclIJ9uTuCM3bYzvi0nDgdTajHlv36UlUxr7laUQ
X-Developer-Key: i=glaroque@baylibre.com; a=ed25519;
 pk=nMpSg4NT6M6q143E089emouMc+MXpHO9CWmnEUfjhjI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_014345_574080_883951E0 
X-CRM114-Status: GOOD (  14.53  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pvr_gem_object_create() clears every new object through a CPU mapping
so that userspace never sees data left by a previous owner of the
pages [1]. shmem already guarantees that: it clears each page it
allocates, and the dma_sync_sgtable_for_device() call that follows
makes those zeroes visible to the GPU. The second pass, write-combined
on non-coherent devices, only adds latency.

Link: https://lore.kernel.org/dd2ceacc-f59b-9c3c-e4ce-30b3bbd6939b@mailbox.org [1]
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
pvr_gem_object_create() clears every new object through a CPU mapping,
on top of the zeroing shmem already does. Dropping that pass speeds up
object creation, most visibly where it goes through a write-combined
mapping on a non-coherent platform.

Testing: drm-misc-next (41ecf852c073) with a Debian rootfs, on a TI
J722S EVM (BXS-4-64, arm64) and a SpacemiT K3 Pico-ITX (BXM-4-64,
riscv64). The K3 also needs local patches that are not upstream yet:
its GPU DT node, an RPMI power domain fix for its firmware and BVNC
36.56.104.183. Each board ran two small test programs, once without and
once with the patch:

- The first one only uses the powervr DRM ioctls. It fills 250 objects
  with a pattern through their CPU mapping, frees them, creates new
  objects of the same size and checks they read back as zero. It also
  times DRM_IOCTL_PVR_CREATE_BO. Result, without -> with the patch:
    J722S: 0 -> 0 non-zero bytes, 16 MiB object in 20.6 -> 17.4 ms
    K3:    0 -> 0 non-zero bytes, 16 MiB object in 41.6 ->  9.2 ms

- The second one does the same check through Mesa's Vulkan driver,
  and also reads the new memory from the GPU: the GPU copies it into a
  buffer that the CPU then checks. 80 allocations, on the J722S only, as
  Mesa is not built on the K3 yet. Result: 0 non-zero bytes without and
  with the patch.

The test programs were written and run with the help of an LLM.
---
 drivers/gpu/drm/imagination/pvr_gem.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
index d8660d6a8e01..01b8e08d12f0 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.c
+++ b/drivers/gpu/drm/imagination/pvr_gem.c
@@ -275,34 +275,6 @@ pvr_gem_object_vunmap(struct pvr_gem_object *pvr_obj)
 	dma_resv_unlock(obj->resv);
 }
 
-/**
- * pvr_gem_object_zero() - Zeroes the physical memory behind an object.
- * @pvr_obj: Target PowerVR GEM object.
- *
- * Return:
- *  * 0 on success, or
- *  * Any error encountered while attempting to map @pvr_obj to the CPU (see
- *    pvr_gem_object_vmap()).
- */
-static int
-pvr_gem_object_zero(struct pvr_gem_object *pvr_obj)
-{
-	void *cpu_ptr;
-
-	cpu_ptr = pvr_gem_object_vmap(pvr_obj);
-	if (IS_ERR(cpu_ptr))
-		return PTR_ERR(cpu_ptr);
-
-	memset(cpu_ptr, 0, pvr_gem_object_size(pvr_obj));
-
-	/* Make sure the zero-ing is done before vumap-ing the object. */
-	wmb();
-
-	pvr_gem_object_vunmap(pvr_obj);
-
-	return 0;
-}
-
 /**
  * pvr_gem_create_object() - Allocate and pre-initializes a pvr_gem_object
  * @drm_dev: DRM device creating this object.
@@ -378,12 +350,6 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 
 	dma_sync_sgtable_for_device(drm_dev->dev, sgt, DMA_BIDIRECTIONAL);
 
-	/*
-	 * Do this last because pvr_gem_object_zero() requires a fully
-	 * configured instance of struct pvr_gem_object.
-	 */
-	pvr_gem_object_zero(pvr_obj);
-
 	return pvr_obj;
 
 err_shmem_object_free:

---
base-commit: 41b5458595c60143d0ebaa1e032c9cda5d764dff
change-id: 20261105-pvr-gem-drop-zeroing-67cc98380a55

Best regards,
--  
Guillaume La Roque <glaroque@baylibre.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
