Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E324C54F2E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=autD1bTqrBQ5Kyb3McllzMfSC0uIER/z4G4FKxIeqwo=; b=DOjQJEUi43UrNd
	Nxt9NYqm3avmpYjJnFjsonenh7EMQIKVbjW2aU5DKWF0d/nzqIbameBmM1yzThJP8GbHstlYX+8Sf
	irbol2aHS/WOCJqhxugft1/OhPyl5CA5UgyAQwdWxgQ845+w7f21co5A33zPMYPtoBKGABql/GS+N
	rYDBJsM9a6ZQz8ptl1azIDzJv0Ux8xc7+Bird1kCs8cacNyUV6rMut7+nDJe1SWm9ukd1CDSEwLq3
	nfB/yzKcdWH0SNgKZlXdtqOy1lW7KYytkc1OG6jS/C1Kf05dBDc/IKhhA16wIC3NFUGDky2Bllq9B
	VH9jfQVhq/mXN50SyRFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISMA-00000003wL9-2LOR;
	Fri, 23 May 2025 13:22:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIS64-00000003tye-1wqN
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 13:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gFewfZjNIOlnKjbSqghMjET5KPXnaKP3RNtWcft+NNM=; b=FnOH8I/fUXyFI0VWELpkVRVW5i
	ySdS/3Pd+D+3mNO+JbL1s0S1e+E7YTlo2KgBqjJ6ynV5KU582hdGT1eFx4n+mvxSWoznD0zkQzY7w
	RY9ERvAFt5frL9fhIUXTDnCQZgPSduJN0o8pQ9Kks98VteSnuv7ubrgBCxYX3SM11HdUuS0Nelxh/
	Cy2fdyJ5WHgBICObROMqsGtClj+CYIQRn59/Lw4xI7RLNKVI8js93yQ//Z5FTmDjHsl/D2EKzmQtG
	XVEbye2wPkIrjuSwKVsPu7Gor+tkZawn3bq2LPxsISpUD8NvCRchhCNwbpP/X4tKPxTc+mDNBBK+B
	UMnhpGSg==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIS61-00000001KE3-23Oj
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 13:05:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a374754e03so426842f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748005556; x=1748610356; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFewfZjNIOlnKjbSqghMjET5KPXnaKP3RNtWcft+NNM=;
        b=AYhP6MkaRjUrmO5eoupsxR8ljvcXFgDq04KAIgvQYq957OrvoYXz4GLlqSl5wJyJSd
         ZVW/uR+mvNW6WFSphQ/Xc1cq5cQvhYtRpN2COGXNPLDXmM5JjNsCQQEN7oHGm1qD4Rkb
         UbEG4r7IxZZ3sbiTtLk2EpyFlwYQ/ZSvRbxGPrDgKwS5wMLLxg++aGRYSJWVjI/8//j8
         IwYPQAk+j1BFwXppqPb58H3h89l0lLs9jt7WJD1xsoPDYbpIUMw5+09sJ2lqX4WiDvUb
         h39hkrihzeVT4PZ2ZlzKt/Qj8jXXbRfAjdXUO4tEncnAj48iuaeipYrumLJeytpDVW5E
         rB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005556; x=1748610356;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gFewfZjNIOlnKjbSqghMjET5KPXnaKP3RNtWcft+NNM=;
        b=l7Ou1Qkq/jsfvW7Mye1sWJ5qrz6yaemz3zyuKFUErcjLA+u/B2yINX39dTHNs2DuBJ
         z4qnzWHsqT3iV1fXGtrj+ejGX70TuGnrRxaGc1KUZVjMxkp10snxl+ri+PLo8QilIMPg
         gGovLVX3U0c0SsDx/7aAX+YwOJmv3xvyukgcKm/awsoZVTp4R5m/d3Zg6lDGi7Z1Hdkc
         VGsKNv8zzVppGTSHpSipm1dZlkshEwZohpK1cFQJMT6ooUd/iTU/NdonW1ZPobV01qpH
         C0HybdSKk/T2x9P6vTy4BaGwJeZ8Gwexodk97oEwcw//FVyauE/wWvjV8SQOMVqfV146
         SEog==
