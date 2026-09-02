Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68052C61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 06:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g8E5cG4Yw+1MfBT0ffSfadp/NNDrF4i3AfeIvICT4P0=; b=2KXTm1sWfp3yqv
	4JyyMlvWSJD1NuhofDYWpKisL621X1fjZQTMUqzZO1HOAKkXC4KTHsO2x0M65RjJbvC/pj6Egy+6e
	QAH1pJ3gm7d3koriL7M8AFLkn3kyoHwj8VC/E/4eE7IUgNPiDf366luM24pSxz0FR3qEphGEQIkiz
	Tj9q9yirC5wObvDV8dVVO+MKJRbCfJRD2azqf/TjJv3T2sJIkLja4TUvr3HA1m2E+mBPZ6a0f+ipS
	6c29FW/hHi/8GA0tP4DGXJQjx7pvQc/Lo4zeG/cZD6wuMWuiuoKLA6frJGGjMtZDs+ThDAWaa7NCF
	Csb3bkjZNIErmYlrsGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eFe-0000000DqNK-3ciQ;
	Wed, 02 Sep 2026 06:15:14 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eFc-0000000DqMT-2cUw
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 06:15:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so5701345ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2026 23:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788329711; x=1788934511; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eu4ymMPYKZBtIpuaapdXbFgIh8ENIgqZKDyMhyBzO+s=;
        b=Vt5S7tvudDny++iitXx/il1bthyzI+/7dM3fpRCwKQrFGxz9i8RVor68ognzN3VBNo
         dIVRW6lZ3JXmLq8fHgA0FQ+2QknmxSQ7BghdujDT/KFKum5Of3iZR9wBP1tg0QEXSnfj
         WL7NvU0hT2u3EMAe4dY0BVyvUCG5cuocd2gZ0JVRtEnK0pXus3KyYbvKYRQc4Ix9FXu0
         eVLHEyPcCZyZotaJ4i+akT25PMAJXx0NE3AufUDh5Opj00O/FDFbOd/FLJxDFgrY7t1O
         K8GT9ni+/spfKO0+tlaWx7iRkLJKeamgVNkeSh9/b+gWYvk8olEbDMZiA8YPwzN7tInp
         nPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329711; x=1788934511;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eu4ymMPYKZBtIpuaapdXbFgIh8ENIgqZKDyMhyBzO+s=;
        b=KI050m1rOJjD8pn+skoAUAhiPgnUGR5E5qCERFVSc1vnmzduon27175R+yTwZccVPL
         DVZfYzSLOIGVxhbtMJy4f1oCVSK4okAsv8LefqmunNcJA2Z/EzVGzUVKY7nX7Kk+JBxx
         w0KilLhZ0x12hGpmlfG7hdgS+v/hBmOXCScW0WnlwyAv6YDwvJOT4OXZlMgBotKn9pZ7
         9p9K1YnGvMFSgXS+QD+8l2sdLa7wKWZVI3Zwud3JB5eF1FFvNAol9mFoFk1I4ViBqc7K
         PMV4pDO8FawQtiDt+Oa1tf53bH6dEf53sbpeTsoHfPzl07Tr5zRtMOrxk0S7kC8DhwZA
         J6Tg==
X-Forwarded-Encrypted: i=1; AKwUvBxFFTbcTiy61HcusNgR2QdfqSaHsf3hNkyEJg/6TbX5YqyLEtPa6GuqXQBkylkeB0YF1lMekcMdMj1WFg==@lists.infradead.org
X-Gm-Message-State: AFuF++k3l8rR8PGFnqMSO/CQS4POuesq3JzXBMsV36tmlRtaBeQYA7oz
	z5KLq8vcf54/ESLLqTajl1ugHgWYGgRtfzeONjmtuIGkBC33tPIY/sRjvSWMX7SOGgg=
