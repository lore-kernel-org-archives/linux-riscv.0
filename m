Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64749C48260
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fulgvtyNzYaaktVEsQvSbYfj6NVDRj8HO64iVhsVJWA=; b=FxVViGxeBBE6gX
	txzkPgTLm5LGHMbY+nxq278L4oB9J4akCv7h86LGZwVPlQLdduETKaTS7f0GETzMFbcWx6lJ2nkm5
	ZbsWKDQ8Cu1Gv6zrU05t9dtwiB1FGs0uD4GauXKN3FFwkR7i4ah17Vn9dXx1YNaCpic6Ot3Ve79Ts
	hh+Oc3Ml4fM0MwJFamFeTKD//NJYZtyKREnl+xpTsESwtuHwwnpBCKiuFVey8j9LZ++ikSovJb4Qz
	enMuzwYklUPQIUr2xEZrEEXcReuXAsUubCiSVzJ+iT0qHrsnZiUYoS+1B5cEJ6UHTbK0AN2cVg1oh
	/L8ERlfX2D4EgwvJwuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFx-006m4z-1g;
	Thu, 25 Jan 2024 06:30:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFs-006lzi-2V
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 06:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4ROIIq+tfSuVQ8U/gtdFWUWXai61z50x8X9vsARg+kI=; b=aUV0+kM+JqwubYrhKUaTt1fSyL
	TLFgM9zHP/FhZlsB44ZxmO4aIf1OOkd11hctY8XXCp9D/PobOCw/xdQ8wJX+tb44eoYbgz9GMOkIF
	BPwpWIRZhu7ho3NccbCZGeRXXs4SzswUUDwMlYJBqzqDInX3LQ09Te9kPX/bUTM5P4xcFXg5Be116
	SjPwfzGhMBZc+fzzIpR9a8rBnExwx1SLxn2+QChCFaVUj3tpsMal/YoAWWOCwPX457Ax+LopVtnm4
	Wgxpway2USFKQ2ShksB7qsnqUvCu+L2TuqtqpEPOyNYXIfyuFC/H22EerQO+/HAE7qNmG967laarn
	O02kSBzQ==;
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rStFo-00000004wfc-0KvE
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:30:26 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-599d1fd9cc1so705828eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164218; x=1706769018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ROIIq+tfSuVQ8U/gtdFWUWXai61z50x8X9vsARg+kI=;
        b=t1fgciikNYAIbgsK9XeS/c9g+X8hakbqpbEkIUMZxQ7EM899x/hqrsozByoNemnoRG
         Y9OH40WBRBHifBj2L0EXmOL/CVWllXwXxep07kmux8h+nmysMZaJoybqWrppncURtjz0
         9rEgizthccfaQRBtlP6slgbDxJjA5uN8VEUEHVlZaN5uUVbT5hOuR0tZ92fVlKgnyEs4
         l2Y4m4Sm/tmr9lZRoXRsHxPfVzXZMYenm9yK1jcqZUv6qtV4uAoYlYiqSR4b0X8WRzMi
         uumEa/Yh/1gMHQxfnVfPLlLtOilxfLwVMfff+W8xRrymja3ZYH6x3ujRkj6AqpTN/5xr
         pscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164218; x=1706769018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ROIIq+tfSuVQ8U/gtdFWUWXai61z50x8X9vsARg+kI=;
        b=l4JsF+sxv2Fs+sdIqPsBD4hQ+/IfyEYJBY9mg6gg6V529k82xtPM69aCXclYupmPgV
         JlFZBfdcsIy5hjJZzVra8BDVQjZ10JY8G/UN1aizQXPntXEkb5wrw1Fixst9kAtFQuVA
         iUf9w6jfw4+WFFmg5xEw4XJCty8FpLOlm2H++phEySdw7lpL+czreGnNVhQgoBWlcKk7
         C8I3N1kcc9vJlT3ulPbEx+ghAHVsqW2OuiQo4yyzKJ3e67hYQEimGwCGeT2SOCWpl/Bc
         SX9TDohGhptI+Sly4I5TWXswXcp/SxbBxiHMrfrTU+bYso/aBm2tWv5o3Jmg6Al4Zw74
         dd1g==
X-Gm-Message-State: AOJu0YwdaChXHAjE9+cryr7tg24Y6hClhrEyoQegvkkDypiziIxBbJjZ
	TUpfAAkT9pT5YeFPkPCZD381xiGhWcMXl46smIoY02k3czs1Yfa3H95fRlf3fHA=
X-Google-Smtp-Source: AGHT+IFCTO1aRpreluHW/C5C9tNmtfREjRA/JGLkNEyuOfgIi16e6JM3wL9ZmcIo8frDDBAlk8/Blw==
X-Received: by 2002:a05:6358:94a9:b0:176:1227:8735 with SMTP id i41-20020a05635894a900b0017612278735mr688376rwb.58.1706164217947;
        Wed, 24 Jan 2024 22:30:17 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:30:17 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 22/28] riscv sigcontext: adding cfi state field in sigcontext
Date: Wed, 24 Jan 2024 22:21:47 -0800
Message-ID: <20240125062739.1339782-23-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_063025_250373_D39A73FC 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Deepak Gupta <debug@rivosinc.com>

Shadow stack needs to be saved and restored on signal delivery and signal
return.

sigcontext embedded in ucontext is extendible. Adding cfi state in there
which can be used to save cfi state before signal delivery and restore
cfi state on sigreturn

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/sigcontext.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index cd4f175dc837..5ccdd94a0855 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -21,6 +21,10 @@ struct __sc_riscv_v_state {
 	struct __riscv_v_ext_state v_state;
 } __attribute__((aligned(16)));
 
+struct __sc_riscv_cfi_state {
+	unsigned long ss_ptr;	/* shadow stack pointer */
+	unsigned long rsvd;		/* keeping another word reserved in case we need it */
+};
 /*
  * Signal context structure
  *
@@ -29,6 +33,7 @@ struct __sc_riscv_v_state {
  */
 struct sigcontext {
 	struct user_regs_struct sc_regs;
+	struct __sc_riscv_cfi_state sc_cfi_state;
 	union {
 		union __riscv_fp_state sc_fpregs;
 		struct __riscv_extra_ext_header sc_extdesc;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
