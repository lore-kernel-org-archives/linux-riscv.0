Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B51606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dm+uS+Ui;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kFwnQ+kY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gvZQ0XDP0GAuBIHW/97Fvn8ZYdIWsR6FBl/vqSzRJdM=; b=dm+uS+UiZdvxfrn4WWT39xGYuH
	GWZ7Iry8eC7IO7Gpy9wtmNjgWtX8hquhYZiT9Wm0nos6H/zQu7MTqutTrTN6WA3FYBT2A61rWqFzY
	P7GkFMcmfLMdKL+Zfj5Z3W/licvktcYM/zEa/X+226FfCnTSuhTyqYHvnZryveRuW5ziAnc77oJyA
	TZl9vBFMz9EHyXa/+kcpT1sMWMtlbWsY/WwNjLtDcn99X47SrhkGtMJ78WhtGmJ5xG4mCn9KJaXat
	mqouiNFC/fMZX2ASEepUs4+Nsv/DvEHsiS9LVRtd/FTeTheBitZVMmjWWTleK4EDlgumlzXiAlMyZ
	F++zDFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGzp-0000000AlpE-0oDW;
	Wed, 25 Nov 2026 17:41:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGzl-0000000Almd-3dJl
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 17:41:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48e47347279so3682337f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 09:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795628483; x=1796233283; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1nnKgUnH41uFpzvbt0vDxC4+ZynO+VhngeTfrBlQfrc=;
        b=kFwnQ+kYtr6NPS8Iwsn1JUjgZ2l5VXrjIAsZwsHNAYtgqwwpwizIvD4nLWqc6iSnwD
         vcIBM911vcACUmFgktTjM+DHeTfSfAULW4TFk+00Rn4gyrtm83pTY8A9W/f8hZFL2UyM
         BmAhTTPv+FDCExM5/i1eQzRJMuXenDpd0hRJrB5uRR4bWGvXwaZAje/B1EEEVv9Hzaic
         iMYvKnQphJfS6qNGJySqRX84npODg+F/daKpCjUWpM8sf+2nRvJBZTkybU3wBaT/o1eP
         QlIHx/vuVJ4xVnluCxygTzUHVBu8uRFdbn1VBBNY0/ZnDKNytQxSh6WX6wHSMwjkZ4E/
         PG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795628483; x=1796233283;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1nnKgUnH41uFpzvbt0vDxC4+ZynO+VhngeTfrBlQfrc=;
        b=uNsUD9YP3v8I0OOMgJPhj9iCEqBQi0aMdCzq9GLRdUxoWuq/i8s07kpE2T7+GWDkY8
         JsMtIAJowtjyxoI/yRImW5eDY7elrfF3gsTmnSEauQJIVwvxS4A4XjR2Pt5a2oyk8fkK
         cIaY6dhyc5evAWhF/Ea8MlCDOs+6XqL2UXPlYc/AWz0ueQl8R+fV6oiFBhP0q73q38ua
         h5f+4tC8MMinhIsMmb8RybbtlJwK/ssNsAIVXlNwwkPXRTmJ1eTRwKRv8nsphOmHkf6C
         4zd1EQC61zaiTx7T94PDEkhvXE97cTJn68//mclFfonfZQ8Q0MkiZjiVgq6C6OxOjh3x
         0TbA==
X-Forwarded-Encrypted: i=1; AL+hErEbonfDrLEIDu3bJ0C/ZuIK9b9VsvbsVOikuPvKY1lFCgQ+ZvSbeXkQO0FWMy13sw2uZxXDWttTc8kJGQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z89/9iwikOC6OA+pFlYQP+o+9JAbVGQ5AKzjj1E8ErqcbOZu1WH
	EVlcM+JiUACoc99nFMgDJ5ehhxpILkEsNR6KoYJ4vigUemMEdkjC6IAqOYUe9y1G9lo=
