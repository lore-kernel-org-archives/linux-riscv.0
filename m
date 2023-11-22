Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E22C61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 22:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNTuTvoksQk9UC6h+nqVUCo0mzMh6BADH06DJWTvBrc=; b=tEaNGEX7t7hMdn
	C19z/hBLQu2OVPQSu1A+Uk5Ex6wIfz++Ol4Uo5Cy2GoobNUdEMndkNjaZnVlwfsoo5V1gr653aMre
	Z8zBWykoSrsIsTK4Y0rc1TNObNtCXVLZW+oDlbcd+5mGvsrHOYglJGCf8iRqgHtBfjedfEwABIGgB
	OOAWBsqJGN6EeO1WaMlaMVrbvD8J7CImJA/oDXXdJpmWTffmGubUR9C2Ak4Xr2DmY/lwO/195hv1I
	jxDovciWSsMIwUxrd6BxQF8SMcrCCE57Y6Aoa6LZG8anX7H6JjjTU840d/IGgLrIlYWCb3Io1TF+M
	8CYan/RtU8eJQxk7BtGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vSj-003Amg-33;
	Wed, 22 Nov 2023 22:12:49 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vSd-003Aik-1e;
	Wed, 22 Nov 2023 22:12:44 +0000
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7b350130c3fso6481539f.3;
        Wed, 22 Nov 2023 14:12:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700691162; x=1701295962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU6Wnghj5KH1Ld3lLkNyhwgfAXJhDGyB0CCvRi7u8mk=;
        b=qfetSuuLlA1VUfqBO33rgbolxqUrHpz4gHG+uGZO0sbK36U2UL2BHjfGGuvnUPfkpd
         w8ncIqSucTNT/52O9CJl+0NdOUNepK1+YVHXAN0UTtE8pPsYS/dY9XmNXjK92l5Da51/
         Kzm7BRTZh3qOge/fETJLkLwQR0eI5s7dNyUZC0Uic2YAUsSvFllWlH1pUZ7ko2M8TfXA
         0NV+knjIG/dkndutk6LgIXEX+4HgtfFVbTTHuoDBIySSfVbWLXyaxrIFQjbSm7DdeTOR
         jVq+jn9i1IkfvLNBiUJjw44iPVRpYNGaGP++XwgPsCLZNHxec8ioNY0k/fOk7sqj2EGo
         PZ1w==
X-Gm-Message-State: AOJu0Yw9K/Lava3wa0Oebua9575Knh/h7anEcQZrji1ciXeAla+qo/8J
	+wUX1ZXqDa5rX2r0CKw5GQ==
X-Google-Smtp-Source: AGHT+IF8osr8TMYr2K7RbdJl1f0Qs0a8Vvy9ayPPg6W5HhHI5G6ri/6sDydnhfguLO7f2AvVQEKSig==
X-Received: by 2002:a92:908:0:b0:359:d397:c806 with SMTP id y8-20020a920908000000b00359d397c806mr4100582ilg.18.1700691162319;
        Wed, 22 Nov 2023 14:12:42 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r3-20020a92cd83000000b00357ce043118sm159221ilb.79.2023.11.22.14.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:12:41 -0800 (PST)
Received: (nullmailer pid 2753836 invoked by uid 1000);
	Wed, 22 Nov 2023 22:12:33 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Nov 2023 15:12:32 -0700
Subject: [PATCH v2 1/4] kbuild: Move dtc graph_child_address warning to W=2
MIME-Version: 1.0
Message-Id: <20231122-dtc-warnings-v2-1-bd4087325392@kernel.org>
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
In-Reply-To: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_141243_548184_E65443B8 
X-CRM114-Status: GOOD (  10.42  )
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

There are cases where having a single child node with a unit-address is
valid. For example, other child nodes may be optional or added via a
DT overlay. This hasn't mattered until now, but as platforms become
free of W=1 warnings, we want to enable W=1 by default on a per
platform basis. So move the warning to W=2.

In the process, the logic can be reworked a bit to avoid specifying a
given warning in multiple places.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 68d0134bdbf9..a67f781ae8ee 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -340,8 +340,6 @@ quiet_cmd_gzip = GZIP    $@
 # DTC
 # ---------------------------------------------------------------------------
 DTC ?= $(objtree)/scripts/dtc/dtc
-DTC_FLAGS += -Wno-interrupt_provider \
-	-Wno-unique_unit_address
 
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
@@ -357,9 +355,11 @@ endif
 
 ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
 DTC_FLAGS += -Wnode_name_chars_strict \
-	-Wproperty_name_chars_strict \
-	-Winterrupt_provider \
-	-Wunique_unit_address
+	-Wproperty_name_chars_strict
+else
+DTC_FLAGS += -Wno-interrupt_provider \
+	-Wno-unique_unit_address \
+	-Wno-graph_child_address
 endif
 
 DTC_FLAGS += $(DTC_FLAGS_$(basetarget))

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
