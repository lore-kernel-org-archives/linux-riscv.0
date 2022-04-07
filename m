Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B0BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p7nl4jOrfUVc6ouvFzW2OhHibOkRt6Nt+eZBz1vIhQ8=; b=VnyA3XGOVkcaFV
	50Uhb720KSAXZCgE7QfyU6Ci1GrTjY3sqFU1N0QI5XyOvtBmBsmK59AWQIq3EzFVlX3R5IuLv/t16
	dABSmtZPvnsKSEQ/FFjgV5jw9+1hsRn+AnNwaoZX0nOfrGRaOeAzYMS0FzHIgIcwdaGXg6RhLOzoo
	zuVIKlDeWiuvUk+6UWOT4yVHb6g8loHOKR0l1uGr6UvfNtL7wTq2iTymXAeIDA5rH2cypuyZrtYqK
	yrM96HrM7Sd15dk9hbE0H1HooH1PaORfLA41yqVhxHmiyyqXJpYYCBJvFVEhXGs1kx2VOTnvLVesq
	1mhyZhAYOOs0Q9XpWYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncRKl-00BsRW-Gp; Thu, 07 Apr 2022 12:33:55 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncRKi-00BsNn-OZ
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 12:33:54 +0000
Received: by mail-pg1-x52b.google.com with SMTP id s21so311167pgv.13
 for <linux-riscv@lists.infradead.org>; Thu, 07 Apr 2022 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHuMdd+Tso54IS24zoaKEo7ZF3a1oq8FNtueInQMuKg=;
 b=TP5m84milVRvG/vEdfXwdoGsaBa4DtHBo313pRzo5ALpNwKykawRcbsU4JHBwG928X
 n5jRakad5YjG9eFkh+7QyNsQRSSkBceUG9GxSLvPM9ydqymcYFGa8t+cT16wAFVYtn5E
 Tm0FxsfLb3ONv418/WLIsSgHsnwWPtYG1P7XhsyJBo1/YupRo+2Y1caU5ReQn2FTD9KR
 oEfNV/qbGhraydqt6xDfrmotxOVI99RtQARty2IARenhNTZHIJ1pa2l7r4GamI/2KkDq
 BmlszCrdY1v32v0rEq223xFv4QRc6SK6IN5w3cwfPHdg+hY2B1LoYIdhmzMBJnKAfFdl
 yM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHuMdd+Tso54IS24zoaKEo7ZF3a1oq8FNtueInQMuKg=;
 b=K4hkATlUJqBlnmDVkrlIgKLJkSD2eHD7WJl1nHkBus+GE06lkhutjMoe4vPNrwKQjA
 aNZSo+0zx8aRSzJim6Ks6mgNzNsyxhYyklbAcw4yxvHsSh8TBo7OBXHJV/YqbIe7uYac
 I9axSrxyz9CgdRQpA9VJCxAav43vx/2Sn/b0ZCSvHxRZITn2i67py++1HVNXWZFJDY/q
 i7ZzlHtqiEKdiJz3+0HxYdQaTlnbdVchwrF9R3SxDm/NFk2juqn26WKygH4pGkS6pRet
 SE8NsQbN47i2ezqR5/mZp1VR8Gu/gQCpXuzhxcgqcuGWc8t4KkYtkBiCk5i4VOvuNhMw
 XyMQ==
X-Gm-Message-State: AOAM532gnG8vaMTjqZQUOGmRowJyvm2vQIw34j5OEM8Jzd1dHxpj74zj
 D/oq3j/KVke/X6/PvevQdyE=
X-Google-Smtp-Source: ABdhPJxaB7S5JM7L1Nse63e3q13TrwKZX/zgN6E55DEv72DlYwSESD8Cwg7AsnUwV84IfHCk/CWwgQ==
X-Received: by 2002:a63:7f50:0:b0:386:2b5c:9d16 with SMTP id
 p16-20020a637f50000000b003862b5c9d16mr11244153pgn.153.1649334829156; 
 Thu, 07 Apr 2022 05:33:49 -0700 (PDT)
Received: from ubuntu.mate (subs03-180-214-233-65.three.co.id.
 [180.214.233.65]) by smtp.gmail.com with ESMTPSA id
 nv11-20020a17090b1b4b00b001c71b0bf18bsm9484966pjb.11.2022.04.07.05.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 05:33:48 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v2] Documentation: kvm: Add missing line break in api.rst
Date: Thu,  7 Apr 2022 19:33:27 +0700
Message-Id: <20220407123327.159079-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_053352_869990_41BF9E24 
X-CRM114-Status: GOOD (  10.44  )
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

Add missing line break separator between literal block and description
of KVM_EXIT_RISCV_SBI.

This fixes:
</path/to/linux>/Documentation/virt/kvm/api.rst:6118: WARNING: Literal block ends without a blank line; unexpected unindent.

Fixes: da40d85805937d ("RISC-V: KVM: Document RISC-V specific parts of KVM API")
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Changes since v1 [1]:
   - Rebased on v5.18-rc1
   - Address Fixes tag problems reported by Stephen Rothwell [2] by
     removing date and quote the original commit

 [1]: https://lore.kernel.org/linux-doc/20220403065735.23859-1-bagasdotme@gmail.com/
 [2]: https://lore.kernel.org/linux-next/20220407074844.110f9285@canb.auug.org.au/

 Documentation/virt/kvm/api.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index d13fa66004672c..85c7abc51af521 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6190,6 +6190,7 @@ Valid values for 'type' are:
 			unsigned long args[6];
 			unsigned long ret[2];
 		} riscv_sbi;
+
 If exit reason is KVM_EXIT_RISCV_SBI then it indicates that the VCPU has
 done a SBI call which is not handled by KVM RISC-V kernel module. The details
 of the SBI call are available in 'riscv_sbi' member of kvm_run structure. The

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
