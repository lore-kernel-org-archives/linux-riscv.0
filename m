Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3464DC54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpOiye4DTM76Dp3Nsn+C9B4l1z5yAuLX0VcwNwF+FSM=; b=iZSyhaP4s8T9Dj
	i8W9SkEjALyuzY6SCmir/d53iveBHLETMKSl9mR+zJTLbT6K8tSPZZUteFakd+TAn91nmZ5uMz1vp
	b4o30gwg1AlLBMTg5bDeTRwYiAV98hysAakvzwV3BHRbsGv/nHba8cLp3XG64jI7FO7FUM+Y/gEn5
	tNewfrJgcXaPpgIHSc39P8B1A9fmMdKh5XQ0ADQb3eF7BlVolwfFoKbAaGVxShqCN6HZshbNdaUFR
	JDRxsf3W/QwSbxkoYP9FY3tFYj79tadrTMSKUc4+/cSiCy7yyMuC5DSWrNrqESdmTnRMBEG5wYXqG
	MlQlW8qHRo/Omj2EV74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWa-00000003ZIJ-1siI;
	Fri, 23 May 2025 10:21:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWZ-00000003ZHS-1KGc
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 10:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=; b=RNYjftu+qglwryGK5aEK4ZPwyW
	5KZNlPPfzSLkiOem/opgYoF5fyOaMvI5WHhTHqpdFUmxeQ6ytw/4tZWF+Znp+jwVi/VLWlUF5fsdY
	TQ0mNgz5pmA1Lh6TBez05L3IisEBEuxsE+6lNaOq/6Ka3LNUxW4F92jQqJAToZmRyFrg1tLzouiH9
	I3IKpyNM2qB6tX1Y57lhawHCImYJHXa2TLP49y+QeqzbtxfOaX9uGpn+HS5csuvV7p2/PDxtcWoo1
	63ZOXaXxWXgFOLcvU6gp9WEQxSk903Hp+y05KMVpWt4tvfSaAPvaeqz2e5JSaq4qGqt6aOwV41dZT
	ASMlCi7Q==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIPWW-00000001Ftq-2PYH
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:21:10 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso8606205b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995666; x=1748600466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=GNffq6gz8t2hQh8Izsp9vNwwrNaakKom+m+XkhJ8oKIzLuvIv6QAeK7qKzX3zdWTqC
         qaszH4QGIAE97Bhbx0B7t7V8Q1nddvBYMMRIfKItBgiU35NjqZms6uB4FSxaQzYKbrNY
         jhfZPOj45ItBKjTPN0NTZkKwwAdSzRI2v5TI5DS4D/lH3nIc/aQh1rKycaoGaqDh2MbA
         sGhmxT7d5pGFbC1v2MhM1VBayQ9RSigjmwfoKBX3ILOQj2+8bGL7dInBlZ6iaEHP35H0
         xegrE3u3jY30XHv5jenGrthsUfpnBUlS2pB+A9YtJ61Rp/+y/Y+CJvQAccSs9HcqbKPh
         vbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995666; x=1748600466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=BuyMoQDbOCpBI9+dLSd1mET2mNFl2LB0M/pcWFgd6+DHQqygvEj1Mk6lx8Jz7glwEt
         voh7FBB7HqJq4uMtV5XH8jAteS6Y12MHytbfddF6L6E6XgqKEkxz+NexVkGA8GC7/G6o
         Dy4HVuUSPJ6j9oKy+6BANQV27iu8IA/zopxrBf70SIn47d+c+e5gqqzb8vBF3xprLX5P
         GAqCPE2PjnD/5k/+mlojDDO4CbgaykQAuwFEOMFqMyGORKC7kQc7TPy7qFDSAVcLhqYT
         BvodCtIlt+/+aB5RIi+MO46uRQ+I6kHAdF5x73hzcoHQ3n2s2HOkFZWFPBmynKdEZRbY
         RsWA==
