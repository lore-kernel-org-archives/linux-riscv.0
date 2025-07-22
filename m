Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E0FC83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCbG1Jihg8Q21j/f2ZvIAHI32nCBcLBBWE4XeCBb6PI=; b=3IQe9wMJ5rXk6d
	VgAgVFMWWbSWPM8PB+p66TuH366digB9US7Bzl+sujriNJEDD4Za8xT37D7wvQSWAfqIvsxLZUsdq
	h3q6A360L5E168ABFPMEvHm071E5HnuaNLfwNgfz3IVDEUm9K5rLunK8gpn9Qu+dSoTZ8XseUCC2B
	yd84t0CeSnraV6VeOU+48Z9CAeTlelKmslOlS2eIu7QK2FueIH4F/uqtK1Ryhr82iJvaBGl/wz7kZ
	reePD7T89LXeB3hFDQPVHiWFGVGJiOf6gnIVxSG/4NEi6fMlU2+MLz33/0V6oxVmIPBlAMrgR5oax
	NI4Zuow3dWLqOb3HKKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFuK-000000031w7-2BFi;
	Tue, 22 Jul 2025 16:32:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFZ1-00000002ym2-27sf
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Jul 2025 16:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wKk7eEoD9Afhi6CnnRkuOlPcLuRjhPLEJ9MSAogYdhU=; b=A3X0rrMrV+HZfCWDNQcBNkg+6L
	In5rO1fKi14fVPKBqoEOB5x4OMrzNaMOgf7CBXEspXRCmUUJFd+MnbJtZTOdD9ADsHdQ7n6hiUuPt
	/mj9zwUDisBXpcritCArzORC9m4cQbwinpZupt9onp3V83SK2QB3I29UtNGw2BngnznlWg4c/LM7M
	Dv2bHyoxII6AAijl3uL/pceLrUf09y/8ld5+hOUIllX9Z90D108K35RTBhu4B+eb/9UD6mT2NyYw/
	0dTRpXcp8Y3p1spuMQDSy3BaXCU+xzv1/5ILRdlYDOkhCJEWfsXUMEZwE4P1YUuy13pxH0zoQkexj
	BMkFX0RA==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFYy-0000000BJ81-2ZMc
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 16:09:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a52878d37aso689440f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 09:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753200594; x=1753805394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKk7eEoD9Afhi6CnnRkuOlPcLuRjhPLEJ9MSAogYdhU=;
        b=IAarr6yX7DLDAOsNPjmSym1Qot60RnY0Qf6GLzobjh3NfC9ql9c9kuqXsicnM/k4Zb
         uba9gDIdMg4/DXIfCNlU7OVMu2Gyr77HyNsKydsj2ggnxpTldhXexd6C+1ov77XFYLpi
         7eoGaAlsquk3MF31l3diwD1oeBzI4XD0qukDtZaCeMDkVyDajFqO87ZEE0LE80NjpKLF
         lIrWO1vfrU3zGWyU0vDmkiD8k9aReKihjxol9u+9X+dNZ5/d/qSdhJLqB1/uAFoccQTH
         qX6JcJ0KZXzbZBDRYqBlUnD7pOUd8m/VFNuYnzH259Q49+how/9I9UtgPqY4nniBj72T
         mjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753200594; x=1753805394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKk7eEoD9Afhi6CnnRkuOlPcLuRjhPLEJ9MSAogYdhU=;
        b=R+SWoxiSw7YAR9aBGJ4MXENYqt69BWGZ2u1jTS4EaL94hi4+gfJzNDaU++gcjnD9Tj
         TfzZF5d42cOH6l8VXd6W8/B6DUIDuLjA32SRFnR2gz489g5RXdBthEe+c4sQTdtfiqdc
         2Im7LA3fuffGIc0nRiFcDMpgIFTlLA/Nms+FzCaekPyAEBTiluKsia0jfAM2MryzsPDo
         zRy2il03w/OV+IAGcxQw3kBC7vgGnZhWe6zY+43xX0BN4hCrdZl8Dx2L9D+zGKfrFhdW
         7fkxcrPncaoOE0EJazjZCVgNnBJwKV9Q6hXlC21A7lMvqjfRuXRFnEMOe8l2URGOr25H
         3PyQ==
X-Gm-Message-State: AOJu0YyNlVcfFvO75WCZAdimC1QgkIRV/C+PQwoN8ZBUTT0y8eOgRNMX
	WIggeGIn5kIaeoXf3WDme/ixX4F94dR8llBt2IEn5bgV/kpnhFjelVnUfiS3V93+qn6tRBXFCiu
	RLj4L
