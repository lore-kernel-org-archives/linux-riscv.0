Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56839C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 23:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tD/X68eN88cedqMuzy5HPca9IRdBPxAgybWUnpY8/go=; b=aoEFxwmVg4zTvZg+MSLmowm9Js
	NXs/C5YeX+DW0uEDwAkk7UPWDBMhVcH7L0ncPKYXkVvTDN8wY23o6gICto0Ad05xzWCl2SnkEAqMo
	L9KVPerqa/MXKAiyKbTolcTSV34P87nHhuY28X+A8dGrMT05nHopGKv/usUyKkh6gIwgwdDw7C8l7
	3r8ygEoPVGjahpsy0vIRSOvwexl6vhMG5I6vvWWKmQ0YHuXPdciWDh71MraqRT7LEQjzato/MhqQC
	e1CupDlrRxP/EhfqsXMS2wLdF5x1+NxNEKIpKPnv7rsOgBP3mszXqfNIyBRGYPI8JK+zB525cGcXS
	NwKY95XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVgo1-000WCs-2q;
	Mon, 14 Aug 2023 23:17:01 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVgny-000WBA-2S
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 23:17:00 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-589e5e46735so30458527b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 16:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692055015; x=1692659815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ2VqA/vSflBac203Z0ZgYzciS8CSN/YrZrCQZvgAqE=;
        b=OxYYoyUAQaeaCm0MRnDlT6YpDWZ0eDciFaHbssoRAoYyzjd2o0WDI1UOBCOxL+kMJc
         5YD0NK8r1uDf6e0Jatvt+d6P+BWzIhvUYoQQhLjByYnja3UBlbXrGoFe9hBNCSmd3Por
         77GbZptlqN3qID9Yi7OuuYNKro+YD6l9Q6jj3+sUYzoK08H9wS69cXzUBziAMKx3xld/
         w96wxOhnL73JzIXq2lGp1mV73XNcE7Ps2NUvuAohRziILKeBly43Y5qUc7dLaviqameq
         hE+kTcQyTkgYI/ntVGdkCqeR0EWDhGYDk0kgtw+nvGshr7JSpUCtOXj/qFAa5uoFZbVm
         YkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692055015; x=1692659815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ2VqA/vSflBac203Z0ZgYzciS8CSN/YrZrCQZvgAqE=;
        b=kIY4htM0rqrE2f+WuDi45rmzOIcuLFB6O9E3Fg0VMYfa78Ll3dXL2BF0bE7+ZqLFKc
         P0BAP5Yp+WkLwBZ0Yi2M8SROLqRfzv9b91i+urAsbkuMMgkZw1e6wJwlqrUbPZ8fHnfX
         rNVI4KP4nfKL5B0y6R574QX7Fu3wUHFKHcsB9piyrSG/tqrVvYamVblnCDPn6NKv15CI
         qq9Jz2iveEuXzJzoqLSOAnt6PIJbd4j7XQ7amI2DxTVVUULjs6/9zhz+BRMsvMt7FYIk
         T2r+lT5rXfoMsGqPc4AE9sSFSgxrUicitdyGmpGaGuEAfbHwUMag60p6sQ4uEcHIKnK9
         vbQg==
X-Gm-Message-State: AOJu0YxLdlPA8jPdw8W6VqVy09I/ENOgubs01zrIYDLpAGqjamzFjhBF
	JwPiYaDwe4IpbNcqZdKKGfk9cpwEO0I=
X-Google-Smtp-Source: AGHT+IGO0AL45xRymm0BjDJln3deMA/9LFqjImi7JInSUnl69k7Qer+RG4sudzofLCbCQa+Rdgz1TuaGB1A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:709:b0:57a:118a:f31 with SMTP id
 bs9-20020a05690c070900b0057a118a0f31mr180335ywb.7.1692055015309; Mon, 14 Aug
 2023 16:16:55 -0700 (PDT)
Date: Mon, 14 Aug 2023 16:16:53 -0700
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
Message-ID: <ZNq15SZ+53umvOfx@google.com>
Subject: Re: [PATCH v9 00/14] KVM: arm64: Add support for FEAT_TLBIRANGE
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_161658_796657_DEF67969 
X-CRM114-Status: GOOD (  10.57  )
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

On Fri, Aug 11, 2023, Raghavendra Rao Ananta wrote:
> The series is based off of upstream v6.5-rc1.

Lies!  :-)

This is based off one of the kvmarm.git topic branches (I didn't bother to figure
out which one), not v6.5-rc1.

Please try to incorporate git format-patch's "--base" option into your workflow,
e.g. I do "git format-patch --base=HEAD~$nr" where $nr is the number of patches
I am posting.

It's not foolproof, e.g. my approach doesn't help if I have a local patch that
I'm not posting, but 99% of the time it Just Works and eliminates any ambuitity.

You can also do "--base=auto", but that only does the right thing if your series
has its upstream branch set to the base/tree that you want your patches applied
to (I use the upstream branch for a completely different purpose for my dev branches).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
