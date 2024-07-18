Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1110C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 23:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hExyGlxMzKdkmGnKKqwZWSX/Y2bErqAyJ6vGh/dghA=; b=AwgMRhM1zrP99v
	pxO7fmAmKHqTDajGu1X8L/Du3DDuY3qFw1bMNs8Oc7SyUCCJjktIyOUPIQpLFkTTQGo0isSup+ELT
	FW7/VRXZIhyRallNNUHyzHZI8+Kla7bGy+mjWlV4le5JV9qUXW1q6DodxCccC89T2AqJoB0EZJt4M
	uFfIk6PeSJLhfJEI8g6wEbtg+VuLmGtFippOMQ3GE8L/Q4n9cwLWg4qqxHDDf8oohPbFLmqtA7LsQ
	7c/Y8zhDJzeiZ51N/219KrD9QjN/m7gy/0jYGRhVSFV5ECgjQ2yQqFISBBmOBpjE4Kw/lVEDQTnR9
	ZFQ8Hx8r92odjQFn3GoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUadl-00000000za5-3kLm;
	Thu, 18 Jul 2024 23:34:25 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUadi-00000000zZF-2vMb
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 23:34:24 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso914083a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 16:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721345661; x=1721950461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qF+1IDJjtH4yt3+dIXZUb/sL6BCvMKOBa4IWo3wL00=;
        b=HKWkgfQosF5IerZcYde4gdWc15UJI/pPoSGm0CPgZGUaNbzTssJEKWm2sJ4hHRbKWa
         fIxYKKmcBnFBwhWV1Um6GKalJHh2rfZ++Fhk8YmVBiQG9G2dVmzB5TMfroadGcOPUfuA
         FTyNob1PHTxgi67gxe2l0YkxuTHssLaNrbT42ISt/Kby57ySESjwgH0i2eKw8OOSwKII
         PuOWbuLblWUn3QbYkUh1WAvYqD5A9O53R/cFwtbtqM3WmS20LGkJHTJPsVfYa0ly/8WF
         YhozKDRfOhP2+IxgnouQQPHsyFo6z3tzaaToW6Ms23a8z3TybTkzb6WW3Y3RPisLbgi3
         GriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721345661; x=1721950461;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qF+1IDJjtH4yt3+dIXZUb/sL6BCvMKOBa4IWo3wL00=;
        b=kjtOG/wSaBUlwPw10123tqE4kQyROeXISnFw7sj9pySmbqdH1Af/ZeexHC2jpbVuKj
         4pWr53V5OvMEKppdywbwRp+/TejyXtsVhrFiDEpD8VCbDoCEUPWDjRcD4aCIVWra1u8u
         IZ0qz99hYD+GGfBBudatIvSxiy+UvjWOUiFBub8qlXq9QA7YxQlCifRsDYrZgYep3gq3
         cLP6GlMAdkBCkCJowU8P0uiX3wI3QECUkQwL74IPCXru8QYAgmhn1B2b22+WhSDxJXcE
         tr69m7TS9d5lTadQLcDQLBJBbavKWSWqzz/b0f8KoGgTWp74a73Uvgn2DP35CQw+Cl/F
         01Vg==
X-Forwarded-Encrypted: i=1; AJvYcCX9X5IPsMLIgOiPnxipPQFZi/KHut9rnFMeGL3cuWMOvzQkzPSxOVNdEKziVsJT6T8hNny6HrVxfUfuXyP6taATZSgWdsOJNQSv4u+QEdlh
X-Gm-Message-State: AOJu0YxqEOnO4fAx2uuyQPnfao0kKmSn92+npv/PH7REAzl6d1kcyey2
	LcON/+1O7GGEwjwpSzhIbxau7SnuCm4ySJRn65tJvWP++dJ7mMKJZP2ii534t0s=
X-Google-Smtp-Source: AGHT+IEKbX/FsbhFnIw71MBLVcrzrP5T77uZDA6cQicktN0+nhvg+Wct/m4wkCJiaiaT9dRkb2DrPg==
X-Received: by 2002:a05:6a20:918c:b0:1c3:a411:dc45 with SMTP id adf61e73a8af0-1c3fdd6b4e7mr7804327637.39.1721345661197;
        Thu, 18 Jul 2024 16:34:21 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:15c8:3512:f33c:2f80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf7c72075sm199845a91.28.2024.07.18.16.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 16:34:20 -0700 (PDT)
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
Subject: Re: [PATCH v9 38/39] kselftest/arm64: Add a GCS stress test
In-Reply-To: <20240625-arm64-gcs-v9-38-0f634469b8f0@kernel.org> (Mark Brown's
	message of "Tue, 25 Jun 2024 15:58:06 +0100")
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
	<20240625-arm64-gcs-v9-38-0f634469b8f0@kernel.org>
