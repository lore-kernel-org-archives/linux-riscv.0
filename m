Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C24ACD8CB2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8hbkKVwuB0XNBbFVuMuPslAfgrOWa5R5XSPJTRZ1EAY=; b=YfPbFUgxUqIjPC
	zBPBV+bfHThDrfjCSZmNRxgSKaAqzxwlfrYSMP1Ov5B8oi0ThfkMKZ8bZHxbnjJXjk5rC8AOp1Nbw
	t9ZnQ3SF+uodd9MlzIO2Rz+0CxtZlEqOTG7gmcDCEOJLqkNPOhR1ggtq073S10pG8xT1JNus2SM3a
	Yfs9WwIlzgwVNHfRwvO1FWQ7BAo9dlUKP7QkktqYsSRdH45MoSoHzE3YEFXV8EVb3BiAx7aXDWCZZ
	bv9qY8IwGzCGtLuNRRzASUCSOnLfLt6KOoybFa9gVwcoO6e8wx7BzkG2/0pe6A1RfUuUj7tRtuioX
	tXlcGh/+5g5WFjTqR4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1Ob-00000006DGs-30Zk;
	Tue, 09 Jun 2026 18:41:53 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1OW-00000006DGK-0wpS
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 18:41:52 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-304fb780deaso5904684eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 11:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=junsun-net.20251104.gappssmtp.com; s=20251104; t=1781030507; x=1781635307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=svVdFo+VBneQiu6Hf1cshJZ8gqHDIg8F9rEgXqNGdXY=;
        b=hqW+11fWa3kUh2SZJxuH6PqJz3OZqHBpItfCGVL/FO4iCasL7TOkV6lyFMGpY/ljFC
         di5bLClBRvxgpVz/g6/vXI3K4wPbQ4RhV75KqU/QbS7ljcbAzOwuDXBiuSli7q0tvLWF
         SBxqT9ZwTiD8h8W4LobvOk+6x8kwjsE/xKAkFdFrW8l7TR6OqRW5MrBRoIJ5A8/opeIS
         /hE9GvoA/EL/EduCYzPI8LF2xKbf4tQGi7Mr2Jnns/J56+s79434Ca1UjGjhAOXatgSf
         gSXOmZ9dqFL/8bKRB+gnsECTWY1kJZ5XlbLR/6ypmSHZD8tZl/aA6QTWUft6kwXkqMFz
         vI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030507; x=1781635307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svVdFo+VBneQiu6Hf1cshJZ8gqHDIg8F9rEgXqNGdXY=;
        b=FcuEV+fCwrKwUPH+0vY3R8iOJ1lDfWSAr4bRsDQlirpgYAlBccJY+IHv7KN6rRk2GC
         oY4dVfo2Wx92/kumOlqam294KJ1X1lDAV9IwM+6uI16hd3tGpkn+qxu19BLvpwUtx8qv
         IF1mKrv+Z5mS29xfzp2eGbZKEb05pcS1jhCGrzBDQs7QkBPjXQGnqjhTOuWgOu37QX7p
         t1+KljCFALsBE8sYWTz8qCaEq24tzNXq/cd9yVmgtfi4FShwaeiuhEgnNurP1xjh35TG
         l/U37L5CkV5pL1h/94yvS/q60Xpny/IGegkLLwpCAocrHckJETy1PHVQvLyxWapBUFqR
         a+Tg==
X-Gm-Message-State: AOJu0Yxg8HfqKlVkE1LAoNQrxaNjY8oK3xzrBY4ES3felphc5OVdmE8S
	6r9fDcZP+6lTroXv5A/ABAgeyQeoSfTV09sPg7eWCeMzGBpuvhHowuq1N5VMuxHIvZchPOgWuy0
	CeYBlsA==
