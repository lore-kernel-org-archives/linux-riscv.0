Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BA4C48286
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 23:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Qq6fFj9726ey1hfWG/ryIKvNG2xtj7KDvQ7HmAPNyI=; b=hLvH2TOZSSi/tC
	CVNx9BfwMU64LfzIRkKW8vSroqpOlk1V6FFofAIw0LXe9e4o43Dox7lQbJRx49hqq+8KGKUa6cdE8
	W5a/f5MDKb6I2EDSIspIjN4S6f5BVzexAG/UBLCGope+xyRFhSE6+uyGIc8bvUkvjpBqSS+831jIT
	QyoJpgDEzjXc+WdND1huZ7DqsJX3ezen2qIOPN1gpeoptiaAdo8rODZLH8EdLmU1hw0RgFKOC/DQN
	XdO8XcyZJ3yCxCFaCMrtUekZBzUgeyBvVjDKOZTq2cwSvz5oSkFp1GBLaEMla8cO7+6ruk+BAw7Ps
	yr7RW5oPp3Bd+vpcXXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVgWC-00000009ekM-2KFI;
	Thu, 01 Feb 2024 23:30:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVgWA-00000009ejb-0hya
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 23:30:51 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ddc1b30458so1238008b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 15:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706830249; x=1707435049; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=12qhkQnAsKWLfzWt/2hyVMymoIBV11wZGrf2gJtkQrU=;
        b=mWKa0lySLnf61P2b4MFmMtRXjZedsyJcgQbgzO7Wrj//v8t2dNLqV5FLMDiDv3dN68
         5+NAmy0awu1wi3R8X7zW1PKUarGV7GYwm7T0JVjSWmzNdHoenfC64q+lga38sR8YzMxy
         tsbcr4USTi1ARo1eCROnqIK1JnHQvx7c3rJU/hYnXTKzL3kgtF7Vv+so/YyhQfJWHCaG
         2ms5pBSnO2MAfGMZJLXDwWbnap5MT6Gv5R6df6L0Lvz/UkgHcHtcHLBr9+ffdq/Nr88O
         TCDDkyFQq7f13yw+TFO2ms+E5Cr8nX0ALP5sGLm6aUR7LR5m206Lg5GcjJ6PxpU3AwTs
         pzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706830249; x=1707435049;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12qhkQnAsKWLfzWt/2hyVMymoIBV11wZGrf2gJtkQrU=;
        b=awS0XvffLy/Aoy4UIz4HnMLbGJxTNima52b3du6iWUqsjddKCd6jFfG1gccV9M4Lcc
         RvhrLQ+4tWDcQVrWdMjITJL4f+6BxyfUnQBlVrIqTdWqeAIcPq3yxzlPvBSynXzaV1KW
         ONZ80/F/hWkOBEULDd2mzJo5ZvIT4K3A1acSTAYirdTgitF1GLw2H14XvaMxsaUkpRXG
         GCtSx1nKFPyidyD079dAaOOHuKHOXOjq8qT8L4FyNpSxtxAASAMbqhc1Oln2KxMlgmUZ
         J/Uy41RsOlFCfosmddtGKlIxsIP6IUYg92nfkUfpaDsN06Qmg83vOChn/ZDbBck3W3OF
         qvmA==
X-Gm-Message-State: AOJu0Yw5vIv9XNctqDxev8L1XcTjg9rfWOY3sqbPBuGgiR7HnLSssmYI
	cae6nVE0y5vh/muGGBMeo8GCrQ/y5ZxagcEASwz8sHPqExULNyWZoc4NQ6Xmd6E=
