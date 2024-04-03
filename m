Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEF0CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dlfL+tNmksiWYGxX5vXGTR2x0XA32H42jFWuqQxkLY=; b=18yMX2po4xCIe3
	mB61qDdqAF8O6UHKWNxI8rfmaTjvt6NY5DjBlGk5JjsQQZ9apBbo+6gu7+O4FpPube4BFV0wW1WFE
	oubP3EdCEePEZymx+yGyqgYXjFwBlMLOCLxhKA2xBv3UxJsUQ3RkMCsfvYUPAmV91+I5e6dmVPhZ1
	5BM29O/+JfN5kj0ZU5pqcTv8hjIviqdHmBRUPQ7r847sNbSHh0+xC69lKJZWONnLSpBi/fAvDYZi5
	UME0rYDb+2OtA6c7N0ThvkFwWREH80iGzqqAmNiPmD9me4Zm5ja05vixfLlgzWIwNF1ikJwMDDm1V
	ySkIPLx/flX/RlMO1iBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAGU-00000000b8c-20NY;
	Wed, 03 Apr 2024 23:43:34 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFi-00000000aQQ-4Ade
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:43:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ecea46e1bfso131724b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187765; x=1712792565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqdiAdr1yNbBMpdTZAViS/5DaSW59POCvFmbCyQTXxo=;
        b=n2zuocLwfZ3GUiYqYQGc0rye+8985nNhzq1KIxhTn78INEQHMjEW7v+IjlApDYUgRL
         Lh0Y3zdjOtOToUdguwXvq55lYWusUfklNTtf1BqPeBhS9e/DGbNRSpwLRJQp1sw1jqYa
         emHX0cLhGeXfeILbrPkIYnaV9T2anKnT0YKN+ZSLKqxeLKtAKpvMG59vk1oTu/UZ56up
         4r819WJu26cWN4AmiVuvsGgCAA+ahZ8d4SzF6KRk6heUnUhtqw84Sur1F5tUvBcDNEY3
         iWXyBCxaRClXcN51G3oQQdFSe00fl0BDFklc/HjjCs0phVOVu9fIvMj4DHASXjqYXYIE
         7ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187765; x=1712792565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqdiAdr1yNbBMpdTZAViS/5DaSW59POCvFmbCyQTXxo=;
        b=r8vDLsG+7E9ss8iYv4t5Y6McGMz9PJMAy0ru/0DcPJ48e99KkEsWG6iF6QfjiAG8FU
         ePki1XDgLIbwpytZqQLA8+Fe1AI1DkGL9o0Nl5s0U/F8bN2jkBE5+F8KhAK/Ylz2UPk0
         SOkf25xrAVifBk9yL9R5CAgGzAcK3NGITxOUFMMByP5fXuUo72H2/2TMuobnElPCH8+A
         RiX0jw7SACNXxyqiR3pJ2gOegVWouAEmezW0eXmeq8Bj5dT3LXmK8i2Q5QJ2+NeXICy+
         dmOf5jGZJxHQkRshGGY+Byom5wA+xT8TM+A17R1jFb8UFiXSosntnFRt7vQE8FG+o+A0
         6tAA==
X-Forwarded-Encrypted: i=1; AJvYcCV7uKozrXXpFwoqIYaTpz+SL0+bFN7CD3HY4sNGCGPyE8J26VEBOxaldrBu1ZSKrM3hkLOPTRkkvyC6qHB6V2QCU+0AcpOjUSoqEOpq+4/O
X-Gm-Message-State: AOJu0YzwsmmiHH/uBaUEyCY8pAwguTp6ypthZy8Qx9GgcGUWUyUPimcO
	vUEmW1NyJJs17k50Zjhdk4JWWtmelVDMt0XNaZHQ+zAg5poYFkj5RwAF/LekKfk=
X-Google-Smtp-Source: AGHT+IFo9UTPYbI7WojHDrQA4c7uxF6nWpUROcJy8v8Ru9VCeqKQcLt71oVNVn3YtJu+elhu+4bSwA==
X-Received: by 2002:a05:6a20:3212:b0:1a7:4df:d052 with SMTP id hl18-20020a056a20321200b001a704dfd052mr985278pzc.61.1712187764833;
        Wed, 03 Apr 2024 16:42:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:44 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 25/29] riscv/hwprobe: zicfilp / zicfiss enumeration in hwprobe
Date: Wed,  3 Apr 2024 16:35:13 -0700
Message-ID: <20240403234054.2020347-26-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164248_504856_7CF8CA6C 
X-CRM114-Status: UNSURE (   8.27  )
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..4ffc6de1eed7 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -59,6 +59,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
 #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 36)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 37)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a7c56b41efd2..ddc7a9612a90 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZTSO);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
