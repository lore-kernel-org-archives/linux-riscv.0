Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B5EC0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 04:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6O73bV0idNjI67DAbQlJZkz4ehE8as4OSWknHwW5QvQ=; b=zzew6NUO8aeu1XiiYp3fijvW70
	Lv9Fq4pj2G7843mnWVQeOFWolwHlSLKTVHINZnJfGpDWVrOkhQygHcfeXAqEY7mNed6pwOTowOOEh
	XY581AnJcdm2CjunWjljxeaQgcC9DbEUAMlvWO8TLhz39cXobgdimHl5JbqNQBWauCYobwSGa4P8n
	ajNgoD923pcDEUPxMLsk4ujAIQyNB2U9AKBhDfFIkkxp8nH5GEqtRPwqXp7HV9F+Xu5XSi6lvAGBp
	PAEiQ70Jgwsc50/5k0Wn/IE09+K1x3eUDMibJXldVHLS0LE8LzMUzT7ZiMkCOdbdsGhYaFjRsBg2/
	OKyT2twg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK83-009Pnr-0L;
	Fri, 11 Aug 2023 04:52:03 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK7h-009PTd-1j
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 04:51:46 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-1bb6fe22b11so1805411fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 21:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729499; x=1692334299;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMunAMeBPKEY9T5yrPL+aMpFgaQV0/xsp/XormRaoBM=;
        b=oGyGjViqZNQB5Og/8KSGJT7aIHo2wwBSCnK8zrh4WX1dkLcj8j7++RIJ6MMhwLKJJM
         TFwYrscibPCB3QmC1vwbGjOxG+yFgDZoqgTW46Q0I43fh6plUvYPK40YZO8XMwTjrOdi
         fnlSk08NlXYIbGNj/3hHqeyZAiHuO84I1eN3h2UfQvsIoxOYp1344xAWxUoDUNlguK/d
         5kLKAQj90+6/pX7UAxmtBlnRcJeCRHfDdeQh/yfwKQtOSPDaI07tcbauCsIMB854pARh
         XzBdqJA4i4gXWPKDMXc/sVC1BnOhZZ28pfZehmEJ44oNDRLqO12bBeCK/TDek5KZpg/u
         BZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729499; x=1692334299;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KMunAMeBPKEY9T5yrPL+aMpFgaQV0/xsp/XormRaoBM=;
        b=aQVb3Qm32499B32xB9sFarDXKVV+tFOAy49Xz2gzAZlrZH668wvTtPUxZ669zTCjFP
         svm6ZPEbOdCz5X1P2U5yc9ths3UWpNKUkE8WB2TUkKJJBh4s5NbafUrGBdOBTUaqGqwB
         dnZajjbweLOTbKJq/atpwU+wPnz21VNV4eZWaKvX1qI95i82OVvVJIV3hgQ9n2qq6KnJ
         NT0kJ+X3noM7rgAOzoL+RwDB9oOKzi1CvbV/ahbyrx7HXby/J5B8XsFD+yZBfpy3rU5L
         jnWhoqOMPoUWWphtgUOOv/yVhA5jHgs3DqZhKXY+0Vrn92CVBB49nhw4ovxBSDXXjbBY
         vLsQ==
X-Gm-Message-State: AOJu0Yy9Vn9bGhgfVosgcOfz8qCLDAMJDRNrDIyyTfO+WFdYHECNOBfD
	2EdRYBveWK4Yg7qtQSDaTsMVaB7TDIxF
X-Google-Smtp-Source: AGHT+IE6iu8kZBBGXiPktI0w4Wht3tt9FXqeaiP6SFiaZO7WXbsaeVAitcRGbh4LxMh2/nvqjLQ5ZRjkCZrA
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6870:1ab5:b0:1c0:e9e9:ae91 with SMTP
 id ef53-20020a0568701ab500b001c0e9e9ae91mr13992oab.3.1691729499613; Thu, 10
 Aug 2023 21:51:39 -0700 (PDT)
Date: Fri, 11 Aug 2023 04:51:17 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-5-rananta@google.com>
Subject: [PATCH v9 04/14] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_215141_661934_FC5A62DE 
X-CRM114-Status: UNSURE (   7.50  )
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

