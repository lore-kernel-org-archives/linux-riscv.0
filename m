Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487C1C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6yZ59ceIU8lTYJWptpZ+JgN6CsEg7U62IRdelH+Bxo=; b=I34jVRr+setPpW
	1JSrShUKBeyCSaZf4t242c0pg5JZ1A0VWB1c6samdyApqybnqq8Jc+BWfIRs1fJ0Ed2ADk1YELQfi
	6ndqapmV5om83l2XpRY/0DOe/wQvMp/xpebZaSjkaioluTprEWgzBaky93x2cFwzn/Xx7x7yBLQBS
	OEqeOE64nxkV/uoBdRiMH4tO5heMCMn6LiRCF+hW9OOH9cnzAbP/olyvn7Yk1W69rMEZv/i0r5jrr
	Me0ZYmvrmpTQPEnfXhxpnOtOnntf87M8IARlXRrjC0FZMp8b3sJFdg5fLVhOhqvOFdjY298CkZdda
	Qmv+G+aRTqhkRynXBZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgg3-00DUzl-0X;
	Thu, 18 May 2023 16:40:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgg2-00DUyU-0a
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 May 2023 16:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oXLmDwuFl1hIBYmEn8BiIjw8uR8exImuk7v2QQ06HGI=; b=Hk6MoDpp1mFWlWzqsOKj0g7Gbp
	7sy188OaU+oTyoXdIZaH9Vfqt/V/NKONcw721zfovk/u6EwjU8b7TIymlK4lTMSjOH1l9uWmKZUxG
	FHBEI4gKVrWeA1U6MpbRiJ4F7quAEMtNOd6+PlY12mxKUxVZqgz1VdQg5rPo0yZjTOV7MJSj9kjwU
	y9NHdXLWOdZTpEkZHVcyidphycnqKdNHXIBoa+bpKTuHBHIGasow1eq1yIg6p8wVc3xk1zZDJcbEP
	T2GjM8jOUmz7fSFPGXKi2z3k784XKM3YQ9XswiDR/3/EWmNsZSumVIsoXp1Aivg/Lp23J0kGLNTUf
	8YkngsGA==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgOV-00ErPu-0j
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:22:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d18d772bdso1025978b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426941; x=1687018941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXLmDwuFl1hIBYmEn8BiIjw8uR8exImuk7v2QQ06HGI=;
        b=V+Us4Le6T3lwbiDvi+H91rnJIcZgu0unNFqjLvxRdYA+JPyR7Hkga5r3hCCKzkKCyI
         3dXM73umBgTF8zahR9lApj8gFkl4iEIO2EYh+9R7vUzW4je/Vc8oJgY25O8qat+ASZFg
         vuy3SjHBbYw8ltUsFBkh4jmHCEKnyR38quaPdAF+CWZugimUFtgsb8cYDo5vLB2fwrjt
         dmVwNoi3++6JmFGeDwRl3c+SE1n/w8tTdhN+Fe4AtjPfLbELEWxMrtcNlREP6s3zm7dW
         K+6Tenwl0fr+uwvvoxlZxzbUAAjG7oiMUxkeltkc4p/MTfaqtaGccbq6NZFspFEf+Gpo
         PliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426941; x=1687018941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXLmDwuFl1hIBYmEn8BiIjw8uR8exImuk7v2QQ06HGI=;
        b=QlP1xa2JRUMCUjKwT9ZIAjSV0VRMnkAS4I5IQruBM7wEKdBnnnXgZtS7aHva0Kru6o
         b4UQIC3uLROL6yW7qq1xFmIQ7nYufgOCnruljQs29leTqC593/4mJJQbdJJ+1gsQyz5I
         A2IA7Q9NWYSoZcQNi3ns1fA0dFnlIN7H6aYyv0K6q+gygW13lsK9RXkkHET58Ze/S577
         VsyiKMubXyPVc9fnssbgVlZfzD8F6sI/197Ik17nug9mq/vlfTHSiZ1FYTYxDauYkyhV
         Mur1B0ST4BXqGHXTV/o0RNUz5Y/6jqIJZtFl6T/DROTJHFF3BAp9YH8bLplyeHck07UH
         ypbg==
X-Gm-Message-State: AC+VfDwT2PY58ztFF4O0WKxEcUn9CcbeVCUc5e+zX5+mBKZWRIhUq5as
	zdGuKX3TuL2lpOTj89m2LKXNdMGwvJVV2mVNeiEy6s/P2GP0d38HtmZI5TU1A0qbPVgRZ/0l+Gz
	D7FXPnewkIrLhgU2MVBBvA2enZHHjaQpyVhFQmGXBEm7bzTHvxCThggbdvsQVUcw1bUcBDs+6xy
	IIvcW0/jDbB4mgh/s=
