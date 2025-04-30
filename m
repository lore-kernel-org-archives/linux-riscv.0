Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29577C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOnrCI+areaL4/pZh80bmY/zRfopTd9q6w/kXe9T148=; b=SZqMwVxPJrP3QU
	VXWWVx9S4E539JArrYZ8fDUvID9Iqelc2DdefXzywIEffGls/Z4dna79E6672hEMm3FmeIeukCeKW
	NKtL+i+jd0uI+sF1ZnwccY0XV9K2EG3MeAez/y0P1V7RHCo8y9a2vVkEWgPHVcGyGTcw9f7cEVLTJ
	dT59iUFnf3VsIqeZDBohAhMXu36IiGOXUzPeO/6CcxnB3R9QCav9X0htosvDPjwis6uGFC+HxrnF4
	CRjfHJxrsyX/Dm7dUOh0eLIzDh+WWLySoxEVi/UiJS86dvMpRw6+zxKIvBgPRvLsbMxqwuQ/kwrbk
	/LcWb4vmJmGMXUlIV0sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8ct-0000000D9mD-1MiT;
	Wed, 30 Apr 2025 14:41:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8aS-0000000D97h-3Eua
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 14:39:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso5410705e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746023938; x=1746628738; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhYYOz5NlOOegoPQI5hpXU14NXhJBnlFgf+RsnopOZI=;
        b=RgmDqhRbz55w3QxYHcgI6jY4RJmXVMb+tWIndjpr4CNUMU0YuhSb5HTAK6brTsiDHg
         xEa0V8x2uit3tSjdiE51ez6jTAFWOIXsMkB4xNWjWMj5adnm9WSWts+UXyhNyMX8sGyT
         wvGf1yKnNL+ZVdTWtpdJJi5+wte9XcpXymKCXcTh9/t8NJAIWg7FbwSEpipcCFrqr8wh
         4sMM+C+FS5dMKR4rnAGyH1QMY902e9jBjICCBRiPctEtEgp/7U5i3ZOnGKhraFSVuxb8
         OhZ2Cr9N2OFmtS06gOf2K3b1s3XhI+J1qXQtV9t4kVB0Oxy9DUy9XohwjqZjmcMopsJt
         vRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746023938; x=1746628738;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhYYOz5NlOOegoPQI5hpXU14NXhJBnlFgf+RsnopOZI=;
        b=o6KwWdC1ThJjo8q09Th/SRKBkTpUCeFMVXYkRmMvbESX9cyOk6Yq3QmqXujD/JovZJ
         EFeF4gmfcxUfGDnxs/+0g8oW++oUQz6J5wPUaP5jXtfXBh8Su/dmoitztzvzrseFkRQe
         lflmT5xSUKeJBrMkDj9cTaD0pFB5thsxQAG6qJuuBZDR1taC8kK3rZQ3v86vGhffUrWw
         gUTxMWvwxiDJwM2rO3KYnsjsyD45x2EfWKR/A962CgdXupSgRsgKsSI1+xpoaSKhQza5
         FEq+pOaLrPDaK6LUfRC2A8FzX6HvFJoxgOU8MkC6KIQXwWJO/EC8qNowxjCrFO8T0Eme
         3H6A==
X-Forwarded-Encrypted: i=1; AJvYcCWlgpdAEFFeCVnttI/JFZ/t7n+n0zTeoHndrJ/d2kyukp2JFCcHyrdkWIkk7Ap6dzfQg5JFAbQxb05ITw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzP51rgfGzMbvYjNomh7UGPAETqeyh7pRZo766Xk2mTi4Xgm0x/
	KOfuEDiUzO2CXFCPdRGuTLNTlJaXgb3w8L+pcEw4Bi5VNxDD8pa2grYRzuF+VQM=
X-Gm-Gg: ASbGncvyBxUQz5Dgi4iGk1nntBJduJccdBuLRBYM2gKRlHbsQIu7H2OkPtkqGACv8vI
	tESi4hwI1lSuePSTTFoLbhRe6IGosqJQaSBazzg4++uGP9ySpbQpt0Y9ubKmQqMKZYYPxJUmGaP
	Kbspp5SX6MwF9aZYtOPM0zcu1zewfSSSLEc+bFxSADJGj0/ED/qHba39urLO8eTWx6iC8sVOCFG
	jx2j+Tkno82xgCs78K+jHoSpZiIbB4XDVXIr5BKG6EekjAaFfET5G0QUoN5PUuY5BYQvUzKvNec
	dIf0kMu9SQBg1u3Bwcg7tgnHQQsmpfVQyVJn9CQOir5htPICEz6hGnsgsAuwKxOtoZ+XciXb5VJ
	t
