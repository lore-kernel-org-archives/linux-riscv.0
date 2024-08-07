Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88657C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 22:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5UcQlryIsMzZbygSpcUVcmXhauUdywpO8d6X9thlZ4=; b=rKPiRr1AshXHP4
	aSOUEggbRL8MegeNrToE1vIHtJkBHcamQTfWQYCS5t5nno88V36KbkTp2AleIsr0+8LZZmiCo4THG
	PFC6vimYaek1c5tf6XUpwQutaF/gx23XnVEVmNsx1sw03sqmCIvihIeOb+Ssd1w20e/bUzPu8UM6S
	c/PmMkVAphWtaPptOmvQH6ewdSDzdQ6eRUMatKDzgRsRGhlr+p9Cmu2XZ5ulFKj2R/3p98syES13+
	EMpuHE5AH2z0RXixuTdg2Q0bnb1U+wyrVc+eVSxCz1DJ1W/ciqwCZrU8lKpuPmcrp3sSVLB65IDUI
	S6wvJch6kORQ/a2JK3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbpK4-00000006TTB-3xB0;
	Wed, 07 Aug 2024 22:40:00 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbpK2-00000006TST-0zpN
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 22:39:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-70d18d4b94cso301656b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 15:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723070397; x=1723675197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpaMsRHZ95ToRGUxAfb1zMIumId8sRSoShxy8vDFiIM=;
        b=vB6pd2a9nOJWBHZdFrSTt6HRXbnuOP4S81qDJst/IGkYNElAlN5i3GSynSv/EuF+XN
         MkvBX5pJKKATS7A0xI35VFSCXZFQJo79gwI7Tknh1K5Pe+goU1iQo+FCgIley9y0k+Iw
         WSyXFAjhHD5SGeCns80l69ElTruIO7IF52K/n4YpdgOZ762LmwdENxmEyp/yaQUqypf+
         SWno/Paj2uVapXd/sJXhIii3MH8xKdkA4ixXltvi7R1HZgVYQKSm8X3v7wmfZla86w5o
         jo7FgwSNyjwkrvxX0Ipu7uXXvPBrf+ckKGhvfM3FVimzMLgsdBUC3iCNbs6xmJECMEMl
         elcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723070397; x=1723675197;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpaMsRHZ95ToRGUxAfb1zMIumId8sRSoShxy8vDFiIM=;
        b=kzySCJRFDBS/+5blfZT9q/F3NJK/Rq2bnk6O82OiClLoe92ACUCTyR7Jl/qvbhLr9G
         rj0MQzr3g12/x+HfMPfcLynCy73o8han/a/ZN6XN8SClhaBUppkdQ73gtcqQmkNyfFMV
         t/YWprMmSwGRsYj3z2oYToiBmt/edslXgkYpS//qZ5LtLY2Mt3rfPv5H8USajvGIAAH2
         0Vw/5UaZ1OrlMUxjmAT0Yi8Cjqu5331byUUZtPDAnYzK8d3+FDnrfVT6uAKVmy+g4tId
         vnQlyeFCpM9NNIdsySoEnOaak/6gRE2zVhYvdIQEJmfp5niHzTTEJX8Vb4SNi5MCfdad
         FHng==
X-Forwarded-Encrypted: i=1; AJvYcCVeiEqIO6CfnM3EDLlEnxATTWgvd9yAvmXYcP8JVdMVSrUBnPgLcuReTuUtBQ0LQS+KRMxQN7jvf0Ag9UfYKJ5Pz+d2ktB84S49669qo6GY
X-Gm-Message-State: AOJu0YwnO/vy9lRogaauxyCaeXe6oe8OA4Lu9ZuCMOAyI7om8s6X11Iz
	MTXK2Jt5auOyJKFfOlDWkcmu7sZt8zLf1GXKZ51VuJFuVq8KQ2dBBa1MxUln96LBvslHoQb5aXs
	/7yc=
X-Google-Smtp-Source: AGHT+IESQPvEwbmsSFYakbTK2ll0Tt3rDUIt6IHjj6Copl3/ebwJm0vHuqLsOiAaukYjvG1usCbD8Q==
X-Received: by 2002:a05:6a00:3cc3:b0:706:6b29:9cf0 with SMTP id d2e1a72fcca58-710cae8d2e0mr108951b3a.30.1723070397365;
        Wed, 07 Aug 2024 15:39:57 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:6c30:472f:18a6:cae1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2cc9bfsm12167b3a.137.2024.08.07.15.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 15:39:56 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Andrew Morton
 <akpm@linux-foundation.org>,  Marc Zyngier <maz@kernel.org>,  Oliver Upton
 <oliver.upton@linux.dev>,  James Morse <james.morse@arm.com>,  Suzuki K
 Poulose <suzuki.poulose@arm.com>,  Arnd Bergmann <arnd@arndb.de>,  Oleg
 Nesterov <oleg@redhat.com>,  Eric Biederman <ebiederm@xmission.com>,
  Shuah Khan <shuah@kernel.org>,  "Rick P. Edgecombe"
 <rick.p.edgecombe@intel.com>,  Deepak Gupta <debug@rivosinc.com>,  Ard
 Biesheuvel <ardb@kernel.org>,  Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
  Kees Cook <kees@kernel.org>,  "H.J. Lu" <hjl.tools@gmail.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Florian Weimer <fweimer@redhat.com>,
  Christian Brauner <brauner@kernel.org>,  Ross Burton
 <ross.burton@arm.com>,  linux-arm-kernel@lists.infradead.org,
  linux-doc@vger.kernel.org,  kvmarm@lists.linux.dev,
  linux-fsdevel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-mm@kvack.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 38/40] kselftest/arm64: Add a GCS stress test
