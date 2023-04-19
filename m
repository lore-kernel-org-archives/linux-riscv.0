Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41032C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 03:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4rnU6aQRm7BHVR4jE9ip+rV6AHo+OezYCnZ5HvvwdwA=; b=o7Yk/9VQaUnhLsJ3PuxgutapXv
	5ckrSU+aEiJC7l6WYsd+WVGAOmo4x7FyuAzvRqva09WhNLbgM5yrhcSuznb0Dr24ts4nq4ASGuZ1o
	8gNWa3oKoBhRE96iiYiSMaxsWpq4eCfI4A39c4vNkuS2+hzhYlc6pT9eWLRvCyvqbeQkN1lYGnKPC
	m786dzL3gEkS1Ive20JHh+1B5c+W88/z4wsncyak81p61lqpi7yA7kOI0j35hoV4Y01q7AvCNkiUw
	2AYeLwiTG0l1YOTWJFzIbEqtLdaEei0w130nv6H3+ubHnRvhFGcXbO7q+c0giVmGcemBH0DbTBm13
	/RrrqBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poyhE-003to0-39;
	Wed, 19 Apr 2023 03:41:28 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poyhB-003tmD-20
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 03:41:26 +0000
Received: by mail-pj1-x102d.google.com with SMTP id k36-20020a17090a4ca700b0024770df9897so304952pjh.4
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 20:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681875682; x=1684467682;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6mgm3Di7gHIXRR1b3Pr408Mz+NLzzONCXm1uh+AKO4=;
        b=clblKm9O1VpWESzYzftaKLkgtzkFRl4IoswnIWWfM+vYZDxcGdGxNSGPSXXSgLim4o
         aqoJ7QSFVUk4be0sAXrzdjnOqF12e3GdDl+d27cg/ulipwcj0KMuHVTKPXHzxqSpbL+3
         d7+BG/6ZumIdlKEk57i3uJOxyTlSEtHjynHkqukj7yTrpJT1CxWM2zuZlp3n4WSbYjMm
         TpXt/MG267ECLIyBg/y1RfRmCClASzhpwZQ/V7L8GJsmAc2+Ytm+rCNXFsI4qQoCxr5A
         EvYYZWU8hjsztoWKvpNdXTFvmqgbARYHPrkXll9nxVDJluJ1nl3cVfCL1G0HXUvo3t41
         kNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681875682; x=1684467682;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6mgm3Di7gHIXRR1b3Pr408Mz+NLzzONCXm1uh+AKO4=;
        b=ifwBBJsQ9Fm97Fpgxc61FTFfbEQ52sjgGGRSAJl0tDCksISOsjcJ/ACIwMibaT5oE2
         YUgxNC3lgXxcEyzFF47Lm2INCa31pNdKDCMzpgul55qgv24pMaWGt6ZN1SCnZqn1WQEz
         IbESooizpIW4VS7fqFqcYcgQ5tSo9EPyg5i3WXq74I6duM1qLuaAP4OVdh3sGJTEDHMl
         R7wFlaoTU14auhftGG+Y8jHLWzIHJkUyVPMBogiG0S3qey8qRLu6EVJtftZIPZZZFa4H
         ICPeFx155BnwAu6rzAF97w8H6fJLopExOR5LxXWtP30hGdQI3QzRma3NoQq392X6qLiN
         c/3g==
X-Gm-Message-State: AAQBX9f/wj8l7S7aRuWKf3uMRgnfqpN7pbNV/qToyorA7ObT7piYbHvz
	aYMYJHqlPmA8HTZAlu2ldEoO4g==
X-Google-Smtp-Source: AKy350aFSnjy9GBus6W4i7rBmh5kAse78TXrksJiRFcdAUesKxA80OaYasCBI85Hv8XTlxGQAU0oPA==
X-Received: by 2002:a05:6a20:4423:b0:ee:e922:6747 with SMTP id ce35-20020a056a20442300b000eee9226747mr1933679pzb.56.1681875682524;
        Tue, 18 Apr 2023 20:41:22 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id 190-20020a6308c7000000b00513cc8c9597sm9278189pgi.10.2023.04.18.20.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 20:41:21 -0700 (PDT)
Date: Tue, 18 Apr 2023 20:41:21 -0700 (PDT)
X-Google-Original-Date: Tue, 18 Apr 2023 20:40:54 PDT (-0700)
Subject: Re: [PATCH v2] perf tools riscv: Add support for riscv lookup_binutils_path
In-Reply-To: <20230315051500.13064-1-p4ranlee@gmail.com>
CC: jolsa@kernel.org, namhyung@kernel.org, irogers@google.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, acme@redhat.com, anton@ozlabs.org, dja@axtens.net,
  mpe@ellerman.id.au, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, p4ranlee@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: p4ranlee@gmail.com
Message-ID: <mhng-534349ae-0594-455c-bc27-da0d8a70d0be@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_204125_657472_D01FE3D3 
X-CRM114-Status: GOOD (  14.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 14 Mar 2023 22:15:01 PDT (-0700), p4ranlee@gmail.com wrote:
> Add RISC-V binutils path on lookup triplets.
>
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
> ---
>  tools/perf/arch/common.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/tools/perf/arch/common.c b/tools/perf/arch/common.c
> index 59dd875fd5e4..e80d4d22cabf 100644
> --- a/tools/perf/arch/common.c
> +++ b/tools/perf/arch/common.c
> @@ -43,6 +43,20 @@ const char *const powerpc_triplets[] = {
>  	NULL
>  };
>
> +const char *const riscv32_triplets[] = {
> +	"riscv32-unknown-linux-gnu-",
> +	"riscv32-linux-android-",
> +	"riscv32-linux-gnu-",
> +	NULL
> +};
> +
> +const char *const riscv64_triplets[] = {
> +	"riscv64-unknown-linux-gnu-",
> +	"riscv64-linux-android-",
> +	"riscv64-linux-gnu-",
> +	NULL
> +};
> +
>  const char *const s390_triplets[] = {
>  	"s390-ibm-linux-",
>  	"s390x-linux-gnu-",
> @@ -166,6 +180,10 @@ static int perf_env__lookup_binutils_path(struct perf_env *env,
>  		path_list = arm64_triplets;
>  	else if (!strcmp(arch, "powerpc"))
>  		path_list = powerpc_triplets;
> +	else if (!strcmp(arch, "riscv32"))
> +		path_list = riscv32_triplets;
> +	else if (!strcmp(arch, "riscv64"))
> +		path_list = riscv64_triplets;
>  	else if (!strcmp(arch, "sh"))
>  		path_list = sh_triplets;
>  	else if (!strcmp(arch, "s390"))

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
