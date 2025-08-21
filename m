Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F46CA0FE4
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 23:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FboYejhIXnGzSF4/SV9DC2TcsV3zt02+XBe5VEBgQBI=; b=XRnja53fvcjWaY
	60gq70VtIdoYYnJM9dw4yRRYt6J9sy7Sxs2xx/MPtkn3hJ628PYybLvlWGFuRhJ8GzjK5xa3NeAXA
	GHFmoTYlDMpPwaeqyLcHxCO0UIIMJQJYeFocavgctMceZth9UDNEtsnvVhq1OxsEmDmTBzIzCwebR
	G8sdydzpuwCDu1BuzZzTGvFpKw2hnbB0mdDUgLcVBYTrt0Z2wqFvpd3SS5oyudBCzWgQ4QOCi4Jq+
	GCtr0tJoyaZIx4GMg4Ggfcngub8xYDZMeafgNKftNfgzvYNhEy2zUAleULv6Gg1afh55jyMOWdGQE
	hNhr9rFq74wVvcsIhrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEWB-00000000udN-3FyY;
	Thu, 21 Aug 2025 23:16:27 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9Gm-000000005iB-0oB1
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 17:40:13 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb7347e09so215610766b.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755798010; x=1756402810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fy0q5agTDRyofy0fsNfLOTICm7ccThcSJln5HnL5Dwg=;
        b=TsOIS2fQrJFmV528yN5JldMDzVUU56R2BgvwZljL49GxiW2ewet/jXYFLEutK24veR
         VXtwMKazdeIl2a3ZXZR8ncIlg5TZiKbGhTMkq14ggRcF2VRPpd61HwP3Unk9kPLat4FK
         FJlguOTEafshO/dhsKMkKooXzk66giWLz22KrMNiu7CiQy4CVDcvFLyb2shzDcDgJc2K
         Yxe2PGdpMVz5A3yFnsbb5IXByWnIeIgg5NqXhECQxBmCEja8TgjTIA0oND1q/EI+Y5Ru
         Owan48HzzFqG+xjCJXPlkEJDt+ZlsngE0RotJQrZ8wjaMxVQgVIdKnMzQKljJVTGBJyu
         sVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755798010; x=1756402810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy0q5agTDRyofy0fsNfLOTICm7ccThcSJln5HnL5Dwg=;
        b=iDGAhUg3lLaqxIQr6McOkGzIwXfu9EQ3mQbtiLQVmXaxZ1WzsHfjpnyypJ8Zbd6Ngb
         8T8/KJ73Gx301OeaKV1cW1Tg6IqpuW/tXJ1nH5032spK7SfI7o8q504/Cxp3I/mO46Tg
         OKjLotUw4F1JBizkuVwMKHBMR6lAAaKXYET/e2Ik3QiMOgU6RSvZjQ1ZZczKH5herFiR
         w0p4RaEVjY4mMU9/WD48ysNtzg2HKsaStXhf8s1a+6i0r+gn4TiQCX8RhN3BOiWAXdSh
         LlMuJzSn26j8wtDAjdknrMqCmw/Z1Mrukkqi7HBz3o2cHTWm30130Hncbsc0fFax75ml
         R64Q==
X-Gm-Message-State: AOJu0YybEuZvw16aogOtGbHmZWch+kDbmTHLhDdFSJZL8qM6heZ4KDBE
	hNyfphzOuneM7PQxNS9SIwQS/Ue6D3cixZnmyaLSJuPkv6DQPRLXM5zgLTtoHheI8/s=
X-Gm-Gg: ASbGnct5FkXbBr2CHMXHzJtQ77ZF+YeDLizo2GExe6roMkcSxVvz82YH4DpNILjExpN
	pWEHgUkn2nbnwn2BBumLaMMFWVnfVMZJLNAaJhssUbMyu73a05bA9mTaEif1cOc9I1L4gNoA40k
	PSYNoXmuCfobA3K1kOVcpkSIG7/9xdtX++SbhDyUGvMOoNDxqa7W+hetUF8Ty7vXYyxy620Jl+v
	LPLe2m40e9k79q2j8z6++y2Mph9AjgbrJ8/T4owoDMLSw6eqeHnwLa902qs2L0PG1Sev5ilqZHn
	bF7CSe4gUO3KG1Rne/dAv1dCf2laOvGHFipp6vwhauf822+PhN9fbNVu+FQMXusHaF3DNtVTmMp
	kdU0dVxpjOq30zoKnQQIBWmIN/A==
X-Google-Smtp-Source: AGHT+IGAy5EZ5DUHnsPFAMnn2L3yiI7i2y2A21NKrB3daSt0oG0Pph2v2JH9rNdO79XTM9hPqHfqtw==
X-Received: by 2002:a17:907:3f97:b0:af9:613b:3055 with SMTP id a640c23a62f3a-afe28f836eamr884866b.2.1755798009985;
        Thu, 21 Aug 2025 10:40:09 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4c9c12sm422705266b.82.2025.08.21.10.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 10:40:09 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH 2/2] riscv: vector: init vlenb in vector context allocation
Date: Thu, 21 Aug 2025 20:39:50 +0300
Message-ID: <20250821173957.563472-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821173957.563472-1-geomatsi@gmail.com>
References: <20250821173957.563472-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_104012_233238_3C132643 
X-CRM114-Status: GOOD (  11.34  )
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

Currently, vlenb in vstate is set to zero on vector context allocation
and remains zero until the first context switch. This can expose an
inconsistent vlenb value to user-space in early vector debug scenarios,
e.g. when ptrace attaches to a tracee after the first vector instruction
but before the first context switch. Fix this by setting the correct
vlenb value during vector context allocation. Simple reproducer has been
added to selftests:
- tools/testing/selftests/riscv/vector/v_ptrace.c

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/kernel/vector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 184f780c932d..6ba68568735b 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -120,6 +120,8 @@ static int riscv_v_thread_zalloc(struct kmem_cache *cache,
 
 	ctx->datap = datap;
 	memset(ctx, 0, offsetof(struct __riscv_v_ext_state, datap));
+	ctx->vlenb = riscv_v_vsize / 32;
+
 	return 0;
 }
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
