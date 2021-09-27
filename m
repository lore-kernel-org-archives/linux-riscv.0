Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7077C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 00:54:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD286103B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 00:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CD286103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TTHARFLQsL0i8OJFpugRwuAqsverwbx8QaEz781NyUU=; b=tUBIiWxYYXAU2y
	g4BUH7tsSxD2opfl5Wh4/nauR2dbA2WdDJerrnqSgaQE3I8G+H86vJPttOG2yHAxOaWcN070iOH+/
	X566AlWqj2+uubqjQxL4vO4PRl8+sQAlg/k01OyuAMk5DjucVRW9XlaVSwm/Vpx/mLtPVUKktxmi9
	SzRKxKbyQU6a8gcnzRr4JBcpkxqNMO5WACeIDTNfgj6aqJANABgmmAvmHR66nmLyp1jEsEQLOPTku
	LeLUmC/b2rAe4hw2nf0/6LwZs+3uleWONFyGf4jzP2XrzT2dOlBmNWgNcseBJ+uLdYwPDcOGhgHje
	DOQ/Pvd6FrgJz3MZQpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUetq-001JP9-Ca; Mon, 27 Sep 2021 00:53:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUetn-001JNX-Dh
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 00:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632704016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2/VmYY08V9u3YFjqBs+eNyl3HzGVSi8fmveCf89uSWM=;
 b=Ab0+4ODesqRFfd4tdzFcFa/FZxDuAd/sZYDutaQQtkUKjKESeEsOLySgGOLnEBodhMojks
 vfLfHV8oCcQYig+17u5qwbKKYYxR3P0DXqGEN7vcz9SQV2sT9g37pIE2+4JZDE3ZerCUtV
 bGKoMkBg5uXptREshXnK8oG9Zn/RTf4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-jnEVMnIPPNS9bSAcAHtTrg-1; Sun, 26 Sep 2021 20:51:38 -0400
X-MC-Unique: jnEVMnIPPNS9bSAcAHtTrg-1
Received: by mail-qk1-f198.google.com with SMTP id
 s18-20020a05620a255200b00433885d4fa7so65775830qko.4
 for <linux-riscv@lists.infradead.org>; Sun, 26 Sep 2021 17:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2/VmYY08V9u3YFjqBs+eNyl3HzGVSi8fmveCf89uSWM=;
 b=VCBrCmyOf06VwWipQac+ldcocnT12hNMDZjB3vaSa3KeCLG41Zab2mq0aeV7a/zPNO
 zN6ch8rxMcQviIs+q7AqHiDpx1CyoaaMAf4jNmLJBriEBqUz0/Uzc/OmC58UKWrFUxhW
 gAyAUkWRUfEDYY/47n2oxiFWTXEbl6RpS818IzuJh76zKQljAMWTHm4RzEo/f9bag0LE
 znYxMQhAxJUeTWLBfY1qYC09yKpm8DV/CLC0x/O5B2261r4grhcTF7dDuS3Pnl8ovRRF
 T6XT+Tt8GORbU2mowwILq+Ucpsctj8WJrkKEkVagZ6M9bTTkonSErtUHTcn/nnnme46V
 SrnQ==
X-Gm-Message-State: AOAM530B9faN36RUzbwFz/aD6pr6gZyCSVMBJ2k4iyKw2SgQhy8+VEPN
 K5WEa5l5afCZPe4WEc/M1XTf0uYRELmCMi73a/ncooB/ANwhTPHnrW5HU3tknFTL2dIvNx9mSXM
 knXJeSQ/WBCn47tsOWM59hfSmt8Gk
X-Received: by 2002:ac8:429a:: with SMTP id o26mr9174853qtl.317.1632703898073; 
 Sun, 26 Sep 2021 17:51:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUcbTh8QhEC6Qzf+SlzmapnnglMqi+jffl07PUgFhO6gl3Aj1jZZ/AmIWRdIB9Qrm4b0WXSQ==
X-Received: by 2002:ac8:429a:: with SMTP id o26mr9174838qtl.317.1632703897875; 
 Sun, 26 Sep 2021 17:51:37 -0700 (PDT)
Received: from haro.redhat.com ([75.183.81.126])
 by smtp.gmail.com with ESMTPSA id o21sm9862600qtt.12.2021.09.26.17.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 17:51:37 -0700 (PDT)
