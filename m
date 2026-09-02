Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B044BC61DD6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qnqayf2UiNCwA/U1Q6KtUNIMMazBJqQzb6+RZj8zhR8=; b=dEjoD+L1PDoWI2
	bRiQXi+VrWnPa+zGthgsVZZqMzACQWJLZWpSaP+ddf7Iw86RMS2cDaIgiWPEFRcjy/Vzn/YHvaa8z
	v8pApGL9wXGBUOcCnuVIwMgIVfFEGOFQP8Tau3AxIU83iygT8K6zJRYYVF2WAUQ9CrZJctWw3PG60
	PqwHQnFFQYVDljewFO5zZ6BU3ST7Bom41kg4lJ30sTb71H6YT5uWxStmQNFnUT22uK9e37kJeBFmy
	szmMc637/XZtOMg6KDJJXew+8AQ5nwjUaIZ1rB59KGP6MQ+uFlrSUbKqzk6ZE8wmUVPL5D0mqguEx
	cC2bvAZpA3NFyFY1j7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2S-0000000FFku-0pN6;
	Wed, 02 Sep 2026 16:42:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o25-0000000FElg-1Urj
	for linux-riscv@bombadil.infradead.org;
	Wed, 02 Sep 2026 16:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ff1nydjVZ5E7b5LVcCvqITlv5jcgKgSL4KOLnEEEgvQ=; b=jHWYSB/osliC758ewTEAh/5b7I
	xBuVAIwPu7QmTgogSd3bn+hD0TkwPQ/PecxuBrcsk+Xl1qyvIyhS5o8giFcpMTd6mPXio5fGCspRW
	kQ83/UZc45tngBQzPEZFvObTCvgdKoK3z8iNU6v7pax2OlM4aHfGm7p9uKvsXSQeJaiZEtxEm9eDg
	uZ4vNnyvGU1O0zSai8P2smLDx5fhVh6syYhwAl935pQOE7uHCZTtSZwtakg0siC2N7fM2gpvvYjzC
	woU688BlSEYHfD83h1M8YFlBXajD6K+rYQtXQoRTx+nMCD/6EJ2slY4xqpYwqAhwsC/UZLqAWX460
	4RaGsiVw==;
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1o21-0000000CDAZ-1GIr
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:51 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-39af92138f9so94154a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367306; x=1788972106; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ff1nydjVZ5E7b5LVcCvqITlv5jcgKgSL4KOLnEEEgvQ=;
        b=iSyjBRcWRzGu1e9bYsj2gCr631naew8uj6oM9tgZB8uvsis7/ExWoDxR/DOzFdRuH7
         8ujTDC0hN/qIuLkilrUznWFtAShVAQb3K3U2hHLCE1Hgi/VJImU6PNw3+vhePmaKUcmp
         Ch3+kP9OelbIhJ0Flc1grUnZMVKSmrM97HmFwAkUvozTem90SiP0RI5WNFe3DamDJTm7
         qcIaubcesJldyvdQBOMt+hlNrDXadQCvWId+j88DaQ5SsP7ELVe76/wQo180Pg/dzDIT
         OmzH0TyA3oS3GiryvDaL9vCmGYzmibnBAy9MNZzqw0wrX593koRoozn/kOmzkbfaBrI9
         2k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367306; x=1788972106;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ff1nydjVZ5E7b5LVcCvqITlv5jcgKgSL4KOLnEEEgvQ=;
        b=EPJZgN1v9WsY9Ou6KKHKn98fxFCx+RwqjCurkvNY6wv6c6RSqqJOhwKtyhA2NWfesQ
         atpdoq1qYgTWbto7ocK48z+gwOGNaiCj1NEecMr2IFZ7VNFUukTr3GwLf+xOPXGfpFsO
         OpqiczRQ2ifnzlGJCN9s8ADN/YLUBQPDgICTKVjEkaHgWV6+HQBSPTNbMBTiuxeHWx4d
         fXzcTXHzfcCEB+FarD0DzasHic3sptzkFJ7vM+M7Fxm2kQhV9EoxXzv2Ik82+mupgfLf
         TQLP2H29mzcuPahbeM/ECs9Gkx44I1K17IhIL9BSYp8qZCAf/jmkEhrbJR+ES3EZBDE6
         BU6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwxHgsLr59xOAidtNX6tfEFUgpM1K472HQVKGaiM7xz357fWEZ8e2Gkhat1/xS9Xw5tA2cxqPHo2P+xMg==@lists.infradead.org
X-Gm-Message-State: AFuF++nDfhrwWMT8OQX90Sac4prHtTD4MDjk0dPCwyStL3BBsRXMDgYt
	erISAhv3K27Q9h0bOfchyWwC8Ia9JwgtHsfZSvW1/1S5VQoNd06lkc4bvojwQmTaMafORMsrzA+
	zPh3+RQ==
X-Received: from pjc15.prod.google.com ([2002:a17:90b:2f4f:b0:380:cd24:3a7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dcd:b0:398:9bd3:d6d1
 with SMTP id 98e67ed59e1d1-39b083af6fdmr384502a91.11.1788367306328; Wed, 02
 Sep 2026 09:41:46 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:21 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-19-seanjc@google.com>
Subject: [PATCH v2 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_174149_499823_E58AFD92 
X-CRM114-Status: UNSURE (   8.99  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
input is guaranteed to fail the test, and with the standard error message
format.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c9ef2e5c9971..c166fce4599c 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -200,7 +200,8 @@ memslot2region(struct kvm_vm *vm, u32 memslot);
 static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 							     enum kvm_mem_region_type type)
 {
-	assert(type < NR_MEM_REGIONS);
+	TEST_ASSERT(type < NR_MEM_REGIONS,
+		    "Invalid memory region type '%u'", type);
 	return memslot2region(vm, vm->memslots[type]);
 }
 
-- 
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
