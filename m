Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECE3C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDT7TNcNnajlbG9tuSSHdW//t6PFpxXZf3+gFKbsSPQ=; b=La01an3KywPkTI
	RsEZlXE1K1EI0oXdJ1KbwQGX9ZxYlBV9p31q7AF72mIPXrPhjy4cD3J+sky4xb1CyP2gTpnPy2IrC
	JCxYlatiXBjWIgD65eGMRj4G5sYsn9656gPBG3TUxgEby+suSBGN97WpkowLfOwCOIELIo1ZdBNpz
	Br5225kEHDLXg9fPybxu7DIelfPaWbe3yGQuzdcrZXlAxEiS2Gr1g2xbyfT0zmNDZGEBnY7OzkbCb
	mdbBFAmQDER3ITy/Bcvlqy9u8FyyErbILr69tB9GKdRsrlAkquRuymHl9XpIoOUHpD0YkeTOQJF/D
	S4Bk6F+ztySrBoCY9PsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmg-00000009zJN-2MnO;
	Wed, 27 Mar 2024 16:05:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmR-00000009zAx-2DvE
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 16:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=o/A8S6GwPVeRQh4mUyUZHiHi/w/+o4RQ1PPE/E2MAhE=; b=iLtlorDuIuHgNcRK8ItTt1YztN
	O2o/58RFRCWtonYdyQt4rwhwsaBdCzqOJ/mzDt1pn5QpPygyRU5A3GT4k5y1XlRu7c2IIM2BUQ88U
	hr05rtClnpWxwwl36Vt/O0gNmuR7jmqUNvb1j5+5Y5uQRI2H9yPowsIUpRHC9lqvQ8pvjgdrbjnZc
	5VQD45ibl1fJK3yJMyEnsiYuzG6Vu+LJoJJtFtONwPQjJcMDgdy0DXVPVOMcCjxTbfJnvAWHjwzod
	JFzjrkW1PGrNYBmzhN7059cjKlzlKEIxmiUbLgrriEmlKYDkt73JqBjFz7OU/mq5qws2N8IzZozfr
	K7e2BHnQ==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmM-00000000MSr-1PMh
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:05:34 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e0f2798b47so83525ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 09:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711555526; x=1712160326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/A8S6GwPVeRQh4mUyUZHiHi/w/+o4RQ1PPE/E2MAhE=;
        b=BRvqOdTLK2kCzyHKepDBGUowwi9vEN3gVmgt4U3c7q/hy4ekyJVDKkxWJGtsJ1LyGm
         MFg0RiplUtCNFnb2RDWbp6TGJ6IO0Sa/co4sXFdKfgZPnFc7Oq+vi0Uq8OQW7rXVEsgg
         WpKl5iKQiNA+4O302j3mh4I04Q49tlhwh4qIBZ/Ab8UewTWv3QnHhups/fL7JTV7PIeR
         8VZzZAT1/ibyC5bLtUpUtGN1iTNzNPJkstVBQR1n5cfm0xjWpGvjjPaCNnTWw+2Xg6gD
         RmKag8fFhAV2x4cSmCI8hbeG5NwqLIby1TAppORh10ZAKT3TSubt++KrAlLT9QRQfhgo
         vHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555526; x=1712160326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/A8S6GwPVeRQh4mUyUZHiHi/w/+o4RQ1PPE/E2MAhE=;
        b=oPwp3JJKYHHm9PRLSHmPiq2gJZFZMPWmKCkKDkiDL1QKKA696XLYHvwCKMMEHk+Xgq
         ffVQ3mlDhFWNCkItAmOXnGYFUV7Og+hTjthZwOHG1LSdqZD1wxZ/ClK/+KiOR1HD134n
         IafArqDCPa5xSXIthlLIytkp2/rdAtmUCtXhvumHrjkNgOFnYew0dvt5i0O8pjcnmOwb
         cAvWgCKgucTrLkuP8B27D9XsZVPT4t0HYNnZTE5HH9bC6M0sIEhICYdGwJkw5YTOKqxw
         DDWNYwfXFe+6KFc3qd4TsF4UbqUYd6HsgiEaHSVpAeHMPq7nhFHk4ElGlAxjJEZBexH4
         /Hjw==
