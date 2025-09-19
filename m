Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA819CAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6GfO83N5gaQAZ9dCMQd78EwlaN8Bx510bJt16yjtyU=; b=cpg+Dr+/64EBfg
	A35e19ZMXAuC8izXgsZ1/VhK4PB12Njr0q1oTTfMjdAleVH0VQPR3GpEniyM+goHiEH2LQqve116E
	h8JJ+xW40odYhKb6u7ShgSPfqtNNKvNUGtOPOlaqe3tz3Ngq9k9PZBr51rUWJ81pt0imgik1JDTzJ
	9psFee00WAiO9s3/E+zHOS5++o/tYWodhOoBj3tpJvL8EimCQIvopbtJXz6lIO3Nn3NkT0FPnpw6h
	mnoUhzhn88hpEcGjF43TYi/bymC7NgaOhG3I9JLvDtEZXtoTBeiu8haxxxHJna2QYcJfznLMt/JE2
	rp67J/jmQJfQ9P0Tx1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzViT-000000026JJ-3tvD;
	Fri, 19 Sep 2025 07:39:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzViR-000000026IC-3HBx
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Sep 2025 07:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=; b=dMQAbBeaiqHc6VLGQlqmXN1664
	HLgeOIX1gHD8MVbqEikRWUYH1j9r7U+qhe4STyokI+auIDjF0B8NxydLHNFaSa08425AAe9WHure8
	JpdP72LxbOwkoKXyu5vMFqnwVWcm6n3rX55SB/zxQMRWBvRZi39mfwPYIoFiADHbTa5PtNBQBb6cF
	zluAmu9Ta17WefsBaHQZpu3LRcFuILoQ6I2EzGNODhlovOb3so1Z6jnk7e4UVDXspuZRVsCQ64GLt
	Fn6PCpxd8cpNhF18pSfaUIiyfld5kf6T6MDVbpaw6JJyejYlo+/Y/6eiDAzkDQ9iVNl/jEjMl01CB
	+o1mx+Wg==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhj-00000007lhk-1oih
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:39:34 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-77dedf198d4so1381079b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267522; x=1758872322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=BAd6J+RLjI7KJHtQlwqo1u5tmeMDvRGs9u56+H087pYUrJhKwkXhrJjZT+lWXFM60e
         AygTN1e6ZwT84rhgwhTgqufW/FXpujQ5IoU+O9OZT1wT4P56Us1uBpqxUD43dR9tUK7J
         40FLa3zX1clrsxGtzIXu69JjmwdBC6CB6YicItJGyzzqHFr1JuTPTWTbpdKj8uSNidzi
         XFueY3pL3e6O3Ymis1l8/7HBUNoNN6mWmsSqDknIHOqtQzGKohPyDhF6JVACLFzDEtiZ
         PRfdNppVCESub7cOfvwIPvNbQU5AhFjC84h+Df2PmOYwW6J3AvJUk/hQYEDP3y0Qn8+O
         Fsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267522; x=1758872322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=j5UlFHxOqvfwWurrtaHqxjndwjeQFFnQLpAS/qyhdKo7i1mdv8F9NKdXx4Yp4xNpuC
         xYbv+CKbnTEqMOpkv7lR+YAPrGNAo0silPybmgzbWloFtJQgdBguEVdPjbe5H68rvIQb
         BT1opbAAYzUYNcfyD5ERkfnrzaJ1rY69MSAST0nqZMGZ8BgX5rEWhLuPwyoSvp2H0yMZ
         CNwqapaPTeSaATZdi7gfGbPLpvihZ12304HO11uzNbWFwgvYBUFCHwppjrXKD4NO/Clr
         AV2QS1Sgk8xZBkTXCvZapq7GnLyMMHbFsYwBJQ/FyhnFDsUnYsWBZMploycgwamGQ+vk
         jp/A==
X-Forwarded-Encrypted: i=1; AJvYcCU0esPDytezl2cb/Q5zpTyAtgGo3KQc8HnoVOU0EEWSpNc2utrDgN9VUYP+DJ+jrgFGm4a4/umtjmDFLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1T2s6L8N20wY9aqq1Ah6mVlxRw9CmftafXmQJlLz1K/8VkTDV
	kUyVNgoXytsGRG9snGyM9/gVfleP+cKniy5k7ToBHfts4jP5xlV//84p8Dp9DonOknA=
X-Gm-Gg: ASbGnctklIUeTAMAMKCRBX/V8w/u7yc4Hz1rPk0IZpG+Y4BNOCXZXZG/78nqUKiMN/S
	SaN1DqNnm+9N73p+9HlcNQzB8qZLH70bOcvdzx3A7f1Hc6dPgUJWdb/H9C013HiNr62U/y1BQj6
	3STRiEAG6vLjWN2fCy45tF9P7SMbenQsIcS8ucWoRXQXXqJ6GDqKrYoHQw+QtY1ofBXDN/9XGhC
	ooWrs0B5e1YtZ/LwjEWMaxy+AAJ/yXJG/4b8G7QbhnrIs2fnqxPUjp+PIVxm4Nj4Jt1K+IrmH1X
	xWTqLi+MdLisx8OWw5ZDMfMiaYEQovMA3bdTARSosGbPBaIFv35PcvrnG/DfJVUB0WkEjVbZexL
	GGEnYf0dVz0YGHp1clc+S9UU5SG8KbkRy/aUcGb1XAWJknqKP9dTbLbWAtFgW+XQS/0wYI2Z3XC
	HaX2xY18Rw6RsVHy9DWepxfo8llXXXl04C45sCwaAwfg==
X-Google-Smtp-Source: AGHT+IG/JWbqV8e1pPBSIjwkXI4z09a5l0oBx141z64CDaoUW0Ejq4ZhQwv8kxbRs5Suvs4P3rGR7g==
X-Received: by 2002:a05:6a20:549d:b0:250:b053:53c5 with SMTP id adf61e73a8af0-2927405e4c0mr3586688637.51.1758267521877;
        Fri, 19 Sep 2025 00:38:41 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.38.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:41 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 7/8] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
Date: Fri, 19 Sep 2025 15:37:13 +0800
Message-ID: <20250919073714.83063-8-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_083852_466060_1A1FEFDB 
X-CRM114-Status: UNSURE (   9.08  )
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

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zalasr extensions for Guest/VM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index ef27d4289da11..4fbc32ef888fa 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICCRSE,
 	KVM_RISCV_ISA_EXT_ZAAMO,
 	KVM_RISCV_ISA_EXT_ZALRSC,
+	KVM_RISCV_ISA_EXT_ZALASR,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cce6a38ea54f2..6ae5f9859f25b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -50,6 +50,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZAAMO),
 	KVM_ISA_EXT_ARR(ZABHA),
 	KVM_ISA_EXT_ARR(ZACAS),
+	KVM_ISA_EXT_ARR(ZALASR),
 	KVM_ISA_EXT_ARR(ZALRSC),
 	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),
@@ -184,6 +185,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_RISCV_ISA_EXT_ZALASR:
 	case KVM_RISCV_ISA_EXT_ZALRSC:
 	case KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_RISCV_ISA_EXT_ZBA:
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
