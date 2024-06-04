Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028FEC25B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TapXelcm+7hEn2bhq7Xg7WYuymYVH/DYgQg+KhbPGp4=; b=bu6mDJ7I3aIPn4
	MzbV43eddB2YMISd9I7RSFzF7u7w9pvlLlt7daiF1DywtAGja6s5BZuW1quNJq0QBBEyF7NCM2H59
	11C1xQL/roHO1qsbAotdFxjb10le6LYBljrdsfIbg4R08xZS8Dutael4lLG4st1VC+sXBWPOV5vzP
	xUJb/XUe7R0Ts9+PSGMQFo3EGLiE8fKHBjZzMp3IlE0F5pnUF0xMg89Rn3T8fdSrH9sBpUgVRqblD
	P33jTwdHENV6h2+/LXQSk20pFqOJrGS42gl/yOF168ZmLkl5GAS4LR7tMXKBucloUT9hJCK2zGUDt
	Qps11r3BY5UUOxvplmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETbQ-00000002NLT-31m3;
	Tue, 04 Jun 2024 12:49:24 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETbO-00000002NIr-0fsc
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:49:23 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-6c8b6e40ea6so337883a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505360; x=1718110160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hg13op520E0l7vmsGSXJjwrEXGfoFkLadNxxD6X23VY=;
        b=PZ/YnVOeh2yQyd+kdeWSbIKAVEfJoj2HXorY+8Kqgl/lhUGPvW9Y9fx/P5rWDtp3ZL
         YwwVOgLtxFakC0n82yPJWHzddgEzn3JcRuV45V8KTaU0kcWEVM//P1xnDXkSyT1n4quD
         j7KOb0PcQNFWP2Cxyl3f3UTzpvLf5dGWRMvYKNF9WyRr+62d1nT1zmV5NKeqSP+ybUCO
         2MSVjN2RC7KElAGKgJjbJU+oDrXfeAX0pc/hBk7SGxQ89YsFliQDrrwwdM8sYIBQBZVF
         sLlICTYX+MlqLsH+1hR4Ms/pftSoultqgZgT4gkPG72VrsQGalUHXaFKAAjo74eIkC3z
         4s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505360; x=1718110160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hg13op520E0l7vmsGSXJjwrEXGfoFkLadNxxD6X23VY=;
        b=d+sHnWZl0CKcZfZW1DHeJQ6+UZYzd0AYwFa08zQ2Qf8QEKXeGF7TKtgsz7MdxYWAdm
         agvd3ULx36/oXbHRY/3TXAdJGJDXOiH9Hczg0iwysaVTLyh1GD0gw8GzvZjUJ4V8s1Qj
         WF242aDFs16X/Q7qlGrzrWe6AoUwsnqj01+Oj3rpuj6wRrNN9mnCBFiPI0s0ccsf18PI
         6IKhxdxAmEIG0seNSKnanFINCZ3k7kamCYN+wZlgxPwJ2aYnQ7rZgq2VBb+n4Vk9Xhxs
         E8bkyQVKa8KfDvG+t27/VrthR3AvYHT2AzUS5BUA7DpvNxLcViwBYXm4uWeDWdMONfr5
         ui6g==
X-Forwarded-Encrypted: i=1; AJvYcCWEBnr4QQbmK08qWr8GZrAzjY9mjKs6NyYNr+W7zVcvNkabXb0LMtNs4b7WbVt3tDLv+1VCZZfizzytx0Ngj3VGAn0WbgO7SbO4zHU+m7Rh
X-Gm-Message-State: AOJu0Yx2WmT9QOB5YWEe6ZM6SIVJAtR8tScpazO/+KPtFf9AieOllkgf
	Es4KSwVIbHU81sUXcRXKb9yvvTbNGc8uNcFQCkL4p2KqNvLWBzStUnMbIUz1DW0=
X-Google-Smtp-Source: AGHT+IFjRaBoryIbYEQtignrxN6JqLYXY8gztujl1ilZT6KvEZR3UOMAvujw3x8ToyklOBgsdusl/Q==
X-Received: by 2002:a17:902:ecc6:b0:1f5:e796:f247 with SMTP id d9443c01a7336-1f6371ff41amr134960595ad.6.1717505360188;
        Tue, 04 Jun 2024 05:49:20 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:49:19 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 16/16] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Tue,  4 Jun 2024 14:45:48 +0200
Message-ID: <20240604124550.3214710-17-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054922_262343_B348B24C 
X-CRM114-Status: UNSURE (   9.57  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFpjbW9wIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0gc28gYWRk
IHRoaXMKZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWct
bGlzdC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDg2
NGE3MDFlZjZjMy4uMWE1NjM3YTZlYTFlIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCkBAIC02MCw2ICs2MCw3IEBAIGJvb2wgZmlsdGVy
X3JlZyhfX3U2NCByZWcpCiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0I6CiAJY2FzZSBLVk1fUkVHX1JJ
U0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VY
VF9aQ0Q6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9T
SU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Y6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9F
WFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ01PUDoK
IAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8
IEtWTV9SSVNDVl9JU0FfRVhUX1pGQToKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtW
TV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pGSDoKIAljYXNlIEtW
TV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVND
Vl9JU0FfRVhUX1pGSE1JTjoKQEAgLTQzMSw2ICs0MzIsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAq
aXNhX2V4dF9zaW5nbGVfaWRfdG9fc3RyKF9fdTY0IHJlZ19vZmYpCiAJCUtWTV9JU0FfRVhUX0FS
UihaQ0IpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkNEKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpDRiks
CisJCUtWTV9JU0FfRVhUX0FSUihaQ01PUCksCiAJCUtWTV9JU0FfRVhUX0FSUihaRkEpLAogCQlL
Vk1fSVNBX0VYVF9BUlIoWkZIKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpGSE1JTiksCkBAIC05NjAs
NiArOTYyLDcgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2EsIFpDQSksCiBLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHpjYiwgWkNCKSwKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUco
emNkLCBaQ0QpLAogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2YsIFpDRiksCitLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHpjbW9wLCBaQ01PUCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09O
RklHKHpmYSwgWkZBKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemZoLCBaRkgpOwogS1ZN
X0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6ZmhtaW4sIFpGSE1JTik7CkBAIC0xMDIxLDYgKzEwMjQs
NyBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7CiAJJmNvbmZpZ196
Y2IsCiAJJmNvbmZpZ196Y2QsCiAJJmNvbmZpZ196Y2YsCisJJmNvbmZpZ196Y21vcCwKIAkmY29u
ZmlnX3pmYSwKIAkmY29uZmlnX3pmaCwKIAkmY29uZmlnX3pmaG1pbiwKLS0gCjIuNDUuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
