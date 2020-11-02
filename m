Return-Path: <SRS0=qpiA=EI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB61C00A89
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 07:31:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8409C221FF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 07:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PIqMyYZf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVDsqKEM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8409C221FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/mmQdolodOJ27FBE3VzWbDjaY7uVGq1Wsm51m8O8Zp0=; b=PIqMyYZfVuYdBqCHH+9hSWOHZZ
	f5EvmklKhYkIwyHC4EfJgSag8fD89weIeq7Az5lx3lZDtRygnaGmTQwDVtLI3EjZuIxDXacTy+Qq9
	Id9zqL+liKRm6M4mbdut/IY0qhxqdN9J+u3ae5/Dl+FeT2H7ai+HW6OjTCmYyz+X0iXzFe5p/GXcw
	ckWMPRaZHAW44ESTa7qwSNAS5QneIXooJdy4kte9f28zER8hC3oqFZPuITeTjt4m0ZHVryvLg+RQt
	xowRXEEfcAQRtxtlaaujNmgou3rhLLrWF9g8Ck2Tf/YFHWETirQ1i17B5//lMEC988T18or074WKV
	KFArgzgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZUJ5-0007QC-Fx; Mon, 02 Nov 2020 07:31:11 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZUJ3-0007O0-55
 for linux-riscv@lists.infradead.org; Mon, 02 Nov 2020 07:31:09 +0000
Received: by mail-pg1-x543.google.com with SMTP id 62so2750473pgg.12
 for <linux-riscv@lists.infradead.org>; Sun, 01 Nov 2020 23:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MG0UcDuTmhCAz3mOj/tjGMPWdlek6t88bi1IXitM3dc=;
 b=iVDsqKEMNONxG1vTn3P+WS/+YVecrpSTk0oI8yZGNR2VyE1AXCwmm6YZPIatk2h4mD
 BbXJfBZxbY29Wfi1qSST0kNPH5WvPxoSNe8Qj96oDBQyrmg8CmpH8iFSdCkV2P8Vr5IU
 ivthg1ENcwEzgnb0PRJB8DXLHQPj2IqbEr3GABHmYjd8KWKozqN9GA27kxkIvO7hvVpt
 9A7R5oDaKB+JN6AvCzTIBLhug+eNNAziSqEvK+kJzzSfj58TREaOr+8EQoaTUtSpCdkA
 nMRUBGfFmVoyITCM4VzBfRjuvwrc/aNbKmp/OftnBAMcvl5sU3xcdfwAPgPe0A30xy5R
 QgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MG0UcDuTmhCAz3mOj/tjGMPWdlek6t88bi1IXitM3dc=;
 b=q/JXl83s4G6wOJBLrSw7bWV1MXEwU8qSNkuWZxghkvh3K5jo5mwht6PwgDJc63dzDJ
 sIQPYLld85R6FeYW0j1rUFdp999xFiqEc1OpHInAOc6/IwSbaDoWW8wd10hb9RT49jvW
 1lzErjSZ3YtYsD6AZSXxhZYlqUOIxM7fVYfuYNaKiFGZmYZlzbSiua5HQYzFULFVzDKO
 KlP3JwZ7rpFdapafTZd9C46wSsOMmZXhqsrkMLuhgKSWEy91LECp1Ao8MsfS5CXJRuFX
 PZl8o5xM7WZY00N0vTIbq6dArTceRbeMrDg+7DMvume+PVu7k5G8BWxy29po5bYcGlce
 mxBw==
X-Gm-Message-State: AOAM533TQWEpj1iugQYH+yLBFimRQ6blPaXPcYc4bVPmwUsOkHgSJ/iq
 JnszYiQ5a/VQcXIrE7burAA=
X-Google-Smtp-Source: ABdhPJxljOc46LeX6iByBE7ryl60id+toVy9Oeillh9upVxSzVbgg0FI/Jgc+88nQT7Yu9jSu65oow==
X-Received: by 2002:a17:90a:6c61:: with SMTP id
 x88mr16592187pjj.13.1604302260701; 
 Sun, 01 Nov 2020 23:31:00 -0800 (PST)
Received: from vultr.guest ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id r4sm4763065pgs.54.2020.11.01.23.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 23:31:00 -0800 (PST)
From: Changbin Du <changbin.du@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] riscv: uaccess: fix __put_kernel_nofault()
Date: Mon,  2 Nov 2020 15:30:52 +0800
Message-Id: <20201102073052.199638-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_023109_280514_9BBB8C4C 
X-CRM114-Status: GOOD (  12.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The copy_from_kernel_nofault() is broken on riscv because the 'dst' and
'src' are mistakenly reversed in __put_kernel_nofault() macro.

copy_to_kernel_nofault:
...
0xffffffe0003159b8 <+30>:    sd      a4,0(a1) # a1 aka 'src'

Fixes: d464118cdc ("riscv: implement __get_kernel_nofault and __put_user_nofault")
Signed-off-by: Changbin Du <changbin.du@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index c47e6b35c551..824b2c9da75b 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -476,7 +476,7 @@ do {									\
 do {									\
 	long __kr_err;							\
 									\
-	__put_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
+	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
 	if (unlikely(__kr_err))						\
 		goto err_label;						\
 } while (0)
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
