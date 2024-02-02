Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BC7C48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 15:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTn1SqQLA4okrMJz+6j7J77OUiUqcOEkpJBdrOc0CPM=; b=Od8le6Fq/T24HH
	6zm8wVx6/dDxDTCo1VDiUFR3qI931xWJYRFcbZf25hEkEMEXGWXkY1ft2FxccBSC7tXPoZfMoCxW6
	4KELP3rA3Btv6jMi5JGz9rXI7Wn6PZwe/wvm0HOvfCTRvrvS1L4uDdD1zvhGDPI8CWa7P3JU5rdb3
	q/m9pl06rE0jHQBKurJP8j1Dv9KrCaoOgUDbgSHmcoAr4kES7sqwAOxIpPm8RocGAGqDxQsaUc9Ry
	IJJmCViyql+AO3DIq+OwQ0iqGpnttgFafG6hv5AYr9yHQk4w8aKHrJ1hdRENmjYeSlrl9gaftXoas
	iilS1TWnAcS1AFDKXKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVvgO-0000000C4Y5-35XR;
	Fri, 02 Feb 2024 15:42:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVvgL-0000000C4WN-3jbK
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 15:42:23 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a350bfcc621so275184066b.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 07:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706888540; x=1707493340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kogXmKbjRAlSmOtOOnfMNwgduTqXGjDmhtreItP19dw=;
        b=iRSudiq9OTdJVXkPv88QFpf71TS47uEtlKsJ3shDaPlMkf9Taf0SuV7Eb4yP7IbanH
         ls0xwYzc8f3t75jtLHnnzyD2UQ1zG6oiAur0Ymi09mTrawN1rcmipM5+C6O7Z3dIx2dH
         Hdx34fFAZRa7DP3/KpTBw15gqFxGKnnKg8gnsT1fi9xaFLQ9RFnLImtShgTLwk6qKdTc
         NMw70gB8tFF+MhEZPQw9ftg9BwqIWZ9okSU0z1ypU2lFoPOVhFA5aXbxf/DwzePxV2rC
         k1+SSArrH/wroUzB7TPqoc66naaM0Qf8UJ9o1ouK02reAv6DIdJ+d/SLuDjpYN3DdFf/
         N0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888540; x=1707493340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kogXmKbjRAlSmOtOOnfMNwgduTqXGjDmhtreItP19dw=;
        b=vq/TIybaXbCsHZmeYn7ODl9p/UoK1/ZUeIA7tkXWODsgnxi4yeqHUuhsKOPSYcaTMN
         koH0kDGz/xLyKppuPMcPVrTaod+bXeweiJHLPnnyfoXsrt9evCO97HdjC++Esjk69MZC
         UirFSiam0FI7Zk1wwK/2I3QRkmwAgqcfNsOet0454kT4LsTWwur2DsNzfFr51lSgx3/V
         YZ9aQ8DeGSqSDNHgQS8OZhPNiYiNLYSeXeTTHC5EQSyGSUIhpfFhNpyVA5G6EYy5/QHW
         NxUi1xzz9lGPfXT2j3q35TwGYvVplrOiM3f4pMuNP/3qizfYDxZw4QJqCwe87pEdwJUg
         eesQ==
X-Gm-Message-State: AOJu0YzDQeTwWGAOUoja+J6AWvfV/MJeXgM7I27Z0Aw7ez1FpAXfpkZ5
	lL81/qYU3626hQPX5MzT9cEMgZEWFOtSCqo4BN/iK4CSMif4YN1TONW+T4vKtOnS3Qez4LlfZ+D
	y6HrfsDHp7mZWcOOlgP4h4A+6o3t+2Cfl1YpDOg==
X-Google-Smtp-Source: AGHT+IH/zecNEC28nmVGlGmSbLynz6gk5o5sKPfDBpuJdaR6b+rS66s9/R0EOFKWMVOPLIAlSXsBwV7AsTvhcGsm6n0=
X-Received: by 2002:a17:906:538f:b0:a31:8ca6:dbb0 with SMTP id
 g15-20020a170906538f00b00a318ca6dbb0mr1676412ejo.16.1706888540289; Fri, 02
 Feb 2024 07:42:20 -0800 (PST)
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-5-alexghiti@rivosinc.com> <Zbuy1E7mz9Oui1Dl@andrea>
In-Reply-To: <Zbuy1E7mz9Oui1Dl@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 2 Feb 2024 16:42:09 +0100
Message-ID: <CAHVXubgw0PEZMhFmjA0cAFQ2+_JOYjVfk41qRC9TFdSJtej++w@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive sfence.vma
 for new userspace mappings with Svvptc
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>, Dylan Jhong <dylan@andestech.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_074222_200633_4BE77B6E 
X-CRM114-Status: GOOD (  15.93  )
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