X-Google-Smtp-Source: AGHT+IEI4GADqeHdXAfmffYECZ9pL6Wjw9iSIa7PRhjYESKXYcU7d8boy1B3uio5ziNSls3PXGMoQg==
X-Received: by 2002:a05:6000:2c8:b0:3a0:782f:9848 with SMTP id ffacd0b85a97d-3a08ff6e786mr1015889f8f.4.1746023938369;
        Wed, 30 Apr 2025 07:38:58 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5473sm17383962f8f.31.2025.04.30.07.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:38:58 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 30 Apr 2025 16:38:57 +0200
Message-Id: <D9K1TVIG544A.DAEZQAFBUDB4@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: "Anup Patel" <apatel@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>, "Mayuresh
 Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
 <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
 <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
 <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com>
 <CAAhSdy0B-pF-jHmTXNYE7NXwdCWJepDtGR__S+P4MhZ1bfUERQ@mail.gmail.com>
 <CAAhSdy20pq3KvbCeST=h+O5PWfs2E4uXpX9BbbzE7GJzn+pzkA@mail.gmail.com>
 <D9JTZ6HH00KY.1B1SKH1Z0UI1S@ventanamicro.com>
 <CAAhSdy0TfpWQ-kC_gUUCU0oC5dR45A1v9q84H2Tj9A8kdO0d1A@mail.gmail.com>
 <D9JY52BJEFX2.2S5XL9NOOGBS7@ventanamicro.com>
 <CAAhSdy1xCRocu2uNri4iDm+NQd+VE8JRVeASfYJ8Qspr5aEz8g@mail.gmail.com>
In-Reply-To: <CAAhSdy1xCRocu2uNri4iDm+NQd+VE8JRVeASfYJ8Qspr5aEz8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_073900_818215_ED946781 
X-CRM114-Status: UNSURE (   8.61  )
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

MjAyNS0wNC0zMFQxODozMjozMSswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgNToxNeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8
cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4gV2UgY2FuIHJlLXVzZSBLVk1fU0VU
X01QX1NUQVRFIGFuZCBhZGQgYSBLVk0gY2FwYWJpbGl0eS4KPj4gVXNlcnNwYWNlIHdpbGwgb3B0
LWluIHRvIHJlc2V0IHRoZSBWQ1BVIHRocm91Z2ggdGhlIGV4aXN0aW5nIElPQ1RMLgo+Pgo+PiBU
aGlzIGRlc2lnbiB3aWxsIGFsc28gYWxsb3cgdXNlcnNwYWNlIHRvIHRyaWdnZXIgYSBWQ1BVIHJl
c2V0IHdpdGhvdXQKPj4gdGVhcmluZyBkb3duIHRoZSB3aG9sZSBWTS4KPgo+IE9rYXksIGxldHMg
Z28gYWhlYWQgd2l0aCBhIEtWTSBjYXBhYmlsaXR5IHdoaWNoIHVzZXIgc3BhY2UgY2FuIG9wdC1p
bgo+IGZvciBLVk1fU0VUX01QX1NUQVRFIGlvY3RsKCkuCj4KPiBLZWVwIGluIG1pbmQgdGhhdCBh
dCBydW50aW1lIEd1ZXN0IGNhbiBzdGlsbCBkbyBDUFUgaG90cGx1ZyB1c2luZyBTQkkKPiBIU00g
c3RhcnQvc3RvcCBhbmQgZG8gc3lzdGVtIHN1c3BlbmQgdXNpbmcgU0JJIFNVU1Agc28gd2Ugc2hv
dWxkCj4gY29udGludWUgdG8gaGF2ZSBWQ1BVIHJlc2V0IHJlcXVlc3RzIGZvciBib3RoIHRoZXNl
IFNCSSBleHRlbnNpb25zLgoKV2lsbCBkbywgdGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
