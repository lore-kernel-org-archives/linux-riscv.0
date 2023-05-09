Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375D5C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 20:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBArIdgXTwBZpxsLBHUMCtCaMXmPHDTto50m1I7slds=; b=ecimXzlu1OmNKC
	7Zl63CtBcRtwN+FHZMuD6MXtT9x/Vh+u150XT9rF7KvsSb+RTgXEYVE9lDeGxlePi9hPenjHiDpst
	2VXclPIYICaUnnURSNfkwWYZ9zC6fbRgAGu7Tn/njcry+upneCoDnAm9gku4fdKcGp2FcJZSky7i6
	H08AM0GoP5L2dCbWPNxugpbS0TBkqZecdFo/d+u+KGjX7OIa/bHr0+ucTRj5coxahRP3Iz6g905Kk
	w0GD7JxC0cGpoFzXjgXpf2LvyOjGrzekHb9p0KJX8ERHLBZs2gBKB2GhZ5j5wXQHXc7WSCn0+ocy8
	LEJMyZDtVpxK1aX4+6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwUJm-004FSZ-11;
	Tue, 09 May 2023 20:52:18 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwUJj-004FRE-0g
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 20:52:16 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-43476bbec67so4040643137.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 13:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683665528; x=1686257528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ek4N4zhVnFp0OjD2e91cJw6qEMFFDQc5/FTgmHiGak=;
        b=rVJW9XdHV4bhVBpENigqqik2I2pCncaz794aO5r0GaFD6EOogLB5GsTpjkOXXFk1cl
         BLaajyFwcHYbDsMksrmy46rkJ8Xg5XgSiPcKIeqTk5sc4i6ByJVNSNE661bfq0lTqdr5
         15qPLPCf/jWgZf76j7FinTn4I6xu8cSDiM5g9kSu8JtTXKgSM8OwYPMKVaG7suYL8InA
         DMrcHjABRjgiApDllMJEgP/iLFCOFcqlwydZH35zZAE5dGhLWBf35Ag5dGmDJHpUzL+l
         I6D5uZx78KFyGlmPQFh+q8W5REGbWvTcrIRfpmnEKUzBt+OarAE0cEQNLkGT/+HDIP0z
         HuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683665528; x=1686257528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ek4N4zhVnFp0OjD2e91cJw6qEMFFDQc5/FTgmHiGak=;
        b=gPw1A+47Kr1V1byCZsRxXpNjVYF8rLX+n/6RH74vL0uNZshSAp8vRXweM6Rt4TvD4e
         4QyK91qIpCwyWBTipiHGd403gtk/e5vt1H7L4q7FqgjQzuJwp4oUCefza1OWnTAQnMQm
         q5L0NTtFK9ALxSO+j4wq9rNJCgnO/LC3RcOonkuXQ/uehZOIJwS+5gjDiQDkpwA8bv9d
         pERtI7KCwAn30d7K8wo4O86bL4YbQZDj6UNNGnTq1vF/cmlMOhT0qWua4VISBGXMXqjT
         iTVwDJpSuyDn2MxPgeL8Ohp+NVPP5/6fx9gb8bO0fUKtMC/hKqi9LP3eQlr7Y4LTiAPB
         kPMg==
X-Gm-Message-State: AC+VfDw7szUxeaHSCs5QnfdMtN22xxwq+x2VpdPGNWyOb0aTtZTYgquL
	piqh+5DRZfySZR92Sb3tVKI05u9rbUI/lUmpTOGngg==
X-Google-Smtp-Source: ACHHUZ5qUtibgquXG1CHXn5rsYEnNugGuamTPmXoGAjYsiSltyM3mefeFrXCpD+c8boXnApqrdpstv0ZlJ4ZhdJ1iOQ=
X-Received: by 2002:a67:f291:0:b0:42e:6748:13dc with SMTP id
 m17-20020a67f291000000b0042e674813dcmr5348659vsk.0.1683665528538; Tue, 09 May
 2023 13:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 9 May 2023 13:51:42 -0700
Message-ID: <CALzav=fZFpzw57hNmg2fqYG-0ddtvQd9+=7cw8tzuOGbZW1A1A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM: Refactor KVM stats macros and enable custom
 stat names
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Sathvika Vasireddy <sv@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_135215_257663_62049210 
X-CRM114-Status: UNSURE (   9.22  )
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

T24gTW9uLCBNYXIgNiwgMjAyMyBhdCAxMTowMeKAr0FNIERhdmlkIE1hdGxhY2sgPGRtYXRsYWNr
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgcmVmYWN0b3JzIHRoZSBLVk0gc3Rh
dHMgbWFjcm9zIHRvIHJlZHVjZSBkdXBsaWNhdGlvbiBhbmQKPiBhZGRzIHRoZSBzdXBwb3J0IGZv
ciBjaG9vc2luZyBjdXN0b20gbmFtZXMgZm9yIHN0YXRzLgoKSGkgUGFvbG8sCgpJIGp1c3Qgd2Fu
dGVkIHRvIGRvdWJsZS1jaGVjayBpZiB0aGlzIHNlcmllcyBpcyBvbiB5b3VyIHJhZGFyCihwcm9i
YWJseSBmb3IgNi41KT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
