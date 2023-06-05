Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB43EC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUfXeFaEkYjb/tjY5b0nIQdcvuuqnM8JVKwRq+AiU/0=; b=I4B6Zq5t/enoBJ
	rAll/Sdo8HerXWwngaQem+gKgY6CpOib7qCTLFLY4ceF4FgnM5TBXK7FuzqBW0m4opgovZZLD1ztt
	X6biw1TR3ckBhFz6JHwOTCG5Ru5ir2l32NHGdVIOwehdOgu8DW2IhjHPG7bkELv2weU5eQit8VZpF
	Hu0KFdiR2dXC8QkQjKlxC8P5TIo0HOXKYQzh6RxFP62IAUw3TFaN7zyvKmFPk/6gwIK50/tUR/cVp
	cSQfXg0oenwlP4dEOWNX1ydNvrMEbXFKDFRU6CuXssP2Yd0Yz+le6s+3fhtBhOUawOPk33c3s8mL6
	IrQ52JIDkbO+gHPsam7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DG1-00GARs-2K;
	Mon, 05 Jun 2023 16:40:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DG0-00GARW-14
	for linux-riscv@bombadil.infradead.org;
	Mon, 05 Jun 2023 16:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BBfW759GkKFTzUJgKoX8uA384VuYsPAE0vmOulKke4E=; b=qhHdhbqJmT4x1NExGESdNvbcpG
	AdDsLnD75o8NsvHrTT1cazCAp/Jd4ocP40h52SeVZNAqfeqnv15q+6R/JOD2/GZ4IIjFlpbo53Eo3
	7u1/KOW/QyfDJtXTnAQ4VNzsCKPt/5YTDMBkPdn2fCeNAzucbKST55Gdh8LLJIdiUCVpWeckbyeoC
	KSmrBxcifM4uICqyG+ZHyB8YiaXsMtYFcIZLNWZ0mNy/OTbndCNX/Xxrk6Fx4pJnaWbyFzXCCgUot
	2NWuXdGEUaUhTwgopKAKAZAugcPGYsHsMu2iIdDBnHymeTScoQ5+BEwCc1ljyoBAlBPKdYV+md3MA
	PDS2hlCw==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CLK-003OJx-0f
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:42:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b00ecabdf2so45896555ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979720; x=1688571720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBfW759GkKFTzUJgKoX8uA384VuYsPAE0vmOulKke4E=;
        b=GsQQh15wVmlQHwcRg9bvdxbzEsIGOVvPRMdnOxcyy4n1fhB5ont6tYc4awzRi/gt3O
         iUjoTaMkIWsWK3dH28thritzx0yAslkk+BN2vdV4D6204M0SFaEXtwQIAPi1NkVGUlgZ
         C0YxsDT87raETp6RcOovcG213qgc6eXcPP4GnOrMXNocbyxafgrBSR/q1SMnnFWWHjx/
         nbbaTY7phpfSP2g2ij0o/oT2WEwFNAkw8pO3JDBmiWyqybqBGlk1B8dPl+fWDDXVYY6K
         H1+vfHwTaM+2A4/c/5UQZiCygzg6nJBGzkMLLYF8eci8uvftIgKmacSvOb9nuweRi/FQ
         qiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979720; x=1688571720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBfW759GkKFTzUJgKoX8uA384VuYsPAE0vmOulKke4E=;
        b=MjNPITl/YpO4DNmfQGnWki/rjMRqFI9vzwDGnn0p/Cu6lQakuU6N2Yg/U0/I3gFvmi
         XqBmNFX+xfNyxRGBGvL5COU6/gSPgpq/2m3WQzYiisc1VEZZy1OaH4I+TFIaqQNiqO8K
         H2MTxgny/6yP7ytN1SNDQBubZuBNvawEWswFzfm6PrrYjtDQilGmJVDe8YjsRkxQRF2u
         sdzD7DI1KMSeSjo6tTkwiGLQYKCoWfrveXHsUGFhncZfeQmdZGlA+SXHNzJGuJWQ176g
         bGniKb5YXCunaQhUyX9EyHsd95wxm+sJCq8lTOd6k9dKVBOG78FnGEq05mX0s2rpEWFY
         OU3w==
