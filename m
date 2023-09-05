Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8D6CCF9E4
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 23:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O43Pgnotc4lYcqzLi0/1oJ/DwCXvVo0tuOWD4iVq9L8=; b=hDU5P5rjYKzem2bvBcEALjcMkm
	JZXL3mr5+p3JkKXRviyi1Ggl5L+KrCr13CCHL4ZLSAnvCViHT/ycB5umB4kCvOOqB+PD3DAE9mGI4
	mUd0JAUNd4OQBfuc9MbP1WKWKtF/TH/uJZkzEFH56SCB+BHKWBZ6PS893HLKfSaut2OK9J8pi2xaY
	UQulYrPuNIfWKR7v3XOC3zmOVRXIZ1F7nAp6VDgE3bpGEwrAMzVTZST5O7I5JV6xP7ELZeVQo1YMA
	2uMxHa28YXsaGR9RmfBFIVXIzftGnMgbnE1Uo5mig36xG/r/b0N2KRVz0xtYtQmxdRK1fu3nupoQ1
	ghHL7/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdfuP-006vWe-1A;
	Tue, 05 Sep 2023 23:56:37 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdfuN-006vVR-0g
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 23:56:36 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d782a2ba9f9so747293276.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 16:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693958193; x=1694562993; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTMdUX0G2lv2+kU2WiYySTJObpffzgV002stI1a1W7I=;
        b=3KTLkLQT2GT42S21/bJ47qRUytbK85BWDrzaobRMKFp8t7rOGMz20vTTvq97vsfYPj
         JvtFHjxHnKSp+wGYjyfE3zMDJHHHLAKka1YLIiXDXDz/PJMnSQUUJWPdaf+dYZWCQPd2
         dxNpf8OZlYz/UmzUNSA7KeVlHgNxS2hgibeNFTPZvPkKa/KvB9Ab3iHs5WxJCkAtwYrW
         qsOfymuxkpQIB+3bqy3xDrlDMQbXScUbUi4JPH1hr0NCZ07215eOxEsoq4kNSr7mNhvl
         VTgiJr/xVZRT9+DgsR7493NYIjYCbAxtaB7/PUiLCd+AgeY9WnDMlzQOrEmlv19syWup
         sitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693958193; x=1694562993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTMdUX0G2lv2+kU2WiYySTJObpffzgV002stI1a1W7I=;
        b=cS5ZDnGf8taJofAJKQnteY+04FiqzYkFNMeTFC8oJOd3fNX84Opj7QaqHwv88RnZC6
         b4SbmVJxIHEBzTgvUAjdT7UbsQPiNf2BkAZ1WMLhy/Ni20JnIFRtrRvlyzicSVdndQju
         30z1V8eWFKt/5/eJ8/LSaWOdDPd/8Wr9iuahrb0Fr/w6oL2fFDDOqqfU43lJfbthBloq
         lI2SuNF4ysI12XaFLOxGif15IvfnkiQiPxNcVm9w10HeqFoqmB65kiKHIEquXaxJa5tA
         c5ga5idDYI8eZG1r9NTcj7jPmOBXlJVxexRliPK2Ulalrsms/VnO9lozElpdYRCajtO4
         QfRA==
X-Gm-Message-State: AOJu0YwUVD1ZNAdk7OILq64nSRN9F5ehrVrZg8zaGRdb0fMMFgR0Y9nF
	E750GDj91Nzg6a49CAkpmU85gs8AomY=
X-Google-Smtp-Source: AGHT+IGHRLIyxOEOlqNogao+wtJt3d7D+zZNTRSCijTepfZz1QuZZsrU81NGe3dzgdfi+rQuqyfdUQCuPic=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:4211:0:b0:d7e:c4af:22d2 with SMTP id
 p17-20020a254211000000b00d7ec4af22d2mr293199yba.4.1693958192804; Tue, 05 Sep
 2023 16:56:32 -0700 (PDT)
Date: Tue, 5 Sep 2023 16:56:31 -0700
In-Reply-To: <20230901082025.20548-2-vbabka@suse.cz>
Mime-Version: 1.0
References: <20230901082025.20548-2-vbabka@suse.cz>
Message-ID: <ZPfAL0D95AwXD9tg@google.com>
Subject: Re: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
From: Sean Christopherson <seanjc@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: ackerleytng@google.com, akpm@linux-foundation.org, anup@brainfault.org, 
	aou@eecs.berkeley.edu, chao.p.peng@linux.intel.com, chenhuacai@kernel.org, 
	david@redhat.com, isaku.yamahata@gmail.com, jarkko@kernel.org, 
	jmorris@namei.org, kirill.shutemov@linux.intel.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	liam.merwick@oracle.com, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, mail@maciej.szmigiero.name, maz@kernel.org, 
	michael.roth@amd.com, mpe@ellerman.id.au, oliver.upton@linux.dev, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, paul@paul-moore.com, 
	pbonzini@redhat.com, qperret@google.com, serge@hallyn.com, tabba@google.com, 
	vannapurve@google.com, wei.w.wang@intel.com, willy@infradead.org, 
	yu.c.zhang@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_165635_268348_67C72983 
X-CRM114-Status: UNSURE (   8.35  )
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

On Fri, Sep 01, 2023, Vlastimil Babka wrote:
> As Kirill pointed out, mapping can be removed under us due to
> truncation. Test it under folio lock as already done for the async
> compaction / dirty folio case. To prevent locking every folio with
> mapping to do the test, do it only for unevictable folios, as we can
> expect the unmovable mapping folios are also unevictable - it is the
> case for guest memfd folios.

Rather than expect/assume that unmovable mappings are always unevictable, how about
requiring that?  E.g. either through a VM_WARN_ON in mapping_set_unmovable(), or by
simply having that helper forcefully set AS_UNEVICTABLE as well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
