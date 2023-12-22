Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB0AC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 07:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnPuL75jiU5q04YNj7IVC6hPDXM5n0aoKCLrWh1c9rc=; b=q1ugf2NKUZiCrS
	x09TKETLTcyzumdWvhQOy6J6mBlQ1DXk0Wfbs4n4n2QxZStgrSZ6Sl3iOjShEsOeFlxuNxruMHkxH
	0aKvKVlbhFT9eBnPZ1b7daMj6zM5QzrsmVoUkR/u/StjrohFpfuELjWea6XKYWG0vQ0Kp0Wuq2SUi
	q059/01Gdx58fXOr/lM2Le20zxMZcW7QJpgjTaDhirilD7IWSnSPBkZWYjJgXbHO/3o10ucmVN6VV
	Er5dF0EsYJUSkGMP8EftOliC6wRoWshETOUbT+P6/Ov5GwxzqS2aMOM0Nl76oSaouXgwAap+c44K4
	aaoyIqwgxL9eVO1anXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaFK-005DPr-2U;
	Fri, 22 Dec 2023 07:47:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaFH-005DNO-36
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 07:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703231219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJKdTz0fBLuk4zNW5VLOm1jY/M0/StXJiYDFTohFsJw=;
	b=RcXVTPfzgaS25PMxz4QcBFxcNES86FdBLF4Mcc6Oyqt1XJMfp1W1PK6u0FEM87FS8886vJ
	pIj/VnLDshW8z5Cv6Ndz1HsPy3vVYoEPwnKpREb5h51pPRU0uML8jchWba4Rs50SWN8nJQ
	CJrQqIbf2Vvt+MBZFQ5jUy2r0cBBmSc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-zm7DUoIpMlaVo9dGIyhG0A-1; Fri, 22 Dec 2023 02:46:55 -0500
X-MC-Unique: zm7DUoIpMlaVo9dGIyhG0A-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6d7e5d286a1so1180993b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 23:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703231215; x=1703836015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJKdTz0fBLuk4zNW5VLOm1jY/M0/StXJiYDFTohFsJw=;
        b=Q7vkMdsNMZ+9tMZ85X8/Pi5EmGApRXJfzwwMgqwyXn825sTTWW8Swy2fT6TsRle0bC
         avqDfxlgiUT0SVzOCFYyzWRX2wyky6E89GV0qAyFNBSU7ThqDYfCH5j0auG3d2dG/3/W
         MgzVH3as6G38WJVULk/dj/O5BYu7MvMPMlscaxIJJh3VHF9SWZm4xUKv1hFG45AhY0Vk
         F0O2UvsPxvYO9N5gH/qU4n9b0/zW8VBRycWhsIlytpxRwQkeDkHkcTMbyt/tom79kq7D
         kBGCbdDGOgPrVfOyCHNQnPGdqbLm9jQ6gqpYRVH/r3R5Q7IYw9pWjNMUrxp1K3J1lfcX
         Jrnw==
X-Gm-Message-State: AOJu0YxOVqXH/ucM70W7XCc++xEbYe3vr43L/w7ThrWsFJycFBMqrTPC
	/ZkudEaLP6Si88Juvwxmq6ol3ct/wxxAc2yA+kRaIPkfw9FxyTv0nhdHW9l09G8ls0wl3F2YOEd
	/923LL/vptzb7udkX+jQsiIwhllcxhWEFt0Md
X-Received: by 2002:aa7:9104:0:b0:6d9:3659:5419 with SMTP id 4-20020aa79104000000b006d936595419mr998863pfh.21.1703231214632;
        Thu, 21 Dec 2023 23:46:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMFmEyFRjwKSQRTyr1Tjdg/8FK7+G5rpG28wVcUI80rZUZeycJ9jxcUGtZ0nSOM5ugBFakSg==
X-Received: by 2002:aa7:9104:0:b0:6d9:3659:5419 with SMTP id 4-20020aa79104000000b006d936595419mr998837pfh.21.1703231214349;
        Thu, 21 Dec 2023 23:46:54 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id m2-20020a62f202000000b006d97eaba6cesm1527015pfh.21.2023.12.21.23.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 23:46:53 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greg Ungerer <gerg@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 4/4] riscv: Introduce set_compat_task() in asm/compat.h
Date: Fri, 22 Dec 2023 04:46:04 -0300
Message-ID: <20231222074605.452452-5-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222074605.452452-1-leobras@redhat.com>
References: <20231222074605.452452-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_234700_068184_8B738CB7 
X-CRM114-Status: GOOD (  12.23  )
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