X-Gm-Message-State: AC+VfDyEJyLr1G/TolkulO/g8SLDitRZC7zwIkdYl7DVm/7Ac3C8gvIw
	ryCvRUwKec1iEexb+3bx1uUYI7ZmX1VkUp3qtlcCQZ3DT5P1SplPp7d7WFza3uhZmidiKbHHXkg
	x0PbRSe2Hn30/cbZ6v0e+dI9oumOZQqh9QS/a74i2pQlCKkI0FkLNZ5uhrCuMMMrPl8jQizyTmp
	PgeISYo6HDidFHyWU=
X-Google-Smtp-Source: ACHHUZ7rKTugKoVEziJV+gkC7XJI8FhQ4EESaFrT4CkW2ElkLsjNLgehEW4rqgWAicr6PBGWCEKbdQ==
X-Received: by 2002:a17:902:ecc2:b0:1b0:42d1:ecd0 with SMTP id a2-20020a170902ecc200b001b042d1ecd0mr8656899plh.66.1685979719813;
        Mon, 05 Jun 2023 08:41:59 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:41:59 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v21 22/27] riscv: Add sysctl to set the default vector rule for new processes
Date: Mon,  5 Jun 2023 11:07:19 +0000
Message-Id: <20230605110724.21391-23-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_164202_485550_A37C1CBB 
X-CRM114-Status: GOOD (  15.78  )
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

