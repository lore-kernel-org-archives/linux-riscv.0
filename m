Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C093C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 22:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oT8zX+7YJ6lS8Jmmo+vKXrUSNR27up16db/Y/3sUI+w=; b=l5jJzzCJ6paqWg
	qW7RpTgG4z0Kunsg7nPLk0MMo4HYg6YT8Vn5PbR9iRD5yUpvaGZ/k79fmIsWftbfkRdIcQvIHy2Ck
	xwJcgYTPshhu406aZH+xLJPOc5GtJm7S/QECaK++koaNDviLQCUaKqVXMhs60+PzagBRKivfqokut
	QvtiWCrMYc5Lkzk2uw+7h1Y1MK8noiivOiMt42Ntk1DtzEv70ukmBHvfaZuYIKy6kmzL6kU81IalW
	1MqCoT9JjoWVH+av7gYH4DOCLOQ3t2Um1Qr25cOd58GQ/7WCwsoXutR/gW71k3MGadguIm8MKa/eN
	al9e3zey/zwkOaXg+0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDY1F-00GB40-0U;
	Wed, 13 Dec 2023 22:47:57 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDY1B-00GB3F-1e
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 22:47:55 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-203061bbf3aso1566467fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 14:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702507672; x=1703112472; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jd0FCgelTTfELHf4+xN904J8lDue1JGGAZgJGPEpLc=;
        b=QxH7GABHPEHVniQXRJgFP05LQssyOYuH8BBxTE+Laxf5y8Vf4/onvxizmPATZYSWx/
         3mP2BzgxlLnm+KN9lGiFaaM1bHxrOx2/Ak36e1yi5NvHO+acLF0UoVz0XYYKCMqGylyF
         slzvZfOTChjNmNO0TEmDnU2JCK5qBwaRtx43cYB6GPGoxRYXYrNPS0kH9evMgXydwX9V
         hZm0mx4FVv3BxL3NiIS9VhLkmRQPMfuFw2yt3ZJFT5ZxEpBGtp0g88ZzXsnderB/+UGT
         URz2UJBWN1Z8HVvIcLivKwHKtYdt035dISv5FM49QqKGpZzvui7cL7x1LNFiB+QUtXtw
         WvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507672; x=1703112472;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jd0FCgelTTfELHf4+xN904J8lDue1JGGAZgJGPEpLc=;
        b=cBCfTSB5JrrPwvQ/sLtGWauv8ltYmtd6RCMhw7jTZA8LrqYSy7fd+fyksa6bL1OAt0
         /8LCcAczYebQNyZti3BEjdYIlsDAYXbHfD7Stkl+s/8hU3ZhPVHUevDdAYMoRNLyZcbt
         O/cQC1s4EMkxuP9oxfh2ww8sqz/dWFiXXaeu9CM0oSsYg01LmEVdM7GT7Uqdqvs4p74Y
         6rUZDxj/L5iBYPmrCjbl8z41AzbCTQDQkSBWLk5Ue60NM0kGlf3GgCYTfzx9TKG2Zan0
         i/+iWjdT2iVTw/0dJ5TwTdluKzQmj3Z1yLCXp5qCunf/B742PjqSAqR69sBb5CR043RQ
         jdfg==
X-Gm-Message-State: AOJu0Yz0RTfNh+ZxwjmOODDXPLpATklTMR+4Hze8AYJXi2V01ehzYB3d
	V2YsebPQfECETezZaXrfvGWgqw==
X-Google-Smtp-Source: AGHT+IEI/iMw+aM52TxmVlNAm6tlxyE95Jk7Y5bCZtOELwJ+3p+SBg1OfH9FjwiYVr1FIIAYA3ET6A==
X-Received: by 2002:a05:6870:3854:b0:1fb:251b:6f82 with SMTP id z20-20020a056870385400b001fb251b6f82mr8540545oal.55.1702507672335;
        Wed, 13 Dec 2023 14:47:52 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id bk21-20020a056830369500b006d855e2c56csm2375157otb.31.2023.12.13.14.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:47:51 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Wed, 13 Dec 2023 14:47:46 -0800
