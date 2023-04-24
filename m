Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79552C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpLHCIJS6t5hDqxuw7bnSqgH9SckK3ZjapS+zzQYCBk=; b=Et/7T/79cyXQFh
	bENREtt0nz6Xn6UlCx9QkAWIYIjhn1Gm0v1qpIk9ssWWoiI3LPOeyolAnHh0Xm+ebFCOqmA2ZSmVP
	z3bfYVHrUYUuMV9YNuhiVtH8PrGICceK4Bif7z9J5vj3y+GVWy9/agfCo8xxiHk7ssxzQm/h/27oY
	IIiCY3zarrKFiY2XH2rvdCdk3x9PqB2cSibCa7vmUXrSBYcymK035/ynfWXHtsW/WAyItgX5P87bo
	Bz2ECVGV64NoAQMx4Pbzm3EWEmGvFdMw46HqVDAb90HePo24uBMl0kZM0fbPC+MHKUPngEyY1tRCZ
	/sSjkAe8GypzaFdIGqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqzKE-00Gq0f-0Q;
	Mon, 24 Apr 2023 16:46:02 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqzKC-00GpyF-0i
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 16:46:01 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-54f9d6eccf3so54919587b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Apr 2023 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682354755; x=1684946755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cogHEMsVVgTDAgj3gPVUEVuPljtJmFM5khAyIfbROPI=;
        b=IBOU6rK79gND4DciwLkfyHJXLICK+nm1hfqmlYcnXaImIV8xf915qrkhfvrtFQ1bD9
         8Z+ZDwfy6VoKjQweFXwu2Ekk2xB4sANXClY8YQV834aQDs+/FEV0pbYJdQjAAZN9rs34
         f57BlCx+WuwQCSpj22oE82Xg3qgAyLXwOjmFBUce3BRWppaPMfsXHqc33YIYcz+3VNi4
         XAZAp7pRNW06LclNSKJAgnoHgP+fH1wRI4+4eovVUts+kprnZi5lybCwL9Zgev3v81H7
         MVICvn7IiG51PLSmT4j4PcXlaBgIbQc7j8zZ0ZG9H7yZWRSpCFId5KXjqGEfZQLGW0Na
         Tk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354755; x=1684946755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cogHEMsVVgTDAgj3gPVUEVuPljtJmFM5khAyIfbROPI=;
        b=NWKmPen7IcSS/+8bP7GdD/scs5TnUV62mqsYDA1U6QAW9Puwe9lXL/mTjcsmelKPm2
         jHfPuCPnFhmv/5PkPuGMwnlg3hZoSo389rcBRLTyXhIV355XRoMdSRCWAycUX3mDe8Pj
         jLf5XaaSrrOO99seEy3yzNtvyrzWmoBFvbmO2CwcfOAsRQtHWVyo2b8kPURkzruj+hz0
         wksXd/ewqA5jxHz/ViCUuQsBAPdkyLIcOPWo1aWO0x/EMJ1Jd/j0/WCc9XMTeG86rBxr
         HlnKSL1WCb3NyGrFsLLT3JhGImhV8TwTs58yYlOQ9YCsoWF//rF7cjLdBFOv9l2PoDVk
         xucg==
X-Gm-Message-State: AAQBX9dqnkD6tqy84n/SWV3DzvOP8DBugaUFg34vCelEiN1yCs8uXcv9
	2VeDx9SHPbe+vbJC9Z7TJn3DACtsImMR17Rbaz8QQg==
X-Google-Smtp-Source: AKy350bUMi1vCT3z4Q+q+kn/632Ww3gn+vAsPs+FHaqynFi9cqF64KYbnuQ/xodFFgeBsnoDvd5keBpYNYydhUX/nUI=
X-Received: by 2002:a0d:ccd0:0:b0:541:8735:171e with SMTP id
 o199-20020a0dccd0000000b005418735171emr9340453ywd.11.1682354754795; Mon, 24
 Apr 2023 09:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230421165305.804301-8-vipinsh@google.com> <202304220315.bpwbgH5n-lkp@intel.com>
In-Reply-To: <202304220315.bpwbgH5n-lkp@intel.com>
From: Vipin Sharma <vipinsh@google.com>
Date: Mon, 24 Apr 2023 09:45:18 -0700
Message-ID: <CAHVum0cp=wfDmuK87jq7+2t5FnK09v1LownwqgS41EisT4Gc1g@mail.gmail.com>
Subject: Re: [PATCH 7/9] KVM: mmu: Move mmu lock/unlock to arch code for clear
 dirty log
To: kernel test robot <lkp@intel.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com, oe-kbuild-all@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_094600_259623_2D42CF84 
X-CRM114-Status: UNSURE (   9.45  )
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

T24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgMTI6NDPigK9QTSBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4gd3JvdGU6Cj4KPiBIaSBWaXBpbiwKPgo+IEFsbCB3YXJuaW5ncyAobmV3IG9u
ZXMgcHJlZml4ZWQgYnkgPj4pOgo+Cj4gICAgYXJjaC9yaXNjdi9rdm0vbW11LmM6IEluIGZ1bmN0
aW9uICdrdm1fYXJjaF9tbXVfZW5hYmxlX2xvZ19kaXJ0eV9wdF9tYXNrZWQnOgo+ID4+IGFyY2gv
cmlzY3Yva3ZtL21tdS5jOjM5OTo5OiB3YXJuaW5nOiBJU08gQzkwIGZvcmJpZHMgbWl4ZWQgZGVj
bGFyYXRpb25zIGFuZCBjb2RlIFstV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudF0KPiAgICAg
IDM5OSB8ICAgICAgICAgcGh5c19hZGRyX3QgYmFzZV9nZm4gPSBzbG90LT5iYXNlX2dmbiArIGdm
bl9vZmZzZXQ7Cj4gICAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+Cj4KPgoKSSB3aWxsIGZp
eCBpdCBpbiB2Mi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