X-Gm-Gg: ASbGncsLSueiTTpjgp3/mLAr8TC/mIwXC+GW2UQdNLWKtrU1TvuWRAD6e1YjLRrF9nz
	DZRZ6zUIYaqDK0om9+mdWwZ8BCc4YySpQa5diu2bjH0UMubg5uCUtmE29yW3DYniHsIkf1d8RXg
	vo9ZU5WO/t6oI4os24+hiHRThB/TmGVB4TH12VTIOYoZCpWEAK4XxCpvRnVZbutG4rHrewk3/nn
	u9SIBiWf+0jAlXbbwE7LPTVpLSiONGDtbiA9YIA00rkd5QMt4WopagFf+kKtvFCKU/MWarB+dTO
	5yMk4PVkoLPV7OrhjEsP/pjAamNnnRGId6FmTD2T8fitEm1V6Fl6Es/noZ0k53mQd06loYyWG1n
	VXh1ALvr37gjxKDhoJpzz7IKzp0R8JQ==
X-Google-Smtp-Source: AGHT+IEdbcW5tiM6a+vZti3qt9gbdvCtyoDm0M+U5Gb52pX9GNPInay3IeMeUoo/yrbUTX9EOmnrAA==
X-Received: by 2002:a05:6000:2509:b0:3a5:324a:a04e with SMTP id ffacd0b85a97d-3b60dd0f03emr7930217f8f.0.1753200593252;
        Tue, 22 Jul 2025 09:09:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:30d6:4986:8040:bb0a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b61ca25533sm13602031f8f.11.2025.07.22.09.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 09:09:52 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 1/3] riscv: use TASK_TI_CPU instead of TASK_TI_CPU_NUM
Date: Tue, 22 Jul 2025 18:05:55 +0200
Message-ID: <20250722160556.2216925-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250722160556.2216925-2-rkrcmar@ventanamicro.com>
References: <20250722160556.2216925-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_170956_872150_0E9AB758 
X-CRM114-Status: GOOD (  10.42  )
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

VGhlIG9mZnNldHMgb2YgVEFTS19USV9DUFUgYW5kIFRBU0tfVElfQ1BVX05VTSBhcmUgaWRlbnRp
Y2FsLCBhbmQKVEFTS19USV9DUFUgaXMgYSBiZXR0ZXIgbmFtZSBmb3IgdGhyZWFkX2luZm8uY3B1
LgoKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5j
b20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaCAgICB8IDIgKy0KIGFyY2gvcmlz
Y3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hc20uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmgKaW5kZXggYThhMmFmNmRmZTlk
Li5iMzAyMmJjMjI0ZWMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaApAQCAtOTEsNyArOTEsNyBAQAogI2Vu
ZGlmCiAKIC5tYWNybyBhc21fcGVyX2NwdSBkc3Qgc3ltIHRtcAotCVJFR19MIFx0bXAsIFRBU0tf
VElfQ1BVX05VTSh0cCkKKwlSRUdfTCBcdG1wLCBUQVNLX1RJX0NQVSh0cCkKIAlzbGxpICBcdG1w
LCBcdG1wLCBQRVJfQ1BVX09GRlNFVF9TSElGVAogCWxhICAgIFxkc3QsIF9fcGVyX2NwdV9vZmZz
ZXQKIAlhZGQgICBcZHN0LCBcZHN0LCBcdG1wCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9hc20tb2Zmc2V0cy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwppbmRleCA2
ZThjMGQ2ZmVhZTkuLjQ5Y2YyYzM0NzQ4NSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
YXNtLW9mZnNldHMuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jCkBAIC00
OSw3ICs0OSw2IEBAIHZvaWQgYXNtX29mZnNldHModm9pZCkKIAlPRkZTRVQoVEFTS19USV9BMiwg
dGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLmEyKTsKICNlbmRpZgogCi0JT0ZGU0VUKFRBU0tfVElf
Q1BVX05VTSwgdGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLmNwdSk7CiAJT0ZGU0VUKFRBU0tfVEhS
RUFEX0YwLCAgdGFza19zdHJ1Y3QsIHRocmVhZC5mc3RhdGUuZlswXSk7CiAJT0ZGU0VUKFRBU0tf
VEhSRUFEX0YxLCAgdGFza19zdHJ1Y3QsIHRocmVhZC5mc3RhdGUuZlsxXSk7CiAJT0ZGU0VUKFRB
U0tfVEhSRUFEX0YyLCAgdGFza19zdHJ1Y3QsIHRocmVhZC5mc3RhdGUuZlsyXSk7Ci0tIAoyLjUw
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
