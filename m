Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53041CA0FED
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NQfHiVgthR+q0fWrFtxyKzke9eX/xFjMv0fhw//aPQI=; b=Wa4
	GLfkOOpvHjtY0E9ge4lo6YiTTlfxMQXm4oBpboC2An9toVSSFWX673io6Cqg2o5GIWe0XILcMDQot
	iJLy5W11YqT0aQpT8kbLW8+vEc4vgIGk1zBqQMs3PFkspwZXk3+omJZKPV5ISt1oSdsqukQ62P+wk
	4Xh9iVyeEJuuy128tjRotFBV78ut0bg215lGB5Pm05ldL4wPAhUrGo+yYORRQqQbu1lYBsRiSgXX1
	L9HAFlYjyF0ocWVa9I+8u+2ErB8PaxAw6f0AGneD13G/v2RLA1OvcNMFI/aXh88F8p+R7unq+d9gp
	C16c2l7NsmvV/UH9i0hWMZO2LvT0xZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtN3-00000005R76-39dG;
	Tue, 09 Sep 2025 08:06:33 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvonq-00000003tlL-087N
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 03:13:55 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-30cce50dfb4so4773188fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Sep 2025 20:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757387628; x=1757992428; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4tnLzSgoyH5Nmr+fmB4heyANSklWEBYDavEKVFkzKtE=;
        b=MPgc+i6yC+6b0ZpRXK7TvWPVqdxPHELr/aLzapHM5jVE4SnueyD5fk66IS+ASxtgjg
         aUeTRQD0B74TUirDEC4kJWrKnWqpoQCKFzHQx6oPjfQ/7G61wYoQCri59enrl14uESQ8
         mbA3icJuPUAVEtjrcw96VlZPltFMxkO0gXaH27feNvtS7hPfXKhp3I1vXrS8lkd1TOQ8
         l9dpN1Ipr6emMAgU0IlS73lpBVrjXXPywhv3CiynAWoTLdavMgR+XieBPgaMzfumFola
         rr0oYs5KKvSin4q5+6Timn0gfFLlOWRhQN+uBdb5cjN4Ivo16kwouiJ2jkHfmvOr2vIL
         R0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757387628; x=1757992428;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tnLzSgoyH5Nmr+fmB4heyANSklWEBYDavEKVFkzKtE=;
        b=FLtNpqw8swZPIS1+k5FU021FyhJKIi0uBL4ajpf6E6L/s5qCbc/jDSeBMnGptCZPvM
         1yeee0b5QtJ5gX0uPODXko29V9+EEZyXbHAbH0H1evTM5WF71WrvG22h6skU+Xq98Bt9
         07zBKE3fh82mo7dwcCqbrDHrDleD51NrSdO7ED2iguAAXAwLnXMurPHItTHfY30KKr5y
         ZBDCBatLicGbVnE9QWthX+E1C9NJEm1NxDAUjQGUVW65un0Hgxgo6orI3F+I5ifAGzvc
         6U11CQJzdkC3XIywxzi6SE3ZVvv6kzsESgZe/JS6yUWqnANI13JQTaK7HpeeiqoLbZVw
         LyMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSTniEDigYWUz8y+3C5tVf8zyuMzyuxHWLLR7d+J4zwyi9xK8UcZ28dCFEnHmGeI70ZW49SEqdqCIrMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZwp0FmMuRwdx8Wv8pMS70SV9J05UkkE5TrT4S11mHjR1dEtcN
	8ejYfaIx8iUUUX5yA+JMJaLfugMbe/UtTfRWcXJ7hTI1yoQ/I9N/+Wx13eyzO1JzF1UfKbLCPkC
	MELVEVmsNpgc6oHWF75ivobz6Wchp3us1ru1EHEwN8A==
X-Gm-Gg: ASbGncvFJLBPGTL7MfC6MaIMKWFQbylxQ1tzlyRuStxoea6iKVWbOGYXhnlPqBPlfiA
	fQXKEy1J65TMyqI8SZSHhNc8Wm2VwY5pNNHNr3vLKWjapJSjegnZwrzRPD7BFo8LsH4saoCr3C7
	wN73QTgVM5C3SsTqSnTYuI/O1nUpRM20pMjfTwyFfoyoF16gPEqIL+1E/S4jFw4aJAkFQC63Z38
	E1RQ89aRBR6vON97MLBKrbvf2Gq6Ik=
X-Google-Smtp-Source: AGHT+IEjRnKVoKvFFA+E6GmCVRCB5SlIscn/ZuyjOxoBfVf+jCSOBjaZ+L0Ztd/wOGk5yQEwow86CDzdQXH1tpXYsRo=
X-Received: by 2002:a05:6870:9713:b0:321:2680:2f82 with SMTP id
 586e51a60fabf-32262955201mr4819276fac.1.1757387627362; Mon, 08 Sep 2025
 20:13:47 -0700 (PDT)
MIME-Version: 1.0
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 9 Sep 2025 11:13:35 +0800
X-Gm-Features: Ac12FXyRlupJTj4FkuA2woE2fvmmsdddZIrbELQIbDuD4dgkvkFHAjvltNE7XBA
Message-ID: <CAEEQ3wmjRuC-Z1PRTw1chP40KXFksBgHu+dayjYA9KXE9Q0Cmw@mail.gmail.com>
Subject: [REPORT] Should rdcycle be deprecated?
To: atish.patra@linux.dev, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, 
	lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_201354_068336_AF3751F6 
X-CRM114-Status: UNSURE (   5.57  )
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

Hi All,

1. To use rdcycle in user mode, one must first go through
perf_user_access. However, in reality, the return value of rdcycle
remains unchanged. This is because SBI_PMU_CY_IR_MASK in SBI includes
the bit corresponding to "cycle", and the kernel's pmu_sbi_stop_all()
function disables the counting of cycles.

2. Currently, some application software (e.g., DPDK) uses the rdcycle
instruction. In fact, rdcycle is affected by WFI (Wait for Interrupt)
and CPU frequency variations.

3. Some applications mainly run on server CPUs. Therefore, the
precision design of rdtime should be higher. For example, the TSC
(Time-Stamp Counter) of x86 architectures is generally around 2 GHz,
which can meet the application's requirements for timestamp precision.

4. What are the future plans for rdcycle?

Thanks,
Yunhui

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
