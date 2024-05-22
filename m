Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E41C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYDqRiuSyOlkAEqFs+2L8rLsddz49Fx6WTVa/Bp65GA=; b=E46InvpTORQBO5
	7vF4YnR1EIKlCap8UpKW9x3TDyEFx5z0lCOBHy44U2QOyYysL3vCs/jyFtvJgNoFIombQFuJw3oS8
	ehLGamxCwzkDqgMwNtubrPImF8TPneqW/BuvRNuxFgaP5iOxM32yQ9Stul15DEFFIITDlpI3Xcax4
	wDbKHmY5NXhpDN7vN1IlaCAP8A51xMmr1F0N5GMaUfrWpturAkIVAaPQzlYqlT5OR4frw8JhBAGvO
	itmCJvdDZHuLGRuez84VRGP71zgInxVR/+7R9DN2CzETPJTCdrW7fTtRdwoUl2LKgFMI1OFdZWiCS
	QXMKPxX9ABA9f4Cj8tsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9avX-00000001eBb-0Xh3;
	Wed, 22 May 2024 01:37:59 +0000
Received: from sonic317-39.consmr.mail.ne1.yahoo.com ([66.163.184.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9avT-00000001eAv-44Jr
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1716341871; bh=K4ceCAMUd3OOguRCiqyTBlmv17C7zQy/D1e8nEr4anQ=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=cXJATLLKiLz52BpWSPiOYeWx4mLV9DJpmtdOk0sp3GpkahpTkwWKbXXmVPAOKxUq6IPzBAEBVp3FonsizTkcvVotTFqbCCY8LabARJ4Ipk9byZibfK/hOlk0o+V14qigchXjwwkc1bZ17dqj5PIDR0nVRGZ+P1Wmd0M9JcAqak34D1O9dxVyxqSXAtGetaV5iGFf2K1YT2Io5EVEUvQ67Z7Evx5ktw2Muw15MMBJ/ES4fh+yGm4zkUb4V0nx1ieKUGrV89EvcRnL7B6N+z2xSFPsjvY6kqpsI0FmxSqUHtV7w6HSk3lVUP80M2AcgU8LmVhjviNOAuo8shnXielxcw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1716341871; bh=TppIJ/5gag3sW8xK2OC6qT955KWtTkUGSFcvIbnkGLU=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=uYAuHe1MxPWRFlYZm2EU88AYIGIZRf19pq9pkMzEfku5Hr/i9dQXkUg/A+lY607WsWE6sz3K0mH/08FpGnpAiKa4/8/B2pZf2iGS5E19SXq9+ZLQCDA1swVzpXUFRUITscYqnpo1JGPV/IBFzNHv6WwKNBZSaOgx6lPWfAU/avDAh9HACkxbzRiQLhXo2uMPUpfxeC9yqNUPD9nZEGf9HNndjygsfpgr+xcsfrlNqYuYRxu3HKb1GT4RjL0hrfjayIyakGke2ZXcZ1w5HBO5RboaazjARRYqxYa/S+YGPPmWL5K2tyT+/jPJUvG3T3pdGglCMpoXI5m+Ye/zDQJYeQ==
X-YMail-OSG: rb2W.CAVM1nn7ILuoqlSMVNWYt6G71IbQJ9C1HKd_egYmcdPyshvCQkau2uqHmg
 V3gDzX4MCvbm1s3h6dFstKiJHo0AzxprRnuQDGqR483yok1wJxyctaKFnTfm0G1M4mkfQ9MtlHs2
 kufxSKI0RMU6ZQoe4qnH.AKFJKZZa2j5pHTqs6fg1BHsCVmwJCSQVJcc2csAXuUIXrv4S9PrOzPy
 lY0h1fX9_UCOjjwOTwlp7k0RFzjHJ68s5Xn8SwQFuG7dBQS5zv3Jj7F_I3fgMO4GB1d7G3y_en4K
 LJjY7l7t1esBBF5EmWPkjJP_SzercipYtoBQEicP3BbaVoxj.muoG854TuB7sW77ujQsXY_bxAET
 rECUYPx_CAi8aRCZmQAv8UUuForZc5i2wG3_OCpysheSebAy.m0lEMecot8ONlajAC70zJyyImFa
 4eHazUYGu9LxQWkht1UJ4talEPeFlQkqHYQmfrI2l6Fw.5Mk8tTnslGtAXC1RY7mb63ZlMKgMCPc
 enELx11AEdl4KjqV58inLw4bKXi6IGG2g8kApCArEXNC3d8n0VedAcFEVFzD2RtXgOWhSQ4xEvoK
 qC3V74GmO8FxOyvaWtAwvof2CYFvK1uYvYrLDmRBUPmWkDC6hexAUKCMtY6L8spNW.q.5vveN.9E
 QAvp2CGyy3izc9wVa6CApmhNucVpKP2_UsQQU6ZhFXGff8d_ahQ.qwuvrV1yBhdGv9i7lShD34Hl
 JCmhyobP9uMtNmcHNyHnwBCfcaxi5q7JBz7XlyBkTFYSi.c8R4deeSgUbv4SJ728RrGHDFrs0McL
 w3tg4xv9cr32JOq3CVhooyneAwu6pdKP2e4EvrOAkq3cXYdt6c09klBaQAuzhGfUWRfxne_K9bT4
 TCAX4IXb2A7Fox.ZKLsg3U.NY.7_1Rd5udexmFFP60nuxfGak6MaoAzL0We06kJ9ZXOszkJ7H.r1
 kYeZ5UxHsU0vrDYAqYIML2q9xuLhvZkHQJ.5J9f43t8wjt4QROThQLxzTYAx6QykkKaT0ElOwQ83
 4HT42bO02OXfhvqDWBtq4XTUIxlI4x03ku8Bf8Q6VX0h9i5v_9UBOWlQ8_o.45KN.IJ52JX7u7qI
 q1T8_oR03xpxggBH1k4uUPLK_ZbyAcNIAStrSQbMGdx4VCM_g_FsFpmq3RBBNLa.QYrb142GelY8
 h27qRCIz8dL.CZQU0Kvfow5mPV8UKc54mdOZG9RLaynwuFgKG7EF5Gcldg3LgISLFH4cYR35YitR
 g2mhUEKgYpOauWAVQAN2wt03pxI_dFOUZwh5D2PN0Y62xh8.z8Uad_nZGZk3vsMCQQ7trvTyNWZG
 DJZd9jetcMZJRmhPoGWFH8QbA7Y_0mny4K88VoF1rrEl5nqtGIVqLPejPtMblyq8MLkAaVS_hVjo
 LPyJmrbjeUgJZTTPTi14kUmIBES9Q0HIpRbKoGnHiukGzLCtrunI5CRTkKBeK7e2CBth82UX_8mS
 WvvB_Hvgu3EBTLm9GJaVZUks4tpiXQ80ci1zVFtC8sOHXlSJreGDOvEnJl_jg2QLPEkgx9D36qox
 n19FmHxMmOnUlGWWkJFwRMLbhuYJTAsDVYDFVA69nPqXQ8ePmWDzRA_TgBQV7iL7P1.V_gk3o5Fs
 tvNkkhxECcdszebEhteGYlzYsh14.DIfNkYEppJ1TcEkzcHn6HRrJMZ10jOAGCJXQALPu_pWCExa
 rT7oIcsJV5sPD3C6hi3s34.mFwd0kVtnF00FrM2V49EiRKahMv5HSjNYFom66BHBUKhwWTDzEyl.
 hfKXEZAbrk0pLHvQwmEJWzRjeS8wCMTaXYJ.fKT5F_.q36xr_Q1fK5wmyg8nh6YxkuTqP2sVaQWe
 sOH9YFmIIftB156jy8tl_7C6N8d4ffx.q5JEkMgK7xLoZ1Ul6rd8hAJvNDxx3diEXVzUny1FpmJL
 rqLLJYx5vUdHrlk_j2aw_5LW8xM2Zwta29e0ilFkmZETh6un35X_ZaJD3cMNZZzaKCGGS1xrtdu.
 RDwOU8FqtbX9PNBSTHux7VPqC7w5cQRzJPnS9cvpMH8w0tMaNWLIxG5rtB1MFaU8rbeD50RtnATp
 4WJRrFDWcU0dBPRAUhBT4HmuK54i0CHcFBEdzRaqhlothLGEh_8GIPWP9k8jKz7tABormleib9Py
 Eeq6myb.haTs3APIir3NRVM1Vmnnh8aNvOq1pVq.tv.qWdUmreoDdRduI6ITot6zI3JfN.6w.g1G
 DMgP4TTiohcV8.SfNoFmh7yhU8MNRLlb4bYX9Z5GVYxQGZt9JIwCb..y.bdJ5Z8ZM
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 47ee3241-7a52-4eda-bec9-01823c7c6fd7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Wed, 22 May 2024 01:37:51 +0000
Received: by hermes--production-gq1-59c575df44-8sqjb (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95637bea4982e23cda54aebcf40e6a2a;
          Wed, 22 May 2024 01:37:49 +0000 (UTC)
Message-ID: <ce499a0d-fc35-40cd-aa6e-c100551d137c@schaufler-ca.com>
Date: Tue, 21 May 2024 18:37:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/68] selftests/lsm: Drop define _GNU_SOURCE
To: Edward Liaw <edliaw@google.com>, shuah@kernel.org,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@android.com, linux-security-module@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>
References: <20240522005913.3540131-1-edliaw@google.com>
 <20240522005913.3540131-28-edliaw@google.com>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20240522005913.3540131-28-edliaw@google.com>
X-Mailer: WebService/1.1.22356 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_183756_152678_DC942A39 
X-CRM114-Status: UNSURE (   8.36  )
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

T24gNS8yMS8yMDI0IDU6NTcgUE0sIEVkd2FyZCBMaWF3IHdyb3RlOgo+IF9HTlVfU09VUkNFIGlz
IHByb3ZpZGVkIGJ5IGxpYi5taywgc28gaXQgc2hvdWxkIGJlIGRyb3BwZWQgdG8gcHJldmVudAo+
IHJlZGVmaW5pdGlvbiB3YXJuaW5ncy4KPgo+IFJldmlld2VkLWJ5OiBKb2huIEh1YmJhcmQgPGpo
dWJiYXJkQG52aWRpYS5jb20+Cj4gUmV2aWV3ZWQtYnk6IE11aGFtbWFkIFVzYW1hIEFuanVtIDx1
c2FtYS5hbmp1bUBjb2xsYWJvcmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEVkd2FyZCBMaWF3IDxl
ZGxpYXdAZ29vZ2xlLmNvbT4KCkFja2VkLWJ5OiBDYXNleSBTY2hhdWZsZXIgPGNhc2V5QHNjaGF1
Zmxlci1jYS5jb20+Cgo+IC0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20vY29tbW9u
LmMgICAgICAgICAgICAgICAgIHwgMiAtLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sc20v
bHNtX2dldF9zZWxmX2F0dHJfdGVzdC5jIHwgMiAtLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9sc20vbHNtX2xpc3RfbW9kdWxlc190ZXN0LmMgIHwgMiAtLQo+ICB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9sc20vbHNtX3NldF9zZWxmX2F0dHJfdGVzdC5jIHwgMiAtLQo+ICA0IGZpbGVzIGNo
YW5nZWQsIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbHNtL2NvbW1vbi5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2NvbW1vbi5j
Cj4gaW5kZXggOWFkMjU4OTEyNjQ2Li4xYjE4YWFjNTcwZjEgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvbHNtL2NvbW1vbi5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbHNtL2NvbW1vbi5jCj4gQEAgLTQsOCArNCw2IEBACj4gICAqCj4gICAqIENvcHlyaWdo
dCDCqSAyMDIzIENhc2V5IFNjaGF1ZmxlciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4KPiAgICov
Cj4gLQo+IC0jZGVmaW5lIF9HTlVfU09VUkNFCj4gICNpbmNsdWRlIDxsaW51eC9sc20uaD4KPiAg
I2luY2x1ZGUgPGZjbnRsLmg+Cj4gICNpbmNsdWRlIDxzdHJpbmcuaD4KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbHNtL2xzbV9nZXRfc2VsZl9hdHRyX3Rlc3QuYyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fZ2V0X3NlbGZfYXR0cl90ZXN0LmMKPiBpbmRl
eCBkZjIxNWU0YWE2M2YuLjc0NjViZGUzZjkyMiAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9sc20vbHNtX2dldF9zZWxmX2F0dHJfdGVzdC5jCj4gKysrIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvbHNtL2xzbV9nZXRfc2VsZl9hdHRyX3Rlc3QuYwo+IEBAIC01LDggKzUs
NiBAQAo+ICAgKgo+ICAgKiBDb3B5cmlnaHQgwqkgMjAyMiBDYXNleSBTY2hhdWZsZXIgPGNhc2V5
QHNjaGF1Zmxlci1jYS5jb20+Cj4gICAqLwo+IC0KPiAtI2RlZmluZSBfR05VX1NPVVJDRQo+ICAj
aW5jbHVkZSA8bGludXgvbHNtLmg+Cj4gICNpbmNsdWRlIDxmY250bC5oPgo+ICAjaW5jbHVkZSA8
c3RyaW5nLmg+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21f
bGlzdF9tb2R1bGVzX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fbGlz
dF9tb2R1bGVzX3Rlc3QuYwo+IGluZGV4IDA2ZDI0ZDQ2NzlhNi4uYTZiNDRlMjVjMjFmIDEwMDY0
NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fbGlzdF9tb2R1bGVzX3Rl
c3QuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xzbS9sc21fbGlzdF9tb2R1bGVz
X3Rlc3QuYwo+IEBAIC01LDggKzUsNiBAQAo+ICAgKgo+ICAgKiBDb3B5cmlnaHQgwqkgMjAyMiBD
YXNleSBTY2hhdWZsZXIgPGNhc2V5QHNjaGF1Zmxlci1jYS5jb20+Cj4gICAqLwo+IC0KPiAtI2Rl
ZmluZSBfR05VX1NPVVJDRQo+ICAjaW5jbHVkZSA8bGludXgvbHNtLmg+Cj4gICNpbmNsdWRlIDxz
dHJpbmcuaD4KPiAgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2xzbS9sc21fc2V0X3NlbGZfYXR0cl90ZXN0LmMgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9sc20vbHNtX3NldF9zZWxmX2F0dHJfdGVzdC5jCj4gaW5kZXggNjZkZWM0N2Uz
Y2EzLi4xMTBjNmEwN2U3NGMgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bHNtL2xzbV9zZXRfc2VsZl9hdHRyX3Rlc3QuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2xzbS9sc21fc2V0X3NlbGZfYXR0cl90ZXN0LmMKPiBAQCAtNSw4ICs1LDYgQEAKPiAgICoK
PiAgICogQ29weXJpZ2h0IMKpIDIwMjIgQ2FzZXkgU2NoYXVmbGVyIDxjYXNleUBzY2hhdWZsZXIt
Y2EuY29tPgo+ICAgKi8KPiAtCj4gLSNkZWZpbmUgX0dOVV9TT1VSQ0UKPiAgI2luY2x1ZGUgPGxp
bnV4L2xzbS5oPgo+ICAjaW5jbHVkZSA8c3RyaW5nLmg+Cj4gICNpbmNsdWRlIDxzdGRpby5oPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