VG8gc3VwcG9ydCBWZWN0b3IgZXh0ZW5zaW9uLCB0aGUgc2VyaWVzIGV4cG9ydHMgdmFyaWFibGUt
bGVuZ3RoIHZlY3RvcgpyZWdpc3RlcnMgb24gdGhlIHNpZ25hbCBmcmFtZS4gSG93ZXZlciwgdGhp
cyBwb3RlbnRpYWxseSBicmVha3MgYWJpIGlmCnByb2Nlc3NpbmcgdmVjdG9yIHJlZ2lzdGVycyBp
cyByZXF1aXJlZCBpbiB0aGUgc2lnbmFsIGhhbmRsZXIgZm9yIG9sZApiaW5hcmllcy4gRm9yIGV4
YW1wbGUsIHRoZXJlIGlzIHN1Y2ggbmVlZCBpZiB1c2VyLWxldmVsIGNvbnRleHQgc3dpdGNoCmlz
IHRyaWdnZXJyZWQgdmlhIHNpZ25hbHNbMV0uCgpGb3IgdGhpcyByZWFzb24sIGl0IGlzIGJlc3Qg
dG8gbGVhdmUgYSBkZWNpc2lvbiB0byBkaXN0cm8gbWFpbnRhaW5lcnMsCndoZXJlIHRoZSBlbmFi
bGVtZW50IG9mIHVzZXJzcGFjZSBWZWN0b3IgZm9yIG5ldyBsYXVuY2hpbmcgcHJvZ3JhbXMgY2Fu
CmJlIGNvbnRyb2xsZWQuIERldmVsb3BlcnMgbWF5IGFsc28gbmVlZCB0aGUgc3dpdGNoIHRvIGV4
cGVyaW1lbnQgd2l0aC4KVGhlIHBhcmFtZXRlciBpcyBjb25maWd1cmFibGUgdGhyb3VnaCBzeXNj
dGwgaW50ZXJmYWNlIHNvIGEgZGlzdHJvIG1heQp0dXJuIG9mZiBWZWN0b3IgZWFybHkgYXQgaW5p
dCBzY3JpcHQgaWYgdGhlIGJyZWFrIHJlYWxseSBoYXBwZW5zIGluIHRoZQp3aWxkLgoKVGhlIHN3
aXRjaCB3aWxsIG9ubHkgdGFrZSBlZmZlY3RzIG9uIG5ldyBleGVjdmUoKSBjYWxscyBvbmNlIHNl
dC4gVGhpcwp3aWxsIG5vdCBlZmZlY3QgZXhpc3RpbmcgcHJvY2Vzc2VzIHRoYXQgZG8gbm90IGNh
bGwgZXhlY3ZlKCksIG5vcgpwcm9jZXNzZXMgd2hpY2ggaGFzIGJlZW4gc2V0IHdpdGggYSBub24t
ZGVmYXVsdCB2c3RhdGVfY3RybCBieSBtYWtpbmcKZXhwbGljaXQgUFJfUklTQ1ZfVl9TRVRfQ09O
VFJPTCBwcmN0bCgpIGNhbGxzLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzg3
Y3o0MDQ4cnAuZnNmQGFsbC55b3VyLmJhc2UuYXJlLmJlbG9uZy50by51cy8KU2lnbmVkLW9mZi1i
eTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KUmV2aWV3ZWQtYnk6IEdyZWVudGlt
ZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+ClJldmlld2VkLWJ5OiBWaW5jZW50IENoZW4g
PHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgotLS0KQ2hhbmdlbG9nIHYyMDoKIC0gVXNlIFJFQURfT05DRSB0byBh
Y2Nlc3MgcmlzY3Zfdl9pbXBsaWNpdF91YWNjIChCasO2cm4pCi0tLQogYXJjaC9yaXNjdi9rZXJu
ZWwvdmVjdG9yLmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwpp
bmRleCBhN2RlYzkyMzAxNjQuLmY5YzhlMTlhYjMwMSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdmVjdG9yLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKQEAgLTE4MCw3
ICsxODAsNyBAQCB2b2lkIHJpc2N2X3ZfdnN0YXRlX2N0cmxfaW5pdChzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnRzaykKIAogCW5leHQgPSByaXNjdl92X2N0cmxfZ2V0X25leHQodHNrKTsKIAlpZiAoIW5l
eHQpIHsKLQkJaWYgKHJpc2N2X3ZfaW1wbGljaXRfdWFjYykKKwkJaWYgKFJFQURfT05DRShyaXNj
dl92X2ltcGxpY2l0X3VhY2MpKQogCQkJY3VyID0gUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9PTjsK
IAkJZWxzZQogCQkJY3VyID0gUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9PRkY7CkBAIC0yNDMsMyAr
MjQzLDM0IEBAIGxvbmcgcmlzY3Zfdl92c3RhdGVfY3RybF9zZXRfY3VycmVudCh1bnNpZ25lZCBs
b25nIGFyZykKIAogCXJldHVybiAtRUlOVkFMOwogfQorCisjaWZkZWYgQ09ORklHX1NZU0NUTAor
CitzdGF0aWMgc3RydWN0IGN0bF90YWJsZSByaXNjdl92X2RlZmF1bHRfdnN0YXRlX3RhYmxlW10g
PSB7CisJeworCQkucHJvY25hbWUJPSAicmlzY3Zfdl9kZWZhdWx0X2FsbG93IiwKKwkJLmRhdGEJ
CT0gJnJpc2N2X3ZfaW1wbGljaXRfdWFjYywKKwkJLm1heGxlbgkJPSBzaXplb2YocmlzY3Zfdl9p
bXBsaWNpdF91YWNjKSwKKwkJLm1vZGUJCT0gMDY0NCwKKwkJLnByb2NfaGFuZGxlcgk9IHByb2Nf
ZG9ib29sLAorCX0sCisJeyB9Cit9OworCitzdGF0aWMgaW50IF9faW5pdCByaXNjdl92X3N5c2N0
bF9pbml0KHZvaWQpCit7CisJaWYgKGhhc192ZWN0b3IoKSkKKwkJaWYgKCFyZWdpc3Rlcl9zeXNj
dGwoImFiaSIsIHJpc2N2X3ZfZGVmYXVsdF92c3RhdGVfdGFibGUpKQorCQkJcmV0dXJuIC1FSU5W
QUw7CisJcmV0dXJuIDA7Cit9CisKKyNlbHNlIC8qICEgQ09ORklHX1NZU0NUTCAqLworc3RhdGlj
IGludCBfX2luaXQgcmlzY3Zfdl9zeXNjdGxfaW5pdCh2b2lkKSB7IHJldHVybiAwOyB9CisjZW5k
aWYgLyogISBDT05GSUdfU1lTQ1RMICovCisKK3N0YXRpYyBpbnQgcmlzY3Zfdl9pbml0KHZvaWQp
Cit7CisJcmV0dXJuIHJpc2N2X3Zfc3lzY3RsX2luaXQoKTsKK30KK2NvcmVfaW5pdGNhbGwocmlz
Y3Zfdl9pbml0KTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