X-Gm-Gg: Acq92OFUeZtSVlCksWy/iYyL1rjzo0iYFQMLnJuDlcjUzJvrOguFocN6F2N+QgXMekq
	lQ7hcohj2118CusJy5iZL/BXsA3NwRzsSthwyIendoqn+QDbzcNQjcGnj433NgeXCWkRvgrbhay
	G8H8q1yY/SjmWt2YYOe6bCPulEWsMNEjrVJSx2RsP7rua2NfhHfI+w6lvIaAZrTC2VX/Zr4zZmv
	byWWhT0THhuPKNHi57sbwQbIJxT0Bx5R067iUmqVVMdFfAhAgPuJIibrGc9kayaE8nHzcGDrvjU
	uC0BkduPC4uQm93kiHJPtRJI5xBxEqS5R/QwF8Ac5T2zoVpE2yhCKzuDimkihG967Ms6C0U+VXs
	ZkUWtbiBWwWrbXMp79IMzc6dtj1H0CH0aGYyASScIYJxoJkdTcY5Cp+FIa7Y32cyQ1yuBzpgTFp
	TwcrrkD7q/MmX0rrAfXwRyYYWsC0TBP8M4WOV7dFYfe1h5E9/YKpYA2LkVKkpk3DWnmcvDTe12/
	KfUuPZpe7caBW9T9Kwyd0OD
X-Received: by 2002:a05:7301:5f09:b0:2f3:c3d4:382f with SMTP id 5a478bee46e88-3077af4b038mr13583615eec.8.1781030507248;
        Tue, 09 Jun 2026 11:41:47 -0700 (PDT)
Received: from ThinkPad-T14s.localdomain (c-174-160-255-66.hsd1.ca.comcast.net. [174.160.255.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db5610esm22145709eec.4.2026.06.09.11.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:41:46 -0700 (PDT)
From: Jun Sun <jsun@junsun.net>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	junyan.lin@spacemit.com
Subject: [PATCH] KVM: aia: skip silicon ID cap in EMUL mode
Date: Tue,  9 Jun 2026 11:41:42 -0700
Message-Id: <20260609184142.42125-1-jsun@junsun.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_114149_401110_CA988494 
X-CRM114-Status: GOOD (  10.75  )
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

EMUL mode uses swfile MRIF in software, not the silicon vsfile, so
the per-vsfile ID limit (kvm_riscv_aia_max_ids) shouldn't gate
the maximum IDs userspace can request. Allow up to KVM_DEV_RISCV_AIA_IDS_MAX
in EMUL mode; HWACCEL/AUTO still enforce the silicon cap.
---
 arch/riscv/kvm/aia_device.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index b195a93add1c..575f860e1dad 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -82,8 +82,16 @@ static int aia_config(struct kvm *kvm, unsigned long type,
 			if ((*nr < KVM_DEV_RISCV_AIA_IDS_MIN) ||
 			    (*nr >= KVM_DEV_RISCV_AIA_IDS_MAX) ||
 			    ((*nr & KVM_DEV_RISCV_AIA_IDS_MIN) !=
-			     KVM_DEV_RISCV_AIA_IDS_MIN) ||
-			    (kvm_riscv_aia_max_ids <= *nr))
+			     KVM_DEV_RISCV_AIA_IDS_MIN))
+				return -EINVAL;
+			/*
+			 * kvm_riscv_aia_max_ids reflects the per-vsfile
+			 * silicon limit, which only applies in HWACCEL
+			 * mode.  EMUL uses swfile, and AUTO is reconciled
+			 * later during init, so neither gates here.
+			 */
+			if (aia->mode == KVM_DEV_RISCV_AIA_MODE_HWACCEL &&
+			    kvm_riscv_aia_max_ids <= *nr)
 				return -EINVAL;
 			aia->nr_ids = *nr;
 		} else
@@ -91,8 +99,15 @@ static int aia_config(struct kvm *kvm, unsigned long type,
 		break;
 	case KVM_DEV_RISCV_AIA_CONFIG_SRCS:
 		if (write) {
-			if ((*nr >= KVM_DEV_RISCV_AIA_SRCS_MAX) ||
-			    (*nr >= kvm_riscv_aia_max_ids))
+			if (*nr >= KVM_DEV_RISCV_AIA_SRCS_MAX)
+				return -EINVAL;
+			/*
+			 * Same rationale as CONFIG_IDS: the silicon
+			 * per-vsfile cap only applies in HWACCEL mode.
+			 * EMUL uses swfile; AUTO is reconciled at init.
+			 */
+			if (aia->mode == KVM_DEV_RISCV_AIA_MODE_HWACCEL &&
+			    *nr >= kvm_riscv_aia_max_ids)
 				return -EINVAL;
 			aia->nr_sources = *nr;
 		} else
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
