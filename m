Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BA4C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XF9zNGwpg0Y7P01/3AYBLbWkovy+0H8keKYx1pj4n4Q=; b=TUHqYCphXOc4yS
	9u1pfTjdnI8cdqEUufP/l2AfGgvuughp0U4PQYk1YZJS89bNPWjleP4vAMKsTzH1udB2Pc+6mgjL+
	LgMSLoazKYJUP2603sdChBB3cJF5bUvz1/DdvLzXcsLMH3U6ll/ppZt0xFyaUIXM0CCwddbQxMsDV
	Yn5djHXhJO/2l+TFL3+Pz1HwehHjvZAPobgZiG8kWwvYx8LS5ZpPVMbzcFjwJmjjaoo92neGJAAF1
	y0ghhxeu/Yv3eVdsPAcx0jL727xG/3cQvsSRjlAJKAIXzvaCyCy3Cf6l1FmIl0UIL5sK1FW3yo+2/
	HJS7LJQzDiTQTD7qA6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpQ7-000000034JS-1uk4;
	Fri, 19 Jul 2024 15:21:19 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpQ3-000000034IE-0hV7
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 15:21:17 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6b79293a858so11303916d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721402473; x=1722007273; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fHscifLSJ4MOcICpnCk6DijNmMct+hYZEzclOKVCfZU=;
        b=CFt/E3dxYGETki+T3+vAs9m0crCXw2CiAn2bhs73JkPn/mjSwvhPaDOvE24EECrOyj
         oJa4vP3kIFPXjrUxakIXAXnZw0pnmqxKCx9AF0FezxTukr1v//Rjb484L5SqZz1KmpsQ
         KXqTezFSvQjrNfe5rpeTvY0UPYlTosfUCJ96sl5lHU+JfsvpCJpbcCPGMzFLuhiUaJlP
         decXeXCUaems+BVMpLJ/1+ji5t7gHrzCwofsDZmzcHk29506Uw/IvNAssa5aftVfrNVI
         sDj021evEO0SLzBon/kHrtiHUdd5GAH2VE9xgeTWiD0EtxTNvGWliKWUPeipr/D3xMqK
         BA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721402473; x=1722007273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHscifLSJ4MOcICpnCk6DijNmMct+hYZEzclOKVCfZU=;
        b=eSlJSlDmr+XgcKYRd7MIZ49czHzyonTRhfZCX16LxW1ErxNFFlKcFnQJc7E6vP/4ly
         alVn0LQw52NgLF4pzKNXeKo2DcKbnGZYkvPdp6NUvtrXgeiBpAGKfUeiGBkqlGrvLMDG
         ZXECWyGJ+IeaKTT1q3Hd3ajYSos/kzQwtNTLFok/cUs+G5UK/253MknRer088lFvYEqn
         T9JThhVdBq4eat42kTLwBnuhqpA/rzyfAeXiZFAm8O3pPidwEDHVkqKIy/i1F2wrLsRz
         WeCwg3oP+SPb+/EGfaclzbYDjRftCOkHkRoWBF6en0FoRcZ9iIfvf+ZbAHG6pwf9OyDO
         B7qw==
X-Forwarded-Encrypted: i=1; AJvYcCWD4LgDRVNJ5XrqCL2zLzxmQfh2eDI5oBx+lcVAFM63tLCH3ZpdQyjfi8IKE2k2eVNZ7MSNzTiSNgqMKEpMw/B2EoZT9wpj8qMvyrz9SGIN
X-Gm-Message-State: AOJu0YyItMgpAwJ8ru8TkMalWGsT6lBv9iGPaXSEqms51wXMO1g+aBXK
	vi44OWS7dG7kA89OigpddrAcnc/6pu1JqqvrO4iZR3HDwf+3XRiLfdr57yO6kRg=
X-Google-Smtp-Source: AGHT+IFkXu6WJB5QYfOAaZn9s1piO8yPCpYHKpBKZg8ljDLEmTZ0U7tZoZ2JfNjGtNrLvasw2PMYrQ==
X-Received: by 2002:ad4:576d:0:b0:6b7:9b2c:98d3 with SMTP id 6a1803df08f44-6b79b2c9b20mr80138806d6.26.1721402473067;
        Fri, 19 Jul 2024 08:21:13 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7acae194dsm8456146d6.107.2024.07.19.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 08:21:12 -0700 (PDT)
Date: Fri, 19 Jul 2024 10:21:09 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Eric Lin <eric.lin@sifive.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	peterlin@andestech.com, dminus@andestech.com, locus84@andestech.com, 
	jisheng.teoh@starfivetech.com, inochiama@outlook.com, n.shubin@yadro.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2] perf arch events: Fix duplicate RISC-V SBI firmware
 event name
Message-ID: <20240719-6219a417bc6fcf36ce67920f@orel>
References: <20240719115018.27356-1-eric.lin@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719115018.27356-1-eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_082115_276119_A5F9D53E 
X-CRM114-Status: GOOD (  16.50  )
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

On Fri, Jul 19, 2024 at 07:50:18PM GMT, Eric Lin wrote:
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
> 
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
> -- 
> 2.43.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
