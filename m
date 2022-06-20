Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0684C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRvD4V4AAsgH0Kx2al7lprj78vZl9MJhlVDqb8QOtUc=; b=Mk2xb3HkgY/Hef
	WxQ1YlWLzsS4TnXfE2QFjnjssHuR5KPANvcReDRvSalPeAOCccAfqvDSToYHlQNfT9Nikzo6LHI+g
	N9R2zLztN9zCd9p+BhUbbP0LBh1lcSy4EqdjQpfKGxTj0ZAfEwHE+JBDgZ5fovRq9iAP+Ih2UPnK9
	Dc5wqvNjKErQZRFsLcpXyrMb9P0n0S9kx9Y6uQf3EfBHu4H9NBZVAACsAtHqSoHm5GT+1cN8AD8/E
	m1VybuSnEzVZxPhXFs3FonfKk53x0B3Crv+E8xXSsP3WEj4CRXbgRTOyiBwVAfvDEZWFIF+LagMDG
	9nyeYwwlvPnZonqA311w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3BvP-00Ggar-6S; Mon, 20 Jun 2022 07:34:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3BvC-00GgXW-SC
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 07:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655710442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9O0CIqeEaoJn03vVtSYdv9IsNbaraVCXGcehJj6LilQ=;
	b=ewkgVstQyW9Cfr3tbIeQA+8+IZLhP3s8fSfkwQipnK2ZzwqFUYtvTmiVAIhXBq2OKTvbCV
	K6QjRenFUTmtB3RZtAUPGJiUSiwxPpCVeofgJ+ry7/jNrIxL+g5bbUZgSPr4djTOKhETKK
	E8Xw7xv120qkrE///+1RI6QjSybDiMw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-O4eQGoaBOPqOW6-y1hVOYQ-1; Mon, 20 Jun 2022 03:34:00 -0400
X-MC-Unique: O4eQGoaBOPqOW6-y1hVOYQ-1
Received: by mail-wr1-f69.google.com with SMTP id l9-20020adfa389000000b0021b8b489336so840932wrb.13
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 00:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9O0CIqeEaoJn03vVtSYdv9IsNbaraVCXGcehJj6LilQ=;
        b=IFhL2m+syvrX9VzvYju54h+vscbk0jlmc6WPBhzs974OAK5J+odvH+OffPIhjdQZzY
         7nGDTPc0J5DgdR9z9z1VCe7jh5fPL7A6d3jFP5cB8Ki9geIYAWi2nvrLSSu83iwsmwJQ
         cJbxsjCCn01RSJJstbqTe2dF/5gM4BOBRJ5JmKNMhK7v3idPGsHHHFpQhoBJhZ0XGft7
         EjuwRao7+7jKkUL68zcKdswlIeoG6/2CG6Too7fFkSl6eZ4YjJk3tnr6L8ZulIizlEnA
         gzMvFIu7ehyAd3XjHPFWBArWXK90QDpZH9oaf5vbVSeT2e5YxzhuUTYk4KMQ5ZBDdsCc
         Xaig==
X-Gm-Message-State: AJIora9KOD3x10j4a+UIaIep3VZYgbkwx/fYwJv1AEtckYKFlfI14Hk3
	+T3TVXaW6sE6hPgQVH90YQPC0up1VKd1IUz7oQPxpXpwGOQe3E17tnv219cV+tJj9e6+LZnavlO
	ZALQFjwddog1qCVsvTEQVroU18HH/
X-Received: by 2002:a5d:59ac:0:b0:218:5b7e:1c1c with SMTP id p12-20020a5d59ac000000b002185b7e1c1cmr21891435wrr.621.1655710439347;
        Mon, 20 Jun 2022 00:33:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vkewhJzwIOJ9l+/yqE7pUpzblIRdbrwtFQigT8P4KR1GnlkLPaHlZsigHVgHZi02aADaZXLg==
X-Received: by 2002:a5d:59ac:0:b0:218:5b7e:1c1c with SMTP id p12-20020a5d59ac000000b002185b7e1c1cmr21891397wrr.621.1655710439119;
        Mon, 20 Jun 2022 00:33:59 -0700 (PDT)
Received: from gator (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id l9-20020a1c7909000000b0039c96b97359sm14054471wme.37.2022.06.20.00.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 00:33:58 -0700 (PDT)
Date: Mon, 20 Jun 2022 09:33:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Subject: Re: [PATCH 0/3] KVM: selftests: Consolidate ucall code
Message-ID: <20220620073356.fmtsa4ub74igm7me@gator>
References: <20220618001618.1840806-1-seanjc@google.com>
MIME-Version: 1.0
In-Reply-To: <20220618001618.1840806-1-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_003407_033821_3DDC27F5 
X-CRM114-Status: UNSURE (   9.77  )
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

On Sat, Jun 18, 2022 at 12:16:15AM +0000, Sean Christopherson wrote:
> Consolidate the code for making and getting ucalls.  All architectures pass
> the ucall struct via memory, so filling and copying the struct is 100%
> generic.  The only per-arch code is sending and receiving the address of
> said struct.
> 
> Tested on x86 and arm, compile tested on s390 and RISC-V.

For the series

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
