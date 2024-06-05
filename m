Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FB6C27C53
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5BQ3mKdlVqSaEsh4pdBHl8JAhT6LPt+N+Bdy8N+im0=; b=IpDbC5EMNMS967
	b7C0bBoOhySU+/Huzjyv92VHGEzOXkKjj2XBsXnS3Fr3WBrBJbFc94pPxwG94EGtvd/oze0Fymz8L
	WBmqq3L6sl7gqCZjLMoOq/YZqm4AZMa8W6XWUrGElbnS6Nhw6VYAPvPlSfBudN2tuxJ3C7+P3GZUr
	bBVU35se+21BirYmFbCw7oTAI1YSiVKlg2eKICMejNnqf6+kygbpeNe/M7+V2aGxacPnOZM6TxrYb
	RwoN8vbY42IedoTG4Ue0klxpJ1cWPjfl8NWSictXnRSeBFV4J+WmwG4aJWrig0mkc1AdCcCDrl2FQ
	QHrTDzgZG/Nu5Hx6VHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpYc-00000005vY6-3xU8;
	Wed, 05 Jun 2024 12:15:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpYZ-00000005vV0-1RhI
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 12:15:57 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f4603237e0so532620b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 05:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717589755; x=1718194555; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1s067gNcLroY85Io7X9j2HhTsy4/JNlR/TnSjjDyVA=;
        b=RivHHEVqehPmBNulsYnrR9+5vWhY7FY/kOCcAjjzCndPo0CwS/meHNYIabWhYz1t+K
         jQ/0tIHmOa1aKKaFktisn5itgmpoo0xYUXmdlfSWEhSKaV9zzN5hxOOdIqC3JJ08/qM9
         Nwt914V54Lkt6khs/gh6WYLrver1TlwnNS9yLarRRu26Mgp9kBl1AOtjFkNzj6HD/c6s
         ibS3DYwojU3niOgZgQ7wfkKg10W7eOtT1n3MzOHGOpSpa0yWhYa/NPVWFHfBhDRLYaAg
         TfaMlAsyIzbhF2c7cny6UQsULzs48TpMjZ+px3/mhXd1bL+OFoQHn0ym3o6U6UpYQnrH
         oGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589755; x=1718194555;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1s067gNcLroY85Io7X9j2HhTsy4/JNlR/TnSjjDyVA=;
        b=gpytZtLWjRCXP0ANNoCJ9maxBsswzDOvrnfbsOj1KLUIV3h/K02mMWE+VBjnpUdzgo
         JEWWuiUjGE7iSwhrBYr/jGgX0zYMuW7Wxy4v1Sz/anUQjScB3cIndOJnWpOWCIilPE2V
         MYTw7i0GW7hJuhhMxS/yy8wN35Ewhm0zTRpR3jKYBp72ZB1nI+svbH/WZvjp02hHp2pu
         /8XjlYbYMKzj8eE2lKe650cfhwN927euBvZA7e/aY+r/CZ1MSgtHecIh6oU0tlWaLUf9
         4mGYKIK9sRCqq5EosogL+A7hFbxKAaFw+Z2beVhJcOPX70zk5ZadcfvVLnVC53TH+dzC
         n2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWwa0mSU9vlOSQna7quAbsHaP3Mz2z3QKaDDubcP1g+2mALqAem05W8S/diR2Oq5dNcnQxJyQ0FhMkK0BpD5BSUKF1DacJOnvgDaNthqimx
X-Gm-Message-State: AOJu0YzLbiag/Eec42ztVL5s9DlCXHPJmo1M7YKur7ust9Ms1srVlmMk
	N6jszvN9tEcfUJ6fO4K6f8gFvEm7/AN26QujuDl9/MCQXCudnJD19uZjfpY9N60=
X-Google-Smtp-Source: AGHT+IE2uyoTxe3pUNkQoaQt0ajX+GBn9F8zoOHdbUYCJhav/6GYlnkgU9F3LAFV0i5BxmNjeJ1V1Q==
X-Received: by 2002:a05:6a00:6082:b0:702:5514:4cb8 with SMTP id d2e1a72fcca58-7027fba0d23mr6188351b3a.4.1717589754693;
        Wed, 05 Jun 2024 05:15:54 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703ee672fb3sm885379b3a.216.2024.06.05.05.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:15:54 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: apatel@ventanamicro.com,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 4/4] KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list test
Date: Wed,  5 Jun 2024 20:15:10 +0800
Message-Id: <20240605121512.32083-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240605121512.32083-1-yongxuan.wang@sifive.com>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_051555_531674_62359EB9 
X-CRM114-Status: UNSURE (   8.15  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Update the get-reg-list test to test the Svade and Svadu Extensions are
available for guest OS.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 222198dd6d04..1d32351ad55e 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -45,6 +45,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADU:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
@@ -411,6 +413,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SSAIA),
 		KVM_ISA_EXT_ARR(SSCOFPMF),
 		KVM_ISA_EXT_ARR(SSTC),
+		KVM_ISA_EXT_ARR(SVADE),
+		KVM_ISA_EXT_ARR(SVADU),
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
@@ -935,6 +939,8 @@ KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
 KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
+KVM_ISA_EXT_SIMPLE_CONFIG(svade, SVADE);
+KVM_ISA_EXT_SIMPLE_CONFIG(svadu, SVADU);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
@@ -991,6 +997,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_smstateen,
 	&config_sscofpmf,
 	&config_sstc,
+	&config_svade,
+	&config_svadu,
 	&config_svinval,
 	&config_svnapot,
 	&config_svpbmt,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