From: William Cohen <wcohen@redhat.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 namhyung@kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
Cc: William Cohen <wcohen@redhat.com>
Subject: [PATCH] perf annotate: Add riscv64 support
Date: Sun, 26 Sep 2021 20:51:15 -0400
Message-Id: <20210927005115.610264-1-wcohen@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wcohen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_175339_696346_36E86087 
X-CRM114-Status: GOOD (  15.70  )
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

VGhpcyBwYXRjaCBhZGRzIGJhc2ljIGFyY2ggaW5pdGlhbGl6YXRpb24gYW5kIGluc3RydWN0aW9u
IGFzc29jaWF0ZQpzdXBwb3J0IGZvciB0aGUgcmlzY3Y2NCBDUFUgYXJjaGl0ZWN0dXJlLgoKRXhh
bXBsZSBvdXRwdXQ6CgogICQgcGVyZiBhbm5vdGF0ZSAtLXN0ZGlvMgogIFNhbXBsZXM6IDEyMksg
b2YgZXZlbnQgJ3Rhc2stY2xvY2s6dScsIDQwMDAgSHosIEV2ZW50IGNvdW50IChhcHByb3guKTog
MzA2MzcyNTAwMDAsIFtwZXJjZW50OiBsb2NhbCBwZXJpb2RdCiAgc3RyY21wKCkgL3Vzci9saWI2
NC9saWJjLTIuMzIuc28KICBQZXJjZW50CgoJICAgICAgRGlzYXNzZW1ibHkgb2Ygc2VjdGlvbiAu
dGV4dDoKCgkgICAgICAwMDAwMDAwMDAwMDY5YTMwIDxzdHJjbXA+OgoJICAgICAgX19HSV9zdHJj
bXAoKToKCSAgICAgIGNvbnN0IHVuc2lnbmVkIGNoYXIgKnMyID0gKGNvbnN0IHVuc2lnbmVkIGNo
YXIgKikgcDI7CgkgICAgICB1bnNpZ25lZCBjaGFyIGMxLCBjMjsKCgkgICAgICBkbwoJICAgICAg
ewoJICAgICAgYzEgPSAodW5zaWduZWQgY2hhcikgKnMxKys7CiAgIDM3LjMwICAgICAgICBsYnUg
IGE1LDAoYTApCgkgICAgICBjMiA9ICh1bnNpZ25lZCBjaGFyKSAqczIrKzsKICAgIDEuMjMgICAg
ICAgIGFkZGkgYTEsYTEsMQoJICAgICAgYzEgPSAodW5zaWduZWQgY2hhcikgKnMxKys7CiAgIDE4
LjY4ICAgICAgICBhZGRpIGEwLGEwLDEKCSAgICAgIGMyID0gKHVuc2lnbmVkIGNoYXIpICpzMisr
OwogICAgMS4zNyAgICAgICAgbGJ1ICBhNCwtMShhMSkKCSAgICAgIGlmIChjMSA9PSAnXDAnKQog
ICAxOC43MSAgICAgIOKGkyBiZXF6IGE1LDE4CgkgICAgICAgcmV0dXJuIGMxIC0gYzI7CgkgICAg
ICAgfQoKU2lnbmVkLW9mZi1ieTogV2lsbGlhbSBDb2hlbiA8d2NvaGVuQHJlZGhhdC5jb20+Ci0t
LQogLi4uL3BlcmYvYXJjaC9yaXNjdjY0L2Fubm90YXRlL2luc3RydWN0aW9ucy5jIHwgMzQgKysr
KysrKysrKysrKysrKysrKwogdG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLmMgICAgICAgICAgICAg
ICAgICAgIHwgIDUgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcmlzY3Y2NC9hbm5vdGF0ZS9pbnN0cnVjdGlv
bnMuYwoKZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdjY0L2Fubm90YXRlL2luc3Ry
dWN0aW9ucy5jIGIvdG9vbHMvcGVyZi9hcmNoL3Jpc2N2NjQvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25z
LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi44NjlhMGViMjg5NTMK
LS0tIC9kZXYvbnVsbAorKysgYi90b29scy9wZXJmL2FyY2gvcmlzY3Y2NC9hbm5vdGF0ZS9pbnN0
cnVjdGlvbnMuYwpAQCAtMCwwICsxLDM0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAorCitzdGF0aWMKK3N0cnVjdCBpbnNfb3BzICpyaXNjdjY0X19hc3NvY2lhdGVfaW5z
X29wcyhzdHJ1Y3QgYXJjaCAqYXJjaCwgY29uc3QgY2hhciAqbmFtZSkKK3sKKwlzdHJ1Y3QgaW5z
X29wcyAqb3BzID0gTlVMTDsKKworCWlmICghc3RybmNtcChuYW1lLCAiamFsIiwgMykgfHwKKwkg
ICAgIXN0cm5jbXAobmFtZSwgImpyIiwgMikgfHwKKwkgICAgIXN0cm5jbXAobmFtZSwgImNhbGwi
LCA0KSkKKwkJb3BzID0gJmNhbGxfb3BzOworCWVsc2UgaWYgKCFzdHJuY21wKG5hbWUsICJyZXQi
LCAzKSkKKwkJb3BzID0gJnJldF9vcHM7CisJZWxzZSBpZiAobmFtZVswXSA9PSAnaicgfHwgbmFt
ZVswXSA9PSAnYicpCisJCW9wcyA9ICZqdW1wX29wczsKKwllbHNlCisJCXJldHVybiBOVUxMOwor
CisJYXJjaF9fYXNzb2NpYXRlX2luc19vcHMoYXJjaCwgbmFtZSwgb3BzKTsKKworCXJldHVybiBv
cHM7Cit9CisKK3N0YXRpYworaW50IHJpc2N2NjRfX2Fubm90YXRlX2luaXQoc3RydWN0IGFyY2gg
KmFyY2gsIGNoYXIgKmNwdWlkIF9fbWF5YmVfdW51c2VkKQoreworCWlmICghYXJjaC0+aW5pdGlh
bGl6ZWQpIHsKKwkJYXJjaC0+YXNzb2NpYXRlX2luc3RydWN0aW9uX29wcyA9IHJpc2N2NjRfX2Fz
c29jaWF0ZV9pbnNfb3BzOworCQlhcmNoLT5pbml0aWFsaXplZCA9IHRydWU7CisJCWFyY2gtPm9i
amR1bXAuY29tbWVudF9jaGFyID0gJyMnOworCX0KKworCXJldHVybiAwOworfQpkaWZmIC0tZ2l0
IGEvdG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLmMgYi90b29scy9wZXJmL3V0aWwvYW5ub3RhdGUu
YwppbmRleCAwYmFlMDYxYjJkNmQuLmQ5MTlmYTk5Mzg3MiAxMDA2NDQKLS0tIGEvdG9vbHMvcGVy
Zi91dGlsL2Fubm90YXRlLmMKKysrIGIvdG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLmMKQEAgLTE1
MSw2ICsxNTEsNyBAQCBzdGF0aWMgaW50IGFyY2hfX2Fzc29jaWF0ZV9pbnNfb3BzKHN0cnVjdCBh
cmNoKiBhcmNoLCBjb25zdCBjaGFyICpuYW1lLCBzdHJ1Y3QgaQogI2luY2x1ZGUgImFyY2gvbWlw
cy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyIKICNpbmNsdWRlICJhcmNoL3g4Ni9hbm5vdGF0ZS9p
bnN0cnVjdGlvbnMuYyIKICNpbmNsdWRlICJhcmNoL3Bvd2VycGMvYW5ub3RhdGUvaW5zdHJ1Y3Rp
b25zLmMiCisjaW5jbHVkZSAiYXJjaC9yaXNjdjY0L2Fubm90YXRlL2luc3RydWN0aW9ucy5jIgog
I2luY2x1ZGUgImFyY2gvczM5MC9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyIKICNpbmNsdWRlICJh
cmNoL3NwYXJjL2Fubm90YXRlL2luc3RydWN0aW9ucy5jIgogCkBAIC0xOTIsNiArMTkzLDEwIEBA
IHN0YXRpYyBzdHJ1Y3QgYXJjaCBhcmNoaXRlY3R1cmVzW10gPSB7CiAJCS5uYW1lID0gInBvd2Vy
cGMiLAogCQkuaW5pdCA9IHBvd2VycGNfX2Fubm90YXRlX2luaXQsCiAJfSwKKwl7CisJCS5uYW1l
ID0gInJpc2N2NjQiLAorCQkuaW5pdCA9IHJpc2N2NjRfX2Fubm90YXRlX2luaXQsCisJfSwKIAl7
CiAJCS5uYW1lID0gInMzOTAiLAogCQkuaW5pdCA9IHMzOTBfX2Fubm90YXRlX2luaXQsCi0tIAoy
LjI3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
