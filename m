Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E1DC88E53
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6rofy60e56wUffJAPJGfSz1BVxSXTY/BxpWKEVm2kGU=; b=LUD5Wc6xWKW1Qk
	9jwN3SFJqNhlLdL8xchKFb79/e4UXVlPnJraDUzRmnG41AONAtR6MLNfUXZr4/yFRDx1nbxbbnBQ9
	51ZZA7zsdXqhEK4VBvzlOYnTJCK859Z2XcjMFjaRlaufrWw1Ui9Zlv1c6x2vR+pTP0UJNZCvMI3P2
	fB+405aV+VilWQLHNif0IqBErBQFXdOdoSNkPAeEAk0ahHPoQlGaS1HDm7mUYWZCrW0TX5pfctFQC
	QhnXAR9PE6VPwVLrISX2WqM082zMqd5MZ+myuIVvKFEOwAKdTYw/yj1jutLU/1MfVzKueeTDKYrV5
	JcxYjQ7PKp35pmSFYUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55v0-0000000HQqp-3z5h;
	Fri, 11 Sep 2026 18:24:10 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55uy-0000000HQpx-0NJk
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 18:24:09 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-66fb2fa79f2so1034459d50.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 11:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789151046; x=1789755846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+c666fMy2AZu7HzCl7Eo7UKyZfRurMTIeiXyEZlr0Sg=;
        b=RD31Xk9UEAId2vMhg6tkqD1T18poW/HKfN7wszoSsraIfJc770Txz5rZ+JCSFrt0GV
         dZwpPcoGDbRtplKJH30lvCwlJDAm0sE7JVW2Gz4KtqpVYixBIGYWfF2Jc2+yK76u03W5
         skYLQvVUtr9CS3icnw4T3KL0rBgEnSp1haOfGJI3pzvG4S3z0c80I8upR2wgudkXVtQq
         dLcAe02ANJw0+HTCSpmlCBrgaksEnmbZKts3WZJBh07W1lkuvyiUnqZeyIkPWb6Dlny2
         v3Dajl22mWhT7CoJqlUV7i2C+fn9BlGAV4xrWGWps56FcL4Okid27Sfevd8JAmgeCSO3
         WI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151046; x=1789755846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+c666fMy2AZu7HzCl7Eo7UKyZfRurMTIeiXyEZlr0Sg=;
        b=Xb+sBMaGYVHOMNOo/NiT7/oceIBSmnobl6UJFEHqiRUO2De4xDS/q1EvegEwF/rqIa
         SevcWP6jHWwUs3dn12Rz9o0TzlMsCBA+HKE6GiuXGqiiQgIG+KXiR33pOg0DM2yuMRfS
         iUN01GfCj5fmg9OwHhsTD8cj92rsFyhGktD0/2Gy4YdwcVizMbgtpg3mSaLTJmks0qMF
         rA+x4ks7e60eVvNoOOyYCg23XfVvi1jhtCjoLE6mQ5uumeKv7Gg4lDvH7OA9ghjxdHtc
         CjsOfgBOjIRiMBJb+d/HeHYTtspGY6LS63qj5HuBitSqaQ4yi0/mLjSPY0+cOmAW7Lmr
         sgcw==
X-Forwarded-Encrypted: i=1; AKwUvBwrn3TKDKJJTCL9H+428thTwZcOttIqPRtFQBKRp+J4FJndr8ItDWerEZMm+zKEy8QK9ugutJ2AsBbuKA==@lists.infradead.org
X-Gm-Message-State: AFuF++nN2zXO1zgu5XI2HB+1nAJaZizIKfsV4K52JX2dkJ06c1XwrYx3
	dqvC4KVDCTTQjyBSyvja+bKBYidw2DBTJPCqlZx71wmRY0/IniP/OPfFNytPS73t9SY=
X-Gm-Gg: AYBFou0ysJwl5J3WHhEpjaE/IqOODhbmPvY3rf7rCszmzyPSdzgNW1RITPsIptMYHTH
	nvj8xlotC2QROE7jO9C7c1sGxpcg9PwNNkKoNTUuYgwPRZRZGQ3CVgyOJuU3E60zJsz4/ftQokE
	FVOCdrW6PNb+D3DremcDsZmDOw+Wcqin3VCLS8WbHGGvMrWnH5yGow1P8SfJI4urdRbb2/4fVNM
	obs6eyC+jp1m2ncOlT1A8wSaAh1id18rU+0PDB45SehkJbrTEMyNVYmEiN2F9Fl3PnVRdf2aKWf
	YqQTes2/jwbozIzCu5SgVdUbNlNiS4XKSfUdpVGVGPuNmm4VTTRs+belPUHoy+tPxojUw7LmDyH
	n48N2DUWf4KHxYQIWgYDnWvExVC3SXSdd10DH0Ml6g0/kmhj1y6r9x/kSinn2O75D3Yr+GTeIpe
	N2ZzyKhUIRudFH8fZZL6/2p/FUpO/ZRHYeX21NQeBYJAschfzIFLyularhPMqKX39NK4fjy6xLm
	sj68AcfrFNh5EKZbYUbD3Oc4Mb6HheFzXH6cEvkg8WydVrZ0E3eYaJV5K7fTbcOSrOq0n+T67sJ
	QSC1IG8ewgIlXmdlA8dFG8X34ZzU
X-Received: by 2002:a05:690e:d48:b0:66f:9743:7c28 with SMTP id 956f58d0204a3-671245e9f17mr1965637d50.45.1789151046253;
        Fri, 11 Sep 2026 11:24:06 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-671259a30b1sm1385517d50.0.2026.09.11.11.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:24:05 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v1 0/2] riscv: runtime enablement for native misaligned ucopy
Date: Fri, 11 Sep 2026 13:23:58 -0500
Message-ID: <20260911182402.1434257-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_112408_130947_369C0E41 
X-CRM114-Status: UNSURE (   6.37  )
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

This series is the continued series for commit b94cec5761d2 ("riscv:
skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS") that
makes the optimization available to distro kernels compiled without
NONPORTABLE config. Now, the kernel can skip the software aligning code
in ucopy after fast unaligned access is detected at runtime.

Andy Chiu (2):
  riscv: introduce assembly version of jump table
  riscv: optmize ucopy for has_fast_unaligned_accesses

 arch/riscv/include/asm/jump_label.h | 26 ++++++++++++
 arch/riscv/lib/uaccess.S            | 61 ++++++++++++++++-------------
 2 files changed, 60 insertions(+), 27 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
