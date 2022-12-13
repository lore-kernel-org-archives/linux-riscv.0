Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06766C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MsEfxSJnG2Eb2BMfuk30+yGABJWmdKNTQBXeA54JBQ=; b=1rm0xA0pVOnw84
	uVfKLnK4fJ6Gl78ZYJKkzoyw/25h0LhDK26PMRNzE4qgkWuliZkkesPe6anc2qR4igTRlT4gq/UAn
	9rhbdOIoPnBxzx5OWstDx3uM3tChszVEOulfyJIpL/pMXOqzP8b0Guc8xU3B2b5fUEdRm2NcssGPt
	P+L7V0iwOAEayszn2/aPES5RO4sJDx/L6Hri5jJUHF33TwZo89/6OEKxzdqaj1mfdLNY2vTfr4hNF
	9KmDV5WnzD6xli2CkUQRA07zPjr7wmDNIEQRjyax9XkWWryZFmY+MtxXpb6hD3I2hb0Te7NAgRh9J
	IM7QAN4NgoJgYQoRXHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u9J-008wjy-7V; Tue, 13 Dec 2022 01:32:01 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sys-00896M-0s
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:11 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3b102317668so152372297b3.23
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dh9OV8WXLZqVkS0eTF+TxxkJJsKrkd0m2OX0yvUCB3o=;
        b=sw5AF+UJzrAam2lKYUO+DY3lJy12wG52jO14k7mzCjLcxxLIwp1wBpj6wVqYtqBXVF
         59vS4E7gW4naKYM6Hk7aGKYpNTStZA8AyeHKiS1Zp63lxywrCOInD4USN6MkBgBw4NoX
         eN2lxEjW9PEtkdVREzFNueicrHCc0exuvCAPIMk3YVVS7eklH+VcuXQPTh0ZS9Sd5LX8
         cGWE/0zqnV0g/j784hDl74HTeHWiysY9ZLAx8E3jTWdl+pYwXeHcFR4+9h/Mt74o1u5K
         B3cgL2TWXr+P5NwxWcePS55Ar3q2GV+q43pv8aj7jsOs55kDdd5RUw2jebRRAKHKGp8g
         1SMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dh9OV8WXLZqVkS0eTF+TxxkJJsKrkd0m2OX0yvUCB3o=;
        b=Od8VRJp1nxVirhSLUFCAf2QSNkGklUtlwJwTISScxD3yXVLVaa3pcs994ZdZP2cAyB
         Sh1J+uokrkIFpPk1DPC1lpQowI0ngHpnLtyMPkK5uVsOgOBxG4BNix0OKYWm29/jhEy1
         EB0mqZ5pI5WrDcjD3kXg8Lj8BRvJDwdHvgtM1lZahsL0XofAjXfF/RhXrAlpe3oITwe7
         XmErvgunAjZzDRSYaOZhkqRyBJb1TEk95fZd7FC5tyncSeV3eoROiU2H8PblA0HTBpaX
         UasBT7aHC32Q68V0N5P55igkVwKX+NCGBDqm1qdnT+hg5rnz46ILPCWPoo7dW3OFbSdq
         RTgg==
X-Gm-Message-State: ANoB5pl9NaiWprmiKf6UEv4hAzDdaKoNgkZaQEAJrw9sby8fYqanViMK
	AdYvbAMAldtVQy41jHWKGmolubHnEiE=
X-Google-Smtp-Source: AA0mqf6PAlQug9BZraIHZdHpqKIVbXCcKOa0uk6qj29geZVqkrX39aClmamGhM5+3qzba2DS0aZNeAJ6gmU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:ca0f:0:b0:38f:fa8e:99da with SMTP id
 m15-20020a0dca0f000000b0038ffa8e99damr12937224ywd.355.1670890628580; Mon, 12
 Dec 2022 16:17:08 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:46 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-8-seanjc@google.com>
Subject: [PATCH 07/14] KVM: selftests: Use proper function prototypes in
 probing code
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Sean Christopherson <seanjc@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_161710_084225_90CDF935 
X-CRM114-Status: UNSURE (   8.07  )
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

TWFrZSB0aGUgbWFpbigpIGZ1bmN0aW9ucyBpbiB0aGUgcHJvYmluZyBjb2RlIHByb3BlciBwcm90
b3R5cGVzIHNvIHRoYXQKY29tcGlsaW5nIHRoZSBwcm9iaW5nIGNvZGUgd2l0aCBtb3JlIHN0cmlj
dCBmbGFncyB3b24ndCBnZW5lcmF0ZSBmYWxzZQpuZWdhdGl2ZXMuCgogIDxzdGRpbj46MTo1OiBl
cnJvcjogZnVuY3Rpb24gZGVjbGFyYXRpb24gaXNu4oCZdCBhIHByb3RvdHlwZSBbLVdlcnJvcj1z
dHJpY3QtcHJvdG90eXBlc10KClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmls
ZSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUKaW5kZXggZDc2MWE3N2MzYTgwLi5j
MjJjMzAwMjQ5MmQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtl
ZmlsZQorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUKQEAgLTE5Niwx
MSArMTk2LDExIEBAIENGTEFHUyArPSAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVzIC1XdW5pbml0
aWFsaXplZCAtTzIgLWcgLXN0ZD1nbnU5OSBcCiAJLUkkKDxEKSAtSWluY2x1ZGUvJChBUkNIX0RJ
UikgLUkgLi4vcnNlcSAtSS4uICQoRVhUUkFfQ0ZMQUdTKSBcCiAJJChLSERSX0lOQ0xVREVTKQog
Ci1uby1waWUtb3B0aW9uIDo9ICQoY2FsbCB0cnktcnVuLCBlY2hvICdpbnQgbWFpbigpIHsgcmV0
dXJuIDA7IH0nIHwgXAorbm8tcGllLW9wdGlvbiA6PSAkKGNhbGwgdHJ5LXJ1biwgZWNobyAnaW50
IG1haW4odm9pZCkgeyByZXR1cm4gMDsgfScgfCBcCiAgICAgICAgICQoQ0MpIC1XZXJyb3IgLW5v
LXBpZSAteCBjIC0gLW8gIiQkVE1QIiwgLW5vLXBpZSkKIAogIyBPbiBzMzkwLCBidWlsZCB0aGUg
dGVzdGNhc2VzIEtWTS1lbmFibGVkCi1wZ3N0ZS1vcHRpb24gPSAkKGNhbGwgdHJ5LXJ1biwgZWNo
byAnaW50IG1haW4oKSB7IHJldHVybiAwOyB9JyB8IFwKK3Bnc3RlLW9wdGlvbiA9ICQoY2FsbCB0
cnktcnVuLCBlY2hvICdpbnQgbWFpbih2b2lkKSB7IHJldHVybiAwOyB9JyB8IFwKIAkkKENDKSAt
V2Vycm9yIC1XbCQoY29tbWEpLS1zMzkwLXBnc3RlIC14IGMgLSAtbyAiJCRUTVAiLC1XbCQoY29t
bWEpLS1zMzkwLXBnc3RlKQogCiBMRExJQlMgKz0gLWxkbAotLSAKMi4zOS4wLnJjMS4yNTYuZzU0
ZmQ4MzUwYmQtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
