Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED215C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCJBe5ILzaOohQr9U9tsqSjqb57I5N2e0zkYNfrXP2U=; b=CfYAdGQPrHF2gd
	bvdTqTBSqInLavIVOOnW5CVdmN+v0n5OZBqG61GIYz7Ouh/tqQJ9l73T84DkJ0Ea3Rlbi2H7o2Rqh
	tbFGFv05E14829h6sizllXGgRSDNgPWYu/F9x9Yi4TQTFYiP3ISBSv+6VAopv9Beyeyfo7DxYtWDW
	io4VIPR9qvWiI2JW7IGqSecvMj7rN8tBSl4vNlMwQ5WNNJNSuKAzWigbhnA0ipx2ETtRgTC6fdxQF
	JaTdPM7YWhBEwgn7cYrbXJV0cuyZPurP6TRZTTMCJ+/CQgLbuvyDRrF5/SfisI7a5qfUOqbw3N/u7
	2IptjlDEYqGf4DBizvOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3f4F-005ulS-7O; Tue, 21 Jun 2022 14:41:23 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3f43-005uXp-88
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 14:41:12 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 73-20020a17090a0fcf00b001eaee69f600so13607580pjz.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JOicc8moSgPUHZwRa0UCLUvVifYA0qTN8DaBzCizOgw=;
        b=cKCuyyDnkfNQBL6avZcuKqgcaAnrDgGaMrPVXHKS56JghxcscK9NoNnj3Fq7/NVRC+
         oRVzrbe4sEZRyZOqRivaOWFZO8Gd7vthX9YgbDCc1RkeiGegxd0pyZQqGZ/UzgMt5ruJ
         MaD7F/sfEkQoWFzd4qxP745PX7p+Gml77tWHRrjRjkZiJB4Si0+QNOhldE61LLtgrKtz
         z7nAckxCBVmBlyIGhrdH+2BUYxEDwzsjv/pBBt1WZ1hcXBLEmjxXq9UXzk0BiNzqacIe
         VkYCNWJt/9iPC5J8GLSnvPOdHVjKAoDqjVqKQeMuB+EOm3tQprFc1Ew0wMXup3tiDdCK
         rfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JOicc8moSgPUHZwRa0UCLUvVifYA0qTN8DaBzCizOgw=;
        b=VQY1NPE5hQDLa+uRtMNiABcUHZL6AxD5iHvUzftp+qFq6xKTlBzTmj4kRVqXJLuDe3
         jh2HY5FWaOjlsyXcrnCaoSXM+S1ZKIUjKyJMkk0EXuNZKAlKRMFb5Dln52VhIG5x2rT8
         GQPAMh5JX1VOWmDWkyGeebwK4b7WWzwRkjCchyRVp++ISm/CfZs6j928Shk3f1NMsS2n
         KCpcxtb3mm3CXkxpESRJxHvScw3RqylMLfRfQ23pnE/wAFxOwwe0bGLOXQmodh3mLzX3
         EE3YDBAhUfS+M/r+QrCTqiwHHgQAW6Vunwb+Kql+qN+zDxwQEc1tkP5DLT6vgVAWs2q2
         /MQw==
X-Gm-Message-State: AJIora+NxDK4IaYabXp5tEMh2wwu8puiz4EzoF1PdsXpBcatIDcPL+yT
	GdMjyzzqMNQ/WFnf+A3YmOGO2w==
X-Google-Smtp-Source: AGRyM1vJrRABFv+Um9W+VY7dY1s+g55BsfMNsbio+5fYQj4/zIQK6olfXAORs7KW0GbN7wK+7Xjx+Q==
X-Received: by 2002:a17:902:ab87:b0:162:26cf:bf7a with SMTP id f7-20020a170902ab8700b0016226cfbf7amr28637304plr.168.1655822466277;
        Tue, 21 Jun 2022 07:41:06 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902c65100b0016a091e993dsm8269986pls.42.2022.06.21.07.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 07:41:05 -0700 (PDT)
Date: Tue, 21 Jun 2022 14:41:02 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Shaoqin" <shaoqin.huang@intel.com>
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
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH 2/3] KVM: selftests: Consolidate boilerplate code in
 get_ucall()
Message-ID: <YrHYfiI+54hAp0vv@google.com>
References: <20220618001618.1840806-1-seanjc@google.com>
 <20220618001618.1840806-3-seanjc@google.com>
 <de35d629-e076-e02d-7482-c93de628dd82@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de35d629-e076-e02d-7482-c93de628dd82@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_074111_362903_7BBDEB37 
X-CRM114-Status: GOOD (  12.63  )
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

On Sun, Jun 19, 2022, Huang, Shaoqin wrote:
> 
> 
> On 6/18/2022 8:16 AM, Sean Christopherson wrote:
> > Consolidate the actual copying of a ucall struct from guest=>host into
> > the common get_ucall().  Return a host virtual address instead of a guest
> > virtual address even though the addr_gva2hva() part could be moved to
> > get_ucall() too.  Conceptually, get_ucall() is invoked from the host and
> > should return a host virtual address (and returning NULL for "nothing to
> > see here" is far superior to returning 0).
> 
> It seems the get_ucall() returns the uc->cmd, the ucall_arch_get_ucall()
> returns a host virtual address.

Yep, get_ucall() then does the memcpy() from guest memory via that host virtual
addres and returns the resulting ucall command.  The intent is that the arch
hooks are not to be called by common code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
