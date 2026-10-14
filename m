Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61267CC6B33
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 22:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnjJFoHXPWyUI2dTmhPzfug9C8Bb2Z7L3xw7RiAJmAg=; b=lnZkqe36/juhHY
	6jW9Qyl55OV9tv5q1i0Zz6mRJUCXyFqvegTngfvmGnmGtUqAWkqHop+qmf5DOG0zEWEoQIYFi7+q8
	7EynJTo+eMObvzwzeNCRxhbGtnkfem8HYJA8ghGZx9GQRxgDlBJPy0CxOePoanYXUGUyJipAQeEt1
	Up+LwRGlxfS5keHh1p6GhAIxANQJsi1cu1HHUkT1coTzJn6ANZxGt3OCj8S37gddw/h3HfmbePlrJ
	GCn61gupbnlZqWCgXeS6EfBei2yBeeKNzBZWJE7+qHyIN6vWL7iV0TJcuq31BaO4ay7ydpnBe8N/D
	/MZz58Ntkkk/dSV2hiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH7gb-0000000GQ3V-0Z7J;
	Wed, 14 Oct 2026 22:43:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH7ga-0000000GQ28-0hGJ
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Oct 2026 22:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AsxmuZNvM2QbMO/PEggWlrG1ABX23nvkMUX9slN4odo=; b=XGMn/8828BB/eFQ2V8vgnxYhh0
	O4dXTw59HrHsgJAZAWyekGBSJKTgoFZdr0Z9JOobyFuIL1BeyzxleRM0cquua9ZDhrQFkquKVkrKP
	tHFzDt+nkMWEtJbvgLF4xbohL0Q8/r7MPVXY59zWewuZEa2S6HGTubJ6zk3E4qVjadNVDHT7QkJq/
	Q9WPyw2QrUa+uVOKuQ2Tr3P9WjO6pmmX2JA7bP2WzqW5OuhS7yoit+CLUp+v8R1r+iLhcAzQUCT+q
	vxXjdmdU/DkjvOf/HXlOXrsFyh14fYoCrA85IIfmwS8etz5Qk3O3Sgtelo0+swZ7tw1P3JOANc9Qi
	Z5MOczhA==;
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xH7gX-0000000HGYW-08Xy
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 22:42:58 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9AB623F97D
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 22:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792017774;
	bh=AsxmuZNvM2QbMO/PEggWlrG1ABX23nvkMUX9slN4odo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=HFjAfxdENageEs64lletdNhMAothHK0wT9L/am3/J/BgQNq9ghXXmmF20epqc+jhV
	 Ul4//ynjwItuRqbNqI4POgk6Zmr2D0Zu4Bcbu9ecQgGiLkIzRxoPymg4ORcz3HpeF8
	 ELDFtOo3o7MWJg+6+7aaClCtDKx3Zsop159p7vVbx1xXT/mx6hLhw4yuzS/+DP9+sl
	 A61jpidzRD2tAMdIpoXf9R4+//gG55Y03uxhTP3REppzJH1W4p84ZWnmyvc6kOoztI
	 Pk0ukppcpxtFmgf/Yx/jxyB1xRCTV7SPe1lPp3045Sx0R+lgDBdR5WWzkM7gMlsY0u
	 C4Az90qaACBGyaDPrNyXl6J+8qnTG6LZ30tNrpZAgYpf009whUIO44qB5ijiAzs6ve
	 KgIqzoKG6dmzuax7bvCjbzPfCuf1pPgsjG3aGDidTax+6q15lN4FnhQ/jH4W5yl6ul
	 UlMTruNGAylg4sIR/jmbrarv/U4/y7I/rip+kvNJ6Q3B0ujyJUTjIVTNssQlWpGSoJ
	 s029TKAikqeVCc8ua4MwcholthOTKg+VskibLd0SFHFkvdzh+aaPfW8IDRy8cQDmXV
	 drETJnW+tlFAoW3smHgxMbtZTn1TpBSTX2r80IAZOBhMWVMW1mTD4ur3rzFi4ek4rC
	 3JFRZXFiXh1lIMJdzjRPFS9k=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a01b112fa2so21653855e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 15:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017773; x=1792622573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsxmuZNvM2QbMO/PEggWlrG1ABX23nvkMUX9slN4odo=;
        b=rQHeinH3d5c3ph5kS3KmIoV7X02C6nE59A9WrZTi4X7/ftyxExRY7j7ianP3+p663Z
         CQhI8fS2AtbGO0pz8ZbHVh7LQsa22+HAqQ2cF/OxYB3oTGOS26aXonYSuMUv4OhpsHNB
         6AtIEZFZkqfwGBz494XojAlly6THEaFCEknUlU/BJ2co82aPa5jzQyn28HxCEkU2Yovn
         AXoFPICwO+tqg6jpqNUb6Bk/EVLx6cUU0hYeQmAXcU/lyslLKDsMMRVmbJAHjo9ZwthN
         tqHFRkq5nil0w//x2u3qaouj22TyRYJWhvtjYVSuXpjmWcr4UGGvX+cW+S5oA7VfRIHO
         ulvQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5dEmpa92HEk5rEpMY4xOX7i7aTFi2DsDwYrck3Fap4ULwm+VPlOzNyQsMHrjlIncpL2vZwAAsZZILlg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIaU6EVc2tbKhagiLwpuS+kqSE/R64mJFzVwNI0L/TNK8Q+z1DS
	nz+TPp1x4QIBPXgPEO6p3Jngtj59z8TVW41phm14/ThBLZtKBrmZOI4Em+N9Nck/PLk0hoE/+AG
	zt3WY5XgHOZqY0w8gOxynScgkwMGchy5LmNA31XTluatnC9QdiBVKPo9tLlg5ieXbv82wyVyVrp
	ArTMvU+g7y2w==
