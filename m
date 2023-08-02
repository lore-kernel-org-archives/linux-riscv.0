Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2469CEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 02:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMLPQx+GBuvseFSQNqde0Znn772Y/YTt8d4K74YQTzs=; b=uzLa0dNpAgGy9e
	5MRfHqC+VKpCv+RKxRnKMd/VylIHpPp7ZGVCgKmcVQc5Vyo5NEfwyYxhoYJDt0OjVFHGCe/edG37r
	dwXJQ5ojouFo9DoeT1XzqBHRH+FPKBMaMsrEbKWKQH94azzKbd/BPQzH/ekOQla202ZZ12XHe8qLB
	sVUKeop3CtzpDWlbl2gKFNNuN9L++fB7ji4OstuPNOdam1a2ZLVL3mGliF51ZruvUc7BSwNPKUGTW
	6qDTU+fu64pd6wKshQ/frhk270sRNZGlepA9FO8nELTNfV1enVVDyUNfQLJ4t8uHoZQKwWakuouSW
	58b20HLqTJFEF+05OJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR1Ek-003kpA-0V;
	Wed, 02 Aug 2023 02:05:18 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR1Eg-003koA-3D;
	Wed, 02 Aug 2023 02:05:16 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9f48b6796so28378821fa.3;
        Tue, 01 Aug 2023 19:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690941912; x=1691546712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33FGRO0uiP6qTJBMh3rf02rvPSySzQ+cG5TwspD9eRg=;
        b=f3NvgaeSAWtk/Wu+VcamVFH4Q9indsZ08iIwci/KzL+4hqWjX876YurFCS9x0+xLtD
         bAHulBtcK0RwTaVUxZuXdSm/txfwxi5bPyc/pDPqLk9b9zN32zk9w0D4oUkgVMO+MrLX
         nSdQhl0Sb4gmj5LR4DBjY6WULMtolrLNhrDk19fJZwn3/tBNPbOVOcwZiREBuJVSmX/T
         huPRF6RuaE/0TazoDW3S5iozA9bv0ALjAGe+x5n30/DS3KIaltguIBMGmbHLouBVsEs/
         zouGj4OJBDJarSNW6tqOweA6gxBes/21spg2qNdUDxKj1VqqT6iSamPJBibn2/KIFZdz
         Kiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690941912; x=1691546712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33FGRO0uiP6qTJBMh3rf02rvPSySzQ+cG5TwspD9eRg=;
        b=Bl3dmEn6yZPVVhL+m8wx5H0e7OO7vCZEbPl5X46RqGTRRjIhACez+5bf9XhBycumOb
         Wk1/8nknnC57RPEvM+G8IcN/jCEtKYR35NAjCnbcA/o1nGENA2K0GczqsiJgW/kMMWbw
         FuK19AWzXe9vkiiV4t1lLSn2ag4c/0qbCGvZP9ypr6EpA5NxFm1bt52Xy/UFkAHpOUPx
         7vc2ZgjIR1cWkKGYzRbmY3CsunfoV6dXlYwNkMQe/eMvgATlnHOFfDNdm9pjNpoZGcgc
         67hS/34kb5ejwetMXVhe+Hg1I78rfxl/8omDHOD8Im7plKrpdimQwxQ3yPSDrY0qqbjK
         lrmQ==
X-Gm-Message-State: ABy/qLbM+glIjhW7fTY/cMOmKvIyzg3Ut3g5tIzILlFnVZpQd+t0PTtj
	Q/RCn3N91+OS4G1E0DCf0pVfwjGp+tM65gKYvWQ=
X-Google-Smtp-Source: APBJJlEE29GNJN/lG7oFpSff+TdO8x0Tale5Vjg1bNF1bLSbg84oM9Loz4BY7DDRVROs9f5kxpx5NW4/U0LUoMzKucg=
X-Received: by 2002:a2e:860b:0:b0:2b9:55c9:c228 with SMTP id
 a11-20020a2e860b000000b002b955c9c228mr3729409lji.27.1690941912186; Tue, 01
 Aug 2023 19:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <35ce2b9f7ca655eb3af13730b1ca9f05b518e08f.1690364259.git.haibo1.xu@intel.com>
 <20230728-879500f157954d849fb303ec@orel>
In-Reply-To: <20230728-879500f157954d849fb303ec@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 2 Aug 2023 10:05:00 +0800
Message-ID: <CAJve8onDLEC1JFdERi098sTmN3-UkwaJ1aJz3CJNYU-GShkEyg@mail.gmail.com>
Subject: Re: [PATCH 1/4] tools: riscv: Add header file csr.h
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Sean Christopherson <seanjc@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Marc Zyngier <maz@kernel.org>, 
	Colton Lewis <coltonlewis@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_190515_054431_4C9F5362 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgNTo0M+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMDM6MjA6
MDVQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBCb3Jyb3cgc29tZSBvZiB0aGUgY3NyIGRl
ZmluaXRpb25zIGFuZCBvcGVyYXRpb25zIGZyb20ga2VybmVsJ3MKPiA+IGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3NyLmggdG8gdG9vbHMvIGZvciByaXNjdi4KPgo+IFlvdSBzaG91bGQgY29weSB0
aGUgZW50aXJlIGZpbGUgdmVyYmF0aW0uCj4KCk9rLCB3aWxsIGNvcHkgYWxsIHRoZSBkZWZpbml0
aW9ucyBpbiB0aGUgb3JpZ2luYWwgY3NyLmgKCj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
