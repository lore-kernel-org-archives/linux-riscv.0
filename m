Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6E6C02196
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 01:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMOrut6R4TAN79yO8IxtUtFdOzZL3mTEbv1n5iblEg8=; b=AkJsJd/kzGkauz
	bdDtbaQamQc3G69H3YHBGliCVkFRsHtQUKZDMyOBjQ8AD0SFy54K3MEfviUce5yduc5xt4h3K4vOm
	eNtXpBBiE/5TJ+Z3+duqNNvBE15L+QfJ/xGJepVAzZhONf5aSK9k38KFv8IdfEQYL+3dhxXEDG+Ms
	Og7VxG/EpX0ODdkacZlvsEzNADRKYniYYAVORkgobGJpR0OjiySvXujEXVXtyXNt/XfVTnYlvtpfl
	+pzOdSGSi1gkg7d/It1N+2tXzjZyUOsuYklx/DPuq+I1O6VWiYhsgloLPmPw1g3KuVMs0CrbI15xf
	+RJCRF/oNdAFS2pmYTxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7f-000000021gz-3EaE;
	Wed, 05 Feb 2025 01:22:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7d-000000021e7-16l3
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:34 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-219f8263ae0so117685335ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718552; x=1739323352; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5uI84SXblQRDID2BHNWhhHsRc7xVUDdoiei4kS9c/0=;
        b=RhXBYP9qzvZ6TTO6Ci4knHnCDQFf54PjjQFzqtKO8tffvPV5/XaIfc7jAgW/h7raaz
         HoDx/lSGtz2Ak0rbTnJEwZqMc+UG9zapvQHS5f8yU2sR9qqDw1dibbuLEAwR86ELKYXu
         jzSwu4Y58ap4xb+HoSb1HXzlgIVu9+PUaNjbrIPLlZdK0QOhfibBpES5SD0I8o+M9SoX
         KppLi8lN1FtEXZJOTM2PwgL0jraCvPsd9IwjaTGv+2m4hBSBPJj3s9A6/eo24L+5DPiY
         nkvkpt7sE6HpHegnx4JLWlR4bRZVu46/jPpMRCRGxLxx9x8PfJqCWpPAcRSIWYLWZ6Oi
         8Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718552; x=1739323352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5uI84SXblQRDID2BHNWhhHsRc7xVUDdoiei4kS9c/0=;
        b=g1oqgpBtIzZZREagK7pzbQTuEmTiykxHMI6nsSfH4FvsVUmDby3S8RITDZYN1FYOOX
         f3ohPvuOkjgPI0/CxbllMZKH7fcZ5ammRUk9EGqh52OcXMmXhiG8w+M/fPNP66H2gfIv
         AXHE+UV2//L3xDwANpN/QkYbUeh626vtPf4t4Hj1rPZ/v+eqWISdMYrocjdLoQZy/Pvn
         zNQKnVkwY/0uw0RV5pHTfFA54XlT8BQWqFTLyZiv0S5/vNjys3QFBA/68nA3fhvNm0YA
         Iees2Yp1+syCZTSd7BlpJen2cxGkflLhziU8Kj5vsPecHwV384n98nzFcW8ocs4l+DKK
         nfiw==
X-Forwarded-Encrypted: i=1; AJvYcCWmOeYSauojpOIgQCRii4l4WXqnnKGfitDHFybyNJqtT/BzuuZR2+hjT+5gAIPzhX1fR4vBpLOo8Lbgqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSMl2oI+S92P/Jpw0wj3rqSLIGL5pr8f0TXVqgFRtvcXmFs9nX
	BsydCEzA11Zkmw0uThwLqDKSj+K4vygeRFJXNvKQeSKVb9saqE4k2AGwIE+FhMcVd8xCFiITl40
	H
X-Gm-Gg: ASbGncutjhT0sjES+OqUc2Wj1aYBZq4yFPS0jNS90xwFuAbyziI3+YLHdqrSMQD+qwW
	bmVw6K6np+9jvksAbw9+ozep/cplLin0u5RP8z9s6L3ZysuNwix5xKNHs97VtOSzczXfmwAjXSC
	QIfBnHlLBFng/7EKVi3EO+sAy/p9Hkh3NGy1uxijA60hZobRzMTvX/Ix+xmJyCfHJwR7DBKO391
	sKBEMv90mc2sfgtEmtQffKtO13KF+teyHV6+3X0qYyXQlISreFymlxqiPQPAavJhgaYOI+LRfcf
	8qDI5reP3CkgIOntO6uVxyoT4g==