X-Google-Smtp-Source: ACHHUZ7pspQwthnUGGL7Ub1wIr9lCRm7UtPbxjpJc4ghLwvFfMdQFoJ0eppPqiny7eMwhjcpJ/snQg==
X-Received: by 2002:a05:6a21:32a8:b0:100:9969:8cf with SMTP id yt40-20020a056a2132a800b00100996908cfmr194460pzb.49.1684426940992;
        Thu, 18 May 2023 09:22:20 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:22:20 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH -next v20 21/26] riscv: Add sysctl to set the default vector rule for new processes
Date: Thu, 18 May 2023 16:19:44 +0000
Message-Id: <20230518161949.11203-22-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_172223_315440_B68779D1 
X-CRM114-Status: GOOD (  15.96  )
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
PHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgotLS0KQ2hhbmdlbG9nIHYyMDoKIC0gVXNlIFJFQURf
T05DRSB0byBhY2Nlc3MgcmlzY3Zfdl9pbXBsaWNpdF91YWNjIChCasO2cm4pCi0tLQogYXJjaC9y
aXNjdi9rZXJuZWwvdmVjdG9yLmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92
ZWN0b3IuYwppbmRleCA5YmVlN2EyMDExMDYuLjI1YzdmNWM5M2IwMCAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMK
QEAgLTE4NCw3ICsxODQsNyBAQCB2b2lkIHJpc2N2X3ZfdnN0YXRlX2N0cmxfaW5pdChzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnRzaykKIAogCW5leHQgPSByaXNjdl92X2N0cmxfZ2V0X25leHQodHNrKTsK
IAlpZiAoIW5leHQpIHsKLQkJaWYgKHJpc2N2X3ZfaW1wbGljaXRfdWFjYykKKwkJaWYgKFJFQURf
T05DRShyaXNjdl92X2ltcGxpY2l0X3VhY2MpKQogCQkJY3VyID0gUFJfUklTQ1ZfVl9WU1RBVEVf
Q1RSTF9PTjsKIAkJZWxzZQogCQkJY3VyID0gUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9PRkY7CkBA
IC0yNDcsMyArMjQ3LDM0IEBAIGxvbmcgcmlzY3Zfdl92c3RhdGVfY3RybF9zZXRfY3VycmVudCh1
bnNpZ25lZCBsb25nIGFyZykKIAogCXJldHVybiAtRUlOVkFMOwogfQorCisjaWZkZWYgQ09ORklH
X1NZU0NUTAorCitzdGF0aWMgc3RydWN0IGN0bF90YWJsZSByaXNjdl92X2RlZmF1bHRfdnN0YXRl
X3RhYmxlW10gPSB7CisJeworCQkucHJvY25hbWUJPSAicmlzY3Zfdl9kZWZhdWx0X2FsbG93IiwK
KwkJLmRhdGEJCT0gJnJpc2N2X3ZfaW1wbGljaXRfdWFjYywKKwkJLm1heGxlbgkJPSBzaXplb2Yo
cmlzY3Zfdl9pbXBsaWNpdF91YWNjKSwKKwkJLm1vZGUJCT0gMDY0NCwKKwkJLnByb2NfaGFuZGxl
cgk9IHByb2NfZG9ib29sLAorCX0sCisJeyB9Cit9OworCitzdGF0aWMgaW50IF9faW5pdCByaXNj
dl92X3N5c2N0bF9pbml0KHZvaWQpCit7CisJaWYgKGhhc192ZWN0b3IoKSkKKwkJaWYgKCFyZWdp
c3Rlcl9zeXNjdGwoImFiaSIsIHJpc2N2X3ZfZGVmYXVsdF92c3RhdGVfdGFibGUpKQorCQkJcmV0
dXJuIC1FSU5WQUw7CisJcmV0dXJuIDA7Cit9CisKKyNlbHNlIC8qICEgQ09ORklHX1NZU0NUTCAq
Lworc3RhdGljIGludCBfX2luaXQgcmlzY3Zfdl9zeXNjdGxfaW5pdCh2b2lkKSB7IHJldHVybiAw
OyB9CisjZW5kaWYgLyogISBDT05GSUdfU1lTQ1RMICovCisKK3N0YXRpYyBpbnQgcmlzY3Zfdl9p
bml0KHZvaWQpCit7CisJcmV0dXJuIHJpc2N2X3Zfc3lzY3RsX2luaXQoKTsKK30KK2NvcmVfaW5p
dGNhbGwocmlzY3Zfdl9pbml0KTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
