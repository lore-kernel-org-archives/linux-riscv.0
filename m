Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD212C47088
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GGWLCTsCi1T3+EsQ3hRvdwcPJ8nUqPWKo97p3Vy9Yc=; b=xwPwtRAL7wKCEY
	KZPUmqkekLwWxnBlczXrsEYiCLNFbB4X+K/QpDXOWPWPnQ6WzU2D2mgWe+slEf+ZpHiwG3ww+QtjZ
	p3n4NmXjZ6O1dluFgmC5ckda7kbqfzH7o5bw9ZgLBdMXmRvXGrqAHaXKWIcUcdhUVZ30M1o8FyO9r
	g0k5CmTWdr+OWjmn8w0ZrHbpR9JlRgZa0Wrg/1L0rMBv9omgzbHCFrmvXO6I/HWWSVesBAsnabTUC
	W1bum7nJvW2FMZHJEvjcN9P6RY9mBfaukp/TwyVMrl4/2YZ0at+GwESM2s5lli0lvihB+o/8KHd56
	xKgtalPUb4IuhDnnEqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WGN-0037qE-5u; Wed, 30 Nov 2022 23:13:11 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDd-0036RQ-LL
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:24 +0000
Received: by mail-pg1-x54a.google.com with SMTP id g193-20020a636bca000000b00476a2298bd1so79223pgc.12
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yXQhNujyCn0BKG7v31c4OGaNv+fuibQffzvzfRXOMY=;
        b=h6rsUUCphQInF8YIuJSydp7y3K+kWTxAbyRCfeyJQKJ+Y6qbtiTSAEs1qGlDllqT/J
         MMyCWI1z6QQ9M7p7Zu6QpSl/9m1uIwFhUqPqC0VY2dNxBAtSmKEBK4CCdgkZqO6Ul8Kx
         fACOhEYDJb6v1xuMAezabk8g2ZSsJuhT+lDS/T3ozQuYyR/lRYpg7LUF046Tas5T+NY5
         CeL2ERbYxquxucrniWQA910RogetkvuImYcNKj0ET57pNLum/MqlKCc6KP+V5OUAEk8P
         PnX37vQ/dZrpTC3Oabzm833Uf9cuKd5yhE1OeJVb9W6pQwUrjh0B5ijm+gc3WgDVn+HL
         6XjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5yXQhNujyCn0BKG7v31c4OGaNv+fuibQffzvzfRXOMY=;
        b=CItJlNfv3AsQQkXTREU/q2cRrzTGHWjd/dJ2aIyiazrMhAVOHjMUmYt6DeH5yCKvHt
         o9xr1BRSaaYAE7PSAfFGr0EVj9+23C7tM2dO6Seq9zaJ78C3rqq4kDvwT4DQNFH4ehfR
         N/dblUT7WN1XzNH/uwzizTdtaJcrJEUi8RevQbREd4enrp3VDcunzIxMFVZzHGac7otl
         IhNROPOUV9fQWSYcfFxvWoLX3BdJW4I8lpKH2H76RvijYl2utoh6/KBD3A9avllkfALh
         H2jDZO9vm1Famz+pjGvZXjNu35SiGzOzfWzGTf5XMp6GCwOudimWlfznJzLSC3SnxWky
         xrsw==
X-Gm-Message-State: ANoB5pmW4XqZhW5eMm4ifslyIrtBahlkpFiqEG1QPPv/0WMJyM88f5E9
	n4SDAcUKyONGF9VBSnH/hseGbau/YfE=
X-Google-Smtp-Source: AA0mqf4uayK8uJVSnmaHjmcUzYqE9zwUJpBZYJxTpzlvsNbotM7JFJFGgIIUFhNbqetWZOK5ykPGKeuQP1w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ec8a:b0:188:640f:f400 with SMTP id
 x10-20020a170902ec8a00b00188640ff400mr45576276plg.143.1669849818577; Wed, 30
 Nov 2022 15:10:18 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:08 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-25-seanjc@google.com>
