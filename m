Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72D8E83057
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 05:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hktRArBMkk/7ug6JTvsiW0kv5/107rh48exHUzZbrko=; b=KNVAWDSuzkePkx
	zDCLP8uC+pVpHr4gZdAprP45dESaIxr0IA4ApvS8WbBbKCCpNnu+19snqvGTucpsGKu6dU7cY6B+Y
	ByvTLqzuTgTks9Ylf5dt2n6nBLKe97wVAx7FdBDb1Ay4wnHq9GALbsoIWQrEaQdECenXvWR/aLxc8
	ljFWmBTueza9z2kXdwkXwaXGq+epWyQtpVFewY555OtfOCYuB8pbtf/c5Fk2CEGwHt8Td9HIXmfAH
	IWNsm3eJ5edB/HyU2v2I2QyaS7LlYyYyD8QviJKWimlWalf65Vx5NZNIPQk8BsWldmFAg8BM8Cwom
	zTGk/MVa25vp1fKP+iRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9Ll-0000000699o-2Ic9;
	Tue, 03 Feb 2026 05:53:23 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9Li-0000000697F-00gS
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 05:53:20 +0000
Received: by mail-qv1-xf42.google.com with SMTP id 6a1803df08f44-894774491deso67023576d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 21:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770097997; x=1770702797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxSsUMeT8Os/CYFJWOVT+HQkubqBYSe/TOEbnpWLzSM=;
        b=hdezR0HMhp9de1zDEUzKsA6bu1WACMEtpn6Of/MnaEm73cX6xVd1neqyd1KQ+CveYn
         kbo55EbuUFsYNTVr4bd1/ANNMiUoYzXCMPaC/e6BhOcffiIkbhLLgx6Y2EMKeIIjee4V
         3lpCiepZXTK8bBBxZ40X7uLIbli+YYvpmMSbwaixSxryze22ANmx793jhsekcz0OUHIy
         iPXSs1shZ3PCgNTFZISAYFdY7IjGVNxZaJfCWzGCLI795OuGN7MWR+a6e+UU4s4yiIVZ
         LQTFfCjnDTk/YsBCsYQzjSOrKsibVqmiw8GhvhCncnL1TgWitCPlc9W3rsr/MQLkY1+U
         XBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097997; x=1770702797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxSsUMeT8Os/CYFJWOVT+HQkubqBYSe/TOEbnpWLzSM=;
        b=jpw5CVUMeXWObNzPPt6NAqBHsPm9uFKlE85eFZ8s6ajr7Cv9feJM5kiRrR+sQfQaHo
         zveWZDithKxqp93m0KYx4pKGcgILtHshDqjJPTbelOEIzMmuG9EmadIlyhefEN2Sf7TG
         FHvzT6PTRyMgA2P7xLLBhUrgJrlup26dZijWPSvWD4Qx/Mr+lOdkxnEwp2yO7V+RilMj
         hG6XaZYkBIx0Zzo2vzZP11nQvRcQGmMOUea+bRczZYYnxgOhOZuomRKKuPqhbFM+Xm6g
         H7D6LE44SV0SfEZducGJaRspUUllfH1vVkWUJ/re5Jlx5Lztn3UOLC72LGxxjGm/u2mO
         rYsw==
X-Forwarded-Encrypted: i=1; AJvYcCXiOdqT8PuTEtxjWKKsuELNJ/Ro7ukz6mDCjtrIkYXGFYZ+AGVOeW3FSRml8vyNCevgQvskLPd3fJaqXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp+Uza0zW74jR3/5cDwrFBwwP+RUCDHoVZsEWIODRCvYdEOgCk
	bXaIt+Q8Sy6n22pixGSdIin9AYugMBpFUPTS2ufnWa6JX5FeKpaFtRXu
X-Gm-Gg: AZuq6aKVwpPHvsSu90UO0NxlAoe9agaVyOqplHX3tG6c51G24s9g72N60BfG0CFK+PE
	52iI2uj8b4kJZrFhIyzbyraF0c32Eyk8S0E3q340PqczURnbZjJwdRPBEeg52gmSevko0BMRauJ
	xxowcS4s4HocX09DeDIZxtjKy36k5i9ZhFlM5Muwc6fbz4cIKE+UpF4T5hMpwoj0wkY456t/cLT
	I/sbfobxeMnaGHi2ExvvtvcskLulBiE9+j+/aJRPlev4LZ9FYmOV0cc+OS4V88lqmnfQ/yE7qCl
	oS/yq2P38/1ZZs39gZS7VtdVE8l8/Z2UdZt6J0asyB0qXV2/hRtSLbdtcRGf7TKcIEra4okhzP3
	ciXa5jQTKU+1SjDOn7qA6dF5/xFbn/GfLnt8W9DWeCcaTrRL6YhyMK/cBhNKsb607jqwmERsUMN
	Amz/S7u6s=
X-Received: by 2002:a05:6214:e8c:b0:882:5078:8da1 with SMTP id 6a1803df08f44-894ea0e654fmr202391646d6.64.1770097996666;
        Mon, 02 Feb 2026 21:53:16 -0800 (PST)
Received: from 7940hx ([23.94.188.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d376e65bsm129844996d6.55.2026.02.02.21.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:53:16 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiang.biao@linux.dev,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 3/3] selftests/bpf: enable fsession_test on riscv64
Date: Tue,  3 Feb 2026 13:52:31 +0800
Message-ID: <20260203055231.1088479-4-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
References: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215318_063212_A5810146 
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

Now that the RISC-V trampoline JIT supports BPF_TRACE_FSESSION, run
the fsession selftest on riscv64 as well as x86_64.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 tools/testing/selftests/bpf/progs/get_func_args_test.c | 2 +-
 tools/testing/selftests/bpf/progs/get_func_ip_test.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/get_func_args_test.c b/tools/testing/selftests/bpf/progs/get_func_args_test.c
index 180ba5098ca1..075a1180ec26 100644
--- a/tools/testing/selftests/bpf/progs/get_func_args_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_args_test.c
@@ -167,7 +167,7 @@ int BPF_PROG(tp_test2)
 }
 
 __u64 test7_result = 0;
-#if defined(bpf_target_x86) || defined(bpf_target_arm64)
+#if defined(bpf_target_x86) || defined(bpf_target_arm64) || defined(bpf_target_riscv)
 SEC("fsession/bpf_fentry_test1")
 int BPF_PROG(test7)
 {
diff --git a/tools/testing/selftests/bpf/progs/get_func_ip_test.c b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
index 43ff836a8ed8..45eaa54d1ac7 100644
--- a/tools/testing/selftests/bpf/progs/get_func_ip_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
@@ -106,7 +106,7 @@ int BPF_URETPROBE(test8, int ret)
 
 __u64 test9_entry_result = 0;
 __u64 test9_exit_result = 0;
-#if defined(bpf_target_x86) || defined(bpf_target_arm64)
+#if defined(bpf_target_x86) || defined(bpf_target_arm64) || defined(bpf_target_riscv)
 SEC("fsession/bpf_fentry_test1")
 int BPF_PROG(test9, int a)
 {
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
