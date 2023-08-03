Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC8FC00528
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 19:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/X3UKahStBt+P7aX0i0BntgDMUKPM5FN0emTGI0Ziyg=; b=cboko/PTYAODjRsKoTKLtZQzRz
	6tygG9N1lKw2iZBTOvkOSBFo5a96ndFu4E/xCLsz1+5Fj0HCCrE1rfNSjsu1wioeqGcwKIdDLObzW
	D2c4aRPQa8hs1xYjpHMNiVS/WGkwLtRzTFWAHZtbPKuae9/bSKPwadDOMUy89cDG64fps3PJDqoKq
	o75W+dujNYQB//p7cILt0TcdCnHDeJ6zETLKTSGYPH0WvH804tLt+MppmArmeu+m2+fAMuqx+NOe9
	EaxhppWBjDoJrEPW+EdKZTwwqCmR3ndu/+jdV+mx/ce+TSQwwMnDOa/2W6W75mqkuEs/HhiHkXPzk
	jH5oqr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRdno-00Aik3-1T;
	Thu, 03 Aug 2023 19:16:04 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRdnl-00Aii4-2h
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 19:16:03 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-55c04f5827eso879849a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691090157; x=1691694957;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1QAbc+4fCOMN1wq3LOwJ4k1bsXl9R1Q+x4bhgj3rFIg=;
        b=DSNF3uKlxbN1/j9sGPdV4RLbiLmTPzUp9Zu3X+X+jI/CXp8qoKO4kiLFxh0eWH4ras
         3UHMbP1YaoUXHaU6RKc0xiD6OqP0/G8GaXsxhmkMXaXcobPCXbuINlBumVapPQ9eL9WI
         SQMF6MIyr2Twu3rQpgN63Ty4xEmvWMdFcq1qk0s/bO53R4WtT4D6mxqEq84CrHbE24tW
         R+R0wb7QBQEWXSd0EQn3phD4GyYVVYig+DH6wM230PxAw/bTqhOS8nPt+LaY5XqmbBEo
         2lNVu9E2Fm9D/OSL8FvXxR34+QmBLtfkxeWiU2TVRkIK5+koZ6XE0PUmvWk9wsqvFkyB
         PpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691090157; x=1691694957;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1QAbc+4fCOMN1wq3LOwJ4k1bsXl9R1Q+x4bhgj3rFIg=;
        b=AE2otlvTbdzd2qJpCzEkwPC3pmxCS8sa49SbMcsQzz4p5y29TtEip0bP80ATijb/K2
         3EA4NP9QQ8Llp8Ph2yfFknaoxdenMdXcebaDn7pWoVa3weC8goVt07oBUwj/oNk3Nl3J
         tgfwuRAi5m0NUCRJMfZ7ocpWoM8nnU/RxGk94r3VGDxzSm6aM3MEGZuC9G244EqdAYif
         GQsdAxetxDZuNPDHvU2Ru/Q486kDmSgdyJPCICWh5z/wZQFFlDQaYOZNm9/8tQkL9sa3
         B6T7Zhu4sRkil4aT/Nohq+NljCgoPlDLZa+XiAe0Tz64jSQYkKqBMeUnr1xVbYMqLUAu
         dpgQ==
X-Gm-Message-State: ABy/qLZ+AzINHYmK0fbO3237979sY8xrEHv5RYjHGmqvhLPqDQAOdrss
	AKOl1V8w5RboWk9hGsu74MHc9SRzvAtn
X-Google-Smtp-Source: APBJJlHtGvcJEMYqDDCqDrlA6FqIV7ZBvnc2RG3ctaXexB6pNXaY+PGUAOnc1N44cMVGOG5WgF6ZzIYHZzSS
X-Received: from afranji.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:47f1])
 (user=afranji job=sendgmr) by 2002:a63:295a:0:b0:563:5065:9d40 with SMTP id
 bu26-20020a63295a000000b0056350659d40mr129290pgb.5.1691090157410; Thu, 03 Aug
 2023 12:15:57 -0700 (PDT)
Date: Thu,  3 Aug 2023 19:15:54 +0000
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-13-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230803191554.205599-1-afranji@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Ryan Afranji <afranji@google.com>
To: seanjc@google.com
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
	vannapurve@google.com, vbabka@suse.cz, wei.w.wang@intel.com, 
	willy@infradead.org, yu.c.zhang@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_121601_887673_4075EE35 
X-CRM114-Status: UNSURE (   7.60  )
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

> +static struct folio *kvm_gmem_get_folio(struct file *file, pgoff_t index)
> +{
> +	struct folio *folio;
> +
> +	/* TODO: Support huge pages. */
> +	folio = filemap_grab_folio(file->f_mapping, index);
> +	if (!folio)
> +		return NULL;

In Linux 6.4, filemap_grab_folio() may also return an error value.
Instead of just checking for NULL, "IS_ERR_OR_NULL(folio)" will be needed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
