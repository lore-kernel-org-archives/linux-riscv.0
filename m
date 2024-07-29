Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221A5C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 18:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RY8k5Y1lS3pkjlddosesaPyirSo1/yK1raVwqEW6HWc=; b=Aks6kojkxc1lp/
	I6aZnXo5FnkvCBmIdh3LPBblmZE1t2e+NlLTCHGBJrVIFGteeGFBlYGz1wss3gHPBCQ6oo4MISqZa
	FgfKR1oE9XUQyvaiSzl5R+tbOJMFLcrjB2AYJWHMJMsJFjAIh2vXEyjJEy3CqqazQZ3oIX4LiTnuI
	yKi4Hhegl1N8oiN5U20RT89PoyV81v8C+QKOs3DmJ14AEXNoF8OWpLYKoZGdpTMFhU7gIEp94DJk8
	S5PO+4YG9bReBsCcXoMduzSiimt1llEkX/OnbHYR8jwVepb5HEjQ4fW4osUiyVBHupDsfzDTAU3IA
	9ZV+k1R2vpYzrPJsa01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYUrJ-0000000CJ6y-1VWQ;
	Mon, 29 Jul 2024 18:12:33 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYUrG-0000000CJ60-3I5V
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 18:12:32 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-70d333d5890so3439101b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 11:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722276749; x=1722881549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMq7wNNFkACLtIEFF1Sm/WrnsanjDAmU+DNeQs049lE=;
        b=COd6khcsvwSbk2jfbSKVeE11O1vOTJle7yuaA+x+es/O+2A5nlBHlFlslvvAdkmfWO
         jZiskLkWrbsMItndQRbAQqG8jt5hHoiqXM5xBqDqNWpZuJzUdibJ9RtaCIRJ331QmS4V
         2Q6WfLoffDLs9RwgNw99Iyc091Jice4mD08qaX5UqAVlH8CdKzg2sKsJ6pcTCHVIuZSR
         jef/rEWAc0my69+ezb9/+teO0gAh9Yx62iWV1OkKM+S0VBPcQ3vCzBrRnJCse8AH9dkz
         IaqSXGQctFop/hAK9hZjtUWqsB0xas+jxQvmTNgc1D7BwpqzydIyCkd8MhgvIGBhc4Hg
         865Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722276749; x=1722881549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMq7wNNFkACLtIEFF1Sm/WrnsanjDAmU+DNeQs049lE=;
        b=RMlDSyvaF95hHRfUY8HDuMMuBUIajR/WhfA9O99gBtll12MSQxt00q+yD9E5mT8sjd
         7hiWgwerUV+YGKgzgG0CB7vRjas61SaXPFM2pqS27+GY+TuNMxJ09sfeUVOdXDi3lf2e
         3LqbY5g4Om0MEFndq2+ZoHkMJ7Y9+TweehrhYTXGy9kq4veyfxD6ftHuo3yHLgTyPCas
         bb2Ayh4wNYfJxZWzTW3FrNhecsFgTb72oj4v3Twk6U48XkQZG6qy5L8QoBa7nywG2OGj
         rSVpuN4Bsk57ZgV6w4VBh4Z0x224DixTU5CH1wcbMkXXU2NtLPTg1Uu1lvzSEDgKJqLB
         U0wA==
X-Forwarded-Encrypted: i=1; AJvYcCVBLEYzLXnCBHABjpqUJIJOb/lCMzNWwUYhQuhjJbduXGYhXQDoQELnlhvKlAu9PQgb/BGCWoM59ZgJIj0NQjOeU4XFFt8XfsGYBz2g6sWy
X-Gm-Message-State: AOJu0YyBxj/TaWkrjNatBDjF39Lde6zJcAzoe2V6mMiBiiQGt6GTNHaY
	DMJGw0nYAuQNEZcPUmCMUjkkLiknNPXjjKHSP37KOC62g+srHhf4sKwbUZpIu88=
X-Google-Smtp-Source: AGHT+IGZPAFCVBLn6KPFdsUdG1pJTnQRQdxlqkE0IiPTY/LUVPpXHEHYA4ONndyS0YLuN1mMZ9EPHg==
X-Received: by 2002:a05:6a00:1826:b0:706:6384:a826 with SMTP id d2e1a72fcca58-70eceda1f46mr13855706b3a.20.1722276749228;
        Mon, 29 Jul 2024 11:12:29 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f9fbd4b0sm6434433a12.72.2024.07.29.11.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:12:28 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: eric.lin@sifive.com