X-Forwarded-Encrypted: i=1; AJvYcCUuFYTwtAf/uuh2aT+pOGQAuPCLNNa08gTmvNtHE7+/JCWTeqpexjAt8yt6JXWRGwAlEP4rKVooj2B22g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ/TS2BjOD4N4VhclaMHuyTK2CrjmvCSnD2X6hnD6FhhM5Xffa
	On3+uFkhc5VoWzpht3JO/d6oX1Lr7Sjarm/NbB86f0uiSx30ly6iBPPezUCILkRuwGU=
X-Gm-Gg: ASbGncuuL0raIxW3yR4zHmZAQxzde7YVho4wA7T17UDAAwm4cLuAqMAjvjrGwpPYAX3
	cAwAFJwOpSH92ZcLKZXnRXJhhEUDTpam/UsICGLbkwWVEz2GHcz5S8waI4tbiL1O076WvjpPB+z
	64vmWP6VdZS2Edj6HGzir2CaDhLk9mRyfoBlJ8XbR3oi9xTn9v/wTeXcTZF+Fq5c1fxIl0iSnEE
	yUcmHcH29xLfrQpka2jdHp55+MBZlwh1xmkvxSlLRSKokkRoCESR6vB8DWSqumWl3UIaDBcDrQY
	QuFzdsC8MyQX3iiKvtWA8rvi/1KGFtzDWWAcyblJ4ku3xj6D2SRnPYLBQxKqO0M=
X-Google-Smtp-Source: AGHT+IFXhCgkcbKavnE2xTp9i4da6iauW69FEMu71goEiqhGLYMQSQQ3w6lKP9OCGbZDB/3Z0XQGgA==
X-Received: by 2002:a05:6a00:130e:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-745ed847e76mr3749012b3a.3.1747995666204;
        Fri, 23 May 2025 03:21:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:05 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 02/14] riscv: sbi: remove useless parenthesis
Date: Fri, 23 May 2025 12:19:19 +0200
Message-ID: <20250523101932.1594077-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_112108_724186_9509CB37 
X-CRM114-Status: GOOD (  10.37  )
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

QSBmZXcgcGFyZW50aGVzaXMgaW4gY2hlY2sgZm9yIFNCSSB2ZXJzaW9uL2V4dGVuc2lvbiB3ZXJl
IHVzZWxlc3MsCnJlbW92ZSB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCAxOTg5Yjhj
YWRlMWIuLjFkNDRjMzUzMDVhOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKQEAgLTYwOSw3ICs2MDksNyBAQCB2b2lkIF9f
aW5pdCBzYmlfaW5pdCh2b2lkKQogCQl9IGVsc2UgewogCQkJX19zYmlfcmZlbmNlCT0gX19zYmlf
cmZlbmNlX3YwMTsKIAkJfQotCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNp
b24oMCwgMykpICYmCisJCWlmIChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJzaW9uKDAs
IDMpICYmCiAJCSAgICBzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfU1JTVCkpIHsKIAkJCXBy
X2luZm8oIlNCSSBTUlNUIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJCQlwbV9wb3dlcl9vZmYg
PSBzYmlfc3JzdF9wb3dlcl9vZmY7CkBAIC02MTcsOCArNjE3LDggQEAgdm9pZCBfX2luaXQgc2Jp
X2luaXQodm9pZCkKIAkJCXNiaV9zcnN0X3JlYm9vdF9uYi5wcmlvcml0eSA9IDE5MjsKIAkJCXJl
Z2lzdGVyX3Jlc3RhcnRfaGFuZGxlcigmc2JpX3Nyc3RfcmVib290X25iKTsKIAkJfQotCQlpZiAo
KHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkpICYmCi0JCSAgICAoc2Jp
X3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0RCQ04pID4gMCkpIHsKKwkJaWYgKHNiaV9zcGVjX3Zl
cnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkgJiYKKwkJICAgIHNiaV9wcm9iZV9leHRlbnNp
b24oU0JJX0VYVF9EQkNOKSA+IDApIHsKIAkJCXByX2luZm8oIlNCSSBEQkNOIGV4dGVuc2lvbiBk
ZXRlY3RlZFxuIik7CiAJCQlzYmlfZGVidWdfY29uc29sZV9hdmFpbGFibGUgPSB0cnVlOwogCQl9
Ci0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
