Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D046C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLuYxITzgEAi8w3CK1NaCEhRElm5Vyy+dSEsIO3vIQY=; b=RCVdmPt2fIdea+
	JH1DTYwUynQf/XcBxASuoX2zOv9B6S4u27oCYYtHfoKHoSq6lZLxJdqPaVa9reTM9nMAGpmp764jZ
	TBvzhYwfHh3dESoC3m2qipvSws5IfWsfctOQnUIMZd1h7d2fHf6aGLJlK3O2gQv61Ghibe2EYhgSn
	bljuk13lorvpsthXYWeFk+tkUqoAophw9zH3Uw9EC7l+qgH3s0sNL7EBF9aqJFGorBODJuOiJZ/KP
	3sLnyh1v/kYtSjTi6X5dUjQV1MPsggd1dO+/wlZifJB6wX4Xqu3zSh70FyyYJo+7o3TQeXKhHKwE1
	QgRIIxCa8BOtGkAI5tGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGeL-00000003NB0-0EIF;
	Fri, 26 Jul 2024 08:50:05 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGeF-00000003N5s-2xKv
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 08:50:02 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70d357040dbso645566b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 01:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721983799; x=1722588599; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3dXGB9M68kLUD7MhXnrJa0QNMQINVnKrW/fzYtIxsFQ=;
        b=WcLkdqYeA9HlZ/mvbZtSD/aNMCKHFkTvbyUUKy3b8swbzbsVW9VehNv8MuSl0vOmBy
         zcmW1lnxToOD6qHWLm1tPD8Yr3WqK6wHjkjupQYje3rdcp0BmWoENrKXUOuNVLt6HBRh
         wFzB8wK3VoA2/kATIUOGQuo1i+buHtXZz5ts8DtcOqCNYiYNfKX2IXmAi40B0YNRYOgy
         8l8IVXxk8xYdxRXsy6pU422EQHKroKbGUpFH8sl1IjST8BAz0ljx+un1PD4J/amHKe1x
         fHKX3z2a3G7mF0PsKZLL85M7KfJXv0QFafcYt7uy2pOZoF1ozEiw9MLy3Fy/rHiKdLYu
         scPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721983799; x=1722588599;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dXGB9M68kLUD7MhXnrJa0QNMQINVnKrW/fzYtIxsFQ=;
        b=XVDI1EZ+dsTWCYTDlmAaFxrC3CWc50YJXE8c2lLttLHtauOh7CeOyucbp+ck3u0YKs
         gStMPjTVbOzSXqzc3tj5Z151gHZkBTmRqAv7lg80lfZOzaP8ohD/2VhTNYlbhnwaTrO3
         6ZHc2uFSwqKoa1I/ZG8+wHYxN+DT8JwETXDLRuzAiC8WXdolyW/zhGyKXFZNgke3+Bxw
         1XEqNJm7DdD9f0gXHBpAPYLhX8E2GlAzCxiYMJEL7YtvV9yGxdoMc18dviqT7fpLTcOZ
         F02Ba8fjfeTNXC6OjJPG5o9UfKnOQEzVWkXZcevRQb3f2LtUv6ZSMSfb75VQhFcPvBlz
         tZyg==
X-Forwarded-Encrypted: i=1; AJvYcCWNu4dcTgkvA0zMtmReXv2BZlLkUBeHYiQ86s+gENaSv7oeLpIKgX/v5OVDpnIpoSWrHzKzGdeaKrDQKeCTniARA8A6wbgJhEx4CSoCFwva
X-Gm-Message-State: AOJu0Yw7urvvxECfUrLOm1uL7sUM7gk87RMtd3cIbDZBZ8MDrmuUAwa+
	klUapQxnSa/MuOCqBOg4LosdnyBI4J28aWZmRoQBglmBDgzUDsrT76yRFifIQrw=
X-Google-Smtp-Source: AGHT+IGznbiFSiAI8Fl6vXmZOoRo3AgApK1TPweDDMBRdHNs5h5IX0DOrE9eMPt7tTokhtzC2+Ebew==
X-Received: by 2002:a05:6a20:2451:b0:1c4:7d53:bf76 with SMTP id adf61e73a8af0-1c47d53c6c7mr4526810637.38.1721983798630;
        Fri, 26 Jul 2024 01:49:58 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f816db18sm2049645a12.33.2024.07.26.01.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 01:49:58 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v8 4/5] KVM: riscv: selftests: Fix compile error
Date: Fri, 26 Jul 2024 16:49:29 +0800
Message-Id: <20240726084931.28924-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726084931.28924-1-yongxuan.wang@sifive.com>
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_014959_797573_976BE55C 
X-CRM114-Status: UNSURE (   8.42  )
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

Fix compile error introduced by commit d27c34a73514 ("KVM: riscv:
selftests: Add some Zc* extensions to get-reg-list test"). These
4 lines should be end with ";".

Fixes: d27c34a73514 ("KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index f92c2fb23fcd..8e34f7fa44e9 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -961,10 +961,10 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zbkb, ZBKB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbkc, ZBKC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbkx, ZBKX);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbs, ZBS);
-KVM_ISA_EXT_SIMPLE_CONFIG(zca, ZCA),
-KVM_ISA_EXT_SIMPLE_CONFIG(zcb, ZCB),
-KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD),
-KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF),
+KVM_ISA_EXT_SIMPLE_CONFIG(zca, ZCA);
+KVM_ISA_EXT_SIMPLE_CONFIG(zcb, ZCB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD);
+KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF);
 KVM_ISA_EXT_SIMPLE_CONFIG(zcmop, ZCMOP);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
