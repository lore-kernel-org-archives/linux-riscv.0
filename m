Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34D9C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 11:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdprRmFGs08szuljvmCo3mLL1+sAHThpvqwmv3emhE4=; b=gkOovEtdT7BkUs
	ZWrIuAaIte24WGs62nWjY60O1EqvDXSMUk5feW/uILvcEU5uP/AtgPFlFuU4K+/5R8k6VjYYPvzQ1
	599uT7tl5yklhNsZgcPgb5Ed7cr846Pu/NVXbP3rAYgCR6ExaDIb/zMosxLTuPDOSgLKV5cSSz39h
	ZQ0/9mG1KQrx6FO4KFDShXQMqfL25iuU4BrHe8yxpcuft0VkHlYiVbwf08tX9EhoXbUBOlNKxJMxH
	0/yA0uePjarsTNoGFz/sW9/lP2WIMegkRXJJVkG5N4SG+WNuhi7V9RjXAEcNwdL+7hmQFpC7FT7Xz
	pbb6j3UNPaiKybi9vrHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rndPf-0000000719X-0Alo;
	Fri, 22 Mar 2024 11:50:19 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rndPb-0000000717V-2VGO
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 11:50:17 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3685f40712aso8677975ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 04:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1711108212; x=1711713012; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAx2I7XvDqzXQw6wtmJmpS8c3rKWDIhE+rLvewBuwrM=;
        b=xjXZ3Pbr5EyC5HY/6nLBdMJ+eFYcCh7O6SdMn6iSnhPddZ3bgAr+qfVtYw9/9V1zKy
         zN4ZQQf213RpOjI0N+Xqb2cJuNigtmZjMLt28t0rVKiiSgmirt5kE7XmbGiXUcuXh5G0
         3b6m42RX5yZR1Jt6Vvy3fFkgHXTCeaturRjWPPl8YTGB2z3QyphAek18ZthFjOyVlY2J
         WBH6DV7LhdE444CT2x5Jsv1xexUxi+65D1sb0g/VBsuiUJ6qSglALMvdXbSnKM6TYvj5
         /W229Mv8sErZr5DuQIoC2l1FmRfYBjkVSwzLhWqfCNuiNNJtY4i+3WO4CHoX+ywvSxwM
         PBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711108212; x=1711713012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAx2I7XvDqzXQw6wtmJmpS8c3rKWDIhE+rLvewBuwrM=;
        b=OcDDSMfGWDCwiUtwpemtfU0QODT7dcmVc9sIK3VMxG0RZyRj+a7bZE71hKMETyERBQ
         TuokeSTF1ZsdvHlSY80R0ydxAnn4k1IpbcpRFGJqianZ0Pgzj7Oo8dWbKsAmKjMA+c+u
         Pm+EdH1ge/ajAIi7hjdSubUpU8rNSfSAaHoaWTLWzFJjaGHBZ83hSQnn7VVfMZeD+PIx
         IvAXRd7ni5HMAhBqtf4KsF/Ii6dWS4LnAB3Wfo7JW7GGgHBS0lUi+aAYpWUZa37YSbqs
         WTS7TSdC6Dftqq7O45WuYGKQDm5eKbqPPfY/uudBQMFPniT013IRwR7Fsi9QbhCsH2fK
         Gl2w==
X-Forwarded-Encrypted: i=1; AJvYcCVBnwMMMnD2VX7OSK6QmhNY86ILp/+vf27HzPAG0WAJcVaxfRYiTmR4g+YmQBUhdu9HcWHTCo3vwc72hH63W0leVu7ywBFI9iIDr0LRT4r3
X-Gm-Message-State: AOJu0Ywx8utXfv6OGgaGV4S1h14Ze8nWXqExFdKFnfLq5Lv9+i5iRlBU
	OdiHbbqxdPkFijXTsIX5BfmbwM5AfF4w+qRIYHiWrDVR99qyLikEbh0MURMpaYcA9TblDLxRlUK
	/Mu7vRjhmObCNorZzVnwJrBmFKd5VjekgxfymUA==
X-Google-Smtp-Source: AGHT+IGc1Lk3igmGbpYPTMkvVjrig10NalqBLgFeStlCj29E23ErhBLOEWZu+ODvVKrcfDcGJtCgMDHVzrFWhsAZCSE=
X-Received: by 2002:a05:6e02:1a24:b0:368:4d28:5d0c with SMTP id
 g4-20020a056e021a2400b003684d285d0cmr2444188ile.22.1711108212026; Fri, 22 Mar
 2024 04:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240321085041.1955293-1-apatel@ventanamicro.com> <f44de7d9-e03d-483d-96d3-76c63158061d@gmail.com>
In-Reply-To: <f44de7d9-e03d-483d-96d3-76c63158061d@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Mar 2024 17:20:00 +0530
Message-ID: <CAAhSdy1HnzB5T0G3dEfuVX1LHCMy6H4B1paQyCKC-iXTJ_Nf=w@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM RISC-V APLIC fixes
To: Bing Fan <hptsfb@gmail.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_045015_901199_C8BFE227 
X-CRM114-Status: GOOD (  12.11  )
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

T24gRnJpLCBNYXIgMjIsIDIwMjQgYXQgNTowNeKAr1BNIEJpbmcgRmFuIDxocHRzZmJAZ21haWwu
Y29tPiB3cm90ZToKPgo+Cj4gSGksCj4KPgo+IEFzIHlvdSBtZW50aW9uZWQgYXMgYmVsb3csIHJp
c2N2J3MgYWlhIHBhdGNoIGluCj4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0
Cj4KPiBXaHkgaXMgdGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyBub3QgbWVyZ2VkIGludG8gdXBzdHJl
YW0/CgpUaGlzIHdpbGwgYmUgc2VudCBhcyBwYXJ0IG9mIExpbnV4LTYuOS1yY1ggZml4ZXMgKGFm
dGVyIDEtMiB3ZWVrcykuCgpSZWdhcmRzLApBbnVwCgo+Cj4KPiDlnKggMjAyNC8zLzIxIDE2OjUw
LCBBbnVwIFBhdGVsIOWGmemBkzoKPiA+IEZldyBmaXhlcyBmb3IgS1ZNIFJJU0MtViBpbi1rZXJu
ZWwgQVBMSUMgZW11bGF0aW9uIHdoaWNoIHdlcmUgZGlzY292ZXJlZAo+ID4gZHVyaW5nIExpbnV4
IEFJQSBkcml2ZXIgcGF0Y2ggcmV2aWV3cy4KPiA+Cj4gPiBUaGVzZSBwYXRjaGVzIGNhbiBhbHNv
IGJlIGZvdW5kIGluIHRoZSByaXNjdl9rdm1fYXBsaWNfZml4ZXNfdjEKPiA+IGJyYW5jaCBhdDog
aHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0Cj4gPgo+ID4gQW51cCBQYXRlbCAo
Mik6Cj4gPiAgICBSSVNDLVY6IEtWTTogRml4IEFQTElDIHNldGlwbnVtX2xlL2JlIHdyaXRlIGVt
dWxhdGlvbgo+ID4gICAgUklTQy1WOiBLVk06IEZpeCBBUExJQyBpbl9jbHJpcFt4XSByZWFkIGVt
dWxhdGlvbgo+ID4KPiA+ICAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgfCAzNyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMSBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