a3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoKSBvciBDT05GSUdfSEFWRV9LVk1fQVJDSF9UTEJf
RkxVU0hfQUxMCmFyZSB0d28gbWVjaGFuaXNtcyB0byBzb2x2ZSB0aGUgc2FtZSBwcm9ibGVtLCBh
bGxvd2luZwphcmNoaXRlY3R1cmUtc3BlY2lmaWMgY29kZSB0byBwcm92aWRlIGEgbm9uLUlQSSBp
bXBsZW1lbnRhdGlvbiBvZgpyZW1vdGUgVExCIGZsdXNoaW5nLgoKRHJvcHBpbmcgQ09ORklHX0hB
VkVfS1ZNX0FSQ0hfVExCX0ZMVVNIX0FMTCBhbGxvd3MgS1ZNIHRvIHN0YW5kYXJkaXplCmFsbCBh
cmNoaXRlY3R1cmVzIG9uIGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzKCkgaW5zdGVhZCBvZgpt
YWludGFpbmluZyB0d28gbWVjaGFuaXNtcy4KClNpZ25lZC1vZmYtYnk6IFJhZ2hhdmVuZHJhIFJh
byBBbmFudGEgPHJhbmFudGFAZ29vZ2xlLmNvbT4KUmV2aWV3ZWQtYnk6IFNoYW9xaW4gSHVhbmcg
PHNoYWh1YW5nQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRo
YXQuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5h
cm8ub3JnPgotLS0KIHZpcnQva3ZtL0tjb25maWcgICAgfCAzIC0tLQogdmlydC9rdm0va3ZtX21h
aW4uYyB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS92aXJ0L2t2bS9LY29uZmlnIGIvdmlydC9rdm0vS2NvbmZpZwppbmRleCBiNzQ5MTZkZTUxODNh
Li40ODRkMDg3MzA2MWNhIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9LY29uZmlnCisrKyBiL3ZpcnQv
a3ZtL0tjb25maWcKQEAgLTYyLDkgKzYyLDYgQEAgY29uZmlnIEhBVkVfS1ZNX0NQVV9SRUxBWF9J
TlRFUkNFUFQKIGNvbmZpZyBLVk1fVkZJTwogICAgICAgIGJvb2wKIAotY29uZmlnIEhBVkVfS1ZN
X0FSQ0hfVExCX0ZMVVNIX0FMTAotICAgICAgIGJvb2wKLQogY29uZmlnIEhBVkVfS1ZNX0lOVkFM
SURfV0FLRVVQUwogICAgICAgIGJvb2wKIApkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4u
YyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5kZXggNzBlNTQ3OTc5N2FjMy4uZDZiMDUwNzg2MTU1
MCAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3ZtX21haW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFp
bi5jCkBAIC0zNDUsNyArMzQ1LDYgQEAgYm9vbCBrdm1fbWFrZV9hbGxfY3B1c19yZXF1ZXN0KHN0
cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgaW50IHJlcSkKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGt2
bV9tYWtlX2FsbF9jcHVzX3JlcXVlc3QpOwogCi0jaWZuZGVmIENPTkZJR19IQVZFX0tWTV9BUkNI
X1RMQl9GTFVTSF9BTEwKIHZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2
bSkKIHsKIAkrK2t2bS0+c3RhdC5nZW5lcmljLnJlbW90ZV90bGJfZmx1c2hfcmVxdWVzdHM7CkBA
IC0zNjYsNyArMzY1LDYgQEAgdm9pZCBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAq
a3ZtKQogCQkrK2t2bS0+c3RhdC5nZW5lcmljLnJlbW90ZV90bGJfZmx1c2g7CiB9CiBFWFBPUlRf
U1lNQk9MX0dQTChrdm1fZmx1c2hfcmVtb3RlX3RsYnMpOwotI2VuZGlmCiAKIHN0YXRpYyB2b2lk
IGt2bV9mbHVzaF9zaGFkb3dfYWxsKHN0cnVjdCBrdm0gKmt2bSkKIHsKLS0gCjIuNDEuMC42NDAu
Z2E5NWRlZjU1ZDAtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