X-Google-Smtp-Source: AGHT+IFCF6Qyo3q2G3dGEoXnovMcbEOll06APDlJ/baKR1lUf1tJ5kFaxAt+4U15uatvwIepGIzY3g==
X-Received: by 2002:a05:6a21:6da4:b0:1d9:2705:699e with SMTP id adf61e73a8af0-1ede88106d4mr1669830637.7.1738718552107;
        Tue, 04 Feb 2025 17:22:32 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:31 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:22:07 -0800
Subject: [PATCH v9 20/26] riscv: Add Firmware Feature SBI extensions
 definitions
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-20-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_172233_306391_80F8F16C 
X-CRM114-Status: UNSURE (   9.86  )
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

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKQWRkIG5lY2Vzc2Fy
eSBTQkkgZGVmaW5pdGlvbnMgdG8gdXNlIHRoZSBGV0ZUIGV4dGVuc2lvbi4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKaW5kZXggM2QyNTA4
MjQxNzhiLi4yM2JmYjI1NGUzZjQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaApAQCAtMzUsNiArMzUsNyBA
QCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9FWFRfREJDTiA9IDB4NDQ0MjQzNEUsCiAJU0JJX0VY
VF9TVEEgPSAweDUzNTQ0MSwKIAlTQklfRVhUX05BQ0wgPSAweDRFNDE0MzRDLAorCVNCSV9FWFRf
RldGVCA9IDB4NDY1NzQ2NTQsCiAKIAkvKiBFeHBlcmltZW50YWxzIGV4dGVuc2lvbnMgbXVzdCBs
aWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFSVCA9IDB4
MDgwMDAwMDAsCkBAIC00MDEsNiArNDAyLDMxIEBAIGVudW0gc2JpX2V4dF9uYWNsX2ZlYXR1cmUg
ewogCiAjZGVmaW5lIFNCSV9OQUNMX1NITUVNX1NSRVRfWChfX2kpCQkoKF9fcmlzY3ZfeGxlbiAv
IDgpICogKF9faSkpCiAjZGVmaW5lIFNCSV9OQUNMX1NITUVNX1NSRVRfWF9MQVNUCQkzMQorLyog
U0JJIGZ1bmN0aW9uIElEcyBmb3IgRlcgZmVhdHVyZSBleHRlbnNpb24gKi8KKyNkZWZpbmUgU0JJ
X0VYVF9GV0ZUX1NFVAkJMHgwCisjZGVmaW5lIFNCSV9FWFRfRldGVF9HRVQJCTB4MQorCitlbnVt
IHNiaV9md2Z0X2ZlYXR1cmVfdCB7CisJU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcJCT0g
MHgwLAorCVNCSV9GV0ZUX0xBTkRJTkdfUEFECQkJPSAweDEsCisJU0JJX0ZXRlRfU0hBRE9XX1NU
QUNLCQkJPSAweDIsCisJU0JJX0ZXRlRfRE9VQkxFX1RSQVAJCQk9IDB4MywKKwlTQklfRldGVF9Q
VEVfQURfSFdfVVBEQVRJTkcJCT0gMHg0LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX1NUQVJU
CQk9IDB4NSwKKwlTQklfRldGVF9MT0NBTF9SRVNFUlZFRF9FTkQJCT0gMHgzZmZmZmZmZiwKKwlT
QklfRldGVF9MT0NBTF9QTEFURk9STV9TVEFSVAkJPSAweDQwMDAwMDAwLAorCVNCSV9GV0ZUX0xP
Q0FMX1BMQVRGT1JNX0VORAkJPSAweDdmZmZmZmZmLAorCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VS
VkVEX1NUQVJUCQk9IDB4ODAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX0VORAkJ
PSAweGJmZmZmZmZmLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVAkJPSAweGMwMDAw
MDAwLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9FTkQJCT0gMHhmZmZmZmZmZiwKK307CisK
KyNkZWZpbmUgU0JJX0ZXRlRfR0xPQkFMX0ZFQVRVUkVfQklUCQkoMSA8PCAzMSkKKyNkZWZpbmUg
U0JJX0ZXRlRfUExBVEZPUk1fRkVBVFVSRV9CSVQJCSgxIDw8IDMwKQorCisjZGVmaW5lIFNCSV9G
V0ZUX1NFVF9GTEFHX0xPQ0sJCQkoMSA8PCAwKQogCiAvKiBTQkkgc3BlYyB2ZXJzaW9uIGZpZWxk
cyAqLwogI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCgotLSAKMi4zNC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
