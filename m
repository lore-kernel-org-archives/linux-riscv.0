Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C16C5DF85
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aENM2ejIMVcj4N8WjuNWGNo3WFCI/GyR7/s1WhfOQ2Q=; b=M5mZKuJQEjCxBf
	H9Wl3MOp2WeNKZJ2W81YKB88lpTy1lqtiFvfv1XTxyEz//R7xUlv7EEnxjxvNn+mtECEL0zBxWKLi
	0EzXZ7Z6lmEjfllpqFASM+ftAfZIRfyRQHdkbnoNfIFjIyUJyjSkHLVCL98/VOFA42Rpa4cMOdUQa
	Y15YEwpRBpD/4pujl6vF3kCMxWGLVEAu6domnw537kZPBDnWhVf8CA5wZ1Y6JDnQEMboYuyY1O/0j
	YfrYQpRKQlTsXEPtLsPQAUI3ehHcpRnS2p87Ms4J6khPbafBqs/VwsdAIWkQermj/bK+zoX+WSHdm
	Uwm/mm6XCBF3FeobAfuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkOM-0000000AJ1p-06HM;
	Wed, 19 Aug 2026 17:47:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkOI-0000000AIxx-1v42
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 17:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787161673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsYxExfrI1OgfgUtsxz2vPPCZHiFnpZ/4W9NF1DJIH8=;
	b=LBZpDSsGenTXo8/UrP1d6YQu3hgcvau97vbmpDbPODspBJE/JJNHLveG8JlmltEhCnjywn
	e9tXT8A+ZBcm1a2R4t8g/Ja3SjzHDB+9IoMmIWV2P1lwJkhJAAoZhYdc//FBBLrLlFDiaL
	D4iH7XtLf4eAe4SufyW+7KAwaVestlk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-NC6YtTgsNk6WK4k6a4sFUQ-1; Wed, 19 Aug 2026 13:47:52 -0400
X-MC-Unique: NC6YtTgsNk6WK4k6a4sFUQ-1
X-Mimecast-MFC-AGG-ID: NC6YtTgsNk6WK4k6a4sFUQ_1787161671
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1771880a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 10:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161671; x=1787766471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsYxExfrI1OgfgUtsxz2vPPCZHiFnpZ/4W9NF1DJIH8=;
        b=WfIWA7344bmL2X8aMhAOZhNpoU5vi5NPPJh+6TmQFmPuStfwmkcpOEpC1BnFXcq5jc
         Ew9I3KU7Jy1WeDd/vhruvNyzmyBNUPjmV7Mmb5Tg4c0PoLobmBmtTKt1BRZ7OKNi4oGP
         RGn3b+O/0h6rc5faTrXzV5PiTvaw10hTZzM/ivhzD6s8v7o9enBn2RvvBWCfp48WwpsP
         1jdVc/ufOjAUggrUEB1nGQV+XYVEPXt/ZjKT3OPjr69Qeelndqp8waJ7RIIcxz9QQmUD
         oyhX4ftloWkTRbk0Ji/hg39u++NA4YjTKrwUpsW2HnJ95DzeX8ujRZbobWaLKuwO4HaI
         wThg==
X-Forwarded-Encrypted: i=1; AHgh+RrMKWdNTC256bdXqaH3b08KusRrTIlFIyhltNG174wsB4ji/yn4uCV2jiVu0sopGH9l0AhABd9sbXMgDg==@lists.infradead.org
X-Gm-Message-State: AFuF++mf8rIfQ7QdSBmlqiMw9RASWQvj78bx1ZQmAgnPX5EteUZGaxU4
	IMU6rt58GbQOW0XYL8Df/ms43vWuGih4XrJCFtktpQTV7qgmLY/toGvjW4STGWWpu5HyprGfSO/
	UMItapxxwOp0eTuT85s8LEYIlN8L5IPnwgWbz6wu6wUmpTUBBtoZ2jwyFz1LIeOfmRijhMQ==
X-Gm-Gg: AR+sD10cmpIiRGttNDRI4gG4Nqv/lzmjsRe9qMq7kYYs7yjd4rin2kBk4WGJQDZ0N2L
	oqweXRpsKxa7t28fbjrTvxFbzDdvqygBCcOk2qaYcW8jiWIryETHKoqaC88zCdIcflxEjucMl3V
	jN6Xi1N1LHBPZWp5d911Ys5LH7zok3vArUOVZ3v20lU6M/PhFjbScHuraEU4ml4Z3jeVTMhNfPz
	DbwMP/AC2ug1aJ6WAdAi8Bp9njj8xfSIVbi00saMbv2fP0CcvKH15elIyryi1hqszoFxTewjxPQ
	1KbMRhJm35rj9eP5db0sj/AftHR9P56qBCofCpbE6cqYR4vuJmLoBgLpFaj7ZCdV7IIIBVkEiL4
	UHwY3Qm9vz1QXDuM8CB450D1qZXJkj7XU
X-Received: by 2002:a17:90b:5105:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-39581070da4mr12374224a91.15.1787161671161;
        Wed, 19 Aug 2026 10:47:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5105:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-39581070da4mr12374130a91.15.1787161670669;
        Wed, 19 Aug 2026 10:47:50 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm3319861a91.4.2026.08.19.10.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:47:50 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Wed, 19 Aug 2026 23:17:23 +0530
Subject: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
MIME-Version: 1.0
Message-Id: <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
In-Reply-To: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>, 
 Philipp Rudo <prudo@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EAo-9yKM5_b_jTIOdI6PE6vJbwou_fitMmvPwQCXUPQ_1787161671
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_104754_574844_1831D157 
X-CRM114-Status: GOOD (  13.60  )
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

kexec_image_probe_default() overwrites ret with each loader's probe
return value and returns whatever the last loader returned when no
probe matches.  The error code reaching userspace depends on whichever
loader happens to be last in kexec_file_loaders[].

Only continue to the next loader when a probe returns -ENOEXEC.
Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
only when all loaders have been tried and none matched.

Suggested-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
---
 kernel/kexec_file.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..b3060e984ef3 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
 			      unsigned long buf_len)
 {
 	const struct kexec_file_ops * const *fops;
-	int ret = -ENOEXEC;
 
 	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
-		ret = (*fops)->probe(buf, buf_len);
-		if (!ret) {
+		int ret = (*fops)->probe(buf, buf_len);
+
+		if (ret == 0) {
 			image->fops = *fops;
-			return ret;
+			return 0;
 		}
+		if (ret != -ENOEXEC)
+			return ret;
 	}
 
-	return ret;
+	return -ENOEXEC;
 }
 
 static void *kexec_image_load_default(struct kimage *image)

-- 
Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