Message-Id: <20231213-fencei-v3-0-b75158238eb7@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJI0emUC/12MQQ7CIBBFr9KwFsMMpq2uvIdxUehgZyEYMETTc
 Hdpo8a4fD//vVkkikxJHJpZRMqcOPgKetMIOw3+QpLHygIVagDopCNviaXbu1aNXb9zgxL1fIv
 k+LGGTufKE6d7iM+1m2FZ3wnETyKDVNKQVT2ANQh4jJxDYm+3NlzFUsn4Y2r1NbGaaE2LejBgw
 P2ZpZQXYFRh/9kAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702507670; l=1448;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/YlQ8qL8rFNrU4HyEupJRRntb59YBilc0ngS06eVjfE=;
 b=jwleU1mQbFQCVc8gBuGN2sz2YjwjLX2t4LgnF5VYuL/LUu7TfGfh9AgGss4pWe4XF+aafVadm
 1D/TRXdPTnKCmqHPKcxuSadEhpKsYxnHp3FyETHGk34qPGGwR6XIfO6
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_144753_776761_65AB9363 
X-CRM114-Status: UNSURE (   8.11  )
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

SW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgaWNhY2hlIGZsdXNoaW5nIGJ5IGNyZWF0aW5nIGEg
bmV3IHByY3RsIGZsYWcKUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFguIFRoZSBpbnRlcmZh
Y2UgaXMgbGVmdCBnZW5lcmljIHRvIGFsbG93CmZvciBmdXR1cmUgZXhwYW5zaW9ucyBzdWNoIGFz
IHdpdGggdGhlIHByb3Bvc2VkIEogZXh0ZW5zaW9uIFsxXS4KCkRvY3VtZW50YXRpb24gaXMgYWxz
byBwcm92aWRlZCB0byBleHBsYWluIHRoZSB1c2UgY2FzZS4KClsxXSBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3Ytai1leHRlbnNpb24KClNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lu
cyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQpDaGFuZ2VzIGluIHYzOgotIENoZWNrIGlmIHZh
bHVlIGZvcmNlX2ljYWNoZV9mbHVzaCBzZXQgb24gdGhyZWFkLCByYXRoZXIgdGhhbiBpbiBtbQog
IHR3aWNlIChDbMOpbWVudCkKLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjMxMTMwLWZlbmNlaS12Mi0wLTJjYjYyM2FiMWIxZkByaXZvc2luYy5jb20KCkNoYW5nZXMg
aW4gdjI6Ci0gRml4IGtlcm5lbC1kb2MgY29tbWVudCAoQ29ub3IpCi0gTGluayB0byB2MTogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEyMi1mZW5jZWktdjEtMC1iZWMwODExY2IyMTJA
cml2b3NpbmMuY29tCgotLS0KQ2hhcmxpZSBKZW5raW5zICgyKToKICAgICAgcmlzY3Y6IEluY2x1
ZGUgcmlzY3Zfc2V0X2ljYWNoZV9mbHVzaF9jdHggcHJjdGwKICAgICAgZG9jdW1lbnRhdGlvbjog
RG9jdW1lbnQgUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFggcHJjdGwKCiBEb2N1bWVudGF0
aW9uL2FyY2gvcmlzY3YvY21vZHgucnN0IHwgOTggKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9pbmRleC5yc3QgfCAgMSArCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tdS5oICAgICAgIHwgIDIgKwogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wcm9jZXNzb3IuaCB8ICA2ICsrKwogYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMg
ICAgICAgICB8IDM3ICsrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L21tL2NvbnRleHQuYyAgICAg
ICAgICAgIHwgIDggKystLQogaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggICAgICAgICB8ICAz
ICsrCiBrZXJuZWwvc3lzLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrCiA4IGZpbGVz
IGNoYW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21t
aXQ6IGI4NWVhOTVkMDg2NDcxYWZiNGFkMDYyMDEyYTRkNzNjZDMyOGZhODYKY2hhbmdlLWlkOiAy
MDIzMTExNy1mZW5jZWktZjlmNjBkNzg0ZmEwCi0tIAotIENoYXJsaWUKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