Subject: [PATCH v2 24/50] KVM: RISC-V: Do arch init directly in riscv_kvm_init()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, 
	Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_151021_747051_5C3C6E4D 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Rm9sZCB0aGUgZ3V0cyBvZiBrdm1fYXJjaF9pbml0KCkgaW50byByaXNjdl9rdm1faW5pdCgpIGlu
c3RlYWQgb2YKYm91bmNpbmcgdGhyb3VnaCBrdm1faW5pdCgpPT5rdm1fYXJjaF9pbml0KCkuICBG
dW5jdGlvbmFsbHksIHRoaXMgaXMgYQpnbG9yaWZpZWQgbm9wIGFzIGludm9raW5nIGt2bV9hcmNo
X2luaXQoKSBpcyB0aGUgdmVyeSBmaXJzdCBhY3Rpb24KcGVyZm9ybWVkIGJ5IGt2bV9pbml0KCku
CgpNb3Zpbmcgc2V0dXAgdG8gcmlzY3Zfa3ZtX2luaXQoKSwgd2hpY2ggaXMgdGFnZ2VkIF9faW5p
dCwgd2lsbCBhbGxvdwp0YWdnaW5nIG1vcmUgZnVuY3Rpb25zIGFuZCBkYXRhIHdpdGggX19pbml0
IGFuZCBfX3JvX2FmdGVyX2luaXQuICBBbmQKZW1wdHlpbmcga3ZtX2FyY2hfaW5pdCgpIHdpbGwg
YWxsb3cgZHJvcHBpbmcgdGhlIGhvb2sgZW50aXJlbHkgb25jZSBhbGwKYXJjaGl0ZWN0dXJlIGlt
cGxlbWVudGF0aW9ucyBhcmUgbm9wcy4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoK
U2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+ClJl
dmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CkFj
a2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgotLS0KIGFyY2gvcmlzY3Yv
a3ZtL21haW4uYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9t
YWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKaW5kZXggYTE0NmZhMGNlNGQyLi5jYjA2M2I4
YTlhMGYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL21haW4uYworKysgYi9hcmNoL3Jpc2N2
L2t2bS9tYWluLmMKQEAgLTY2LDYgKzY2LDE1IEBAIHZvaWQga3ZtX2FyY2hfaGFyZHdhcmVfZGlz
YWJsZSh2b2lkKQogfQogCiBpbnQga3ZtX2FyY2hfaW5pdCh2b2lkICpvcGFxdWUpCit7CisJcmV0
dXJuIDA7Cit9CisKK3ZvaWQga3ZtX2FyY2hfZXhpdCh2b2lkKQoreworfQorCitzdGF0aWMgaW50
IF9faW5pdCByaXNjdl9rdm1faW5pdCh2b2lkKQogewogCWNvbnN0IGNoYXIgKnN0cjsKIApAQCAt
MTEwLDE1ICsxMTksNiBAQCBpbnQga3ZtX2FyY2hfaW5pdCh2b2lkICpvcGFxdWUpCiAKIAlrdm1f
aW5mbygiVk1JRCAlbGQgYml0cyBhdmFpbGFibGVcbiIsIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9i
aXRzKCkpOwogCi0JcmV0dXJuIDA7Ci19Ci0KLXZvaWQga3ZtX2FyY2hfZXhpdCh2b2lkKQotewot
fQotCi1zdGF0aWMgaW50IF9faW5pdCByaXNjdl9rdm1faW5pdCh2b2lkKQotewogCXJldHVybiBr
dm1faW5pdChOVUxMLCBzaXplb2Yoc3RydWN0IGt2bV92Y3B1KSwgMCwgVEhJU19NT0RVTEUpOwog
fQogbW9kdWxlX2luaXQocmlzY3Zfa3ZtX2luaXQpOwotLSAKMi4zOC4xLjU4NC5nMGYzYzU1ZDRj
Mi1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
