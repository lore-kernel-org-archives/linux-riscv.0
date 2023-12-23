Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D6BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 04:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7NsCStsWL46m7zJ3DI5A7lpOOQ+O1cclnPjx2iOjVOw=; b=EqgoUeVm8kx7tz
	VC5FKdXlAHZOiFP5E0Mgjuo8KXbeFQ7vQ2Xo38L8C3Mj5qQIO3UVIl6R/aQtlvw4SC7AGr5A8b8yO
	OKN69VcUrqnXzemmQA/BkTDvhq+h1Yrwt9y5vhaXHVSpFHAuZZU2M8cRzruOd4sNV+kJaPncr/1i4
	Gh+Kildof40/3BqpeYXw5TYZL3eBrHacji8BFPt7i+Z9Xby7llm6tLt+4fnP4eZ+fmHEeCVbIhVLW
	W3vSn4XdbntOl4fo1FJYLKNSnUR6KCZBJlL/ibNjImwTlQ6K0g/1QWkNpmU8Iqc2d5pCF7ob2ObIc
	MrC7L8dRLf1JiH2tU0iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtdj-007Lni-1C;
	Sat, 23 Dec 2023 04:29:31 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtdg-007Lmx-07
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 04:29:29 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28b6218d102so1895621a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 20:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703305765; x=1703910565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JDLZVXf21mIGtJjMHpe3f7Y94SwFwuljct02FpfvdhM=;
        b=U3NvwtbNj/bcKrQ1SKNDXIp9pR3FHUHGXDOfg0Fp3XZYQAiKIXTk/19lvZStTli6Jm
         2NkeH5C4Cye3ZrvSKp+g1avg9LZ1dbMxUkshV2FBv5UogpO79y7Y4dRlzyUVvqZjw22h
         Nl7GCRVs+XA7B9IqdzJovdsRfQnWdk+XTJWpz0Hj364AuC6A/MJubmVw0fY6jPKgLIfQ
         jqw5SVYpbUUluTcf/Z4Au7DMhbjZR1vekjhnfNeILBX4kR0bdyCE/3RyCQpk8ynzUFeM
         PaVhurv3X8GFc+m4abLQqD3wVOUHw5go4R2j5WfRG63mGgYcRy7Q+i7p/qYZeoZfNY4M
         LY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703305765; x=1703910565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDLZVXf21mIGtJjMHpe3f7Y94SwFwuljct02FpfvdhM=;
        b=NnKzhDVhWycfdKIyFMwdlYkPm8aYqr23VPekImbwGFqvug3tS3JmRU32L3mTUCkvfC
         ugCSwD1YrzIlj2cqafiAf73/4Gyb7kXl2IydBIN7eovn2gYEDtcqC0xhbnYJtk18DPR5
         /HC+7bnE1+52Tao88cRIKDZ0/xmTnDaA0nEQXN0po1Dd4/xYg6bungVMAqrtO95g+5ci
         TEd1z6UgSyaLMQgYaHvLonuWvoJo/n+dvwTyS0COCfPgskDsRy3fi2HiShBNAoCafAyf
         sFPGiJ3lDZ79NU+IYVSIUUmmdULSPmmNguW0IU7XXlQ33POzXw6yQnCF15Ya3CY1Yonc
         vH+A==
X-Gm-Message-State: AOJu0YwyisG6OWmFYNls/j826oVPVoqtlnTARrVdRj6xr3Z2IMztGbJj
	hgq3LPavOP5mLNrng6hmu0bWjI182ZEgDlgklgEJl+MqfCPSNbIQ1scbAMO1kd6EB4ua6m5qBSG
	j5EWFTqyrWmnuvLgoMH9xyTKVHwm36a9sgpTCDAZqxlF3USEWLGtzV/Qxrv25bd8BwoWcf7oAdd
	oQAF6/QmorxKnm6F9XUXuq
X-Google-Smtp-Source: AGHT+IEKLcnBlfXCEZnWiDTG+YJp6KT62fKudpVjrrfb40aNCFwuzjTO5mRHdIpzfyTYKQVtbN+N6A==
X-Received: by 2002:a05:6a20:5530:b0:190:3037:351a with SMTP id ko48-20020a056a20553000b001903037351amr2426192pzb.41.1703305765227;
        Fri, 22 Dec 2023 20:29:25 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm2623397pjb.33.2023.12.22.20.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 20:29:24 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	ebiggers@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v8, 00/10] riscv: support kernel-mode Vector