X-Google-Smtp-Source: AGHT+IF7ynI89U+P641xK19eggYd+e8mqqBJoQ82q32/W6ptRo+YUyV7WujFf4BcPnUPElD0MpsMyw==
X-Received: by 2002:aa7:864e:0:b0:6db:dc74:d6e with SMTP id a14-20020aa7864e000000b006dbdc740d6emr722991pfo.17.1706830249170;
        Thu, 01 Feb 2024 15:30:49 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXelcoK7TkVoH3x8OSV3QeVFvdYCr6l/Q9iOkBxUge8YpYeqBO9GFcbMdhHnHv9djfPu1kYmNTH7iGZ6oRJAfONoT7GcKaVbykav6mnLn8J6pTAhXZ6kvj5dEo9WoooLAyKgsxRI69jyR9iU0G8p6kkLJ5UkTBXTJyQNZ2m4RXX//E8kDefNZ6ZX9vIIbesLJyDhv4v3MeWWHfnfDyTxgBSNIZgd1VeMdgHOA2ZO4LbcpZhvo74/86agisCQaysTJp5QJO5/9OGnOs=
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id y9-20020a62ce09000000b006db85b12036sm309673pfg.137.2024.02.01.15.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 15:30:48 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/2] riscv: Use CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 to set misaligned access speed
Date: Thu, 01 Feb 2024 15:30:44 -0800
Message-Id: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKQpvGUC/42NQQ6DIBBFr2JmXRoQSbWr3qMxBmHUSRQMNKSN4
 e6lnqCrn/cX7x0QMRBGuFcHBEwUybsC9aUCs2g3IyNbGGpeN1xIwSxFPa44bGVXmh3aYQ9+xMF
 4N9HMeCM1anlTUyehWPaAE73PwrMvvFB8+fA5g0n83v/dSTDOutYKpbAzVrePQMlHcuZq/AZ9z
 vkLJqLxkNEAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706830247; l=1557;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=F3p4nG4PxoO2+hFv8J8UCk8zaUW8suFbDDH7G9TcVVo=;
 b=NARzrW04LTpqMAM3P7yfuTSxgMpTSoFMZWJ8kPCTrMySzqbFmMcS9qw8DYu0VEOKE4p/vOCgo
 ihPlQsTAUfOCbPMshYXmpQ4/82TNfXnzydOlyRMcIC6YluJ/z/xFTwB
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_153050_411724_6161FCA4 
X-CRM114-Status: UNSURE (   7.57  )
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

SWYgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MgaXMgZW5hYmxlZCwgbm8g
dGltZSBuZWVkcyB0bwpiZSBzcGVudCBpbiB0aGUgbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgcHJv
YmUuIERpc2FibGUgdGhlIHByb2JlIGluIHRoaXMKY2FzZSBhbmQgc2V0IHJlc3BlY3RpdmUgdXNl
cyB0byAiZmFzdCIgbWlzYWxpZ25lZCBhY2Nlc3Nlcy4gT24gcmlzY3YsCnRoaXMgY29uZmlnIGlz
IHNlbGVjdGVkIGlmIFJJU0NWX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIGlzIHNlbGVjdGVk
LAp3aGljaCBpcyBkZXBlbmRlbnQgb24gTk9OUE9SVEFCTEUuCgpTaWduZWQtb2ZmLWJ5OiBDaGFy
bGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBN
b3ZlIGFyb3VuZCBkZWZpbml0aW9ucyB0byByZWR1Y2UgaWZkZWZzIChDbMOpbWVudCkKLSBNYWtl
IFJJU0NWX01JU0FMSUdORUQgZGVwZW5kIG9uICFIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUND
RVNTCiAgKENsw6ltZW50KQotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNDAxMzEtZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12MS0wLTk4ZDE1NWU5Y2Rh
OEByaXZvc2luYy5jb20KCi0tLQpDaGFybGllIEplbmtpbnMgKDIpOgogICAgICByaXNjdjogbGli
OiBJbnRyb2R1Y2UgaGFzX2Zhc3RfbWlzYWxpZ25lZF9hY2Nlc3MgZnVuY3Rpb24KICAgICAgcmlz
Y3Y6IERpc2FibGUgbWlzYWxpZ25lZCBhY2Nlc3MgcHJvYmUgd2hlbiBDT05GSUdfSEFWRV9FRkZJ
Q0lFTlRfVU5BTElHTkVEX0FDQ0VTUwoKIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1
cmUuaCAgICAgICAgICAgICAgfCAgMjIgKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vbWlzYWxp
Z25lZF9hY2Nlc3Nfc3BlZWQuaCB8ICAyOSArKysKIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgICAgICAgICAgICAgICAgICAgfCAyNTUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogYXJj
aC9yaXNjdi9rZXJuZWwvbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyAgICAgIHwgMjY1ICsrKysr
KysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAg
ICAgICAgICAgICAgfCAgIDQgKwogYXJjaC9yaXNjdi9saWIvY3N1bS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA3ICstCiA4IGZpbGVzIGNoYW5nZWQsIDMyMSBpbnNlcnRpb25zKCsp
LCAyNjUgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogNjYxMzQ3NmUyMjVlMDkwY2M5YWFk
NDliZTdmYTUwNGUyOTBkZDMzZApjaGFuZ2UtaWQ6IDIwMjQwMTMxLWRpc2FibGVfbWlzYWxpZ25l
ZF9wcm9iZV9jb25maWctMDQzYWVhMzc1ZjkzCi0tIAotIENoYXJsaWUKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
