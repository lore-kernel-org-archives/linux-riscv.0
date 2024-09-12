Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ED3EEE272
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RFX2Clyplhjxut79HTKRdAAiaRlBdANg9GS8IJJJyc=; b=zOQd5LJTUlJLO0
	32fDXm0q8pvKt6ynbDIYNR+RG3XDfeOS9Ll4gUJ4l5LokfTcU2i+fXAACDf2U2dqrryC9DjYYp2S9
	Js2n2JCuR6jMsvwG8ciMLZenQE3D4aW6c6VYnsXSP62cyDY5lODmKPmt6aAGHkR1bv6etyXh/tDut
	Eokc+3e8FH1qtsfdev8CeGbB+VMi6Qv2ViZFNqF6Nr1lb+B4gSSwk04KX+LbpTaXkDnz7ey1XcHIS
	pvRDL64+tlxljlFXYJsOPqE7fP3oVtPmeOmq8/3zqkwcaWzpRVGKodmppi86ZIIWxyh42vRKui83K
	0H4pZRFnioLvvMN7J+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5U-0000000ESOf-1uVJ;
	Thu, 12 Sep 2024 23:18:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5R-0000000ESLH-1Yst
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+38J+w59/fsg+wZPwkpHjWKQt6YBaFGJt3wtFmX9cIM=; b=MAIVeoJ2xCbALhX/wQgUmm+oW+
	5wNzag9EjAz+j7tU3Qaly0gqsxKZ5J0bCOd5TwXAmbeY04TkGKKDyqe4myHTwrmXU3UiIZo5IlgFm
	GcixMPgV9NxTKPqr/mD0ULijTO2rQLcaD2lZzO99Q8xcUTD2feXO8CIBi+G8jAGOyRu+q9PlHCYFi
	VWwYnXgaPBnL0iaVV3ATTPRMFFNEKjMcb68ayB3IIjA5uOJtw9zt2r4LCQ2UnNOvsAZi1gEHmpok8
	7cJu08iCcaTPpA24QRKXnWmd7mELxixjw7jo9zNT1Qg6qwZP22Ir8DfUkNpiaG2mI3u0w4HkYias2
	aGZGR+XQ==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot5K-00000000YGL-0TGm
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:18:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2d86f71353dso1108642a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183122; x=1726787922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+38J+w59/fsg+wZPwkpHjWKQt6YBaFGJt3wtFmX9cIM=;
        b=BPc+HtB1guMPvLqPtny558pCy1L5V1h0JpxNAt6FJ7hWqQnpwP+Jh4TAp2MTmk7fSj
         6KVcF42pNo2/rx/4HUsFgBhTRqsBgkmPA6gFrOre6D5WIqtXox+oKKd3DV24XJypsQmg
         RTrFDJ0EAi9HpzfiriHwTcmpZNWhqo0N2ONeELQy7ka50yuz2pa3jy3VKaCGtsV7oQoW
         SKon2bkcEuKqGv3HJlCcgWD/wR7Y5sumLbnkQDQ5ycD6mo4KC6qFXJ4LKWjonC2B4ixS
         DzgtyKrTOXbPnLs6f8ClWEO/10fiytPccx144/KkUE0J0v6oHWsG+sqMCxLS161VGNJE
         ZCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183122; x=1726787922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+38J+w59/fsg+wZPwkpHjWKQt6YBaFGJt3wtFmX9cIM=;
        b=F0Mf1R7wyJRTUEipB1V3M1UDQ9RPhwTUx+WzboWwzdqt3AxMzXlVIjkLgqM9aYstAv
         t9Rfil0b1gmsN06My4ZQhDmHt7ra+HXbMl9zMAx9cs8tk0EgFkvQAmFb1oyVAQ2SZEQ0
         /PLvcmY78sUJ92j9Yt5Vq3cAB136uPjZfYsGaeTadbdaaB4qpIDpZMeZLtPSNUOVIPfv
         tSHA+T4O/ppdcokAR36d+5DA4VW4uHd5tjGW7K/hAME4sdyL5+MUHNFfroMeyfd5nXs2
         QKwCbyhXyokZQUweE+6mQ/uY8xsm5wptbfr4diD3ps2qf/L1XGhee+A/rcUeBhZDzFwE
         j6pw==
X-Forwarded-Encrypted: i=1; AJvYcCVfYHLiL4sn6XOP3srD4n0QFzUbhc3S8WwV2e57X9ECgw2XcvPLhwwupR3SngOfXtq72MkrS7LPUc7SKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrluHtpIR+HaZVEuRDXDVATe+7KZnVzndAqdZrMQ0V0jxmxXnx
	kXEgfqq7nUxoOlpOxnbkloItNjUYoYcHA0WO86Oxnzua5HUI+CJDRVGQ5gY7z2c=
X-Google-Smtp-Source: AGHT+IHfT/S6FiX6u36xFuQAdjiVXSnBTlg8zgoeNqcnzuIIMjt0legeBCv+aVmkm3X/I1OJo91O6Q==
X-Received: by 2002:a17:90a:4b44:b0:2da:9115:15ce with SMTP id 98e67ed59e1d1-2db9ff94036mr4324100a91.15.1726183122337;
        Thu, 12 Sep 2024 16:18:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:18:42 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 22/30] riscv sigcontext: cfi state struct definition for sigcontext
Date: Thu, 12 Sep 2024 16:16:41 -0700
Message-ID: <20240912231650.3740732-23-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001846_621889_3ED6FA3C 
X-CRM114-Status: UNSURE (   8.84  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Shadow stack needs to be saved and restored on signal delivery and signal
return.

sigcontext embedded in ucontext is extendible. Defining cfi state in there
which can be used to save cfi state before signal delivery and restore
cfi state on sigreturn

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/sigcontext.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index cd4f175dc837..c4d19a10651d 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -21,6 +21,9 @@ struct __sc_riscv_v_state {
 	struct __riscv_v_ext_state v_state;
 } __attribute__((aligned(16)));
 
+struct __sc_riscv_cfi_state {
+	unsigned long ss_ptr;	/* shadow stack pointer */
+};
 /*
  * Signal context structure
  *
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
