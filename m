Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78317F55113
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2026 23:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MM3N+lFqLWSmTvmy8fKiJJCSF+oR7ivbfS8w64toMkU=; b=gCm85OxMw0zMA7
	WUOQhy7rf1UTGb7xvBIaffmywUzV0rlPEDKPPt0zQY+vC/4HHlqQVYIT+C4BEOm1Xp40oEvw+Z42U
	xgcghbTwx6qeGikN76olkRtx4Pg83cYvNfBb1hcbQnUuio1xQ06JA0uJrOQeqDSmNg/zNpf2UIg10
	rgdlWQtxLZvV+hBrEIaF6RyW2NpLmqU5hZ1YoyyFueXWWtVylDEpH/jnzBsOPPePHHA0+grMxMMaT
	qpavdkQRlvvCX3OzukNj7M4TM7sU3aFCv9Xyjsg8ODfscVhpoqdZHiCrlE2FwpCTee1IkMuZ38WsO
	1BXpsRlB/uYZ3GTk0Rzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz1Kf-00000005a82-1m13;
	Sat, 07 Mar 2026 23:45:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz1Kc-00000005a7Q-3rrB
	for linux-riscv@lists.infradead.org;
	Sat, 07 Mar 2026 23:45:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso92683465e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Mar 2026 15:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772927112; x=1773531912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjRKrJQ2J/VDkoqe2xizeTmn4PJSWMUuw8x/Xk5UYBU=;
        b=j9O/7orSAVIP0XJojifOa8DdTwd9dZaD5RXvBShThuTHCquMDvwRYGRXyZoYyDjtVT
         ZNBZdYVc/NUdvl/y4GsjGM9Z9MTVKebTUSamCALoq/oOuCotWnpBHl4433hFow9TEE5C
         WRnD/WRnhjQTNWcKU7jwFkkMDykpgi4cueMMXzxl1BQuAP7Q+of+He+JK+hhf9av/sPi
         CyEGxRK2LHQDtZunagz4JG4KOIi8hlpG22VCuBr17rxDsaVRWD92XB3q+HGYaItpA3Oa
         xkplrMWWs395IwvcU6ju6Da+RQnaRsyE+xJBM+ZMrq2M3y4nWX3DyMoYPze3dYbpvL37
         SDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772927112; x=1773531912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjRKrJQ2J/VDkoqe2xizeTmn4PJSWMUuw8x/Xk5UYBU=;
        b=qA+Q0M2GuN9QkDUWk+4/yha6X4RsXAmiRsK2s2ZE4xpmuK5sKgjv+0JP4Z8ZBF93OU
         SIsxEOunGVZ9rWye+bXC4EQNZaoPwYuaM4loVRtmxie7iumV5SdEUZHFCPXjwSNa6CF4
         yv02NrTuzCttAuwEif2iFAewXKvEAiKtbgNXUtCplLRxcDO1O7p7q6BF7nTFen+36EaV
         /uBVLItEQrbOSJPNKst1Js0D3TeTCWJqzDXa/pRYRkYAxBvOafvJzfUTzjIVpD/M8/bN
         LpcwaEQ2fQg3WsHMTat4Z7ywA4O+2qy8VrZGKso8Ex5KD4yU548mvlcKAP9wrTE6nWKg
         gsaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1w5hqWEGF6EVRE2NPEB3YQOrGbLL/8GcsmJPpq5HKU0zEHC8TMLhbkeIJYIDd4AZjb79Xcc6TNOiJtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Lud8MJDwcb7d2X9Eijj792y3bjAk4BxqR8PRuOUJ7FL2jLu3
	IaUwwwl0poYP7JfC1Ap/283YwqPo4GXmYxnCOZ2S3RNETm21EbjGWEdg
X-Gm-Gg: ATEYQzwaP54jk7CbRcHiJA6cGlLG8dOWeHHUhDB1LC3ygr74aKZ4bwFGE+Fl7VWMCPQ
	V+7Zbk3U8f4JpVZ3RxGMlHEW14vhxjXdYNxH6RSkm3zK0BLvRdbBSxyvnOiDWnJ3RWIVXajWx7i
	kiBXL5p0BhLreda8VQnUcjAavielAQvKV/CS771iVEBV66Z0BfHFFve4RW2Px3N7DneNoaFzMxU
	QwXB5waCr61mXTWHLZttZuYS8A+eCIGSMy6+wNt9kgj7JezkCddfOeDHE+7+QerOGl7IkfcyMWC
	CGkSbNNC32NNaL+7XauaCMKthxYvPlq4LYWRVl9PI+7lbjpqWZJRvqd4S8Bdjb0IUhcew0HurQ5
	kRHj8mlZ6SDQDIp0aaZQWpbQfeovp+Wt6ny2zJlBfFfJCtt52u1DKFOwsePqp3JywKdQkteV+ej
	PY7nvg3/2vmeXpCo5kiNvtJaDecVXY+xb2llnwvNggvrOZ3M6zR8fqUwMqnB8j
X-Received: by 2002:a05:600c:1e88:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-4852690f599mr132855755e9.7.1772927112391;
        Sat, 07 Mar 2026 15:45:12 -0800 (PST)
Received: from osama.. ([156.223.176.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485247029a4sm49900895e9.26.2026.03.07.15.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 15:45:11 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
Date: Sun,  8 Mar 2026 00:43:54 +0100
Message-ID: <20260307234355.69831-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_154514_988510_AAD0EEC2 
X-CRM114-Status: UNSURE (   9.27  )
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

When saddr_high != 0 on RV32, the goto out was unconditional, causing
valid 64-bit addresses to be rejected. Only goto out when the address
is invalid (64-bit host with saddr_high != 0).

Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 4d8d5e9aa53d..045099ca904b 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -425,9 +425,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	if (saddr_high != 0) {
 		if (IS_ENABLED(CONFIG_32BIT))
 			saddr |= ((gpa_t)saddr_high << 32);
-		else
+		else {
 			sbiret = SBI_ERR_INVALID_ADDRESS;
-		goto out;
+			goto out;
+		}
 	}
 
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
