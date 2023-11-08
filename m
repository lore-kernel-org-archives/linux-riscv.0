Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E246C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 23:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ePmrfXxGS5bbu45tUj9CPXSWuLR9ecsJwxKyrCyMFNE=; b=ufjbmPFB8GDGOST/ayu/M/mbSi
	iZqg8V2StqusG1zvqDZtWKXlH4hHhOx75OnDjxlIzUTeOHONgKltXn+hJAiIs9TbMb6fqGl8MM+vY
	dO1l8lKckCRuBeO43OIKufWd+xoRnrbxDjv1CFFqGLHCDzfLMw6SndrSYnxhMlYqp4ZUtEhsr7eFJ
	nwpYY2rHFafaUQq0yK1nbmlHdwFaDcSU3T+6eMYCDW4jqekM6PdML/nik5k088H4jI8HTTUmDjH9g
	48UdSAe9qSC9yE8Nx+NrY9eykm6DJ8pctdY0G7OaN/dOwtipFP5KUSNQfIm0z3FLd1D07+/hUlVSd
	eCpzZKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0s70-004wSP-2r;
	Wed, 08 Nov 2023 23:37:30 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0s6x-004wQW-1g
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 23:37:28 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da04776a869so337943276.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 15:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699486645; x=1700091445; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIcgmcP1EY6htEGo1pN6EVJRVE+qt/I8BKL1s/KEy5I=;
        b=SSp1B4g9AdyzcufdLZJpOWUUYGpmPF3LMVGOVGG7p1xns+dwl632N+R4Hh/ouNCZT+
         nzlxiySLZCtvDv/lEEeBNu8G/lUZWCEHP9wbwnZieJ8iOH/ys03aBsSU/TTrigy/Dg0Z
         MbHCwebl1ikkvwkggUAYfhx8oyAGr8lqqRuATcqPu3DNn6+hvNmxanIgkSQ3Ik2ZemCr
         iNoFeIZ3EMGnMCpgX3yKHKfZ6Xw7f39T7irsGZEIJv0YWclshzNYXXBEJVpXA2cjFKn6
         APrL/0GN+aMTVT5jHkOliJ5kbA/oVo03Sh4mbpNHgH5h/y5lekL+8KWCLM213q3wD8QO
         T0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699486645; x=1700091445;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oIcgmcP1EY6htEGo1pN6EVJRVE+qt/I8BKL1s/KEy5I=;
        b=MtlRim53rjOnoz2j2bS9QnFkhuajqBAKqok+pF7/5xUx0TFz+X9VqJdQadEioWNuiL
         o+1VZ2PAzvNBckPmcrbl919uB0y0Ibqq8lEaxMpF5olq8oojw2p4iHp/hL2u68B5BbVi
         nQp8pdFWfG8msuUzbPOtEgtaRy9VU1yR+tMvziDVyJk8/iFptNktpbR1BoLhIjcWxOJz
         w8ocCU3DickwdYyQiC4wp3Lc6SFptjf46xatL8co0F9V/0m1NAiRbPC5IFVfnMNiuri/
         XhBSBmz0n6Zfc+ppdjX6AbQFAURzLRvIKUYZvHsKdptDrLJwuWcuLoLdIHbETo/xaknz
         jr8w==
X-Gm-Message-State: AOJu0Yz3mySlyH4/s4yxnFeuuIw8vtrnmJWDftWPh6Lnyq/6d0fXk/u/
	//GFk+QJSmLRSYs3f7ycwBsQTnStQcclxg==
X-Google-Smtp-Source: AGHT+IEQyf2yih5ALlCfgSEkVLSLt0Zq5IBGBmP/Cna+y8K3zSa/6bcCrG6olPCsXpdGmctjh3MSlNk2LvNOvw==
X-Received: from laogai.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2c9])
 (user=amoorthy job=sendgmr) by 2002:a05:6902:102:b0:da3:723b:b2a4 with SMTP
 id o2-20020a056902010200b00da3723bb2a4mr72222ybh.7.1699486645232; Wed, 08 Nov
 2023 15:37:25 -0800 (PST)
Date: Wed,  8 Nov 2023 23:37:19 +0000
In-Reply-To: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
Mime-Version: 1.0
References: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231108233723.3380042-1-amoorthy@google.com>
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
From: Anish Moorthy <amoorthy@google.com>
To: amoorthy@google.com
Cc: ackerleytng@google.com, akpm@linux-foundation.org, anup@brainfault.org, 
	aou@eecs.berkeley.edu, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	chenhuacai@kernel.org, david@redhat.com, dmatlack@google.com, 
	isaku.yamahata@gmail.com, isaku.yamahata@intel.com, jarkko@kernel.org, 
	kirill.shutemov@linux.intel.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, liam.merwick@oracle.com, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	mail@maciej.szmigiero.name, maz@kernel.org, mic@digikod.net, 
	michael.roth@amd.com, mpe@ellerman.id.au, oliver.upton@linux.dev, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, pbonzini@redhat.com, 
	qperret@google.com, seanjc@google.com, tabba@google.com, 
	vannapurve@google.com, vbabka@suse.cz, viro@zeniv.linux.org.uk, 
	wei.w.wang@intel.com, willy@infradead.org, xiaoyao.li@intel.com, 
	yilun.xu@intel.com, yu.c.zhang@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_153727_555975_DC953E75 
X-CRM114-Status: UNSURE (   8.09  )
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

T24gV2VkLCBOb3YgOCwgMjAyMyBhdCA5OjAw4oCvQU0gQW5pc2ggTW9vcnRoeSA8YW1vb3J0aHlA
Z29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGNvbW1pdCBicmVha3MgdGhlIGFybTY0IHNlbGZ0
ZXN0cyBidWlsZCBidHc6IGxvb2tzIGxpa2UgYSBzaW1wbGUgb3ZlcnNpZ2h0PwoKWXVwLCBmaXgg
aXMgYSBvbmUtbGluZXIuIFBvc3RlZCBiZWxvdy4KCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0vYWFyY2g2NC9wYWdlX2ZhdWx0X3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9hYXJjaDY0L3BhZ2VfZmF1bHRfdGVzdC5jCmluZGV4IGViNDIxN2I3Yzc2
OC4uMDhhNWNhNWJlZDU2IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
YWFyY2g2NC9wYWdlX2ZhdWx0X3Rlc3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vYWFyY2g2NC9wYWdlX2ZhdWx0X3Rlc3QuYwpAQCAtNzA1LDcgKzcwNSw3IEBAIHN0YXRpYyB2
b2lkIHJ1bl90ZXN0KGVudW0gdm1fZ3Vlc3RfbW9kZSBtb2RlLCB2b2lkICphcmcpCiAKIAlwcmlu
dF90ZXN0X2Jhbm5lcihtb2RlLCBwKTsKIAotCXZtID0gX19fX3ZtX2NyZWF0ZShtb2RlKTsKKwl2
bSA9IF9fX192bV9jcmVhdGUoVk1fU0hBUEUobW9kZSkpOwogCXNldHVwX21lbXNsb3RzKHZtLCBw
KTsKIAlrdm1fdm1fZWxmX2xvYWQodm0sIHByb2dyYW1faW52b2NhdGlvbl9uYW1lKTsKIAlzZXR1
cF91Y2FsbCh2bSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