Date: Sat, 23 Dec 2023 04:29:04 +0000
Message-Id: <20231223042914.18599-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_202928_082154_449CAE26 
X-CRM114-Status: GOOD (  18.05  )
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

VGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBmb3IgcnVubmluZyBWZWN0b3IgY29kZSBpbiBr
ZXJuZWwgbW9kZS4KQWxvbmcgd2l0aCB0aGUgc3Vwb3J0LCB3ZSBhZGQgc29tZSBWZWN0b3Igb3B0
aW1pemVkIHJvdXRpbmVzLiBBbmQKcHJvdmlkZSBhIHNpbXBsZSB0aHJlc2hvbGQgdG8gZGVjaWRl
IHdoZW4gdG8gcnVuIHRoZSB2ZWN0b3JpemVkCmZ1bmN0aW9ucy4KClRoaXMgc2VyaWVzIGlzIGNv
bXBvc2VkIGJ5IDMgcGFydHM6CiBwYXRjaCAxLTQ6IGFkZHMgYmFzaWMgc3VwcG9ydCBmb3Iga2Vy
bmVsLW1vZGUgVmVjdG9yCiBwYXRjaCA1LTY6IGluY2x1ZGVzIHZlY3Rvcml6ZWQgY29tbW9uIGxp
YnJhcnkgcm91dGluZXMgaW50byB0aGUga2VybmVsCiBwYXRjaCA3LTEwOiBwcm92aWRlcyBzb21l
IGNvZGUgcmVmYWN0b3JzIGFuZCBzdXBwb3J0IGZvciBwcmVlbXB0aWJsZQogICAgICAgICAgICAg
a2VybmVsLW1vZGUgVmVjdG9yLgoKVGhpcyBzZXJpZXMgY2FuIGJlIG1lcmdlZCBpbmNyZW1lbnRh
bGx5IGlmIHdlIGZlZWwgYW55IHBhcnQgb2YKezF+NCwgNX42LCA3fjEwfSBpcyBtYXR1cmUgZW5v
dWdoLgoKVGhpcyBwYXRjaCBpcyB0ZXN0ZWQgb24gYSBRRU1VIHdpdGggViBhbmQgdmVyaWZpZWQg
dGhhdCBib290aW5nLCBub3JtYWwKdXNlcnNwYWNlIG9wZXJhdGlvbnMgYWxsIHdvcmsgYXMgdXN1
YWwgd2l0aCB0aHJlc2hvbGRzIHNldCB0byAwLiBBbHNvLAp3ZSB0ZXN0IGJ5IGxhdW5jaGluZyBt
dWx0aXBsZSBrZXJuZWwgdGhyZWFkcyB3aGljaCBjb250aW51b3VzbHkgZXhlY3V0ZXMKYW5kIHZl
cmlmaWVzIFZlY3RvciBvcGVyYXRpb25zIGluIHRoZSBiYWNrZ3JvdW5kLiBUaGUgbW9kdWxlIHRo
YXQgdGVzdHMKdGhlc2Ugb3BlcmF0aW9uIGlzIGV4cGVjdGVkIHRvIGJlIHVwc3RyZWFtIGxhdGVy
LgoKdjcgb2YgdGhpcyBzZXJpZXMgY2FuIGJlIGZvdW5kIGF0IFsxXQoKTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMjIxMTM0MzE4LjI4MTA1LTEtYW5keS5jaGl1QHNpZml2
ZS5jb20vCgpQYXRjaCBzdW1tYXJ5OgogLSBVcGRhdGVkIHBhdGNoZXM6IDEsIDIsIDMsIDUsIDEw
CiAtIE5ldyBwYXRjaDogbm9uZQogLSBVbmNoYW5nZWQgcGF0Y2g6IDQsIDYsIDcsIDgsIDkKIC0g
RGVsZXRlZCBwYXRjaDogbm9uZQoKQ2hhbmdlbG9nIHY4OgogLSBBZGRyZXNzIGJ1aWxkIGZhaWwg
b24gbm8tbW11IGNvbmZpZwogLSBGaXggYnVpbGQgZmFpbCB3aXRoIFc9MQogLSBSZWZhY3RvciBw
YXRjaGVzICgxLCAyKSwgRXJpYwoKQ2hhbmdlbG9nIHY3OgogLSBGaXggYnVpbGQgZmFpbCBmb3Ig
YWxsbW9kY29uZmlnIGFuZCB0ZXN0IGJ1aWxkaW5nIHRoZSBzZXJpZXMgd2l0aAogICBhbGxtb2Rj
b25maWcvYWxseWVzY29uZmlnCgpDaGFuZ2Vsb2cgdjY6CiAtIFByb3ZpZGUgYSBtb3JlIHJvYnVz
dCBjaGVjayBvbiB0aGUgdXNlIG9mIG5vbi1wcmVlbXB0aWJsZSBWZWN0b3IuCiAtIEFkZCBLY29u
ZmlncyB0byBzZXQgdGhyZXNob2xkIHZhbHVlIGF0IGNvbXBpbGUgdGltZS4gKENoYXJsaWUpCiAt
IEFkZCBhIHBhdGNoIHRvIHV0aWxpemUga21lbV9jYWNoZV8qIGZvciBWIGNvbnRleHQgYWxsb2Nh
dGlvbnMuCiAtIFJlLXdyaXRlIGFuZCBhZGQgcHJlZW1wdGlibGUgVmVjdG9yLgoKQ2hhbmdlbG9n
IHY1OgogLSBSZWJhc2Ugb24gdG9wIG9mIHJpc2N2IGZvci1uZXh0ICg2LjctcmMxKQpDaGFuZ2Vs
b2cgdjQ6CiAtIFVzZSBrZXJuZWxfdl9mbGFncyBhbmQgaGVscGVycyB0byB0cmFjayB2ZWN0b3Ig
Y29udGV4dC4KIC0gUHJldmVudCBzb2Z0aXJxIGZyb20gbmVzdGluZyBWIGNvbnRleHQgZm9yIG5v
bi1wcmVlbXB0IFYKIC0gQWRkIHVzZXIgY29weSBhbmQgbWVtKiByb3V0aW5lcwoKQ2hhbmdlbG9n
IHYzOgogLSBSZWJhc2Ugb24gdG9wIG9mIHJpc2N2IGZvci1uZXh0ICg2LjYtcmMxKQogLSBGaXgg
YSBidWlsZCBpc3N1ZSAoQ29ub3IpCiAtIEd1YXJkIHZzdGF0ZV9zYXZlLCB2c3RhdGVfcmVzdG9y
ZSB3aXRoIHtnZXQscHV0fV9jcHVfdmVjdG9yX2NvbnRleHQuCiAtIFNhdmUgViBjb250ZXh0IGFm
dGVyIGRpc2FibGluZyBwcmVlbXB0aW9uLiAoR3VvKQogLSBSZW1vdmUgaXJxc19kaXNhYmxlZCgp
IGNoZWNrIGZyb20gbWF5X3VzZV9zaW1kKCkuIChCasO2cm4pCiAtIENvbW1lbnQgYWJvdXQgbmVz
dGluZyBWIGNvbnRleHQuCgpDaGFuZ2Vsb2cgdjI6CiAtIGZpeCBidWlsZCBpc3N1ZXMKIC0gRm9s
bG93IGFybSdzIHdheSBvZiBzdGFydGluZyBrZXJuZWwtbW9kZSBzaW1kIGNvZGU6CiAgIC0gYWRk
IGluY2x1ZGUvYXNtL3NpbWQuaCBhbmQgcmVuYW1lIG1heV91c2VfdmVjdG9yKCkgLT4KICAgICBt
YXlfdXNlX3NpbWQoKQogICAtIHJldHVybiB2b2lkIGluIGtlcm5lbF92ZWN0b3JfYmVnaW4oKSwg
YW5kIEJVR19PTiBpZiBtYXlfdXNlX3NpbWQoKQogICAgIGZhaWxzCiAtIENoYW5nZSBuYW1pbmcg
c2NoZW1lIGZvciBmdW5jdGlvbnMvbWFjcm9zIChDb25vcik6CiAgIC0gcmVtb3ZlIEtNVgogICAt
ICdzL3J2di92ZWN0b3IvJwogICAtICdzL1JJU0NWX0lTQV9WX1BSRUVNUFRJVkVfS01WL1JJU0NW
X0lTQV9WX1BSRUVNUFRJVkUvJwogICAtICdzL1RJRl9SSVNDVl9WX0tNVi9USUZfUklTQ1ZfVl9L
RVJORUxfTU9ERS8nCgpBbmR5IENoaXUgKDgpOgogIHJpc2N2OiB2ZWN0b3I6IG1ha2UgVmVjdG9y
IGFsd2F5cyBhdmFpbGFibGUgZm9yIHNvZnRpcnEgY29udGV4dAogIHJpc2N2OiBzY2hlZDogZGVm
ZXIgcmVzdG9yaW5nIFZlY3RvciBjb250ZXh0IGZvciB1c2VyCiAgcmlzY3Y6IGxpYjogdmVjdG9y
aXplIGNvcHlfdG9fdXNlci9jb3B5X2Zyb21fdXNlcgogIHJpc2N2OiBsaWI6IGFkZCB2ZWN0b3Jp
emVkIG1lbSogcm91dGluZXMKICByaXNjdjogdmVjdG9yOiBkbyBub3QgcGFzcyB0YXNrX3N0cnVj
dCBpbnRvCiAgICByaXNjdl92X3ZzdGF0ZV97c2F2ZSxyZXN0b3JlfSgpCiAgcmlzY3Y6IHZlY3Rv
cjogdXNlIGEgbWFzayB0byB3cml0ZSB2c3RhdGVfY3RybAogIHJpc2N2OiB2ZWN0b3I6IHVzZSBr
bWVtX2NhY2hlIHRvIG1hbmFnZSB2ZWN0b3IgY29udGV4dAogIHJpc2N2OiB2ZWN0b3I6IGFsbG93
IGtlcm5lbC1tb2RlIFZlY3RvciB3aXRoIHByZWVtcHRpb24KCkdyZWVudGltZSBIdSAoMik6CiAg
cmlzY3Y6IEFkZCBzdXBwb3J0IGZvciBrZXJuZWwgbW9kZSB2ZWN0b3IKICByaXNjdjogQWRkIHZl
Y3RvciBleHRlbnNpb24gWE9SIGltcGxlbWVudGF0aW9uCgogYXJjaC9yaXNjdi9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgIHwgIDQ2ICsrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Fz
bS1wcm90b3R5cGVzLmggfCAgMjcgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNv
bW1vbi5oICAgfCAgMTcgKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggICAg
ICB8ICAzOSArKysrLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zaW1kLmggICAgICAgICAgIHwg
IDY0ICsrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCAgICB8ICAg
MiArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oICAgICAgICAgfCAxMDMgKysrKysr
KysrLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmggICAgICAgICAgICB8ICA2OCArKysr
KysrKwogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAxICsKIGFy
Y2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAgICAgICB8ICAgOCArCiBhcmNoL3Jpc2N2
L2tlcm5lbC9rZXJuZWxfbW9kZV92ZWN0b3IuYyAgfCAyMTkgKysrKysrKysrKysrKysrKysrKysr
KysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICAgICAgfCAgMTMgKy0KIGFy
Y2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jICAgICAgICAgICAgICB8ICAgNyArLQogYXJjaC9yaXNj
di9rZXJuZWwvc2lnbmFsLmMgICAgICAgICAgICAgIHwgICA3ICstCiBhcmNoL3Jpc2N2L2tlcm5l
bC92ZWN0b3IuYyAgICAgICAgICAgICAgfCAgNTAgKysrKystCiBhcmNoL3Jpc2N2L2xpYi9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgfCAgMTAgKy0KIGFyY2gvcmlzY3YvbGliL21lbWNweV92ZWN0
b3IuUyAgICAgICAgICB8ICAyOSArKysrCiBhcmNoL3Jpc2N2L2xpYi9tZW1tb3ZlX3ZlY3Rvci5T
ICAgICAgICAgfCAgNDkgKysrKysrCiBhcmNoL3Jpc2N2L2xpYi9tZW1zZXRfdmVjdG9yLlMgICAg
ICAgICAgfCAgMzMgKysrKwogYXJjaC9yaXNjdi9saWIvcmlzY3Zfdl9oZWxwZXJzLmMgICAgICAg
IHwgIDcwICsrKysrKysrCiBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzLlMgICAgICAgICAgICAgICAg
fCAgMTAgKysKIGFyY2gvcmlzY3YvbGliL3VhY2Nlc3NfdmVjdG9yLlMgICAgICAgICB8ICA1MCAr
KysrKysKIGFyY2gvcmlzY3YvbGliL3hvci5TICAgICAgICAgICAgICAgICAgICB8ICA4MSArKysr
KysrKysKIDIzIGZpbGVzIGNoYW5nZWQsIDk3NyBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMo
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NpbWQuaAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmgKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9rZXJuZWxfbW9kZV92ZWN0b3IuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3YvbGliL21lbWNweV92ZWN0b3IuUwogY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3YvbGliL21lbW1vdmVfdmVjdG9yLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Jpc2N2L2xpYi9tZW1zZXRfdmVjdG9yLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jp
c2N2L2xpYi9yaXNjdl92X2hlbHBlcnMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
bGliL3VhY2Nlc3NfdmVjdG9yLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2xpYi94
b3IuUwoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