X-Gm-Gg: AYBFou17wo4M5OX0AlPXHQqdBWIa6b1BVis+aGpvcmRMn45jlMWq5+dZzJSIWZum2v8
	Y6cqVWy1iTuhx1A3sLZw87lFY+3ht5j3qKIY7br0+DLQe4Dln49nkhc4yVtpN8dyvc9vA1S+ZHp
	cI7xoFTh8zhFxJfGc/R3jf57CwOrS6B49mdRGuLD7rHivC+aEYo1+1J72uPpaujztHp5A8QCcXy
	K/VgXjsk0ROEg5mpYT3j/yM76DmDkT2cxwYA3XvLqIIhYZIqOSBj+sRGeSLLjJ356BdDY3A8c5K
	oQjOc27HY+TxhI/IEExYAdLqf9tqwH5VJkRUDDtvMFFp1BFS701xZjnz0oUutSa+1OeOAmIngH0
	2Z1VFKIaK5ARJLEgBwzx+Suggk2UP/Q1uG7FXan0qW5T5evBrufr4HcmMQNCfTw8Bv4S1Fwyo3I
	04bModcnvpnC2GZ5PrSkTHNXv2fjThFnD7q64zgCRZLRBLG0Wnmjy6fUPcgSBpx3QDVWOMYMOYl
	rEsoSkZ
X-Received: by 2002:a17:902:e804:b0:2d1:134:b86e with SMTP id d9443c01a7336-2daec5ad579mr31546085ad.2.1788329711119;
        Tue, 01 Sep 2026 23:15:11 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f1f4fsm3462624eec.11.2026.09.01.23.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:15:10 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 01 Sep 2026 23:15:08 -0700
Subject: [PATCH] KVM: riscv: selftests: Disable vector extension in build
 flags
MIME-Version: 1.0
Message-Id: <20260901-kvm_kselftest_disable_v-v1-1-fe73aca5bf95@sifive.com>
X-B4-Tracking: v=1; b=H4sIAOu+l2oC/yXMQQqDMBBA0avIrBuIEST1KqWEjE7sqLUlE0NBv
 HvTunyL/3cQikwCXbVDpMzCr7WgvlTQP/w6kuKhGIw2rbZNreb8dLPQEhJJcgOLx4VcVqZBDB5
 bq68WSv2OFPjzP9/up2XDifr028FxfAF5qXhSewAAAA==
X-Change-ID: 20260831-kvm_kselftest_disable_v-23bbfab68098
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 anup@brainfault.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788329710; l=1384;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=UwOA8LjM0NSCFy3j2zt1k5HHkmtLxl/qmELRahsK2hE=;
 b=Wu6dcMEbHae6NcaOo3PXMhRBifeLnVbHpjN50VxkDCm33Rv81KHvvaw2L4qt/n0WHkwTsJNJs
 8+5SSom61XiCmQ1TrwA1tilfCToI+4AHBSI3tH+M6wUcvuvmXA6LVs3
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_231512_683534_0C69D1CC 
X-CRM114-Status: UNSURE (   7.99  )
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

Guest vCPUs never enable Vector state (sstatus.VS), so any vector
instruction traps as illegal. If the toolchain's default -march
includes the V extension, the compiler may auto-vectorize routines
like memset() into vector instructions, crashing guests.

Build with -march=rv64gc, probed the same way as x86's
-march=x86-64-v2, to ensure vector instructions are never emitted.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/Makefile.kvm | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 6fc34e9bf8e1..46c54948f4b1 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -297,6 +297,11 @@ CFLAGS += -I$(GEN_HDRS)
 $(GEN_HDRS): $(wildcard $(arm64_tools_dir)/*)
 	$(MAKE) -C $(arm64_tools_dir) OUTPUT=$(arm64_hdr_outdir)
 endif
+ifeq ($(ARCH),riscv)
+ifeq ($(shell echo "void foo(void) { }" | $(CC) -march=rv64gc -x c - -c -o /dev/null 2>/dev/null; echo "$$?"),0)
+	CFLAGS += -march=rv64gc
+endif
+endif
 
 no-pie-option := $(call try-run, echo 'int main(void) { return 0; }' | \
         $(CC) -Werror $(CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260831-kvm_kselftest_disable_v-23bbfab68098


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
