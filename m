Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DB7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 06:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gxgntW9mECk5UMYVDfPPFATCThwIPg6w6h0WwonCDrs=; b=RWSA0o7kbEFJnm
	Hcmd7/t2rXub0U7o829c+X79klAhdkkSukTOpT5ixN5r/q7GNJtfc1slS2TqJ8MPLBdhHt4jG2VXe
	y1094YQcEwfHE5NdD1LjHfFqN8SB/YQwl6mr0zqD7UaQHNnrsG8BE/r95mc/jLHK0XlpBEaI24vzy
	TBrymh+qX6zYPa7geXKY7EuzHbg4qwGADx6rVpx/8nFnHmA6QyfOWrMj//KOcGRNTBIEcm0W3b6B/
	Oc5cQPCdZydGH15+f5qxQ8mJbZePlo9DRdrpgq2PwkM4W8knsDnlRkh9/MRwd6pID0IJ+OKz6c9gE
	sahOFH1leFqNPezBqwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnwYL-00CcAS-PW; Mon, 09 May 2022 06:07:29 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnwYI-00Cc9i-Jp
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 06:07:27 +0000
Received: by mail-pg1-x534.google.com with SMTP id a191so11181933pge.2
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 23:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dNam4NRqULz5ngQJv/Hr3VjArBiTEWxDny0ZL2+Io9U=;
 b=dPq3yY7EG5ylSK+rjMmRLKT+ixv0ENM3fCJuMlr93a3g3nsC3YidXBc7z1I53YnSt+
 G064wONruJW7U1oAvryn/yC/EH1CMKZAz8wPzoWibJ3aLmJ7LvjDMxXUpDb3c2XmRJOH
 A1zjn1n7BpVaeaiw7tApKppo7kZg8ythmCIJAP6je7afYD04nOqUbKMkKdfGrafqpald
 N+QaLI77ovp24bmcPODSy05aMrLtXd4smLr1AR5tfcVVWZg90iW3q5ROCMZKIfk1Io02
 hMvQdzr/JVJOHp2282+DZnEt+ldYKcWp5sDjZdj+n7oTp220vEB0MwDwCuMgStHr66VH
 Weow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dNam4NRqULz5ngQJv/Hr3VjArBiTEWxDny0ZL2+Io9U=;
 b=T1c7Io5MDdfUP20KBE4K1vU1+1edSfelnGdlvmyzI5Ue3nk2if7STjgppoVCjsfCgZ
 dUsRFm3oqqRB4flEaSLqBAOB9yX9lJ7s6OrhRIQXywMMYYFXXoUCi/AA4Avmz4O+/7Am
 aUyW/wCYzLmAH5/ewY/gqD9yXKlXVM9dXloHAQnYz2Nlo+9it7A9DeiV3PahE96eSHbH
 8oxUzU4UgO4Zf0JlkOyZJ46r7SQvAqSpNNCsbSzsJ03mq2uzzZOW2x4df9kccIhJn7Ev
 YYSdvtLhIx5aPTTaJ2R6Q7jxarUhUyi6DOCeU1HlLtsXznQ4olQiPQ75/QaXixGILdS4
 lDuA==
X-Gm-Message-State: AOAM531aXsNPI4uki3tcraRT+0krX04AOdGAvav7vfdL+HPu5G2GkoyN
 KhPrqbEJ5aP+51Vk/9vdfipy1Q==
X-Google-Smtp-Source: ABdhPJwhPZEA9MJp5FqlgDa6QmKne+WzgM7zzcJh6yNP8eD7tE4O+NrmEyx8KPG1/ObV9NbCTfC5Tw==
X-Received: by 2002:a63:165f:0:b0:3c6:ab6b:a6d2 with SMTP id
 31-20020a63165f000000b003c6ab6ba6d2mr4338868pgw.610.1652076443185; 
 Sun, 08 May 2022 23:07:23 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.80.217])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a170902d5c600b0015e8d4eb291sm6126748plh.219.2022.05.08.23.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 23:07:22 -0700 (PDT)
From: Anup Patel <anup@brainfault.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update KVM RISC-V entry to cover selftests
 support
Date: Mon,  9 May 2022 11:36:34 +0530
Message-Id: <20220509060634.134068-1-anup@brainfault.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_230726_677375_576D9BB6 
X-CRM114-Status: UNSURE (   8.03  )
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

We update KVM RISC-V maintainers entry to include appropriate KVM
selftests directories so that RISC-V related KVM selftests patches
are CC'ed to KVM RISC-V mailing list.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8c52d0192a6..ee73a71c1500 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10767,6 +10767,8 @@ T:	git git://github.com/kvm-riscv/linux.git
 F:	arch/riscv/include/asm/kvm*
 F:	arch/riscv/include/uapi/asm/kvm*
 F:	arch/riscv/kvm/
+F:	tools/testing/selftests/kvm/*/riscv/
+F:	tools/testing/selftests/kvm/riscv/
 
 KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
 M:	Christian Borntraeger <borntraeger@linux.ibm.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