SGkgQW5kcmVhLAoKT24gVGh1LCBGZWIgMSwgMjAyNCBhdCA0OjAz4oCvUE0gQW5kcmVhIFBhcnJp
IDxwYXJyaS5hbmRyZWFAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSmFuIDMxLCAyMDI0
IGF0IDA0OjU5OjI5UE0gKzAxMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IFRoZSBwcmV2
ZW50aXZlIHNmZW5jZS52bWEgd2VyZSBlbWl0dGVkIGJlY2F1c2UgbmV3IG1hcHBpbmdzIG11c3Qg
YmUgbWFkZQo+ID4gdmlzaWJsZSB0byB0aGUgcGFnZSB0YWJsZSB3YWxrZXIgYnV0IFN2dnB0YyBn
dWFyYW50ZWVzIHRoYXQgeFJFVCBhY3QgYXMKPiA+IGEgZmVuY2UsIHNvIG5vIG5lZWQgdG8gc2Zl
bmNlLnZtYSBmb3IgdGhlIHVhcmNocyB0aGF0IGltcGxlbWVudCB0aGlzCj4gPiBleHRlbnNpb24u
Cj4KPiBBRkFJVSwgeW91ciBmaXJzdCBzdWJtaXNzaW9uIHNob3dzIHRoYXQgeW91IGRvbid0IG5l
ZWQgdGhhdCB4UkVUIHByb3BlcnR5Lgo+IFNpbWlsYXJseSBmb3Igb3RoZXIgYXJjaHMuICBXaGF0
IHdhcyByYXRpb25hbGUgYmVoaW5kIHRoaXMgU3Z2cHRjIGNoYW5nZT8KCkFjdHVhbGx5LCB0aGUg
QVJDIGhhcyBqdXN0IGNoYW5nZWQgaXRzIG1pbmQgYW5kIHJlbW92ZWQgdGhpcyBuZXcKYmVoYXZp
b3VyIGZyb20gdGhlIFN2dnB0YyBleHRlbnNpb24sIHNvIHdlIHdpbGwgdGFrZSBzb21lIGdyYXR1
aXRvdXMKcGFnZSBmYXVsdHMgKGJ1dCB0aGF0IHNob3VsZCBiZSBvdXRsaW5lcnMpLCB3aGljaCBt
YWtlcyByaXNjdiBzaW1pbGFyCnRvIHg4NiBhbmQgYXJtNjQuCgo+Cj4KPiA+IFRoaXMgYWxsb3dz
IHRvIGRyYXN0aWNhbGx5IHJlZHVjZSB0aGUgbnVtYmVyIG9mIHNmZW5jZS52bWEgZW1pdHRlZDoK
PiA+Cj4gPiAqIFVidW50dSBib290IHRvIGxvZ2luOgo+ID4gQmVmb3JlOiB+NjMwayBzZmVuY2Uu
dm1hCj4gPiBBZnRlcjogIH4yMDBrIHNmZW5jZS52bWEKPiA+Cj4gPiAqIGx0cCAtIG1tYXBzdHJl
c3MwMQo+ID4gQmVmb3JlOiB+NDVrCj4gPiBBZnRlcjogIH42LjNrCj4gPgo+ID4gKiBsbWJlbmNo
IC0gbGF0X3BhZ2VmYXVsdAo+ID4gQmVmb3JlOiB+NjY1awo+ID4gQWZ0ZXI6ICAgODMyICghKQo+
ID4KPiA+ICogbG1iZW5jaCAtIGxhdF9tbWFwCj4gPiBCZWZvcmU6IH41NDZrCj4gPiBBZnRlcjog
ICA3MTggKCEpCj4KPiBUaGlzIFN2dnB0YyBzZWVtcyB0byBtb3ZlL2FkZCB0aGUgImJ1cmRlbiIg
b2YgdGhlIHN5bmNocm9uaXphdGlvbiB0byB4UkVUOgo+IFBlcmhhcHMgaW50ZWdyYXRlIHRoZSBh
Ym92ZSBjb3VudHMgdy8gdGhlIHBlcmYgZ2FpbnMgaW4gdGhlIGNvdmVyIGxldHRlcj8KClllcywg
SSdsbCBjb3B5IHRoYXQgdG8gdGhlIGNvdmVyIGxldHRlci4KClRoYW5rcyBmb3IgeW91ciBpbnRl
cmVzdCEKCkFsZXgKCj4KPiAgIEFuZHJlYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
