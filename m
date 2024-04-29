Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE77C19F53
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8knsXM53V8Dif6Hy5TTpfWLzfXeHzpRQZwEV1kRbRt4=; b=3fIKATECfkU41J
	MHjKyiIXSmTnvP3mHY2FkfvpSUyEL0YfvayD6FR6yTMveSUXn/YXb9DeAu8hq4Xao0ziRUWLQqcBH
	uRHqzU9i4KVBwXmQAkahz6QEIQ+qvJjHZq7RKgmtmxLHncC5zTvyUG2ij4XdHeieH9D/deAG0xxQf
	f2lK2P8Q7heVuqBqfxPF73KYQDjM8Kp9NjPT5WDRtImHhzlIKO6FXwebGD8TSI3XHG3Ce5UjHhWhE
	2xw8s6PlkBlZqd1uXJ5N9JNK/+mfZuUGuFKRBPFn+lT06h8QSUdr6lm2h5NZGyiRPg217gVWqNvNr
	gape/+gUJlQH3LUDfTGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SdI-00000003IEm-247N;
	Mon, 29 Apr 2024 15:09:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SaV-00000003GQO-2ang
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 15:06:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-34a42d6e216so1009534f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 08:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403198; x=1715007998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HO1pUvU0QFRoXzPxVhmpQLKjzbVC9RycGYDtZgzkuNE=;
        b=Y2+kq4hmlepSz+aSlt0H+AawLrnlEJBNinCgMWmDYTTxCRGgLv/z4cDQ4GIOL+yfwQ
         FS6FwbD5SKGCrd5ZGRmZyHnRAd22r/YpoAy+l7PFyfJ3LSlZP7PMIhX3IlbkIktMnlNA
         lAxwffv1Xnx46z3V+47qOpIyc7nmCuGy8Q1sqJDLGjAPvQyMPTFkwgjTQScMeeV/YWqt
         jdg+5kVaUz+LUTcpLFGtIVLq+PWFS67HTBoLz46t4/FtGZMm4I3s34iVnFeni4nsiHt7
         7G5TYPrdvrHa0POeZhjev2grLZWK2ivZLNG4sugtsE2jXNCVOTO78dXwz26NbqYNjGZw
         7CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403198; x=1715007998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HO1pUvU0QFRoXzPxVhmpQLKjzbVC9RycGYDtZgzkuNE=;
        b=XF+VmKr2FzyiD5RBNJ2H8dF23E7akKZ2v3mnl0H0wkzefR9r0rH8kh5V+ZEJkLNO+E
         RmtV+I5PTfZ9e691cPbcnQwFaA9sTwwBacMK42gor0IyIzqrScFv9sxT7ShX8pzjEcg3
         cN4Vgyx8Cs1XaFCjXApO2SB9+7JtKoZtu30r79abBSPgVjZ6R5D6CqjGy+dSbSt4eWch
         hDKw2G7nBNUDWeUPwVoeHxyBxyrEJSiVqKc3/COy02r04rHQ2hRlGY7EmW9jgiWjl/CM
         X387EbxPaoBGB3Be2pJkrJ9gGx12uO5p4Q1t0TJ/6DNWHtx5cjqbK9wOGRp3gGfooLkP
         0z4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkdfiLMdcifhp4RJvkr52peuYfVJKxM6+rnYHJq1d/E66t9xgnIGzvwVa4f5InedYAr22ekTTZ5dfmk7VL0gUqE1mKQb7pRdlTn/g4hbSP
X-Gm-Message-State: AOJu0Yz1MTgSIWoH2qg6Rwxi0a9aVuEQALYgT2HnnRjyJac0/+A5QGPf
	7xVk46brApM4lvKz6opt+lV13xOiF85vsQElhTH1fw27SodvmOMQyn7ElJIJGRA=
X-Google-Smtp-Source: AGHT+IFiWS0wkp40gKDZAfxGi0j9Hx+FE3RcRH6ARajQSpFlwAjMjBZPph1zEUrLoQbUy23CTem/ew==
X-Received: by 2002:a05:600c:3b17:b0:418:2719:6b14 with SMTP id m23-20020a05600c3b1700b0041827196b14mr8083792wms.3.1714403198041;
        Mon, 29 Apr 2024 08:06:38 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:37 -0700 (PDT)
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
Subject: [PATCH v4 06/11] KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
Date: Mon, 29 Apr 2024 17:04:59 +0200
Message-ID: <20240429150553.625165-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429150553.625165-1-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080639_912211_886AB99D 
X-CRM114-Status: UNSURE (   9.00  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNpb25zIGZv
ciBHdWVzdC9WTSBzbwphZGQgdGhlc2UgZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3QgdGVzdC4K
ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CkFja2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDQwMTA3YmI2MTk3NS4uNjFjYWQ0NTE0MTk3
IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1s
aXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlz
dC5jCkBAIC01NSw2ICs1NSwxMCBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQogCWNhc2Ug
S1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkJLQzoKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdf
UklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCS1g6CiAJY2FzZSBLVk1fUkVH
X1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNB
X0VYVF9aQlM6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lT
QV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0E6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lT
QV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0I6
CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUg
fCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Q6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBL
Vk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Y6CiAJY2FzZSBL
Vk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklT
Q1ZfSVNBX0VYVF9aRkE6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUkVHX1JJ
U0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VY
VF9aRkhNSU46CkBAIC00MjEsNiArNDI1LDEwIEBAIHN0YXRpYyBjb25zdCBjaGFyICppc2FfZXh0
X3NpbmdsZV9pZF90b19zdHIoX191NjQgcmVnX29mZikKIAkJS1ZNX0lTQV9FWFRfQVJSKFpCS0Mp
LAogCQlLVk1fSVNBX0VYVF9BUlIoWkJLWCksCiAJCUtWTV9JU0FfRVhUX0FSUihaQlMpLAorCQlL
Vk1fSVNBX0VYVF9BUlIoWkNBKSwKKwkJS1ZNX0lTQV9FWFRfQVJSKFpDQiksCisJCUtWTV9JU0Ff
RVhUX0FSUihaQ0QpLAorCQlLVk1fSVNBX0VYVF9BUlIoWkNGKSwKIAkJS1ZNX0lTQV9FWFRfQVJS
KFpGQSksCiAJCUtWTV9JU0FfRVhUX0FSUihaRkgpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkZITUlO
KSwKQEAgLTk0NSw2ICs5NTMsMTAgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YmtiLCBa
QktCKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJrYywgWkJLQyk7CiBLVk1fSVNBX0VY
VF9TSU1QTEVfQ09ORklHKHpia3gsIFpCS1gpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
YnMsIFpCUyk7CitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjYSwgWkNBKSwKK0tWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemNiLCBaQ0IpLAorS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
Y2QsIFpDRCksCitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZiwgWkNGKSwKIEtWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemZhLCBaRkEpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
ZmgsIFpGSCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpmaG1pbiwgWkZITUlOKTsKQEAg
LTEwMDEsNiArMTAxMywxMCBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10g
PSB7CiAJJmNvbmZpZ196YmtjLAogCSZjb25maWdfemJreCwKIAkmY29uZmlnX3picywKKwkmY29u
ZmlnX3pjYSwKKwkmY29uZmlnX3pjYiwKKwkmY29uZmlnX3pjZCwKKwkmY29uZmlnX3pjZiwKIAkm
Y29uZmlnX3pmYSwKIAkmY29uZmlnX3pmaCwKIAkmY29uZmlnX3pmaG1pbiwKLS0gCjIuNDMuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