X-Gm-Gg: AYBFou1JXYku2CKO0xnCVNjuE7PyhKesrvGfYzLnwZRN22v4hIUOi6RHYy+qxWcHLvO
	s0+0u9qdyt6nz5xYIDg9RM5mJ7+eb8BueF2IuFytiy4Pujoy9ST2l+7pe1XTCcQflrCHWJu7idH
	Qr32r9yyD4FkcmxHUfUM4Ih7tRT2sG+40K4Z+PhIWRHxDCW7nGTDbstfjwYvCWhXT6FOEGedyA+
	oo+a9dGp1LHRMfee/7WFfnBDN/LCOjO65tbmP0aaD4HeGeEklJGsrL3drcY7pN2DZG2Bz6zXOA6
	namtsyNi38U0+Moa9vclzU4DuejdxKHUI8EYksVOjOmSnVVdaztj7GxtTld3PB/xqCFrEgiYGS2
	BN3p6lr8kRKpyTevDTdrZqxUIrQgBJJtPo/OHq1X82aKvNvPQVm39Fs+q
X-Received: by 2002:a05:600c:8b65:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a18e4ca244mr319653705e9.27.1792017773453;
        Wed, 14 Oct 2026 15:42:53 -0700 (PDT)
X-Received: by 2002:a05:600c:8b65:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a18e4ca244mr319653445e9.27.1792017773163;
        Wed, 14 Oct 2026 15:42:53 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:513f:8595:22d1:d25d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm23227965e9.10.2026.10.14.15.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:42:52 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sarah Emery <sarah.emery@canonical.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/2] RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
Date: Thu, 15 Oct 2026 00:42:38 +0200
Message-ID: <20261014224239.963635-2-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
References: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_234257_413938_09AF9AD4 
X-CRM114-Status: GOOD (  11.02  )
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

Extend the KVM ISA extension array to allow KVM userspace to
detect Zicclsm, Ziccamoa, Ziccif, Za64rs.

This is just notifying of hardware provided capabilities.
No KVM specific support is needed.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 4 ++++
 arch/riscv/kvm/isa.c              | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 20d9959ca44fc..39b0f3f1d4863 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -206,6 +206,10 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZALASR,
 	KVM_RISCV_ISA_EXT_ZICFILP,
 	KVM_RISCV_ISA_EXT_ZICFISS,
+	KVM_RISCV_ISA_EXT_ZICCLSM,
+	KVM_RISCV_ISA_EXT_ZICCAMOA,
+	KVM_RISCV_ISA_EXT_ZICCIF,
+	KVM_RISCV_ISA_EXT_ZA64RS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 971f44655100a..72e3dc15d2947 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -38,6 +38,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
 	KVM_ISA_EXT_ARR(SVVPTC),
+	KVM_ISA_EXT_ARR(ZA64RS),
 	KVM_ISA_EXT_ARR(ZAAMO),
 	KVM_ISA_EXT_ARR(ZABHA),
 	KVM_ISA_EXT_ARR(ZACAS),
@@ -64,6 +65,9 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
+	KVM_ISA_EXT_ARR(ZICCAMOA),
+	KVM_ISA_EXT_ARR(ZICCIF),
+	KVM_ISA_EXT_ARR(ZICCLSM),
 	KVM_ISA_EXT_ARR(ZICCRSE),
 	KVM_ISA_EXT_ARR(ZICFILP),
 	KVM_ISA_EXT_ARR(ZICFISS),
@@ -183,6 +187,7 @@ bool kvm_riscv_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_RISCV_ISA_EXT_SVVPTC:
+	case KVM_RISCV_ISA_EXT_ZA64RS:
 	case KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_RISCV_ISA_EXT_ZACAS:
@@ -206,6 +211,9 @@ bool kvm_riscv_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_RISCV_ISA_EXT_ZFHMIN:
 	case KVM_RISCV_ISA_EXT_ZICBOP:
+	case KVM_RISCV_ISA_EXT_ZICCAMOA:
+	case KVM_RISCV_ISA_EXT_ZICCIF:
+	case KVM_RISCV_ISA_EXT_ZICCLSM:
 	case KVM_RISCV_ISA_EXT_ZICCRSE:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_RISCV_ISA_EXT_ZICOND:
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