In-Reply-To: <20240801-arm64-gcs-v10-38-699e2bd2190b@kernel.org> (Mark Brown's
	message of "Thu, 01 Aug 2024 13:07:05 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-38-699e2bd2190b@kernel.org>
Date: Wed, 07 Aug 2024 19:39:54 -0300
Message-ID: <877ccsdkjp.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_153958_311804_AA786BD7 
X-CRM114-Status: GOOD (  11.67  )
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

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IEFkZCBhIHN0cmVzcyB0
ZXN0IHdoaWNoIHJ1bnMgb25lIG1vcmUgcHJvY2VzcyB0aGFuIHdlIGhhdmUgQ1BVcyBzcGlubmlu
Zwo+IHRocm91Z2ggYSB2ZXJ5IHJlY3Vyc2l2ZSBmdW5jdGlvbiB3aXRoIGZyZXF1ZW50IHN5c2Nh
bGxzIGltbWVkaWF0ZWx5IHByaW9yCj4gdG8gcmV0dXJuIGFuZCBzaWduYWxzIGJlaW5nIGluamVj
dGVkIGV2ZXJ5IDEwMG1zLiBUaGUgZ29hbCBpcyB0byBmbGFnIHVwCj4gYW55IHNjaGVkdWxpbmcg
cmVsYXRlZCBpc3N1ZXMsIGZvciBleGFtcGxlIGZhaWx1cmUgdG8gZW5zdXJlIHRoYXQgYmFycmll
cnMKPiBhcmUgaW5zZXJ0ZWQgd2hlbiBtb3ZpbmcgYSBHQ1MgdXNpbmcgdGFzayB0byBhbm90aGVy
IENQVS4gVGhlIHRlc3QgcnVucyBmb3IKPiBhIGNvbmZpZ3VyYWJsZSBhbW91bnQgb2YgdGltZSwg
ZGVmYXVsdGluZyB0byAxMCBzZWNvbmRzLgo+Cj4gUmV2aWV3ZWQtYnk6IFRoaWFnbyBKdW5nIEJh
dWVybWFubiA8dGhpYWdvLmJhdWVybWFubkBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE1h
cmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvYXJtNjQvZ2NzLy5naXRpZ25vcmUgICAgICAgfCAgIDIgKwo+ICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9hcm02NC9nY3MvTWFrZWZpbGUgICAgICAgICB8ICAgNiArLQo+ICB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9nY3MvYXNtLW9mZnNldHMuaCAgICB8ICAgMAo+ICAuLi4v
c2VsZnRlc3RzL2FybTY0L2djcy9nY3Mtc3RyZXNzLXRocmVhZC5TICAgICAgICB8IDMxMSArKysr
KysrKysrKysKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvZ2NzL2djcy1zdHJlc3Mu
YyAgICAgfCA1MzAgKysrKysrKysrKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgODQ4
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKClVuZm9ydHVuYXRlbHksIGdjcy1zdHJlc3Mg
c3RpbGwgZmFpbHMgb24gbXkgRlZQIHNldHVwLiBJIHRlc3RlZCBvbiBhbgphcm02NCBkZWZjb25m
aWcgd2l0aCBhbmQgd2l0aG91dCBUSFAgZW5hYmxlZCB3aXRoLCB0aGUgc2FtZSByZXN1bHRzOgoK
JCBzdWRvIC4vcnVuX2tzZWxmdGVzdC5zaCAtdCBhcm02NDpnY3Mtc3RyZXNzIC1vIDYwMApUQVAg
dmVyc2lvbiAxMwoxLi4xCiMgb3ZlcnJpZGluZyB0aW1lb3V0IHRvIDYwMAojIHNlbGZ0ZXN0czog
YXJtNjQ6IGdjcy1zdHJlc3MKIyBUQVAgdmVyc2lvbiAxMwojIDEuLjkKIyAjIDggQ1BVcywgOSBH
Q1MgdGhyZWFkcwojICMgV2lsbCBydW4gZm9yIDEwcwojICMgU3RhcnRlZCBUaHJlYWQtNDg3MAoj
ICMgU3RhcnRlZCBUaHJlYWQtNDg3MQojICMgU3RhcnRlZCBUaHJlYWQtNDg3MgojICMgU3RhcnRl
ZCBUaHJlYWQtNDg3MwojICMgU3RhcnRlZCBUaHJlYWQtNDg3NAojICMgU3RhcnRlZCBUaHJlYWQt
NDg3NQojICMgU3RhcnRlZCBUaHJlYWQtNDg3NgojICMgU3RhcnRlZCBUaHJlYWQtNDg3NwojICMg
U3RhcnRlZCBUaHJlYWQtNDg3OAojICMgV2FpdGluZyBmb3IgOSBjaGlsZHJlbgojICMgV2FpdGlu
ZyBmb3IgOSBjaGlsZHJlbgojICMgVGhyZWFkLTQ4NzA6IEZhaWxlZCB0byBlbmFibGUgR0NTCiMg
IyBUaHJlYWQtNDg3MTogRmFpbGVkIHRvIGVuYWJsZSBHQ1MKIyAjIFRocmVhZC00ODcyOiBGYWls
ZWQgdG8gZW5hYmxlIEdDUwojICMgVGhyZWFkLTQ4NzM6IEZhaWxlZCB0byBlbmFibGUgR0NTCiMg
IyBUaHJlYWQtNDg3NjogRmFpbGVkIHRvIGVuYWJsZSBHQ1MKIyAjIFRocmVhZC00ODc1OiBGYWls
ZWQgdG8gZW5hYmxlIEdDUwojICMgVGhyZWFkLTQ4NzQ6IEZhaWxlZCB0byBlbmFibGUgR0NTCiMg
IyBUaHJlYWQtNDg3ODogRmFpbGVkIHRvIGVuYWJsZSBHQ1MKIyAjIFRocmVhZC00ODc3OiBGYWls
ZWQgdG8gZW5hYmxlIEdDUwojICMgU2VuZGluZyBzaWduYWxzLCB0aW1lb3V0IHJlbWFpbmluZzog
MTAwMDBtcwojICMgU2VuZGluZyBzaWduYWxzLCB0aW1lb3V0IHJlbWFpbmluZzogOTkwMG1zCiMg
IyBTZW5kaW5nIHNpZ25hbHMsIHRpbWVvdXQgcmVtYWluaW5nOiA5ODAwbXMKICAgICAgIOKLrgoj
ICMgU2VuZGluZyBzaWduYWxzLCB0aW1lb3V0IHJlbWFpbmluZzogMzAwbXMKIyAjIFNlbmRpbmcg
c2lnbmFscywgdGltZW91dCByZW1haW5pbmc6IDIwMG1zCiMgIyBTZW5kaW5nIHNpZ25hbHMsIHRp
bWVvdXQgcmVtYWluaW5nOiAxMDBtcwojICMgRmluaXNoaW5nIHVwLi4uCiMgIyBUaHJlYWQtNDg3
MCBleGl0ZWQgd2l0aCBlcnJvciBjb2RlIDI1NQojIG5vdCBvayAxIFRocmVhZC00ODcwCiMgIyBU
aHJlYWQtNDg3MSBleGl0ZWQgd2l0aCBlcnJvciBjb2RlIDI1NQojIG5vdCBvayAyIFRocmVhZC00
ODcxCiMgIyBUaHJlYWQtNDg3MiBleGl0ZWQgd2l0aCBlcnJvciBjb2RlIDI1NQojIG5vdCBvayAz
IFRocmVhZC00ODcyCiMgIyBUaHJlYWQtNDg3MyBleGl0ZWQgd2l0aCBlcnJvciBjb2RlIDI1NQoj
IG5vdCBvayA0IFRocmVhZC00ODczCiMgIyBUaHJlYWQtNDg3NCBleGl0ZWQgd2l0aCBlcnJvciBj
b2RlIDI1NQojIG5vdCBvayA1IFRocmVhZC00ODc0CiMgIyBUaHJlYWQtNDg3NSBleGl0ZWQgd2l0
aCBlcnJvciBjb2RlIDI1NQojIG5vdCBvayA2IFRocmVhZC00ODc1CiMgIyBUaHJlYWQtNDg3NiBl
eGl0ZWQgd2l0aCBlcnJvciBjb2RlIDI1NQojIG5vdCBvayA3IFRocmVhZC00ODc2CiMgIyBUaHJl
YWQtNDg3NyBleGl0ZWQgd2l0aCBlcnJvciBjb2RlIDI1NQojIG5vdCBvayA4IFRocmVhZC00ODc3
CiMgIyBUaHJlYWQtNDg3OCBleGl0ZWQgd2l0aCBlcnJvciBjb2RlIDI1NQojIG5vdCBvayA5IFRo
cmVhZC00ODc4CiMgIyBUb3RhbHM6IHBhc3M6MCBmYWlsOjkgeGZhaWw6MCB4cGFzczowIHNraXA6
MCBlcnJvcjowCm9rIDEgc2VsZnRlc3RzOiBhcm02NDogZ2NzLXN0cmVzcwpiYXVlcm1hbm5AYXJt
djk0Oi92YXIvdG1wL3NlbGZ0ZXN0cy1hcm02NC1nY3MtdjEwJCBlY2hvICQ/CjAKCi0tIApUaGlh
Z28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