Date: Thu, 18 Jul 2024 20:34:18 -0300
Message-ID: <875xt2xojp.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_163422_931239_99065780 
X-CRM114-Status: GOOD (  11.54  )
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
YyAgICAgfCA1MzIgKysrKysrKysrKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgODUw
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKClRoaXMgdGVzdCBmYWlscyBmb3IgbWUsIGV2
ZW4gd2l0aG91dCBUSFA6CgokIHN1ZG8gLi9ydW5fa3NlbGZ0ZXN0LnNoIC10IGFybTY0Omdjcy1z
dHJlc3MKVEFQIHZlcnNpb24gMTMKMS4uMQojIHRpbWVvdXQgc2V0IHRvIDQ1CiMgc2VsZnRlc3Rz
OiBhcm02NDogZ2NzLXN0cmVzcwojIFRBUCB2ZXJzaW9uIDEzCiMgMS4uOQojICMgOCBDUFVzLCA5
IEdDUyB0aHJlYWRzCiMgIyBXaWxsIHJ1biBmb3IgMTBzCiMgIyBTdGFydGVkIFRocmVhZC00MDMw
CiMgIyBTdGFydGVkIFRocmVhZC00MDMxCiMgIyBTdGFydGVkIFRocmVhZC00MDMyCiMgIyBTdGFy
dGVkIFRocmVhZC00MDMzCiMgIyBTdGFydGVkIFRocmVhZC00MDM0CiMgIyBTdGFydGVkIFRocmVh
ZC00MDM1CiMgIyBTdGFydGVkIFRocmVhZC00MDM2CiMgIyBTdGFydGVkIFRocmVhZC00MDM3CiMg
IyBTdGFydGVkIFRocmVhZC00MDM4CiMgIyBXYWl0aW5nIGZvciA5IGNoaWxkcmVuCiMgIyBXYWl0
aW5nIGZvciA5IGNoaWxkcmVuCiMgIyBUaHJlYWQtNDAzMDogRmFpbGVkIHRvIGVuYWJsZSBHQ1MK
IyAjIFRocmVhZC00MDMxOiBGYWlsZWQgdG8gZW5hYmxlIEdDUwojICMgVGhyZWFkLTQwMzI6IEZh
aWxlZCB0byBlbmFibGUgR0NTCiMgIyBUaHJlYWQtNDAzMzogRmFpbGVkIHRvIGVuYWJsZSBHQ1MK
IyAjIFRocmVhZC00MDM0OiBGYWlsZWQgdG8gZW5hYmxlIEdDUwojICMgVGhyZWFkLTQwMzU6IEZh
aWxlZCB0byBlbmFibGUgR0NTCiMgIyBUaHJlYWQtNDAzNjogRmFpbGVkIHRvIGVuYWJsZSBHQ1MK
IyAjIFRocmVhZC00MDM4OiBGYWlsZWQgdG8gZW5hYmxlIEdDUwojICMgVGhyZWFkLTQwMzc6IEZh
aWxlZCB0byBlbmFibGUgR0NTCiMgIyBTZW5kaW5nIHNpZ25hbHMsIHRpbWVvdXQgcmVtYWluaW5n
OiAxMDAwMG1zCiMgIyBTZW5kaW5nIHNpZ25hbHMsIHRpbWVvdXQgcmVtYWluaW5nOiA5OTAwbXMK
ICAgIOKLrgojICMgU2VuZGluZyBzaWduYWxzLCB0aW1lb3V0IHJlbWFpbmluZzogMjAwbXMKIyAj
IFNlbmRpbmcgc2lnbmFscywgdGltZW91dCByZW1haW5pbmc6IDEwMG1zCiMgIyBGaW5pc2hpbmcg
dXAuLi4KIyAjIFRocmVhZC00MDMwIGV4aXRlZCB3aXRoIGVycm9yIGNvZGUgMjU1CiMgbm90IG9r
IDEgVGhyZWFkLTQwMzAKIyAjIFRocmVhZC00MDMxIGV4aXRlZCB3aXRoIGVycm9yIGNvZGUgMjU1
CiMgbm90IG9rIDIgVGhyZWFkLTQwMzEKIyAjIFRocmVhZC00MDMyIGV4aXRlZCB3aXRoIGVycm9y
IGNvZGUgMjU1CiMgbm90IG9rIDMgVGhyZWFkLTQwMzIKIyAjIFRocmVhZC00MDMzIGV4aXRlZCB3
aXRoIGVycm9yIGNvZGUgMjU1CiMgbm90IG9rIDQgVGhyZWFkLTQwMzMKIyAjIFRocmVhZC00MDM0
IGV4aXRlZCB3aXRoIGVycm9yIGNvZGUgMjU1CiMgbm90IG9rIDUgVGhyZWFkLTQwMzQKIyAjIFRo
cmVhZC00MDM1IGV4aXRlZCB3aXRoIGVycm9yIGNvZGUgMjU1CiMgbm90IG9rIDYgVGhyZWFkLTQw
MzUKIyAjIFRocmVhZC00MDM2IGV4aXRlZCB3aXRoIGVycm9yIGNvZGUgMjU1CiMgbm90IG9rIDcg
VGhyZWFkLTQwMzYKIyAjIFRocmVhZC00MDM3IGV4aXRlZCB3aXRoIGVycm9yIGNvZGUgMjU1CiMg
bm90IG9rIDggVGhyZWFkLTQwMzcKIyAjIFRocmVhZC00MDM4IGV4aXRlZCB3aXRoIGVycm9yIGNv
ZGUgMjU1CiMgbm90IG9rIDkgVGhyZWFkLTQwMzgKIyAjIFRvdGFsczogcGFzczowIGZhaWw6OSB4
ZmFpbDowIHhwYXNzOjAgc2tpcDowIGVycm9yOjAKb2sgMSBzZWxmdGVzdHM6IGFybTY0OiBnY3Mt
c3RyZXNzCgotLSAKVGhpYWdvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