X-Forwarded-Encrypted: i=1; AJvYcCVVaKOKa2Rpu+5Qd0Igh7BsuQ2/7p3mTCmKPnoOhqoEocdedbAUfFXIYeBMUeeCcMiEPGjfmMQ7On3o6nxjMTuQxhKoJ4M2Zs/VoCkwcLDi
X-Gm-Message-State: AOJu0YyAELLfZn7v+0sp/bibzBzWYrctyW2GwzpU/6N2KAxzvttAxcCY
	lRcHU55rLhVmleoQgJuefUiTeadB2LwB1/6ljDM9EbQO3ngEBCQw9nb0twhJ5vI=
X-Google-Smtp-Source: AGHT+IH/cUxMi1ZJe1xxd7wZiLZTo1eYwqccL1pn+6fDaFGtQ6Q1+BMpEoTMKbn4C0h/HXhupBeb4Q==
X-Received: by 2002:a17:902:cf02:b0:1e0:e8b5:3225 with SMTP id i2-20020a170902cf0200b001e0e8b53225mr41189plg.12.1711555526538;
        Wed, 27 Mar 2024 09:05:26 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b001e14807f9cesm1718226plb.125.2024.03.27.09.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:05:26 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 3/7] riscv: kprobes: Use patch_text_nosync() for insn slots
Date: Wed, 27 Mar 2024 09:04:42 -0700
Message-ID: <20240327160520.791322-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327160520.791322-1-samuel.holland@sifive.com>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_160530_525832_3DD2C0A8 
X-CRM114-Status: GOOD (  10.57  )
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

VGhlc2UgaW5zdHJ1Y3Rpb25zIGFyZSBub3QgeWV0IHZpc2libGUgdG8gdGhlIHJlc3Qgb2YgdGhl
IHN5c3RlbSwKc28gdGhlcmUgaXMgbm8gbmVlZCB0byBkbyB0aGUgd2hvbGUgc3RvcF9tYWNoaW5l
KCkgZGFuY2UuCgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNv
bT4KLS0tCgpDaGFuZ2VzIGluIHYyOgogLSBSZW1vdmUgdW5uZWNlc3NhcnkgbGluZSB3cmFwcGlu
ZwoKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgfCA1ICsrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9i
ZXMva3Byb2Jlcy5jCmluZGV4IDJmMDhjMTRhOTMzZC4uZmVjYmJjZjQwYWMzIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCisrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3Byb2Jlcy9rcHJvYmVzLmMKQEAgLTI4LDkgKzI4LDggQEAgc3RhdGljIHZvaWQgX19rcHJv
YmVzIGFyY2hfcHJlcGFyZV9zc19zbG90KHN0cnVjdCBrcHJvYmUgKnApCiAKIAlwLT5haW5zbi5h
cGkucmVzdG9yZSA9ICh1bnNpZ25lZCBsb25nKXAtPmFkZHIgKyBvZmZzZXQ7CiAKLQlwYXRjaF90
ZXh0KHAtPmFpbnNuLmFwaS5pbnNuLCAmcC0+b3Bjb2RlLCAxKTsKLQlwYXRjaF90ZXh0KCh2b2lk
ICopKCh1bnNpZ25lZCBsb25nKShwLT5haW5zbi5hcGkuaW5zbikgKyBvZmZzZXQpLAotCQkgICAm
aW5zbiwgMSk7CisJcGF0Y2hfdGV4dF9ub3N5bmMocC0+YWluc24uYXBpLmluc24sICZwLT5vcGNv
ZGUsIDEpOworCXBhdGNoX3RleHRfbm9zeW5jKHAtPmFpbnNuLmFwaS5pbnNuICsgb2Zmc2V0LCAm
aW5zbiwgMSk7CiB9CiAKIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBhcmNoX3ByZXBhcmVfc2ltdWxh
dGUoc3RydWN0IGtwcm9iZSAqcCkKLS0gCjIuNDMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
