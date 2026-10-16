Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0919CC6B2D
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 04:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEPE9vmSMC7ob1CCjEFoBe2g5mdWYgX79Cue0s5R6Ks=; b=p1x16TuwIEhqk4
	3zT4KpTYb+nvEQHH2e63LLk7FAsLG7gbQIamCgoCCOTKFFVvLmWT5JxBVrUEyYqLsMnIwBladUKg6
	x/iMScBgRQa81hS1/QxQWMu02B2NzUr6GPpGX9iCnyv3UzkkquQSUVgIVEkjdImj1m/8OYxVhvkAZ
	h/1h9kW+2Is/pNqy/xhXFP+KMVx5w16nGJvW/fCZjRhR0Iwc3nNbq4xoMdOwEfMNw35fdsE7VHrnG
	oCONrVpwOof9WgyVUzpchb6nvj8ed2BBpT6wCunbQfM3/G6eKWiKvhfYjKyvaeCCWvKRfEYkP7p/9
	lVWnIugEfu/aKvnRGerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZZE-00000001xyg-2M59;
	Fri, 16 Oct 2026 04:29:16 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZZC-00000001xxn-1lZ4
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 04:29:15 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2893880eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 21:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124954; x=1792729754; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DiDooSTm8OioMl2T/zFhD+a3mabSdEoM10ACbYCfIxo=;
        b=q1bJjnfgEW8CWX+32c4BYiRWgnB2zrum7wLeeIFFY5YnEmwLbzuIJtHepD9cDSggro
         SrESKrpcENRn9au/3lExP5AKR9snYJobNSK+A878lIcLP78nmH1bLCi5KeKGcvzC5nEn
         8fVa2MxQWg2EQ9zdARv8ourjG9a+FhdQ9hea3ODAqLVd6I2pN5Y2QE3AKzT/eWyVz6om
         bLBbrCvBkfXEGl72+sDPa8FsBHkh0klovft33LMDa3F/s7UjW2K4KZksO7jSEKh4d2d2
         OZa0GLhHcR4fk3dgn30t0gSHGh86qQh0dFrNKQjVoNjM0QZ9V1TknbpwwjWDLI0ZuQCi
         hEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124954; x=1792729754;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiDooSTm8OioMl2T/zFhD+a3mabSdEoM10ACbYCfIxo=;
        b=ftAxMKmo3BZcEj+D9q1nNf4IBMv418ozdviHK9wXuwUGUtvUeZsedGhBNlvZQpxut+
         qYh9DaMnP7kXz2SjpR+TZTdkqI0MmWqVjmDLXHgCMCi1DRE8ds8AZRo3rUFdg4w9DCMJ
         /JEhC1Fayal1zVtQOq9MZhOjdxxPrNHum1ShZ3mCORg3p4HdGCyHYfMHei2ZvAIsRxmu
         kUC7k0kEC2lbwdZrvN7MZUoe4SeZHUiHliX0PScjtcZ9yduBq7Z5aOMuDJAWh/W13Wn4
         vikYJ62QjKZJ7FOEUTXJiSVZlBi0+b0fXwNyKTWOAWLRDQtzNfsZtqmAsSHNfnmle3Om
         dRsg==
X-Gm-Message-State: AFq9FYKYclWJ320iGegG41lPCdx6fAvmcT1cqDxxZk8YnRcr/Fmxw8Yu
	KUH6THqwETbp+O2P8epllm95hDkRGyAf8DfU3Qdu5542hpBpLDMKGXbR
X-Gm-Gg: AYBFou1+uZHdANTCpl7Vz8tx2/4a8g4198CJRUmLgrJ5l1P7gM3gOwmZB80eS7pSOse
	sgdcDdiRnvI2pWMwvYZdnf4oIJam7hxCK2KT9wbr7m/dAtORKJATwnNO9fi9u5UcFA+nRhGAsrf
	wRxAJRIlhd+/DshZVGeQmE46As9VU3teZIr5Ma54CObh6A15ziGU18yjsGmd04JbNC1WCp5AFhJ
	sqV5bDCTPGnwsvhpREN7dqcq15viuYJGQVpcTAaYF1KQcr4VGj/DhtgLvX71NQNBVr9E9p0BJrJ
	Euv1N1+BUqfeJINiG20HnGzzOQWsz2Cdpp6fRPqrhp4OV8OA6hLhW3b2VYDu3mkY2egiBkIN+0d
	9wn0+xxeNsurVHUuRo/TXymALaNxPAlvZtVVN+8zRq/KRPRNakHc+L88fQm0JRmEykjy30o+3wp
	OpJ0AFKrNt/Qh8kFNBmyMtv385IYYXpQUtbQSbry6oDkrRz+5y3neCvVL/at6xrLWZ2h0856Lf/
	Fn6SzUs7UqIE2ltNzWXJmFXVVeKeTC34K+/+q9doJomIsA=
X-Received: by 2002:a05:7300:4628:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-3537e2773e4mr27572756eec.40.1792124953668;
        Thu, 15 Oct 2026 21:29:13 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2712719eec.13.2026.10.15.21.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:29:12 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH 4/6] riscv: hwprobe: Report Supm only when available
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>, 
 Zong Li <zong.li@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
In-Reply-To: <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 21:28:41 -0700
Message-Id: <179212492177.1746949.5548277129502528505.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792124948; l=611;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=FkveoDd4h8xZlCyR30ZgA4Ehce+KUcHPRVHzRy0W3u0=;
 b=A7ktdki57MVv5NvdhO0O1ZwjArT94ExhfZVHn6CckgZsbchgD0PM3g7c68sJKIV7aSE9Msj7o
 JvA6zr8bSyyACJFbAza2Gep5KftbSRTbu3O87n8iPaWU6MCCOysJXwu
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_212914_494432_A4E082C5 
X-CRM114-Status: UNSURE (   7.97  )
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

T24gVHVlLCAwNiBPY3QgMjAyNiAwOTo1MzowMSArMDIwMCwgUmFkaW0gS3LEjW3DocWZIDxyYWRp
bS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gVGhlIFJJU0MtViBJU0EgZGVmaW5l
cyBTdXBtIGFzCj4gCj4gICAiQW4gZXh0ZW5zaW9uIHRoYXQgaW5kaWNhdGVzIHRoYXQgdGhlcmUg
aXMgcG9pbnRlci1tYXNraW5nIHN1cHBvcnQKPiAgIGF2YWlsYWJsZSBpbiB1c2VyIG1vZGUsIHdp
dGggc29tZSBmYWNpbGl0eSBwcm92aWRlZCBpbiB0aGUgYXBwbGljYXRpb24KPiAgIGV4ZWN1dGlv
biBlbnZpcm9ubWVudCB0byBjb250cm9sIHBvaW50ZXIgbWFza2luZy4iCj4gCj4gT3VyIGZhY2ls
aXR5IGFsd2F5cyByZXR1cm5zIC1FSU5WQUwgdW5sZXNzIFN1cG0gc3VwcG9ydCBpcyBjb25maWd1
cmVkLAo+IHRoZSBwb2ludGVyIG1hc2tpbmcgSVNBIGV4dGVuc2lvbiBpcyBnbG9iYWxseSBwcmVz
ZW50LCBhbmQgdGhlIHVzZXItbW9kZQo+IGlzIHJ1bm5pbmcgaW4gNjQtYml0IG1vZGUuCj4gCj4g
Wy4uLl0KClJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdt
YWlsLmNvbT4KCi0tIAotIENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
