Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A346C54E60
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SNqF2lpLiH8ZUfsaXdOpFi4sH8I3oOxt6herzx53cI=; b=QpPge08MxsEWF+
	utyWu9C7HoQz8uRQmIVLqJ0Rk4ZQG5eyqE9YdRxMEEoXchrHLS29GshXggdowE4Dnf80MeI9GAe4K
	6H5PQEkAbB/KNS7I3x6Eq1ZG0+7VrD9rb7P2VQy9k5KlXQoUNTfj4WuLC4Gqiez/rbalbzTWVp7YE
	l2zXPqz/r/vwmg3h6MOct0KTw8Ni1vSJN++Lnz8134pAIf5tSGalMqN4gWWAwdnxmPPDkif8Hhgny
	x7a9t00sQy17oTfSli4bs/UyoDH++/6vQ+Sgb1PE9eSA1oBzl8Nqd+8UoyeptLZ+VeLK8+VVrXWfH
	zeeLMy2WvzGAqw8p/tAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1NI-00000005lgV-0IJ5;
	Tue, 12 Mar 2024 12:36:56 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1NF-00000005leF-11KM
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:36:54 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-29be9c136a2so1851734a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 05:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710247009; x=1710851809; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MCJHlDLKNkptbzcqOFzybUvyb/uygvtDPI5/Ir2yQK4=;
        b=jQCxl3pOzd7aStkeBx3p6rZ6i2IG02t/hOyvEWGl+3QcER5UiFqBU578IGesr6on9m
         dlxV2e6Fs05yrAb/Q4dDkrk2BiPSgtxXk4vCVbn5fSgAACImSDBKZbs3woLY4VSBQgTR
         ZxqolTxon7zI92CN/ejgfMX7SL5zss6Kb4HmMHaynl1Q1u4jI1g3r3HzTZbN00JQ8kwI
         B+zE7nvcJNx2QOPV+w8GN6vCMiFteE5yVCHz387kVQXdHzi8VdmXMn+uqwzuz/3IzZof
         oGT5YoGLeHbbrbUbU3VKLBrpg9VK4BuDlFF8/k4oXmCbK8FLPjPXpKmc9KRnT9kUwhK/
         b75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247009; x=1710851809;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MCJHlDLKNkptbzcqOFzybUvyb/uygvtDPI5/Ir2yQK4=;
        b=DYP025e+rC/B2s7P8rDp9ot8gyBpVo9obkUvcAUhIiVOPUZOOA5y3MJTGC4JVr09Fa
         cQ5KGU39fqoUtoDr9MOPgtyr2yKSXR06ci6P9vJui8hxWCHuLmca/mOk95f8jquxKLkI
         8o0DZuiMdpt8mC/9UTEOvr74YNq0lzeSux6D6GTIJlY5GSa/XCR/HtPmW9lJieIJdk/d
         LIyqQJrMVdP2URic4FflcfFCQwIlVmLXeFT6bRrbB8LHB2iOYW69chbzjcWsLjlVJ+yF
         VdbL+wjW+1EBd1rKAKvhO98i6mbHb/yqQgsRi9ODUBA+Irnzyrien7KNVXyoxOY1H3+e
         8neg==
X-Gm-Message-State: AOJu0YxzXwQ+U06uU7hbNQNEKThO6Zdo/uGI7L6nZCn8h0Xizle2PmXr
	rVR5Niz5QEXNaM2YbxPoV9jzbmqE+0u+p8teMBugCKVxndq4oGP56JFMvmLsR9Y7o2rafIwTEBK
	BHqjzzRsnw5uIkBytnmO9BOK0+zeYYKGZhKpnmWp6l8sX17dr12D9Lo8jTdkuxvi2+K3AAqi6Yi
	/smbaBw2wGRuxAGFbJJmHWucMWpbwNILw0kMbpNECGqaIOi2vB2gzR
X-Google-Smtp-Source: AGHT+IEGbbQnsLf1uJIzhNAv4yrVpUwznkn2I1fNvkVP19aQi82rv3ij8Q4YQEMg2YYlnLG4au/d2g==
X-Received: by 2002:a17:90a:bd17:b0:29b:ecf0:c788 with SMTP id y23-20020a17090abd1700b0029becf0c788mr5286611pjr.4.1710247008995;
        Tue, 12 Mar 2024 05:36:48 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id hk13-20020a17090b224d00b0029c2794d3f7sm1804233pjb.7.2024.03.12.05.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 05:36:48 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [v1, 3/6] riscv: cpufeature: call match_isa_ext() for single-letter extensions
Date: Tue, 12 Mar 2024 20:36:24 +0800
Message-Id: <20240312123627.9285-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240312123627.9285-1-andy.chiu@sifive.com>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_053653_310096_B900DBF3 
X-CRM114-Status: GOOD (  10.19  )
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

Single-letter extensions may also imply multiple subextensions. For
example, Vector extension implies zve64d, and zve64d implies zve64f.

Extension parsing for "riscv,isa-extensions" has the ability to resolve
the dependency by calling match_isa_ext(). This patch makes deprecated
parser call the same function for single letter extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/cpufeature.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b21f1e568e1..8986ceb58188 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -470,6 +470,10 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
 
 		if (unlikely(ext_err))
 			continue;
+
+		for (int i = 0; i < riscv_isa_ext_count; i++)
+			match_isa_ext(&riscv_isa_ext[i], ext, ext_end, isainfo);
+
 		if (!ext_long) {
 			int nr = tolower(*ext) - 'a';
 
@@ -477,9 +481,6 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
 				*this_hwcap |= isa2hwcap[nr];
 				set_bit(nr, isainfo->isa);
 			}
-		} else {
-			for (int i = 0; i < riscv_isa_ext_count; i++)
-				match_isa_ext(&riscv_isa_ext[i], ext, ext_end, isainfo);
 		}
 	}
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
