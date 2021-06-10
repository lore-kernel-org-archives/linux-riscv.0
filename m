Return-Path: <SRS0=8YMt=LE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81EFC47094
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jun 2021 04:24:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 728016135C
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jun 2021 04:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 728016135C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqOWSSLDPOSheYd5gxDGCyg9C+EXf9xnE0KDazqxnnw=; b=EXO4ukMKIMGquR
	BHFP8Oq7v8NLuYDWTPo1iYOG5kUb5lTlKmnoa/6B/La65LaKKaX9GJCDOkgboudWeV0/mMZwe6dUb
	MrYI65Bn5peFEBr4bb1tUIMLt8pohYVxhx7rkNL1UDXWdaZa/45NlBQul2CwP8JPYJm8cG2gD1cd/
	F2pLN3Wsg2JoSNmsMlo9GHxpdvIlqkLZuGvUc7jnheLYmel9f3LW6FFQSWgZHG8mJUgtulpII0k9h
	0TVz7JIAvU9UDEFoad+ofSwBXBJfRnsb1fVCq4Ds49f4QyaI60+slqexyFz/y4Iw0YxLlx8CdeDcC
	/ZZZH7AnbFlSwWlNb9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrCF9-00GofI-ID; Thu, 10 Jun 2021 04:24:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrCF6-00GoeB-UV
 for linux-riscv@lists.infradead.org; Thu, 10 Jun 2021 04:24:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id m3so69433wms.4
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jun 2021 21:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrNkDf8sPCo44azByjqHolZWEpOUjgQyhZJeKfu6GJM=;
 b=PPiKAmTaL648+b5NzcLpfi3Aa+M8WwE6gzH9QTcBVKTsUQ3XcD2Icp0ar9gAdgjdo4
 YCv+bk3k+Am4Zf5lkF/OIOgPMKJDNtX9WJzJb0YSrSJJLkvot3GDzgtEjSBtrvbYpcp/
 swEIPXHmpGNoCIaTFLXNA/0o1Dlujn+GlYjilNgEAud/37/DrD09TUUyxw9gdbm/HQlM
 kO6TFmb2jdly+ASE1eT/q0VDOI+Xto6V3PKZ/j+hMZUlkEm1Oq7S8TxsItyJ4AiRETko
 DKm2fCmUbl8RDgczOb22AUjJrQb+OjzOZRBwFI7qpCKErezN5cIxhh1v741OJ+whaQGv
 Df0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrNkDf8sPCo44azByjqHolZWEpOUjgQyhZJeKfu6GJM=;
 b=g8MOdhk2SoNVPSeL0mVQphdmoUsIZDTpa0NBpSWChiu5/fIGavXNJZPqPi98o9Kj+p
 2FuM9C0ZjEtqoFHhYkH47CrfsUilQAPjauSNGHfR4l7gXMsjFOFUz3ejzYTqRYYEhiA3
 0EdPTgIGnwiLK7NEIQYmPNw6lo6/7ijbgSW7dEI/74xcLODwUSycbLn67vNLqMc7kmdM
 Bl7CDxSAWfoN5E7jtHEVhixg9L2WTyj28ib7t2KAn8qVOD9Wop0gUDk3d5u9yBgWVzZM
 hTcMmXEyLGRBeMxqaST75lA0T3DcsUGKK1AAYbM+Woo0nptJjPMk201XmXzv5FbyJa/F
 igOA==
X-Gm-Message-State: AOAM530Z59g3DpQiKO53XwFqcWfg1/pS1I1qhcxo8JJOOGFTRlYja/SN
 nWeROIqhyYdQsWmgBcwwMyP5Zu0ZRekOoxcJLvkSAQ==
X-Google-Smtp-Source: ABdhPJxl+43M1wzHk1fvw1rrT+5af8Fyig2WKLKNoUbsVRsuOy7HhLChxsw2vVtPyWuuzI66AIMCmxzazQYNVCrIAqo=
X-Received: by 2002:a05:600c:3b23:: with SMTP id
 m35mr13190824wms.185.1623299069816; 
 Wed, 09 Jun 2021 21:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210609122715.3389-1-anup.patel@wdc.com>
 <20210609122715.3389-8-anup.patel@wdc.com>
 <1623255403.618479.3763295.nullmailer@robh.at.kernel.org>
In-Reply-To: <1623255403.618479.3763295.nullmailer@robh.at.kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Jun 2021 09:54:18 +0530
Message-ID: <CAAhSdy2yqqdCJCaUkX8Ld8yUQcuGQx6c-TAVaNNVehgNHsjwzQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] dt-bindings: Add common bindings for ARM and
 RISC-V idle states
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Atish Patra <atish.patra@wdc.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 DTML <devicetree@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Liush <liush@allwinnertech.com>, 
 Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_212433_069345_FE56E829 
X-CRM114-Status: GOOD (  20.57  )
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

On Wed, Jun 9, 2021 at 9:46 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 09 Jun 2021 17:57:14 +0530, Anup Patel wrote:
> > The RISC-V CPU idle states will be described in under the
> > /cpus/idle-states DT node in the same way as ARM CPU idle
> > states.
> >
> > This patch adds common bindings documentation for both ARM
> > and RISC-V idle states.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++++++++++++--
> >  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
> >  2 files changed, 217 insertions(+), 17 deletions(-)
> >  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
>
> \ndoc reference errors (make refcheckdocs):
> Warning: Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt references a file that doesn't exist: Documentation/devicetree/bindings/arm/idle-states.yaml
> Warning: Documentation/devicetree/bindings/arm/psci.yaml references a file that doesn't exist: Documentation/devicetree/bindings/arm/idle-states.yaml
> Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt: Documentation/devicetree/bindings/arm/idle-states.yaml
> Documentation/devicetree/bindings/arm/psci.yaml: Documentation/devicetree/bindings/arm/idle-states.yaml
>
> See https://patchwork.ozlabs.org/patch/1489849
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

Sure, I will quickly fix this one and send a v7 revision

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
