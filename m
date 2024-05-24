Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4612FC25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 10:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxZ7ZbDgl8/hwrxcYqFOX8mOP4Bc6e5Mu8RA0j4a7SY=; b=D2tP/bYNWZyd1E
	iMyIetm3izVFqUxOLjMLhW5kUcxhpxYuepjsKESw1BmEDkfFUOlHbhlM5LdotSMkVWic08F8YzIPq
	q6SwhWTuG2+SDC8aT5JPDloeEQayTxQHn3K/C7tSrGxMvIB2VZSl0aA1XpaZlTbBWUCrJ/4PZK5la
	HvBq7TT6oVlwZiaisNBgiEg/kLVL+zJYldRyFNNmRzsMj9i7MWxML3wRcyHemgDrLsK3U4q36e/WQ
	/Ak69nqbVL2BwKdw6cF4TLNa+737264OkRCDei3oWOSBWqUeXF0SoNG99U6/p3qAXVFyVnp1ztsSc
	aumgfxnBcAwiCQJxmrdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASFB-00000008gLF-3yoj;
	Fri, 24 May 2024 10:33:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASF4-00000008gEk-1EFr
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 10:33:43 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-681a4427816so560725a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716546821; x=1717151621; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ymkmfLUFinfhQ3+TDmLUw1ksts6DHkemJ1yTbP87LC0=;
        b=YryYessQPN9MrDHRKNglrYpW+EzbMrpR5YoFI3+sEFlPcQR0sWfEHtoIs0r1Me+ZLh
         F8ESMXQ0oSPawwnc3Oj7e83FmV8iFXzfyeEFhMm+mUKB2/uDUCojrUoN1gmTNfAej9k0
         mZGgTj2J0WWAeEy/xGCbucc67/TNTll7xyfRgKq1kT/y78NWwuBxYqriTl3OCJ4vYYE5
         qsxyMjwR1vk559NgUGIxmoJoTuvzyByvYP48i4a4nYIyRuXR6X0/QLj2hJH8m3tye9ww
         +ooFD3cjamSjK7Wcv+qQ/MDNIZl5vWzt4h+tyV51B7rv2JHq/db33nkUMNecn6J0yszE
         pgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716546821; x=1717151621;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymkmfLUFinfhQ3+TDmLUw1ksts6DHkemJ1yTbP87LC0=;
        b=UybjRxX0sTpqNcb6LNwQX2Ey8DiEXvb1DvVAExuWO9cKKIDCOGWtmOWMXyaiaTgy7s
         6I0WrAgP4Kh6Awcwi+1Jo2RP9ATB0XVkeh7fa9tn5V82yvJ4hyYN6nPxVd25LjHtmYHS
         16lhdqvIMH6s8bh7plsUvUtnePyPTdIdq89zFHfhOHATv4nLTxZfAIHZfky/mWjw58i4
         shbbAau4xkM0tN/KT3B/3ebINjJtuQjaLWe8IBNhy/E9lMXeHHKyFZN9kUGd1dD94s9n
         VuUUJz8iyNMjHLj2fSDRyN8ygiF3udEU2NlGW4vl7WgFD1ejbO8Jdxv+uolYTEUDOHrM
         NMiQ==
X-Gm-Message-State: AOJu0Yw8XOsESNKGNyS+gReOZ85CjKOVQfTBuu7hsZk/C4zk9yuVh2Hq
	Xt26DNyaqCnnxY0ptO4XxAWtjl84V7i+JAIX8KtoWFkdft0s7xoUkYDzrNKJSgbMJsIAIFL3HQ4
	mdEOrocUOc5b4omc5iwymfsyO1MYZMUZuGF2hdlKu8UhB/iZAUPQVFprocPCDrYl5wsNqEtxzGT
	Rrdohs/5gmcJMPbP4WF07jRi7aUBW+LhxMwff4TFa/nI4/9U5clBrPvcA=
X-Google-Smtp-Source: AGHT+IHxFW2gDsXCi1JB6IcnARVviEQ8KpdJHHbgbAeBuxdOzZ+lkUts0NLoKaacIMyi2TPJR7Frng==
X-Received: by 2002:a05:6a20:2d14:b0:1b0:9b7:bbe3 with SMTP id adf61e73a8af0-1b212b7b0f1mr2711881637.0.1716546820772;
        Fri, 24 May 2024 03:33:40 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c756996sm10936625ad.8.2024.05.24.03.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 03:33:40 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 5/5] KVM: riscv: selftests: Add Svadu Extension to get-reg-list testt
Date: Fri, 24 May 2024 18:33:05 +0800
Message-Id: <20240524103307.2684-6-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240524103307.2684-1-yongxuan.wang@sifive.com>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_033342_398395_9C03F04D 
X-CRM114-Status: UNSURE (   8.62  )
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

Update the get-reg-list test to test the Svadu Extension is available for
guest OS.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index b882b7b9b785..3e71b7e40dbf 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -44,6 +44,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADU:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
@@ -409,6 +410,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SMSTATEEN),
 		KVM_ISA_EXT_ARR(SSAIA),
 		KVM_ISA_EXT_ARR(SSTC),
+		KVM_ISA_EXT_ARR(SVADU),
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
@@ -932,6 +934,7 @@ KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
+KVM_ISA_EXT_SIMPLE_CONFIG(svadu, SVADU);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
@@ -987,6 +990,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_h,
 	&config_smstateen,
 	&config_sstc,
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
