Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E578FC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XVdrZ8km1kYcGh+xtOpjNzGOlxB1100kkXoWMqNVl4=; b=1E4Cidn2cntNW+
	/JMqF19EUYNm0vq2fXLlP5qgajfE2pvctIU0Nsh9EirRa2mFWMO7nUyzW5Dz4P8eqVUunU7NgrvLD
	T7VnzeTvhdShSgfW1Gw/ujUtNPSLO6wu8wnehHxOxB+lWt8ngJJCoqor+6QrBklo5f/mWa7mWVR1M
	BxYnf6yhNN4to7SPsBXxUDxuvVJZrok6O4TeO623CqOEwR/gRQbOXrJyFnFxq/i/jC6Wh5w1pNtwQ
	DxHP1DotO2wHU1LMcSbXki27ckBw/6fdL4LQDjZ630GqD5kxEFn0ntaou1p5yKIaB0V+OAYG/6RJr
	0CDshkWiTjOMBsXQpe1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3gW-00BKK6-0y;
	Wed, 03 Jan 2024 16:01:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3gT-00BKID-0n
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704297692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tvTrIj9bDaC7vtXATJc2+i25LfcfP+uiCW+wrXL+g5Y=;
	b=fzH53KVa/Xm6vAnUBO59vKA7mgrMiN8X9LZIKToednw4/0sSe/aunZLmx3+3kSs/AMiadV
	t0D7NfYpeBlohzp0cA0RnYlr+YKvbiVq/SCDkkx4VIVHn1+SP1LM+Y8luiZG5EbpTe71Ib
	cgCMrPnKb3afhDJgJ8ViXOtKYvDrQP0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-Fb-xArpmO3aHXIcQE6-Hgw-1; Wed, 03 Jan 2024 11:01:31 -0500
X-MC-Unique: Fb-xArpmO3aHXIcQE6-Hgw-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5cdfa8dea37so430330a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704297690; x=1704902490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvTrIj9bDaC7vtXATJc2+i25LfcfP+uiCW+wrXL+g5Y=;
        b=p2ACOtplcEWbZfajSFqFgbaiyrAZl/OnhbRpN2242I7PRE4cWSPvw+u484/q8W1VSr
         1dOF+rmk8sndcUJ0IfTqOsgMlD+wRO43o/Sbfngy2nOF8P6y+P5N/R7N00VTXiDdMB32
         YZuqhNN3uHl/ATPaeLStTe8iuz/2MFrgRpgtSaGGSm7CMge15vgVR1bRETezukhMx9+/
         8AqVehRmH7tHpOohiu44+PuU3QYCmAFHmYJ7RKH6LB6UONkSD1N8zK5BTsPFLT25WiRL
         kvw52Retv/E5sIM2Ho7gPkDhoV1BnexxPFtxow+Cm4Np7zhGMVOh9gwhWvMDLKQ2J7iC
         BR6A==
X-Gm-Message-State: AOJu0Yyw+RXlVliua1v/8+RJJqhMVTPWCMbsKdsky+TycPBOL9sB9YJw
	7p7syTJQb+A1Ae5sq5mr5ImD4TGRY2EoY+NsrpE7MdpSYLJ8iuX3xcNPDU5GRvEc2iJPHyatf8P
	TIqN+BZeFN7+WIbKbqY7mOepDP9x35HpOL4aR
X-Received: by 2002:a17:90a:6c41:b0:28c:8db3:deee with SMTP id x59-20020a17090a6c4100b0028c8db3deeemr1641818pjj.7.1704297689921;
        Wed, 03 Jan 2024 08:01:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLk0qBowIms70OWWZMDrR0eSOerzAwBSl15cF1uRBrdZRmyJm9IRzrY9G6FK4FX/myhaWIiQ==
X-Received: by 2002:a17:90a:6c41:b0:28c:8db3:deee with SMTP id x59-20020a17090a6c4100b0028c8db3deeemr1641790pjj.7.1704297689594;
        Wed, 03 Jan 2024 08:01:29 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id qc8-20020a17090b288800b0028b1fce7c01sm1922253pjb.37.2024.01.03.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:01:29 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Greg Ungerer <gerg@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	Baoquan He <bhe@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v1 5/5] riscv: Introduce set_compat_task() in asm/compat.h
Date: Wed,  3 Jan 2024 13:00:23 -0300
Message-ID: <20240103160024.70305-7-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103160024.70305-2-leobras@redhat.com>
References: <20240103160024.70305-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_080133_354602_31C8A00A 
X-CRM114-Status: GOOD (  12.30  )
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

In order to have all task compat bit access directly in compat.h, introduce
set_compat_task() to set/reset those when needed.

Also, since it's only used on an if/else scenario, simplify the macro using
it.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/compat.h | 8 ++++++++
 arch/riscv/include/asm/elf.h    | 5 +----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
index da4b28cd01a95..aa103530a5c83 100644
--- a/arch/riscv/include/asm/compat.h
+++ b/arch/riscv/include/asm/compat.h
@@ -28,6 +28,14 @@ static inline int is_compat_thread(struct thread_info *thread)
 	return test_ti_thread_flag(thread, TIF_32BIT);
 }
 
+static inline void set_compat_task(bool is_compat)
+{
+	if (is_compat)
+		set_thread_flag(TIF_32BIT);
+	else
+		clear_thread_flag(TIF_32BIT);
+}
+
 struct compat_user_regs_struct {
 	compat_ulong_t pc;
 	compat_ulong_t ra;
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 2e88257cafaea..c7aea7886d22a 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -135,10 +135,7 @@ do {							\
 #ifdef CONFIG_COMPAT
 
 #define SET_PERSONALITY(ex)					\
-do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)		\
-		set_thread_flag(TIF_32BIT);			\
-	else							\
-		clear_thread_flag(TIF_32BIT);			\
+do {	set_compat_task((ex).e_ident[EI_CLASS] == ELFCLASS32);	\
 	if (personality(current->personality) != PER_LINUX32)	\
 		set_personality(PER_LINUX |			\
 			(current->personality & (~PER_MASK)));	\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