X-Forwarded-Encrypted: i=1; AJvYcCV5skx4ga+h88vhaJBfSvdgTUMhG46XZtiF7CQ0smWW13TXEkD2tIrz63ufos0hM1ZsWd/mHe3XEZfsHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS7Ombum+xTOMmxvM/VsmznGNY6Seug7PHyUVLcPHtPF70wDQB
	WalriOysxiM2QGSG7GvD6gO6wh50crjNemfDxiA4eOf/r4Rqy2W651pBc+nr29p3BdE=
X-Gm-Gg: ASbGncuGUy8sbZE5o2Gj/j5HzWn6KgIs+9xyb3uhAmxkMuo0E98gT/Di4FhzOvy0NIs
	WHsh3/cJ09E6RBmH9Ss3W8nQOl8+YQqbxclOoiXRlmsoHYlsYbip+lOJ3kKdeEUtEsRADB2qYvc
	SiY96ccYNy2h28U22umCdfha5nyrnb8Si0fr7VhBW9FjqzcOSE0+X7ag+UmNBOPc3Qb/i4MCIbn
	hm5U9duiHGFntk66ply95FO5E7OaqkWKUQFTR+c4xdFDLyGnr3VZWWIHbbEL4OnzQT1Idaw40Jy
	0trhk5zXECXUJABVnH3aekjj4/lKIRurFNKkYS+dkXb1T9Eu8RRJazJfrUs=
X-Google-Smtp-Source: AGHT+IEYIo39joB/0uuiMCLZj0X9kGxap7PQ8MzBUGOeMKLVyBYJHZJSgGJhoZMNlP15r1mU9RPZpQ==
X-Received: by 2002:a05:6000:4285:b0:3a3:5c97:70c with SMTP id ffacd0b85a97d-3a4c2e5707cmr874240f8f.14.1748005555660;
        Fri, 23 May 2025 06:05:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8899bsm26390515f8f.62.2025.05.23.06.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:05:55 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 May 2025 15:05:54 +0200
Message-Id: <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI
 extension
Cc: "Samuel Holland" <samuel.holland@sifive.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Deepak Gupta" <debug@rivosinc.com>, "Charlie
 Jenkins" <charlie@rivosinc.com>, "Atish Patra" <atishp@rivosinc.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Anup Patel" <anup@brainfault.org>, "Atish Patra"
 <atishp@atishpatra.org>, "Shuah Khan" <shuah@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-14-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_140557_727313_5DC7BE12 
X-CRM114-Status: UNSURE (   4.92  )
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

MjAyNS0wNS0yM1QxMjoxOTozMCswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPjoKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPiArc3RhdGlj
IGNvbnN0IGVudW0gc2JpX2Z3ZnRfZmVhdHVyZV90IGt2bV9md2Z0X2RlZmluZWRfZmVhdHVyZXNb
XSA9IHsKPiArCVNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLAo+ICsJU0JJX0ZXRlRfTEFO
RElOR19QQUQsCj4gKwlTQklfRldGVF9TSEFET1dfU1RBQ0ssCj4gKwlTQklfRldGVF9ET1VCTEVf
VFJBUCwKPiArCVNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORywKPiArCVNCSV9GV0ZUX1BPSU5U
RVJfTUFTS0lOR19QTUxFTiwKPiArfTsKCkhvdyB3aWxsIHVzZXJzcGFjZSBjb250cm9sIHdoaWNo
IHN1YnNldCBvZiB0aGVzZSBmZWF0dXJlcyBpcyBhbGxvd2VkIGluCnRoZSBndWVzdD8KCihXZSBj
YW4gcmV1c2UgdGhlIEtWTSBTQkkgZXh0ZW5zaW9uIGludGVyZmFjZSBpZiB3ZSBkb24ndCB3YW50
IHRvIGFkZCBhCiBGV0ZUIHNwZWNpZmljIE9ORV9SRUcuKQoKVGhhbmtzLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
