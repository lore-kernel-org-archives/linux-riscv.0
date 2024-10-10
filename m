Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BD8D24447
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfZFV3tO6AJp6TJ9UzO/p+dXCTe/4rQdYXXIixUroxE=; b=kpCFeMNzc1Moxg
	RkgqGZrO4UdH9AIuHpjts7zVEdV27AhHGOy9hnl8Id4xdDlEHa2HvyHAwlVRzFha6qUVBIQAJExGp
	fRrw3RomVV+EwGQmx2srY42hcGsTJ2W55sgSKhkk7rWJI6I5fF6oNmcxpivh/4DCibJEECYCfXN8J
	3TX7DGDcGsDs3Pd60sFt7gJMtNmZhuyVc3cZZA6TQXkVRV2WgjGZYmpshSBz0iMiMKZ89MajAXkW1
	6KalT6ZPepzMg6PjI+9+jB7WmD9wDiSIwQETkWjRxrYuK1tCYlTOnIv49hT5N5n60h1wmndpPmPEM
	BviJwoa70bUKtuwcSm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzCk-0000000ECES-3hgO;
	Thu, 10 Oct 2024 19:52:10 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxt1-0000000Drqz-1UFS
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:44 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e1e989aa2so1656603b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584862; x=1729189662; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A6YyPrl/aVt4zvDZFXUjzF/Zy9evtaTkH7tjbHPMI5E=;
        b=ls6EkiR4KuhBz6/sYUk1bFoSMivDvkbu3Ml1zJw7Cvt4EQSBWmD1o8EtK4HJvzfTGw
         hC730xjyAX2jlRhTdUDbZ4yQM03Vvp+wRCa3voXldfXjYz/y3KRfiPSfPQvoEMkhWV9M
         jMqxVQrr9LdJzhtKSrtfqCOm56lhRocISlwa60nFFZzbQAAoHnHDKtjqmghany/Exgs/
         pP+fhdk2VmvD7o+2ZQYsc8z/6o5klCeCgp8pjFTTL1t3EhZkhvKN0EWKDORfwXvvtHYi
         wt2sjPeF1qKNEIryfkK05p9i2SDvhfBiXnxLot1wvYGKZsMKwYYZHhhjIXzBzWpa4BmA
         1MmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584862; x=1729189662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6YyPrl/aVt4zvDZFXUjzF/Zy9evtaTkH7tjbHPMI5E=;
        b=DrVfGomWfDbj/kT9qtyoXZPeKtBl1JIYDDzcFqTz4xaDO9f1+wixlxaDfdl9IInGXQ
         ndCfumJL5HG5LThFkuM10azcj8JU3l/N31CnfclY9RwMWwHa3VW0Ext5KGXq/IsbHbxS
         JIp4K96P8jJG4mCBuXYsD20r24C0aUjs0P7PEwVGtVPiUTcKXJ60YsBeoVdkh2SW7MAD
         J5I2cIpwidYmCSrvLKCgCp/klIxRPnFMc8vk/wYQSvO7/v3T4Pi+e3VnF9t7bx9gkKM9
         FwU3nRB1BDyG5rOGyg0HQxdTMTRUxInX5T6TKp3K6DH8HpoBok7JK+OoGxZzx9/tfb40
         4xzg==
X-Forwarded-Encrypted: i=1; AJvYcCUtqP9t57k1HHEGLelc6b8varACqZ6cjX4aLtKsKmfVOd4+9AgeKXTDmK9gop8kaa5IZDqIY1nv26t39g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdGHGSO6/2/jer6fRz7arC4jx1VIx9DgKuLURqjcSnbLWVoikD
	5x2sRfWqQ/HGg4ghfjCnnvyvg9HYvlEENeb7V2/V1aIZx3T5/PIW8D3sdMXRxyXVK1WIkCaBdV6
	n/g==
X-Google-Smtp-Source: AGHT+IFRVsKTyvnlBUrQtNNg8zvYT0OU1qw5Av8a7Gq/P6vdrCxit4uLl8sEcLrSKXXTWA/vla3myJTtPpY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:9443:b0:71d:ff10:7c4 with SMTP id
 d2e1a72fcca58-71e1dbd1d0fmr15196b3a.4.1728584861919; Thu, 10 Oct 2024
 11:27:41 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:22 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-81-seanjc@google.com>
Subject: [PATCH v13 80/85] KVM: s390: Use kvm_release_page_dirty() to unpin
 "struct page" memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112743_484534_CC6EB510 
X-CRM114-Status: GOOD (  11.21  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use kvm_release_page_dirty() when unpinning guest pages, as the pfn was
retrieved via pin_guest_page(), i.e. is guaranteed to be backed by struct
page memory.  This will allow dropping kvm_release_pfn_dirty() and
friends.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/vsie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/vsie.c b/arch/s390/kvm/vsie.c
index 763a070f5955..e1fdf83879cf 100644
--- a/arch/s390/kvm/vsie.c
+++ b/arch/s390/kvm/vsie.c
@@ -670,7 +670,7 @@ static int pin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t *hpa)
 /* Unpins a page previously pinned via pin_guest_page, marking it as dirty. */
 static void unpin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t hpa)
 {
-	kvm_release_pfn_dirty(hpa >> PAGE_SHIFT);
+	kvm_release_page_dirty(pfn_to_page(hpa >> PAGE_SHIFT));
 	/* mark the page always as dirty for migration */
 	mark_page_dirty(kvm, gpa_to_gfn(gpa));
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