X-Gm-Gg: AZFdTZc2gaXf5hKa65ttkJRbZ33ncG6HNroyGRY54wwn6zM8EtgPT2UpawhjfY7z1ti
	LwK8yTFvWooUPCkJj+j/00e+TQW0qNqdLFPQco0jDmHdPx7I55vMSAtNsSYpnDhYsWq+ODp5aKd
	vCMwzu9ao629FDoPtEBCa11IV2cszyR4qsbh0ZKaRdlreD3uUDXKpV+Twd52HwHrXSeIaK0on2B
	1cOfhQoNbDU4s5f44cL7vZ5OopQWuWWdqpqLGMmtCaPZTBAXTOldKDAS4FSYKKw0OgWj6BXhe24
	COVQ4p3/t2MX0BfeSGnopB67dONGmJJYIiZI7XrufNU/RIRwh94XkL2rO4+V1WInMmyt53aw2NY
	4YPdHhSg4xfCrfF2Tu+kzkageQq3Wi8xSnXqG2I97trJDpff6tsPQKMnBcaR0PPyIxJwcsdWgyE
	3KHVcHiniE7/is9P34oN5+Z9blndm6ilK67ynf5G9VTYTvqpENsjrE7iJaDLCHCJuj1vHOJMgVC
	DNWXq0c0n0Ef1s/YupWl13yOMjcB0Qa3oamCzv99isWqJvTXnmLm+WaD4gva87Cfb5EvWXNAhOz
	etHQM4geVZxuaKVScXVkx4CSO89v3fB1OE/fYAagnE3bfhhTlL4=
X-Received: by 2002:a05:6000:26c1:b0:48e:5e20:1371 with SMTP id ffacd0b85a97d-4abacfea2c9mr39664160f8f.4.1795628483517;
        Wed, 25 Nov 2026 09:41:23 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860::e1d1:d182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm29045574f8f.35.2026.11.25.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:41:23 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Wed, 25 Nov 2026 18:41:21 +0100
Subject: [PATCH v2] drm/imagination: drop redundant zeroing of new GEM
 objects
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-pvr-gem-drop-zeroing-v2-1-8453a6e01e81@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMAdB2sC/22NQQ6CMBBFr0K6dkxbUkBX3sOwgDLCGKHNFBuRc
 HcBXbp8yf/vzSIgEwZxTmbBGCmQG1bQh0TYrhpaBGpWFlrqTClpwEeGFnto2Hl4IzsaWshya09
 FWsjKGLFePeONXrv2Wn45POs72nFzbYuOwuh42rtRbbtfQqn/iahAgW5srk1hcmnSS11ND6oZj
 9b1olyW5QP60/C9zQAAAA==
X-Change-ID: 20261105-pvr-gem-drop-zeroing-67cc98380a55
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Gyeyoung Baek <gye976@gmail.com>, imagination@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795628482; l=4827;
 i=glaroque@baylibre.com; s=20261019; h=from:subject:message-id;
 bh=DuC/rcDE0nO1yX+mV/jpSJ2uisVnTsIi/oVFyc2tvyU=;
 b=2OPnmGyv44yjEbLHE2Ux0WaGPr+//BLm4J7wjSfmmWOqo17l0TXEWztLeG/E5yb7e1O0OEww9
 c3R7pVwRhBSAEXCtQaf4Jmxkp026q3CLRsmsg2A9GqP3f9pt4eRPxFH
X-Developer-Key: i=glaroque@baylibre.com; a=ed25519;
 pk=nMpSg4NT6M6q143E089emouMc+MXpHO9CWmnEUfjhjI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_094126_058633_1AA0FC17 
X-CRM114-Status: GOOD (  16.81  )
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
pages [1]. Those pages are already zeroed by shmem.

Each object is backed by a new shmem file, for which
__shmem_file_setup() only sets the size, and its pages are allocated
through:

  drm_gem_shmem_get_pages_sgt()
    drm_gem_shmem_get_pages_sgt_locked()
      drm_gem_shmem_get_pages_locked()
        drm_gem_get_pages()
          shmem_read_folio_gfp()
            shmem_get_folio_gfp(..., SGP_CACHE, ...)

A newly allocated folio is not uptodate, so shmem_get_folio_gfp() clears
it with clear_highpage() before marking it uptodate; only SGP_WRITE
skips this, leaving the folio to be filled by the write. panfrost and
panthor already rely on this too and never clear new objects.

The dma_sync_sgtable_for_device() call that follows makes those zeroes
visible to the GPU. The second pass, write-combined on non-coherent
devices, only adds latency.

Link: https://lore.kernel.org/dd2ceacc-f59b-9c3c-e4ce-30b3bbd6939b@mailbox.org [1]
Tested-by: Gyeyoung Baek <gye976@gmail.com>
Reviewed-by: Gyeyoung Baek <gye976@gmail.com>
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
Changes in v2:
- Commit message: show the call chain through which shmem zeroes the
  pages and explain why this can be relied on (Gyeyoung Baek).
- Add Tested-by and Reviewed-by from Gyeyoung Baek.
- No code change.
- Link to v1: https://patch.msgid.link/20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com
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