Cc: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	peterlin@andestech.com,
	dminus@andestech.com,
	locus84@andestech.com,
	jisheng.teoh@starfivetech.com,
	inochiama@outlook.com,
	n.shubin@yadro.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [v2] perf arch events: Fix duplicate RISC-V SBI firmware event name
Date: Mon, 29 Jul 2024 11:12:18 -0700
Message-Id: <20240729181218.1712102-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719115018.27356-1-eric.lin@sifive.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_111230_847564_2CB20D89 
X-CRM114-Status: GOOD (  13.72  )
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

> Currently, the RISC-V firmware JSON file has duplicate event name
> "FW_SFENCE_VMA_RECEIVED". According to the RISC-V SBI PMU extension[1],
> the event name should be "FW_SFENCE_VMA_ASID_SENT".
> 
> Before this patch:
> $ perf list
> 
> firmware:
>   fw_access_load
>        [Load access trap event. Unit: cpu]
>   fw_access_store
>        [Store access trap event. Unit: cpu]
> ....
>  fw_set_timer
>        [Set timer event. Unit: cpu]
>   fw_sfence_vma_asid_received
>        [Received SFENCE.VMA with ASID request from other HART event. Unit: cpu]
>   fw_sfence_vma_received
>        [Sent SFENCE.VMA with ASID request to other HART event. Unit: cpu]
> 
> After this patch:
> $ perf list
> 
> firmware:
>   fw_access_load
>        [Load access trap event. Unit: cpu]
>   fw_access_store
>        [Store access trap event. Unit: cpu]
> .....
>   fw_set_timer
>        [Set timer event. Unit: cpu]
>   fw_sfence_vma_asid_received
>        [Received SFENCE.VMA with ASID request from other HART event. Unit: cpu]
>   fw_sfence_vma_asid_sent
>        [Sent SFENCE.VMA with ASID request to other HART event. Unit: cpu]
>   fw_sfence_vma_received
>        [Received SFENCE.VMA request from other HART event. Unit: cpu]
> 
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-pmu.adoc#event-firmware-events-type-15 [1]
> Fixes: 8f0dcb4e7364 ("perf arch events: riscv sbi firmware std event files")
> Fixes: c4f769d4093d ("perf vendor events riscv: add Sifive U74 JSON file")
> Fixes: acbf6de674ef ("perf vendor events riscv: Add StarFive Dubhe-80 JSON file")
> Fixes: 7340c6df49df ("perf vendor events riscv: add T-HEAD C9xx JSON file")
> Fixes: f5102e31c209 ("riscv: andes: Support specifying symbolic firmware and hardware raw event")
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Reviewed-by: Nikita Shubin <n.shubin@yadro.com>
> ---
> Changes since V1:
>  - Add "Fixes:" tag for every patch that copied firmware.json
> ---
>  tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json       | 2 +-
>  tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json        | 2 +-
>  tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json       | 2 +-
>  .../perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json  | 2 +-
>  .../perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json  | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
> index 9b4a032186a7..7149caec4f80 100644
> --- a/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
> @@ -36,7 +36,7 @@
>      "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
>    },
>    {
> -    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
> +    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
>    },
>    {
>      "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
> diff --git a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> index a9939823b14b..0c9b9a2d2958 100644
> --- a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> @@ -74,7 +74,7 @@
>    {
>      "PublicDescription": "Sent SFENCE.VMA with ASID request to other HART event",
>      "ConfigCode": "0x800000000000000c",
> -    "EventName": "FW_SFENCE_VMA_RECEIVED",
> +    "EventName": "FW_SFENCE_VMA_ASID_SENT",
>      "BriefDescription": "Sent SFENCE.VMA with ASID request to other HART event"
>    },
>    {
> diff --git a/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json b/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
> index 9b4a032186a7..7149caec4f80 100644
> --- a/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
> @@ -36,7 +36,7 @@
>      "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
>    },
>    {
> -    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
> +    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
>    },
>    {
>      "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
> diff --git a/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json b/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
> index 9b4a032186a7..7149caec4f80 100644
> --- a/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
> @@ -36,7 +36,7 @@
>      "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
>    },
>    {
> -    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
> +    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
>    },
>    {
>      "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
> diff --git a/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json b/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
> index 9b4a032186a7..7149caec4f80 100644
> --- a/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
> @@ -36,7 +36,7 @@
>      "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
>    },
>    {
> -    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
> +    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
>    },
>    {
>      "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
