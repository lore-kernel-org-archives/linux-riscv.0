Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0380BCD3423
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 04:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TwYKR3ldqmP0B7f2x7FbDnPwbBbaBqZDwxId6pc6Y8s=; b=YwG4F0fdD5vfHJ
	w+YwpjsLVpH6ONJndWVQ5EhzxwIMXf3sMrtMi/YqVClsnsdpLFTlG8r2UkQriDiIt0IiSRPvWGZdo
	xK3H5TOH9w/fEVIwqxdrn1a5BoFEx+1J7nUwbO25qNfHv2kDn94lMi/NVq7g/e2JlDCPLPxmvqDM7
	F5tJLuBaHKm4j6/9y46dbCbc/oyeqa0SxO7SCwBw1Motpd0bZT6074vsEE2Sk7CDap6hu5BGAsZHk
	AqpeeBtT1305A8OBkpW02x21gIRkVKgcdRgHcL0JNmQ04Av9ZAXmqZnmGzuQCB0fIFZTAeZf4yW65
	Yu6ghbd9sFd/SipmveOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJkUO-0000000CIFN-3zJR;
	Mon, 04 May 2026 04:01:01 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJkUK-0000000CIDu-1xG1
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 04:00:58 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-12c565dd3a7so7997416c88.1
        for <linux-riscv@lists.infradead.org>; Sun, 03 May 2026 21:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1777867255; x=1778472055; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGXGWwnAcL1bVeuWF2vhaOhBAT20XCLM8BlTLJN4/sY=;
        b=Ibxl/slyR/zGiD8YWPw3TNxyR8NIuCJ+Cyqfq0DpPUhCsR90a2Gb3ekI70wfc0Iym6
         cnmE0Ql374XJfXB0uQ2WMk3Tv+yb1rkn7Lt0qJwjtOUlDJ4kfBz+A/M6hHnARkoBpQwQ
         UkRwQ3BA+ArNRRq0t34MU+1Eu0CV6E91eaDgP3WXJhTenFNYhKb8sDP2itQ4IKDTuGUA
         stm1FeX6RvF2HHm49u7brm7IcESBExe26IdOYSIqzsokkakMXqIc/Agz6LaXYcCclhWC
         zm2FJlSQhe3urJtuXHSYD+lsPJNUDKQ3p+Zqi20PZRh15rpfmNEHjdS5NYdOa5gx+R2+
         mQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777867255; x=1778472055;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGXGWwnAcL1bVeuWF2vhaOhBAT20XCLM8BlTLJN4/sY=;
        b=VQ2jbOyZjxYPXm6sPKacZ+iahFh3tNMCFt2Vm7EjUKMqzu9MZaB4lZ9qq/uJjsFs1f
         wxPsu8TLqkEUIXbovCAMqOcZRJrdXxEQPEHKDlNDF4mgoZtgYuQ+/HfVco00Huywleyk
         rVy5AmATMuhdULSjHmp8jT8iPkPE8R5QqSGZFjiRD1MkQKFDPyofwtVr8AVjy+2FIUFe
         tZb/w2obSfPjzWnYOF7yEJr/7g+vwGA+XxJxohNd1AzstPlIAL70eM1nCx5Ju6UqWOuR
         MCSq8bBYlMyV8s8GhA/yAnA+5/6eoNuT5l88GcmMl45oyR2VA+nyiCiGVgRT7pql+5Qe
         5rXw==
X-Forwarded-Encrypted: i=1; AFNElJ8dqb/PAUWnhEvVNIK8cSLr2uqcI8Gafd1wR5+sh/t0W23BXSVbNbx3B3BqWbOunkz6/wbeLDqBYuyBmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVu95qjKWnsB+F/gS2kbaNGkoZ0iGwoZngxOdHE0thMGuCiNCS
	ObWa4r8kvyd7Q6rTj4xUu7nehjzWvQBcnPm3UioyE/j3A7p7DkcA78MmwQ5pOQGydu4=
X-Gm-Gg: AeBDieuXyIefkkLaDNQ5XQxgAsX4HFinFLTG52MIhRUL/VvNrXL0PgdNpPrLw0Umo41
	QAnrbLZ7qqBJUV3/AvNujlcmTltbiyXg0Z9HFn0pn7OoqFCGwwPocDlZPzGojw00wXut08PJbqY
	b32rQ4MFqKIVg32HdlzaHA3FhAFpSBBwMX7ShCkUkCbe2noqV3SQvNvLaUYc2yeOTsULyus+xke
	9TDhbguelcWOb5eejhk/cuZNoRO/cFDDrziSWCLsKgwSDlN8dma/lm/reCgPdoByfpA1NeueBhj
	b+0bJe2CnTFBxgzgZKSurLtVYO55FNJMPvd7xdZgouxBAvMWC5fesddz1+4WGUbXE092e6cOQYj
	51IPyGIxMXNUiTlxbqvhTJZoDkJrOjh/Z4oZngFegnWtnwWYDPRh+jk513O16YHZtYmQybS6GbD
	lwOs8tvO+P3ZeknQzB8vYHFW3O8Fol3+1Jc+UD3RwyZ8qhqM/uzQz+LA==
X-Received: by 2002:a05:7301:2c88:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-2efba28ad29mr3924066eec.28.1777867255328;
        Sun, 03 May 2026 21:00:55 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f28f7ba26dsm2234848eec.10.2026.05.03.21.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 21:00:54 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Sun, 03 May 2026 21:00:53 -0700
Subject: [PATCH] KVM: riscv: selftests: add check_supported_reg() into
 get-reg-list test
MIME-Version: 1.0
Message-Id: <20260503-kvm-get_reg_list-v1-1-c16f9b572e9f@sifive.com>
X-B4-Tracking: v=1; b=H4sIAPQZ+GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNj3eyyXN301JL4otT0+JzM4hJdgyQDE8NEI/O0JCNjJaC2gqLUtMw
 KsJHRsRB+cWlSVmpyCcgcpdpaAG7UtOd0AAAA
X-Change-ID: 20260503-kvm-get_reg_list-0b041a27fb23
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, greentime.hu@sifive.com, 
 vincent.chen@sifive.com, zong.li@sifive.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777867254; l=1079;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=Lf1TLdGVOJXUigkA8oRYy3fs6i47dPPa9PnAZKcPDvI=;
 b=7nvgTYMW+T1cvFZRFfiH/KnS/HC7BuQ8+FdcPWt561AW6wqKNZmoD7aVpWGYlNINN8J9EnBDm
 jS8diatltGDC0HtBVXq0RWanmKSTkPsmK9C0EPxYHOS5VJ6GKCdC5Xp
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_210057_338342_DDB09F17 
X-CRM114-Status: UNSURE (   7.98  )
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

Not all the registers in a sublist are supported on a platform, e.g. the
SUBLIST_SBI_FWFT list. Add the check_supported_reg() to remove the false
alarm of missing registers.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8d6b951434eb..d7cb9b5d37df 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -28,6 +28,18 @@ enum {
 
 static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
 
+bool check_supported_reg(struct kvm_vcpu *vcpu, __u64 reg)
+{
+	int ret;
+	u64 data;
+
+	ret = __vcpu_get_reg(vcpu, reg, &data);
+	if (ret < 0)
+		return false;
+
+	return true;
+}
+
 bool filter_reg(__u64 reg)
 {
 	switch (reg & ~REG_MASK) {

---
base-commit: ddbf9c76c4020bf63a0799b00faad40caa3de6c2
change-id: 20260503-kvm-get_reg_list-0b041a27fb23


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
