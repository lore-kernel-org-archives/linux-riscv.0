Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98CEE77188
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 03:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quxmYlEc5tlO/QFKAHr7WjbGKzV8IG2IC+Hmv8fc83A=; b=PYNhBRua71vZ0R
	srkaJbvqG7BDz2+YSXkMOtpuUvC8cdi5GundB/FEb4a80zeRpODhIrnjvE5Ti1QVClvoSgIc/n/HC
	0nvIaAuhjN5yb4ux81Aqiuf2NUafuqaggUuoe9yexz/BJqT+aoJJQhII+leTkU3nGTvflJoFezmk8
	48qx1UJHPXHXXtzeG66R5PYxXPYRuz+N6Gxc/1QF0E8rPOP+gEAFuQ78TMUDi78PQ6qWT82+YdPkA
	QAhxVFWsH5RN7a7qCB9rVT2osneNvviqCwemg6wWSps5pL9aiKJcFH5nrNsTESN2nxgPS3YI3Wl1p
	pgJ3fQQXis2yW21l2/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPD5q-00000007lf3-1271;
	Sun, 22 Dec 2024 03:57:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPD5o-00000007leU-0So8
	for linux-riscv@lists.infradead.org;
	Sun, 22 Dec 2024 03:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89C0C5C0F72
	for <linux-riscv@lists.infradead.org>; Sun, 22 Dec 2024 03:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4988C4CEE2
	for <linux-riscv@lists.infradead.org>; Sun, 22 Dec 2024 03:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734839842;
	bh=OqMeh4ug34sqs9H4cVt25puF1rwHdgwJu1b+ZEOFTkk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VculYsxYdg41BqrlIxp4QPasDmDuzql8kv9HQoyXMHqqHeLgYyWjWUGoQJBdbMbtw
	 FbPX4URVB0wWRRprrLnNdR6rgs5Gz4SxKojEMfdO5pmnxDfPDJ0q/KWkZ9oUzZInWe
	 CknVV50Pcej46UOE+WyQ9l0Ev4lGlyK+pkr4yQjV0AlW4mR5/0FJ8VRqBKdT6g1GyG
	 12MZdBtJpq3NaKtv+C/kDPxkgjxjiE40IOPWwKNZXsfjmsfzXKuGJmh5KAZm13cH2+
	 pYRUW5A2JzOw24kW+u+wSc37W5cpzeSNdZN9NxszVCAd0IVvA/gvjvSmeDeCYdiETZ
	 lhMdAv0uvUNZg==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso5976152a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 21 Dec 2024 19:57:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8kVAzAnBFlI0GHUJ7gpgyyQNeDYQdGWyGoGqwVc5wBBd6IZVewhFKwkEFhFvSeR97AMjFsGzxIsEwkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7nfGKkodYYVRjdGXpnemPQExaV+L1R6119sl3EGM78ikUS64J
	M9AZZFJxOvKOAtbdxvk0/+V/PcAxV+pOkGZqRgepatJFo7NjTYpTzPD5gdAegpvhjxJ+O/0taAF
	FsnD4yS2epZPC3y/R77FVw0xpHdM=
X-Google-Smtp-Source: AGHT+IHT2fi6X7MKsUcCoHsxWmRqXA+mg76KmP1Gau2uh5/IZs63tVRl5zJk2klCZzTi1vLcN3Tb/6vdQRpFotOWNWE=
X-Received: by 2002:a05:6402:2691:b0:5d0:7282:6f22 with SMTP id
 4fb4d7f45d1cf-5d80245b76fmr10312231a12.14.1734839841428; Sat, 21 Dec 2024
 19:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20241215161322.460832-1-guoren@kernel.org> <36jzgc7cpsvphw32wghpegb7t6ezsgd622bm2ws7syjj6mmah2@pameujabd32c>
In-Reply-To: <36jzgc7cpsvphw32wghpegb7t6ezsgd622bm2ws7syjj6mmah2@pameujabd32c>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 22 Dec 2024 11:57:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS40Em7Yi=fiQ=cMeRNNT+MRZ7tfGqRh=OjTiXMmpBX1w@mail.gmail.com>
Message-ID: <CAJF2gTS40Em7Yi=fiQ=cMeRNNT+MRZ7tfGqRh=OjTiXMmpBX1w@mail.gmail.com>
Subject: Re: [PATCH] riscv: qspinlock: Add virt_spin_lock() support for KVM guests
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com, 
	conor@kernel.org, leobras@redhat.com, alexghiti@rivosinc.com, 
	atishp@rivosinc.com, apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, parri.andrea@gmail.com, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_195724_204941_9A703234 
X-CRM114-Status: GOOD (  13.05  )
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

T24gTW9uLCBEZWMgMTYsIDIwMjQgYXQgNTo0N+KAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjQtMTItMTVUMTE6MTM6MjItMDUwMCwg
Z3VvcmVuQGtlcm5lbC5vcmc6Cj4gPiBBZGQgYSBzdGF0aWMga2V5IGNvbnRyb2xsaW5nIHdoZXRo
ZXIgdmlydF9zcGluX2xvY2soKSBzaG91bGQgYmUKPiA+IGNhbGxlZCBvciBub3QuIFdoZW4gcnVu
bmluZyBvbiBiYXJlIG1ldGFsIHNldCB0aGUgbmV3IGtleSB0bwo+ID4gZmFsc2UuCj4KPiBXb3Vs
ZG4ndCByZS11c2luZyB0aGUgY29tYm8gc3BpbmxvY2sgcXNwaW5sb2NrX2tleSBiZSBiZXR0ZXI/
Cj4KPiA+IFRoZSBWTSBndWVzdHMgc2hvdWxkIGZhbGwgYmFjayB0byBhIFRlc3QtYW5kLVNldCBz
cGlubG9jaywKPiA+IGJlY2F1c2UgZmFpciBsb2NrcyBoYXZlIGhvcnJpYmxlIGxvY2sgJ2hvbGRl
cicgcHJlZW1wdGlvbiBpc3N1ZXMuCj4gPiBUaGUgdmlydF9zcGluX2xvY2tfa2V5IHdvdWxkIHNo
b3J0Y3V0IGZvciB0aGUgcXVldWVkX3NwaW5fbG9ja18tCj4gPiBzbG93cGF0aCgpIGZ1bmN0aW9u
IHRoYXQgYWxsb3cgdmlydF9zcGluX2xvY2sgdG8gaGlqYWNrIGl0Lgo+Cj4gSSB0aGluayB3ZSB3
YW50IHRoZSBwcm9wZXIgcGFyYXZpcnR1YWxpemVkIHNsb3dwYXRoLCBoYXZlIHRoZQo+IGRpc2N1
c3Npb25zIHN0YWxsZWQgb24gdGhlIFNCSSBzaWRlPwoKSGVyZSBpcyB0aGUgdXAtdG8tZGF0ZSBw
YXJhdmlydHVhbGl6ZWQgc2xvd3BhdGggdmVyc2lvbjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvMjAyNDEyMjIwMzM5MTcuMTc1NDQ5NS0xLWd1b3JlbkBrZXJuZWwub3JnLwoK
V2UgY291bGQgY29udGludWUgdGhlIGRpc2N1c3Npb24gb24gdGhlIFNCSSBzcGVjIHNpZGUuCgo+
Cj4gQnR3LiBob3cgYmFkIGFyZSB0aGUgcGVyZm9ybWFuY2UgbnVtYmVycyB3aXRob3V0IHRoaXMg
cGF0Y2g/Cj4KPiBUaGFua3MuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
